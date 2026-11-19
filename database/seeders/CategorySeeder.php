<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        DB::table('categories')->insert([
            ['id' => 1, 'name' => 'PlayStation 5', 'slug' => 'ps5', 'description' => 'Sony PlayStation 5 dan aksesorisnya', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 2, 'name' => 'PlayStation 4', 'slug' => 'ps4', 'description' => 'Sony PlayStation 4 dan aksesorisnya', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 3, 'name' => 'Xbox Series X/S', 'slug' => 'xbox-series', 'description' => 'Microsoft Xbox Series X dan Series S', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 4, 'name' => 'Xbox One', 'slug' => 'xbox-one', 'description' => 'Microsoft Xbox One', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 5, 'name' => 'Nintendo Switch', 'slug' => 'nintendo-switch', 'description' => 'Nintendo Switch dan Switch OLED', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 6, 'name' => 'PC Gaming', 'slug' => 'pc-gaming', 'description' => 'PC Gaming rig dan laptop gaming', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 7, 'name' => 'VR Headset', 'slug' => 'vr', 'description' => 'Virtual Reality headsets', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 8, 'name' => 'Aksesoris Gaming', 'slug' => 'aksesoris', 'description' => 'Controller, steering wheel, dan aksesoris lainnya', 'image' => null, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
        ]);
    }
}
