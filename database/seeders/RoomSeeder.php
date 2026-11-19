<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoomSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('rooms')->insert([
            ['id' => 1, 'name' => 'Ruang PC Gaming', 'room_number' => 'R01', 'capacity' => 5, 'description' => 'Ruang PC Gaming dengan 5 unit komputer high-end', 'is_active' => 1, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 2, 'name' => 'Ruang Konsol A', 'room_number' => 'R02', 'capacity' => 4, 'description' => 'Ruang konsol PS5 dan Xbox Series', 'is_active' => 1, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
            ['id' => 3, 'name' => 'Ruang VIP', 'room_number' => 'R03', 'capacity' => 2, 'description' => 'Ruang VIP untuk gaming dengan sofa premium', 'is_active' => 1, 'created_at' => '2026-09-02 12:43:25', 'updated_at' => '2026-09-02 12:43:25'],
        ]);
    }
}
