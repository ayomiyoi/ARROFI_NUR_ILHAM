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
});

test('tamu diarahkan ke halaman login', function () {
    $this->get('/')->assertRedirect('/login');

    $this->assertGuest();
});

test('halaman login dapat ditampilkan', function () {
    $this->get('/login')
        ->assertOk()
        ->assertSee('Selamat Datang')
        ->assertSee('Sign in');
});

test('login gagal bila password salah', function () {
    $this->from('/login')
        ->post('/login', ['email' => 'budi@gamevault.test', 'password' => 'password-salah'])
        ->assertRedirect('/login')
        ->assertSessionHasErrors(['email' => 'Email atau password salah.']);

    $this->assertGuest();
});

test('login gagal bila email tidak terdaftar', function () {
    $this->from('/login')
        ->post('/login', ['email' => 'tidak-ada@gamevault.test', 'password' => 'password'])
        ->assertRedirect('/login')
        ->assertSessionHasErrors('email');

    $this->assertGuest();
});

test('login gagal bila form kosong', function () {
    $this->from('/login')
        ->post('/login', [])
        ->assertRedirect('/login')
        ->assertSessionHasErrors(['email', 'password']);

    $this->assertGuest();
});

test('setiap role dapat login dan melihat dashboard sesuai rolenya', function (string $email, string $name, string $role) {
    $this->post('/login', ['email' => $email, 'password' => 'password'])->assertRedirect('/');

    $this->assertAuthenticatedAs(User::where('email', $email)->firstOrFail());

    $this->get('/')
        ->assertOk()
        ->assertSee($name)
        ->assertSee($role);
})->with([
    ['budi@gamevault.test', 'Budi Santoso', 'Admin'],
    ['andi@example.test', 'Andi Pratama', 'Petugas'],
    ['arrofiryanto@gmail.com', 'Arrofi Nur Ilham Fathoni Ryanto', 'Pengguna'],
]);

test('user yang sudah login diarahkan dari halaman login ke dashboard', function () {
    $this->post('/login', ['email' => 'budi@gamevault.test', 'password' => 'password']);

    $this->get('/login')->assertRedirect('/');
});

test('login mencatat aktivitas ke activity_logs', function () {
    $this->post('/login', ['email' => 'budi@gamevault.test', 'password' => 'password']);

    $user = User::where('email', 'budi@gamevault.test')->firstOrFail();

    expect(ActivityLog::where('user_id', $user->id)->where('action', 'login')->exists())->toBeTrue();
});

test('logout mengakhiri sesi dan mencatat aktivitas', function () {
    $this->post('/login', ['email' => 'budi@gamevault.test', 'password' => 'password']);

    $user = User::where('email', 'budi@gamevault.test')->firstOrFail();

    $this->post('/logout')->assertRedirect('/login');

    $this->assertGuest();

    $logout = ActivityLog::where('user_id', $user->id)->where('action', 'logout')->first();

    expect($logout)->not->toBeNull()
        ->and($logout->description)->toBe('User logged out');
});
