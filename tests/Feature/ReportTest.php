<?php

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
    ]);

    $this->transaksiLama = Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objek->id,
        'rental_code' => 'GV-LAMA-0001',
        'rental_date' => '2026-01-05',
        'return_date' => '2026-01-07',
        'total_days' => 2,
        'total_price' => 100000,
        'fine' => 0,
        'status' => 'returned',
    ]);

    $this->transaksiBaru = Transaction::factory()->create([
        'user_id' => $this->petugas->id,
        'console_id' => $this->objek->id,
        'rental_code' => 'GV-BARU-0001',
        'rental_date' => '2026-02-10',
        'return_date' => '2026-02-12',
        'total_days' => 2,
        'total_price' => 150000,
        'fine' => 25000,
        'status' => 'late',
    ]);
});

test('pengguna tidak boleh membuka laporan', function () {
    $this->actingAs($this->pengguna)->get(route('laporan.index'))->assertForbidden();
    $this->actingAs($this->pengguna)->get(route('laporan.cetak'))->assertForbidden();
});

test('petugas dan admin dapat melihat laporan', function (string $email) {
    $this->actingAs(User::where('email', $email)->firstOrFail())
        ->get(route('laporan.index'))
        ->assertOk()
        ->assertSee('Laporan Peminjaman')
        ->assertSee('GV-LAMA-0001')
        ->assertSee('GV-BARU-0001');
})->with([
    'petugas' => ['andi@example.test'],
    'admin' => ['budi@gamevault.test'],
]);

test('laporan dapat difilter berdasarkan rentang tanggal', function () {
    $this->actingAs($this->petugas)
        ->get(route('laporan.index', ['dari' => '2026-02-01', 'sampai' => '2026-02-28']))
        ->assertOk()
        ->assertSee('GV-BARU-0001')
        ->assertDontSee('GV-LAMA-0001');
});

test('laporan dapat difilter berdasarkan status', function () {
    $this->actingAs($this->petugas)
        ->get(route('laporan.index', ['status' => 'returned']))
        ->assertOk()
        ->assertSee('GV-LAMA-0001')
        ->assertDontSee('GV-BARU-0001');
});

test('laporan menampilkan ringkasan total', function () {
    $response = $this->actingAs($this->petugas)->get(route('laporan.index'))->assertOk();

    $response->assertSee('Jumlah Transaksi')
        ->assertSee('Total Pendapatan')
        ->assertSee('250.000')
        ->assertSee('25.000');
});

test('halaman cetak menampilkan tabel dan tombol cetak', function () {
    $this->actingAs($this->petugas)
        ->get(route('laporan.cetak'))
        ->assertOk()
        ->assertSee('Cetak Sekarang')
        ->assertSee('window.print()')
        ->assertSee('GV-LAMA-0001')
        ->assertSee('Andi Pratama')
        ->assertDontSee('Log Aktivitas');
});

test('halaman cetak mengikuti filter yang dipilih', function () {
    $this->actingAs($this->petugas)
        ->get(route('laporan.cetak', ['dari' => '2026-01-01', 'sampai' => '2026-01-31']))
        ->assertOk()
        ->assertSee('GV-LAMA-0001')
        ->assertDontSee('GV-BARU-0001');
});
