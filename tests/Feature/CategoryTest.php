<?php

use App\Models\ActivityLog;
use App\Models\Category;
use App\Models\Console;
use App\Models\User;
use Database\Seeders\RoleSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

beforeEach(function () {
    $this->seed(RoleSeeder::class);
    $this->seed(UserSeeder::class);

    $this->admin = User::where('email', 'budi@gamevault.test')->firstOrFail();
});

test('admin dapat melihat daftar kategori', function () {
    $kategori = Category::factory()->create(['name' => 'Konsol Modern']);

    $this->actingAs($this->admin)
        ->get(route('categories.index'))
        ->assertOk()
        ->assertSee('Data Kategori')
        ->assertSee('Tambah Kategori')
        ->assertSee($kategori->name);
});

test('petugas dan pengguna tidak boleh mengakses data kategori', function (string $email) {
    $user = User::where('email', $email)->firstOrFail();

    $this->actingAs($user)->get(route('categories.index'))->assertForbidden();
    $this->actingAs($user)->get(route('categories.create'))->assertForbidden();
    $this->actingAs($user)->post(route('categories.store'), ['name' => 'Kategori Baru'])->assertForbidden();
})->with([
    'petugas' => ['andi@example.test'],
    'pengguna' => ['arrofiryanto@gmail.com'],
]);

test('admin dapat menambah kategori', function () {
    $response = $this->actingAs($this->admin)
        ->post(route('categories.store'), [
            'name' => 'Konsol Retro',
            'description' => 'Konsol lawas',
        ]);

    $response->assertRedirect(route('categories.index'))
        ->assertSessionHas('success', 'Kategori berhasil ditambahkan.');

    $this->assertDatabaseHas('categories', [
        'name' => 'Konsol Retro',
        'slug' => 'konsol-retro',
        'description' => 'Konsol lawas',
    ]);

    $category = Category::where('slug', 'konsol-retro')->firstOrFail();

    expect(ActivityLog::where('action', 'create')
        ->where('subject_type', Category::class)
        ->where('subject_id', $category->id)
        ->where('user_id', $this->admin->id)
        ->exists())->toBeTrue();
});

test('nama kategori wajib diisi', function () {
    $this->actingAs($this->admin)
        ->from(route('categories.create'))
        ->post(route('categories.store'), ['name' => '', 'description' => ''])
        ->assertRedirect(route('categories.create'))
        ->assertSessionHasErrors('name');

    expect(Category::count())->toBe(0);
});

test('nama kategori tidak boleh duplikat', function () {
    Category::factory()->create(['name' => 'Konsol Modern', 'slug' => 'konsol-modern']);

    $this->actingAs($this->admin)
        ->from(route('categories.create'))
        ->post(route('categories.store'), ['name' => 'Konsol Modern'])
        ->assertRedirect(route('categories.create'))
        ->assertSessionHasErrors('name');

    expect(Category::count())->toBe(1);
});

test('halaman edit menampilkan data kategori', function () {
    $kategori = Category::factory()->create(['name' => 'Konsol Modern']);

    $this->actingAs($this->admin)
        ->get(route('categories.edit', $kategori))
        ->assertOk()
        ->assertSee($kategori->name)
        ->assertSee('Perbarui');
});

test('admin dapat mengubah kategori', function () {
    $kategori = Category::factory()->create(['name' => 'Nama Lama', 'slug' => 'nama-lama']);

    $this->actingAs($this->admin)
        ->put(route('categories.update', $kategori), [
            'name' => 'Nama Baru',
            'description' => 'Deskripsi baru',
        ])
        ->assertRedirect(route('categories.index'))
        ->assertSessionHas('success', 'Kategori berhasil diubah.');

    $this->assertDatabaseHas('categories', [
        'id' => $kategori->id,
        'name' => 'Nama Baru',
        'slug' => 'nama-baru',
        'description' => 'Deskripsi baru',
    ]);
});

test('slug tetap unik saat kategori lain diubah dengan nama sama', function () {
    $kategori = Category::factory()->create(['name' => 'Sega', 'slug' => 'sega']);

    $this->actingAs($this->admin)
        ->put(route('categories.update', $kategori), ['name' => 'Sega'])
        ->assertRedirect(route('categories.index'));

    $this->assertDatabaseHas('categories', ['id' => $kategori->id, 'slug' => 'sega']);
});

test('admin dapat menghapus kategori tanpa objek', function () {
    $kategori = Category::factory()->create();

    $this->actingAs($this->admin)
        ->delete(route('categories.destroy', $kategori))
        ->assertRedirect(route('categories.index'))
        ->assertSessionHas('success', 'Kategori berhasil dihapus.');

    $this->assertDatabaseMissing('categories', ['id' => $kategori->id]);
});

test('kategori yang masih dipakai objek tidak dapat dihapus', function () {
    $kategori = Category::factory()->create();
    Console::factory()->create(['category_id' => $kategori->id]);

    $this->actingAs($this->admin)
        ->delete(route('categories.destroy', $kategori))
        ->assertRedirect(route('categories.index'))
        ->assertSessionHas('error');

    $this->assertDatabaseHas('categories', ['id' => $kategori->id]);
});
