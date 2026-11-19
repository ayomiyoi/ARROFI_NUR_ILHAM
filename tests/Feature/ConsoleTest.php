<?php

use App\Models\ActivityLog;
use App\Models\Category;
use App\Models\Console;
use App\Models\Room;
use App\Models\Transaction;
use App\Models\User;
use Database\Seeders\RoleSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

beforeEach(function () {
    $this->seed(RoleSeeder::class);
    $this->seed(UserSeeder::class);

    $this->admin = User::where('email', 'budi@gamevault.test')->firstOrFail();
    $this->kategori = Category::factory()->create(['name' => 'Konsol Modern']);
});

function dataObjek(Category $kategori, array $ubah = []): array
{
    return array_merge([
        'category_id' => $kategori->id,
        'name' => 'PlayStation 5',
        'desk_number' => '12',
        'description' => 'Unit baru',
        'price_per_day' => 75000,
        'price_per_hour' => 15000,
        'deposit' => 300000,
        'stock' => 3,
        'status' => 'available',
        'condition' => 'good',
    ], $ubah);
}

test('admin dapat melihat daftar objek', function () {
    Console::factory()->create(['name' => 'Nintendo Switch', 'category_id' => $this->kategori->id]);

    $this->actingAs($this->admin)
        ->get(route('consoles.index'))
        ->assertOk()
        ->assertSee('Data Objek')
        ->assertSee('Tambah Objek')
        ->assertSee('Nintendo Switch')
        ->assertSee('Konsol Modern')
        ->assertSee('Tersedia');
});

test('petugas dan pengguna tidak boleh mengakses data objek', function (string $email) {
    $user = User::where('email', $email)->firstOrFail();

    $this->actingAs($user)->get(route('consoles.index'))->assertForbidden();
    $this->actingAs($user)->get(route('consoles.create'))->assertForbidden();
    $this->actingAs($user)->post(route('consoles.store'), dataObjek($this->kategori))->assertForbidden();
})->with([
    'petugas' => ['andi@example.test'],
    'pengguna' => ['arrofiryanto@gmail.com'],
]);

test('admin dapat menambah objek', function () {
    $this->actingAs($this->admin)
        ->post(route('consoles.store'), dataObjek($this->kategori))
        ->assertRedirect(route('consoles.index'))
        ->assertSessionHas('success', 'Objek berhasil ditambahkan.');

    $console = Console::where('name', 'PlayStation 5')->firstOrFail();

    expect($console->category_id)->toBe($this->kategori->id)
        ->and($console->desk_number)->toBe('12')
        ->and($console->stock)->toBe(3)
        ->and($console->room_id)->toBeNull()
        ->and($console->image)->toBeNull();

    expect(ActivityLog::where('action', 'create')
        ->where('subject_type', Console::class)
        ->where('subject_id', $console->id)
        ->exists())->toBeTrue();
});

test('admin dapat menambah objek beserta ruangan', function () {
    $room = Room::create(['name' => 'Ruang VIP', 'room_number' => 'R01']);

    $this->actingAs($this->admin)
        ->post(route('consoles.store'), dataObjek($this->kategori, ['room_id' => $room->id]))
        ->assertRedirect(route('consoles.index'));

    expect(Console::where('name', 'PlayStation 5')->firstOrFail()->room_id)->toBe($room->id);
});

test('validasi data objek', function (array $ubah, string $error) {
    $this->actingAs($this->admin)
        ->from(route('consoles.create'))
        ->post(route('consoles.store'), dataObjek($this->kategori, $ubah))
        ->assertRedirect(route('consoles.create'))
        ->assertSessionHasErrors($error);

    expect(Console::count())->toBe(0);
})->with([
    'nama kosong' => [['name' => ''], 'name'],
    'kategori kosong' => [['category_id' => ''], 'category_id'],
    'kategori tidak ada' => [['category_id' => 99999], 'category_id'],
    'tarif harian negatif' => [['price_per_day' => -1], 'price_per_day'],
    'stok bukan angka' => [['stock' => 'tiga'], 'stock'],
    'status tidak dikenal' => [['status' => 'hilang'], 'status'],
    'kondisi tidak dikenal' => [['condition' => 'hancur'], 'condition'],
]);

test('admin dapat mengubah objek', function () {
    $console = Console::factory()->create(['category_id' => $this->kategori->id, 'name' => 'Nama Lama']);

    $this->actingAs($this->admin)
        ->put(route('consoles.update', $console), dataObjek($this->kategori, ['name' => 'Nama Baru', 'status' => 'maintenance']))
        ->assertRedirect(route('consoles.index'))
        ->assertSessionHas('success', 'Objek berhasil diubah.');

    $this->assertDatabaseHas('consoles', [
        'id' => $console->id,
        'name' => 'Nama Baru',
        'status' => 'maintenance',
    ]);
});

test('admin dapat menghapus objek tanpa riwayat peminjaman', function () {
    $console = Console::factory()->create(['category_id' => $this->kategori->id]);

    $this->actingAs($this->admin)
        ->delete(route('consoles.destroy', $console))
        ->assertRedirect(route('consoles.index'))
        ->assertSessionHas('success', 'Objek berhasil dihapus.');

    $this->assertDatabaseMissing('consoles', ['id' => $console->id]);
});

test('objek yang sudah punya riwayat peminjaman tidak dapat dihapus', function () {
    $console = Console::factory()->create(['category_id' => $this->kategori->id]);
    Transaction::factory()->create([
        'console_id' => $console->id,
        'user_id' => User::where('email', 'arrofiryanto@gmail.com')->firstOrFail()->id,
    ]);

    $this->actingAs($this->admin)
        ->delete(route('consoles.destroy', $console))
        ->assertRedirect(route('consoles.index'))
        ->assertSessionHas('error');

    $this->assertDatabaseHas('consoles', ['id' => $console->id]);
});
