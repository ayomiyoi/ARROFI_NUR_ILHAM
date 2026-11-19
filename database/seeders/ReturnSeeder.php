<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReturnSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('returns')->insert([
            ['id' => 1, 'transaction_id' => 7, 'return_date' => '2026-07-27', 'condition' => 'good', 'fine' => '0.00', 'notes' => 'Dikembalikan tepat waktu, kondisi baik', 'created_at' => '2026-09-02 12:53:20', 'updated_at' => '2026-09-02 12:53:20'],
            ['id' => 2, 'transaction_id' => 8, 'return_date' => '2026-07-25', 'condition' => 'minor_damage', 'fine' => '100000.00', 'notes' => 'Terlambat 2 hari dan ada goresan di body konsol', 'created_at' => '2026-09-02 12:53:20', 'updated_at' => '2026-09-02 12:53:20'],
            ['id' => 3, 'transaction_id' => 12, 'return_date' => '2026-09-17', 'condition' => 'broken', 'fine' => '300000.00', 'notes' => 'broken', 'created_at' => '2026-09-17 04:33:36', 'updated_at' => '2026-09-17 04:33:36'],
            ['id' => 4, 'transaction_id' => 13, 'return_date' => '2026-09-17', 'condition' => 'excellent', 'fine' => '0.00', 'notes' => null, 'created_at' => '2026-09-17 04:35:14', 'updated_at' => '2026-09-17 04:35:14'],
        ]);
    }
}
