<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('users')->insert([
            ['id' => 20, 'role_id' => 1, 'name' => 'Arrofi Nur Ilham Fathoni Ryanto', 'email' => 'arrofiryanto@gmail.com', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => null, 'address' => null, 'remember_token' => null, 'created_at' => '2026-09-02 12:40:50', 'updated_at' => '2026-09-02 12:40:50'],
            ['id' => 21, 'role_id' => 2, 'name' => 'contoh user', 'email' => 'admin@gamevault.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567890', 'address' => 'Jl. Merdeka No. 1, Jakarta', 'remember_token' => 'Bx6NUkt9NIwUf1cSGS1mADJqrbfsMu693agiJ3uculMjV4DPmMQNTo2HwC8i', 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-17 04:34:05'],
            ['id' => 22, 'role_id' => 1, 'name' => 'Budi Santoso', 'email' => 'budi@gamevault.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567891', 'address' => 'Jl. Sudirman No. 45, Jakarta', 'remember_token' => 'ehDBTXH7oi4YB87BaX5zcYGd5KDCQJZr6mRMLa0NkkbF3QDcOXBoIpAFCBLw', 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-02 12:43:28'],
            ['id' => 23, 'role_id' => 1, 'name' => 'Siti Rahmawati', 'email' => 'siti@gamevault.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567892', 'address' => 'Jl. Gatot Subroto No. 12, Jakarta', 'remember_token' => null, 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-02 12:43:28'],
            ['id' => 24, 'role_id' => 1, 'name' => 'Andi Pratama', 'email' => 'andi@example.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567893', 'address' => 'Jl. Kuningan No. 7, Jakarta', 'remember_token' => 'ilul68INk1ceDjS43E2ww5PPXPS3aDF3epcJbVntSgExp5uFDgK0aOIUhbVx', 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-02 12:43:28'],
            ['id' => 25, 'role_id' => 1, 'name' => 'Rina Amelia', 'email' => 'rina@example.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567894', 'address' => 'Jl. Thamrin No. 22, Jakarta', 'remember_token' => null, 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-02 12:43:28'],
            ['id' => 26, 'role_id' => 1, 'name' => 'Doni Saputra', 'email' => 'doni@example.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567895', 'address' => 'Jl. Rasuna Said No. 5, Jakarta', 'remember_token' => null, 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-02 12:43:28'],
            ['id' => 27, 'role_id' => 1, 'name' => 'Dewi Lestari', 'email' => 'dewi@example.test', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => '081234567896', 'address' => 'Jl. Mampang No. 15, Jakarta', 'remember_token' => null, 'created_at' => '2026-09-02 12:43:28', 'updated_at' => '2026-09-02 12:43:28'],
            ['id' => 28, 'role_id' => 3, 'name' => 'abid cekut', 'email' => 'abid@gmail.com', 'email_verified_at' => null, 'password' => '$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK', 'phone' => null, 'address' => null, 'remember_token' => null, 'created_at' => '2026-09-17 03:47:22', 'updated_at' => '2026-09-17 03:47:22'],
        ]);
    }
}
