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

    $kategori = Category::factory()->create();
    $this->objek = Console::factory()->create([
        'category_id' => $kategori->id,
        'name' => 'PlayStation 5',
        'stock' => 2,
        'status' => 'available',
    ]);
});

function pengajuanPending(User $pengguna, Console $objek, array $ubah = []): Transaction
{
    return Transaction::factory()->create(array_merge([
        'user_id' => $pengguna->id,
        'console_id' => $objek->id,
        'status' => 'pending',
        'approved_by' => null,
    ], $ubah));
}

test('pengguna tidak boleh membuka menu persetujuan', function () {
    $this->actingAs($this->pengguna)->get(route('persetujuan.index'))->assertForbidden();
});

test('petugas dan admin dapat melihat daftar persetujuan', function (string $email) {
    $transaction = pengajuanPending($this->pengguna, $this->objek, ['rental_code' => 'GV-PENDING-001']);

    $this->actingAs(User::where('email', $email)->firstOrFail())
        ->get(route('persetujuan.index'))
        ->assertOk()
        ->assertSee('Persetujuan Peminjaman')
        ->assertSee('GV-PENDING-001')
        ->assertSee($this->pengguna->name);
})->with([
    'petugas' => ['andi@example.test'],
    'admin' => ['budi@gamevault.test'],
]);

test('daftar persetujuan dapat difilter berdasarkan status', function () {
    pengajuanPending($this->pengguna, $this->objek, ['rental_code' => 'GV-PENDING-001']);
    pengajuanPending($this->pengguna, $this->objek, ['rental_code' => 'GV-APPROVED-001', 'status' => 'approved']);

    $this->actingAs($this->petugas)
        ->get(route('persetujuan.index', ['status' => 'pending']))
        ->assertOk()
        ->assertSee('GV-PENDING-001')
        ->assertDontSee('GV-APPROVED-001');

    $this->actingAs($this->petugas)
        ->get(route('persetujuan.index', ['status' => 'approved']))
        ->assertOk()
        ->assertSee('GV-APPROVED-001')
        ->assertDontSee('GV-PENDING-001');
});

test('petugas dapat menyetujui pengajuan', function () {
    $transaction = pengajuanPending($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.setujui', $transaction))
        ->assertRedirect(route('persetujuan.index'))
        ->assertSessionHas('success');

    $transaction->refresh();

    expect($transaction->status)->toBe('approved')
        ->and($transaction->approved_by)->toBe($this->petugas->id);

    expect(ActivityLog::where('action', 'approve')->where('subject_id', $transaction->id)->exists())->toBeTrue();
});

test('petugas dapat menolak pengajuan', function () {
    $transaction = pengajuanPending($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.tolak', $transaction))
        ->assertRedirect(route('persetujuan.index'))
        ->assertSessionHas('success');

    expect($transaction->refresh()->status)->toBe('rejected');
    expect(ActivityLog::where('action', 'reject')->where('subject_id', $transaction->id)->exists())->toBeTrue();
});

test('pengajuan yang sudah diproses tidak dapat disetujui atau ditolak lagi', function (string $aksi, string $statusAwal) {
    $transaction = pengajuanPending($this->pengguna, $this->objek, ['status' => $statusAwal]);

    $this->actingAs($this->petugas)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.'.$aksi, $transaction))
        ->assertRedirect(route('persetujuan.index'))
        ->assertSessionHas('error');

    expect($transaction->refresh()->status)->toBe($statusAwal);
})->with([
    'setujui yang sudah approved' => ['setujui', 'approved'],
    'tolak yang sudah rejected' => ['tolak', 'rejected'],
    'setujui yang sudah dibatalkan' => ['setujui', 'cancelled'],
]);

test('serah terima mengubah status menjadi borrowed dan mengurangi stok', function () {
    $transaction = pengajuanPending($this->pengguna, $this->objek, ['status' => 'approved']);

    $this->actingAs($this->petugas)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.pinjam', $transaction))
        ->assertRedirect(route('persetujuan.index'))
        ->assertSessionHas('success');

    expect($transaction->refresh()->status)->toBe('borrowed')
        ->and($this->objek->refresh()->stock)->toBe(1)
        ->and($this->objek->status)->toBe('available');

    expect(ActivityLog::where('action', 'borrow')->where('subject_id', $transaction->id)->exists())->toBeTrue();
});

test('objek menjadi sedang dipinjam bila stok habis', function () {
    $this->objek->update(['stock' => 1]);
    $transaction = pengajuanPending($this->pengguna, $this->objek, ['status' => 'approved']);

    $this->actingAs($this->admin)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.pinjam', $transaction))
        ->assertSessionHas('success');

    expect($this->objek->refresh()->stock)->toBe(0)
        ->and($this->objek->status)->toBe('rented');
});

test('serah terima ditolak bila stok objek kosong', function () {
    $this->objek->update(['stock' => 0]);
    $transaction = pengajuanPending($this->pengguna, $this->objek, ['status' => 'approved']);

    $this->actingAs($this->petugas)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.pinjam', $transaction))
        ->assertRedirect(route('persetujuan.index'))
        ->assertSessionHas('error');

    expect($transaction->refresh()->status)->toBe('approved')
        ->and($this->objek->refresh()->stock)->toBe(0);
});

test('serah terima hanya untuk pengajuan yang sudah disetujui', function () {
    $transaction = pengajuanPending($this->pengguna, $this->objek);

    $this->actingAs($this->petugas)
        ->from(route('persetujuan.index'))
        ->post(route('persetujuan.pinjam', $transaction))
        ->assertRedirect(route('persetujuan.index'))
        ->assertSessionHas('error');

    expect($transaction->refresh()->status)->toBe('pending')
        ->and($this->objek->refresh()->stock)->toBe(2);
});

test('pengguna tidak boleh menyetujui pengajuan', function () {
    $transaction = pengajuanPending($this->pengguna, $this->objek);

    $this->actingAs($this->pengguna)
        ->post(route('persetujuan.setujui', $transaction))
        ->assertForbidden();

    expect($transaction->refresh()->status)->toBe('pending');
});
