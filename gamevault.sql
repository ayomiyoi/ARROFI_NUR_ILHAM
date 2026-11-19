-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2026 at 11:22 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamevault`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `subject_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `subject_type`, `subject_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 20, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:40:50', '2026-09-02 05:40:50'),
(2, 20, 'create', 'Transaksi GV-20260902-0001 dibuat', 'App\\Models\\Transaction', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:45:28', '2026-09-02 05:45:28'),
(3, 21, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:46:33', '2026-09-02 05:46:33'),
(4, 20, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:50:47', '2026-09-02 05:50:47'),
(5, 20, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:51:16', '2026-09-02 05:51:16'),
(6, 21, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:51:27', '2026-09-02 05:51:27'),
(7, 21, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:51:31', '2026-09-02 05:51:31'),
(8, 21, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:51:36', '2026-09-02 05:51:36'),
(9, 22, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:52:28', '2026-09-02 05:52:28'),
(10, 22, 'approve', 'Transaksi GV-20260902-0001 disetujui', 'App\\Models\\Transaction', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:52:57', '2026-09-02 05:52:57'),
(11, 20, 'create', 'Transaksi GV-20260902-0002 dibuat', 'App\\Models\\Transaction', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:54:26', '2026-09-02 05:54:26'),
(12, 22, 'approve', 'Transaksi GV-20260902-0002 disetujui', 'App\\Models\\Transaction', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:54:51', '2026-09-02 05:54:51'),
(13, 27, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-02 05:56:22', '2026-09-02 05:56:22'),
(14, 28, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-16 20:47:22', '2026-09-16 20:47:22'),
(15, 28, 'create', 'Transaksi GV-20260917-0001 dibuat', 'App\\Models\\Transaction', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-16 20:48:00', '2026-09-16 20:48:00'),
(16, 21, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 20:49:15', '2026-09-16 20:49:15'),
(17, 21, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 20:50:05', '2026-09-16 20:50:05'),
(18, 22, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 20:50:16', '2026-09-16 20:50:16'),
(19, 24, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 20:57:23', '2026-09-16 20:57:23'),
(20, 24, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:11:35', '2026-09-16 21:11:35'),
(21, 24, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:26:34', '2026-09-16 21:26:34'),
(22, 22, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:26:59', '2026-09-16 21:26:59'),
(23, 21, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:27:08', '2026-09-16 21:27:08'),
(24, 21, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:27:11', '2026-09-16 21:27:11'),
(25, 22, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:27:35', '2026-09-16 21:27:35'),
(26, 21, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:28:41', '2026-09-16 21:28:41'),
(27, 22, 'create', 'Kategori naowdjaowdak ditambahkan', 'App\\Models\\Category', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:29:34', '2026-09-16 21:29:34'),
(28, 22, 'update', 'Kategori qqqqqqqqqqqqqq diperbarui', 'App\\Models\\Category', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:29:47', '2026-09-16 21:29:47'),
(29, 22, 'update', 'Kategori qqqqqqqqqqqqqq diperbarui', 'App\\Models\\Category', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:29:47', '2026-09-16 21:29:47'),
(30, 22, 'update', 'Kategori qqqqqqqqqqqqqq diperbarui', 'App\\Models\\Category', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:29:48', '2026-09-16 21:29:48'),
(31, 22, 'delete', 'Kategori qqqqqqqqqqqqqq dihapus', 'App\\Models\\Category', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:29:57', '2026-09-16 21:29:57'),
(32, 22, 'create', 'Konsol PS4 ori ditambahkan', 'App\\Models\\Console', 19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:30:31', '2026-09-16 21:30:31'),
(33, 22, 'update', 'Konsol PS4 original diperbarui', 'App\\Models\\Console', 19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:30:51', '2026-09-16 21:30:51'),
(34, 22, 'delete', 'Konsol PS4 original dihapus', 'App\\Models\\Console', 19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:31:00', '2026-09-16 21:31:00'),
(35, 22, 'create', 'Pengguna ayami ditambahkan', 'App\\Models\\User', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:31:29', '2026-09-16 21:31:29'),
(36, 22, 'update', 'Pengguna ayam jago diperbarui', 'App\\Models\\User', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:31:44', '2026-09-16 21:31:44'),
(37, 22, 'delete', 'Pengguna ayam jago dihapus', 'App\\Models\\User', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:31:51', '2026-09-16 21:31:51'),
(38, 22, 'approve', 'Transaksi GV-20260917-0001 disetujui', 'App\\Models\\Transaction', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:32:15', '2026-09-16 21:32:15'),
(39, 22, 'cancel', 'Transaksi GV-20260902-0002 dibatalkan', 'App\\Models\\Transaction', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:32:54', '2026-09-16 21:32:54'),
(40, 22, 'delete', 'Transaksi dihapus', 'App\\Models\\Transaction', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:33:04', '2026-09-16 21:33:04'),
(41, 22, 'borrow', 'Transaksi GV-20260917-0001 diambil', 'App\\Models\\Transaction', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:33:18', '2026-09-16 21:33:18'),
(42, 22, 'return', 'Transaksi GV-20260917-0001 dikembalikan', 'App\\Models\\Transaction', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:33:36', '2026-09-16 21:33:36'),
(43, 21, 'create', 'Transaksi GV-20260917-0002 dibuat', 'App\\Models\\Transaction', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:34:48', '2026-09-16 21:34:48'),
(44, 22, 'approve', 'Transaksi GV-20260917-0002 disetujui', 'App\\Models\\Transaction', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:35:04', '2026-09-16 21:35:04'),
(45, 22, 'borrow', 'Transaksi GV-20260917-0002 diambil', 'App\\Models\\Transaction', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:35:08', '2026-09-16 21:35:08'),
(46, 22, 'return', 'Transaksi GV-20260917-0002 dikembalikan', 'App\\Models\\Transaction', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:35:14', '2026-09-16 21:35:14'),
(47, 21, 'create', 'Transaksi GV-20260917-0003 dibuat', 'App\\Models\\Transaction', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:35:46', '2026-09-16 21:35:46'),
(48, 21, 'cancel', 'Transaksi GV-20260917-0003 dibatalkan', 'App\\Models\\Transaction', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 21:36:04', '2026-09-16 21:36:04'),
(49, 28, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-16 21:36:29', '2026-09-16 21:36:29'),
(50, 25, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-16 21:36:38', '2026-09-16 21:36:38'),
(51, 21, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 19:24:52', '2026-09-21 19:24:52'),
(52, 20, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 19:27:22', '2026-09-21 19:27:22'),
(53, 20, 'create', 'Transaksi GV-20260922-0001 dibuat', 'App\\Models\\Transaction', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 19:28:51', '2026-09-21 19:28:51'),
(54, 20, 'logout', 'User logged out', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-21 19:29:34', '2026-09-21 19:29:34'),
(55, 20, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-09-25 04:00:22', '2026-09-25 04:00:22'),
(56, 20, 'login', 'User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:25:00', '2026-10-06 23:25:00'),
(57, 20, 'create', 'Transaksi GV-20261007-0001 dibuat', 'App\\Models\\Transaction', 16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 23:25:19', '2026-10-06 23:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'PlayStation 5', 'ps5', 'Sony PlayStation 5 dan aksesorisnya', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(2, 'PlayStation 4', 'ps4', 'Sony PlayStation 4 dan aksesorisnya', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(3, 'Xbox Series X/S', 'xbox-series', 'Microsoft Xbox Series X dan Series S', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(4, 'Xbox One', 'xbox-one', 'Microsoft Xbox One', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(5, 'Nintendo Switch', 'nintendo-switch', 'Nintendo Switch dan Switch OLED', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(6, 'PC Gaming', 'pc-gaming', 'PC Gaming rig dan laptop gaming', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(7, 'VR Headset', 'vr', 'Virtual Reality headsets', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(8, 'Aksesoris Gaming', 'aksesoris', 'Controller, steering wheel, dan aksesoris lainnya', NULL, '2026-09-02 05:43:25', '2026-09-02 05:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `consoles`
--

CREATE TABLE `consoles` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED DEFAULT NULL,
  `desk_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `price_per_hour` decimal(10,2) DEFAULT NULL COMMENT 'Tarif per jam; null = hanya support sewa harian',
  `deposit` decimal(10,2) NOT NULL,
  `stock` int UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('available','rented','maintenance','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `condition` enum('excellent','good','minor_damage','needs_repair','broken') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'good',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consoles`
--

INSERT INTO `consoles` (`id`, `category_id`, `room_id`, `desk_number`, `name`, `description`, `image`, `price_per_day`, `price_per_hour`, `deposit`, `stock`, `status`, `condition`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'D01', 'PS5 Standard Edition', 'Sony PlayStation 5 Standard Edition dengan controller DualSense', NULL, '50000.00', NULL, '500000.00', 2, 'maintenance', 'broken', '2026-09-02 05:43:25', '2026-09-16 21:33:36'),
(2, 1, 2, 'D02', 'PS5 Digital Edition', 'Sony PlayStation 5 Digital Edition tanpa disc drive', NULL, '45000.00', NULL, '450000.00', 2, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-16 21:35:14'),
(3, 1, 3, 'D01', 'PS5 Pro (VIP)', 'Sony PlayStation 5 Pro di ruang VIP dengan sofa premium', NULL, '80000.00', NULL, '800000.00', 1, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(4, 2, 2, 'D03', 'PS4 Slim 500GB', 'Sony PlayStation 4 Slim 500GB', NULL, '30000.00', NULL, '300000.00', 2, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(5, 2, 2, 'D04', 'PS4 Pro 1TB', 'Sony PlayStation 4 Pro 1TB dengan HDR support', NULL, '35000.00', NULL, '350000.00', 1, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(6, 3, 3, 'D02', 'Xbox Series X (VIP)', 'Microsoft Xbox Series X 1TB SSD di ruang VIP', NULL, '60000.00', NULL, '600000.00', 1, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(7, 3, NULL, NULL, 'Xbox Series S', 'Microsoft Xbox Series S 512GB SSD (all-digital) — unit bawa pulang', NULL, '40000.00', NULL, '400000.00', 3, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(8, 5, NULL, NULL, 'Nintendo Switch OLED', 'Nintendo Switch OLED Model 7 inch — unit bawa pulang', NULL, '40000.00', NULL, '400000.00', 3, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(9, 5, NULL, NULL, 'Nintendo Switch Lite', 'Nintendo Switch Lite handheld only — unit bawa pulang', NULL, '30000.00', NULL, '300000.00', 2, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(10, 6, 1, 'D01', 'PC Gaming RTX 4060 — Meja 1', 'Intel i5-13400F / RTX 4060 / 16GB RAM / 512GB SSD — Main di tempat per jam', NULL, '100000.00', '15000.00', '0.00', 1, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(11, 6, 1, 'D02', 'PC Gaming RTX 4060 — Meja 2', 'Intel i5-13400F / RTX 4060 / 16GB RAM / 512GB SSD — Main di tempat per jam', NULL, '100000.00', '15000.00', '0.00', 1, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(12, 6, 1, 'D03', 'PC Gaming RTX 4070 — Meja 3', 'Ryzen 7 / RTX 4070 / 32GB RAM / 1TB SSD — Main di tempat per jam', NULL, '150000.00', '20000.00', '0.00', 1, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(13, 6, 1, 'D04', 'PC Gaming RTX 4070 — Meja 4', 'Ryzen 7 / RTX 4070 / 32GB RAM / 1TB SSD — Main di tempat per jam', NULL, '150000.00', '20000.00', '0.00', 1, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(14, 6, 1, 'D05', 'Gaming Laptop ROG — Meja 5', 'ASUS ROG Strix G15 / Ryzen 9 / RTX 3060 / 16GB RAM — Main di tempat per jam', NULL, '120000.00', '18000.00', '0.00', 1, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(15, 7, NULL, NULL, 'Meta Quest 3', 'Meta Quest 3 VR Headset 128GB standalone — unit bawa pulang', NULL, '75000.00', NULL, '750000.00', 2, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(16, 7, NULL, NULL, 'PS VR2', 'PlayStation VR2 untuk PS5 — unit bawa pulang', NULL, '80000.00', NULL, '800000.00', 1, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(17, 8, NULL, NULL, 'DualSense Controller', 'Sony DualSense Wireless Controller untuk PS5', NULL, '15000.00', NULL, '150000.00', 6, 'available', 'excellent', '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(18, 8, NULL, NULL, 'Xbox Wireless Controller', 'Microsoft Xbox Wireless Controller untuk Xbox Series X/S & PC', NULL, '15000.00', NULL, '150000.00', 4, 'available', 'good', '2026-09-02 05:43:25', '2026-09-02 05:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_07_29_000001_create_roles_table', 1),
(5, '2026_07_29_000002_add_role_id_to_users_table', 1),
(6, '2026_07_29_000003_create_categories_table', 1),
(7, '2026_07_29_000004_create_consoles_table', 1),
(8, '2026_07_29_000005_create_transactions_table', 1),
(9, '2026_07_29_000006_create_returns_table', 1),
(10, '2026_07_29_000007_create_activity_logs_table', 1),
(11, '2026_07_30_000001_add_rental_indexes_to_transactions_table', 1),
(12, '2026_07_30_000002_create_rooms_table', 1),
(13, '2026_07_30_000003_add_hourly_billing_and_rooms', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `return_date` date NOT NULL,
  `condition` enum('excellent','good','minor_damage','needs_repair','broken') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fine` decimal(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `transaction_id`, `return_date`, `condition`, `fine`, `notes`, `created_at`, `updated_at`) VALUES
(1, 7, '2026-07-27', 'good', '0.00', 'Dikembalikan tepat waktu, kondisi baik', '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(2, 8, '2026-07-25', 'minor_damage', '100000.00', 'Terlambat 2 hari dan ada goresan di body konsol', '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(3, 12, '2026-09-17', 'broken', '300000.00', 'broken', '2026-09-16 21:33:36', '2026-09-16 21:33:36'),
(4, 13, '2026-09-17', 'excellent', '0.00', NULL, '2026-09-16 21:35:14', '2026-09-16 21:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pengguna', 'pengguna', 'Regular user who rents consoles', '2026-09-02 05:40:49', '2026-09-02 05:40:49'),
(2, 'Admin', 'admin', 'Full system access', '2026-09-02 05:42:34', '2026-09-02 05:42:34'),
(3, 'Petugas', 'petugas', 'Staff with transaction management access', '2026-09-02 05:42:34', '2026-09-02 05:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int UNSIGNED NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `room_number`, `capacity`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ruang PC Gaming', 'R01', 5, 'Ruang PC Gaming dengan 5 unit komputer high-end', 1, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(2, 'Ruang Konsol A', 'R02', 4, 'Ruang konsol PS5 dan Xbox Series', 1, '2026-09-02 05:43:25', '2026-09-02 05:43:25'),
(3, 'Ruang VIP', 'R03', 2, 'Ruang VIP untuk gaming dengan sofa premium', 1, '2026-09-02 05:43:25', '2026-09-02 05:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `rental_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `console_id` bigint UNSIGNED NOT NULL,
  `rental_type` enum('daily','hourly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily',
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `rental_date` date NOT NULL,
  `start_time` datetime DEFAULT NULL COMMENT 'Diisi untuk rental_type=hourly',
  `end_time` datetime DEFAULT NULL COMMENT 'Diisi untuk rental_type=hourly',
  `return_date` date NOT NULL,
  `total_days` int UNSIGNED NOT NULL,
  `total_hours` int UNSIGNED DEFAULT NULL COMMENT 'Total jam bermain (hourly)',
  `total_price` decimal(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `fine` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','approved','rejected','borrowed','returned','cancelled','late') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Kartu tanda pengenal penyewa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `rental_code`, `user_id`, `console_id`, `rental_type`, `approved_by`, `rental_date`, `start_time`, `end_time`, `return_date`, `total_days`, `total_hours`, `total_price`, `deposit`, `fine`, `status`, `notes`, `identification`, `created_at`, `updated_at`) VALUES
(2, 'GV-20260902-0001', 20, 1, 'daily', 22, '2026-09-02', NULL, NULL, '2026-09-03', 1, NULL, '50000.00', '500000.00', '0.00', 'approved', 'sewa bg', 'KTP', '2026-09-02 05:45:28', '2026-09-02 05:52:57'),
(3, 'GV-20260729-0001', 24, 1, 'daily', NULL, '2026-08-01', NULL, NULL, '2026-08-03', 2, NULL, '100000.00', '500000.00', '0.00', 'pending', NULL, NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(4, 'GV-20260729-0002', 25, 6, 'daily', NULL, '2026-08-02', NULL, NULL, '2026-08-05', 3, NULL, '165000.00', '550000.00', '0.00', 'pending', NULL, NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(5, 'GV-20260728-0001', 24, 10, 'daily', 22, '2026-07-30', NULL, NULL, '2026-08-01', 2, NULL, '80000.00', '400000.00', '0.00', 'approved', NULL, NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(6, 'GV-20260727-0001', 26, 3, 'daily', 23, '2026-07-27', NULL, NULL, '2026-07-31', 4, NULL, '260000.00', '650000.00', '0.00', 'borrowed', NULL, NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(7, 'GV-20260725-0001', 27, 4, 'daily', 22, '2026-07-25', NULL, NULL, '2026-07-27', 2, NULL, '60000.00', '300000.00', '0.00', 'returned', NULL, NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(8, 'GV-20260720-0001', 25, 12, 'daily', 22, '2026-07-20', NULL, NULL, '2026-07-23', 3, NULL, '300000.00', '1000000.00', '100000.00', 'late', 'Terlambat 2 hari, kena denda Rp100.000', NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(9, 'GV-20260726-0001', 24, 8, 'daily', 22, '2026-07-26', NULL, NULL, '2026-07-28', 2, NULL, '50000.00', '250000.00', '0.00', 'rejected', 'Stok sedang maintenance', NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(10, 'GV-20260724-0001', 26, 2, 'daily', NULL, '2026-07-24', NULL, NULL, '2026-07-26', 2, NULL, '90000.00', '450000.00', '0.00', 'cancelled', 'Dibatalkan oleh pemesan', NULL, '2026-09-02 05:53:20', '2026-09-02 05:53:20'),
(12, 'GV-20260917-0001', 28, 1, 'daily', 22, '2026-09-17', NULL, NULL, '2026-09-18', 1, 1, '50000.00', '500000.00', '300000.00', 'returned', 'nyewo sek lek', 'KTP', '2026-09-16 20:48:00', '2026-09-16 21:33:36'),
(13, 'GV-20260917-0002', 21, 2, 'daily', 22, '2026-09-17', NULL, NULL, '2026-09-18', 1, 1, '45000.00', '450000.00', '0.00', 'returned', 'sdfghjkl;', 'KTP', '2026-09-16 21:34:48', '2026-09-16 21:35:14'),
(14, 'GV-20260917-0003', 21, 2, 'daily', NULL, '2026-09-17', NULL, NULL, '2026-09-18', 1, 1, '45000.00', '450000.00', '0.00', 'cancelled', NULL, 'KTP', '2026-09-16 21:35:46', '2026-09-16 21:36:04'),
(15, 'GV-20260922-0001', 20, 3, 'daily', NULL, '2026-09-22', NULL, NULL, '2026-09-23', 1, 1, '80000.00', '800000.00', '0.00', 'pending', 'bb', 'KTP', '2026-09-21 19:28:51', '2026-09-21 19:28:51'),
(16, 'GV-20261007-0001', 20, 2, 'daily', NULL, '2026-10-07', NULL, NULL, '2026-10-08', 1, NULL, '45000.00', '450000.00', '0.00', 'pending', NULL, 'KTP', '2026-10-06 23:25:19', '2026-10-06 23:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(20, 1, 'Arrofi Nur Ilham Fathoni Ryanto', 'arrofiryanto@gmail.com', NULL, '$2y$12$ttUVs5qwkz.3f.XSSYecZ.ew85vJDCUigFm9VPXxIxvD2aSbRdTk2', NULL, NULL, NULL, '2026-09-02 05:40:50', '2026-09-02 05:40:50'),
(21, 1, 'contoh user', 'admin@gamevault.test', NULL, '$2y$12$9gq5fWS1kBR5V3OxjFEidudElYWCAqt8fdIjJBDcIHELpPT3zT0fq', '081234567890', 'Jl. Merdeka No. 1, Jakarta', 'Bx6NUkt9NIwUf1cSGS1mADJqrbfsMu693agiJ3uculMjV4DPmMQNTo2HwC8i', '2026-09-02 05:43:28', '2026-09-16 21:34:05'),
(22, 2, 'Budi Santoso', 'budi@gamevault.test', NULL, '$2y$12$sIy1iOOl15KLE9H/if75UOi3u/kCjLtnftqjh6S806f6Ke52Bbf56', '081234567891', 'Jl. Sudirman No. 45, Jakarta', 'ehDBTXH7oi4YB87BaX5zcYGd5KDCQJZr6mRMLa0NkkbF3QDcOXBoIpAFCBLw', '2026-09-02 05:43:28', '2026-09-02 05:43:28'),
(23, 2, 'Siti Rahmawati', 'siti@gamevault.test', NULL, '$2y$12$Y2fgbKI7a6t9xeb5U.l3qeCd2Sn6XFGcqv8oO8QrINHzH.o1AbHw2', '081234567892', 'Jl. Gatot Subroto No. 12, Jakarta', NULL, '2026-09-02 05:43:28', '2026-09-02 05:43:28'),
(24, 3, 'Andi Pratama', 'andi@example.test', NULL, '$2y$12$XLz1CFUyu3JTzArSZTdYiOQTKq9qB8YV3VhL5bdIMhosSou4zQxhq', '081234567893', 'Jl. Kuningan No. 7, Jakarta', 'ilul68INk1ceDjS43E2ww5PPXPS3aDF3epcJbVntSgExp5uFDgK0aOIUhbVx', '2026-09-02 05:43:28', '2026-09-02 05:43:28'),
(25, 3, 'Rina Amelia', 'rina@example.test', NULL, '$2y$12$zHBSA5dNt/WjYqbvasdRMe3PIcirxxI5o8tMs3WnRq12qU7FgzPJ.', '081234567894', 'Jl. Thamrin No. 22, Jakarta', NULL, '2026-09-02 05:43:28', '2026-09-02 05:43:28'),
(26, 3, 'Doni Saputra', 'doni@example.test', NULL, '$2y$12$Fno5DGeHnWfgaVpKgbwl3eHe3ccNSF3VPMH9Q5D1goS5FcOP/puma', '081234567895', 'Jl. Rasuna Said No. 5, Jakarta', NULL, '2026-09-02 05:43:28', '2026-09-02 05:43:28'),
(27, 3, 'Dewi Lestari', 'dewi@example.test', NULL, '$2y$12$xvUUxIgve8HhA9LDccXJUu2vEZJczQH2nN3Mg/.VrprZIOxN.1ElG', '081234567896', 'Jl. Mampang No. 15, Jakarta', NULL, '2026-09-02 05:43:28', '2026-09-02 05:43:28'),
(28, 1, 'abid cekut', 'abid@gmail.com', NULL, '$2y$12$xRMvTwaki.if3flJULLQa.X2pHVIFjcCNtNOlFpp4/.UdOhhann0W', NULL, NULL, NULL, '2026-09-16 20:47:22', '2026-09-16 20:47:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_index` (`user_id`),
  ADD KEY `activity_logs_action_index` (`action`),
  ADD KEY `activity_logs_subject_type_subject_id_index` (`subject_type`,`subject_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `consoles`
--
ALTER TABLE `consoles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consoles_status_index` (`status`),
  ADD KEY `consoles_category_id_index` (`category_id`),
  ADD KEY `consoles_room_id_index` (`room_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `returns_transaction_id_unique` (`transaction_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rooms_room_number_unique` (`room_number`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_rental_code_unique` (`rental_code`),
  ADD KEY `transactions_user_id_index` (`user_id`),
  ADD KEY `transactions_console_id_index` (`console_id`),
  ADD KEY `transactions_approved_by_index` (`approved_by`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_user_console_status_index` (`user_id`,`console_id`,`status`),
  ADD KEY `transactions_status_return_date_index` (`status`,`return_date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `consoles`
--
ALTER TABLE `consoles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `consoles`
--
ALTER TABLE `consoles`
  ADD CONSTRAINT `consoles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consoles_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_console_id_foreign` FOREIGN KEY (`console_id`) REFERENCES `consoles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
