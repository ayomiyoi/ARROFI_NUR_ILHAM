# Aplikasi Peminjaman Alat

Aplikasi web peminjaman alat/barang untuk praktik **UKK RPL**.
Pengguna mengajukan peminjaman, petugas menyetujui dan menyerahkan barang, lalu mencatat pengembalian beserta denda keterlambatan. Admin mengelola data master dan melihat laporan.

- Framework: Laravel (PHP 8.3), Blade + Bootstrap 5 (template Sneat), MySQL (`latihan_ukk`)
- Dokumentasi lengkap (ERD, flowchart, pseudocode, skenario uji): **[DOKUMENTASI_UKK.md](DOKUMENTASI_UKK.md)**
- Akun demo (password `password`): `budi@gamevault.test` (admin), `andi@example.test` (petugas), `arrofiryanto@gmail.com` (pengguna)

---

## Cara Menjalankan

```bash
composer install
npm install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
npm run build
php artisan serve
```

Atau memakai file dump database:

```bash
mysql -u root -e "CREATE DATABASE latihan_ukk"
mysql -u root latihan_ukk < database_peminjaman_alat.sql
```

---

## Perintah CLI (Artisan) yang Dipakai

### 1. Membuat model + migration

```bash
php artisan make:model Role -m
php artisan make:model Category -m
php artisan make:model Room -m
php artisan make:model Console -m
php artisan make:model Transaction -m
php artisan make:model ReturnItems -m
php artisan make:model ActivityLog -m
php artisan make:migration add_role_fields_to_users_table --table=users
```

Catatan: tabel pengembalian bernama `returns` (kata `return` termasuk kata kunci PHP), jadi modelnya `ReturnItems` dengan:

```php
protected $table = 'returns';
```

### 2. Membuat controller

```bash
php artisan make:controller AuthController
php artisan make:controller DashboardController
php artisan make:controller CategoryController --resource
php artisan make:controller ConsoleController --resource
php artisan make:controller UserController --resource
php artisan make:controller TransactionController
php artisan make:controller ApprovalController
php artisan make:controller ReturnController
php artisan make:controller ReportController
php artisan make:controller ActivityLogController
```

Opsi `--resource` membuat method `index`, `create`, `store`, `edit`, `update`, `destroy` sekaligus.

### 3. Membuat seeder

```bash
php artisan make:seeder RoleSeeder
php artisan make:seeder UserSeeder
php artisan make:seeder CategorySeeder
php artisan make:seeder RoomSeeder
php artisan make:seeder ConsoleSeeder
php artisan make:seeder TransactionSeeder
php artisan make:seeder ReturnSeeder
php artisan make:seeder ActivityLogSeeder
```

### 4. Membuat factory (data palsu untuk pengujian)

```bash
php artisan make:factory CategoryFactory --model=Category
php artisan make:factory ConsoleFactory --model=Console
php artisan make:factory TransactionFactory --model=Transaction
php artisan make:factory UserFactory --model=User
```

### 5. Membuat file tes (Pest)

```bash
php artisan make:test --pest AuthTest
php artisan make:test --pest DashboardTest
php artisan make:test --pest CategoryTest
php artisan make:test --pest ConsoleTest
php artisan make:test --pest UserTest
php artisan make:test --pest TransactionTest
php artisan make:test --pest ApprovalTest
php artisan make:test --pest ReturnTest
php artisan make:test --pest ActivityLogTest
php artisan make:test --pest ReportTest
php artisan make:test --pest SearchTest
php artisan make:test --pest ExportTest
```

### 6. Membuat view

```bash
php artisan make:view auth.login
php artisan make:view dashboard.admin
php artisan make:view categories.index
php artisan make:view partials.badge-status
```

### 7. Menjalankan database

```bash
php artisan migrate              # menjalankan migration
php artisan migrate --seed       # migration + seeder
php artisan db:seed              # menjalankan semua seeder
php artisan db:seed --class=RoleSeeder   # seeder tertentu saja
php artisan migrate:rollback     # membatalkan batch migration terakhir
```

### 8. Memeriksa route dan konfigurasi

```bash
php artisan route:list
php artisan route:list --path=laporan
php artisan config:show app.name
php artisan config:clear
php artisan list
```

### 9. Menjalankan aplikasi dan build tampilan

```bash
php artisan serve                       # http://127.0.0.1:8000
php artisan serve --port=8001           # ganti port
composer run dev                        # server + vite + queue sekaligus
npm run dev                             # asset mode development
npm run build                           # asset mode produksi
```

### 10. Pengujian dan perapian kode

```bash
php artisan test --compact                       # seluruh tes
php artisan test --compact tests/Feature/ReturnTest.php
php artisan test --filter=nama_tes
vendor/bin/pint                                  # rapikan format kode PHP
vendor/bin/pint --dirty                          # hanya file yang berubah
```

### 11. Database mentah (MySQL via CLI)

```bash
mysql -u root latihan_ukk < objek_database.sql           # function, procedure, trigger
mysql -u root latihan_ukk < demo_transaksi.sql           # demo COMMIT dan ROLLBACK
mysqldump -u root --routines --triggers latihan_ukk > database_peminjaman_alat.sql   # dump lengkap
mysql -u root -e "SELECT * FROM transactions;"           # query langsung
```

Pada Windows PowerShell, arahkan hasil dump memakai opsi `--result-file` agar berkas tersimpan rapi (bukan UTF-16):

```powershell
mysqldump -u root --routines --triggers --result-file="database_peminjaman_alat.sql" latihan_ukk
```

### 12. Perintah bawaan lain

```bash
php artisan key:generate                 # membuat APP_KEY
php artisan storage:link                 # symlink folder storage
php artisan tinker                       # console PHP interaktif
php artisan optimize:clear               # bersihkan semua cache
php artisan about                        # ringkasan lingkungan aplikasi
```

---

## Fitur

| Fitur | Peran |
| --- | --- |
| Ajukan peminjaman, batalkan pengajuan, lihat detail | Pengguna |
| Persetujuan, penolakan, serah terima objek | Petugas, Admin |
| Pencatatan pengembalian + denda otomatis | Petugas, Admin |
| Laporan, cetak, export CSV | Petugas, Admin |
| Log aktivitas | Admin |
| CRUD kategori, objek, dan user | Admin |
| Grafik peminjaman 6 bulan + objek terpopuler | Admin |

---

## Tes

```bash
php artisan test --compact
```

Hasil terakhir: **140 tes, 599 assertion, semuanya lolos**.
