<?php

use App\Models\ActivityLog;
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
});

test('pengguna dan petugas tidak boleh membuka log aktivitas', function (string $email) {
    $this->actingAs(User::where('email', $email)->firstOrFail())
        ->get(route('log-aktivitas.index'))
        ->assertForbidden();
})->with([
    'pengguna' => ['arrofiryanto@gmail.com'],
    'petugas' => ['andi@example.test'],
]);

test('admin dapat melihat daftar log aktivitas', function () {
    ActivityLog::create([
        'user_id' => $this->petugas->id,
        'action' => 'approve',
        'description' => 'Menyetujui pengajuan GV-20260101-0001',
        'subject_type' => 'App\Models\Transaction',
        'subject_id' => 7,
        'ip_address' => '127.0.0.1',
    ]);

    $this->actingAs($this->admin)
        ->get(route('log-aktivitas.index'))
        ->assertOk()
        ->assertSee('Log Aktivitas')
        ->assertSee('Menyetujui pengajuan GV-20260101-0001')
        ->assertSee($this->petugas->name)
        ->assertSee('Menyetujui')
        ->assertSee('Transaction #7')
        ->assertSee('127.0.0.1');
});

test('log terbaru tampil di urutan paling atas', function () {
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'LOG LAMA']);
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'logout', 'description' => 'LOG BARU']);

    $response = $this->actingAs($this->admin)->get(route('log-aktivitas.index'))->assertOk();

    expect($response->content())->toContain('LOG BARU')
        ->and(strpos($response->content(), 'LOG BARU'))->toBeLessThan(strpos($response->content(), 'LOG LAMA'));
});

test('log aktivitas dapat difilter berdasarkan aksi', function () {
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'AKSI LOGIN']);
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'delete', 'description' => 'AKSI HAPUS']);

    $this->actingAs($this->admin)
        ->get(route('log-aktivitas.index', ['action' => 'delete']))
        ->assertOk()
        ->assertSee('AKSI HAPUS')
        ->assertDontSee('AKSI LOGIN');
});

test('log aktivitas dapat difilter berdasarkan pengguna', function () {
    ActivityLog::create(['user_id' => $this->petugas->id, 'action' => 'login', 'description' => 'LOG PETUGAS']);
    ActivityLog::create(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'LOG ADMIN']);

    $this->actingAs($this->admin)
        ->get(route('log-aktivitas.index', ['user_id' => $this->petugas->id]))
        ->assertOk()
        ->assertSee('LOG PETUGAS')
        ->assertDontSee('LOG ADMIN');
});

test('log aktivitas dapat difilter berdasarkan tanggal', function () {
    ActivityLog::forceCreate(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'LOG HARI INI', 'created_at' => now()]);
    ActivityLog::forceCreate(['user_id' => $this->admin->id, 'action' => 'login', 'description' => 'LOG KEMARIN', 'created_at' => now()->subDay()]);

    $this->actingAs($this->admin)
        ->get(route('log-aktivitas.index', ['tanggal' => now()->toDateString()]))
        ->assertOk()
        ->assertSee('LOG HARI INI')
        ->assertDontSee('LOG KEMARIN');
});

test('dashboard admin menampilkan aktivitas terbaru', function () {
    ActivityLog::create(['user_id' => $this->petugas->id, 'action' => 'borrow', 'description' => 'Serah terima objek GV-20260101-0009']);

    $this->actingAs($this->admin)
        ->get(route('dashboard'))
        ->assertOk()
        ->assertSee('Aktivitas Terbaru')
        ->assertSee('Serah terima objek GV-20260101-0009');
});
