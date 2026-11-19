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

    $kategori = Category::factory()->create(['name' => 'Konsol Modern']);
    $this->objek = Console::factory()->create([
        'category_id' => $kategori->id,
        'name' => 'PlayStation 5',
    ]);

    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objek->id,
        'rental_code' => 'GV-EXPORT-0001',
        'rental_date' => '2026-03-01',
        'return_date' => '2026-03-03',
        'total_days' => 2,
        'total_price' => 120000,
        'fine' => 15000,
        'status' => 'late',
    ]);

    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objek->id,
        'rental_code' => 'GV-EXPORT-0002',
        'rental_date' => '2026-04-01',
        'return_date' => '2026-04-02',
        'total_days' => 1,
        'total_price' => 60000,
        'fine' => 0,
        'status' => 'returned',
    ]);
});

test('pengguna tidak boleh mengunduh laporan', function () {
    $this->actingAs($this->pengguna)
        ->get(route('laporan.export'))
        ->assertForbidden();
});

test('petugas dapat mengunduh laporan dalam format csv', function () {
    $response = $this->actingAs($this->petugas)->get(route('laporan.export'))->assertOk();

    expect($response->headers->get('content-type'))->toContain('text/csv');
    $response->assertHeader('content-disposition', 'attachment; filename=laporan-peminjaman.csv');

    $isi = $response->streamedContent();

    $barisPertama = explode("\n", $isi)[0];

    expect(str_replace('"', '', $barisPertama))->toBe('Kode,Tanggal Pinjam,Tanggal Kembali,Peminjam,Objek,Lama (hari),Total Harga,Denda,Status');

    expect($isi)->toContain('GV-EXPORT-0001')
        ->toContain('GV-EXPORT-0002')
        ->toContain('120000.00')
        ->toContain('Terlambat');
});

test('export csv mengikuti filter yang dipilih', function () {
    $response = $this->actingAs($this->petugas)
        ->get(route('laporan.export', ['dari' => '2026-03-01', 'sampai' => '2026-03-31']))
        ->assertOk();

    $isi = $response->streamedContent();

    expect($isi)->toContain('GV-EXPORT-0001')
        ->not->toContain('GV-EXPORT-0002');
});

test('export csv mengikuti pencarian kode', function () {
    $response = $this->actingAs($this->petugas)
        ->get(route('laporan.export', ['q' => 'EXPORT-0002']))
        ->assertOk();

    $isi = $response->streamedContent();

    expect($isi)->toContain('GV-EXPORT-0002')
        ->not->toContain('GV-EXPORT-0001');
});
