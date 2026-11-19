<?php

use App\Models\ActivityLog;
use App\Models\Category;
use App\Models\Console;
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

    $this->kategori = Category::factory()->create(['name' => 'Konsol Modern']);
    $this->objek = Console::factory()->create([
        'category_id' => $this->kategori->id,
        'name' => 'PlayStation 5',
        'price_per_day' => 50000,
        'deposit' => 500000,
        'stock' => 2,
    ]);
});

function dataPengajuan(Console $objek, array $ubah = []): array
{
    return array_merge([
        'console_id' => $objek->id,
        'rental_date' => now()->toDateString(),
        'return_date' => now()->addDays(2)->toDateString(),
        'identification' => 'KTP 320123456789',
        'notes' => 'Tolong disiapkan',
    ], $ubah);
}

test('pengguna melihat hanya pengajuan miliknya', function () {
    Transaction::factory()->create(['user_id' => $this->pengguna->id, 'console_id' => $this->objek->id, 'rental_code' => 'GV-MILIK-SAYA']);
    Transaction::factory()->create(['user_id' => $this->petugas->id, 'console_id' => $this->objek->id, 'rental_code' => 'GV-ORANG-LAIN']);

    $this->actingAs($this->pengguna)
        ->get(route('transactions.index'))
        ->assertOk()
        ->assertSee('Pengajuan Saya')
        ->assertSee('GV-MILIK-SAYA')
        ->assertDontSee('GV-ORANG-LAIN');
});

test('petugas dan admin tidak boleh membuka halaman pengajuan', function (string $email) {
    $user = User::where('email', $email)->firstOrFail();

    $this->actingAs($user)->get(route('transactions.index'))->assertForbidden();
    $this->actingAs($user)->get(route('transactions.create'))->assertForbidden();
    $this->actingAs($user)->post(route('transactions.store'), dataPengajuan($this->objek))->assertForbidden();
})->with([
    'petugas' => ['andi@example.test'],
    'admin' => ['budi@gamevault.test'],
]);

test('pengguna dapat mengajukan peminjaman', function () {
    $this->actingAs($this->pengguna)
        ->post(route('transactions.store'), dataPengajuan($this->objek))
        ->assertRedirect(route('transactions.index'))
        ->assertSessionHas('success', 'Pengajuan peminjaman berhasil dikirim.');

    $transaction = Transaction::firstOrFail();

    expect($transaction->user_id)->toBe($this->pengguna->id)
        ->and($transaction->console_id)->toBe($this->objek->id)
        ->and($transaction->status)->toBe('pending')
        ->and($transaction->rental_type)->toBe('daily')
        ->and($transaction->total_days)->toBe(2)
        ->and((float) $transaction->total_price)->toBe(100000.0)
        ->and((float) $transaction->deposit)->toBe(500000.0)
        ->and($transaction->identification)->toBe('KTP 320123456789')
        ->and($transaction->approved_by)->toBeNull();

    expect($transaction->rental_code)->toStartWith('GV-'.date('Ymd').'-');

    expect(ActivityLog::where('action', 'create')->where('subject_type', Transaction::class)->where('subject_id', $transaction->id)->exists())->toBeTrue();
});

test('kode peminjaman berurutan setiap hari', function () {
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objek->id,
        'rental_code' => 'GV-'.date('Ymd').'-0001',
    ]);

    $this->actingAs($this->pengguna)->post(route('transactions.store'), dataPengajuan($this->objek));

    expect(Transaction::where('rental_code', 'GV-'.date('Ymd').'-0002')->exists())->toBeTrue();
});

test('validasi pengajuan peminjaman', function (array $ubah, string $error) {
    $this->actingAs($this->pengguna)
        ->from(route('transactions.create'))
        ->post(route('transactions.store'), dataPengajuan($this->objek, $ubah))
        ->assertRedirect(route('transactions.create'))
        ->assertSessionHasErrors($error);
})->with([
    'objek kosong' => [['console_id' => ''], 'console_id'],
    'objek tidak ada' => [['console_id' => 9999], 'console_id'],
    'tanggal pinjam kosong' => [['rental_date' => ''], 'rental_date'],
    'tanggal pinjam sudah lewat' => [['rental_date' => now()->subDay()->toDateString()], 'rental_date'],
    'tanggal kembali sebelum pinjam' => [['return_date' => now()->subDay()->toDateString()], 'return_date'],
    'identitas kosong' => [['identification' => ''], 'identification'],
]);

test('pengajuan ditolak bila stok objek kosong', function () {
    $this->objek->update(['stock' => 0]);

    $this->actingAs($this->pengguna)
        ->from(route('transactions.create'))
        ->post(route('transactions.store'), dataPengajuan($this->objek))
        ->assertRedirect(route('transactions.create'))
        ->assertSessionHas('error', 'Stok objek ini sedang kosong.');

    expect(Transaction::count())->toBe(0);
});

test('pengguna dapat melihat detail pengajuannya sendiri', function () {
    $transaction = Transaction::factory()->create(['user_id' => $this->pengguna->id, 'console_id' => $this->objek->id]);

    $this->actingAs($this->pengguna)
        ->get(route('transactions.show', $transaction))
        ->assertOk()
        ->assertSee($transaction->rental_code)
        ->assertSee('PlayStation 5')
        ->assertSee('Batalkan Pengajuan');
});

test('pengguna tidak boleh melihat detail pengajuan orang lain', function () {
    $transaction = Transaction::factory()->create(['user_id' => $this->petugas->id, 'console_id' => $this->objek->id]);

    $this->actingAs($this->pengguna)
        ->get(route('transactions.show', $transaction))
        ->assertForbidden();
});

test('petugas dan admin boleh melihat detail pengajuan siapa pun', function (string $email) {
    $transaction = Transaction::factory()->create(['user_id' => $this->pengguna->id, 'console_id' => $this->objek->id]);

    $this->actingAs(User::where('email', $email)->firstOrFail())
        ->get(route('transactions.show', $transaction))
        ->assertOk()
        ->assertSee($transaction->rental_code);
})->with([
    'petugas' => ['andi@example.test'],
    'admin' => ['budi@gamevault.test'],
]);

test('pengguna dapat membatalkan pengajuan yang masih menunggu', function () {
    $transaction = Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objek->id,
        'status' => 'pending',
    ]);

    $this->actingAs($this->pengguna)
        ->post(route('transactions.batalkan', $transaction))
        ->assertRedirect(route('transactions.index'))
        ->assertSessionHas('success', 'Pengajuan berhasil dibatalkan.');

    expect($transaction->refresh()->status)->toBe('cancelled');
    expect(ActivityLog::where('action', 'cancel')->where('subject_id', $transaction->id)->exists())->toBeTrue();
});

test('pengajuan yang sudah disetujui tidak dapat dibatalkan', function () {
    $transaction = Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objek->id,
        'status' => 'approved',
    ]);

    $this->actingAs($this->pengguna)
        ->post(route('transactions.batalkan', $transaction))
        ->assertRedirect(route('transactions.index'))
        ->assertSessionHas('error');

    expect($transaction->refresh()->status)->toBe('approved');
});

test('pengguna tidak dapat membatalkan pengajuan orang lain', function () {
    $transaction = Transaction::factory()->create([
        'user_id' => $this->petugas->id,
        'console_id' => $this->objek->id,
        'status' => 'pending',
    ]);

    $this->actingAs($this->pengguna)
        ->post(route('transactions.batalkan', $transaction))
        ->assertForbidden();

    expect($transaction->refresh()->status)->toBe('pending');
});
