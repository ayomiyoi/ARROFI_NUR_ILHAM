-- ============================================================
-- Objek Database (function, procedure, trigger)
-- Aplikasi Peminjaman Alat - latihan UKK RPL
-- Jalankan sekali setelah `php artisan migrate` dan seeder:
--   mysql -u root latihan_ukk < objek_database.sql
-- Aman dijalankan berulang karena ada DROP ... IF EXISTS.
-- ============================================================

DROP FUNCTION IF EXISTS fn_denda_telat;
DROP PROCEDURE IF EXISTS sp_ringkasan_peminjaman;
DROP PROCEDURE IF EXISTS sp_pinjam_objek;
DROP TRIGGER IF EXISTS trg_transactions_fine_non_negative;
DROP TRIGGER IF EXISTS trg_transactions_kode_wajib;

DELIMITER $$

-- FUNCTION: menghitung denda keterlambatan.
-- Aturan aplikasi: 50% x harga per hari x jumlah hari terlambat.
CREATE FUNCTION fn_denda_telat(
    p_tanggal_jatuh_tempo DATE,
    p_tanggal_kembali DATE,
    p_harga_per_hari DECIMAL(10,2)
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_hari_terlambat INT DEFAULT 0;

    IF p_tanggal_kembali > p_tanggal_jatuh_tempo THEN
        SET v_hari_terlambat = DATEDIFF(p_tanggal_kembali, p_tanggal_jatuh_tempo);
    END IF;

    RETURN v_hari_terlambat * p_harga_per_hari * 0.5;
END$$

-- PROCEDURE: ringkasan laporan peminjaman pada rentang tanggal.
CREATE PROCEDURE sp_ringkasan_peminjaman(
    IN p_dari DATE,
    IN p_sampai DATE
)
BEGIN
    SELECT COUNT(*) AS jumlah_transaksi,
           IFNULL(SUM(total_price), 0) AS total_pendapatan,
           IFNULL(SUM(fine), 0) AS total_denda
    FROM transactions
    WHERE rental_date BETWEEN p_dari AND p_sampai;
END$$

-- PROCEDURE: serah terima objek (kurangi stok lalu ubah status transaksi).
-- Menolak proses bila stok habis dengan pesan error yang jelas.
CREATE PROCEDURE sp_pinjam_objek(IN p_transaction_id BIGINT)
BEGIN
    DECLARE v_console_id BIGINT;
    DECLARE v_stock INT;

    SELECT console_id INTO v_console_id
    FROM transactions
    WHERE id = p_transaction_id;

    SELECT stock INTO v_stock
    FROM consoles
    WHERE id = v_console_id;

    IF v_stock < 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stok objek habis, tidak bisa dipinjam';
    END IF;

    UPDATE consoles SET stock = stock - 1 WHERE id = v_console_id;

    UPDATE transactions SET status = 'borrowed' WHERE id = p_transaction_id;
END$$

-- TRIGGER: menjaga denda transaksi tidak pernah minus.
CREATE TRIGGER trg_transactions_fine_non_negative
BEFORE UPDATE ON transactions
FOR EACH ROW
BEGIN
    IF NEW.fine < 0 THEN
        SET NEW.fine = 0;
    END IF;
END$$

-- TRIGGER: menolak transaksi baru tanpa kode peminjaman.
CREATE TRIGGER trg_transactions_kode_wajib
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.rental_code IS NULL OR NEW.rental_code = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kode peminjaman wajib diisi';
    END IF;
END$$

DELIMITER ;
