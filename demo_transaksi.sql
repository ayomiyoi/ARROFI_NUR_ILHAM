-- ============================================================
-- Demo COMMIT dan ROLLBACK (untuk laporan praktik UKK)
-- Jalankan: mysql -u root latihan_ukk < demo_transaksi.sql
-- File ini hanya membuat data percobaan lalu menghapusnya lagi.
-- ============================================================

-- 1) ROLLBACK: perubahan dibatalkan, data kembali seperti semula.
START TRANSACTION;

INSERT INTO categories (name, slug, description, created_at, updated_at)
VALUES ('Uji Rollback', 'uji-rollback', 'data percobaan', NOW(), NOW());

SELECT COUNT(*) AS jumlah_sebelum_rollback FROM categories WHERE slug = 'uji-rollback';

ROLLBACK;

SELECT COUNT(*) AS jumlah_setelah_rollback FROM categories WHERE slug = 'uji-rollback';

-- 2) COMMIT: perubahan disimpan permanen.
START TRANSACTION;

INSERT INTO categories (name, slug, description, created_at, updated_at)
VALUES ('Uji Commit', 'uji-commit', 'data percobaan', NOW(), NOW());

COMMIT;

SELECT COUNT(*) AS jumlah_setelah_commit FROM categories WHERE slug = 'uji-commit';

-- Bersihkan data percobaan.
DELETE FROM categories WHERE slug = 'uji-commit';
