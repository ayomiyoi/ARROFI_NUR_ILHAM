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
});

test('pengguna melihat dashboard pengguna', function () {
    $user = User::where('email', 'arrofiryanto@gmail.com')->firstOrFail();

    $this->actingAs($user)
        ->get('/')
        ->assertOk()
        ->assertSee('Dashboard Pengguna')
        ->assertSee('Pengajuan Saya')
        ->assertSee('Selesai')
        ->assertDontSee('Data User')
        ->assertDontSee('Terlambat');
});

test('petugas melihat dashboard petugas', function () {
    $user = User::where('email', 'andi@example.test')->firstOrFail();

    $this->actingAs($user)
        ->get('/')
        ->assertOk()
        ->assertSee('Dashboard Petugas')
        ->assertSee('Menunggu Persetujuan')
        ->assertSee('Terlambat')
        ->assertDontSee('Data User')
        ->assertDontSee('Pengajuan Saya');
});

test('admin melihat dashboard admin', function () {
    $user = User::where('email', 'budi@gamevault.test')->firstOrFail();

    $this->actingAs($user)
        ->get('/')
        ->assertOk()
        ->assertSee('Dashboard Admin')
        ->assertSee('Data Kategori')
        ->assertSee('Data Objek')
        ->assertSee('Data User')
        ->assertDontSee('Pengajuan Saya')
        ->assertDontSee('Terlambat');
});

test('layout menampilkan nama, role, dan tombol logout', function () {
    $user = User::where('email', 'budi@gamevault.test')->firstOrFail();

    $this->actingAs($user)
        ->get('/')
        ->assertOk()
        ->assertSee('Peminjaman Alat')
        ->assertSee($user->name)
        ->assertSee($user->role->name)
        ->assertSee('Logout');
});

test('dashboard admin menampilkan jumlah data master sesuai seeder', function () {
    $user = User::where('email', 'budi@gamevault.test')->firstOrFail();

    $this->actingAs($user)
        ->get('/')
        ->assertOk()
        ->assertSeeInOrder([
            'Data Kategori', '>'.Category::count().'<',
            'Data Objek', '>'.Console::count().'<',
            'Data User', '>'.User::count().'<',
        ], false);
});

test('dashboard admin menampilkan grafik peminjaman dan objek populer', function () {
    $user = User::where('email', 'budi@gamevault.test')->firstOrFail();

    $kategori = Category::factory()->create(['name' => 'Konsol Modern']);
    $objek = Console::factory()->create(['category_id' => $kategori->id, 'name' => 'PlayStation 5']);

    Transaction::factory()->count(3)->create([
        'user_id' => $user->id,
        'console_id' => $objek->id,
        'rental_date' => now()->toDateString(),
    ]);

    $this->actingAs($user)
        ->get('/')
        ->assertOk()
        ->assertSee('Grafik Peminjaman 6 Bulan Terakhir')
        ->assertSee('grafikPeminjaman')
        ->assertSee('Objek Paling Sering Dipinjam')
        ->assertSeeInOrder(['PlayStation 5', 'Konsol Modern', '>3<'], false);
});
