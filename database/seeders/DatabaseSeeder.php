<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            RoleSeeder::class,
            UserSeeder::class,
            CategorySeeder::class,
            RoomSeeder::class,
            ConsoleSeeder::class,
            TransactionSeeder::class,
            ReturnSeeder::class,
            ActivityLogSeeder::class,
        ]);
    }
}
