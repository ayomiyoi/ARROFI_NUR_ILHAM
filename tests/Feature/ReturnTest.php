<?php

use App\Models\ActivityLog;
use App\Models\Category;
use App\Models\Console;
use App\Models\ReturnItems;
use App\Models\Transaction;
use App\Models\User;
use Database\Seeders\RoleSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

beforeEach(function () {
    $this->seed(RoleSeeder::class);
    $this->seed(UserSeeder::class);

    $this->pengguna = User::where('email', 'arrofiryanto@gmail.com')->firstOrFail();
    $this->petugas = User::where('email', 'andi@example.test')->firstOrFail();
    $this->admin = User::where('email', 'budi@gamevault.test')->firstOrFail();

    $kategori = Category::factory()->create();
    $this->objek = Console::factory()->create([
        'category_id' => $kategori->id,
        'name' => 'PlayStation 5',
        'price_per_day' => 50000,
        'deposit' => 500000,
        'stock' => 0,
        'status' => 'rented',
        'condition' => 'good',
    ]);
});

function transaksiDipinjam(User $pengguna, Console $objek, array $ubah = []): Transaction
{
    return Transaction::factory()->create(array_merge([
        'user_id' => $pengguna->id,
        'console_id' => $objek->id,
        'status' => 'borrowed',
        'rental_date' => now()->subDays(3)->toDateString(),
        'return_date' => now()->toDateString(),
    ], $ubah));
}

function dataPengembalian(array $ubah = []): array
{
    return array_merge([
        'return_date' => now()->toDateString(),
        'condition' => 'good',
        'fine' => 0,
        'notes' => 'Dikembalikan lengkap',
    ], $ubah);
}

test('pengguna tidak boleh mengakses menu pengembalian', function () {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek);

    $this->actingAs($this->pengguna)->get(route('pengembalian.index'))->assertForbidden();
    $this->actingAs($this->pengguna)->get(route('pengembalian.create', $transaction))->assertForbidden();
    $this->actingAs($this->pengguna)->post(route('pengembalian.store', $transaction), dataPengembalian())->assertForbidden();
});

test('petugas dan admin dapat melihat daftar pengembalian', function (string $email) {
    transaksiDipinjam($this->pengguna, $this->objek, ['rental_code' => 'GV-DIPINJAM-001']);

    $this->actingAs(User::where('email', $email)->firstOrFail())
        ->get(route('pengembalian.index'))
        ->assertOk()
        ->assertSee('Pengembalian Objek')
        ->assertSee('GV-DIPINJAM-001')
        ->assertSee('Kembalikan');
})->with([
    'petugas' => ['andi@example.test'],
    'admin' => ['budi@gamevault.test'],
]);

test('daftar pengembalian dapat difilter berdasarkan status', function () {
    transaksiDipinjam($this->pengguna, $this->objek, ['rental_code' => 'GV-DIPINJAM-001']);
    transaksiDipinjam($this->pengguna, $this->objek, ['rental_code' => 'GV-SELESAI-001', 'status' => 'returned']);

    $this->actingAs($this->petugas)
        ->get(route('pengembalian.index'))
        ->assertSee('GV-DIPINJAM-001')
        ->assertDontSee('GV-SELESAI-001');

    $this->actingAs($this->petugas)
        ->get(route('pengembalian.index', ['status' => 'returned']))
        ->assertSee('GV-SELESAI-001')
        ->assertDontSee('GV-DIPINJAM-001');
});

test('pengembalian tepat waktu tercatat dan stok bertambah', function () {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->post(route('pengembalian.store', $transaction), dataPengembalian())
        ->assertRedirect(route('pengembalian.index'))
        ->assertSessionHas('success');

    $transaction->refresh();

    expect($transaction->status)->toBe('returned')
        ->and((float) $transaction->fine)->toBe(0.0)
        ->and($this->objek->refresh()->stock)->toBe(1)
        ->and($this->objek->status)->toBe('available');

    $retur = ReturnItems::where('transaction_id', $transaction->id)->firstOrFail();

    expect($retur->condition)->toBe('good')
        ->and($retur->notes)->toBe('Dikembalikan lengkap')
        ->and($retur->return_date->toDateString())->toBe(now()->toDateString());

    expect(ActivityLog::where('action', 'return')->where('subject_id', $transaction->id)->exists())->toBeTrue();
});

test('pengembalian terlambat berstatus late dan denda tersimpan', function () {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek, [
        'return_date' => now()->subDays(2)->toDateString(),
    ]);

    $this->actingAs($this->petugas)
        ->post(route('pengembalian.store', $transaction), dataPengembalian(['fine' => 50000]))
        ->assertSessionHas('success');

    expect($transaction->refresh()->status)->toBe('late')
        ->and((float) $transaction->fine)->toBe(50000.0);

    expect((float) ReturnItems::firstOrFail()->fine)->toBe(50000.0);

    expect(ActivityLog::where('action', 'return')->where('description', 'like', '%terlambat 2 hari%')->exists())->toBeTrue();
});

test('kondisi rusak berat membuat objek masuk perawatan', function () {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->post(route('pengembalian.store', $transaction), dataPengembalian(['condition' => 'broken', 'fine' => 500000]))
        ->assertSessionHas('success');

    $this->objek->refresh();

    expect($this->objek->condition)->toBe('broken')
        ->and($this->objek->status)->toBe('maintenance')
        ->and($this->objek->stock)->toBe(1);
});

test('kondisi perlu perbaikan tetap mengembalikan stok tanpa mengaktifkan objek', function () {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->post(route('pengembalian.store', $transaction), dataPengembalian(['condition' => 'needs_repair']))
        ->assertSessionHas('success');

    $this->objek->refresh();

    expect($this->objek->condition)->toBe('needs_repair')
        ->and($this->objek->status)->toBe('maintenance')
        ->and($this->objek->stock)->toBe(1);
});

test('validasi form pengembalian', function (array $ubah, string $error) {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->from(route('pengembalian.create', $transaction))
        ->post(route('pengembalian.store', $transaction), dataPengembalian($ubah))
        ->assertRedirect(route('pengembalian.create', $transaction))
        ->assertSessionHasErrors($error);

    expect(ReturnItems::count())->toBe(0);
})->with([
    'tanggal kosong' => [['return_date' => ''], 'return_date'],
    'tanggal sebelum pinjam' => [['return_date' => now()->subDays(10)->toDateString()], 'return_date'],
    'kondisi kosong' => [['condition' => ''], 'condition'],
    'kondisi tidak dikenal' => [['condition' => 'rusak parah'], 'condition'],
    'denda kosong' => [['fine' => ''], 'fine'],
    'denda negatif' => [['fine' => -1000], 'fine'],
]);

test('peminjaman yang belum diserahkan tidak bisa dikembalikan', function (string $status) {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek, ['status' => $status]);

    $this->actingAs($this->petugas)
        ->get(route('pengembalian.create', $transaction))
        ->assertRedirect(route('pengembalian.index'))
        ->assertSessionHas('error');

    $this->actingAs($this->petugas)
        ->post(route('pengembalian.store', $transaction), dataPengembalian())
        ->assertRedirect(route('pengembalian.index'))
        ->assertSessionHas('error');

    expect(ReturnItems::count())->toBe(0)
        ->and($transaction->refresh()->status)->toBe($status);
})->with(['pending', 'approved', 'cancelled']);

test('peminjaman yang sudah dikembalikan tidak bisa dikembalikan dua kali', function () {
    $transaction = transaksiDipinjam($this->pengguna, $this->objek, ['status' => 'returned']);
    ReturnItems::create([
        'transaction_id' => $transaction->id,
        'return_date' => now()->toDateString(),
        'condition' => 'good',
        'fine' => 0,
    ]);

    $this->actingAs($this->petugas)
        ->post(route('pengembalian.store', $transaction), dataPengembalian())
        ->assertRedirect(route('pengembalian.index'))
        ->assertSessionHas('error');

    expect(ReturnItems::count())->toBe(1);
});
