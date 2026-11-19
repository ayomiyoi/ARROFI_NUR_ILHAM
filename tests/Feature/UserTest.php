<?php

use App\Models\ActivityLog;
use App\Models\Role;
use App\Models\Transaction;
use App\Models\User;
use Database\Seeders\RoleSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;

uses(RefreshDatabase::class);

beforeEach(function () {
    $this->seed(RoleSeeder::class);
    $this->seed(UserSeeder::class);

    $this->admin = User::where('email', 'budi@gamevault.test')->firstOrFail();
});

function dataUser(array $ubah = []): array
{
    return array_merge([
        'name' => 'Dewi Lestari',
        'email' => 'dewi.baru@example.test',
        'password' => 'rahasia123',
        'phone' => '081234567890',
        'address' => 'Jl. Merdeka No. 10',
        'role_id' => Role::PENGGUNA,
    ], $ubah);
}

test('admin dapat melihat daftar user', function () {
    $this->actingAs($this->admin)
        ->get(route('users.index'))
        ->assertOk()
        ->assertSee('Data User')
        ->assertSee('Tambah User')
        ->assertSee('Andi Pratama')
        ->assertSee('Petugas')
        ->assertSee('Anda');
});

test('petugas dan pengguna tidak boleh mengakses data user', function (string $email) {
    $user = User::where('email', $email)->firstOrFail();

    $this->actingAs($user)->get(route('users.index'))->assertForbidden();
    $this->actingAs($user)->get(route('users.create'))->assertForbidden();
    $this->actingAs($user)->post(route('users.store'), dataUser())->assertForbidden();
})->with([
    'petugas' => ['andi@example.test'],
    'pengguna' => ['arrofiryanto@gmail.com'],
]);

test('admin dapat menambah user dan password tersimpan ter-hash', function () {
    $this->actingAs($this->admin)
        ->post(route('users.store'), dataUser())
        ->assertRedirect(route('users.index'))
        ->assertSessionHas('success', 'User berhasil ditambahkan.');

    $this->assertDatabaseHas('users', [
        'email' => 'dewi.baru@example.test',
        'name' => 'Dewi Lestari',
        'role_id' => Role::PENGGUNA,
        'phone' => '081234567890',
    ]);

    $user = User::where('email', 'dewi.baru@example.test')->firstOrFail();

    expect(Hash::check('rahasia123', $user->password))->toBeTrue()
        ->and($user->password)->not->toBe('rahasia123');

    expect(ActivityLog::where('action', 'create')->where('subject_type', User::class)->where('subject_id', $user->id)->exists())->toBeTrue();
});

test('validasi data user', function (array $ubah, string $error) {
    $this->actingAs($this->admin)
        ->from(route('users.create'))
        ->post(route('users.store'), dataUser($ubah))
        ->assertRedirect(route('users.create'))
        ->assertSessionHasErrors($error);
})->with([
    'nama kosong' => [['name' => ''], 'name'],
    'email kosong' => [['email' => ''], 'email'],
    'email tidak valid' => [['email' => 'bukan-email'], 'email'],
    'email duplikat' => [['email' => 'budi@gamevault.test'], 'email'],
    'password kosong' => [['password' => ''], 'password'],
    'password terlalu pendek' => [['password' => '123'], 'password'],
    'role tidak ada' => [['role_id' => 999], 'role_id'],
]);

test('halaman edit menampilkan data user tanpa membocorkan password', function () {
    $user = User::where('email', 'andi@example.test')->firstOrFail();

    $this->actingAs($this->admin)
        ->get(route('users.edit', $user))
        ->assertOk()
        ->assertSee($user->name)
        ->assertSee($user->email)
        ->assertDontSee($user->password);
});

test('admin dapat mengubah user tanpa mengganti password', function () {
    $user = User::where('email', 'andi@example.test')->firstOrFail();
    $passwordLama = $user->password;

    $this->actingAs($this->admin)
        ->put(route('users.update', $user), dataUser([
            'name' => 'Andi Pratama Jaya',
            'email' => 'andi@example.test',
            'password' => '',
            'role_id' => Role::PETUGAS,
        ]))
        ->assertRedirect(route('users.index'))
        ->assertSessionHas('success', 'User berhasil diubah.');

    $user->refresh();

    expect($user->name)->toBe('Andi Pratama Jaya')
        ->and($user->password)->toBe($passwordLama)
        ->and(Hash::check('password', $user->password))->toBeTrue();
});

test('admin dapat mengganti password user', function () {
    $user = User::where('email', 'andi@example.test')->firstOrFail();

    $this->actingAs($this->admin)
        ->put(route('users.update', $user), dataUser([
            'email' => 'andi@example.test',
            'password' => 'passwordBaru1',
            'role_id' => Role::PETUGAS,
        ]))
        ->assertRedirect(route('users.index'));

    $user->refresh();

    expect(Hash::check('passwordBaru1', $user->password))->toBeTrue()
        ->and(Hash::check('password', $user->password))->toBeFalse();
});

test('admin dapat menghapus user tanpa riwayat peminjaman', function () {
    $user = User::factory()->create(['role_id' => Role::PETUGAS]);

    $this->actingAs($this->admin)
        ->delete(route('users.destroy', $user))
        ->assertRedirect(route('users.index'))
        ->assertSessionHas('success', 'User berhasil dihapus.');

    $this->assertDatabaseMissing('users', ['id' => $user->id]);
});

test('admin tidak dapat menghapus akunnya sendiri', function () {
    $this->actingAs($this->admin)
        ->delete(route('users.destroy', $this->admin))
        ->assertRedirect(route('users.index'))
        ->assertSessionHas('error');

    $this->assertDatabaseHas('users', ['id' => $this->admin->id]);
});

test('user yang sudah punya riwayat peminjaman tidak dapat dihapus', function () {
    $user = User::factory()->create(['role_id' => Role::PENGGUNA]);
    Transaction::factory()->create(['user_id' => $user->id]);

    $this->actingAs($this->admin)
        ->delete(route('users.destroy', $user))
        ->assertRedirect(route('users.index'))
        ->assertSessionHas('error');

    $this->assertDatabaseHas('users', ['id' => $user->id]);
});
