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

    $this->kategoriMainan = Category::factory()->create(['name' => 'Konsol Retro']);
    $this->kategoriLain = Category::factory()->create(['name' => 'Aksesori']);

    $this->objekRetro = Console::factory()->create([
        'category_id' => $this->kategoriMainan->id,
        'name' => 'Nintendo Classic',
    ]);
    $this->objekLain = Console::factory()->create([
        'category_id' => $this->kategoriLain->id,
        'name' => 'Stick Arcade',
    ]);
});

test('kategori dapat dicari berdasarkan nama', function () {
    $this->actingAs($this->admin)
        ->get(route('categories.index', ['q' => 'Retro']))
        ->assertOk()
        ->assertSee('Konsol Retro')
        ->assertDontSee('Aksesori');
});

test('objek dapat dicari berdasarkan nama', function () {
    $this->actingAs($this->admin)
        ->get(route('consoles.index', ['q' => 'Nintendo']))
        ->assertOk()
        ->assertSee('Nintendo Classic')
        ->assertDontSee('Stick Arcade');
});

test('user dapat dicari berdasarkan nama atau email', function () {
    $this->actingAs($this->admin)
        ->get(route('users.index', ['q' => 'Dewi']))
        ->assertOk()
        ->assertSee('Dewi Lestari')
        ->assertDontSee('Andi Pratama');

    $this->actingAs($this->admin)
        ->get(route('users.index', ['q' => 'andi@example.test']))
        ->assertOk()
        ->assertSee('Andi Pratama')
        ->assertDontSee('Dewi Lestari');
});

test('persetujuan dapat dicari berdasarkan kode peminjaman', function () {
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objekRetro->id,
        'rental_code' => 'GV-CARI-INI-0001',
        'status' => 'pending',
    ]);
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objekLain->id,
        'rental_code' => 'GV-BUKAN-0001',
        'status' => 'pending',
    ]);

    $this->actingAs($this->petugas)
        ->get(route('persetujuan.index', ['q' => 'CARI-INI']))
        ->assertOk()
        ->assertSee('GV-CARI-INI-0001')
        ->assertDontSee('GV-BUKAN-0001');
});

test('pengembalian dapat dicari berdasarkan kode peminjaman', function () {
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objekRetro->id,
        'rental_code' => 'GV-KEMBALI-0001',
        'status' => 'borrowed',
    ]);
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objekLain->id,
        'rental_code' => 'GV-LAIN-0001',
        'status' => 'borrowed',
    ]);

    $this->actingAs($this->petugas)
        ->get(route('pengembalian.index', ['q' => 'KEMBALI']))
        ->assertOk()
        ->assertSee('GV-KEMBALI-0001')
        ->assertDontSee('GV-LAIN-0001');
});

test('log aktivitas dapat dicari berdasarkan keterangan', function () {
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'AKTIVITAS UNIK SATU']);
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'AKTIVITAS BIASA']);

    $this->actingAs($this->admin)
        ->get(route('log-aktivitas.index', ['q' => 'UNIK SATU']))
        ->assertOk()
        ->assertSee('AKTIVITAS UNIK SATU')
        ->assertDontSee('AKTIVITAS BIASA');
});

test('laporan dapat dicari berdasarkan kode peminjaman', function () {
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objekRetro->id,
        'rental_code' => 'GV-LAPORAN-0001',
        'status' => 'returned',
    ]);
    Transaction::factory()->create([
        'user_id' => $this->pengguna->id,
        'console_id' => $this->objekLain->id,
        'rental_code' => 'GV-SEMBUNYI-0001',
        'status' => 'returned',
    ]);

    $this->actingAs($this->petugas)
        ->get(route('laporan.index', ['q' => 'LAPORAN']))
        ->assertOk()
        ->assertSee('GV-LAPORAN-0001')
        ->assertDontSee('GV-SEMBUNYI-0001');
});
