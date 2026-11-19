-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: latihan_ukk
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `subject_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_index` (`user_id`),
  KEY `activity_logs_action_index` (`action`),
  KEY `activity_logs_subject_type_subject_id_index` (`subject_type`,`subject_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,20,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:40:50','2026-09-02 05:40:50'),(2,20,'create','Transaksi GV-20260902-0001 dibuat','App\\Models\\Transaction',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:45:28','2026-09-02 05:45:28'),(3,21,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:46:33','2026-09-02 05:46:33'),(4,20,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:50:47','2026-09-02 05:50:47'),(5,20,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:51:16','2026-09-02 05:51:16'),(6,21,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:51:27','2026-09-02 05:51:27'),(7,21,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:51:31','2026-09-02 05:51:31'),(8,21,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:51:36','2026-09-02 05:51:36'),(9,22,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:52:28','2026-09-02 05:52:28'),(10,22,'approve','Transaksi GV-20260902-0001 disetujui','App\\Models\\Transaction',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:52:57','2026-09-02 05:52:57'),(11,20,'create','Transaksi GV-20260902-0002 dibuat','App\\Models\\Transaction',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:54:26','2026-09-02 05:54:26'),(12,22,'approve','Transaksi GV-20260902-0002 disetujui','App\\Models\\Transaction',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:54:51','2026-09-02 05:54:51'),(13,27,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-02 05:56:22','2026-09-02 05:56:22'),(14,28,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-16 20:47:22','2026-09-16 20:47:22'),(15,28,'create','Transaksi GV-20260917-0001 dibuat','App\\Models\\Transaction',12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-16 20:48:00','2026-09-16 20:48:00'),(16,21,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 20:49:15','2026-09-16 20:49:15'),(17,21,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 20:50:05','2026-09-16 20:50:05'),(18,22,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 20:50:16','2026-09-16 20:50:16'),(19,24,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 20:57:23','2026-09-16 20:57:23'),(20,24,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:11:35','2026-09-16 21:11:35'),(21,24,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:26:34','2026-09-16 21:26:34'),(22,22,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:26:59','2026-09-16 21:26:59'),(23,21,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:27:08','2026-09-16 21:27:08'),(24,21,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:27:11','2026-09-16 21:27:11'),(25,22,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:27:35','2026-09-16 21:27:35'),(26,21,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:28:41','2026-09-16 21:28:41'),(27,22,'create','Kategori naowdjaowdak ditambahkan','App\\Models\\Category',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:29:34','2026-09-16 21:29:34'),(28,22,'update','Kategori qqqqqqqqqqqqqq diperbarui','App\\Models\\Category',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:29:47','2026-09-16 21:29:47'),(29,22,'update','Kategori qqqqqqqqqqqqqq diperbarui','App\\Models\\Category',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:29:47','2026-09-16 21:29:47'),(30,22,'update','Kategori qqqqqqqqqqqqqq diperbarui','App\\Models\\Category',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:29:48','2026-09-16 21:29:48'),(31,22,'delete','Kategori qqqqqqqqqqqqqq dihapus','App\\Models\\Category',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:29:57','2026-09-16 21:29:57'),(32,22,'create','Konsol PS4 ori ditambahkan','App\\Models\\Console',19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:30:31','2026-09-16 21:30:31'),(33,22,'update','Konsol PS4 original diperbarui','App\\Models\\Console',19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:30:51','2026-09-16 21:30:51'),(34,22,'delete','Konsol PS4 original dihapus','App\\Models\\Console',19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:31:00','2026-09-16 21:31:00'),(35,22,'create','Pengguna ayami ditambahkan','App\\Models\\User',29,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:31:29','2026-09-16 21:31:29'),(36,22,'update','Pengguna ayam jago diperbarui','App\\Models\\User',29,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:31:44','2026-09-16 21:31:44'),(37,22,'delete','Pengguna ayam jago dihapus','App\\Models\\User',29,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:31:51','2026-09-16 21:31:51'),(38,22,'approve','Transaksi GV-20260917-0001 disetujui','App\\Models\\Transaction',12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:32:15','2026-09-16 21:32:15'),(39,22,'cancel','Transaksi GV-20260902-0002 dibatalkan','App\\Models\\Transaction',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:32:54','2026-09-16 21:32:54'),(40,22,'delete','Transaksi dihapus','App\\Models\\Transaction',11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:33:04','2026-09-16 21:33:04'),(41,22,'borrow','Transaksi GV-20260917-0001 diambil','App\\Models\\Transaction',12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:33:18','2026-09-16 21:33:18'),(42,22,'return','Transaksi GV-20260917-0001 dikembalikan','App\\Models\\Transaction',12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:33:36','2026-09-16 21:33:36'),(43,21,'create','Transaksi GV-20260917-0002 dibuat','App\\Models\\Transaction',13,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:34:48','2026-09-16 21:34:48'),(44,22,'approve','Transaksi GV-20260917-0002 disetujui','App\\Models\\Transaction',13,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:35:04','2026-09-16 21:35:04'),(45,22,'borrow','Transaksi GV-20260917-0002 diambil','App\\Models\\Transaction',13,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:35:08','2026-09-16 21:35:08'),(46,22,'return','Transaksi GV-20260917-0002 dikembalikan','App\\Models\\Transaction',13,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:35:14','2026-09-16 21:35:14'),(47,21,'create','Transaksi GV-20260917-0003 dibuat','App\\Models\\Transaction',14,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:35:46','2026-09-16 21:35:46'),(48,21,'cancel','Transaksi GV-20260917-0003 dibatalkan','App\\Models\\Transaction',14,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36','2026-09-16 21:36:04','2026-09-16 21:36:04'),(49,28,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-16 21:36:29','2026-09-16 21:36:29'),(50,25,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-16 21:36:38','2026-09-16 21:36:38'),(51,21,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-21 19:24:52','2026-09-21 19:24:52'),(52,20,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-21 19:27:22','2026-09-21 19:27:22'),(53,20,'create','Transaksi GV-20260922-0001 dibuat','App\\Models\\Transaction',15,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-21 19:28:51','2026-09-21 19:28:51'),(54,20,'logout','User logged out',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','2026-09-21 19:29:34','2026-09-21 19:29:34'),(55,20,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','2026-09-25 04:00:22','2026-09-25 04:00:22'),(56,20,'login','User logged in',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','2026-10-06 23:25:00','2026-10-06 23:25:00'),(57,20,'create','Transaksi GV-20261007-0001 dibuat','App\\Models\\Transaction',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','2026-10-06 23:25:19','2026-10-06 23:25:19');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-boost:mcp:database-schema:mysql:activity_logs:0:0:0:1','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:13:\"activity_logs\";a:5:{s:7:\"columns\";a:10:{s:2:\"id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:7:\"user_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:6:\"action\";a:4:{s:4:\"type\";s:11:\"varchar(50)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"description\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:12:\"subject_type\";a:4:{s:4:\"type\";s:12:\"varchar(100)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"subject_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"ip_address\";a:4:{s:4:\"type\";s:11:\"varchar(45)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"user_agent\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:4:{s:26:\"activity_logs_action_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:6:\"action\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:43:\"activity_logs_subject_type_subject_id_index\";a:4:{s:7:\"columns\";a:2:{i:0;s:12:\"subject_type\";i:1;s:10:\"subject_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:27:\"activity_logs_user_id_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:29:\"activity_logs_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:8:\"set null\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}',1792242622),('laravel-cache-boost:mcp:database-schema:mysql:categories:0:0:0:1','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:10:\"categories\";a:5:{s:7:\"columns\";a:7:{s:2:\"id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:4:\"name\";a:4:{s:4:\"type\";s:12:\"varchar(100)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"slug\";a:4:{s:4:\"type\";s:12:\"varchar(100)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"description\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"image\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:2:{s:22:\"categories_slug_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:4:\"slug\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:0:{}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}',1792240880),('laravel-cache-boost:mcp:database-schema:mysql:consoles:0:0:0:1','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:8:\"consoles\";a:5:{s:7:\"columns\";a:15:{s:2:\"id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:11:\"category_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"room_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"desk_number\";a:4:{s:4:\"type\";s:11:\"varchar(20)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"name\";a:4:{s:4:\"type\";s:12:\"varchar(150)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"description\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"image\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:13:\"price_per_day\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:14:\"price_per_hour\";a:5:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";s:47:\"Tarif per jam; null = hanya support sewa harian\";}s:7:\"deposit\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"stock\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";s:1:\"0\";s:14:\"auto_increment\";b:0;}s:6:\"status\";a:4:{s:4:\"type\";s:51:\"enum(\'available\',\'rented\',\'maintenance\',\'inactive\')\";s:8:\"nullable\";b:0;s:7:\"default\";s:9:\"available\";s:14:\"auto_increment\";b:0;}s:9:\"condition\";a:4:{s:4:\"type\";s:63:\"enum(\'excellent\',\'good\',\'minor_damage\',\'needs_repair\',\'broken\')\";s:8:\"nullable\";b:0;s:7:\"default\";s:4:\"good\";s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:4:{s:26:\"consoles_category_id_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:11:\"category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:22:\"consoles_room_id_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"room_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:21:\"consoles_status_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:6:\"status\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:28:\"consoles_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:11:\"category_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:10:\"categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:24:\"consoles_room_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"room_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:5:\"rooms\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:8:\"set null\";}}s:8:\"triggers\";a:1:{i:0;O:8:\"stdClass\":11:{s:7:\"Trigger\";s:31:\"trg_consoles_stock_non_negative\";s:5:\"Event\";s:6:\"UPDATE\";s:5:\"Table\";s:8:\"consoles\";s:9:\"Statement\";s:74:\"BEGIN\n    IF NEW.stock < 0 THEN\n        SET NEW.stock = 0;\n    END IF;\nEND\";s:6:\"Timing\";s:6:\"BEFORE\";s:7:\"Created\";s:22:\"2026-10-17 20:30:28.56\";s:8:\"sql_mode\";s:117:\"ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION\";s:7:\"Definer\";s:14:\"root@localhost\";s:20:\"character_set_client\";s:5:\"cp850\";s:20:\"collation_connection\";s:16:\"cp850_general_ci\";s:18:\"Database Collation\";s:18:\"utf8mb4_0900_ai_ci\";}}s:17:\"check_constraints\";a:0:{}}}}',1792243959),('laravel-cache-boost:mcp:database-schema:mysql:returns:0:0:0:1','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:7:\"returns\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:14:\"transaction_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"return_date\";a:4:{s:4:\"type\";s:4:\"date\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"condition\";a:4:{s:4:\"type\";s:63:\"enum(\'excellent\',\'good\',\'minor_damage\',\'needs_repair\',\'broken\')\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"fine\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";s:4:\"0.00\";s:14:\"auto_increment\";b:0;}s:5:\"notes\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:2:{s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}s:29:\"returns_transaction_id_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:14:\"transaction_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:30:\"returns_transaction_id_foreign\";s:7:\"columns\";a:1:{i:0;s:14:\"transaction_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:12:\"transactions\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}',1792242171),('laravel-cache-boost:mcp:database-schema:mysql:transactions:0:0:0:1','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:12:\"transactions\";a:5:{s:7:\"columns\";a:20:{s:2:\"id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:11:\"rental_code\";a:4:{s:4:\"type\";s:11:\"varchar(50)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"user_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"console_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"rental_type\";a:4:{s:4:\"type\";s:22:\"enum(\'daily\',\'hourly\')\";s:8:\"nullable\";b:0;s:7:\"default\";s:5:\"daily\";s:14:\"auto_increment\";b:0;}s:11:\"approved_by\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"rental_date\";a:4:{s:4:\"type\";s:4:\"date\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"start_time\";a:5:{s:4:\"type\";s:8:\"datetime\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";s:30:\"Diisi untuk rental_type=hourly\";}s:8:\"end_time\";a:5:{s:4:\"type\";s:8:\"datetime\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";s:30:\"Diisi untuk rental_type=hourly\";}s:11:\"return_date\";a:4:{s:4:\"type\";s:4:\"date\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"total_days\";a:4:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:11:\"total_hours\";a:5:{s:4:\"type\";s:12:\"int unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";s:26:\"Total jam bermain (hourly)\";}s:11:\"total_price\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"deposit\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"fine\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";s:4:\"0.00\";s:14:\"auto_increment\";b:0;}s:6:\"status\";a:4:{s:4:\"type\";s:78:\"enum(\'pending\',\'approved\',\'rejected\',\'borrowed\',\'returned\',\'cancelled\',\'late\')\";s:8:\"nullable\";b:0;s:7:\"default\";s:7:\"pending\";s:14:\"auto_increment\";b:0;}s:5:\"notes\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:14:\"identification\";a:5:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;s:7:\"comment\";s:28:\"Kartu tanda pengenal penyewa\";}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:8:{s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}s:30:\"transactions_approved_by_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:11:\"approved_by\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:29:\"transactions_console_id_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:10:\"console_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:31:\"transactions_rental_code_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:11:\"rental_code\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:25:\"transactions_status_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:6:\"status\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:37:\"transactions_status_return_date_index\";a:4:{s:7:\"columns\";a:2:{i:0;s:6:\"status\";i:1;s:11:\"return_date\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:38:\"transactions_user_console_status_index\";a:4:{s:7:\"columns\";a:3:{i:0;s:7:\"user_id\";i:1;s:10:\"console_id\";i:2;s:6:\"status\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:26:\"transactions_user_id_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}}s:12:\"foreign_keys\";a:3:{i:0;a:7:{s:4:\"name\";s:32:\"transactions_approved_by_foreign\";s:7:\"columns\";a:1:{i:0;s:11:\"approved_by\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:8:\"set null\";}i:1;a:7:{s:4:\"name\";s:31:\"transactions_console_id_foreign\";s:7:\"columns\";a:1:{i:0;s:10:\"console_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:8:\"consoles\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}i:2;a:7:{s:4:\"name\";s:28:\"transactions_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:2:{i:0;O:8:\"stdClass\":11:{s:7:\"Trigger\";s:27:\"trg_transactions_kode_wajib\";s:5:\"Event\";s:6:\"INSERT\";s:5:\"Table\";s:12:\"transactions\";s:9:\"Statement\";s:163:\"BEGIN\n    IF NEW.rental_code IS NULL OR NEW.rental_code = \'\' THEN\n        SIGNAL SQLSTATE \'45000\' SET MESSAGE_TEXT = \'Kode peminjaman wajib diisi\';\n    END IF;\nEND\";s:6:\"Timing\";s:6:\"BEFORE\";s:7:\"Created\";s:22:\"2026-10-17 20:32:44.91\";s:8:\"sql_mode\";s:117:\"ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION\";s:7:\"Definer\";s:14:\"root@localhost\";s:20:\"character_set_client\";s:5:\"cp850\";s:20:\"collation_connection\";s:16:\"cp850_general_ci\";s:18:\"Database Collation\";s:18:\"utf8mb4_0900_ai_ci\";}i:1;O:8:\"stdClass\":11:{s:7:\"Trigger\";s:34:\"trg_transactions_fine_non_negative\";s:5:\"Event\";s:6:\"UPDATE\";s:5:\"Table\";s:12:\"transactions\";s:9:\"Statement\";s:72:\"BEGIN\n    IF NEW.fine < 0 THEN\n        SET NEW.fine = 0;\n    END IF;\nEND\";s:6:\"Timing\";s:6:\"BEFORE\";s:7:\"Created\";s:22:\"2026-10-17 20:32:44.86\";s:8:\"sql_mode\";s:117:\"ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION\";s:7:\"Definer\";s:14:\"root@localhost\";s:20:\"character_set_client\";s:5:\"cp850\";s:20:\"collation_connection\";s:16:\"cp850_general_ci\";s:18:\"Database Collation\";s:18:\"utf8mb4_0900_ai_ci\";}}s:17:\"check_constraints\";a:0:{}}}}',1792244003),('laravel-cache-boost:mcp:database-schema:mysql:users:0:0:0:1','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:5:\"users\";a:5:{s:7:\"columns\";a:11:{s:2:\"id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:7:\"role_id\";a:4:{s:4:\"type\";s:15:\"bigint unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"name\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"email\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:17:\"email_verified_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:8:\"password\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"phone\";a:4:{s:4:\"type\";s:11:\"varchar(20)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:7:\"address\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:14:\"remember_token\";a:4:{s:4:\"type\";s:12:\"varchar(100)\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:3:{s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}s:18:\"users_email_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:5:\"email\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:19:\"users_role_id_index\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"role_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:21:\"users_role_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"role_id\";}s:14:\"foreign_schema\";s:11:\"latihan_ukk\";s:13:\"foreign_table\";s:5:\"roles\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:9:\"no action\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}',1792241462);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'PlayStation 5','ps5','Sony PlayStation 5 dan aksesorisnya',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(2,'PlayStation 4','ps4','Sony PlayStation 4 dan aksesorisnya',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(3,'Xbox Series X/S','xbox-series','Microsoft Xbox Series X dan Series S',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(4,'Xbox One','xbox-one','Microsoft Xbox One',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(5,'Nintendo Switch','nintendo-switch','Nintendo Switch dan Switch OLED',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(6,'PC Gaming','pc-gaming','PC Gaming rig dan laptop gaming',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(7,'VR Headset','vr','Virtual Reality headsets',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(8,'Aksesoris Gaming','aksesoris','Controller, steering wheel, dan aksesoris lainnya',NULL,'2026-09-02 05:43:25','2026-09-02 05:43:25');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consoles`
--

DROP TABLE IF EXISTS `consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consoles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned DEFAULT NULL,
  `desk_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `price_per_hour` decimal(10,2) DEFAULT NULL COMMENT 'Tarif per jam; null = hanya support sewa harian',
  `deposit` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL DEFAULT '0',
  `status` enum('available','rented','maintenance','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `condition` enum('excellent','good','minor_damage','needs_repair','broken') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'good',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consoles_status_index` (`status`),
  KEY `consoles_category_id_index` (`category_id`),
  KEY `consoles_room_id_index` (`room_id`),
  CONSTRAINT `consoles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `consoles_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consoles`
--

LOCK TABLES `consoles` WRITE;
/*!40000 ALTER TABLE `consoles` DISABLE KEYS */;
INSERT INTO `consoles` VALUES (1,1,2,'D01','PS5 Standard Edition','Sony PlayStation 5 Standard Edition dengan controller DualSense',NULL,50000.00,NULL,500000.00,2,'maintenance','broken','2026-09-02 05:43:25','2026-10-17 05:59:50'),(2,1,2,'D02','PS5 Digital Edition','Sony PlayStation 5 Digital Edition tanpa disc drive',NULL,45000.00,NULL,450000.00,2,'available','excellent','2026-09-02 05:43:25','2026-10-17 06:34:46'),(3,1,3,'D01','PS5 Pro (VIP)','Sony PlayStation 5 Pro di ruang VIP dengan sofa premium',NULL,80000.00,NULL,800000.00,1,'available','excellent','2026-09-02 05:43:25','2026-10-17 06:06:54'),(4,2,2,'D03','PS4 Slim 500GB','Sony PlayStation 4 Slim 500GB',NULL,30000.00,NULL,300000.00,2,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25'),(5,2,2,'D04','PS4 Pro 1TB','Sony PlayStation 4 Pro 1TB dengan HDR support',NULL,35000.00,NULL,350000.00,1,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(6,3,3,'D02','Xbox Series X (VIP)','Microsoft Xbox Series X 1TB SSD di ruang VIP',NULL,60000.00,NULL,600000.00,1,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(7,3,NULL,NULL,'Xbox Series S','Microsoft Xbox Series S 512GB SSD (all-digital) — unit bawa pulang',NULL,40000.00,NULL,400000.00,3,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25'),(8,5,NULL,NULL,'Nintendo Switch OLED','Nintendo Switch OLED Model 7 inch — unit bawa pulang',NULL,40000.00,NULL,400000.00,3,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(9,5,NULL,NULL,'Nintendo Switch Lite','Nintendo Switch Lite handheld only — unit bawa pulang',NULL,30000.00,NULL,300000.00,2,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25'),(10,6,1,'D01','PC Gaming RTX 4060 — Meja 1','Intel i5-13400F / RTX 4060 / 16GB RAM / 512GB SSD — Main di tempat per jam',NULL,100000.00,15000.00,0.00,1,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(11,6,1,'D02','PC Gaming RTX 4060 — Meja 2','Intel i5-13400F / RTX 4060 / 16GB RAM / 512GB SSD — Main di tempat per jam',NULL,100000.00,15000.00,0.00,1,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(12,6,1,'D03','PC Gaming RTX 4070 — Meja 3','Ryzen 7 / RTX 4070 / 32GB RAM / 1TB SSD — Main di tempat per jam',NULL,150000.00,20000.00,0.00,1,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(13,6,1,'D04','PC Gaming RTX 4070 — Meja 4','Ryzen 7 / RTX 4070 / 32GB RAM / 1TB SSD — Main di tempat per jam',NULL,150000.00,20000.00,0.00,1,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25'),(14,6,1,'D05','Gaming Laptop ROG — Meja 5','ASUS ROG Strix G15 / Ryzen 9 / RTX 3060 / 16GB RAM — Main di tempat per jam',NULL,120000.00,18000.00,0.00,1,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25'),(15,7,NULL,NULL,'Meta Quest 3','Meta Quest 3 VR Headset 128GB standalone — unit bawa pulang',NULL,75000.00,NULL,750000.00,2,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(16,7,NULL,NULL,'PS VR2','PlayStation VR2 untuk PS5 — unit bawa pulang',NULL,80000.00,NULL,800000.00,1,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25'),(17,8,NULL,NULL,'DualSense Controller','Sony DualSense Wireless Controller untuk PS5',NULL,15000.00,NULL,150000.00,6,'available','excellent','2026-09-02 05:43:25','2026-09-02 05:43:25'),(18,8,NULL,NULL,'Xbox Wireless Controller','Microsoft Xbox Wireless Controller untuk Xbox Series X/S & PC',NULL,15000.00,NULL,150000.00,4,'available','good','2026-09-02 05:43:25','2026-09-02 05:43:25');
/*!40000 ALTER TABLE `consoles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_consoles_stock_non_negative` BEFORE UPDATE ON `consoles` FOR EACH ROW BEGIN
    IF NEW.stock < 0 THEN
        SET NEW.stock = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_10_17_122837_create_roles_table',1),(5,'2026_10_17_122839_create_categories_table',1),(6,'2026_10_17_122841_create_rooms_table',1),(7,'2026_10_17_122843_create_consoles_table',1),(8,'2026_10_17_122844_create_transactions_table',1),(9,'2026_10_17_122846_create_returns_table',1),(10,'2026_10_17_122848_create_activity_logs_table',1),(11,'2026_10_17_122850_add_role_fields_to_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint unsigned NOT NULL,
  `return_date` date NOT NULL,
  `condition` enum('excellent','good','minor_damage','needs_repair','broken') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fine` decimal(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `returns_transaction_id_unique` (`transaction_id`),
  CONSTRAINT `returns_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,7,'2026-07-27','good',0.00,'Dikembalikan tepat waktu, kondisi baik','2026-09-02 05:53:20','2026-09-02 05:53:20'),(2,8,'2026-07-25','minor_damage',100000.00,'Terlambat 2 hari dan ada goresan di body konsol','2026-09-02 05:53:20','2026-09-02 05:53:20'),(3,12,'2026-09-17','broken',300000.00,'broken','2026-09-16 21:33:36','2026-09-16 21:33:36'),(4,13,'2026-09-17','excellent',0.00,NULL,'2026-09-16 21:35:14','2026-09-16 21:35:14');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Pengguna','pengguna','Regular user who rents consoles','2026-09-02 05:40:49','2026-09-02 05:40:49'),(2,'Admin','admin','Full system access','2026-09-02 05:42:34','2026-09-02 05:42:34'),(3,'Petugas','petugas','Staff with transaction management access','2026-09-02 05:42:34','2026-09-02 05:42:34');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int unsigned NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_room_number_unique` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Ruang PC Gaming','R01',5,'Ruang PC Gaming dengan 5 unit komputer high-end',1,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(2,'Ruang Konsol A','R02',4,'Ruang konsol PS5 dan Xbox Series',1,'2026-09-02 05:43:25','2026-09-02 05:43:25'),(3,'Ruang VIP','R03',2,'Ruang VIP untuk gaming dengan sofa premium',1,'2026-09-02 05:43:25','2026-09-02 05:43:25');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1b71R7TbyY91BJZRzVlEgD80PcA0yjVT5RmHSsz0',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJCRTJjWk1LdnRtbjhNTjJwMG00cW1MalNxaDViQjQ4VkVqVExJMFR2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM3XC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1792244074),('4pZm6JrelFf8PZ0ahYZKrUoQ48DecEZM1iq0WhYg',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJ4UTJjZExQdjREcnoxRUxNVG12YkppZHFqMVMwY1RtQ0szZ29MRHU2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM3XC9sb2ctYWt0aXZpdGFzIiwicm91dGUiOiJsb2ctYWt0aXZpdGFzLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjIyLCJwYXNzd29yZF9oYXNoX3dlYiI6ImM4OTdiM2E5YzU5NGVlYjI3MWVhYjk4YmFiYTczZGYyNzNlZDA2ZGUzZTM2MmZlZDM3NzdlMDIwMGFjNjg4MDcifQ==',1792244090),('5iXrvGsibYmZzhZsKRtcslJPsyPhKCUeZBdxvQrF',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJRQ1R4NUhQR3RWVUYyMGZyY2VYVVJpdzloY28wN1BobHBoaEc0N3phIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTMyXC9sb2ctYWt0aXZpdGFzP2FjdGlvbj1jYW5jZWwiLCJyb3V0ZSI6ImxvZy1ha3Rpdml0YXMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjIsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792242808),('cIkikakz60jnVxFmAFDmkKFJDoNwbf5Y4bBWVoUH',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJZUDJZMFRvcGhYYWxzUmVnRkxoSktGa2NNNXAyWkg0ZjB2dmV6SU13IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTIzIiwicm91dGUiOiJkYXNoYm9hcmQifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjIsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792240795),('CKAfMqhmoThFrSCILr5OaJsrtJe349xkW13tPNhA',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJzbWJkbm9YWk1NenVMZ24xbVAwUTF1ZEx3Vm5ERHYzNWJmUVJKWUVDIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI2XC91c2VycyIsInJvdXRlIjoidXNlcnMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjIsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792241562),('dGfxkGHo57R7UDNNZtGw3To8g2AD9EOQzCu7ACzH',20,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJFOUtaU2o3SzZtUU9UQlZCUzh1dTVteXJUcndkc3BBeXh2aWhyN2dlIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI3XC90cmFuc2FjdGlvbnMiLCJyb3V0ZSI6InRyYW5zYWN0aW9ucy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyMCwicGFzc3dvcmRfaGFzaF93ZWIiOiJjODk3YjNhOWM1OTRlZWIyNzFlYWI5OGJhYmE3M2RmMjczZWQwNmRlM2UzNjJmZWQzNzc3ZTAyMDBhYzY4ODA3In0=',1792241745),('DIG5LcDKqaWWPlEUJblTGbYfSOJ5x1vvsMZEs7DS',24,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiIxTW1DdzUyM01odThmcXFVVU1lU0dCMVROOTJRNWp4YnJtVjRaaVc2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI5XC9wZXJzZXR1anVhbj9zdGF0dXM9cGVuZGluZyIsInJvdXRlIjoicGVyc2V0dWp1YW4uaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjQsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792241991),('DKU1IYQ1aGzUFclqEblTLvSYzq8E9SSGDvVxhM0R',24,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJUWmx2OWk0UW1kSERJSVJ1Z2RLNHNGTnRncHpVaElwRjFGQlNZN0xGIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM1Iiwicm91dGUiOiJkYXNoYm9hcmQifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjQsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792243682),('gN7CNcKOsapd2oUt0z4jtvQ9S6Ls75XvsDe7ytoK',24,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJaWkh6Y3JiWkVCU1hJSlJicGdod3FRS0RPVXM4eW1qZGpvMkVydFVhIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI4XC9wZXJzZXR1anVhbj9zdGF0dXM9cGVuZGluZyIsInJvdXRlIjoicGVyc2V0dWp1YW4uaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjQsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792241958),('hIj1gcps0Fso5he8oFAoLdSO65OyFsUeBRKo4Lic',20,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJHdUttNWI2QmdJQ0sxb0pwRlRhVHdFVkt0U3BoM3RTOTJxdElRcE5wIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM4XC9wZXJzZXR1anVhbiIsInJvdXRlIjoicGVyc2V0dWp1YW4uaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjAsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792244107),('kBAeV11Dhl21bDSeIkbzvZnqVZhB19gvFz2TzVLo',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiI1UDNnclhyMjhxakRlZXNwVVlmdGc0bWh2MUNDVXhFV2ZuOUk3YUlyIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9fQ==',1792240985),('kbStPzpSkbtSHpuBdvMRcZ0mYKU58yj9uk6VNTlM',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJTM296Vzc3dkgxclh4anBYdk1oTDl0Qk5oZHhZTHh2aXVhd0U1aEkwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM3XC9sb2dpbiIsInJvdXRlIjoibG9naW4ifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1792244075),('QoC9BEH3eHj920GXOVRFdyYOoVvB2A37Y08PCRZ9',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJwV0ZyU1ZuMjVicElQWE41M2VMc2d3ams4VlYzQmozZzZBZ0VKeXI2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI0XC9jYXRlZ29yaWVzIiwicm91dGUiOiJjYXRlZ29yaWVzLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjIyLCJwYXNzd29yZF9oYXNoX3dlYiI6ImM4OTdiM2E5YzU5NGVlYjI3MWVhYjk4YmFiYTczZGYyNzNlZDA2ZGUzZTM2MmZlZDM3NzdlMDIwMGFjNjg4MDcifQ==',1792241054),('QRFG7blDMBIoYnZyYvHsoBqyzwvLyCQGSNSUMSQZ',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJBZFppMnloeGQzd05wVEZ4eVhHRzJyaWNvdFlIVFpKQUFFcFplYzRIIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM0XC9jb25zb2xlcz9xPXp6eiIsInJvdXRlIjoiY29uc29sZXMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjIsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792243668),('TIY4P4QJOAPLfeCZMQRvIytsHVF3ZfKuTXvUb7Qd',20,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJ0bWdlS0VIc1V5YkFVdzh6RDBTWU52UkdGQXhUMU5OSDdjWTZxRUs1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM3XC9wZXJzZXR1anVhbiIsInJvdXRlIjoicGVyc2V0dWp1YW4uaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjAsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792244082),('TwVXzbH8nn0Jw2B3ztVKngMuU5L7hvMUCus7wW0q',24,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJYaW5qaUxEeVd6Vk5mREZocXg3bnFneHpkOEg2MTE5ZjhxS3VWdWVCIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTMzXC9sYXBvcmFuXC9jZXRhaz9kYXJpPTIwMjYtMDktMDEmc2FtcGFpPTIwMjYtMDktMzAiLCJyb3V0ZSI6ImxhcG9yYW4uY2V0YWsifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjQsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792243386),('U0Aezcz1iN2D6wQGF4tWWlwjqoo7h9sLLNgmd0Bw',24,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJIQmtySjN5SGQ4YzFvckttZUhIQlVtWU5lcld2b1lFaWRWcjRDRUltIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTMwXC9wZW5nZW1iYWxpYW4iLCJyb3V0ZSI6InBlbmdlbWJhbGlhbi5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyNCwicGFzc3dvcmRfaGFzaF93ZWIiOiJjODk3YjNhOWM1OTRlZWIyNzFlYWI5OGJhYmE3M2RmMjczZWQwNmRlM2UzNjJmZWQzNzc3ZTAyMDBhYzY4ODA3In0=',1792242414),('uupRytQRQJaLk4x2WyrmbgXpVKVlh5QLj8aeTpI2',20,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJPSE9yUEdONDhudFpxZk1JNHZlalBUem55ZXZYUEdGQUU4RUFJcFp1IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI0XC9jYXRlZ29yaWVzIiwicm91dGUiOiJjYXRlZ29yaWVzLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjIwLCJwYXNzd29yZF9oYXNoX3dlYiI6ImM4OTdiM2E5YzU5NGVlYjI3MWVhYjk4YmFiYTczZGYyNzNlZDA2ZGUzZTM2MmZlZDM3NzdlMDIwMGFjNjg4MDcifQ==',1792241059),('wxW0hvte0dlEs3VHXEVumSvvXyd2EfHwOzhMFQF3',24,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJMVWd4T3QxTlNObnNuVzZxeUxtMGtaRXJrS01XUmxSblg3MVFuQmdNIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTM3XC9sb2ctYWt0aXZpdGFzIiwicm91dGUiOiJsb2ctYWt0aXZpdGFzLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjI0LCJwYXNzd29yZF9oYXNoX3dlYiI6ImM4OTdiM2E5YzU5NGVlYjI3MWVhYjk4YmFiYTczZGYyNzNlZDA2ZGUzZTM2MmZlZDM3NzdlMDIwMGFjNjg4MDcifQ==',1792244090),('wzGuEucMZTauhryKUimuwoxYrHIqkNRjIlCYfUN3',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJKNkhuSmR1VUh1RWt4ekJwRUlTblJoODM5OU5DdmYza1lPTzhVSGZmIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTMxXC9sb2ctYWt0aXZpdGFzP3RhbmdnYWw9MjAyMC0wMS0wMSIsInJvdXRlIjoibG9nLWFrdGl2aXRhcy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyMiwicGFzc3dvcmRfaGFzaF93ZWIiOiJjODk3YjNhOWM1OTRlZWIyNzFlYWI5OGJhYmE3M2RmMjczZWQwNmRlM2UzNjJmZWQzNzc3ZTAyMDBhYzY4ODA3In0=',1792242754),('y4xp7jIcTMSbskeAEzd8n2iBiQtHvGTvv78rOdCu',22,'127.0.0.1','Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9444','eyJfdG9rZW4iOiJHbDJNVWlkTDRvd3F4TGNJbG1mZEFUSVpiOTZvcjlyaWs5Q2lBbkV2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MTI1XC9jb25zb2xlcyIsInJvdXRlIjoiY29uc29sZXMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MjIsInBhc3N3b3JkX2hhc2hfd2ViIjoiYzg5N2IzYTljNTk0ZWViMjcxZWFiOThiYWJhNzNkZjI3M2VkMDZkZTNlMzYyZmVkMzc3N2UwMjAwYWM2ODgwNyJ9',1792241267);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rental_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `console_id` bigint unsigned NOT NULL,
  `rental_type` enum('daily','hourly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily',
  `approved_by` bigint unsigned DEFAULT NULL,
  `rental_date` date NOT NULL,
  `start_time` datetime DEFAULT NULL COMMENT 'Diisi untuk rental_type=hourly',
  `end_time` datetime DEFAULT NULL COMMENT 'Diisi untuk rental_type=hourly',
  `return_date` date NOT NULL,
  `total_days` int unsigned NOT NULL,
  `total_hours` int unsigned DEFAULT NULL COMMENT 'Total jam bermain (hourly)',
  `total_price` decimal(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `fine` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','approved','rejected','borrowed','returned','cancelled','late') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Kartu tanda pengenal penyewa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_rental_code_unique` (`rental_code`),
  KEY `transactions_user_id_index` (`user_id`),
  KEY `transactions_console_id_index` (`console_id`),
  KEY `transactions_approved_by_index` (`approved_by`),
  KEY `transactions_status_index` (`status`),
  KEY `transactions_user_console_status_index` (`user_id`,`console_id`,`status`),
  KEY `transactions_status_return_date_index` (`status`,`return_date`),
  CONSTRAINT `transactions_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `transactions_console_id_foreign` FOREIGN KEY (`console_id`) REFERENCES `consoles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (2,'GV-20260902-0001',20,1,'daily',22,'2026-09-02',NULL,NULL,'2026-09-03',1,NULL,50000.00,500000.00,0.00,'approved','sewa bg','KTP','2026-09-02 05:45:28','2026-09-02 05:52:57'),(3,'GV-20260729-0001',24,1,'daily',NULL,'2026-08-01',NULL,NULL,'2026-08-03',2,NULL,100000.00,500000.00,0.00,'pending',NULL,NULL,'2026-09-02 05:53:20','2026-10-17 05:59:50'),(4,'GV-20260729-0002',25,6,'daily',NULL,'2026-08-02',NULL,NULL,'2026-08-05',3,NULL,165000.00,550000.00,0.00,'pending',NULL,NULL,'2026-09-02 05:53:20','2026-09-02 05:53:20'),(5,'GV-20260728-0001',24,10,'daily',22,'2026-07-30',NULL,NULL,'2026-08-01',2,NULL,80000.00,400000.00,0.00,'approved',NULL,NULL,'2026-09-02 05:53:20','2026-09-02 05:53:20'),(6,'GV-20260727-0001',26,3,'daily',23,'2026-07-27',NULL,NULL,'2026-07-31',4,NULL,260000.00,650000.00,0.00,'borrowed',NULL,NULL,'2026-09-02 05:53:20','2026-10-17 06:06:54'),(7,'GV-20260725-0001',27,4,'daily',22,'2026-07-25',NULL,NULL,'2026-07-27',2,NULL,60000.00,300000.00,0.00,'returned',NULL,NULL,'2026-09-02 05:53:20','2026-09-02 05:53:20'),(8,'GV-20260720-0001',25,12,'daily',22,'2026-07-20',NULL,NULL,'2026-07-23',3,NULL,300000.00,1000000.00,100000.00,'late','Terlambat 2 hari, kena denda Rp100.000',NULL,'2026-09-02 05:53:20','2026-09-02 05:53:20'),(9,'GV-20260726-0001',24,8,'daily',22,'2026-07-26',NULL,NULL,'2026-07-28',2,NULL,50000.00,250000.00,0.00,'rejected','Stok sedang maintenance',NULL,'2026-09-02 05:53:20','2026-09-02 05:53:20'),(10,'GV-20260724-0001',26,2,'daily',NULL,'2026-07-24',NULL,NULL,'2026-07-26',2,NULL,90000.00,450000.00,0.00,'cancelled','Dibatalkan oleh pemesan',NULL,'2026-09-02 05:53:20','2026-09-02 05:53:20'),(12,'GV-20260917-0001',28,1,'daily',22,'2026-09-17',NULL,NULL,'2026-09-18',1,1,50000.00,500000.00,300000.00,'returned','nyewo sek lek','KTP','2026-09-16 20:48:00','2026-09-16 21:33:36'),(13,'GV-20260917-0002',21,2,'daily',22,'2026-09-17',NULL,NULL,'2026-09-18',1,1,45000.00,450000.00,0.00,'returned','sdfghjkl;','KTP','2026-09-16 21:34:48','2026-09-16 21:35:14'),(14,'GV-20260917-0003',21,2,'daily',NULL,'2026-09-17',NULL,NULL,'2026-09-18',1,1,45000.00,450000.00,0.00,'cancelled',NULL,'KTP','2026-09-16 21:35:46','2026-09-16 21:36:04'),(15,'GV-20260922-0001',20,3,'daily',NULL,'2026-09-22',NULL,NULL,'2026-09-23',1,1,80000.00,800000.00,0.00,'pending','bb','KTP','2026-09-21 19:28:51','2026-09-21 19:28:51'),(16,'GV-20261007-0001',20,2,'daily',NULL,'2026-10-07',NULL,NULL,'2026-10-08',1,NULL,45000.00,450000.00,0.00,'pending',NULL,'KTP','2026-10-06 23:25:19','2026-10-06 23:25:19');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_transactions_kode_wajib` BEFORE INSERT ON `transactions` FOR EACH ROW BEGIN
    IF NEW.rental_code IS NULL OR NEW.rental_code = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kode peminjaman wajib diisi';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_transactions_fine_non_negative` BEFORE UPDATE ON `transactions` FOR EACH ROW BEGIN
    IF NEW.fine < 0 THEN
        SET NEW.fine = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_index` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (20,1,'Arrofi Nur Ilham Fathoni Ryanto','arrofiryanto@gmail.com',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK',NULL,NULL,NULL,'2026-09-02 05:40:50','2026-09-02 05:40:50'),(21,1,'contoh user','admin@gamevault.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567890','Jl. Merdeka No. 1, Jakarta','Bx6NUkt9NIwUf1cSGS1mADJqrbfsMu693agiJ3uculMjV4DPmMQNTo2HwC8i','2026-09-02 05:43:28','2026-09-16 21:34:05'),(22,2,'Budi Santoso','budi@gamevault.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567891','Jl. Sudirman No. 45, Jakarta','ehDBTXH7oi4YB87BaX5zcYGd5KDCQJZr6mRMLa0NkkbF3QDcOXBoIpAFCBLw','2026-09-02 05:43:28','2026-09-02 05:43:28'),(23,2,'Siti Rahmawati','siti@gamevault.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567892','Jl. Gatot Subroto No. 12, Jakarta',NULL,'2026-09-02 05:43:28','2026-09-02 05:43:28'),(24,3,'Andi Pratama','andi@example.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567893','Jl. Kuningan No. 7, Jakarta','ilul68INk1ceDjS43E2ww5PPXPS3aDF3epcJbVntSgExp5uFDgK0aOIUhbVx','2026-09-02 05:43:28','2026-09-02 05:43:28'),(25,3,'Rina Amelia','rina@example.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567894','Jl. Thamrin No. 22, Jakarta',NULL,'2026-09-02 05:43:28','2026-09-02 05:43:28'),(26,3,'Doni Saputra','doni@example.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567895','Jl. Rasuna Said No. 5, Jakarta',NULL,'2026-09-02 05:43:28','2026-09-02 05:43:28'),(27,3,'Dewi Lestari','dewi@example.test',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK','081234567896','Jl. Mampang No. 15, Jakarta',NULL,'2026-09-02 05:43:28','2026-09-02 05:43:28'),(28,1,'abid cekut','abid@gmail.com',NULL,'$2y$12$aWr1DHi1PDB4WYRO7Y8PIebc/n3qR7QREeL8QINs1THCwLmLtO.yK',NULL,NULL,NULL,'2026-09-16 20:47:22','2026-09-16 20:47:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'latihan_ukk'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_denda_telat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_denda_telat`(
    p_tanggal_jatuh_tempo DATE,
    p_tanggal_kembali DATE,
    p_harga_per_hari DECIMAL(10,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE v_hari_terlambat INT DEFAULT 0;

    IF p_tanggal_kembali > p_tanggal_jatuh_tempo THEN
        SET v_hari_terlambat = DATEDIFF(p_tanggal_kembali, p_tanggal_jatuh_tempo);
    END IF;

    RETURN v_hari_terlambat * p_harga_per_hari * 0.5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pinjam_objek` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pinjam_objek`(IN p_transaction_id BIGINT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ringkasan_peminjaman` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ringkasan_peminjaman`(
    IN p_dari DATE,
    IN p_sampai DATE
)
BEGIN
    SELECT COUNT(*) AS jumlah_transaksi,
           IFNULL(SUM(total_price), 0) AS total_pendapatan,
           IFNULL(SUM(fine), 0) AS total_denda
    FROM transactions
    WHERE rental_date BETWEEN p_dari AND p_sampai;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-17 20:36:32
