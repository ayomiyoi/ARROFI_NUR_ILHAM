<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('roles')->insert([
            ['id' => 1, 'name' => 'Pengguna', 'slug' => 'pengguna', 'description' => 'Regular user who rents consoles', 'created_at' => '2026-09-02 12:40:49', 'updated_at' => '2026-09-02 12:40:49'],
            ['id' => 2, 'name' => 'Admin', 'slug' => 'admin', 'description' => 'Full system access', 'created_at' => '2026-09-02 12:42:34', 'updated_at' => '2026-09-02 12:42:34'],
            ['id' => 3, 'name' => 'Petugas', 'slug' => 'petugas', 'description' => 'Staff with transaction management access', 'created_at' => '2026-09-02 12:42:34', 'updated_at' => '2026-09-02 12:42:34'],
        ]);
    }
}
