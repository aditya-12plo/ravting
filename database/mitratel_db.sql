-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2018 at 02:31 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mitratel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cronjob`
--

CREATE TABLE `cronjob` (
  `id` int(11) NOT NULL,
  `emailsend` text NOT NULL,
  `status` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cronjob`
--

INSERT INTO `cronjob` (`id`, `emailsend`, `status`, `created_at`, `updated_at`) VALUES
(10, '[\"indonesiaich@gmail.com\"]', '{\"projectid\":\"18TS02B0513\",\"header\":\"Project Melebihi batas waktu APPROVAL\",\"kata\":\"Project ini menunggu APPROVAL dari anda mulai 2018-04-29 08:24:20 sampai 2018-05-29 11:48:46 total 30 Hari\"}', '2018-05-29 11:48:51', '2018-05-29 11:48:51'),
(11, '[\"indonesiaich@gmail.com\"]', '{\"projectid\":\"18TS02B0507\",\"header\":\"Project Melebihi batas waktu APPROVAL\",\"kata\":\"Project ini menunggu APPROVAL dari anda mulai 2018-04-29 08:24:16 sampai 2018-05-29 11:48:51 total 30 Hari\"}', '2018-05-29 11:48:55', '2018-05-29 11:48:55'),
(12, '[\"indonesiaich@gmail.com\"]', '{\"projectid\":\"18TS02B0318\",\"header\":\"Project Melebihi batas waktu APPROVAL\",\"kata\":\"Project ini menunggu APPROVAL dari anda mulai 2018-05-11 06:44:16 sampai 2018-05-29 11:48:55 total 18 Hari\"}', '2018-05-29 11:48:58', '2018-05-29 11:48:58'),
(13, '[\"nugroho.adty@gmail.com\"]', '{\"projectid\":\"18TS02B0545\",\"header\":\"Project Melebihi batas waktu Perbaikan\",\"kata\":\"Project ini menunggu Perbaikan dari anda mulai 2018-05-11 06:46:01 sampai 2018-05-29 11:48:58 total 18 Hari\"}', '2018-05-29 11:49:01', '2018-05-29 11:49:01'),
(14, '[\"indonesiaich@gmail.com\"]', '{\"projectid\":\"18TS02B0566\",\"header\":\"Project Melebihi batas waktu APPROVAL\",\"kata\":\"Project ini menunggu APPROVAL dari anda mulai 2018-04-29 09:25:54 sampai 2018-05-29 11:49:02 total 30 Hari\"}', '2018-05-29 11:49:05', '2018-05-29 11:49:05');

-- --------------------------------------------------------

--
-- Stand-in structure for view `downloadexcel`
-- (See below for the actual view)
--
CREATE TABLE `downloadexcel` (
`id` int(11)
,`proc` varchar(255)
,`ubis` varchar(255)
,`no_doc` varchar(255)
,`projectid` varchar(255)
,`sitename` varchar(255)
,`siteid` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`cluster` varchar(255)
,`mitra` varchar(255)
,`kode_tower_depan` varchar(255)
,`tower` int(11)
,`kode_tower_belakang` varchar(255)
,`tinggitower` text
,`budget` double
,`sis` double
,`sitac` double
,`imb` double
,`imb_jasa` double
,`qty_lahan` int(11)
,`lahan` double
,`biayatower` double
,`cme` double
,`pln` double
,`addtransport` double
,`addpln` double
,`addcme` double
,`longitude` text
,`latituted` text
,`infratype` varchar(255)
,`towerprovider` varchar(255)
,`provinsi` text
,`kabupaten` text
,`status_id` int(11)
,`filename` text
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`projectimplementationid` int(11)
,`towerimplementation` int(11)
,`clusterimplementation` varchar(255)
,`mitraimplementation` varchar(255)
,`biayatowercetak` double
,`cmecetak` double
,`plncetak` double
,`biayaadditional` double
,`capex` double
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` enum('insert','update','delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `email`, `table_action`, `action`, `data`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', 'users', 'insert', '{\"name\":\"ADMIN1@ADMIN.COM\",\"email\":\"admin1@admin.com\",\"password\":\"$2y$10$Tkauv\\/8.qUI1UNxagKHOEu8XX7Re4C1XFrlc6UkTC2vsVmODEqygO\",\"password_api\":\"827ccb0eea8a706c4c34a16891f84e7b\",\"level\":\"OFFICER PSC\",\"area\":null,\"area2\":null}', '2018-05-11 02:17:00', '2018-05-11 02:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_23_204749_create_contact_table', 1),
(4, '2017_08_26_061403_create_menu_table', 1),
(5, '2017_08_26_113908_create_menu_sub_table', 1),
(6, '2017_08_26_114056_create_menu_user_table', 1),
(7, '2017_08_26_141037_create_log_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_pr_po`
--

CREATE TABLE `nomor_pr_po` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `workjobs` varchar(255) NOT NULL,
  `nopr` varchar(100) NOT NULL,
  `po` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nomor_pr_po`
--

INSERT INTO `nomor_pr_po` (`id`, `project_id`, `workjobs`, `nopr`, `po`, `created_at`, `updated_at`) VALUES
(4, 364, 'DSFDSFS', 'DSFSDFDSFD', '', '2018-06-05 10:13:15', '2018-06-05 10:13:15'),
(5, 364, 'SDFSDFSD', 'SDFSDFDSFD', '', '2018-06-05 10:13:15', '2018-06-05 10:13:15'),
(6, 363, 'SADASD', 'SDAD', '', '2018-06-05 10:15:05', '2018-06-05 10:15:05'),
(12, 365, 'DSFDS', 'DF', '11', '2018-06-05 12:18:02', '2018-06-05 12:18:02'),
(13, 365, 'SDF', 'DFS', '11', '2018-06-05 12:18:02', '2018-06-05 12:18:02'),
(14, 365, 'DDD', 'DDD', 'DDDD', '2018-06-05 12:18:02', '2018-06-05 12:18:02'),
(15, 365, 'SSS', 'SSS', 'SSSS', '2018-06-05 12:18:02', '2018-06-05 12:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `project_id`, `sender_id`, `users_id`, `message`, `detail`, `status`, `created_at`, `updated_at`) VALUES
(1, 291, 27, 28, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 04:49:57', '2018-04-27 04:49:57'),
(2, 290, 27, 28, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 05:02:07', '2018-04-27 05:02:07'),
(3, 172, 27, 28, 'Pemberitahuan Project ID 18TS02B0513', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 05:05:32', '2018-04-27 05:05:32'),
(4, 178, 27, 28, 'Pemberitahuan Project ID 18TS02B0507', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 05:08:06', '2018-04-27 05:08:06'),
(5, 291, 28, 27, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 05:14:54', '2018-04-27 05:14:54'),
(6, 290, 28, 27, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 05:15:01', '2018-04-27 05:15:01'),
(7, 178, 28, 27, 'Pemberitahuan Project ID 18TS02B0507', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 05:15:06', '2018-04-27 05:15:06'),
(8, 172, 28, 27, 'Pemberitahuan Project ID 18TS02B0513', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 05:15:14', '2018-04-27 05:15:14'),
(9, 289, 27, 28, 'Pemberitahuan Project ID 18TS02B0567', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 07:34:51', '2018-04-27 07:34:51'),
(10, 291, 27, 28, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 09:32:42', '2018-04-27 09:32:42'),
(11, 172, 27, 28, 'Pemberitahuan Project ID 18TS02B0513', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 09:36:05', '2018-04-27 09:36:05'),
(12, 290, 27, 28, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 09:36:16', '2018-04-27 09:36:16'),
(13, 178, 27, 28, 'Pemberitahuan Project ID 18TS02B0507', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 09:37:12', '2018-04-27 09:37:12'),
(14, 290, 28, 27, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 11:43:29', '2018-04-27 11:43:29'),
(15, 290, 27, 28, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 11:44:42', '2018-04-27 11:44:42'),
(16, 291, 29, 28, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 11:48:46', '2018-04-27 11:48:46'),
(17, 289, 29, 28, 'Pemberitahuan Project ID 18TS02B0567', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 11:48:53', '2018-04-27 11:48:53'),
(18, 172, 29, 28, 'Pemberitahuan Project ID 18TS02B0513', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 11:49:00', '2018-04-27 11:49:00'),
(19, 290, 28, 27, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 13:49:49', '2018-04-27 13:49:49'),
(20, 290, 27, 28, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 13:51:49', '2018-04-27 13:51:49'),
(21, 263, 27, 28, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 14:03:16', '2018-04-27 14:03:16'),
(22, 290, 28, 27, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 14:04:18', '2018-04-27 14:04:18'),
(23, 290, 27, 28, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 14:05:14', '2018-04-27 14:05:14'),
(24, 263, 29, 28, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 14:13:48', '2018-04-27 14:13:48'),
(25, 291, 29, 28, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 14:15:05', '2018-04-27 14:15:05'),
(26, 289, 29, 28, 'Pemberitahuan Project ID 18TS02B0567', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 14:15:10', '2018-04-27 14:15:10'),
(27, 290, 29, 28, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 14:15:15', '2018-04-27 14:15:15'),
(28, 263, 28, 27, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 14:15:33', '2018-04-27 14:15:33'),
(29, 263, 27, 28, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 14:15:53', '2018-04-27 14:15:53'),
(30, 263, 28, 27, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 14:16:14', '2018-04-27 14:16:14'),
(31, 263, 27, 28, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 14:16:44', '2018-04-27 14:16:44'),
(32, 263, 28, 27, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-04-27 14:16:58', '2018-04-27 14:16:58'),
(33, 263, 27, 28, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-04-27 14:18:51', '2018-04-27 14:18:51'),
(34, 291, 29, 28, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-27 15:00:50', '2018-04-27 15:00:50'),
(35, 290, 29, 30, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-28 09:46:21', '2018-04-28 09:46:21'),
(36, 291, 29, 30, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-28 11:36:51', '2018-04-28 11:36:51'),
(37, 289, 29, 30, 'Pemberitahuan Project ID 18TS02B0567', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-04-28 11:37:59', '2018-04-28 11:37:59'),
(38, 172, 30, 31, 'Pemberitahuan Project ID 18TS02B0513', 'Telah Ada Proses APPROVE dari HARRY RAMDAN (GENERAL MANAGER UBIS).', 0, '2018-04-28 13:27:15', '2018-04-28 13:27:15'),
(39, 289, 30, 31, 'Pemberitahuan Project ID 18TS02B0567', 'Telah Ada Proses APPROVE dari HARRY RAMDAN (GENERAL MANAGER UBIS).', 0, '2018-04-28 13:31:27', '2018-04-28 13:31:27'),
(40, 290, 31, 32, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-04-29 00:44:52', '2018-04-29 00:44:52'),
(41, 289, 31, 32, 'Pemberitahuan Project ID 18TS02B0567', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-04-29 00:46:19', '2018-04-29 00:46:19'),
(42, 178, 31, 32, 'Pemberitahuan Project ID 18TS02B0507', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-04-29 00:46:38', '2018-04-29 00:46:38'),
(43, 290, 33, 34, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-04-29 01:24:07', '2018-04-29 01:24:07'),
(44, 263, 33, 34, 'Pemberitahuan Project ID 18TS02B0545', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-04-29 01:24:12', '2018-04-29 01:24:12'),
(45, 178, 33, 34, 'Pemberitahuan Project ID 18TS02B0507', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-04-29 01:24:16', '2018-04-29 01:24:16'),
(46, 172, 33, 34, 'Pemberitahuan Project ID 18TS02B0513', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-04-29 01:24:20', '2018-04-29 01:24:20'),
(47, 291, 34, 1, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 01:25:18', '2018-04-29 01:25:18'),
(48, 291, 34, 33, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 01:25:18', '2018-04-29 01:25:18'),
(49, 291, 34, 1, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 02:03:41', '2018-04-29 02:03:41'),
(50, 291, 34, 33, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 02:03:41', '2018-04-29 02:03:41'),
(51, 291, 33, 34, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-04-29 02:03:54', '2018-04-29 02:03:54'),
(52, 291, 34, 1, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 02:04:13', '2018-04-29 02:04:13'),
(53, 291, 34, 33, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 02:04:13', '2018-04-29 02:04:13'),
(54, 291, 33, 34, 'Pemberitahuan Project ID 18TS02B0565', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-04-29 02:04:49', '2018-04-29 02:04:49'),
(55, 290, 34, 1, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 02:25:16', '2018-04-29 02:25:16'),
(56, 290, 34, 33, 'Pemberitahuan Project ID 18TS02B0566', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-04-29 02:25:16', '2018-04-29 02:25:16'),
(57, 12, 29, 27, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-05-10 11:01:00', '2018-05-10 11:01:00'),
(58, 12, 29, 30, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-05-10 15:20:53', '2018-05-10 15:20:53'),
(59, 12, 33, 33, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-05-10 19:46:46', '2018-05-10 19:46:46'),
(60, 12, 33, 29, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-05-10 19:47:43', '2018-05-10 19:47:43'),
(61, 12, 33, 27, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-05-10 19:58:30', '2018-05-10 19:58:30'),
(62, 12, 33, 27, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-05-10 20:00:07', '2018-05-10 20:00:07'),
(63, 12, 33, 29, 'Pemberitahuan Project ID 18TS02B0424', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-05-10 20:00:31', '2018-05-10 20:00:31'),
(64, 225, 27, 28, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-05-10 23:28:20', '2018-05-10 23:28:20'),
(65, 225, 28, 27, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-05-10 23:32:10', '2018-05-10 23:32:10'),
(66, 225, 27, 28, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-05-10 23:32:28', '2018-05-10 23:32:28'),
(67, 225, 28, 29, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-05-10 23:33:59', '2018-05-10 23:33:59'),
(68, 225, 29, 27, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-05-10 23:34:21', '2018-05-10 23:34:21'),
(69, 224, 27, 28, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-05-10 23:34:57', '2018-05-10 23:34:57'),
(70, 225, 27, 29, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari ARIF ROCHMAN (MANAGER AREA).', 0, '2018-05-10 23:35:22', '2018-05-10 23:35:22'),
(71, 225, 28, 29, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-05-10 23:36:28', '2018-05-10 23:36:28'),
(72, 224, 28, 29, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari IWAN ADJI (GENERAL MANAGER AREA).', 0, '2018-05-10 23:36:33', '2018-05-10 23:36:33'),
(73, 225, 29, 30, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-05-10 23:42:06', '2018-05-10 23:42:06'),
(74, 224, 29, 30, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari RUDI ALBERT (MANAGER UBIS).', 0, '2018-05-10 23:42:12', '2018-05-10 23:42:12'),
(75, 225, 30, 31, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari HARRY RAMDAN (GENERAL MANAGER UBIS).', 0, '2018-05-10 23:42:42', '2018-05-10 23:42:42'),
(76, 224, 30, 31, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari HARRY RAMDAN (GENERAL MANAGER UBIS).', 0, '2018-05-10 23:42:50', '2018-05-10 23:42:50'),
(77, 225, 31, 32, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-05-10 23:43:16', '2018-05-10 23:43:16'),
(78, 224, 31, 32, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-05-10 23:43:23', '2018-05-10 23:43:23'),
(79, 225, 32, 33, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:46', '2018-05-10 23:43:46'),
(80, 224, 32, 27, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(81, 224, 32, 28, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(82, 224, 32, 29, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(83, 224, 32, 30, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(84, 224, 32, 31, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(85, 224, 32, 32, 'Project ID 18TS02B0317 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(86, 225, 33, 34, 'Project ID 18TS02B0318 Menunggu Approval.', 'Telah Ada Proses APPROVE dari IHSAN PERBAWA GINANJAR (STAFF PROCUREMENT).', 0, '2018-05-10 23:44:16', '2018-05-10 23:44:16'),
(87, 263, 34, 1, 'Project ID 18TS02B0545 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:01', '2018-05-10 23:46:01'),
(88, 12, 34, 29, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(89, 12, 34, 30, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(90, 12, 34, 31, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(91, 12, 34, 32, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(92, 12, 34, 33, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(93, 12, 34, 34, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(94, 12, 34, 36, 'Project ID 18TS02B0424 Menunggu Approval.', 'Telah Ada Proses APPROVE dari MOHAMMAD ALI AKBAR (MANAGER PROCUREMENT).', 0, '2018-05-10 23:46:08', '2018-05-10 23:46:08'),
(95, 251, 1, 28, 'Project ID 18TS02B0598 Menunggu Approval.', 'Telah Ada Proses APPROVE dari ADMIN 12345 (MANAGER AREA).', 0, '2018-06-06 06:33:46', '2018-06-06 06:33:46'),
(96, 249, 1, 28, 'Project ID 18TS02B0596 Menunggu Approval.', 'Telah Ada Proses APPROVE dari ADMIN 12345 (MANAGER AREA).', 0, '2018-06-06 06:35:27', '2018-06-06 06:35:27'),
(97, 365, 31, 33, 'Project ID 18TS03B0019 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:52:36', '2018-06-08 00:52:36'),
(98, 365, 31, 33, 'Project ID 18TS03B0019 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:52:36', '2018-06-08 00:52:36'),
(99, 297, 31, 36, 'Project ID 18TS02B0559 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:49', '2018-06-08 00:59:49'),
(100, 297, 31, 36, 'Project ID 18TS02B0559 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:49', '2018-06-08 00:59:49'),
(101, 298, 31, 36, 'Project ID 18TS02B0558 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:52', '2018-06-08 00:59:52'),
(102, 298, 31, 36, 'Project ID 18TS02B0558 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:52', '2018-06-08 00:59:52'),
(103, 299, 31, 36, 'Project ID 18TS02B0557 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:55', '2018-06-08 00:59:55'),
(104, 299, 31, 36, 'Project ID 18TS02B0557 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:55', '2018-06-08 00:59:55'),
(105, 300, 31, 36, 'Project ID 18TS02B0556 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:59', '2018-06-08 00:59:59'),
(106, 300, 31, 36, 'Project ID 18TS02B0556 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 00:59:59', '2018-06-08 00:59:59'),
(107, 359, 31, 36, 'Project ID 17TS11B0134 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:02', '2018-06-08 01:00:02'),
(108, 359, 31, 36, 'Project ID 17TS11B0134 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:02', '2018-06-08 01:00:02'),
(109, 360, 31, 36, 'Project ID 17TS11B0135 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:06', '2018-06-08 01:00:06'),
(110, 360, 31, 36, 'Project ID 17TS11B0135 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:06', '2018-06-08 01:00:06'),
(111, 361, 31, 36, 'Project ID 18TS03B0009 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:09', '2018-06-08 01:00:09'),
(112, 361, 31, 36, 'Project ID 18TS03B0009 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:09', '2018-06-08 01:00:09'),
(113, 362, 31, 36, 'Project ID 18TS03B0008 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:12', '2018-06-08 01:00:12'),
(114, 362, 31, 36, 'Project ID 18TS03B0008 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:12', '2018-06-08 01:00:12'),
(115, 363, 31, 33, 'Project ID 18TS03B0013 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:15', '2018-06-08 01:00:15'),
(116, 363, 31, 33, 'Project ID 18TS03B0013 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:15', '2018-06-08 01:00:15'),
(117, 364, 31, 33, 'Project ID 18TS03B0017 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:18', '2018-06-08 01:00:18'),
(118, 364, 31, 33, 'Project ID 18TS03B0017 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:19', '2018-06-08 01:00:19'),
(119, 365, 31, 33, 'Project ID 18TS03B0019 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:22', '2018-06-08 01:00:22'),
(120, 365, 31, 33, 'Project ID 18TS03B0019 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:00:22', '2018-06-08 01:00:22'),
(121, 291, 31, 36, 'Project ID 18TS02B0565 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:46:58', '2018-06-08 01:46:58'),
(122, 291, 31, 36, 'Project ID 18TS02B0565 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 01:46:58', '2018-06-08 01:46:58'),
(123, 216, 31, 36, 'Project ID 18TS02B0516 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 02:45:15', '2018-06-08 02:45:15'),
(124, 216, 31, 36, 'Project ID 18TS02B0516 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 02:45:15', '2018-06-08 02:45:15'),
(125, 211, 31, 36, 'Project ID 18TS02B0474 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 03:00:16', '2018-06-08 03:00:16'),
(126, 211, 31, 36, 'Project ID 18TS02B0474 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 03:00:16', '2018-06-08 03:00:16'),
(127, 209, 31, 36, 'Project ID 18TS02B0476 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 03:00:21', '2018-06-08 03:00:21'),
(128, 209, 31, 36, 'Project ID 18TS02B0476 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 03:00:21', '2018-06-08 03:00:21'),
(129, 215, 31, 36, 'Project ID 18TS02B0517 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 03:00:24', '2018-06-08 03:00:24'),
(130, 215, 31, 36, 'Project ID 18TS02B0517 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 03:00:24', '2018-06-08 03:00:24'),
(131, 226, 31, 33, 'Project ID 18TS02B0573 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:22:53', '2018-06-08 06:22:53'),
(132, 226, 31, 33, 'Project ID 18TS02B0573 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:22:53', '2018-06-08 06:22:53'),
(133, 228, 31, 33, 'Project ID 18TS02B0575 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:22:58', '2018-06-08 06:22:58'),
(134, 228, 31, 33, 'Project ID 18TS02B0575 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:22:58', '2018-06-08 06:22:58'),
(135, 229, 31, 33, 'Project ID 18TS02B0576 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:01', '2018-06-08 06:23:01'),
(136, 229, 31, 33, 'Project ID 18TS02B0576 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:01', '2018-06-08 06:23:01'),
(137, 231, 31, 33, 'Project ID 18TS02B0578 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:04', '2018-06-08 06:23:04'),
(138, 231, 31, 33, 'Project ID 18TS02B0578 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:04', '2018-06-08 06:23:04'),
(139, 232, 31, 33, 'Project ID 18TS02B0579 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:07', '2018-06-08 06:23:07'),
(140, 232, 31, 33, 'Project ID 18TS02B0579 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:07', '2018-06-08 06:23:07'),
(141, 233, 31, 33, 'Project ID 18TS02B0580 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:10', '2018-06-08 06:23:10'),
(142, 233, 31, 33, 'Project ID 18TS02B0580 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:10', '2018-06-08 06:23:10'),
(143, 237, 31, 33, 'Project ID 18TS02B0584 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:14', '2018-06-08 06:23:14'),
(144, 237, 31, 33, 'Project ID 18TS02B0584 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:14', '2018-06-08 06:23:14'),
(145, 240, 31, 33, 'Project ID 18TS02B0587 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:17', '2018-06-08 06:23:17'),
(146, 240, 31, 33, 'Project ID 18TS02B0587 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:17', '2018-06-08 06:23:17'),
(147, 248, 31, 33, 'Project ID 18TS02B0595 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:21', '2018-06-08 06:23:21'),
(148, 248, 31, 33, 'Project ID 18TS02B0595 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:21', '2018-06-08 06:23:21'),
(149, 258, 31, 36, 'Project ID 18TS02B0550 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:24', '2018-06-08 06:23:24'),
(150, 258, 31, 36, 'Project ID 18TS02B0550 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:24', '2018-06-08 06:23:24'),
(151, 267, 31, 36, 'Project ID 18TS02B0540 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:27', '2018-06-08 06:23:27'),
(152, 267, 31, 36, 'Project ID 18TS02B0540 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:27', '2018-06-08 06:23:27'),
(153, 268, 31, 36, 'Project ID 18TS02B0539 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:30', '2018-06-08 06:23:30'),
(154, 268, 31, 36, 'Project ID 18TS02B0539 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:30', '2018-06-08 06:23:30'),
(155, 269, 31, 36, 'Project ID 18TS02B0538 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:34', '2018-06-08 06:23:34'),
(156, 269, 31, 36, 'Project ID 18TS02B0538 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:34', '2018-06-08 06:23:34'),
(157, 270, 31, 36, 'Project ID 18TS02B0537 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:37', '2018-06-08 06:23:37'),
(158, 270, 31, 36, 'Project ID 18TS02B0537 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:37', '2018-06-08 06:23:37'),
(159, 271, 31, 36, 'Project ID 18TS02B0536 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:40', '2018-06-08 06:23:40'),
(160, 271, 31, 36, 'Project ID 18TS02B0536 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:40', '2018-06-08 06:23:40'),
(161, 272, 31, 36, 'Project ID 18TS02B0535 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:44', '2018-06-08 06:23:44'),
(162, 272, 31, 36, 'Project ID 18TS02B0535 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:44', '2018-06-08 06:23:44'),
(163, 273, 31, 36, 'Project ID 18TS02B0534 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:47', '2018-06-08 06:23:47'),
(164, 273, 31, 36, 'Project ID 18TS02B0534 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:47', '2018-06-08 06:23:47'),
(165, 274, 31, 36, 'Project ID 18TS02B0533 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:50', '2018-06-08 06:23:50'),
(166, 274, 31, 36, 'Project ID 18TS02B0533 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:50', '2018-06-08 06:23:50'),
(167, 275, 31, 36, 'Project ID 18TS02B0532 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:54', '2018-06-08 06:23:54'),
(168, 275, 31, 36, 'Project ID 18TS02B0532 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:54', '2018-06-08 06:23:54'),
(169, 276, 31, 36, 'Project ID 18TS02B0531 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:57', '2018-06-08 06:23:57'),
(170, 276, 31, 36, 'Project ID 18TS02B0531 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:23:57', '2018-06-08 06:23:57'),
(171, 279, 31, 36, 'Project ID 18TS02B0528 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:01', '2018-06-08 06:24:01'),
(172, 279, 31, 36, 'Project ID 18TS02B0528 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:01', '2018-06-08 06:24:01'),
(173, 280, 31, 36, 'Project ID 18TS02B0527 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:04', '2018-06-08 06:24:04'),
(174, 280, 31, 36, 'Project ID 18TS02B0527 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:04', '2018-06-08 06:24:04'),
(175, 281, 31, 36, 'Project ID 18TS02B0526 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:08', '2018-06-08 06:24:08'),
(176, 281, 31, 36, 'Project ID 18TS02B0526 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:08', '2018-06-08 06:24:08'),
(177, 282, 31, 36, 'Project ID 18TS02B0525 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:11', '2018-06-08 06:24:11'),
(178, 282, 31, 36, 'Project ID 18TS02B0525 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:11', '2018-06-08 06:24:11'),
(179, 283, 31, 36, 'Project ID 18TS02B0524 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:15', '2018-06-08 06:24:15'),
(180, 283, 31, 36, 'Project ID 18TS02B0524 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:15', '2018-06-08 06:24:15'),
(181, 284, 31, 36, 'Project ID 18TS02B0523 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:25', '2018-06-08 06:24:25'),
(182, 284, 31, 36, 'Project ID 18TS02B0523 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:25', '2018-06-08 06:24:25'),
(183, 285, 31, 36, 'Project ID 18TS02B0522 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:29', '2018-06-08 06:24:29'),
(184, 285, 31, 36, 'Project ID 18TS02B0522 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:29', '2018-06-08 06:24:29'),
(185, 286, 31, 36, 'Project ID 18TS02B0521 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:32', '2018-06-08 06:24:32'),
(186, 286, 31, 36, 'Project ID 18TS02B0521 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:32', '2018-06-08 06:24:32'),
(187, 287, 31, 36, 'Project ID 18TS02B0569 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:35', '2018-06-08 06:24:35'),
(188, 287, 31, 36, 'Project ID 18TS02B0569 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:35', '2018-06-08 06:24:35'),
(189, 288, 31, 36, 'Project ID 18TS02B0568 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:39', '2018-06-08 06:24:39'),
(190, 288, 31, 36, 'Project ID 18TS02B0568 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:39', '2018-06-08 06:24:39'),
(191, 292, 31, 36, 'Project ID 18TS02B0564 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:42', '2018-06-08 06:24:42'),
(192, 292, 31, 36, 'Project ID 18TS02B0564 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:42', '2018-06-08 06:24:42'),
(193, 293, 31, 36, 'Project ID 18TS02B0563 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:45', '2018-06-08 06:24:45'),
(194, 293, 31, 36, 'Project ID 18TS02B0563 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:45', '2018-06-08 06:24:45'),
(195, 294, 31, 36, 'Project ID 18TS02B0562 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:49', '2018-06-08 06:24:49'),
(196, 294, 31, 36, 'Project ID 18TS02B0562 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:49', '2018-06-08 06:24:49'),
(197, 295, 31, 36, 'Project ID 18TS02B0561 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:52', '2018-06-08 06:24:52'),
(198, 295, 31, 36, 'Project ID 18TS02B0561 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:52', '2018-06-08 06:24:52'),
(199, 296, 31, 36, 'Project ID 18TS02B0560 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:55', '2018-06-08 06:24:55'),
(200, 296, 31, 36, 'Project ID 18TS02B0560 Menunggu Approval.', 'Telah Ada Proses APPROVE dari EDY SUSILO (EXECUTIVE GENERAL MANAGER UBIS).', 0, '2018-06-08 06:24:55', '2018-06-08 06:24:55'),
(201, 363, 32, 33, 'Project ID 18TS03B0013 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 08:49:44', '2018-06-08 08:49:44'),
(202, 363, 32, 33, 'Project ID 18TS03B0013 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 08:49:44', '2018-06-08 08:49:44'),
(203, 364, 32, 33, 'Project ID 18TS03B0017 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 08:49:49', '2018-06-08 08:49:49'),
(204, 364, 32, 33, 'Project ID 18TS03B0017 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 08:49:49', '2018-06-08 08:49:49'),
(205, 365, 32, 33, 'Project ID 18TS03B0019 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 08:49:52', '2018-06-08 08:49:52'),
(206, 365, 32, 33, 'Project ID 18TS03B0019 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 08:49:52', '2018-06-08 08:49:52'),
(207, 211, 32, 36, 'Project ID 18TS02B0474 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:37', '2018-06-08 09:19:37'),
(208, 211, 32, 36, 'Project ID 18TS02B0474 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:37', '2018-06-08 09:19:37'),
(209, 216, 32, 36, 'Project ID 18TS02B0516 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:42', '2018-06-08 09:19:42'),
(210, 216, 32, 36, 'Project ID 18TS02B0516 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:43', '2018-06-08 09:19:43'),
(211, 209, 32, 36, 'Project ID 18TS02B0476 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:46', '2018-06-08 09:19:46'),
(212, 209, 32, 36, 'Project ID 18TS02B0476 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:46', '2018-06-08 09:19:46'),
(213, 215, 32, 36, 'Project ID 18TS02B0517 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:49', '2018-06-08 09:19:49'),
(214, 215, 32, 36, 'Project ID 18TS02B0517 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:49', '2018-06-08 09:19:49'),
(215, 291, 32, 36, 'Project ID 18TS02B0565 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:52', '2018-06-08 09:19:52'),
(216, 291, 32, 36, 'Project ID 18TS02B0565 Menunggu Approval.', 'Telah Ada Proses APPROVE dari THEODORUS ARDI HARTOKO (DIRECTOR).', 0, '2018-06-08 09:19:52', '2018-06-08 09:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nugroho.adty@gmail.com', '$2y$10$70QmNzcoXwXL.gH/P7CL/eKtyV.jwcVyRZvIqBmABhiMCnEmoeELe', '2018-01-05 02:10:45'),
('nugroho.adty@gmail.com', '$2y$10$70QmNzcoXwXL.gH/P7CL/eKtyV.jwcVyRZvIqBmABhiMCnEmoeELe', '2018-01-05 02:10:45'),
('nugrohoaditya10@gmail.com', '$2y$10$3gCZUpzZozb9WnRDznsJdeVO92gC2Ovcck1.kN7uvzCLO/fESrgpG', '2018-03-22 05:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `projectid` varchar(255) NOT NULL,
  `no_doc` varchar(255) DEFAULT NULL,
  `proc` varchar(255) NOT NULL,
  `ubis` varchar(255) NOT NULL,
  `sitename` varchar(255) NOT NULL,
  `siteid` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `regional` varchar(255) NOT NULL,
  `cluster` varchar(255) NOT NULL,
  `mitra` varchar(255) NOT NULL,
  `kode_tower_depan` varchar(255) NOT NULL,
  `tower` int(11) NOT NULL,
  `kode_tower_belakang` varchar(255) NOT NULL,
  `longitude` text NOT NULL,
  `latituted` text NOT NULL,
  `infratype` varchar(255) NOT NULL,
  `towerprovider` varchar(255) NOT NULL,
  `provinsi` text NOT NULL,
  `kabupaten` text NOT NULL,
  `budget` double NOT NULL,
  `sis` double NOT NULL,
  `sitac` double NOT NULL,
  `imb` double NOT NULL,
  `imb_jasa` double NOT NULL,
  `qty_lahan` int(11) NOT NULL,
  `lahan` double NOT NULL,
  `cme` double NOT NULL,
  `pln` double NOT NULL,
  `addtransport` double NOT NULL,
  `addpln` double NOT NULL,
  `addcme` double NOT NULL,
  `biayatower` double NOT NULL,
  `status_id` int(11) NOT NULL,
  `filename` text,
  `status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `imb_jasa`, `qty_lahan`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(11, '18TS02B0652', '44/18TS02B0652/I/2018', 'OUTER', 'MACRO', 'SMKN 1 PARDOMUAN', 'SDK126', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.053604', '2.9078731', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DAIRI', 593000000, 4000000, 68909600, 120000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 49, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(12, '18TS02B0424', '45/18TS02B0424/I/2018', 'OUTER', 'MACRO', 'BLANG BINTANG', 'MAK133', 'AREA 3', 'SUMBAGUT', 'ACEH', 'AKSES INSANI', 'SST', 42, 'NL', '96.304636', '4.063866', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'ACEH', 'KAB. ACEH BARAT', 805000000, 0.01, 0.01, 0.01, 0.01, 1, 0.01, 0, 0, 0, 0, 0, 0, 368, '', 'FINISH', '2018-03-18 23:32:30', '2018-05-10 23:46:08'),
(13, '18TS02B0425', '46/18TS02B0425/I/2018', 'OUTER', 'MACRO', 'MUGO CUT', 'MBO135', 'AREA 1', 'SUMBAGUT', 'ACEH', 'Akses Insani', 'SST', 42, 'NL', '96.195096', '4.420391', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'ACEH', 'KAB. ACEH BARAT', 593000000, 5680500, 63929700, 74502000, 0, 1, 94444444.4444444, 149963275.278206, 29436100, 0, 0, 0, 115000000, 51, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(14, '18TS02B0426', '47/18TS02B0426/I/2018', 'OUTER', 'MACRO', 'DESA JAWI JAWI', 'RAP052', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '100.112861', '2.498789', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 4000000, 68909600, 90000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 52, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(15, '18TS02B0427', '48/18TS02B0427/I/2018', 'OUTER', 'MACRO', 'DESA TELUK RAMPAH', 'RAP048', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.9023', '1.78211', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 4000000, 68909600, 90000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 53, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(16, '18TS02B0428', '49/18TS02B0428/I/2018', 'OUTER', 'MACRO', 'PKS TELUK RAMPAH', 'RAP047', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.882556', '2.54289', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 4000000, 68909600, 90000000, 0, 1, 111111111.111111, 143379827.653354, 28916800, 0, 0, 0, 115000000, 54, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(17, '18TS02B0429', NULL, 'OUTER', 'MACRO', 'DESA TORGANDA', 'RAP046', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '100.262905', '1.626796', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 0, 1, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(18, '18TS02B0430', '50/18TS02B0430/I/2018', 'OUTER', 'MACRO', 'PT. SERBA HUTA JAYA', 'RAP041', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.936151', '2.224964', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 4000000, 68909600, 90000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 55, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(19, '18TS02B0431', '51/18TS02B0431/I/2018', 'OUTER', 'MACRO', 'DESA TELUK BINJAI', 'RAP040', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.907413', '2.533092', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 4000000, 68909600, 90000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 56, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(20, '18TS02B0432', '52/18TS02B0432/I/2018', 'OUTER', 'MACRO', 'SILANTOM JAE (PADANG PARSADAAN)', 'TRT891', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.329747', '1.8868674', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 4000000, 68000000, 120000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 57, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(21, '18TS02B0433', '53/18TS02B0433/I/2018', 'OUTER', 'MACRO', 'SIMAMORA HASIBUAN', 'TRT890', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.865702', '2.198025', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 4000000, 68000000, 120000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 58, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(22, '18TS02B0434', '54/18TS02B0434/I/2018', 'OUTER', 'MACRO', 'JAMBUR NAULI', 'TRT756', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.985053', '2.1177133', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 4000000, 68000000, 120000000, 0, 1, 111111111, 143379827.653354, 28916800, 0, 0, 0, 115000000, 59, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(23, '18TS02B0435', '55/18TS02B0435/I/2018', 'OUTER', 'MACRO', 'HILIMONDREGERAYA', 'TUK910', 'AREA 1', 'SUMBAGUT', 'KEP NIAS', 'Global Comtech', 'SST', 42, 'NL', '97.811369', '0.6279095', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. NIAS', 593000000, 6604500, 68000000, 80000000, 0, 1, 100000000, 155022760.5249, 28916800, 0, 0, 0, 115000000, 60, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(24, '18TS02B0436', '56/18TS02B0436/I/2018', 'OUTER', 'MACRO', 'LAWA-LAWA LUO', 'GST714', 'AREA 1', 'SUMBAGUT', 'KEP NIAS', 'Global Comtech', 'SST', 42, 'NL', '97.710704', '1.0287733', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. NIAS', 593000000, 6604500, 68000000, 80000000, 0, 1, 100000000, 155022760.5249, 28916800, 0, 0, 0, 115000000, 61, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(25, '18TS02B0437', '57/18TS02B0437/I/2018', 'OUTER', 'MACRO', 'GODUNG BOROTAN', 'TRT885', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.104221', '1.9977874', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 4000000, 68000000, 120000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 62, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(26, '18TS02B0438', '208/18TS02B0438/I/2018', 'OUTER', 'MACRO', 'SITOLU OMPU', 'TRT764', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.075011', '1.7887', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 4000000, 68000000, 120000000, 0, 1, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 213, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(27, '18TS02B0439', '58/18TS02B0439/I/2018', 'OUTER', 'MACRO', 'MELA II', 'KPD735', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.388628', '2.087546', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI TENGAH', 593000000, 5554500, 68909600, 97200000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 63, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(28, '18TS02B0440', '59/18TS02B0440/I/2018', 'OUTER', 'MACRO', 'PT ANJ AGRI SIAIS', 'PSP778', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.16085', '1.1677', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI SELATAN', 593000000, 5554500, 68909600, 110000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 64, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(29, '18TS02B0441', '60/18TS02B0441/I/2018', 'OUTER', 'MACRO', 'REP. DESA BUKAS', 'PSP761', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.07558', '1.25357', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI SELATAN', 593000000, 5554500, 68909600, 110000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 65, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(30, '18TS02B0442', '61/18TS02B0442/I/2018', 'OUTER', 'MACRO', 'BITUNGAN BEJANGKAR', 'PYB823', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.272079', '0.412171', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. MANDAILING NATAL', 593000000, 5554500, 68909600, 115000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 66, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(31, '18TS02B0443', NULL, 'OUTER', 'MACRO', 'PARBULUAN V', 'SDK140', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.504883', '2.608067', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DAIRI', 593000000, 5554500, 68909600, 120000000, 0, 1, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(32, '18TS02B0444', '62/18TS02B0444/I/2018', 'OUTER', 'MACRO', 'DESA DOLOK HULUAN', 'PMR009', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.7955', '2.8931', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. SIMALUNGUN', 593000000, 4000000, 63573300, 57201000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 67, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(33, '18TS02B0445', '63/18TS02B0445/I/2018', 'OUTER', 'MACRO', 'TANAH MERAH 2', 'KIS930', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.422324', '3.3399396', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 68, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(34, '18TS02B0446', '64/18TS02B0446/I/2018', 'OUTER', 'MACRO', 'TANAH ITAM HILIR', 'KIS929', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.427717', '3.2721335', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 69, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(35, '18TS02B0447', '65/18TS02B0447/I/2018', 'OUTER', 'MACRO', 'DUSUN 9 SUNGAI LAMA (SUNGAI LAMA)', 'KIS903', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.731925', '2.9590028', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 70, '', 'FINISH', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(36, '18TS02B0448', '66/18TS02B0448/I/2018', 'OUTER', 'MACRO', 'SEI SILAU BARAT (LUBUK PALAS)', 'KIS869', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.494414', '2.947145', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 71, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(37, '18TS02B0449', '67/18TS02B0449/I/2018', 'OUTER', 'MACRO', 'NAMAN JAHE', 'STB369', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Winer', 'SST', 42, 'NL', '98.275275', '3.513732', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LANGKAT', 593000000, 4000000, 68909600, 120000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 72, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(38, '18TS02B0397', NULL, 'OUTER', 'MACRO', 'KUTAMBARU 2', 'STB299', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Winer', 'SST', 42, 'NL', '98.265035', '3.842307', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LANGKAT', 593000000, 5554500, 68909600, 120000000, 0, 1, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(39, '18TS02B0398', NULL, 'OUTER', 'MACRO', 'KUALA MUSAM', 'STB294', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Winer', 'SST', 42, 'NL', '98.17654', '3.627852', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LANGKAT', 593000000, 5554500, 68909600, 120000000, 0, 1, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(40, '18TS02B0399', '68/18TS02B0399/I/2018', 'OUTER', 'MACRO', 'PEMUKIMAN BAGERPANG', 'LBP853', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.781948', '3.4119668', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 73, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(41, '18TS02B0400', '69/18TS02B0400/I/2018', 'OUTER', 'MACRO', 'HAMPARAN PERAK 3', 'LBP852', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.584544', '3.76252', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 74, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(42, '18TS02B0401', '70/18TS02B0401/I/2018', 'OUTER', 'MACRO', 'JATI MULYO', 'LBP838', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.992156', '3.533667', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 75, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(43, '18TS02B0402', '71/18TS02B0402/I/2018', 'OUTER', 'MACRO', 'PEMUKIMAN BUKIT CERMIN HILIR', 'LBP867', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '99.0397', '3.3024', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 77777777, 143379827.653354, 28916800, 0, 0, 0, 115000000, 76, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(44, '18TS02B0403', '72/18TS02B0403/I/2018', 'OUTER', 'MACRO', 'RAMBUNG BARU', 'LBP779', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.705397', '3.5443111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 77, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(45, '18TS02B0404', '73/18TS02B0404/I/2018', 'OUTER', 'MACRO', 'DESA DAMAK URAT', 'LBP777', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.983985', '3.218786', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 78, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(46, '18TS02B0405', '74/18TS02B0405/I/2018', 'OUTER', 'MACRO', 'DESA MALASORI', 'LBP775', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '99.0397', '3.302499', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 0, 1, 100000000, 143379827.653354, 28916800, 0, 0, 0, 115000000, 79, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(47, '18TS02B0406', '75/18TS02B0406/I/2018', 'OUTER', 'MACRO', 'AMPALU', 'PAR260', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.69292', '-1.5074', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 80, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(48, '18TS02B0407', '76/18TS02B0407/I/2018', 'OUTER', 'MACRO', 'NAGARI KOTA BESAR', 'MSJ123', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.66686', '-1.197778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 81, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(49, '18TS02B0408', '77/18TS02B0408/I/2018', 'OUTER', 'MACRO', 'RABI JONGOR', 'LSK083', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.712538', '0.290173', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 4000000, 67068000, 100000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 82, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(50, '18TS02B0409', '78/18TS02B0409/I/2018', 'OUTER', 'MACRO', 'PARIK', 'LSK091', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.51527778', '0.32980556', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 4000000, 67068000, 100000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 83, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(51, '18TS02B0410', '79/18TS02B0410/I/2018', 'OUTER', 'MACRO', 'SITUJUAH LADANG LAWEH', 'PAY622', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.6156389', '-0.32252778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 84, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(52, '18TS02B0411', '80/18TS02B0411/I/2018', 'OUTER', 'MACRO', 'PIOBANG', 'PAY624', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.5645773', '-0.21111582', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 85, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(53, '18TS02B0412', '82/18TS02B0412/I/2018', 'OUTER', 'MACRO', 'TAEH BUKIK', 'PAY625', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.6065935', '-0.13123171', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 86, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(54, '18TS02B0413', '83/18TS02B0413/I/2018', 'OUTER', 'MACRO', 'SITANANG', 'PAY626', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.762175', '-0.25707195', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 111111111, 145786664.206196, 28916800, 0, 0, 0, 115000000, 87, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(55, '18TS02B0414', '84/18TS02B0414/I/2018', 'OUTER', 'MACRO', 'LUBUAK LAYANG', 'LSK109', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '100.0591667', '0.55252778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 4000000, 67068000, 100000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 88, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(56, '18TS02B0415', '85/18TS02B0415/I/2018', 'OUTER', 'MACRO', 'LABUAH GUNUANG', 'PAY627', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.7155122', '-0.30738172', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 89, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(57, '18TS02B0416', '86/18TS02B0416/I/2018', 'OUTER', 'MACRO', 'KUBANG', 'PAY628', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.4948488', '-0.14095956', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 90, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(58, '18TS02B0417', '87/18TS02B0417/I/2018', 'OUTER', 'MACRO', 'TALANG MAUA', 'PAY629', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.5523056', '-0.05255556', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 111111111, 145786664.206196, 28916800, 0, 0, 0, 115000000, 91, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(59, '18TS02B0418', '88/18TS02B0418/I/2018', 'OUTER', 'MACRO', 'BARUAH GUNUANG', 'PAY630', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.393313', '0.015777', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 105555555, 145786664.206196, 28916800, 0, 0, 0, 115000000, 92, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(60, '18TS02B0419', '89/18TS02B0419/I/2018', 'OUTER', 'MACRO', 'MALAMPAH', 'LSK114', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '100.048429', '0.045156', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 4000000, 67068000, 100000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 93, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(61, '18TS02B0420', '90/18TS02B0420/I/2018', 'OUTER', 'MACRO', 'LANGUANG', 'LSK121', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '100.0234167', '0.64027778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 4000000, 67068000, 100000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 94, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(62, '18TS02B0421', NULL, 'OUTER', 'MACRO', 'LINGKUANG AUA', 'LSK122', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.75738889', '0.09711111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 0, 1, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(63, '18TS02B0422', '91/18TS02B0422/I/2018', 'OUTER', 'MACRO', 'TALUAK TIGA SAKATO', 'PAR261', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.650426', '-1.497591', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 95, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(64, '18TS02B0423', '92/18TS02B0423/I/2018', 'OUTER', 'MACRO', 'PULAU RAJO INDERAPURA', 'PAR262', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.881255', '-2.02412', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 96, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(65, '18TS02B0370', '93/18TS02B0370/I/2018', 'OUTER', 'MACRO', 'SUNGAI SARIAK', 'PAR263', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.097998', '-2.417165', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 97, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(66, '18TS02B0371', '94/18TS02B0371/I/2018', 'OUTER', 'MACRO', 'VI LINGKUNG', 'PAR264', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.352338', '-0.626971', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 98, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(67, '18TS02B0372', NULL, 'OUTER', 'MACRO', 'HARAPAN JAYA', 'PKR274', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '101.913669', '0.198909', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. PELALAWAN', 593000000, 5554500, 63068000, 170000000, 0, 1, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(68, '18TS02B0373', '95/18TS02B0373/I/2018', 'OUTER', 'MACRO', 'PAGARUYUNG', 'BKG076', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '101.238892', '0.481104', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. KAMPAR', 593000000, 5554500, 63068000, 190000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 99, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(69, '18TS02B0374', '96/18TS02B0374/I/2018', 'OUTER', 'MACRO', 'DANAU LANCANG 2', 'PPN102', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.833353', '0.892489', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 100, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(70, '18TS02B0375', '97/18TS02B0375/I/2018', 'OUTER', 'MACRO', 'KASANGMUNGKAL 2', 'PPN103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.757703', '1.063611', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 101, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(71, '18TS02B0376', '98/18TS02B0376/I/2018', 'OUTER', 'MACRO', 'SEROMBAU INDAH', 'PPN105', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.440558', '0.931839', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 102, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(72, '18TS02B0377', '99/18TS02B0377/I/2018', 'OUTER', 'MACRO', 'BATU TABA', 'BSK100', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.524155', '-0.543869', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 103, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(73, '18TS02B0378', '100/18TS02B0378/I/2018', 'OUTER', 'MACRO', 'BONJOL ABAI SIAT', 'MSJ124', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.623802', '-1.167779', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 104, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(74, '18TS02B0379', '101/18TS02B0379/I/2018', 'OUTER', 'MACRO', 'NAGARI SILAGO', 'MSJ154', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.247417', '-1.019806', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 105, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(75, '18TS02B0380', '102/18TS02B0380/I/2018', 'OUTER', 'MACRO', 'BUKIT JAYA NAGARI RANAH PALABI', 'MSJ156', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.707221', '-0.966686', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 106, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(76, '18TS02B0381', '103/18TS02B0381/I/2018', 'OUTER', 'MACRO', 'KOTO GADANG GUGUAK', 'SLK101', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.671322', '-0.921462', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 4000000, 67068000, 136080000, 0, 1, 111111111, 145786664.206196, 28916800, 0, 0, 0, 115000000, 107, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(77, '18TS02B0382', '104/18TS02B0382/I/2018', 'OUTER', 'MACRO', 'AIE DINGIN', 'SLK102', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.8124019', '-1.14593308', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 4000000, 67068000, 136080000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 108, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(78, '18TS02B0383', NULL, 'OUTER', 'MACRO', 'DILAM', 'SLK103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.7414808', '-0.92024289', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 5554500, 67068000, 136080000, 0, 1, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(79, '18TS02B0384', '105/18TS02B0384/I/2018', 'OUTER', 'MACRO', 'SELAYO', 'SLK104', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.608693', '-0.830375', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 4000000, 67068000, 136080000, 0, 1, 111111111.111111, 145786664.206196, 28916800, 0, 0, 0, 115000000, 109, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(80, '18TS02B0385', '106/18TS02B0385/I/2018', 'OUTER', 'MACRO', 'TANJUNG BARULAK', 'BSK103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.521044', '-0.540758', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 110, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(81, '18TS02B0386', '209/18TS02B0386/I/2018', 'OUTER', 'MACRO', 'KOTO ALAM', 'BSK102', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.71145', '-0.552977', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 0, 1, 200000000, 170786664.206196, 41916800, 0, 0, 0, 115000000, 214, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(82, '18TS02B0387', '107/18TS02B0387/I/2018', 'OUTER', 'MACRO', 'TAMBAK', 'RGT106', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'AMPS', 'SST', 42, 'NL', '102.605237', '-0.3849', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. INDRAGIRI HULU', 593000000, 5545000, 63068000, 135000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 111, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(83, '18TS02B0388', '108/18TS02B0388/I/2018', 'OUTER', 'MACRO', 'TANI MAKMUR', 'RGT103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'AMPS', 'SST', 42, 'NL', '102.372385', '-0.455405', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. INDRAGIRI HULU', 593000000, 5545000, 63068000, 135000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 112, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(84, '18TS02B0389', NULL, 'OUTER', 'MACRO', 'TAMBANGAN', 'BSK101', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.425305', '-0.514237', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 0, 1, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(85, '18TS02B0390', '109/18TS02B0390/I/2018', 'OUTER', 'MACRO', 'KAJAI', 'LSK088', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.941061', '0.17127', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 4000000, 67068000, 100000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 113, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(86, '18TS02B0391', '110/18TS02B0391/I/2018', 'OUTER', 'MACRO', 'JORONG TABUAH', 'SLK087', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.906476', '-1.268073', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 4000000, 67068000, 136080000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 114, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(87, '18TS02B0392', '111/18TS02B0392/I/2018', 'OUTER', 'MACRO', 'MUARA MUSU', 'PPN101', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.39071', '0.980074', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 115, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(88, '18TS02B0393', '112/18TS02B0393/I/2018', 'OUTER', 'MACRO', 'MAHATO', 'PPN100', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.189379', '1.373928', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 116, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(89, '18TS02B0394', '113/18TS02B0394/I/2018', 'OUTER', 'MACRO', 'LUBUAK BATINGKOK', 'PAY621', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.6265556', '-0.15725', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 4000000, 67068000, 140000000, 0, 1, 100000000, 145786664.206196, 28916800, 0, 0, 0, 115000000, 117, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(90, '18TS02B0395', '114/18TS02B0395/I/2018', 'OUTER', 'MACRO', 'DUSUN SUNGAI TAWAR', 'MSK077', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.74955', '-1.085126', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 118, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(91, '18TS02B0396', NULL, 'OUTER', 'MACRO', 'MANDIANGIN BATUBARA', 'SKY269', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.040694', '-2.399306', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(92, '18TS02B0450', '115/18TS02B0450/I/2018', 'OUTER', 'MACRO', 'KAMPUNG BARU', 'TJN101', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '107.62742', '-2.950952', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BELITUNG', 593000000, 4800000, 66150000, 170000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 119, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(93, '18TS02B0451', '116/18TS02B0451/I/2018', 'OUTER', 'MACRO', 'MUARA KIBUL', 'BKO103', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.033013', '-1.92898', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MERANGIN', 593000000, 5337805.2, 68909600, 124234000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 120, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(94, '18TS02B0452', '117/18TS02B0452/I/2018', 'OUTER', 'MACRO', 'SIMPANG LIMBUR 2', 'BKO104', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.422902', '-2.044218', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MERANGIN', 593000000, 5337805.2, 68909600, 124234000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 121, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(95, '18TS02B0453', '118/18TS02B0453/I/2018', 'OUTER', 'MACRO', 'TABIR', 'SRJ097', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.510048', '-1.971233', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. SAROLANGUN', 593000000, 5337805.2, 63709600, 124234000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 122, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(96, '18TS02B0454', '119/18TS02B0454/I/2018', 'OUTER', 'MACRO', 'NILO DINGIN', 'BKO106', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '101.832385', '-2.42709', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MERANGIN', 593000000, 5337805.2, 68909600, 124234000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 123, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(97, '18TS02B0455', '120/18TS02B0455/I/2018', 'OUTER', 'MACRO', 'TALANG KERINCI', 'SGE159', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.71221', '-1.735887', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MUARO JAMBI', 593000000, 5337805.2, 64000000, 145000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 124, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(98, '18TS02B0456', NULL, 'OUTER', 'MACRO', 'RUKAM', 'SGE160', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.784233', '-1.409886', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MUARO JAMBI', 593000000, 5337805.2, 64000000, 145000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(99, '18TS02B0457', '121/18TS02B0457/I/2018', 'OUTER', 'MACRO', 'OP SELATAN', 'KTL117', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.0223', '-1.2226', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG BARAT', 593000000, 5337805.2, 67903200, 120000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 125, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(100, '18TS02B0458', '122/18TS02B0458/I/2018', 'OUTER', 'MACRO', 'DESA KUALA KAHAR', 'KTL119', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.272532', '-0.847129', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG BARAT', 593000000, 5337805.2, 67903200, 120000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 126, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(101, '18TS02B0459', '123/18TS02B0459/I/2018', 'OUTER', 'MACRO', 'BELALAU 2', 'LLG228', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '102.866802', '-3.2064', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA LUBUKLINGGAU', 593000000, 5337805.2, 68909600, 139500000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 127, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(102, '18TS02B0460', '124/18TS02B0460/I/2018', 'OUTER', 'MACRO', 'KARYA SAKTI 2', 'LLG231', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.123655', '-2.947808', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 128, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(103, '18TS02B0461', '125/18TS02B0461/I/2018', 'OUTER', 'MACRO', 'BTS ULU 2', 'LLG233', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.350153', '-3.458299', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 129, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(104, '18TS02B0462', '126/18TS02B0462/I/2018', 'OUTER', 'MACRO', 'MULYO HARJO 2', 'LLG234', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.301817', '-3.489037', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 130, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(105, '18TS02B0463', '127/18TS02B0463/I/2018', 'OUTER', 'MACRO', 'WONOREJO 2', 'LLG243', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.04017', '-3.12402', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 131, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(106, '18TS02B0464', '128/18TS02B0464/I/2018', 'OUTER', 'MACRO', 'SELANGIT 2', 'LLG244', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '102.787201', '-3.184593', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 132, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(107, '18TS02B0465', '129/18TS02B0465/I/2018', 'OUTER', 'MACRO', 'KALIBENING LINGGAU 2', 'LLG245', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '102.983811', '-3.185717', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 133, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(108, '18TS02B0466', '130/18TS02B0466/I/2018', 'OUTER', 'MACRO', 'GEDONG JAYA', 'BLU093', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.945968', '-4.364888', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. WAY KANAN', 593000000, 5337805.2, 67503200, 155000000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 134, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(109, '18TS02B0467', NULL, 'OUTER', 'MACRO', 'MERBAU MENDAHARA', 'MSK072', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.59043', '-1.06355', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(110, '18TS02B0468', '131/18TS02B0468/I/2018', 'OUTER', 'MACRO', 'RANO', 'MSK073', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.773529', '-1.177134', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 135, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(111, '18TS02B0469', '132/18TS02B0469/I/2018', 'OUTER', 'MACRO', 'MENCOLOK', 'MSK074', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.50564', '-1.21497', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 136, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(112, '18TS02B0470', '230/18TS02B0470/I/2018', 'OUTER', 'MACRO', 'PANGKAL DURI', 'MSK075', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.563882', '-0.930482', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 0, 1, 100000000, 234260936.709352, 59436100, 0, 0, 0, 115000000, 215, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(113, '18TS02B0471', '133/18TS02B0471/I/2018', 'OUTER', 'MACRO', 'SINGKEP', 'MSK076', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.77889', '-1.073186', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 137, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(114, '18TS02B0472', '134/18TS02B0472/I/2018', 'OUTER', 'MACRO', 'DESA KARANG DAPO', 'OKU255', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.350659', '-3.856865', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 138, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(115, '18TS02B0473', '135/18TS02B0473/I/2018', 'OUTER', 'MACRO', 'CAMPANG TIGA ULU', 'MPR137', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.826511', '-3.793146', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 139, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(116, '18TS02B0570', '136/18TS02B0570/I/2018', 'OUTER', 'MACRO', 'CAMPANG TIGA ULU', 'MPR136', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.816465', '-3.768209', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 140, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(117, '18TS02B0571', '137/18TS02B0571/I/2018', 'OUTER', 'MACRO', 'DESA KARYA BAKTI', 'MPR135', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.860493', '-3.834329', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 141, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30');
INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `imb_jasa`, `qty_lahan`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(118, '18TS02B0572', '138/18TS02B0572/I/2018', 'OUTER', 'MACRO', 'NIRWANA', 'MPR134', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.860667', '-3.802897', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 142, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(119, '18TS02B0343', '139/18TS02B0343/I/2018', 'OUTER', 'MACRO', 'TULUNG HARAPAN', 'MPR133', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.851193', '-3.912334', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 143, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(120, '18TS02B0344', '140/18TS02B0344/I/2018', 'OUTER', 'MACRO', 'DESA AIR BARU', 'MRD059', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.80747', '-4.390668', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU SELATAN', 593000000, 5337805.2, 66150000, 119500000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 144, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(121, '18TS02B0345', '141/18TS02B0345/I/2018', 'OUTER', 'MACRO', 'DESA KOTA TANAH', 'MPR131', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.7811', '-3.9387', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 145, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(122, '18TS02B0346', '142/18TS02B0346/I/2018', 'OUTER', 'MACRO', 'DUSUN TANJUNG', 'BLU092', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.720312', '-4.470874', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. WAY KANAN', 593000000, 5337805.2, 67503200, 155000000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 146, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(123, '18TS02B0347', '143/18TS02B0347/I/2018', 'OUTER', 'MACRO', 'DUSUN BUAY BAHUGA 2', 'BLU091', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.61008', '-4.25952', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. WAY KANAN', 593000000, 5337805.2, 67503200, 155000000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 147, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(124, '18TS02B0348', '144/18TS02B0348/I/2018', 'OUTER', 'MACRO', 'SUKAJAYA', 'GNS197', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.974005', '-4.961888', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TENGAH', 593000000, 5337805.2, 67503200, 140000000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 148, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(125, '18TS02B0349', '145/18TS02B0349/I/2018', 'OUTER', 'MACRO', 'PANGKALAN BENTENG 2', 'PBI299', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.641134', '-2.841112', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 4000000, 66150000, 160000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 149, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(126, '18TS02B0350', NULL, 'OUTER', 'MACRO', 'SEBELIK ', 'PBI298', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.779153', '-2.727552', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(127, '18TS02B0351', NULL, 'OUTER', 'MACRO', 'ENGGAL REJO 2', 'PBI289', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.006655', '-2.558648', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(128, '18TS02B0352', '146/18TS02B0352/I/2018', 'OUTER', 'MACRO', 'BETUG DALAM', 'PBI288', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.256829', '-2.871115', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 4000000, 66150000, 160000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 150, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(129, '18TS02B0353', '147/18TS02B0353/I/2018', 'OUTER', 'MACRO', 'CENDANA MUARA 2', 'PBI287', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.319747', '-2.464177', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 4000000, 66150000, 160000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 151, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-22 13:34:35'),
(130, '18TS02B0354', '148/18TS02B0354/I/2018', 'OUTER', 'MACRO', 'KARANG SARI 2', 'PBI286', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.712333', '-2.234325', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 4000000, 66150000, 160000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 152, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(131, '18TS02B0355', NULL, 'OUTER', 'MACRO', 'MARGO MULYO 2', 'PBI285', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.219074', '-2.513346', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(132, '18TS02B0356', '149/18TS02B0356/I/2018', 'OUTER', 'MACRO', 'SUNGAI LILIN 4', 'SKY273', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.090592', '-2.647241', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 4000000, 66150000, 185000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 153, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(133, '18TS02B0357', '150/18TS02B0357/I/2018', 'OUTER', 'MACRO', 'SRI KARANGREJO 3', 'SKY272', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.546771', '-2.274602', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 154, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(134, '18TS02B0358', '151/18TS02B0358/I/2018', 'OUTER', 'MACRO', 'SRI KARANGREJO 2', 'SKY271', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.49922', '-2.261907', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 4000000, 66150000, 185000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 155, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(135, '18TS02B0359', NULL, 'OUTER', 'MACRO', 'MUARA SUGIHAN 2', 'PBI284', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.199436', '-2.426966', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 0, 1, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(136, '18TS02B0360', '152/18TS02B0360/I/2018', 'OUTER', 'MACRO', 'KARANG AGUNG', 'SKY270', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.445585', '-2.341117', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 4000000, 66150000, 185000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 156, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(137, '18TS02B0361', '211/18TS02B0361/I/2018', 'OUTER', 'MACRO', 'DESA BUKIT', 'AGR149', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.379147', '-3.842185', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU TENGAH', 593000000, 4000000, 66150000, 130500000, 0, 1, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 216, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(138, '18TS02B0362', '212/18TS02B0362/I/2018', 'OUTER', 'MACRO', 'SINAR JAYA', 'MKO063', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '101.200934', '-2.476694', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. MUKOMUKO', 593000000, 4000000, 66150000, 117000000, 0, 1, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 217, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(139, '18TS02B0363', '153/18TS02B0363/I/2018', 'OUTER', 'MACRO', 'TEBAT AGUNG', 'TIS055', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.835345', '-4.266133', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. SELUMA', 593000000, 4000000, 66150000, 112500000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 157, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(140, '18TS02B0364', '154/18TS02B0364/I/2018', 'OUTER', 'MACRO', 'AIR KEMANG', 'MNA063', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.899026', '-4.396778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU SELATAN', 593000000, 4000000, 66150000, 112500000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 158, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(141, '18TS02B0365', '155/18TS02B0365/I/2018', 'OUTER', 'MACRO', 'DESA TANAH BAWAH', 'SLT125', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.819213', '-2.034464', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA', 593000000, 4800000, 68909600, 170000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 159, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(142, '18TS02B0366', '156/18TS02B0366/I/2018', 'OUTER', 'MACRO', 'DESA SILIP', 'SLT124', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.846658', '-1.765897', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA', 593000000, 4800000, 68909600, 170000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 160, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(143, '18TS02B0367', '157/18TS02B0367/I/2018', 'OUTER', 'MACRO', 'DESA GUDANG', 'TBI068', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '106.038189', '-2.711434', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA SELATAN', 593000000, 4800000, 68909600, 165000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 161, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(144, '18TS02B0368', '158/18TS02B0368/I/2018', 'OUTER', 'MACRO', 'DESA SUKAJAYA', 'TBI067', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '106.18526', '-2.790359', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA SELATAN', 593000000, 4800000, 68909600, 165000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 162, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(145, '18TS02B0369', '159/18TS02B0369/I/2018', 'OUTER', 'MACRO', 'DESA TANJUNG PURA', 'KOB074', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.812802', '-2.371059', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA TENGAH', 593000000, 4800000, 68909600, 170000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 163, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(146, '18TS02B0319', '160/18TS02B0319/I/2018', 'OUTER', 'MACRO', 'DESA SINAR SURYA', 'MTK128', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.70248', '-2.107471', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA BARAT', 593000000, 4800000, 66150000, 170000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 164, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(147, '18TS02B0320', '161/18TS02B0320/I/2018', 'OUTER', 'MACRO', 'PULOKERTO2', 'PLG777', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Girang Makmur', 'SST', 42, 'NL', '104.652919', '-3.026135', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA PALEMBANG', 593000000, 5337805.2, 68909600, 117000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 165, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(148, '18TS02B0321', '162/18TS02B0321/I/2018', 'OUTER', 'MACRO', 'DABUK MAKMUR', 'OKI376', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.13382501', '-3.79903381', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 4000000, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 166, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(149, '18TS02B0322', '163/18TS02B0322/I/2018', 'OUTER', 'MACRO', 'BUMIARJO', 'OKI375', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.97549211', '-3.88004659', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 4000000, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 167, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(150, '18TS02B0323', '164/18TS02B0323/I/2018', 'OUTER', 'MACRO', 'DESA SERAPEK', 'OKI374', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.76564633', '-3.55834791', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 4000000, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 168, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(151, '18TS02B0324', '165/18TS02B0324/I/2018', 'OUTER', 'MACRO', 'KUALA SUNGAI JERUJU', 'OKI373', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.853577', '-3.4909', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 169, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(152, '18TS02B0325', '166/18TS02B0325/I/2018', 'OUTER', 'MACRO', 'CAHAYA MAS 2', 'OKI372', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.7994794', '-4.15270954', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 4000000, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 170, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(153, '18TS02B0326', '167/18TS02B0326/I/2018', 'OUTER', 'MACRO', 'JAYA BAKTI', 'OKI371', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.02237125', '-3.95244704', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 4000000, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 171, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(154, '18TS02B0327', '168/18TS02B0327/I/2018', 'OUTER', 'MACRO', 'DESA KUANG DALEM TIMUR', 'OKI353', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.50486585', '-3.69549538', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN ILIR', 593000000, 5337805.2, 66150000, 135000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 172, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(155, '18TS02B0328', '169/18TS02B0328/I/2018', 'OUTER', 'MACRO', 'MARGA BAKTI', 'OKI367', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.08231117', '-3.95712848', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 4000000, 66150000, 141300000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 173, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(156, '18TS02B0329', '170/18TS02B0329/I/2018', 'OUTER', 'MACRO', 'SRI TEJO KENCONO', 'GNS196', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.34139', '-5.01838', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TENGAH', 593000000, 5337805.2, 67503200, 140000000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 174, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(157, '18TS02B0330', '171/18TS02B0330/I/2018', 'OUTER', 'MACRO', 'RAMAYANA 3 LAMTENG', 'GNS195', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.30958', '-4.927561', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TENGAH', 593000000, 5337805.2, 67503200, 140000000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 175, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(158, '18TS02B0331', '172/18TS02B0331/I/2018', 'OUTER', 'MACRO', 'PT NEF 2', 'SKD179', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.591912', '-5.021576', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TIMUR', 593000000, 5337805.2, 68909600, 127125000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 176, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(159, '18TS02B0332', '173/18TS02B0332/I/2018', 'OUTER', 'MACRO', 'KAWASAN INDUSTRI PT. ILP 2', 'MGA220', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.651285', '-4.42631', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TULANG BAWANG', 593000000, 5337805.2, 66150000, 126360000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 177, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(160, '18TS02B0333', '174/18TS02B0333/I/2018', 'OUTER', 'MACRO', 'BATU AMPAR', 'MNA062', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '103.120531', '-4.378711', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU SELATAN', 593000000, 4000000, 66150000, 112500000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 178, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(161, '18TS02B0334', '175/18TS02B0334/I/2018', 'OUTER', 'MACRO', 'TANJUNG BENANAK SP3', 'KTL115', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.971254', '-1.342375', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG BARAT', 593000000, 5337805.2, 67903200, 120000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 179, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(162, '18TS02B0335', '176/18TS02B0335/I/2018', 'OUTER', 'MACRO', 'WAY MEGAT', 'KLA292', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.632122', '-5.617671', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG SELATAN', 593000000, 5337805.2, 67503200, 140814000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 180, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(163, '18TS02B0336', '177/18TS02B0336/I/2018', 'OUTER', 'MACRO', 'GANDRI', 'KLA291', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.71778', '-5.69314', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG SELATAN', 593000000, 5337805.2, 67503200, 140814000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 181, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(164, '18TS02B0337', '178/18TS02B0337/I/2018', 'OUTER', 'MACRO', 'BALI AGUNG', 'KLA290', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.6643', '-5.60978', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG SELATAN', 593000000, 5337805.2, 67503200, 140814000, 0, 1, 100000000, 138196003.222957, 28137800, 0, 0, 0, 115000000, 182, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(165, '18TS02B0338', '179/18TS02B0338/I/2018', 'OUTER', 'MACRO', 'SUMBER JAYA', 'PGA040', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '103.242691', '-4.099561', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA PAGAR ALAM', 593000000, 4000000, 66150000, 166500000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 183, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(166, '18TS02B0339', '180/18TS02B0339/I/2018', 'OUTER', 'MACRO', 'DESA MIDAR', 'SAT221', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.373996', '-3.273663', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUARA ENIM', 593000000, 4000000, 68909600, 135000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 184, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(167, '18TS02B0340', '181/18TS02B0340/I/2018', 'OUTER', 'MACRO', 'DESA PURBASARI', 'LHT188', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '103.27279', '-3.662409', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. LAHAT', 593000000, 4000000, 66150000, 135000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 185, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(168, '18TS02B0341', '182/18TS02B0341/I/2018', 'OUTER', 'MACRO', 'SPBU SUNGAI BENGKAL', 'MTB088', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.695532', '-1.536659', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TEBO', 593000000, 5337805.2, 68909600, 150000000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 186, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(169, '18TS02B0342', '183/18TS02B0342/I/2018', 'OUTER', 'MACRO', 'KOTA PADANG', 'MRD058', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.770819', '-4.336952', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU SELATAN', 593000000, 5337805.2, 66150000, 119500000, 0, 1, 100000000, 144260936.709352, 29436100, 0, 0, 0, 115000000, 187, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(170, '18TS02B0515', '213/18TS02B0515/I/2018', 'OUTER', 'MACRO', 'BNPUHUN_LS_MTRATEL', 'TRG042', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.799781', '-0.27912', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. KUTAI KARTANEGARA', 593000000, 7452900, 74373300, 99000000, 0, 1, 166666666, 165920731.825815, 33675900, 0, 0, 0, 115000000, 218, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 05:26:09'),
(171, '18TS02B0514', '184/18TS02B0514/I/2018', 'OUTER', 'MACRO', 'TELAGA_SARI', 'KBA054', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '116.0078457821349', '-3.150903567679367', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. KOTABARU', 593000000, 7452900, 59535000, 105000000, 0, 1, 105555556, 165920731.825815, 33675900, 0, 0, 0, 115000000, 188, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 05:39:32'),
(172, '18TS02B0513', '223/18TS02B0513/III/2018', 'OUTER', 'MACRO', 'KAMPUNG TENGAH 122222', 'KSN022', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'GRAND TELECOM 122222', 'SST', 42, 'NL', '', '', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN TIMUR 122222', 593000000, 7452900, 74373300, 140000000, 0, 10, 10000000, 0, 0, 0, 0, 0, 0, 316, '', 'PROCUREMENT - MANAGER PROCUREMENT', '2018-03-18 23:32:30', '2018-04-29 01:24:20'),
(173, '18TS02B0512', '185/18TS02B0512/I/2018', 'OUTER', 'MACRO', 'BAMBAN', 'TML055', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '115.269923', '-2.168593', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. BARITO SELATAN', 593000000, 7452900, 55800000, 90000000, 0, 1, 88888888, 165920731.825815, 33675900, 0, 0, 0, 115000000, 189, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-04-09 02:29:12'),
(174, '18TS02B0511', '186/18TS02B0511/I/2018', 'OUTER', 'MACRO', 'CENAYAN', 'SHR026', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '110.681564', '-0.413754', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SANGGAU', 593000000, 7644000, 59535000, 112600000, 0, 1, 85555555, 169553519.015634, 33675900, 0, 0, 0, 115000000, 190, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(175, '18TS02B0510', '214/18TS02B0510/I/2018', 'OUTER', 'MACRO', 'BATU KOTAM', 'NIK010', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.554047', '-2.285244', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 0, 1, 100000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 219, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(176, '18TS02B0509', '215/18TS02B0509/I/2018', 'OUTER', 'MACRO', 'NATAI BARU', 'PBU053', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.659258', '-2.623942', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 0, 1, 77777777, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 220, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 20:11:28'),
(177, '18TS02B0508', '187/18TS02B0508/I/2018', 'OUTER', 'MACRO', 'SPLIT_SEROJA_SEC1', 'BLC078', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '115.9205162250223', '-3.293494746638242', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. KOTABARU', 593000000, 7452900, 59535000, 105000000, 0, 1, 122222222, 165920731.825815, 33675900, 0, 0, 0, 115000000, 191, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(178, '18TS02B0507', '224/18TS02B0507/III/2018', 'OUTER', 'MACRO', 'BELITANG DUA', 'SHR030', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'NAYAKANFGFDG', 'SST', 42, 'NL', '', '', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SANGGAU', 593000000, 7644000, 59535000, 112600000, 0, 10, 10000000, 0, 0, 0, 0, 0, 0, 315, '', 'PROCUREMENT - MANAGER PROCUREMENT', '2018-03-18 23:32:30', '2018-04-29 01:24:16'),
(179, '18TS02B0506', '216/18TS02B0506/I/2018', 'OUTER', 'MACRO', 'DEHES', 'KSN028', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '113.194035', '-1.404312', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN TIMUR', 593000000, 7452900, 74373300, 140000000, 0, 1, 77777777, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 221, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(180, '18TS02B0505', '188/18TS02B0505/I/2018', 'OUTER', 'MACRO', '2120195_PKLNBUNTIMUR_CDC', 'PBU088', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.689444', '-2.604504', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 0, 1, 88888888, 165920731.825815, 33675900, 0, 0, 0, 115000000, 192, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(181, '18TS02B0504', '189/18TS02B0504/I/2018', 'OUTER', 'MACRO', 'PTANISENABAH', 'SBS063', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '109.507658', '1.349842', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SAMBAS', 593000000, 7644000, 59535000, 125000000, 0, 1, 88888888, 169553519.015634, 33675900, 0, 0, 0, 115000000, 193, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(182, '18TS02B0503', NULL, 'OUTER', 'MACRO', '212A078L1_GMSAJANG2_CDC', 'SMA028', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.1858889', '-2.121861111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 0, 1, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(183, '18TS02B0502', '190/18TS02B0502/I/2018', 'OUTER', 'MACRO', 'JAMBU KURIPAN', 'MRB080', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.7672727942891', '-2.712160082001645', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 0, 1, 88888888, 165920731.825815, 33675900, 0, 0, 0, 115000000, 194, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(184, '18TS02B0501', '191/18TS02B0501/I/2018', 'OUTER', 'MACRO', 'PT. TBM', 'RTA022', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '114.8823', '-2.703206', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. TAPIN', 593000000, 7452900, 59535000, 90000000, 0, 1, 0, 165920731.825815, 33675900, 0, 0, 0, 115000000, 195, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(185, '18TS02B0500', '192/18TS02B0500/I/2018', 'OUTER', 'MACRO', 'PATIH SELERA', 'MRB096', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.63615', '-3.083282', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 0, 1, 77777778, 165920731.825815, 33675900, 0, 0, 0, 115000000, 196, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(186, '18TS02B0499', '193/18TS02B0499/I/2018', 'OUTER', 'MACRO', 'TANIPAH', 'MRB098', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.667116', '-3.228773', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 0, 1, 88888888, 165920731.825815, 33675900, 0, 0, 0, 115000000, 197, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(187, '18TS02B0498', '194/18TS02B0498/I/2018', 'OUTER', 'MACRO', 'PATIH MUHUR BARU', 'MRB106', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.559378', '-3.149151', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 0, 1, 88888888, 165920731.825815, 33675900, 0, 0, 0, 115000000, 198, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(188, '18TS02B0497', '195/18TS02B0497/I/2018', 'OUTER', 'MACRO', 'BELANDEAN', 'MRB107', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.5914097975355', '-3.188992151435884', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 0, 1, 88888888, 165920731.825815, 33675900, 0, 0, 0, 115000000, 199, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(189, '18TS02B0496', '196/18TS02B0496/I/2018', 'OUTER', 'MACRO', 'KTC COAL MINING', 'KKP128', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '114.46271', '-1.01488', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KAPUAS', 593000000, 7452900, 55800000, 90000000, 0, 1, 77777778, 165920731.825815, 33675900, 0, 0, 0, 115000000, 200, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(190, '18TS02B0495', '217/18TS02B0495/I/2018', 'OUTER', 'MACRO', 'PT. BUMITAMA GUNAJAYA AGRO', 'KTP112', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '110.486376', '-2.266567', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. KETAPANG', 593000000, 7644000, 59535000, 91000000, 0, 1, 88888888, 169553519.0156344, 33675900, 0, 0, 0, 115000000, 222, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(191, '18TS02B0494', NULL, 'OUTER', 'MACRO', 'DEIYAI 2', 'ENT021', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '136.269243', '-4.07145', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. PANIAI', 593000000, 15729000, 40060980, 42750000, 0, 1, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(192, '18TS02B0493', NULL, 'OUTER', 'MACRO', 'KASUNAWEJA 2', 'SMI023', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '138.032651', '-2.300274', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 0, 1, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(193, '18TS02B0492', '197/18TS02B0492/I/2018', 'OUTER', 'MACRO', 'UPT ARSO V / WIYANTRI', 'WRS053', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.626', '-2.81524', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 0, 1, 77777777, 252324013.574896, 31500000, 0, 0, 0, 115000000, 201, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(194, '18TS02B0491', NULL, 'OUTER', 'MACRO', 'SUGAPA', 'ENT020', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '137.0403', '-3.73889', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. PANIAI', 593000000, 15729000, 40060980, 42750000, 0, 1, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(195, '18TS02B0490', '218/18TS02B0490/I/2018', 'OUTER', 'MACRO', 'PEMDA MAYBRAT 2', 'TMB052', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '132.194082', '-1.275396', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. SORONG SELATAN', 593000000, 15729000, 43624980, 56700000, 0, 1, 100000000, 252324013.574896, 31500000, 0, 0, 0, 115000000, 223, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 06:59:20'),
(196, '18TS02B0489', NULL, 'OUTER', 'MACRO', 'B2S BANDARA NDUGA (2G NEW COVERAGE)', 'AGA021', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '138.382898', '-4.6165', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 593000000, 15729000, 41194980, 51300000, 0, 1, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-26 06:40:23'),
(197, '18TS02B0488', NULL, 'OUTER', 'MACRO', 'BIME OKSIBI', 'OKS008', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '140.218595', '-4.484909', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 593000000, 15729000, 41194980, 51300000, 0, 1, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(198, '18TS02B0487', '198/18TS02B0487/I/2018', 'OUTER', 'MACRO', 'B2S HUBIKIAK JAYAWIJAYA', 'WAM088', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '138.891974', '-4.041135', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 593000000, 15729000, 41194980, 51300000, 0, 1, 88888888, 252324013.574896, 31500000, 30000000, 0, 0, 115000000, 202, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(199, '18TS02B0486', '199/18TS02B0486/I/2018', 'OUTER', 'MACRO', 'SAIRO', 'MWR222', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '134.038635', '-0.802639', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. MANOKWARI', 593000000, 15729000, 41092200, 85000000, 0, 1, 122222222, 252324013.574896, 31500000, 0, 0, 0, 115000000, 203, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 05:09:46'),
(200, '18TS02B0485', '200/18TS02B0485/I/2018', 'OUTER', 'MACRO', 'WERSAR', 'TMB055', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '131.990039', '-1.468925', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. SORONG SELATAN', 593000000, 15729000, 43624980, 56700000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 204, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(201, '18TS02B0484', '219/18TS02B0484/I/2018', 'OUTER', 'MACRO', 'PLTA OREA', 'JAP645', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.01588', '-2.639646', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 0, 1, 100000000, 252324013.574896, 31500000, 0, 0, 0, 115000000, 224, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 05:13:13'),
(202, '18TS02B0483', '201/18TS02B0483/I/2018', 'OUTER', 'MACRO', 'NIMBOTONG', 'JAP676', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.03206', '-2.590674', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 205, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(203, '18TS02B0482', '202/18TS02B0482/I/2018', 'OUTER', 'MACRO', 'WATARIRI', 'MWR208', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '134.209293', '-1.250903', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. MANOKWARI', 593000000, 15729000, 41092200, 85000000, 0, 1, 88888888, 252324013.574896, 31500000, 30000000, 0, 0, 115000000, 206, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 06:53:10'),
(204, '18TS02B0481', '220/18TS02B0481/I/2018', 'OUTER', 'MACRO', 'WERSAR', 'TMB043', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '131.97556', '-1.480319', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. SORONG SELATAN', 593000000, 15729000, 43624980, 56700000, 0, 1, 100000000, 252324013.574896, 31500000, 0, 0, 0, 115000000, 225, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(205, '18TS02B0480', '203/18TS02B0480/I/2018', 'OUTER', 'MACRO', 'WANGGAR SARI', 'NAB097', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.345654', '-3.41487', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 207, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 06:51:27'),
(206, '18TS02B0479', '204/18TS02B0479/I/2018', 'OUTER', 'MACRO', 'MAIDEI', 'NAB094', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.832412', '-3.216261', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 208, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-26 06:32:02'),
(207, '18TS02B0478', '205/18TS02B0478/I/2018', 'OUTER', 'MACRO', 'SP 1 LAGARI', 'NAB120', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.730646', '-3.179111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 209, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-31 22:56:57'),
(208, '18TS02B0477', '206/18TS02B0477/I/2018', 'OUTER', 'MACRO', 'WAROKI', 'NAB098', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.42027', '-3.368092', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 210, '', 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(209, '18TS02B0476', '207/18TS02B0476/I/2018', 'OUTER', 'MACRO', 'YENUSI', 'BIA132', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '136.20628', '-1.172758', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. BIAK NUMFOR', 593000000, 15729000, 41092200, 85000000, 0, 1, 88888888, 252324013.574896, 31500000, 0, 0, 0, 115000000, 438, '', 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-18 23:32:30', '2018-06-08 09:19:46'),
(210, '18TS02B0475', NULL, 'OUTER', 'MACRO', 'PALU_1233', 'SAK074', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'XLA', 'SST', 42, 'NL', '123.587359', '-1.712771', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. BANGGAI', 593000000, 8516448, 42601500, 71100000, 0, 1, 80000000, 152112482.5, 30168400, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-31 22:53:59'),
(211, '18TS02B0474', '33/18TS02B0474/I/2018\r\n', 'OUTER', 'MACRO', 'KENDARI_70', 'RHA112', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 62, 'NL', '122.372935', '-4.751561', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. MUNA', 593000000, 8516448.003, 42945300, 63000000, 0, 1, 88888888, 350743833, 30168400, 0, 0, 0, 187685172.6, 436, '', 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-18 23:32:30', '2018-06-08 09:19:37'),
(212, '18TS02B0520', NULL, 'OUTER', 'MACRO', 'PALU_1541', 'DGL142', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Asa Berkat', 'SST', 42, 'NL', '119.695882', '-0.129828', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. DONGGALA', 593000000, 8516448.002999999, 42601500, 75600000, 0, 1, 80000000, 152112482.49748164, 30168400, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-18 23:32:30'),
(213, '18TS02B0519', NULL, 'OUTER', 'MACRO', 'PALU_1540', 'PAL433', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Asa Berkat', 'SST', 42, 'NL', '120.132385', '-1.190754', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. DONGGALA', 593000000, 8516448.002999999, 42601500, 75600000, 0, 1, 80000000, 152112482.49748164, 30168400, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-26 06:37:59'),
(214, '18TS02B0518', NULL, 'OUTER', 'MACRO', 'KENDARI_101', 'RHA098', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.387663', '-4.847085', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. MUNA', 593000000, 8516448, 42945300, 63000000, 0, 1, 80000000, 151825305.67, 30168400, 0, 0, 0, 115000000, 0, '', 'NEW', '2018-03-18 23:32:30', '2018-03-26 05:36:43'),
(215, '18TS02B0517', '208/18TS02B0517/I/2018', 'OUTER', 'MACRO', 'KENDARI_221', 'UNH051', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.222188', '-3.990222', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 593000000, 8516448.003, 42945300, 81000000, 0, 1, 88888888, 151825305.672588, 30168400, 0, 0, 0, 115000000, 439, '', 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-18 23:32:30', '2018-06-08 09:19:49'),
(216, '18TS02B0516', '12/18TS02B0516/I/2018\r\n', 'OUTER', 'MACRO', 'WEDA BAY NIKEL', 'SSU020', 'AREA 4', 'PUMA', 'MALUKU', 'Nahrul Arbah', 'SST', 52, 'NL', '127.934238', '0.465702', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'MALUKU UTARA', 'KAB. HALMAHERA TENGAH', 593000000, 13482000, 58500000, 85000000, 0, 1, 122222222, 372762384, 31500000, 0, 0, 0, 115000000, 437, '', 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-18 23:32:30', '2018-06-08 09:19:43'),
(217, '18TS02B0310', NULL, 'OUTER', 'MACRO', 'PRINGSEWU IV', 'KOT171', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.988416', '-5.347441', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(218, '18TS02B0311', NULL, 'OUTER', 'MACRO', 'GEDUNG TATAAN V', 'KOT166', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.092211', '-5.365295', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. PESAWARAN', 805000000, 5337805.2, 84379000, 140000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(219, '18TS02B0312', NULL, 'OUTER', 'MACRO', 'CAMPANG 2', 'KOT173', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.735547', '-5.4125', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(220, '18TS02B0313', NULL, 'OUTER', 'MACRO', 'FAJAR ESUK 2', 'KOT169', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.95389', '-5.335235', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(221, '18TS02B0314', NULL, 'OUTER', 'MACRO', 'GEDUNG TATAAN IV', 'KOT170', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.078756', '-5.372757', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(222, '18TS02B0315', NULL, 'OUTER', 'MACRO', 'PASAR KETAHUN', 'AGR138', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '101.823434', '-3.37948', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU UTARA', 805000000, 5337805.2, 66150000, 130500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(223, '18TS02B0316', NULL, 'OUTER', 'MACRO', 'URAI', 'AGR139', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '101.835027', '-3.368428', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU UTARA', 805000000, 5337805.2, 66150000, 130500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29');
INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `imb_jasa`, `qty_lahan`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(224, '18TS02B0317', '228/18TS02B0317/III/2018', 'OUTER', 'MACRO', 'BATU BANDUNG 2', 'KPH020', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'TRANSDATA', 'SST', 42, 'NL', '102.723836', '-3.651373', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. KEPAHIANG', 805000000, 5337805.2, 66150000, 160920000, 0, 1, 100000000, 0, 0, 0, 0, 0, 0, 363, '', 'CANCEL', '2018-03-21 16:47:29', '2018-05-10 23:43:51'),
(225, '18TS02B0318', '227/18TS02B0318/III/2018', 'OUTER', 'MACRO', 'PERKANTORAN PGA', 'PGA038', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '103.201165', '-4.041909', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA PAGAR ALAM', 805000000, 5337805.2, 66150000, 166500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 364, '', 'PROCUREMENT - MANAGER PROCUREMENT', '2018-03-21 16:47:29', '2018-05-10 23:44:16'),
(226, '18TS02B0573', '1/18TS02B0573/I/2018\r\n', 'INNER', 'MACRO', 'BANGKAL BINANGUN', 'CLP768', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 52, 'NL', '109.263397\r\n', '-7.651109\r\n', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. CILACAP', 805000000, 5733000, 92742000, 127710000, 0, 1, 177777777.777778, 0, 0, 0, 0, 0, 0, 398, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:22:53'),
(227, '18TS02B0574', NULL, 'INNER', 'MACRO', 'CANGKOL MOJOLABAN', 'SKH775', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.892799', '-7.612757', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SUKOHARJO', 805000000, 5733000, 105000000, 135000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(228, '18TS02B0575', '2/18TS02B0575/I/2018', 'INNER', 'MACRO', 'PUNGGANGAN LIMPUNG', 'BAT669', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 52, 'NL', '109.926058', '-6.991209', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. BATANG', 805000000, 5733000, 104000000, 90000000, 0, 1, 177777777.777778, 0, 0, 0, 0, 0, 0, 399, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:22:58'),
(229, '18TS02B0576', '3/18TS02B0576/I/2018', 'INNER', 'MACRO', 'MUNTUNG', 'TMG678', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 52, 'NL', '110.054431', '-7.215226', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. TEMANGGUNG', 805000000, 5733000, 92742000, 110000000, 0, 1, 183333333.333333, 0, 0, 0, 0, 0, 0, 400, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:01'),
(230, '18TS02B0577', NULL, 'INNER', 'MACRO', 'SENTONO', 'KLT674', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.72162', '-7.700252', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. KLATEN', 805000000, 5733000, 92742000, 108000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(231, '18TS02B0578', '4/18TS02B0578/I/2018', 'INNER', 'MACRO', 'JOHO PRAMBANAN', 'KLT686', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 52, 'NL', '110.513227', '-7.722244', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. KLATEN', 805000000, 5733000, 92742000, 124200000, 0, 1, 166666666.666667, 0, 0, 0, 0, 0, 0, 401, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:04'),
(232, '18TS02B0579', '5/18TS02B0579/I/2018', 'INNER', 'MACRO', 'RAKIT KULON', 'BJN678', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 52, 'NL', '109.52571', '-7.437893', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. PURBALINGGA', 805000000, 5733000, 92742000, 126000000, 0, 1, 166666666, 0, 0, 0, 0, 0, 0, 402, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:07'),
(233, '18TS02B0580', '6/18TS02B0580/I/2018', 'INNER', 'MACRO', 'BENDO KEDUNGUPIT', 'SRA718', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 52, 'NL', '110.96595', '-7.362287', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SRAGEN', 805000000, 5733000, 92742000, 135000000, 0, 1, 164444444.444444, 0, 0, 0, 0, 0, 0, 403, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:11'),
(234, '18TS02B0581', NULL, 'INNER', 'MACRO', 'BANDARA GLAGAH', 'WAT655', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.078137', '-7.90542', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'DI YOGYAKARTA', 'KAB. KULON PROGO', 805000000, 5733000, 92742000, 130000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(235, '18TS02B0582', NULL, 'INNER', 'MACRO', 'CANDI GEDONGSONGO', 'UNR764', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '110.341865', '-7.210358', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SEMARANG', 805000000, 5733000, 105000000, 125000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(236, '18TS02B0583', NULL, 'INNER', 'MACRO', 'KEBONAGUNG', 'UNR765', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '110.301131', '-7.26163', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SEMARANG', 805000000, 5733000, 105000000, 125000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(237, '18TS02B0584', '7/18TS02B0584/I/2018', 'INNER', 'MACRO', 'BLIGOREJO DORO', 'PKL712', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 52, 'NL', '109.693556', '-7.005004', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. PEKALONGAN', 805000000, 5733000, 92742000, 124200000, 0, 1, 161111111.111111, 0, 0, 0, 0, 0, 0, 404, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:14'),
(238, '18TS02B0585', NULL, 'INNER', 'MACRO', 'DESA BENTEK', 'MTR308', 'AREA 3', 'BALNUS', 'NTB', 'Symmetry Contrating', 'SST', 42, 'NL', '116.082184', '-8.443817', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'NUSA TENGGARA BARAT', 'KAB. LOMBOK BARAT', 805000000, 6497400, 62637000, 78210000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(239, '18TS02B0586', NULL, 'INNER', 'MACRO', 'PADANGBULIA3', 'SGR173', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.140486', '-8.172745', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. BULELENG', 805000000, 4968600, 95000000, 200000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(240, '18TS02B0587', '13/18TS02B0587/I/2018', 'INNER', 'MACRO', 'MAUBESI3', 'KEF069', 'AREA 3', 'BALNUS', 'NTT', 'Symmetry Contrating', 'SST', 52, 'NL', '124.505728', '-9.491099', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'NUSA TENGGARA TIMUR', 'KAB. TIMOR TENGAH UTARA', 805000000, 6497400, 72000000, 84250000, 0, 1, 77777777, 0, 0, 0, 0, 0, 0, 405, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:18'),
(241, '18TS02B0588', NULL, 'INNER', 'MACRO', 'GELGEL', 'KLK076', 'AREA 3', 'BALNUS', 'BALI', 'Agcia Pertiwi', 'SST', 42, 'NL', '115.417855', '-8.571506', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(242, '18TS02B0589', NULL, 'INNER', 'MACRO', 'SAMPALAN', 'KLK078', 'AREA 3', 'BALNUS', 'BALI', 'Agcia Pertiwi', 'SST', 42, 'NL', '115.544369', '-8.727837', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(243, '18TS02B0590', NULL, 'INNER', 'MACRO', 'KEBON', 'BLI064', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.399549', '-8.393306', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. BANGLI', 805000000, 4968600, 115000000, 220000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(244, '18TS02B0591', NULL, 'INNER', 'MACRO', 'LEMBONGAN', 'KLK097', 'AREA 3', 'BALNUS', 'BALI', 'Agcia Pertiwi', 'SST', 42, 'NL', '115.459548', '-8.689192', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(245, '18TS02B0592', NULL, 'INNER', 'MACRO', 'ANTIGA KELOD', 'APR112', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.487565', '-8.530953', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KARANGASEM', 805000000, 4968600, 105000000, 240000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(246, '18TS02B0593', '229/18TS02B0593/III/2018', 'INNER', 'MACRO', 'SANGKAN GUNUNG', 'APR135', 'AREA 3', 'BALNUS', 'BALI', 'SANJIWAHANA PERSADA', 'SST', 42, 'NL', '115.425317', '-8.469979', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 593000000, 4968600, 105000000, 225000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 376, '', 'AREA - GENERAL MANAGER AREA', '2018-03-21 16:47:29', '2018-06-06 06:30:53'),
(247, '18TS02B0594', NULL, 'INNER', 'MACRO', 'BENDO MUNGALBANGIL', 'PSN420', 'AREA 3', 'JATIM', 'JATIM', 'Primatama Konstruksi', 'SST', 42, 'NL', '112.78725', '-7.59171', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. PASURUAN', 805000000, 5236140, 57821000, 151650000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(248, '18TS02B0595', '8/18TS02B0595/I/2018\r\n', 'INNER', 'MACRO', 'TUNJUNGTIRTOSINGOSARI1', 'MLG128', 'AREA 3', 'JATIM', 'JATIM', 'Infrako', 'SST', 42, 'NL', '112.63656', '-7.911175', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 805000000, 5236140, 62821000, 131850000, 0, 1, 155555555, 0, 0, 0, 0, 0, 0, 406, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:21'),
(249, '18TS02B0596', '233/18TS02B0596/III/2018', 'INNER', 'MACRO', 'KEPUHARJOKARANGPLOSO1', 'MLG127', 'AREA 3', 'JATIM', 'JATIM', 'PGN', 'SST', 42, 'NL', '112.627845', '-7.910788', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 593000000, 5236140, 62821000, 131850000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 380, '', 'AREA - GENERAL MANAGER AREA', '2018-03-21 16:47:29', '2018-06-06 06:35:23'),
(250, '18TS02B0597', '231/18TS02B0597/III/2018', 'INNER', 'MACRO', 'PAGENTANSINGOSARI1', 'MLG125', 'AREA 3', 'JATIM', 'JATIM', 'INFRAKO', 'SST', 42, 'NL', '112.6593', '-7.89251', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 593000000, 5236140, 62821000, 131850000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 378, '', 'AREA - GENERAL MANAGER AREA', '2018-03-21 16:47:29', '2018-06-06 06:32:01'),
(251, '18TS02B0598', '232/18TS02B0598/III/2018', 'INNER', 'MACRO', 'CANDIRENGGOSINGOSARI', 'MLG124', 'AREA 3', 'JATIM', 'JATIM', 'PGN', 'SST', 42, 'NL', '112.656467', '-7.889', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 593000000, 5236140, 62821000, 131850000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 379, '', 'AREA - GENERAL MANAGER AREA', '2018-03-21 16:47:29', '2018-06-06 06:33:40'),
(252, '18TS02B0599', '230/18TS02B0599/III/2018', 'INNER', 'MACRO', 'BANJARSARICERME1', 'GSK366', 'AREA 3', 'JATIM', 'JATIM', 'PRIMATAMA KONSTRUKSI', 'SST', 42, 'NL', '112.586783', '-7.181367', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. GRESIK', 593000000, 5236140, 62821000, 146700000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 377, '', 'AREA - GENERAL MANAGER AREA', '2018-03-21 16:47:29', '2018-06-06 06:31:27'),
(253, '18TS02B0555', NULL, 'OUTER', 'MACRO', '3419_PAHAUMAN', 'NBA010', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Grand Telecom', 'SST', 42, 'NL', '109.635321', '0.271617', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KOTA PONTIANAK', 805000000, 7644000, 82637000, 125000000, 0, 1, 87000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 05:38:53'),
(254, '18TS02B0554', NULL, 'OUTER', 'MACRO', 'PT BUHUT', 'KKP002', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '114.483', '-1.12148', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KAPUAS', 805000000, 7452900, 62000000, 90000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(255, '18TS02B0553', NULL, 'OUTER', 'MACRO', '311CD15G9_SUNGAIBARU_XL', 'SBS031', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Grand Telecom', 'SST', 42, 'NL', '109.1985', '1.352888889', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SAMBAS', 805000000, 7644000, 66150000, 125000000, 0, 1, 80000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 05:39:06'),
(256, '18TS02B0552', NULL, 'OUTER', 'MACRO', 'GN. MAKMUR 2', 'PNJ027', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.4139030393668', '-1.514078401808324', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 0, 1, 80000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 06:57:54'),
(257, '18TS02B0551', NULL, 'OUTER', 'MACRO', 'DS SULILIRAN BARU', 'TGT073', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.25543', '-1.98525', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 0, 1, 100000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 06:06:03'),
(258, '18TS02B0550', '9/18TS02B0550/I/2018', 'OUTER', 'MACRO', 'PIANSAK', 'KTP096', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 52, 'NL', '110.396647', '-1.70836', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. KETAPANG', 805000000, 7644000, 66150000, 91000000, 0, 1, 111111111, 0, 0, 0, 0, 0, 0, 407, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:24'),
(259, '18TS02B0549', NULL, 'OUTER', 'MACRO', 'MA SUBUSSALAM KUARO', 'TGT077', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.0944', '-1.81984', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 0, 1, 90000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 06:45:15'),
(260, '18TS02B0548', NULL, 'OUTER', 'MACRO', 'SMPN 20 BALIKPAPAN', 'BPP126', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.88365', '-1.13222', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KOTA BALIKPAPAN', 805000000, 7452900, 82637000, 162000000, 0, 1, 80000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 05:32:18'),
(261, '18TS02B0547', NULL, 'OUTER', 'MACRO', 'STKIP PAMANE TALINO_LS_KDI', 'NBA065', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Grand Telecom', 'SST', 42, 'NL', '109.938236', '0.340363', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KOTA PONTIANAK', 805000000, 7644000, 82637000, 125000000, 0, 1, 90000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 05:41:03'),
(262, '18TS02B0546', NULL, 'OUTER', 'MACRO', 'DS SEBAKUNG TAKA', 'TGT072', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.42778', '-1.56222', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 0, 1, 100000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 06:35:09'),
(263, '18TS02B0545', '226/18TS02B0545/III/2018', 'OUTER', 'MACRO', 'PANGKUT II1234', 'KKN036', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'NAYAKA 1234', 'SST', 42, 'NL', '-3242', 'dddd', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KAPUAS 1234', 593000000, 7452900, 62000000, 90000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 367, '', 'REPAIR PROCUREMENT - STAFF PROCUREMENT', '2018-03-21 16:47:29', '2018-05-10 23:46:01'),
(264, '18TS02B0543', NULL, 'OUTER', 'MACRO', 'PERTAMINA EP BALIKPAPAN', 'BPP046', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.87214', '-1.266262', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KOTA BALIKPAPAN', 805000000, 7452900, 82637000, 162000000, 0, 1, 90000000, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-26 05:47:46'),
(265, '18TS02B0542', NULL, 'OUTER', 'MACRO', 'MCP KAMPUS STKIP WAMENA', 'WAM084', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '138.944845', '-4.047568', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 805000000, 15729000, 45772200, 51300000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(266, '18TS02B0541', NULL, 'OUTER', 'MACRO', 'ASANO_4', 'JAP021', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.68126', '-2.61089', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 805000000, 15729000, 46312200, 75000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(267, '18TS02B0540', '14/18TS02B0540/I/2018', 'OUTER', 'MACRO', 'MAKASSAR_409', 'MRS159', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'XLA', 'SST', 42, 'NL', '119.530171', '-5.151087', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. MAROS', 805000000, 8516448.003, 49217000, 62100000, 0, 1, 220000000, 0, 0, 0, 0, 0, 0, 408, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:27'),
(268, '18TS02B0539', '15/18TS02B0539/I/2018', 'OUTER', 'MACRO', 'KENDARI_228', 'UNH053', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 52, 'NL', '122.0623522', '-3.918363577', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.003, 47717000, 81000000, 0, 1, 122222222.222222, 0, 0, 0, 0, 0, 0, 409, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:31'),
(269, '18TS02B0538', '16/18TS02B0538/I/2018', 'OUTER', 'MACRO', 'MAKASSAR_428', 'PKJ106', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '119.573695', '-4.833591', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. PANGKAJENE DAN KEPULAUAN', 805000000, 8516448.003, 49217000, 71100000, 0, 1, 100000000, 0, 0, 0, 0, 0, 0, 410, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:34'),
(270, '18TS02B0537', '17/18TS02B0537/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1718', 'PLW112', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 52, 'NL', '119.205901', '-3.43668965', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. POLEWALI MANDAR', 805000000, 8516448.003, 48717000, 71009000, 0, 1, 94444444.44, 0, 0, 0, 0, 0, 0, 411, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:37'),
(271, '18TS02B0536', '18/18TS02B0536/I/2018\r\n', 'OUTER', 'MACRO', 'PARE PARE_1734', 'PLW120', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 42, 'NL', '119.3191188', '-3.427220147', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. POLEWALI MANDAR', 805000000, 8516448.003, 48717000, 71009000, 0, 1, 94444444, 0, 0, 0, 0, 0, 0, 412, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:40'),
(272, '18TS02B0535', '19/18TS02B0535/I/2018\r\n', 'OUTER', 'MACRO', 'KENDARI_256', 'KKA190', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Nabila Timur', 'SST', 42, 'NL', '120.9923795', '-3.317465933', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. KOLAKA', 805000000, 8516448.003, 47717000, 63000000, 0, 1, 155555555, 0, 0, 0, 0, 0, 0, 413, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:44'),
(273, '18TS02B0534', NULL, 'OUTER', 'MACRO', 'KENDARI_257', 'KKA191', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Nabila Timur', 'SST', 42, 'NL', '120.9248163', '-3.372578046', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. KOLAKA', 805000000, 8516448.003, 47717000, 63000000, 0, 1, 97777777, 0, 0, 0, 0, 0, 0, 414, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:47'),
(274, '18TS02B0533', '20/18TS02B0533/I/2018\r\n', 'OUTER', 'MACRO', 'KENDARI_143', 'UNH044', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'GTU', 'SST', 42, 'NL', '122.053126', '-3.849057', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.003, 47717000, 81000000, 0, 1, 88888888, 0, 0, 0, 0, 0, 0, 415, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:50'),
(275, '18TS02B0532', '21/18TS02B0532/I/2018\r\n', 'OUTER', 'MACRO', 'PARE PARE_1792', 'PLP231', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 62, 'NL', '120.38491', '-3.367155', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.003, 49217000, 76500000, 0, 1, 97777777.78, 0, 0, 0, 0, 0, 0, 416, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:54'),
(276, '18TS02B0531', '22/18TS02B0531/I/2018', 'OUTER', 'MACRO', 'MAKASSAR_558', 'SIN100', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 52, 'NL', '120.247304', '-5.136587', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. SINJAI', 805000000, 8516448.003, 49217000, 71009000, 0, 1, 97777777, 0, 0, 0, 0, 0, 0, 417, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:23:57'),
(277, '18TS02B0530', NULL, 'OUTER', 'MACRO', 'MEARES SOPUTAN MINING', 'TDO355', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'XLA', 'SST', 42, 'NL', '125.0945', '1.5738', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. MINAHASA', 805000000, 8516448.002999999, 62000000, 100000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(278, '18TS02B0529', NULL, 'OUTER', 'MACRO', 'MAKASSAR_412', 'MRS161', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '119.63337', '-4.990129', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. MAROS', 805000000, 8516448.002999999, 49217000, 62100000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(279, '18TS02B0528', '23/18TS02B0528/I/2018', 'OUTER', 'MACRO', 'KENDARI_217', 'UNH050', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 52, 'NL', '122.11419', '-3.864753', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.003, 47717000, 81000000, 0, 1, 122222222.2, 0, 0, 0, 0, 0, 0, 418, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:01'),
(280, '18TS02B0527', '24/18TS02B0527/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1696', 'MAM145', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 52, 'NL', '118.914524', '-2.67541', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. MAMUJU', 805000000, 8516448.003, 48717000, 76500000, 0, 1, 144444444, 0, 0, 0, 0, 0, 0, 419, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:04'),
(281, '18TS02B0526', '10/18TS02B0526/I/2018', 'OUTER', 'MACRO', 'TOB022-1', 'TOB086', 'AREA 4', 'PUMA', 'MALUKU', 'Prasetia', 'SST', 32, 'NL', '127.905803', '1.184531', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'MALUKU UTARA', 'KAB. HALMAHERA UTARA', 805000000, 13482000, 65000000, 85000000, 0, 1, 100000000, 0, 0, 0, 0, 0, 0, 420, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:08'),
(282, '18TS02B0525', '34/18TS02B0525/I/2018', 'OUTER', 'MACRO', 'DMT RUJAB BUPATI LUWUK', 'LWK153', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'XLA', 'SST', 52, 'NL', '122.7866', '-0.997016', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. BANGGAI', 805000000, 8516448.003, 47335000, 71100000, 0, 1, 122222222, 0, 0, 0, 0, 0, 0, 421, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:11'),
(283, '18TS02B0524', NULL, 'OUTER', 'MACRO', 'MAKASSAR_398', 'MRS157', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '119.524583', '-5.030472', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. MAROS', 805000000, 8516448.003, 49217000, 62100000, 0, 1, 111111111, 0, 0, 0, 0, 0, 0, 422, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:15'),
(284, '18TS02B0523', NULL, 'OUTER', 'MACRO', 'PARE PARE_1730', 'PLW119', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 52, 'NL', '119.2991036', '-3.378816872', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. POLEWALI MANDAR', 805000000, 8516448.003, 48717000, 71009000, 0, 1, 88888888.89, 0, 0, 0, 0, 0, 0, 423, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:25'),
(285, '18TS02B0522', '25/18TS02B0522/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1785', 'PLP228', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 62, 'NL', '120.352522', '-3.42013', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.003, 49217000, 76500000, 0, 1, 97777777, 0, 0, 0, 0, 0, 0, 424, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:29'),
(286, '18TS02B0521', '26/18TS02B0521/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1820', 'PLP235', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 62, 'NL', '120.3423267', '-3.385832166', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.003, 49217000, 76500000, 0, 1, 88888888, 0, 0, 0, 0, 0, 0, 425, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:32'),
(287, '18TS02B0569', '27/18TS02B0569/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1834', 'MAS108', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 62, 'NL', '120.524403', '-2.61503', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.003, 49217000, 76500000, 0, 1, 110000000, 0, 0, 0, 0, 0, 0, 426, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:35'),
(288, '18TS02B0568', '28/18TS02B0568/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1852', 'MAS114', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 52, 'NL', '120.451686', '-2.609814', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.003, 49217000, 76500000, 0, 1, 122222222, 0, 0, 0, 0, 0, 0, 427, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:39'),
(289, '18TS02B0567', '225/18TS02B0567/III/2018', 'OUTER', 'MACRO', 'PARE PARE 123', 'ENR063', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'ADDAD', 'SST', 42, 'NL', '', '', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG 123', 593000000, 8516448.002999999, 49217000, 67500000, 0, 11, 8516448, 0, 0, 0, 0, 0, 0, 308, '', 'CANCEL', '2018-03-21 16:47:29', '2018-04-29 01:03:42'),
(290, '18TS02B0566', '222/18TS02B0566/III/2018', 'OUTER', 'MACRO', 'PARE PARE', 'ENR065', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'PRASETIA', 'SST', 42, 'NL', '', '', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG', 805000000, 8516448.002999999, 49217000, 67500000, 0, 10, 100000000, 0, 0, 0, 0, 0, 0, 324, '', 'PROCUREMENT - MANAGER PROCUREMENT', '2018-03-21 16:47:29', '2018-04-29 02:25:54'),
(291, '18TS02B0565', '221/18TS02B0565/III/2018', 'OUTER', 'MACRO', 'PARE PARE AAAAA', 'ENR076', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'AAAAA', 'SST', 42, 'NL', '', '', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG AAAAAA', 593000000, 8516448, 49217000, 67500000, 0, 11, 10000000, 10000000, 10000000, 10000000, 10000000, 10000000, 10000000, 440, '', 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-21 16:47:29', '2018-06-08 09:19:52'),
(292, '18TS02B0564', NULL, 'OUTER', 'MACRO', 'PARE PARE_1941', 'ENR077', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 52, 'NL', '119.8161368', '-3.356470269', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG', 805000000, 8516448.003, 49217000, 67500000, 0, 1, 111111111, 0, 0, 0, 0, 0, 0, 428, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:42'),
(293, '18TS02B0563', '29/18TS02B0563/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1974', 'SKG160', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 52, 'NL', '120.014335', '-4.143773', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. WAJO', 805000000, 8516448.003, 49217000, 71100000, 0, 1, 88888888.89, 0, 0, 0, 0, 0, 0, 429, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:46'),
(294, '18TS02B0562', '35/18TS02B0562/I/2018', 'OUTER', 'MACRO', 'GORONTALO_16', 'KTG250', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', 'SST', 52, 'NL', '124.1047124405', '0.9171579761', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. BOLAANG MONGONDOW', 805000000, 8516448.003, 62000000, 100000000, 0, 1, 111111111, 0, 0, 0, 0, 0, 0, 430, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:49'),
(295, '18TS02B0561', '30/18TS02B0561/I/2018', 'OUTER', 'MACRO', 'KENDARI_118', 'UNH042', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'GTU', 'SST', 62, 'NL', '122.02594008068', '-3.8478892267933', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.003, 47717000, 81000000, 0, 1, 88888888.89, 0, 0, 0, 0, 0, 0, 431, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:52'),
(296, '18TS02B0560', NULL, 'OUTER', 'MACRO', 'MAKASSAR_554', 'SIN099', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 62, 'NL', '120.261073', '-5.13779', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. SINJAI', 805000000, 8516448.003, 49217000, 71009000, 0, 1, 97777777, 0, 0, 0, 0, 0, 0, 432, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 06:24:55'),
(297, '18TS02B0559', '31/18TS02B0559/I/2018', 'OUTER', 'MACRO', 'KENDARI_191', 'KDI303', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 52, 'NL', '122.5455621', '-4.034289846', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.003, 47717000, 81000000, 0, 1, 183333333, 0, 0, 0, 0, 0, 0, 382, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 00:59:49'),
(298, '18TS02B0558', '36/18TS02B0558/I/2018', 'OUTER', 'MACRO', 'GORONTALO_21', 'KTG252', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', 'SST', 52, 'NL', '124.088607', '0.904294', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. BOLAANG MONGONDOW', 805000000, 8516448.003, 62000000, 100000000, 0, 1, 105555555.6, 0, 0, 0, 0, 0, 0, 383, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 00:59:52'),
(299, '18TS02B0557', '37/18TS02B0557/I/2018', 'OUTER', 'MACRO', 'GORONTALO_46', 'KTG256', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', 'SST', 62, 'NL', '124.024876', '0.558967', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. BOLAANG MONGONDOW', 805000000, 8516448.003, 62000000, 100000000, 0, 1, 111111111, 0, 0, 0, 0, 0, 0, 384, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 00:59:55'),
(300, '18TS02B0556', '32/18TS02B0556/I/2018', 'OUTER', 'MACRO', 'PARE PARE_1789', 'MLE154', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 62, 'NL', '119.8797226', '-3.0106164', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. TANA TORAJA', 805000000, 8516448.003, 49217000, 63000000, 0, 1, 122222222, 0, 0, 0, 0, 0, 0, 385, '', 'DIRECTOR', '2018-03-21 16:47:29', '2018-06-08 00:59:59'),
(301, '18TS02B0191', NULL, 'INNER', 'MACRO', 'SMA N 14 GARUT', 'GRT522', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.005162', '-7.15374', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(302, '18TS02B0192', NULL, 'INNER', 'MACRO', 'SMP N 2 PAGERAGEUNG', 'TSK927', 'AREA 2', 'JABAR', 'JABAR', 'Radik Insan Persada', 'SST', 42, 'NL', '108.181399', '-7.130898', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(303, '18TS02B0193', NULL, 'INNER', 'MACRO', 'SITUS AGUNG TAPA', 'TSK928', 'AREA 2', 'JABAR', 'JABAR', 'Radik Insan Persada', 'SST', 42, 'NL', '108.132286', '-7.192084', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(304, '18TS02B0194', NULL, 'INNER', 'MACRO', 'BADAKDAEH - RELOKPARNA', 'TSK931', 'AREA 2', 'JABAR', 'JABAR', 'Radik Insan Persada', 'SST', 42, 'NL', '108.115719', '-7.349635', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(305, '18TS02B0195', NULL, 'INNER', 'MACRO', 'PASAR GSP', 'CJR657', 'AREA 2', 'JABAR', 'JABAR', 'Tigabeka', 'SST', 42, 'NL', '107.066655', '-6.732588', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIANJUR', 805000000, 3592680, 91000000, 99000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(306, '18TS02B0196', NULL, 'INNER', 'MACRO', 'UJUNG JAYA , CIPELANG', 'SMD374', 'AREA 2', 'JABAR', 'JABAR', 'Abassy', 'SST', 42, 'NL', '107.930615', '-6.843724', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUMEDANG', 805000000, 3592680, 84683000, 88000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(307, '18TS02B0197', NULL, 'INNER', 'MACRO', 'PEMUKIMAN LINGGAPURA', 'CMS473', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.385003', '-7.193501', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(308, '18TS02B0198', NULL, 'INNER', 'MACRO', 'PEMUKIMAN CIJULANG', 'CMS476', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.197383', '-7.263086', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(309, '18TS02B0199', NULL, 'INNER', 'MACRO', 'GOLAT-KPCIWALEN', 'CMS478', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.227797', '-7.131343', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(310, '18TS02B0200', NULL, 'INNER', 'MACRO', 'JLNYAMPAY', 'BDB280', 'AREA 2', 'JABAR', 'JABAR', 'M Jusuf & Sons', 'SST', 42, 'NL', '107.64913', '-6.82009', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(311, '18TS02B0201', NULL, 'INNER', 'MACRO', 'CIGUGURGIRANG-KPCIPANJAK', 'BDB281', 'AREA 2', 'JABAR', 'JABAR', 'M Jusuf & Sons', 'SST', 42, 'NL', '107.587605', '-6.838184', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(312, '18TS02B0202', NULL, 'INNER', 'MACRO', 'DSNBAMBU', 'BDB282', 'AREA 2', 'JABAR', 'JABAR', 'M Jusuf & Sons', 'SST', 42, 'NL', '107.578709', '-6.789712', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(313, '18TS02B0203', NULL, 'INNER', 'MACRO', 'SARIREJA', 'SUB664', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.6903366667', '-6.702855', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(314, '18TS02B0204', NULL, 'INNER', 'MACRO', 'LETNAN UKIN', 'SUB666', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.775829', '-6.568318', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(315, '18TS02B0205', NULL, 'INNER', 'MACRO', 'DSSALAMJAYA-KEMBANGSARI', 'SUB667', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.614151', '-6.437243', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(316, '18TS02B0206', NULL, 'INNER', 'MACRO', 'DSNPADAHERANG-DSKRNGMULYA', 'CMS480', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.688835', '-7.538222', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(317, '18TS02B0207', NULL, 'INNER', 'MACRO', 'PADASUKA-SAMARANG', 'GRT362', 'AREA 2', 'JABAR', 'JABAR', 'Arva Asia Partner', 'SST', 42, 'NL', '107.826891', '-7.221687', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(318, '18TS02B0208', NULL, 'INNER', 'MACRO', 'MARGAMULYASMD-LICIN', 'SMD363', 'AREA 2', 'JABAR', 'JABAR', 'Abassy', 'SST', 42, 'NL', '107.945962', '-6.808253', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUMEDANG', 805000000, 3592680, 84683000, 88000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(319, '18TS02B0209', NULL, 'INNER', 'MACRO', 'MASJID JAMI AL-IKHLAS1', 'GRT536', 'AREA 2', 'JABAR', 'JABAR', 'Wahana Lintassentra Telekomunindo', 'SST', 42, 'NL', '108.00319', '-7.220219', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(320, '18TS02B0210', NULL, 'INNER', 'MACRO', 'PEMUKIMAN PUNCAK DARAJAT', 'GRT534', 'AREA 2', 'JABAR', 'JABAR', 'Wahana Lintassentra Telekomunindo', 'SST', 42, 'NL', '107.759229', '-7.217217', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(321, '18TS02B0211', NULL, 'INNER', 'MACRO', 'MASJID AL-FALAH', 'GRT535', 'AREA 2', 'JABAR', 'JABAR', 'Wahana Lintassentra Telekomunindo', 'SST', 42, 'NL', '108.004691', '-6.984501', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(322, '18TS02B0212', NULL, 'INNER', 'MACRO', 'PERUM SUKAHERANG SINGAPARNA', 'TSK937', 'AREA 2', 'JABAR', 'JABAR', 'Wideband Media Indonesia', 'SST', 42, 'NL', '108.098058', '-7.347097', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(323, '18TS02B0213', NULL, 'INNER', 'MACRO', 'PERUM PURWASARI CISAYONG', 'TSK938', 'AREA 2', 'JABAR', 'JABAR', 'Wideband Media Indonesia', 'SST', 42, 'NL', '108.151008', '-7.235666', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(324, '18TS02B0214', NULL, 'INNER', 'MACRO', 'PERUM SODONGHILIR', 'TSK939', 'AREA 2', 'JABAR', 'JABAR', 'Wideband Media Indonesia', 'SST', 42, 'NL', '108.083794', '-7.490293', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(325, '18TS02B0215', NULL, 'INNER', 'MACRO', 'TANJUNGJAYAWARUNGBDG', 'TSK945', 'AREA 2', 'JABAR', 'JABAR', 'Telekomindo Primakarya', 'SST', 42, 'NL', '108.119695', '-7.376069', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(326, '18TS02B0216', NULL, 'INNER', 'MACRO', 'KELSITU - KELKOTAKALER', 'SMD366', 'AREA 2', 'JABAR', 'JABAR', 'Abassy', 'SST', 42, 'NL', '107.920402', '-6.84635', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUMEDANG', 805000000, 3592680, 84683000, 88000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(327, '18TS02B0217', NULL, 'INNER', 'MACRO', 'PEMUKIMAN WINDURAJA', 'CMS481', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.371943', '-7.165128', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(328, '18TS02B0218', NULL, 'INNER', 'MACRO', 'PEMUKIMAN SUKAJADI', 'CMS482', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.324564', '-7.310864', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(329, '18TS02B0219', NULL, 'INNER', 'MACRO', 'PEMUKIMAN PAWINDAN', 'CMS484', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.328', '-7.33551', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(330, '18TS02B0220', NULL, 'INNER', 'MACRO', 'PEMUKIMAN CIGEMBOR', 'CMS492', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.36655', '-7.346416', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(331, '18TS02B0221', NULL, 'INNER', 'MACRO', 'CAGAKBRO', 'SUB674', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.688172', '-6.66726', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(332, '18TS02B0222', NULL, 'INNER', 'MACRO', 'KPPANGKALAN-SARIWANGI', 'BDB271', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.572098295041', '-6.85514532371041', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(333, '18TS02B0223', NULL, 'INNER', 'MACRO', 'PERTAMINABUMIPUTRA-BLOKWOTBOGOR', 'IND362', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.336274', '-6.35562', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. INDRAMAYU', 805000000, 3592680, 91000000, 87000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(334, '18TS02B0224', NULL, 'INNER', 'MACRO', 'CIHAMPELASCILILIN-SASAKBUBUR', 'BDB291', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.477545', '-6.930536', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(335, '18TS02B0225', NULL, 'INNER', 'MACRO', 'PERMANENISASIWANGUNSR', 'BDB289', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.612', '-6.84589', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(336, '18TS02B0226', NULL, 'INNER', 'MACRO', 'PERMANENISASIKAVELERIPAROMPONG', 'BDB292', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.58426', '-6.7956', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(337, '18TS02B0227', NULL, 'INNER', 'MACRO', 'TAMANBAHAGIA', 'SKB861', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Tigabeka', 'SST', 42, 'NL', '106.917583', '-6.92469', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUKABUMI', 805000000, 3592680, 104790000, 153000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(338, '18TS02B0228', NULL, 'INNER', 'MACRO', 'WANASARI', 'CKR931', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '107.084419', '-6.265153', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BEKASI', 805000000, 3592680, 97290000, 148500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(339, '18TS02B0229', NULL, 'INNER', 'MACRO', 'JLCIAULPASIR', 'SKB862', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Tigabeka', 'SST', 42, 'NL', '106.943977', '-6.923804', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUKABUMI', 805000000, 3592680, 104790000, 153000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(340, '18TS02B0230', NULL, 'INNER', 'MACRO', 'JLINSINYURSUTAMI', 'SRG968', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Tritama', 'SST', 42, 'NL', '106.0122728', '-6.0424922', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. SERANG', 805000000, 3592680, 109290000, 93948000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(341, '18TS02B0233', NULL, 'INNER', 'MACRO', 'LEUWINNGGUNG', 'DPK738', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.910984', '-6.396435', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(342, '18TS02B0234', NULL, 'INNER', 'MACRO', 'KAKAPSUKATANI', 'DPK741', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.892295', '-6.402716', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(343, '18TS02B0236', NULL, 'INNER', 'MACRO', 'CILENDEK', 'BOX289', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.782918', '-6.579887', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(344, '18TS02B0242', NULL, 'INNER', 'MACRO', 'COATESVILLAGE', 'CBN439', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.963489', '-6.355137', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(345, '18TS02B0243', NULL, 'INNER', 'MACRO', 'JLMANDORTADJIR', 'DPK742', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.737148', '-6.376162', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(346, '18TS02B0244', NULL, 'INNER', 'MACRO', 'PURWASARIKARAWANG', 'KRW976', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '107.408629', '-6.3908', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. KARAWANG', 805000000, 3592680, 119183000, 148500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(347, '18TS02B0245', NULL, 'INNER', 'MACRO', 'GRRENAMANI', 'PWK747', 'AREA 2', 'JABOTABEK', 'JABAR', 'Asa Berkat', 'SST', 42, 'NL', '107.441896', '-6.53087', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. PURWAKARTA', 805000000, 3592680, 110035449.99999999, 180500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(348, '18TS02B0246', NULL, 'INNER', 'MACRO', 'SUKAJAYACIBITUNG', 'CKR913', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '107.101512', '-6.237524', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BEKASI', 805000000, 3592680, 97290000, 148500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(349, '18TS02B0247', NULL, 'INNER', 'MACRO', 'JLTANAHBARU', 'BOX288', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.82243', '-6.569885', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(350, '18TS02B0250', NULL, 'INNER', 'MACRO', 'PASIRMULYA', 'KRW977', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '107.349883', '-6.321947', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. KARAWANG', 805000000, 3592680, 119183000, 148500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(351, '18TS02B0251', NULL, 'INNER', 'MACRO', 'TELAGAMURNI', 'CKR912', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '107.1104', '-6.252573', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BEKASI', 805000000, 3592680, 97290000, 148500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29');
INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `imb_jasa`, `qty_lahan`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(352, '18TS02B0252', NULL, 'INNER', 'MACRO', 'GALUHMAS', 'KRW970', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '107.300698', '-6.33014', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. KARAWANG', 805000000, 3592680, 119183000, 148500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(353, '18TS02B0253', NULL, 'INNER', 'MACRO', 'VILLACIOMAS', 'CBN440', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.76618', '-6.586891', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(354, '18TS02B0254', NULL, 'INNER', 'MACRO', 'GRIYATELAGAPERMAI', 'DPK734', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.858954', '-6.451123', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(355, '18TS02B0255', NULL, 'INNER', 'MACRO', 'PESONATAMANMONACO', 'CBN444', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.957338', '-6.388794', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(356, '18TS02B0257', NULL, 'INNER', 'MACRO', 'JLPERANCISDADAP', 'TGR455', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '106.714391', '-6.089656', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. TANGERANG', 805000000, 3592680, 93290000, 151200000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(357, '18TS02B0258', NULL, 'INNER', 'MACRO', 'GRAHASEGOVIA', 'TGR467', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '106.53802', '-6.263701', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. TANGERANG', 805000000, 3592680, 93290000, 151200000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(358, '18TS02B0259', NULL, 'INNER', 'MACRO', 'AYANAGOLDENKARAWACI', 'TGR439', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '106.584194', '-6.25383', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. TANGERANG', 805000000, 3592680, 93290000, 151200000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEW', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(359, '17TS11B0134', '11/17TS11B0134/I/2018', 'INNER', 'MACRO', 'MONUMEN TRIKORA MOROTAI', 'TOB071', 'AREA 4', 'SULAWESI', 'MALUKU', 'XLA', 'SST', 32, 'NL', '128.304241', '2.036898', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'MALUKU UTARA', 'HALMAHERA UTARA', 805000000, 13482000, 41680980, 75000000, 0, 1, 88000000, 0, 0, 0, 0, 0, 0, 386, NULL, 'DIRECTOR', '2018-04-14 10:00:00', '2018-06-08 01:00:02'),
(360, '17TS11B0135', '38/17TS11B0135/I/2018', 'INNER', 'MACRO', 'PULAU MOROTAI', 'TOB061', 'AREA 4', 'SULAWESI', 'MALUKU', 'XLA', 'SST', 32, 'NL', '128.307862', '2.055702', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'MALUKU UTARA', 'Kab. Halmahera Utara', 805000000, 13482000, 41680980, 75000000, 0, 1, 88000000, 0, 0, 0, 0, 0, 0, 387, NULL, 'DIRECTOR', '2018-04-14 10:00:00', '2018-06-08 01:00:06'),
(361, '18TS03B0009', '39/18TS03B0009/I/2018', 'INNER', 'MACRO', 'PARE PARE_1726', 'MAM137', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'AMALA', 'SST', 52, 'NL', '0', '0', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'Sulawesi Barat', 'Kab. Mamuju', 805000000, 8516448, 48717000, 76500000, 0, 1, 110000000, 0, 0, 0, 0, 0, 0, 388, NULL, 'DIRECTOR', '2018-04-14 10:00:00', '2018-06-08 01:00:09'),
(362, '18TS03B0008', '40/18TS03B0008/I/2018', 'INNER', 'MACRO', 'TOB019-3', 'TOB074', 'AREA 4', 'SULAWESI', 'MALUKU', 'Amala -Prasetia', 'SST', 52, 'NL', '0', '0', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'Maluku Utara', 'Kab. Halmahera Utara\r\n', 805000000, 13482000, 65000000, 85000000, 0, 1, 111111111, 0, 0, 0, 0, 0, 0, 389, NULL, 'DIRECTOR', '2018-04-14 10:00:00', '2018-06-08 01:00:12'),
(363, '18TS03B0013', '41/18TS03B0013/I/2018', 'INNER', 'MACRO', 'Jambidan Banguntapan', 'BTL740', 'AREA 3', 'JATENG', 'JATENG', 'Maxima Artha', 'SST', 42, 'NL', '0', '0', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'DI Yogyakarta', 'Kab. Bantul', 805000000, 13650000, 92742000, 130500000, 0, 1, 152222222.222222, 0, 0, 0, 0, 0, 0, 433, NULL, 'PROCUREMENT - STAFF PROCUREMENT', '2018-04-14 10:00:00', '2018-06-08 08:49:44'),
(364, '18TS03B0017', '42/18TS03B0017/I/2018', 'INNER', 'MACRO', 'Medayu Suruh', 'UNR744', 'AREA 3', 'JATENG', 'JATENG', 'Pilar Gapura Nusa', 'SST', 42, 'NL', '0', '0', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'Jawa Tengah', 'Kab. Semarang', 805000000, 13650000, 105000000, 125000000, 0, 1, 140000000, 0, 0, 0, 0, 0, 0, 434, NULL, 'PROCUREMENT - STAFF PROCUREMENT', '2018-04-14 10:00:00', '2018-06-08 08:49:49'),
(365, '18TS03B0019', '43/18TS03B0019/I/2018', 'INNER', 'MACRO', 'BETUN3', 'ATB130', 'AREA 3', 'BALNUS', 'NTT', 'Symmetri Contracting', 'SST', 42, 'NL', '0', '0', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'Nusa Tenggara Tmr', 'Kab. Belu', 805000000, 15470000, 70000000, 84250000, 0.01, 1, 133333333, 0, 0, 0, 0, 0, 0, 435, NULL, 'PROCUREMENT - STAFF PROCUREMENT', '2018-04-14 10:00:00', '2018-06-08 08:49:53');

-- --------------------------------------------------------

--
-- Table structure for table `project_implementation`
--

CREATE TABLE `project_implementation` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `towerimplementation` int(11) NOT NULL,
  `clusterimplementation` varchar(255) NOT NULL,
  `mitra` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_implementation`
--

INSERT INTO `project_implementation` (`id`, `project_id`, `towerimplementation`, `clusterimplementation`, `mitra`, `created_at`, `updated_at`) VALUES
(1, 226, 52, 'JATENG', 'Sanjiwahana Persada', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(2, 228, 52, 'JATENG', 'Sanjiwahana Persada\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(3, 229, 52, 'JATENG', 'Sanjiwahana Persada\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(4, 231, 52, 'JATENG', 'IDE Sehati (SITACIMB) - PGN (CME)', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(5, 232, 52, 'JATENG', 'IDE Sehati (SITACIMB) - PGN (CME)\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(6, 233, 52, 'JATENG', 'IDE Sehati (SITACIMB) - PGN (CME)\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(7, 237, 52, 'JATENG', 'IDE Sehati (SITACIMB) - PGN (CME)\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(8, 240, 52, 'NTT', 'Symmetry Contrating\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(9, 248, 42, 'JATIM', 'Infrako\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(10, 258, 52, 'KALIMANTAN 2 (KALBAR)', 'Nayaka\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(11, 267, 42, 'SULSELBARTRA', 'XLA\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(12, 268, 52, 'SULSELBARTRA', 'BSS\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(13, 269, 42, 'SULSELBARTRA', 'BSS\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(14, 270, 52, 'SULSELBARTRA', 'Prasetia\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(15, 271, 42, 'SULSELBARTRA\r\n', 'Prasetia\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(16, 272, 42, 'SULSELBARTRA\r\n', 'Nabila Timur\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(17, 273, 42, 'SULSELBARTRA\r\n', 'Nabila Timur\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(18, 274, 42, 'SULSELBARTRA\r\n', 'GTU\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(19, 275, 62, 'SULSELBARTRA\r\n', 'Amala\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(20, 211, 62, 'SULSELBARTRA', 'BSS', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(21, 216, 52, 'MALUKU', 'Nahrul Arbah', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(22, 276, 52, 'SULSELBARTRA', 'Asa Berkat\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(23, 279, 52, 'SULSELBARTRA', 'BSS', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(24, 280, 52, 'SULSELBARTRA\r\n', 'BSS\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(25, 281, 32, 'MALUKU\r\n', 'Prasetia\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(26, 282, 52, 'XLASULUT, TENGAH, GORONTALO', 'XLA\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(27, 283, 52, 'SULSELBARTRA', 'Amala', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(28, 284, 52, 'SULSELBARTRA\r\n', 'Prasetia\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(29, 285, 62, 'SULSELBARTRA', 'Amala', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(30, 286, 62, 'SULSELBARTRA\r\n', 'Amala\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(31, 287, 62, 'SULSELBARTRA', 'Amala\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(32, 288, 52, 'SULSELBARTRA', 'Amala', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(33, 292, 52, 'SULSELBARTRA\r\n', 'BSS\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(34, 293, 52, 'SULSELBARTRA\r\n', 'Asa Berkat\r\n', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(35, 294, 52, 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(36, 295, 62, 'SULSELBARTRA\r\n', 'GTU\r\n', '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(37, 296, 62, 'SULSELBARTRA', 'Asa Berkat\r\n', '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(38, 297, 52, 'SULSELBARTRA\r\n', 'BSS\r\n', '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(39, 298, 52, 'SULUT, TENGAH, GORONTALO\r\n', 'Nahrul Arbah\r\n', '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(40, 299, 62, 'SULUT, TENGAH, GORONTALO\r\n', 'Nahrul Arbah\r\n', '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(41, 300, 62, 'SULSELBARTRA\r\n', 'Asa Berkat\r\n', '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(42, 359, 32, 'MALUKU', 'XLA', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(43, 360, 32, 'MALUKU', 'XLA', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(44, 361, 52, 'SULSELBARTRA', 'AMALA', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(45, 362, 52, 'MALUKU', 'Amala -Prasetia', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(46, 363, 42, 'JATENG', 'Maxima Artha', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(47, 364, 42, 'JATENG', 'Pilar Gapura Nusa', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(48, 365, 42, 'NTT', 'Symmetri Contracting', '2018-04-14 10:00:00', '2018-05-10 06:19:37'),
(49, 11, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(50, 12, 42, 'ACEH', 'AKSES INSANI', '2018-04-15 10:00:00', '2018-05-10 23:46:08'),
(51, 13, 42, 'ACEH', 'Akses Insani', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(52, 14, 42, 'SUMUT', 'Cipto Sarana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(53, 15, 42, 'SUMUT', 'Cipto Sarana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(54, 16, 42, 'SUMUT', 'Cipto Sarana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(55, 18, 42, 'SUMUT', 'Cipto Sarana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(56, 19, 42, 'SUMUT', 'Cipto Sarana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(57, 20, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(58, 21, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(59, 22, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(60, 23, 42, 'KEP NIAS', 'Global Comtech', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(61, 24, 42, 'KEP NIAS', 'Global Comtech', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(62, 25, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(63, 26, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(64, 27, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(65, 29, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(66, 30, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(67, 32, 42, 'SUMUT', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(68, 33, 42, 'SUMUT', 'Madya Perdana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(69, 34, 42, 'SUMUT', 'Madya Perdana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(70, 35, 42, 'SUMUT', 'Madya Perdana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(71, 36, 42, 'SUMUT', 'Madya Perdana', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(72, 37, 42, 'SUMUT', 'Winer', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(73, 40, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(74, 41, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(75, 42, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(76, 43, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(77, 44, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(78, 45, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(79, 46, 42, 'SUMUT', 'Ramos', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(80, 47, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(81, 48, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(82, 49, 42, 'RIAU DARATAN', 'Sanjiwahana Persada', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(83, 50, 42, 'RIAU DARATAN', 'Sanjiwahana Persada', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(84, 51, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(85, 52, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(86, 53, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(87, 54, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(88, 55, 42, 'RIAU DARATAN', 'Sanjiwahana Persada', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(89, 56, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(90, 57, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(91, 58, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(92, 59, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(93, 60, 42, 'RIAU DARATAN', 'Sanjiwahana Persada', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(94, 61, 42, 'RIAU DARATAN', 'Sanjiwahana Persada', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(95, 63, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(96, 64, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(97, 65, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(98, 66, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(99, 68, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(100, 69, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(101, 70, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(102, 71, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(103, 72, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(104, 73, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(105, 74, 42, 'RIAU DARATAN', 'Mitra Sistematika Global', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(106, 75, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(107, 76, 42, 'RIAU DARATAN', 'Global Comtech', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(108, 77, 42, 'RIAU DARATAN', 'Global Comtech', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(109, 79, 42, 'RIAU DARATAN', 'Global Comtech', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(110, 80, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(111, 82, 42, 'RIAU DARATAN', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(112, 83, 42, 'RIAU DARATAN', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(113, 85, 42, 'RIAU DARATAN', 'Sanjiwahana Persada', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(114, 86, 42, 'RIAU DARATAN', 'Global Comtech', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(115, 87, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(116, 88, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(117, 89, 42, 'RIAU DARATAN', 'M Jusuf & Sons', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(118, 90, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(119, 92, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(120, 93, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(121, 94, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(122, 95, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(123, 96, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(124, 97, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(125, 99, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(126, 100, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(127, 101, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(128, 102, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(129, 103, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(130, 104, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(131, 105, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(132, 106, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(133, 107, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(134, 108, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(135, 109, 42, 'RIAU DARATAN', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(136, 111, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(137, 113, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(138, 114, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(139, 115, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(140, 116, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(141, 117, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(142, 118, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(143, 119, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(144, 120, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(145, 121, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(146, 122, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(147, 123, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(148, 124, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(149, 125, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(150, 128, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(151, 129, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(152, 130, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(153, 132, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(154, 133, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(155, 134, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(156, 136, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(157, 139, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(158, 140, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(159, 141, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(160, 142, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(161, 143, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(162, 144, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(163, 145, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(164, 146, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(165, 147, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Girang Makmur', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(166, 148, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(167, 149, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(168, 150, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(169, 151, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(170, 152, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(171, 153, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(172, 154, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(173, 155, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(174, 156, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(175, 157, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(176, 158, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(177, 159, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(178, 160, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(179, 161, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(180, 162, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(181, 163, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(182, 164, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(183, 165, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(184, 166, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(185, 167, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(186, 168, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(187, 169, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(188, 171, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(189, 173, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(190, 174, 42, 'KALIMANTAN 2 (KALBAR)', 'Nayaka', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(191, 177, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(192, 180, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(193, 181, 42, 'KALIMANTAN 2 (KALBAR)', 'Nayaka', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(194, 183, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(195, 184, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(196, 185, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(197, 186, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(198, 187, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(199, 188, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(200, 189, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(201, 193, 42, 'PAPUA', 'XLA', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(202, 198, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(203, 199, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(204, 200, 42, 'PAPUA', 'Amala', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(205, 202, 42, 'PAPUA', 'XLA', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(206, 203, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(207, 205, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(208, 206, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(209, 207, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(210, 208, 42, 'PAPUA', 'Prasetia', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(211, 209, 42, 'PAPUA', 'Amala', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(212, 215, 42, 'SULSELBARTRA', 'BSS', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(213, 28, 42, 'SUMUT', 'Indoteknik', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(214, 81, 42, 'RIAU DARATAN', 'Putra Aditya', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(215, 110, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(216, 112, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(217, 137, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'TRANSDATA', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(218, 138, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'TRANSDATA', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(219, 170, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'INDOTEKNIK', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(220, 175, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(221, 176, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(222, 179, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(223, 190, 42, 'KALIMANTAN 2 (KALBAR)', 'Nayaka', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(224, 195, 42, 'PAPUA', 'Amala', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(225, 201, 42, 'PAPUA', 'XLA', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(226, 204, 42, 'PAPUA', 'Amala', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(227, 291, 42, 'SULSELBARTRA', 'AAAAA', '2018-04-27 04:49:57', '2018-05-10 23:45:54'),
(228, 290, 42, 'SULSELBARTRA', 'PRASETIA', '2018-04-27 05:02:07', '2018-04-29 02:25:54'),
(229, 172, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'GRAND TELECOM 122222', '2018-04-27 05:05:32', '2018-04-29 01:24:20'),
(230, 178, 42, 'KALIMANTAN 2 (KALBAR)', 'NAYAKANFGFDG', '2018-04-27 05:08:06', '2018-04-29 01:24:16'),
(231, 289, 42, 'SULSELBARTRA', 'ADDAD', '2018-04-27 07:34:51', '2018-04-29 00:46:19'),
(232, 263, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'NAYAKA 1234', '2018-04-27 14:03:16', '2018-04-29 01:24:12'),
(235, 225, 42, 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', '2018-05-10 23:28:20', '2018-05-10 23:44:16'),
(236, 224, 42, 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'TRANSDATA', '2018-05-10 23:34:57', '2018-05-10 23:43:23'),
(237, 246, 42, 'BALI', 'SANJIWAHANA PERSADA', '2018-06-06 06:30:53', '2018-06-06 06:30:53'),
(238, 252, 42, 'JATIM', 'PRIMATAMA KONSTRUKSI', '2018-06-06 06:31:27', '2018-06-06 06:31:27'),
(239, 250, 42, 'JATIM', 'INFRAKO', '2018-06-06 06:32:01', '2018-06-06 06:32:01'),
(240, 251, 42, 'JATIM', 'PGN', '2018-06-06 06:33:40', '2018-06-06 06:33:40'),
(241, 249, 42, 'JATIM', 'PGN', '2018-06-06 06:35:23', '2018-06-06 06:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `project_implementation_addtional`
--

CREATE TABLE `project_implementation_addtional` (
  `id` int(11) NOT NULL,
  `project_implementation_id` int(11) NOT NULL,
  `pekerjaan` text NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `qty` double NOT NULL,
  `harga` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_implementation_addtional`
--

INSERT INTO `project_implementation_addtional` (`id`, `project_implementation_id`, `pekerjaan`, `satuan`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'Add CME', 'LS', 1, 8179515, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(2, 2, 'Add CME', 'LS', 1, 22004710.5, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(3, 3, 'Add CME', 'LS', 1, 6460000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(4, 4, 'add cme', 'LS', 1, 6460000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(5, 4, 'ADD PLN', 'LS', 1, 13095000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(6, 5, 'add pln', 'LS', 1, 22580000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(7, 5, 'ADD CME', 'LS', 1, 13656974.9, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(8, 6, 'ADD CME', 'LS', 1, 15340928, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(9, 7, 'ADD CME', 'LS', 1, 6460000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(10, 8, 'ADD CME', 'LS', 1, 9000000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(11, 9, 'ADD CME', 'LS', 1, 10800000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(12, 10, 'ADD TRANSPORT', 'LS', 1, 30000000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(13, 10, 'ADD CME', 'LS', 1, 10585340, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(14, 25, 'ADD TRANSPORT', 'LS', 1, 35645974, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(15, 25, 'ADD CME', 'LS', 1, 4354026, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(16, 34, 'ADD CME', 'LS', 1, 21926414.35, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(17, 42, 'Add Transport', 'LS', 1, 50000000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(18, 0, '', '', 0, 0, NULL, NULL),
(19, 43, 'ADD TRANSPORT', 'LS', 1, 50000000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(20, 46, 'ADD PLN', 'LS', 1, 26384000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(21, 46, 'ADD CME', 'LS', 1, 8179515, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(22, 47, 'ADD PLN', 'LS', 1, 13095000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(23, 47, 'ADD CME', 'LS', 1, 6460000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(30, 48, 'ADD TRANSPORT', 'LS', 1, 9000000, '2018-05-10 06:19:37', '2018-05-10 06:19:37'),
(31, 48, 'ADD CME', 'LS', 1, 10800000, '2018-05-10 06:19:37', '2018-05-10 06:19:37'),
(33, 50, 'A', 'A', 1, 1000000, '2018-05-10 23:46:08', '2018-05-10 23:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `project_implementation_standard`
--

CREATE TABLE `project_implementation_standard` (
  `id` int(11) NOT NULL,
  `project_implementation_id` int(11) NOT NULL,
  `tonase` double NOT NULL,
  `pondasi` double NOT NULL,
  `biayatower` double NOT NULL,
  `erection_tower` double NOT NULL,
  `transportasi` double NOT NULL,
  `pondasi_greenfiled` double NOT NULL,
  `bts_outdoor` double NOT NULL,
  `me` double NOT NULL,
  `fy` double NOT NULL,
  `pln_connect` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_implementation_standard`
--

INSERT INTO `project_implementation_standard` (`id`, `project_implementation_id`, `tonase`, `pondasi`, `biayatower`, `erection_tower`, `transportasi`, `pondasi_greenfiled`, `bts_outdoor`, `me`, `fy`, `pln_connect`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(2, 2, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(3, 3, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(4, 4, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(5, 5, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(7, 6, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(8, 7, 1, 67740525, 141475314, 27866312, 28136484, 1, 7210265, 53641700, 28591086, 26706400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(9, 8, 1, 73701150, 141475314, 42388057, 57575583, 1, 7856496, 58226400, 31106885, 28137800, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(10, 9, 1, 60505984, 102885178, 27253928, 21814416, 1, 7286406, 53699000, 29020026, 26173800, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(11, 10, 1, 89174619.4444444, 141475314, 50206693, 66296681, 1, 9234180, 61745800, 37789553, 33675900, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(12, 11, 1, 66980100, 102885178, 36026198, 44086822, 1, 8161073, 58283800, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(13, 12, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(14, 13, 1, 66980100, 102885178, 36026198, 44086822, 1, 8161073, 58283800, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(15, 14, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(16, 15, 1, 66980100, 102885178, 36026198, 44086822, 1, 8161073, 58283800, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(17, 16, 1, 66980100, 102885178, 36026198, 44086822, 1, 8161073, 58283800, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(18, 17, 1, 66980100, 102885178, 36026198, 44086822, 1, 8161073, 58283800, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(19, 18, 1, 66980100, 102885178, 36026198, 44086822, 1, 8161073, 58283800, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(20, 19, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(21, 22, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(22, 23, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(23, 24, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 32125159, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(24, 25, 1, 85098280, 78211152, 37035280.8, 55483911.36, 1, 10451830, 56841695, 44896535, 31500000, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(25, 26, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(26, 27, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(27, 28, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(28, 29, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(29, 30, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(30, 31, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-03 10:00:00', '2018-04-03 10:00:00'),
(31, 32, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(32, 33, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(33, 34, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(34, 35, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(35, 36, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(36, 37, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(37, 38, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(38, 39, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(39, 40, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(40, 41, 1, 103514700, 187685172.6, 59534296, 84144136, 1, 8161073, 60344000, 35045628, 30168400, '2018-04-11 10:00:00', '2018-04-11 10:00:00'),
(41, 42, 1, 85098280, 78211152, 37035280.8, 55483911.36, 1, 10451830, 56841695, 44896535, 31500000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(42, 43, 1, 85098280, 78211152, 37035280.8, 55483911.36, 1, 10451830, 56841695, 44896535, 31500000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(43, 44, 1, 76113750, 141475314, 43188924, 60373793, 1, 8161073, 58799500, 32125159, 30168400, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(44, 45, 1, 106372850, 141475314, 56282617, 93093552, 1, 10451830, 61665000, 44896535, 31500000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(45, 46, 1, 59611662, 102885178, 24837150, 20546136, 1, 7210265, 53125900, 28591086, 26706400, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(46, 47, 1, 59611662, 102885178, 24837150, 20546136, 1, 7210265, 53125900, 28591086, 26706400, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(82, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2018-04-29 02:25:54', '2018-04-29 02:25:54'),
(83, 48, 1, 64857012, 102885178, 35998014, 42043482, 1, 7856496, 57710700, 31106885, 27438800, '2018-05-10 06:19:37', '2018-05-10 06:19:37'),
(103, 236, 7046, 2876992, 18100, 30154772, 34962252, 22, 6340814, 54845200, 33116876, 28137800, '2018-05-10 23:43:23', '2018-05-10 23:43:23'),
(105, 235, 7046, 3100009, 18100, 32384260, 34962252, 22, 6888228, 55991400, 35683999, 29436100, '2018-05-10 23:44:16', '2018-05-10 23:44:16'),
(106, 50, 1, 0.01, 0.01, 0.01, 0.01, 1, 0.01, 0.01, 0.01, 0.01, '2018-05-10 23:46:08', '2018-05-10 23:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`id`, `project_id`, `user_id`, `status`, `message`, `created_at`, `updated_at`) VALUES
(1, 226, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(2, 228, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(3, 229, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(4, 231, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(5, 232, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(6, 233, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(7, 237, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(8, 240, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(9, 248, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(10, 258, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(11, 267, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(12, 268, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(13, 269, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(14, 270, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(15, 271, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(16, 272, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(17, 273, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(18, 274, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(19, 275, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(20, 211, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(21, 276, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(22, 279, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(23, 280, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(24, 281, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(25, 282, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(26, 283, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(27, 284, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(28, 285, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(29, 286, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(30, 287, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(31, 288, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(32, 292, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(33, 293, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(34, 295, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(35, 296, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(36, 297, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(37, 298, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(38, 299, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(39, 300, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(40, 216, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-03-21 16:47:29', '2018-03-21 16:47:29'),
(41, 294, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-10 10:00:00', '2018-04-10 10:00:00'),
(42, 359, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(43, 360, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(44, 361, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(45, 362, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(46, 363, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(47, 364, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(48, 365, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(49, 11, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(50, 12, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(51, 13, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(52, 14, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(53, 15, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(54, 16, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(55, 18, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(56, 19, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(57, 20, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(58, 21, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(59, 22, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(60, 23, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(61, 24, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(62, 25, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(63, 27, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(64, 28, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(65, 29, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(66, 30, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(67, 32, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(68, 33, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(69, 34, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(70, 35, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(71, 36, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(72, 37, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(73, 40, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(74, 41, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(75, 42, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(76, 43, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(77, 44, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(78, 45, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(79, 46, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(80, 47, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(81, 48, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(82, 49, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(83, 50, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(84, 51, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(85, 52, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(86, 53, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(87, 54, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(88, 55, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(89, 56, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(90, 57, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(91, 58, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(92, 59, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(93, 60, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(94, 61, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(95, 63, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(96, 64, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(97, 65, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(98, 66, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(99, 68, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(100, 69, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(101, 70, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(102, 71, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(103, 72, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(104, 73, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(105, 74, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(106, 75, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(107, 76, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(108, 77, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(109, 79, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(110, 80, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(111, 82, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(112, 83, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(113, 85, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(114, 86, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(115, 87, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(116, 88, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(117, 89, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(118, 90, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(119, 92, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(120, 93, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(121, 94, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(122, 95, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(123, 96, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(124, 97, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(125, 99, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(126, 100, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(127, 101, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(128, 102, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(129, 103, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(130, 104, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(131, 105, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(132, 106, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(133, 107, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(134, 108, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(135, 109, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(136, 111, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(137, 113, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(138, 114, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(139, 115, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(140, 116, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(141, 117, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(142, 118, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(143, 119, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(144, 120, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(145, 121, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(146, 122, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(147, 123, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(148, 124, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(149, 125, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(150, 128, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(151, 129, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(152, 130, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(153, 132, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(154, 133, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(155, 134, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(156, 136, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(157, 139, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(158, 140, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(159, 141, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(160, 142, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(161, 143, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(162, 144, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(163, 145, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(164, 146, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(165, 147, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(166, 148, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(167, 149, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(168, 150, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(169, 151, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(170, 152, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(171, 153, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(172, 154, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(173, 155, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(174, 156, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(175, 157, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(176, 158, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(177, 159, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(178, 160, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(179, 161, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(180, 162, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(181, 163, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(182, 164, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(183, 165, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(184, 166, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(185, 167, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(186, 168, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(187, 169, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(188, 171, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(189, 173, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(190, 174, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(191, 177, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(192, 180, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(193, 181, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(194, 183, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(195, 184, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(196, 185, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(197, 186, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(198, 187, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(199, 188, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(200, 189, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(201, 193, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(202, 198, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(203, 199, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(204, 200, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(205, 202, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(206, 203, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(207, 205, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(208, 206, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(209, 207, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(210, 208, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(211, 209, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(212, 215, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(213, 26, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-15 10:00:00', '2018-04-15 10:00:00'),
(214, 81, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(215, 112, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(216, 137, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(217, 138, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(218, 170, 36, 'APPROVED', 'APPROVED', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(219, 175, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(220, 176, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(221, 179, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(222, 190, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(223, 195, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(224, 201, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(225, 204, 36, 'APPROVED', 'APPROVED BY SYSTEM', '2018-04-23 17:00:00', '2018-04-23 17:00:00'),
(228, 291, 27, 'APPROVED', 'OK', '2018-04-27 04:49:57', '2018-04-27 04:49:57'),
(229, 290, 27, 'APPROVED', 'ok', '2018-04-27 05:02:07', '2018-04-27 05:02:07'),
(230, 172, 27, 'APPROVED', 'ok', '2018-04-27 05:05:32', '2018-04-27 05:05:32'),
(231, 178, 27, 'APPROVED', 'ok', '2018-04-27 05:08:06', '2018-04-27 05:08:06'),
(232, 291, 28, 'REPAIR', 'pebaiki', '2018-04-27 05:09:37', '2018-04-27 05:09:37'),
(233, 291, 28, 'REPAIR', 'sss', '2018-04-27 05:10:10', '2018-04-27 05:10:10'),
(234, 291, 28, 'REPAIR', 'hjkghjh', '2018-04-27 05:13:11', '2018-04-27 05:13:11'),
(235, 291, 28, 'REPAIR', 'ghfhfgh', '2018-04-27 05:14:54', '2018-04-27 05:14:54'),
(236, 290, 28, 'REPAIR', 'dfdsfsfs', '2018-04-27 05:15:01', '2018-04-27 05:15:01'),
(237, 178, 28, 'REPAIR', 'sdfsdfs', '2018-04-27 05:15:06', '2018-04-27 05:15:06'),
(238, 172, 28, 'REPAIR', 'sdfdsfsdfs', '2018-04-27 05:15:14', '2018-04-27 05:15:14'),
(239, 289, 27, 'APPROVED', 'ok', '2018-04-27 07:34:51', '2018-04-27 07:34:51'),
(240, 291, 27, 'APPROVED', 'ok', '2018-04-27 09:32:42', '2018-04-27 09:32:42'),
(241, 172, 27, 'APPROVED', 'ok', '2018-04-27 09:36:05', '2018-04-27 09:36:05'),
(242, 290, 27, 'APPROVED', 'ok', '2018-04-27 09:36:15', '2018-04-27 09:36:15'),
(243, 178, 27, 'APPROVED', 'ok', '2018-04-27 09:37:12', '2018-04-27 09:37:12'),
(244, 291, 28, 'APPROVED', 'ok', '2018-04-27 11:28:29', '2018-04-27 11:28:29'),
(245, 291, 28, 'APPROVED', 'kk', '2018-04-27 11:43:10', '2018-04-27 11:43:10'),
(246, 290, 28, 'REPAIR', 'hhh', '2018-04-27 11:43:29', '2018-04-27 11:43:29'),
(247, 172, 28, 'APPROVED', 'ok', '2018-04-27 11:43:36', '2018-04-27 11:43:36'),
(248, 178, 28, 'APPROVED', 'ok', '2018-04-27 11:43:50', '2018-04-27 11:43:50'),
(249, 289, 28, 'APPROVED', 'jj', '2018-04-27 11:43:57', '2018-04-27 11:43:57'),
(250, 290, 27, 'APPROVED', 'hh', '2018-04-27 11:44:41', '2018-04-27 11:44:41'),
(251, 291, 29, 'REPAIR', 'ss', '2018-04-27 11:48:46', '2018-04-27 11:48:46'),
(252, 289, 29, 'REPAIR', 'sss', '2018-04-27 11:48:53', '2018-04-27 11:48:53'),
(253, 172, 29, 'REPAIR', 'ss', '2018-04-27 11:49:00', '2018-04-27 11:49:00'),
(254, 178, 29, 'APPROVED', 'ss', '2018-04-27 11:49:04', '2018-04-27 11:49:04'),
(255, 291, 28, 'APPROVED', 'ok', '2018-04-27 12:07:38', '2018-04-27 12:07:38'),
(256, 289, 28, 'APPROVED', 'dd', '2018-04-27 12:08:59', '2018-04-27 12:08:59'),
(257, 290, 28, 'REPAIR', 'dsfsd', '2018-04-27 13:49:49', '2018-04-27 13:49:49'),
(258, 290, 27, 'APPROVED', 'df', '2018-04-27 13:51:49', '2018-04-27 13:51:49'),
(259, 263, 27, 'APPROVED', 'cc', '2018-04-27 14:03:16', '2018-04-27 14:03:16'),
(260, 290, 28, 'REPAIR', 'cc', '2018-04-27 14:04:18', '2018-04-27 14:04:18'),
(261, 290, 27, 'APPROVED', 'cc', '2018-04-27 14:05:13', '2018-04-27 14:05:13'),
(262, 290, 28, 'APPROVED', 'dd', '2018-04-27 14:08:49', '2018-04-27 14:08:49'),
(263, 263, 28, 'APPROVED', 'cc', '2018-04-27 14:11:14', '2018-04-27 14:11:14'),
(264, 263, 29, 'REPAIR', 'dd', '2018-04-27 14:13:47', '2018-04-27 14:13:47'),
(265, 291, 29, 'REPAIR', 'd', '2018-04-27 14:15:05', '2018-04-27 14:15:05'),
(266, 289, 29, 'REPAIR', 'd', '2018-04-27 14:15:10', '2018-04-27 14:15:10'),
(267, 290, 29, 'REPAIR', 'd', '2018-04-27 14:15:15', '2018-04-27 14:15:15'),
(268, 263, 28, 'REPAIR', 'a', '2018-04-27 14:15:33', '2018-04-27 14:15:33'),
(269, 263, 27, 'APPROVED', 'sfd', '2018-04-27 14:15:53', '2018-04-27 14:15:53'),
(270, 263, 28, 'REPAIR', 'f', '2018-04-27 14:16:14', '2018-04-27 14:16:14'),
(271, 263, 27, 'APPROVED', '32r', '2018-04-27 14:16:44', '2018-04-27 14:16:44'),
(272, 263, 28, 'REPAIR', 'ewr', '2018-04-27 14:16:58', '2018-04-27 14:16:58'),
(273, 263, 27, 'APPROVED', 'eee', '2018-04-27 14:18:51', '2018-04-27 14:18:51'),
(274, 263, 28, 'APPROVED', 'dd', '2018-04-27 14:19:22', '2018-04-27 14:19:22'),
(275, 291, 28, 'APPROVED', 'dd', '2018-04-27 14:19:49', '2018-04-27 14:19:49'),
(276, 290, 28, 'APPROVED', 'h', '2018-04-27 14:20:37', '2018-04-27 14:20:37'),
(277, 289, 28, 'APPROVED', 'ff', '2018-04-27 14:21:48', '2018-04-27 14:21:48'),
(278, 172, 28, 'APPROVED', 'v', '2018-04-27 14:22:32', '2018-04-27 14:22:32'),
(279, 291, 29, 'REPAIR', 'c', '2018-04-27 15:00:50', '2018-04-27 15:00:50'),
(280, 291, 28, 'APPROVED', 'dd', '2018-04-27 15:02:44', '2018-04-27 15:02:44'),
(281, 291, 29, 'APPROVED', 'ok', '2018-04-28 09:45:33', '2018-04-28 09:45:33'),
(282, 290, 29, 'APPROVED', 'ok', '2018-04-28 09:46:21', '2018-04-28 09:46:21'),
(283, 172, 29, 'APPROVED', 'sds', '2018-04-28 09:46:51', '2018-04-28 09:46:51'),
(284, 289, 29, 'APPROVED', 'fd', '2018-04-28 09:47:20', '2018-04-28 09:47:20'),
(285, 263, 29, 'APPROVED', 'ff', '2018-04-28 09:47:25', '2018-04-28 09:47:25'),
(286, 291, 30, 'REPAIR', 'ff', '2018-04-28 09:47:41', '2018-04-28 09:47:41'),
(287, 289, 30, 'REPAIR', 'f', '2018-04-28 09:47:49', '2018-04-28 09:47:49'),
(288, 291, 29, 'APPROVED', 'cc', '2018-04-28 11:36:51', '2018-04-28 11:36:51'),
(289, 289, 29, 'APPROVED', 'gg', '2018-04-28 11:37:59', '2018-04-28 11:37:59'),
(290, 291, 30, 'APPROVED', 'ccc', '2018-04-28 13:14:24', '2018-04-28 13:14:24'),
(291, 290, 30, 'APPROVED', 'hh', '2018-04-28 13:18:59', '2018-04-28 13:18:59'),
(292, 172, 30, 'APPROVED', 'gg', '2018-04-28 13:27:15', '2018-04-28 13:27:15'),
(293, 289, 30, 'APPROVED', 'ff', '2018-04-28 13:31:27', '2018-04-28 13:31:27'),
(294, 263, 30, 'REPAIR', 'dd', '2018-04-28 13:31:46', '2018-04-28 13:31:46'),
(295, 263, 29, 'APPROVED', 'dd', '2018-04-28 13:32:21', '2018-04-28 13:32:21'),
(296, 263, 30, 'APPROVED', 'd', '2018-04-28 13:33:13', '2018-04-28 13:33:13'),
(297, 172, 31, 'REPAIR', 'ddddd', '2018-04-29 00:17:42', '2018-04-29 00:17:42'),
(298, 178, 30, 'APPROVED', 'cc', '2018-04-29 00:27:10', '2018-04-29 00:27:10'),
(299, 172, 30, 'APPROVED', '22', '2018-04-29 00:27:43', '2018-04-29 00:27:43'),
(300, 291, 31, 'APPROVED', 'sssss', '2018-04-29 00:44:03', '2018-04-29 00:44:03'),
(301, 290, 31, 'APPROVED', 'aa', '2018-04-29 00:44:52', '2018-04-29 00:44:52'),
(302, 289, 31, 'APPROVED', 'ccc', '2018-04-29 00:46:19', '2018-04-29 00:46:19'),
(303, 263, 31, 'APPROVED', 'cc', '2018-04-29 00:46:24', '2018-04-29 00:46:24'),
(304, 178, 31, 'APPROVED', 'cc', '2018-04-29 00:46:38', '2018-04-29 00:46:38'),
(305, 172, 31, 'APPROVED', 'cc', '2018-04-29 00:46:43', '2018-04-29 00:46:43'),
(306, 291, 32, 'APPROVED', 'cc', '2018-04-29 01:01:13', '2018-04-29 01:01:13'),
(307, 290, 32, 'APPROVED', '\'\'\'\'\'\'', '2018-04-29 01:01:28', '2018-04-29 01:01:28'),
(308, 289, 32, 'CANCEL', 'cc', '2018-04-29 01:03:42', '2018-04-29 01:03:42'),
(309, 263, 32, 'APPROVED', 'ss', '2018-04-29 01:04:38', '2018-04-29 01:04:38'),
(310, 178, 32, 'APPROVED', 'ss', '2018-04-29 01:04:43', '2018-04-29 01:04:43'),
(311, 172, 32, 'APPROVED', 'x', '2018-04-29 01:05:04', '2018-04-29 01:05:04'),
(312, 291, 33, 'APPROVED', 'ddd', '2018-04-29 01:23:51', '2018-04-29 01:23:51'),
(313, 290, 33, 'APPROVED', 'dd', '2018-04-29 01:24:07', '2018-04-29 01:24:07'),
(314, 263, 33, 'APPROVED', 'd', '2018-04-29 01:24:12', '2018-04-29 01:24:12'),
(315, 178, 33, 'APPROVED', 'd', '2018-04-29 01:24:16', '2018-04-29 01:24:16'),
(316, 172, 33, 'APPROVED', 'd', '2018-04-29 01:24:20', '2018-04-29 01:24:20'),
(317, 291, 34, 'REPAIR', 'dd', '2018-04-29 01:25:18', '2018-04-29 01:25:18'),
(318, 291, 33, 'APPROVED', 'ss', '2018-04-29 02:03:01', '2018-04-29 02:03:01'),
(319, 291, 34, 'REPAIR', 's', '2018-04-29 02:03:41', '2018-04-29 02:03:41'),
(320, 291, 33, 'APPROVED', 'x', '2018-04-29 02:03:54', '2018-04-29 02:03:54'),
(321, 291, 34, 'REPAIR', 'c', '2018-04-29 02:04:13', '2018-04-29 02:04:13'),
(322, 291, 33, 'APPROVED', 'c', '2018-04-29 02:04:48', '2018-04-29 02:04:48'),
(323, 290, 34, 'REPAIR', 'aa', '2018-04-29 02:25:16', '2018-04-29 02:25:16'),
(324, 290, 33, 'APPROVED', 'dd', '2018-04-29 02:25:54', '2018-04-29 02:25:54'),
(325, 12, 33, 'REPAIR', 'DD', '2018-05-06 01:44:21', '2018-05-06 01:44:21'),
(326, 365, 36, 'APPROVED', 's', '2018-05-10 06:19:37', '2018-05-10 06:19:37'),
(327, 12, 29, 'APPROVED', 'oo', '2018-05-10 10:53:40', '2018-05-10 10:53:40'),
(328, 12, 29, 'REPAIR', 'repr', '2018-05-10 11:01:00', '2018-05-10 11:01:00'),
(329, 12, 29, 'APPROVED', 'dd', '2018-05-10 15:20:53', '2018-05-10 15:20:53'),
(330, 12, 30, 'APPROVED', 'ddd', '2018-05-10 16:45:44', '2018-05-10 16:45:44'),
(331, 12, 31, 'APPROVED', 'aaa', '2018-05-10 17:34:00', '2018-05-10 17:34:00'),
(332, 12, 31, 'APPROVED', 'ok', '2018-05-10 17:41:01', '2018-05-10 17:41:01'),
(333, 12, 32, 'APPROVED', 'rtert', '2018-05-10 18:05:21', '2018-05-10 18:05:21'),
(334, 12, 32, 'CANCEL', 'dd', '2018-05-10 18:41:45', '2018-05-10 18:41:45'),
(335, 12, 32, 'CANCEL', 'ddd', '2018-05-10 18:43:04', '2018-05-10 18:43:04'),
(336, 12, 32, 'CANCEL', 'dd', '2018-05-10 18:44:56', '2018-05-10 18:44:56'),
(337, 12, 32, 'CANCEL', 'd', '2018-05-10 18:50:36', '2018-05-10 18:50:36'),
(338, 12, 32, 'CANCEL', 'ss', '2018-05-10 18:52:32', '2018-05-10 18:52:32'),
(339, 12, 33, 'REPAIR', 'gg', '2018-05-10 19:42:56', '2018-05-10 19:42:56'),
(340, 12, 33, 'REPAIR', 'asdasdas', '2018-05-10 19:46:46', '2018-05-10 19:46:46'),
(341, 12, 33, 'REPAIR', 'ssssssss', '2018-05-10 19:47:43', '2018-05-10 19:47:43'),
(342, 12, 33, 'REPAIR', 'sfs', '2018-05-10 19:58:30', '2018-05-10 19:58:30'),
(343, 12, 33, 'REPAIR', 'dd', '2018-05-10 20:00:07', '2018-05-10 20:00:07'),
(344, 12, 33, 'REPAIR', 'dd', '2018-05-10 20:00:31', '2018-05-10 20:00:31'),
(345, 224, 27, 'APPROVED', 'test1', '2018-05-10 23:24:49', '2018-05-10 23:24:49'),
(346, 224, 27, 'APPROVED', 'ss', '2018-05-10 23:25:42', '2018-05-10 23:25:42'),
(347, 225, 27, 'APPROVED', 'sdsddsd', '2018-05-10 23:28:19', '2018-05-10 23:28:19'),
(348, 225, 28, 'REPAIR', 'sadadasd', '2018-05-10 23:32:10', '2018-05-10 23:32:10'),
(349, 225, 27, 'APPROVED', 'asdasd', '2018-05-10 23:32:28', '2018-05-10 23:32:28'),
(350, 225, 28, 'APPROVED', 'ss', '2018-05-10 23:33:59', '2018-05-10 23:33:59'),
(351, 225, 29, 'REPAIR', 'ddd', '2018-05-10 23:34:21', '2018-05-10 23:34:21'),
(352, 224, 27, 'APPROVED', 'dsffsf', '2018-05-10 23:34:57', '2018-05-10 23:34:57'),
(353, 225, 27, 'APPROVED', 'dada', '2018-05-10 23:35:22', '2018-05-10 23:35:22'),
(354, 225, 28, 'APPROVED', 'asdasd', '2018-05-10 23:36:28', '2018-05-10 23:36:28'),
(355, 224, 28, 'APPROVED', 'asdas', '2018-05-10 23:36:33', '2018-05-10 23:36:33'),
(356, 225, 29, 'APPROVED', 'dfdfd', '2018-05-10 23:42:06', '2018-05-10 23:42:06'),
(357, 224, 29, 'APPROVED', 'dfdf', '2018-05-10 23:42:11', '2018-05-10 23:42:11'),
(358, 225, 30, 'APPROVED', 'sdf', '2018-05-10 23:42:42', '2018-05-10 23:42:42'),
(359, 224, 30, 'APPROVED', 'fsdf', '2018-05-10 23:42:50', '2018-05-10 23:42:50'),
(360, 225, 31, 'APPROVED', 'sdf', '2018-05-10 23:43:16', '2018-05-10 23:43:16'),
(361, 224, 31, 'APPROVED', 'sdf', '2018-05-10 23:43:22', '2018-05-10 23:43:22'),
(362, 225, 32, 'APPROVED', 'fsdf', '2018-05-10 23:43:45', '2018-05-10 23:43:45'),
(363, 224, 32, 'CANCEL', 'sdf', '2018-05-10 23:43:51', '2018-05-10 23:43:51'),
(364, 225, 33, 'APPROVED', 'sdf', '2018-05-10 23:44:16', '2018-05-10 23:44:16'),
(365, 291, 34, 'APPROVED', 'sdf', '2018-05-10 23:44:46', '2018-05-10 23:44:46'),
(366, 291, 34, 'APPROVED', 'dsf', '2018-05-10 23:45:54', '2018-05-10 23:45:54'),
(367, 263, 34, 'REPAIR', 'sdf', '2018-05-10 23:46:01', '2018-05-10 23:46:01'),
(368, 12, 34, 'APPROVED', 'sdf', '2018-05-10 23:46:07', '2018-05-10 23:46:07'),
(369, 365, 1, 'APPROVED', 'fdg', '2018-06-05 09:56:29', '2018-06-05 09:56:29'),
(370, 365, 1, 'APPROVED', 'sdfsfds', '2018-06-05 09:59:30', '2018-06-05 09:59:30'),
(371, 364, 1, 'APPROVED', 'dsfds', '2018-06-05 10:13:20', '2018-06-05 10:13:20'),
(372, 363, 1, 'APPROVED', 'asd', '2018-06-05 10:15:08', '2018-06-05 10:15:08'),
(373, 365, 1, 'APPROVED', 'ad', '2018-06-05 11:43:42', '2018-06-05 11:43:42'),
(374, 365, 1, 'APPROVED', 'dd', '2018-06-05 12:15:33', '2018-06-05 12:15:33'),
(375, 365, 1, 'APPROVED', 'sssss', '2018-06-05 12:18:02', '2018-06-05 12:18:02'),
(376, 246, 1, 'APPROVED', 'sssss', '2018-06-06 06:30:53', '2018-06-06 06:30:53'),
(377, 252, 1, 'APPROVED', 'zxz', '2018-06-06 06:31:27', '2018-06-06 06:31:27'),
(378, 250, 1, 'APPROVED', 'dd', '2018-06-06 06:32:01', '2018-06-06 06:32:01'),
(379, 251, 1, 'APPROVED', 'dddd', '2018-06-06 06:33:40', '2018-06-06 06:33:40'),
(380, 249, 1, 'APPROVED', 'xxxx', '2018-06-06 06:35:23', '2018-06-06 06:35:23'),
(381, 365, 31, 'APPROVED', 'dd', '2018-06-08 00:52:35', '2018-06-08 00:52:35'),
(382, 297, 31, 'APPROVED', 'sudah ok', '2018-06-08 00:59:49', '2018-06-08 00:59:49'),
(383, 298, 31, 'APPROVED', 'sudah ok', '2018-06-08 00:59:52', '2018-06-08 00:59:52'),
(384, 299, 31, 'APPROVED', 'sudah ok', '2018-06-08 00:59:55', '2018-06-08 00:59:55'),
(385, 300, 31, 'APPROVED', 'sudah ok', '2018-06-08 00:59:59', '2018-06-08 00:59:59'),
(386, 359, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:02', '2018-06-08 01:00:02'),
(387, 360, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:06', '2018-06-08 01:00:06'),
(388, 361, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:09', '2018-06-08 01:00:09'),
(389, 362, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:12', '2018-06-08 01:00:12'),
(390, 363, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:15', '2018-06-08 01:00:15'),
(391, 364, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:18', '2018-06-08 01:00:18'),
(392, 365, 31, 'APPROVED', 'sudah ok', '2018-06-08 01:00:22', '2018-06-08 01:00:22'),
(393, 291, 31, 'APPROVED', 'dd', '2018-06-08 01:46:58', '2018-06-08 01:46:58'),
(394, 216, 31, 'APPROVED', 'dd', '2018-06-08 02:45:15', '2018-06-08 02:45:15'),
(395, 211, 31, 'APPROVED', 'ok', '2018-06-08 03:00:16', '2018-06-08 03:00:16'),
(396, 209, 31, 'APPROVED', 'ok', '2018-06-08 03:00:21', '2018-06-08 03:00:21'),
(397, 215, 31, 'APPROVED', 'ok', '2018-06-08 03:00:24', '2018-06-08 03:00:24'),
(398, 226, 31, 'APPROVED', 'ok', '2018-06-08 06:22:53', '2018-06-08 06:22:53'),
(399, 228, 31, 'APPROVED', 'ok', '2018-06-08 06:22:58', '2018-06-08 06:22:58'),
(400, 229, 31, 'APPROVED', 'ok', '2018-06-08 06:23:01', '2018-06-08 06:23:01'),
(401, 231, 31, 'APPROVED', 'ok', '2018-06-08 06:23:04', '2018-06-08 06:23:04'),
(402, 232, 31, 'APPROVED', 'ok', '2018-06-08 06:23:07', '2018-06-08 06:23:07'),
(403, 233, 31, 'APPROVED', 'ok', '2018-06-08 06:23:10', '2018-06-08 06:23:10'),
(404, 237, 31, 'APPROVED', 'ok', '2018-06-08 06:23:14', '2018-06-08 06:23:14'),
(405, 240, 31, 'APPROVED', 'ok', '2018-06-08 06:23:17', '2018-06-08 06:23:17'),
(406, 248, 31, 'APPROVED', 'ok', '2018-06-08 06:23:21', '2018-06-08 06:23:21'),
(407, 258, 31, 'APPROVED', 'ok', '2018-06-08 06:23:24', '2018-06-08 06:23:24'),
(408, 267, 31, 'APPROVED', 'ok', '2018-06-08 06:23:27', '2018-06-08 06:23:27'),
(409, 268, 31, 'APPROVED', 'ok', '2018-06-08 06:23:30', '2018-06-08 06:23:30'),
(410, 269, 31, 'APPROVED', 'ok', '2018-06-08 06:23:34', '2018-06-08 06:23:34'),
(411, 270, 31, 'APPROVED', 'ok', '2018-06-08 06:23:37', '2018-06-08 06:23:37'),
(412, 271, 31, 'APPROVED', 'ok', '2018-06-08 06:23:40', '2018-06-08 06:23:40'),
(413, 272, 31, 'APPROVED', 'ok', '2018-06-08 06:23:44', '2018-06-08 06:23:44'),
(414, 273, 31, 'APPROVED', 'ok', '2018-06-08 06:23:47', '2018-06-08 06:23:47'),
(415, 274, 31, 'APPROVED', 'ok', '2018-06-08 06:23:50', '2018-06-08 06:23:50'),
(416, 275, 31, 'APPROVED', 'ok', '2018-06-08 06:23:54', '2018-06-08 06:23:54'),
(417, 276, 31, 'APPROVED', 'ok', '2018-06-08 06:23:57', '2018-06-08 06:23:57'),
(418, 279, 31, 'APPROVED', 'ok', '2018-06-08 06:24:01', '2018-06-08 06:24:01'),
(419, 280, 31, 'APPROVED', 'ok', '2018-06-08 06:24:04', '2018-06-08 06:24:04'),
(420, 281, 31, 'APPROVED', 'ok', '2018-06-08 06:24:07', '2018-06-08 06:24:07'),
(421, 282, 31, 'APPROVED', 'ok', '2018-06-08 06:24:11', '2018-06-08 06:24:11'),
(422, 283, 31, 'APPROVED', 'ok', '2018-06-08 06:24:15', '2018-06-08 06:24:15'),
(423, 284, 31, 'APPROVED', 'ok', '2018-06-08 06:24:25', '2018-06-08 06:24:25'),
(424, 285, 31, 'APPROVED', 'ok', '2018-06-08 06:24:29', '2018-06-08 06:24:29'),
(425, 286, 31, 'APPROVED', 'ok', '2018-06-08 06:24:32', '2018-06-08 06:24:32'),
(426, 287, 31, 'APPROVED', 'ok', '2018-06-08 06:24:35', '2018-06-08 06:24:35'),
(427, 288, 31, 'APPROVED', 'ok', '2018-06-08 06:24:39', '2018-06-08 06:24:39'),
(428, 292, 31, 'APPROVED', 'ok', '2018-06-08 06:24:42', '2018-06-08 06:24:42'),
(429, 293, 31, 'APPROVED', 'ok', '2018-06-08 06:24:45', '2018-06-08 06:24:45'),
(430, 294, 31, 'APPROVED', 'ok', '2018-06-08 06:24:49', '2018-06-08 06:24:49'),
(431, 295, 31, 'APPROVED', 'ok', '2018-06-08 06:24:52', '2018-06-08 06:24:52'),
(432, 296, 31, 'APPROVED', 'ok', '2018-06-08 06:24:55', '2018-06-08 06:24:55'),
(433, 363, 32, 'APPROVED', 'ok', '2018-06-08 08:49:44', '2018-06-08 08:49:44'),
(434, 364, 32, 'APPROVED', 'ok', '2018-06-08 08:49:49', '2018-06-08 08:49:49'),
(435, 365, 32, 'APPROVED', 'ok', '2018-06-08 08:49:52', '2018-06-08 08:49:52'),
(436, 211, 32, 'APPROVED', 'Pesan APPROVAL dari THEODORUS ARDI HARTOKO :ok', '2018-06-08 09:19:37', '2018-06-08 09:19:37'),
(437, 216, 32, 'APPROVED', 'Pesan APPROVAL dari THEODORUS ARDI HARTOKO :ok', '2018-06-08 09:19:42', '2018-06-08 09:19:42'),
(438, 209, 32, 'APPROVED', 'Pesan APPROVAL dari THEODORUS ARDI HARTOKO :ok', '2018-06-08 09:19:46', '2018-06-08 09:19:46'),
(439, 215, 32, 'APPROVED', 'Pesan APPROVAL dari THEODORUS ARDI HARTOKO :ok', '2018-06-08 09:19:49', '2018-06-08 09:19:49'),
(440, 291, 32, 'APPROVED', 'Pesan APPROVAL dari THEODORUS ARDI HARTOKO :ok', '2018-06-08 09:19:52', '2018-06-08 09:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `standartimplementation`
--

CREATE TABLE `standartimplementation` (
  `id` int(11) NOT NULL,
  `regional` varchar(255) NOT NULL,
  `cluster` varchar(255) NOT NULL,
  `tower` int(11) NOT NULL,
  `tonase` double NOT NULL,
  `pondasi` double NOT NULL,
  `biayatower` double NOT NULL,
  `erection_tower` double NOT NULL,
  `transportasi` double NOT NULL,
  `pondasi_greenfiled` double NOT NULL,
  `bts_outdoor` double NOT NULL,
  `me` double NOT NULL,
  `fy` double NOT NULL,
  `pln_connect` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standartimplementation`
--

INSERT INTO `standartimplementation` (`id`, `regional`, `cluster`, `tower`, `tonase`, `pondasi`, `biayatower`, `erection_tower`, `transportasi`, `pondasi_greenfiled`, `bts_outdoor`, `me`, `fy`, `pln_connect`, `created_at`, `updated_at`) VALUES
(200, 'SUMBAGUT', 'ACEH', 42, 7046, 3057727, 18100, 34060951, 42543748, 22, 6947051, 57710700, 35197304, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(201, 'SUMBAGUT', 'SUMUT', 42, 7046, 2964524, 18100, 33544017, 37837020, 22, 6664665, 55418300, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(202, 'SUMBAGUT', 'KEP NIAS', 42, 7046, 3324624, 18100, 35298050, 42952416, 22, 7223031, 57710700, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(203, 'SUMBAGTENG', 'RIAU KEPULAUAN', 42, 7046, 3324624, 18100, 35298050, 42952416, 22, 7223031, 57710700, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(204, 'SUMBAGTENG', 'RIAU DARATAN', 42, 7046, 2964524, 18100, 33652283, 39429416, 22, 6639227, 57022900, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(205, 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 42, 7046, 3100009, 18100, 32384260, 34962252, 22, 6888228, 55991400, 35683999, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(206, 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 42, 7046, 2876992, 18100, 30154772, 34962252, 22, 6340814, 54845200, 33116876, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(207, 'JABODETABEK', 'DKI JAKARTA', 42, 7046, 3039224, 18100, 20573237, 13535366, 22, 6489726, 49687400, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(208, 'JABODETABEK', 'BOTABEK BANTEN', 42, 7046, 3039224, 18100, 20573237, 16353766, 22, 6489726, 49687400, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(209, 'JAWA BARAT', 'JABAR - TIMUR', 42, 7046, 2844097, 18100, 21417944, 16184662, 22, 6210820, 51406600, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(210, 'JAWA BARAT', 'JABAR - BARAT', 42, 7046, 2844097, 18100, 21417944, 16184662, 22, 6210820, 51406600, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(211, 'JAWA TENGAH', 'JATENG UTARA', 42, 7046, 2709621, 18100, 24837150, 20546136, 22, 6028957, 53125900, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(212, 'JAWA TENGAH', 'JATENG - SELATAN', 42, 7046, 2709621, 18100, 24837150, 20546136, 22, 6028957, 53125900, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(213, 'JAWA TIMUR', 'JATIM - UTARA', 42, 7046, 2750272, 18100, 27253928, 21814416, 22, 6105098, 53699000, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(214, 'JAWA TIMUR', 'JATIM - SELATAN', 42, 7046, 2750272, 18100, 27253928, 21814416, 22, 6105098, 53699000, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(215, 'BALI NUSRA', 'BALI', 42, 7046, 2796250, 18100, 28684266, 26810030, 22, 6227372, 55991400, 32187461, 27438800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(216, 'BALI NUSRA', 'NTT', 42, 7046, 2948046, 18100, 35998014, 42043482, 22, 6572797, 57710700, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(217, 'BALI NUSRA', 'NTB', 42, 7046, 2948046, 18100, 30213248, 36082566, 22, 6572797, 57710700, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(218, 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 42, 7046, 3539593.711111111, 18100, 38104529, 48411899, 22, 7789358, 60560600, 40908403, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(219, 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 42, 7046, 3428734.2, 18100, 44721484, 49657911, 22, 7575153, 62431900, 39627144, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(220, 'KALIMANTAN', 'KALIMANTAN 3 (KALTIM BAG. UTARA)', 42, 7046, 3566984.777777778, 18100, 42631438, 48411899, 22, 7808631, 61184400, 41224967, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(221, 'SULMAPUA', 'SULSELBARTRA', 42, 7046, 3044550, 18100, 36026198, 44086822, 22, 6826497, 58283800, 35045628, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(222, 'SULMAPUA', 'SULUT, TENGAH, GORONTALO', 42, 7046, 3147954, 18100, 35272276, 42903094, 22, 7003042, 57710700, 36235904, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(223, 'SULMAPUA', 'MALUKU', 42, 7046, 4254914, 18100, 45376240, 67979808, 22, 8963988, 61149200, 48978038, 31500000, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(224, 'SULMAPUA', 'PAPUA', 42, 7046, 5317427, 18100, 48131226, 76385686, 22, 10852010, 70611500, 59508316, 31500000, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(225, 'SUMBAGUT', 'ACEH', 52, 9649, 3057727, 18100, 43065049, 58260662, 25, 6947051, 58226400, 35197304, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(226, 'SUMBAGUT', 'SUMUT', 52, 9649, 2964524, 18100, 38478017, 51815130, 25, 6664665, 55934100, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(227, 'SUMBAGUT', 'KEP NIAS', 52, 9649, 3324624, 18100, 42505407, 58820304, 25, 7223031, 58226400, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(228, 'SUMBAGTENG', 'RIAU KEPULAUAN', 52, 9649, 3324624, 18100, 42505407, 58820304, 25, 7223031, 58226400, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(229, 'SUMBAGTENG', 'RIAU DARATAN', 52, 9649, 2964524, 18100, 41977821, 53995804, 25, 6639227, 57538700, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(230, 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 52, 9649, 3100009, 18100, 37705544, 47878338, 25, 6888228, 56507200, 35683999, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(231, 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 52, 9649, 2876992, 18100, 34567223, 47878338, 25, 6340814, 55361000, 33116876, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(232, 'JABODETABEK', 'DKI JAKARTA', 52, 9649, 3039224, 18100, 21944785, 18535729, 25, 6489726, 50203200, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(233, 'JABODETABEK', 'BOTABEK BANTEN', 52, 9649, 3039224, 18100, 21944785, 22395329, 25, 6489726, 50203200, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(234, 'JAWA BARAT', 'JABAR - TIMUR', 52, 9649, 2844097, 18100, 23127367, 22163753, 25, 6210820, 51922400, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(235, 'JAWA BARAT', 'JABAR - BARAT', 52, 9649, 2844097, 18100, 23127367, 22163753, 25, 6210820, 51922400, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(236, 'JAWA TENGAH', 'JATENG UTARA', 52, 9649, 2709621, 18100, 27866312, 28136484, 25, 6028957, 53641700, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(237, 'JAWA TENGAH', 'JATENG - SELATAN', 52, 9649, 2709621, 18100, 27866312, 28136484, 25, 6028957, 53641700, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(238, 'JAWA TIMUR', 'JATIM - UTARA', 52, 9649, 2750272, 18100, 31156621, 29873304, 25, 6105098, 54214800, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(239, 'JAWA TIMUR', 'JATIM - SELATAN', 52, 9649, 2750272, 18100, 31156621, 29873304, 25, 6105098, 54214800, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(240, 'BALI NUSRA', 'BALI', 52, 9649, 2796250, 18100, 32989931, 36714445, 25, 6227372, 56507200, 32187461, 27438800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(241, 'BALI NUSRA', 'NTT', 52, 9649, 2948046, 18100, 42388057, 57575583, 25, 6572797, 58226400, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(242, 'BALI NUSRA', 'NTB', 52, 9649, 2948046, 18100, 34466228, 49412529, 25, 6572797, 58226400, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(243, 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 52, 9649, 3539593.711111111, 18100, 43819933, 66296681, 25, 7789358, 61122000, 40908403, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(244, 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 52, 9649, 3428734.2, 18100, 53193848, 68003006, 25, 7575153, 62993400, 39627144, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(245, 'KALIMANTAN', 'KALIMANTAN 3 (KALTIM BAG. UTARA)', 52, 9649, 3566984.777777778, 18100, 50206693, 66296681, 25, 7808631, 61745800, 41224967, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(246, 'SULMAPUA', 'SULSELBARTRA', 52, 9649, 3044550, 18100, 43188924, 60373793, 25, 6826497, 58799500, 35045628, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(247, 'SULMAPUA', 'SULUT, TENGAH, GORONTALO', 52, 9649, 3147954, 18100, 42069640, 58752761, 25, 7003042, 58226400, 36235904, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(248, 'SULMAPUA', 'MALUKU', 52, 9649, 4254914, 18100, 56282617, 93093552, 25, 8963988, 61665000, 48978038, 31500000, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(249, 'SULMAPUA', 'PAPUA', 52, 9649, 5317427, 18100, 65912319, 104604809, 25, 10852010, 71178900, 59508316, 31500000, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(250, 'SUMBAGUT', 'ACEH', 62, 13448, 3057727, 18100, 57721560, 81199024, 34, 6947051, 59770900, 35197304, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(251, 'SUMBAGUT', 'SUMUT', 62, 13448, 2964524, 18100, 51387378, 72215760, 34, 6664665, 57478600, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(252, 'SUMBAGUT', 'KEP NIAS', 62, 13448, 3324624, 18100, 57537243, 81979008, 34, 7223031, 59770900, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(253, 'SUMBAGTENG', 'RIAU KEPULAUAN', 62, 13448, 3324624, 18100, 57537243, 81979008, 34, 7223031, 59770900, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(254, 'SUMBAGTENG', 'RIAU DARATAN', 62, 13448, 2964524, 18100, 56941576, 75255008, 34, 6639227, 59083200, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(255, 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 62, 13448, 3100009, 18100, 51150602, 66728976, 34, 6888228, 58051600, 35683999, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(256, 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 62, 13448, 2876992, 18100, 46646087, 66728976, 34, 6340814, 56905500, 33116876, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(257, 'JABODETABEK', 'DKI JAKARTA', 62, 13448, 3039224, 18100, 29202815, 25833608, 34, 6489726, 51747600, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(258, 'JABODETABEK', 'BOTABEK BANTEN', 62, 13448, 3039224, 18100, 29202815, 31212808, 34, 6489726, 51747600, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(259, 'JAWA BARAT', 'JABAR - TIMUR', 62, 13448, 2844097, 18100, 30890571, 30890056, 34, 6210820, 53466900, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(260, 'JAWA BARAT', 'JABAR - BARAT', 62, 13448, 2844097, 18100, 30890571, 30890056, 34, 6210820, 53466900, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(261, 'JAWA TENGAH', 'JATENG UTARA', 62, 13448, 2709621, 18100, 37681296, 39214368, 34, 6028957, 55186200, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(262, 'JAWA TENGAH', 'JATENG - SELATAN', 62, 13448, 2709621, 18100, 37681296, 39214368, 34, 6028957, 55186200, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(263, 'JAWA TIMUR', 'JATIM - UTARA', 62, 13448, 2750272, 18100, 42280512, 41635008, 34, 6105098, 55759300, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(264, 'JAWA TIMUR', 'JATIM - SELATAN', 62, 13448, 2750272, 18100, 42280512, 41635008, 34, 6105098, 55759300, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(265, 'BALI NUSRA', 'BALI', 62, 13448, 2796250, 18100, 44822184, 51169640, 34, 6227372, 58051600, 32187461, 27438800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(266, 'BALI NUSRA', 'NTT', 62, 13448, 2948046, 18100, 57463304, 80244216, 34, 6572797, 59770900, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(267, 'BALI NUSRA', 'NTB', 62, 13448, 2948046, 18100, 46422496, 68867208, 34, 6572797, 59770900, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(268, 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 62, 13448, 3539593.711111111, 18100, 59644299, 92398982, 34, 7789358, 62803100, 40908403, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(269, 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 62, 13448, 3428734.2, 18100, 73179236, 94777119, 34, 7575153, 64674500, 39627144, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(270, 'KALIMANTAN', 'KALIMANTAN 3 (KALTIM BAG. UTARA)', 62, 13448, 3566984.777777778, 18100, 68806946, 92398982, 34, 7808631, 63426900, 41224967, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(271, 'SULMAPUA', 'SULSELBARTRA', 62, 13448, 3044550, 18100, 59534296, 84144136, 34, 6826497, 60344000, 35045628, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(272, 'SULMAPUA', 'SULUT, TENGAH, GORONTALO', 62, 13448, 3147954, 18100, 57866744, 81884872, 34, 7003042, 59770900, 36235904, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(273, 'SULMAPUA', 'MALUKU', 62, 13448, 4254914, 18100, 78657352, 129746304, 34, 8963988, 63209500, 48978038, 31500000, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(274, 'SULMAPUA', 'PAPUA', 62, 13448, 5317427, 18100, 92360864, 145789768, 34, 10852010, 72877800, 59508316, 31500000, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(275, 'SUMBAGUT', 'ACEH', 72, 16895, 3057727, 18100, 69715852, 102012010, 45, 6947051, 60286700, 35197304, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(276, 'SUMBAGUT', 'SUMUT', 72, 16895, 2964524, 18100, 61621016, 90726150, 45, 6664665, 57994300, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(277, 'SUMBAGUT', 'KEP NIAS', 72, 16895, 3324624, 18100, 70319012, 102991920, 45, 7223031, 60286700, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(278, 'SUMBAGTENG', 'RIAU KEPULAUAN', 72, 16895, 3324624, 18100, 70319012, 102991920, 45, 7223031, 60286700, 38269538, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(279, 'SUMBAGTENG', 'RIAU DARATAN', 72, 16895, 2964524, 18100, 68735942, 94544420, 45, 6639227, 59599000, 34124460, 28916800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(280, 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 72, 16895, 3100009, 18100, 61828784, 83832990, 45, 6888228, 58567400, 35683999, 29436100, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(281, 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 72, 16895, 2876992, 18100, 56028740, 83832990, 45, 6340814, 57421200, 33116876, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(282, 'JABODETABEK', 'DKI JAKARTA', 72, 16895, 3039224, 18100, 33673287, 32455295, 45, 6489726, 52263400, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(283, 'JABODETABEK', 'BOTABEK BANTEN', 72, 16895, 3039224, 18100, 33673287, 39213295, 45, 6489726, 52263400, 34984313, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(284, 'JAWA BARAT', 'JABAR - TIMUR', 72, 16895, 2844097, 18100, 35836356, 38807815, 45, 6210820, 53982700, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(285, 'JAWA BARAT', 'JABAR - BARAT', 72, 16895, 2844097, 18100, 35836356, 38807815, 45, 6210820, 53982700, 32738226, 26839600, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(286, 'JAWA TENGAH', 'JATENG UTARA', 72, 16895, 2709621, 18100, 44670380, 49265820, 45, 6028957, 55702000, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(287, 'JAWA TENGAH', 'JATENG - SELATAN', 72, 16895, 2709621, 18100, 44670380, 49265820, 45, 6028957, 55702000, 31190276, 26706400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(288, 'JAWA TIMUR', 'JATIM - UTARA', 72, 16895, 2750272, 18100, 50516050, 52306920, 45, 6105098, 56275100, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(289, 'JAWA TIMUR', 'JATIM - SELATAN', 72, 16895, 2750272, 18100, 50516050, 52306920, 45, 6105098, 56275100, 31658211, 26173800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(290, 'BALI NUSRA', 'BALI', 72, 16895, 2796250, 18100, 53827470, 64285475, 45, 6227372, 58567400, 32187461, 27438800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(291, 'BALI NUSRA', 'NTT', 72, 16895, 2948046, 18100, 69725665, 100812465, 45, 6572797, 60286700, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(292, 'BALI NUSRA', 'NTB', 72, 16895, 2948046, 18100, 55854870, 86519295, 45, 6572797, 60286700, 33934783, 28137800, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(293, 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 72, 16895, 3539593.711111111, 18100, 72196808, 116082748, 45, 7789358, 63364500, 40908403, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(294, 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 72, 16895, 3428734.2, 18100, 89704370, 119070452, 45, 7575153, 65235900, 39627144, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(295, 'KALIMANTAN', 'KALIMANTAN 3 (KALTIM BAG. UTARA)', 72, 16895, 3566984.777777778, 18100, 83992528, 116082748, 45, 7808631, 63988300, 41224967, 33675900, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(296, 'SULMAPUA', 'SULSELBARTRA', 72, 16895, 3044550, 18100, 73172245, 105712015, 45, 6826497, 60859800, 35045628, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(297, 'SULMAPUA', 'SULUT, TENGAH, GORONTALO', 72, 16895, 3147954, 18100, 70959000, 102873655, 45, 7003042, 60286700, 36235904, 30168400, '2018-03-19 10:00:05', '2018-03-19 10:00:05'),
(298, 'SULMAPUA', 'MALUKU', 72, 16895, 4254914, 18100, 98531640, 163002960, 45, 8963988, 63725300, 48978038, 31500000, '2018-03-19 10:00:05', '2018-03-21 17:59:24'),
(299, 'SULMAPUA', 'PAPUA', 72, 16895, 5317427, 18100, 115984175, 183158695, 45, 10852010, 73445200, 59508316, 31500000, '2018-03-19 10:00:05', '2018-03-21 18:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_api` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('OFFICER PSC','OFFICER PROCUREMENT','GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA','MANAGER UBIS','GENERAL MANAGER UBIS','EXECUTIVE GENERAL MANAGER UBIS','STAFF PROCUREMENT','MANAGER PROCUREMENT','DIRECTOR','ADMINISTRATOR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `password_api`, `level`, `area`, `area2`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN 12345', 'nugrohoaditya10@gmail.com', '$2y$10$z7k3CF0a60j.XwMLr4KoBeWYKO3AL8Kgh0Zo0Nav7FLRqVBZFK5PW', '827ccb0eea8a706c4c34a16891f84e7b', 'DIRECTOR', 'AREA 3', NULL, 'AoVGpuR7pB177eXfj6boQexVBRC6EK9ZttyWdRxek2XkJ1x0wv5DxOABaCg0', '2017-10-31 17:00:00', '2018-03-23 05:19:34'),
(27, 'ARIF ROCHMAN', 'area@gmail.com', '$2y$10$D8GWAqZ9RebXnbNGnh0xKOAV3s0MdyWY9yLlo/7Y8fUNBdfhWW8z2', '3e60e013ab6148896a6eba07895d8dcb', 'MANAGER AREA', 'AREA 3', NULL, 'UNLkr3K2pQO2mNB8Ry45XzOri2xRmLw5aEFs5P3hd80VAFkxgTKVtFqNbbXk', '2018-03-18 23:39:19', '2018-03-23 04:36:54'),
(28, 'IWAN ADJI', 'gm-area@gmail.com', '$2y$10$W.YwSmfHguTX10o/G/vqc.7sFeJb1f4c.nxlQ46XaxcqQFVFp2TgC', '3e60e013ab6148896a6eba07895d8dcb', 'GENERAL MANAGER AREA', 'AREA 3', NULL, 'PRwECeWZ4cMftieK0DpQy3UToZGyHHyo02IYTsOmlpgC3cWDDjqqU7EdtDh3', '2018-03-18 23:40:34', '2018-03-18 23:40:34'),
(29, 'RUDI ALBERT', 'ubis-manager@gmail.com', '$2y$10$IpAWJhdgS0IXK8vc8NGrcufVKO6RP6DJpw1S6Y8hV4eCVBdDDEwJy', '3e60e013ab6148896a6eba07895d8dcb', 'MANAGER UBIS', 'AREA 3', 'AREA 4', 'MrMKOUZsy5LIYAKWdRYU2R6QPVkwMPGHAZQRahOXOmQbvK8D063wyUgR4mbH', '2018-03-18 23:41:35', '2018-03-23 05:19:22'),
(30, 'HARRY RAMDAN', 'gm-ubis@gmail.com', '$2y$10$i6pjcPp08g1YQoTsJ3dZFuyUrKoHgxEG1lSYXGZLPa8BTpm127maW', '3e60e013ab6148896a6eba07895d8dcb', 'GENERAL MANAGER UBIS', '', NULL, 'byREoDnDqaU4blxJq6tIEsIHlMaIrfCsWqsHBH5e22WLLyfht4SylanW3F5l', '2018-03-18 23:42:38', '2018-03-18 23:42:38'),
(31, 'EDY SUSILO', 'egm-ubis@gmail.com', '$2y$10$b3pvRB6C95Q7dOi/4Yzs9evUDKbeI1McfU/PEpZCJ0gkmDE2ouJSW', '3e60e013ab6148896a6eba07895d8dcb', 'EXECUTIVE GENERAL MANAGER UBIS', '', NULL, 'QKjVBhLN9xWpEzQlnOQoK3B5EEDubIL7hp0DD4ZGVfrhW8CUqGRZsauP2B0z', '2018-03-18 23:43:17', '2018-03-18 23:43:17'),
(32, 'THEODORUS ARDI HARTOKO', 'teddy.hartoko@mitratel.co.id', '$2y$10$EyLTv9IyRzjQDWs8HrkZ0.T0mJZVa5a9XtS/7yq9.pv9JCiN4GVrW', '3e60e013ab6148896a6eba07895d8dcb', 'DIRECTOR', '', NULL, 'kiW90vPX0LXRNMUzn4cM2LO6ne8NE9ubd9FylpOCXgMAKDp0e2Nm4VgGEy0H', '2018-03-18 23:44:39', '2018-03-18 23:44:39'),
(33, 'IHSAN PERBAWA GINANJAR', 'nugroho.adty@gmail.com', '$2y$10$fU3s8r.Cdj1zxss1sK6/kuoMyytjihvpxuW6argLmBe740ke28ZrG', '3e60e013ab6148896a6eba07895d8dcb', 'STAFF PROCUREMENT', 'AREA 3', NULL, '6wulPH2bklWukT3NAyUTAI5AmNxHz3PQOWJdXUP60IVMeYxvBZvdubKpC83q', '2018-03-18 23:45:22', '2018-03-18 23:45:22'),
(34, 'MOHAMMAD ALI AKBAR', 'm-procurement@gmail.com', '$2y$10$inQeHx.ENWSGOwn9Yj53aeaL1kSdOzlH1VaU7vYWJuBGStgjUB.8W', '3e60e013ab6148896a6eba07895d8dcb', 'MANAGER PROCUREMENT', '', NULL, 'LoJalWvGyxwEa4YKySWCuGly9QbN4cGwudsJKRnOw3Kv9xFMU4v3raLsvzir', '2018-03-18 23:46:13', '2018-03-18 23:46:13'),
(36, 'ADMINISTRATOR', 'indonesiaich@gmail.com', '$2y$10$z7k3CF0a60j.XwMLr4KoBeWYKO3AL8Kgh0Zo0Nav7FLRqVBZFK5PW', '827ccb0eea8a706c4c34a16891f84e7b', 'STAFF PROCUREMENT', 'AREA 4', NULL, '9h5QsScdtTLBpMYlCES4UIbR1m3kWcOXegAZ5JSxSZhyJmxBNDeHw9NbptW1', '2018-03-29 17:00:00', '2018-03-29 17:00:00'),
(37, 'NUGROHO ADITYA', 'nugrohoaditya@gmail.com', '$2y$10$Xuii6f6fqEbyaGBUjgvh4uquYrN8Y0Xorul4kMA0Cu2j5JoWIqKAC', '827ccb0eea8a706c4c34a16891f84e7b', 'OFFICER PSC', NULL, NULL, '3Csm2l9CIFwtQvfzoNmxIprwb5Y6ffUHNUWj647lCQiL7Htj70hx7gLElOt6', '2018-04-17 00:54:37', '2018-04-17 00:54:37'),
(38, 'ADMIN1@ADMIN.COM', 'admin1@admin.com', '$2y$10$Tkauv/8.qUI1UNxagKHOEu8XX7Re4C1XFrlc6UkTC2vsVmODEqygO', '827ccb0eea8a706c4c34a16891f84e7b', 'OFFICER PSC', NULL, NULL, NULL, '2018-05-11 02:17:00', '2018-05-11 02:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

CREATE TABLE `user_session` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `token_session` text NOT NULL,
  `logout` tinyint(4) NOT NULL,
  `player_ids` text NOT NULL,
  `token_ids` text NOT NULL,
  `device_id` text NOT NULL,
  `device_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `varea`
-- (See below for the actual view)
--
CREATE TABLE `varea` (
`area` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vavgprojecareatutp`
-- (See below for the actual view)
--
CREATE TABLE `vavgprojecareatutp` (
`area` varchar(255)
,`infratype` varchar(255)
,`budget` double
,`capex` double
,`tahun` int(4)
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vavgprojecnstutp`
-- (See below for the actual view)
--
CREATE TABLE `vavgprojecnstutp` (
`infratype` varchar(255)
,`budget` double
,`capex` double
,`tahun` int(4)
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vavgprojecregionaltutp`
-- (See below for the actual view)
--
CREATE TABLE `vavgprojecregionaltutp` (
`regional` varchar(255)
,`infratype` varchar(255)
,`budget` double
,`capex` double
,`tahun` int(4)
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vavgprojectareab2s`
-- (See below for the actual view)
--
CREATE TABLE `vavgprojectareab2s` (
`area` varchar(255)
,`infratype` varchar(255)
,`budget` double
,`capex` double
,`tahun` int(4)
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vavgprojectnsb2s`
-- (See below for the actual view)
--
CREATE TABLE `vavgprojectnsb2s` (
`infratype` varchar(255)
,`budget` double
,`capex` double
,`tahun` int(4)
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vavgprojectregionalb2s`
-- (See below for the actual view)
--
CREATE TABLE `vavgprojectregionalb2s` (
`regional` varchar(255)
,`infratype` varchar(255)
,`budget` double
,`capex` double
,`tahun` int(4)
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vdistinsstandartimplementationcluster`
-- (See below for the actual view)
--
CREATE TABLE `vdistinsstandartimplementationcluster` (
`regional` varchar(255)
,`cluster` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vdistinsstandartimplementationtower`
-- (See below for the actual view)
--
CREATE TABLE `vdistinsstandartimplementationtower` (
`regional` varchar(255)
,`tower` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vgrafik`
-- (See below for the actual view)
--
CREATE TABLE `vgrafik` (
`tahun` varchar(4)
,`bulan` varchar(64)
,`jumlah` bigint(21)
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vinfra`
-- (See below for the actual view)
--
CREATE TABLE `vinfra` (
`infratype` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vnodoc`
-- (See below for the actual view)
--
CREATE TABLE `vnodoc` (
`nodoc` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vnotificationsuser`
-- (See below for the actual view)
--
CREATE TABLE `vnotificationsuser` (
`notificationid` int(11)
,`users_id` int(11)
,`notificationstatus` int(11)
,`projectid` int(11)
,`pesannya` text
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vplafon_capex_area`
-- (See below for the actual view)
--
CREATE TABLE `vplafon_capex_area` (
`area` varchar(255)
,`infratype` varchar(255)
,`budgetNya` double
,`capexNya` double
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vplafon_capex_nasional`
-- (See below for the actual view)
--
CREATE TABLE `vplafon_capex_nasional` (
`infratype` varchar(255)
,`budgetNya` double
,`capexNya` double
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vplafon_capex_nasional_home`
-- (See below for the actual view)
--
CREATE TABLE `vplafon_capex_nasional_home` (
`infratype` varchar(255)
,`budgetNya` double
,`capexNya` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vplafon_capex_regional`
-- (See below for the actual view)
--
CREATE TABLE `vplafon_capex_regional` (
`infratype` varchar(255)
,`regional` varchar(255)
,`budgetNya` double
,`capexNya` double
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectall`
-- (See below for the actual view)
--
CREATE TABLE `vprojectall` (
`id` int(11)
,`projectid` varchar(255)
,`no_doc` varchar(255)
,`proc` varchar(255)
,`ubis` varchar(255)
,`sitename` varchar(255)
,`siteid` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`cluster` varchar(255)
,`mitra` varchar(255)
,`kode_tower_depan` varchar(255)
,`tower` int(11)
,`kode_tower_belakang` varchar(255)
,`tinggitower` text
,`longitude` text
,`latituted` text
,`infratype` varchar(255)
,`towerprovider` varchar(255)
,`provinsi` text
,`kabupaten` text
,`budget` double
,`sis` double
,`sitac` double
,`imb` double
,`imb_jasa` double
,`qty_lahan` int(11)
,`lahan` double
,`cme` double
,`pln` double
,`addtransport` double
,`addpln` double
,`addcme` double
,`biayatower` double
,`status_id` int(11)
,`filename` text
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectimplementation`
-- (See below for the actual view)
--
CREATE TABLE `vprojectimplementation` (
`id` int(11)
,`proc` varchar(255)
,`ubis` varchar(255)
,`no_doc` varchar(255)
,`projectid` varchar(255)
,`sitename` varchar(255)
,`siteid` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`cluster` varchar(255)
,`mitra` varchar(255)
,`kode_tower_depan` varchar(255)
,`tower` int(11)
,`kode_tower_belakang` varchar(255)
,`tinggitower` text
,`budget` double
,`sis` double
,`sitac` double
,`imb` double
,`imb_jasa` double
,`qty_lahan` int(11)
,`lahan` double
,`biayatower` double
,`cme` double
,`pln` double
,`addtransport` double
,`addpln` double
,`addcme` double
,`longitude` text
,`latituted` text
,`infratype` varchar(255)
,`towerprovider` varchar(255)
,`provinsi` text
,`kabupaten` text
,`status_id` int(11)
,`filename` text
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`projectimplementationid` int(11)
,`towerimplementation` int(11)
,`clusterimplementation` varchar(255)
,`mitraimplementation` varchar(255)
,`biayastandard` double
,`biayaadditional` double
,`capex` double
,`capexuntapped` double
,`capexb2s` double
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectimplementationadditional`
-- (See below for the actual view)
--
CREATE TABLE `vprojectimplementationadditional` (
`id` int(11)
,`project_implementation_id` int(11)
,`pekerjaan` text
,`satuan` varchar(200)
,`qty` double
,`harga` double
,`total` double
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectimplementationfinish`
-- (See below for the actual view)
--
CREATE TABLE `vprojectimplementationfinish` (
`id` int(11)
,`proc` varchar(255)
,`ubis` varchar(255)
,`no_doc` varchar(255)
,`projectid` varchar(255)
,`sitename` varchar(255)
,`siteid` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`cluster` varchar(255)
,`mitra` varchar(255)
,`kode_tower_depan` varchar(255)
,`tower` int(11)
,`kode_tower_belakang` varchar(255)
,`tinggitower` text
,`budget` double
,`sis` double
,`sitac` double
,`imb` double
,`imb_jasa` double
,`qty_lahan` int(11)
,`lahan` double
,`biayatower` double
,`cme` double
,`pln` double
,`addtransport` double
,`addpln` double
,`addcme` double
,`longitude` text
,`latituted` text
,`infratype` varchar(255)
,`towerprovider` varchar(255)
,`provinsi` text
,`kabupaten` text
,`status_id` int(11)
,`filename` text
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`projectimplementationid` int(11)
,`towerimplementation` int(11)
,`clusterimplementation` varchar(255)
,`mitraimplementation` varchar(255)
,`biayastandard` double
,`biayaadditional` double
,`capex` double
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectimplementationnew`
-- (See below for the actual view)
--
CREATE TABLE `vprojectimplementationnew` (
`id` int(11)
,`proc` varchar(255)
,`ubis` varchar(255)
,`no_doc` varchar(255)
,`projectid` varchar(255)
,`sitename` varchar(255)
,`siteid` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`cluster` varchar(255)
,`mitra` varchar(255)
,`kode_tower_depan` varchar(255)
,`tower` int(11)
,`kode_tower_belakang` varchar(255)
,`budget` double
,`sis` double
,`sitac` double
,`imb` double
,`imb_jasa` double
,`qty_lahan` int(11)
,`lahan` double
,`biayatower` double
,`cme` double
,`pln` double
,`addtransport` double
,`addpln` double
,`addcme` double
,`longitude` text
,`latituted` text
,`infratype` varchar(255)
,`towerprovider` varchar(255)
,`provinsi` text
,`kabupaten` text
,`status_id` int(11)
,`filename` text
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`regionalnya` varchar(255)
,`clusternya` varchar(255)
,`towernya` int(11)
,`capex` double
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectimplementationstandard`
-- (See below for the actual view)
--
CREATE TABLE `vprojectimplementationstandard` (
`id` int(11)
,`project_implementation_id` int(11)
,`tonase` double
,`pondasi` double
,`biayatower` double
,`erection_tower` double
,`transportasi` double
,`pondasi_greenfiled` double
,`bts_outdoor` double
,`me` double
,`fy` double
,`pln_connect` double
,`total` double
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectimplementationstandardnew`
-- (See below for the actual view)
--
CREATE TABLE `vprojectimplementationstandardnew` (
`id` int(11)
,`regional` varchar(255)
,`cluster` varchar(255)
,`tower` int(11)
,`tonase` double
,`pondasi` double
,`biayatower` double
,`erection_tower` double
,`transportasi` double
,`pondasi_greenfiled` double
,`bts_outdoor` double
,`me` double
,`fy` double
,`pln_connect` double
,`total` double
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectpo`
-- (See below for the actual view)
--
CREATE TABLE `vprojectpo` (
`id` int(11)
,`po` varchar(100)
,`projectid` varchar(255)
,`infratype` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectpr`
-- (See below for the actual view)
--
CREATE TABLE `vprojectpr` (
`id` int(11)
,`proc` varchar(255)
,`ubis` varchar(255)
,`no_doc` varchar(255)
,`projectid` varchar(255)
,`sitename` varchar(255)
,`siteid` varchar(255)
,`area` varchar(255)
,`regional` varchar(255)
,`cluster` varchar(255)
,`mitra` varchar(255)
,`kode_tower_depan` varchar(255)
,`tower` int(11)
,`kode_tower_belakang` varchar(255)
,`tinggitower` text
,`budget` double
,`sis` double
,`sitac` double
,`imb` double
,`imb_jasa` double
,`qty_lahan` int(11)
,`lahan` double
,`biayatower` double
,`cme` double
,`pln` double
,`addtransport` double
,`addpln` double
,`addcme` double
,`longitude` text
,`latituted` text
,`infratype` varchar(255)
,`towerprovider` varchar(255)
,`provinsi` text
,`kabupaten` text
,`status_id` int(11)
,`filename` text
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`projectimplementationid` int(11)
,`towerimplementation` int(11)
,`clusterimplementation` varchar(255)
,`mitraimplementation` varchar(255)
,`biayastandard` double
,`biayaadditional` double
,`capex` double
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectstatus`
-- (See below for the actual view)
--
CREATE TABLE `vprojectstatus` (
`project_id` int(11)
,`status` varchar(255)
,`name` varchar(255)
,`id` int(10) unsigned
,`email` varchar(255)
,`level` enum('OFFICER PSC','OFFICER PROCUREMENT','GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA','MANAGER UBIS','GENERAL MANAGER UBIS','EXECUTIVE GENERAL MANAGER UBIS','STAFF PROCUREMENT','MANAGER PROCUREMENT','DIRECTOR','ADMINISTRATOR')
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vregional`
-- (See below for the actual view)
--
CREATE TABLE `vregional` (
`regional` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vscheduller`
-- (See below for the actual view)
--
CREATE TABLE `vscheduller` (
`id` int(11)
,`projectid` varchar(255)
,`area` varchar(255)
,`status` enum('NEW','AREA - GENERAL MANAGER AREA','UBIS - MANAGER','UBIS - GENERAL MANAGER','UBIS - EXECUTIVE GENERAL MANAGER','PROCUREMENT - STAFF PROCUREMENT','PROCUREMENT - MANAGER PROCUREMENT','DIRECTOR','CANCEL','REPAIR AREA - REVIEWER','REPAIR AREA - MANAGER AREA','REPAIR AREA - GENERAL MANAGER AREA','REPAIR UBIS - MANAGER','REPAIR UBIS - GENERAL MANAGER','REPAIR UBIS - EXECUTIVE GENERAL MANAGER','REPAIR PROCUREMENT - STAFF PROCUREMENT','REPAIR PROCUREMENT - MANAGER PROCUREMENT','FINISH')
,`updated_at` timestamp
,`jmlhari` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vstandartimplementation`
-- (See below for the actual view)
--
CREATE TABLE `vstandartimplementation` (
`id` int(11)
,`regional` varchar(255)
,`cluster` varchar(255)
,`tower` int(11)
,`tonase` double
,`pondasi` double
,`biayatower` double
,`erection_tower` double
,`transportasi` double
,`pondasi_greenfiled` double
,`bts_outdoor` double
,`me` double
,`fy` double
,`pln_connect` double
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtahun`
-- (See below for the actual view)
--
CREATE TABLE `vtahun` (
`infratype` varchar(255)
,`tahun` int(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalproject`
-- (See below for the actual view)
--
CREATE TABLE `vtotalproject` (
`infratype` varchar(255)
,`ordernya` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectcancel`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectcancel` (
`infratype` varchar(255)
,`canc` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectcanceltahunan`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectcanceltahunan` (
`infratype` varchar(255)
,`canc` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectfinish`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectfinish` (
`infratype` varchar(255)
,`fin` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectfinishtahunan`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectfinishtahunan` (
`infratype` varchar(255)
,`fin` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectnya`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectnya` (
`infratype` varchar(255)
,`ordernya` bigint(21)
,`fin` bigint(21)
,`prog` bigint(21)
,`canc` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectnyatahunan`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectnyatahunan` (
`infratype` varchar(255)
,`tahun` int(4)
,`ordernya` bigint(21)
,`fin` bigint(21)
,`prog` bigint(21)
,`canc` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectproses`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectproses` (
`infratype` varchar(255)
,`prog` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojectprosestahunan`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojectprosestahunan` (
`infratype` varchar(255)
,`prog` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtotalprojecttahunan`
-- (See below for the actual view)
--
CREATE TABLE `vtotalprojecttahunan` (
`infratype` varchar(255)
,`ordernya` bigint(21)
,`tahun` int(4)
);

-- --------------------------------------------------------

--
-- Structure for view `downloadexcel`
--
DROP TABLE IF EXISTS `downloadexcel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `downloadexcel`  AS  select `project`.`id` AS `id`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`no_doc` AS `no_doc`,`project`.`projectid` AS `projectid`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,(case when (`project`.`infratype` = 'UNTAPPED') then convert(concat('GM ',`project_implementation`.`towerimplementation`,' M') using latin1) else concat(`project`.`kode_tower_depan`,' ',`project_implementation`.`towerimplementation`,' ',`project`.`kode_tower_belakang`) end) AS `tinggitower`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`imb_jasa` AS `imb_jasa`,`project`.`qty_lahan` AS `qty_lahan`,`project`.`lahan` AS `lahan`,`project`.`biayatower` AS `biayatower`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project_implementation`.`id` AS `projectimplementationid`,`project_implementation`.`towerimplementation` AS `towerimplementation`,`project_implementation`.`clusterimplementation` AS `clusterimplementation`,`project_implementation`.`mitra` AS `mitraimplementation`,(case when (`project`.`infratype` = 'UNTAPPED') then ifnull(`project`.`biayatower`,0) else ifnull((select (`project_implementation_standard`.`tonase` * `project_implementation_standard`.`biayatower`) AS `hasil` from `project_implementation_standard` where (`project_implementation_standard`.`project_implementation_id` = `projectimplementationid`)),0) end) AS `biayatowercetak`,(case when (`project`.`infratype` = 'UNTAPPED') then ifnull(`project`.`cme`,0) else ifnull((select (((((`project_implementation_standard`.`erection_tower` + `project_implementation_standard`.`transportasi`) + (`project_implementation_standard`.`pondasi` * `project_implementation_standard`.`pondasi_greenfiled`)) + `project_implementation_standard`.`bts_outdoor`) + `project_implementation_standard`.`me`) + `project_implementation_standard`.`fy`) AS `hasil` from `project_implementation_standard` where (`project_implementation_standard`.`project_implementation_id` = `projectimplementationid`)),0) end) AS `cmecetak`,(case when (`project`.`infratype` = 'UNTAPPED') then ifnull(`project`.`pln`,0) else ifnull((select `project_implementation_standard`.`pln_connect` from `project_implementation_standard` where (`project_implementation_standard`.`project_implementation_id` = `projectimplementationid`)),0) end) AS `plncetak`,(case when (`project`.`infratype` = 'UNTAPPED') then ifnull(((`project`.`addpln` + `project`.`addcme`) + `project`.`addtransport`),0) else ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0) end) AS `biayaadditional`,((((((((((((ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `projectimplementationid`)),0) + ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0)) + ifnull(`project`.`sis`,0)) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) AS `capex`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from (`project` join `project_implementation` on((`project`.`id` = `project_implementation`.`project_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `varea`
--
DROP TABLE IF EXISTS `varea`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `varea`  AS  select distinct `project`.`area` AS `area` from `project` ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojecareatutp`
--
DROP TABLE IF EXISTS `vavgprojecareatutp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojecareatutp`  AS  select `vprojectimplementation`.`area` AS `area`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capexuntapped`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun`,count(0) AS `jumlah` from `vprojectimplementation` where (`vprojectimplementation`.`infratype` = 'UNTAPPED') group by `vprojectimplementation`.`area`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojecnstutp`
--
DROP TABLE IF EXISTS `vavgprojecnstutp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojecnstutp`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capexuntapped`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun`,count(0) AS `jumlah` from `vprojectimplementation` where (`vprojectimplementation`.`infratype` = 'UNTAPPED') group by `vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojecregionaltutp`
--
DROP TABLE IF EXISTS `vavgprojecregionaltutp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojecregionaltutp`  AS  select `vprojectimplementation`.`regional` AS `regional`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capexuntapped`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun`,count(0) AS `jumlah` from `vprojectimplementation` where (`vprojectimplementation`.`infratype` = 'UNTAPPED') group by `vprojectimplementation`.`regional`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojectareab2s`
--
DROP TABLE IF EXISTS `vavgprojectareab2s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojectareab2s`  AS  select `vprojectimplementation`.`area` AS `area`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capexb2s`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun`,count(0) AS `jumlah` from `vprojectimplementation` where (`vprojectimplementation`.`infratype` = 'B2S') group by `vprojectimplementation`.`area`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojectnsb2s`
--
DROP TABLE IF EXISTS `vavgprojectnsb2s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojectnsb2s`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capexb2s`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun`,count(0) AS `jumlah` from `vprojectimplementation` where (`vprojectimplementation`.`infratype` = 'B2S') group by `vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojectregionalb2s`
--
DROP TABLE IF EXISTS `vavgprojectregionalb2s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojectregionalb2s`  AS  select `vprojectimplementation`.`regional` AS `regional`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capexb2s`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun`,count(0) AS `jumlah` from `vprojectimplementation` where (`vprojectimplementation`.`infratype` = 'B2S') group by `vprojectimplementation`.`regional`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vdistinsstandartimplementationcluster`
--
DROP TABLE IF EXISTS `vdistinsstandartimplementationcluster`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vdistinsstandartimplementationcluster`  AS  select distinct `vstandartimplementation`.`regional` AS `regional`,`vstandartimplementation`.`cluster` AS `cluster` from `vstandartimplementation` ;

-- --------------------------------------------------------

--
-- Structure for view `vdistinsstandartimplementationtower`
--
DROP TABLE IF EXISTS `vdistinsstandartimplementationtower`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vdistinsstandartimplementationtower`  AS  select distinct `vstandartimplementation`.`regional` AS `regional`,`vstandartimplementation`.`tower` AS `tower` from `vstandartimplementation` ;

-- --------------------------------------------------------

--
-- Structure for view `vgrafik`
--
DROP TABLE IF EXISTS `vgrafik`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgrafik`  AS  select date_format(`project`.`created_at`,'%Y') AS `tahun`,date_format(`project`.`created_at`,'%M') AS `bulan`,count(0) AS `jumlah`,`project`.`status` AS `status` from `project` group by year(`project`.`created_at`),month(`project`.`created_at`),`project`.`status` ;

-- --------------------------------------------------------

--
-- Structure for view `vinfra`
--
DROP TABLE IF EXISTS `vinfra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vinfra`  AS  select distinct `project`.`infratype` AS `infratype` from `project` ;

-- --------------------------------------------------------

--
-- Structure for view `vnodoc`
--
DROP TABLE IF EXISTS `vnodoc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnodoc`  AS  select count(0) AS `nodoc` from `project` where (`project`.`no_doc` is not null) ;

-- --------------------------------------------------------

--
-- Structure for view `vnotificationsuser`
--
DROP TABLE IF EXISTS `vnotificationsuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnotificationsuser`  AS  select `notification`.`id` AS `notificationid`,`notification`.`users_id` AS `users_id`,`notification`.`status` AS `notificationstatus`,`project`.`id` AS `projectid`,`notification`.`message` AS `pesannya`,`notification`.`created_at` AS `created_at` from (`notification` join `project` on((`notification`.`project_id` = `project`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_area`
--
DROP TABLE IF EXISTS `vplafon_capex_area`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_area`  AS  select `vprojectimplementation`.`area` AS `area`,`vprojectimplementation`.`infratype` AS `infratype`,ifnull(sum(`vprojectimplementation`.`budget`),0) AS `budgetNya`,(case when (`vprojectimplementation`.`infratype` = 'B2S') then ifnull(sum(`vprojectimplementation`.`capexb2s`),0) else ifnull(sum(`vprojectimplementation`.`capexuntapped`),0) end) AS `capexNya`,count(`vprojectimplementation`.`area`) AS `total` from `vprojectimplementation` group by `vprojectimplementation`.`area`,`vprojectimplementation`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_nasional`
--
DROP TABLE IF EXISTS `vplafon_capex_nasional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_nasional`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,ifnull(sum(`vprojectimplementation`.`budget`),0) AS `budgetNya`,(case when (`vprojectimplementation`.`infratype` = 'B2S') then ifnull(sum(`vprojectimplementation`.`capexb2s`),0) else ifnull(sum(`vprojectimplementation`.`capexuntapped`),0) end) AS `capexNya`,count(`vprojectimplementation`.`budget`) AS `total` from `vprojectimplementation` group by `vprojectimplementation`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_nasional_home`
--
DROP TABLE IF EXISTS `vplafon_capex_nasional_home`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_nasional_home`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,ifnull(avg(`vprojectimplementation`.`budget`),0) AS `budgetNya`,(case when (`vprojectimplementation`.`infratype` = 'B2S') then ifnull(avg(`vprojectimplementation`.`capexb2s`),0) else ifnull(avg(`vprojectimplementation`.`capexuntapped`),0) end) AS `capexNya` from `vprojectimplementation` group by `vprojectimplementation`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_regional`
--
DROP TABLE IF EXISTS `vplafon_capex_regional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_regional`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,`vprojectimplementation`.`regional` AS `regional`,ifnull(sum(`vprojectimplementation`.`budget`),0) AS `budgetNya`,(case when (`vprojectimplementation`.`infratype` = 'B2S') then ifnull(sum(`vprojectimplementation`.`capexb2s`),0) else ifnull(sum(`vprojectimplementation`.`capexuntapped`),0) end) AS `capexNya`,count(`vprojectimplementation`.`regional`) AS `total` from `vprojectimplementation` group by `vprojectimplementation`.`infratype`,`vprojectimplementation`.`regional` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectall`
--
DROP TABLE IF EXISTS `vprojectall`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectall`  AS  select `project`.`id` AS `id`,`project`.`projectid` AS `projectid`,`project`.`no_doc` AS `no_doc`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,(case when (`project`.`infratype` = 'UNTAPPED') then convert(concat('GM ',`project`.`tower`,' M') using latin1) else concat(`project`.`kode_tower_depan`,' ',`project`.`tower`,' ',`project`.`kode_tower_belakang`) end) AS `tinggitower`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`imb_jasa` AS `imb_jasa`,`project`.`qty_lahan` AS `qty_lahan`,`project`.`lahan` AS `lahan`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`biayatower` AS `biayatower`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from `project` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementation`
--
DROP TABLE IF EXISTS `vprojectimplementation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementation`  AS  select `project`.`id` AS `id`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`no_doc` AS `no_doc`,`project`.`projectid` AS `projectid`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,(case when (`project`.`infratype` = 'UNTAPPED') then convert(concat('GM ',`project_implementation`.`towerimplementation`,' M') using latin1) else concat(`project`.`kode_tower_depan`,' ',`project_implementation`.`towerimplementation`,' ',`project`.`kode_tower_belakang`) end) AS `tinggitower`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`imb_jasa` AS `imb_jasa`,`project`.`qty_lahan` AS `qty_lahan`,`project`.`lahan` AS `lahan`,`project`.`biayatower` AS `biayatower`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project_implementation`.`id` AS `projectimplementationid`,`project_implementation`.`towerimplementation` AS `towerimplementation`,`project_implementation`.`clusterimplementation` AS `clusterimplementation`,`project_implementation`.`mitra` AS `mitraimplementation`,ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `projectimplementationid`)),0) AS `biayastandard`,ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0) AS `biayaadditional`,((((((((((((ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `projectimplementationid`)),0) + ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0)) + ifnull(`project`.`sis`,0)) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) AS `capex`,((((((((((ifnull(`project`.`sis`,0) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) AS `capexuntapped`,(case when ((`project`.`status` = 'NEW') and (`project`.`infratype` = 'B2S')) then `project`.`budget` else ((((((((((((ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `projectimplementationid`)),0) + ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0)) + ifnull(`project`.`sis`,0)) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) end) AS `capexb2s`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from (`project` left join `project_implementation` on((`project`.`id` = `project_implementation`.`project_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationadditional`
--
DROP TABLE IF EXISTS `vprojectimplementationadditional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationadditional`  AS  select `project_implementation_addtional`.`id` AS `id`,`project_implementation_addtional`.`project_implementation_id` AS `project_implementation_id`,`project_implementation_addtional`.`pekerjaan` AS `pekerjaan`,`project_implementation_addtional`.`satuan` AS `satuan`,`project_implementation_addtional`.`qty` AS `qty`,`project_implementation_addtional`.`harga` AS `harga`,(`project_implementation_addtional`.`qty` * `project_implementation_addtional`.`harga`) AS `total`,`project_implementation_addtional`.`created_at` AS `created_at` from `project_implementation_addtional` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationfinish`
--
DROP TABLE IF EXISTS `vprojectimplementationfinish`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationfinish`  AS  select `project`.`id` AS `id`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`no_doc` AS `no_doc`,`project`.`projectid` AS `projectid`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,(case when (`project`.`infratype` = 'UNTAPPED') then convert(concat('GM ',`project_implementation`.`towerimplementation`,' M') using latin1) else concat(`project`.`kode_tower_depan`,' ',`project_implementation`.`towerimplementation`,' ',`project`.`kode_tower_belakang`) end) AS `tinggitower`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`imb_jasa` AS `imb_jasa`,`project`.`qty_lahan` AS `qty_lahan`,`project`.`lahan` AS `lahan`,`project`.`biayatower` AS `biayatower`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project_implementation`.`id` AS `projectimplementationid`,`project_implementation`.`towerimplementation` AS `towerimplementation`,`project_implementation`.`clusterimplementation` AS `clusterimplementation`,`project_implementation`.`mitra` AS `mitraimplementation`,ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `projectimplementationid`)),0) AS `biayastandard`,ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0) AS `biayaadditional`,((((((((((((ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `projectimplementationid`)),0) + ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `projectimplementationid`)),0)) + ifnull(`project`.`sis`,0)) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) AS `capex`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from (`project` join `project_implementation` on((`project`.`id` = `project_implementation`.`project_id`))) where (`project`.`status` = 'FINISH') ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationnew`
--
DROP TABLE IF EXISTS `vprojectimplementationnew`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationnew`  AS  select `project`.`id` AS `id`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`no_doc` AS `no_doc`,`project`.`projectid` AS `projectid`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`imb_jasa` AS `imb_jasa`,`project`.`qty_lahan` AS `qty_lahan`,`project`.`lahan` AS `lahan`,`project`.`biayatower` AS `biayatower`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project`.`regional` AS `regionalnya`,`project`.`cluster` AS `clusternya`,`project`.`tower` AS `towernya`,(case when (`project`.`infratype` = 'UNTAPPED') then ((((((((((ifnull(`project`.`sis`,0) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) else (((((((((((ifnull((select `vprojectimplementationstandardnew`.`total` from `vprojectimplementationstandardnew` where ((`vprojectimplementationstandardnew`.`regional` = `regionalnya`) and (`vprojectimplementationstandardnew`.`cluster` = `clusternya`) and (`vprojectimplementationstandardnew`.`tower` = `towernya`))),0) + ifnull(`project`.`sis`,0)) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`imb_jasa`,0)) + ifnull((`project`.`qty_lahan` * `project`.`lahan`),0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) end) AS `capex`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from `project` where (`project`.`status` = 'NEW') ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationstandard`
--
DROP TABLE IF EXISTS `vprojectimplementationstandard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationstandard`  AS  select `project_implementation_standard`.`id` AS `id`,`project_implementation_standard`.`project_implementation_id` AS `project_implementation_id`,`project_implementation_standard`.`tonase` AS `tonase`,`project_implementation_standard`.`pondasi` AS `pondasi`,`project_implementation_standard`.`biayatower` AS `biayatower`,`project_implementation_standard`.`erection_tower` AS `erection_tower`,`project_implementation_standard`.`transportasi` AS `transportasi`,`project_implementation_standard`.`pondasi_greenfiled` AS `pondasi_greenfiled`,`project_implementation_standard`.`bts_outdoor` AS `bts_outdoor`,`project_implementation_standard`.`me` AS `me`,`project_implementation_standard`.`fy` AS `fy`,`project_implementation_standard`.`pln_connect` AS `pln_connect`,((((((((`project_implementation_standard`.`tonase` * `project_implementation_standard`.`biayatower`) + (`project_implementation_standard`.`pondasi_greenfiled` * `project_implementation_standard`.`pondasi`)) + `project_implementation_standard`.`erection_tower`) + `project_implementation_standard`.`transportasi`) + `project_implementation_standard`.`bts_outdoor`) + `project_implementation_standard`.`me`) + `project_implementation_standard`.`fy`) + `project_implementation_standard`.`pln_connect`) AS `total`,`project_implementation_standard`.`created_at` AS `created_at` from `project_implementation_standard` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationstandardnew`
--
DROP TABLE IF EXISTS `vprojectimplementationstandardnew`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationstandardnew`  AS  select `standartimplementation`.`id` AS `id`,`standartimplementation`.`regional` AS `regional`,`standartimplementation`.`cluster` AS `cluster`,`standartimplementation`.`tower` AS `tower`,`standartimplementation`.`tonase` AS `tonase`,`standartimplementation`.`pondasi` AS `pondasi`,`standartimplementation`.`biayatower` AS `biayatower`,`standartimplementation`.`erection_tower` AS `erection_tower`,`standartimplementation`.`transportasi` AS `transportasi`,`standartimplementation`.`pondasi_greenfiled` AS `pondasi_greenfiled`,`standartimplementation`.`bts_outdoor` AS `bts_outdoor`,`standartimplementation`.`me` AS `me`,`standartimplementation`.`fy` AS `fy`,`standartimplementation`.`pln_connect` AS `pln_connect`,((((((((`standartimplementation`.`tonase` * `standartimplementation`.`biayatower`) + (`standartimplementation`.`pondasi_greenfiled` * `standartimplementation`.`pondasi`)) + `standartimplementation`.`erection_tower`) + `standartimplementation`.`transportasi`) + `standartimplementation`.`bts_outdoor`) + `standartimplementation`.`me`) + `standartimplementation`.`fy`) + `standartimplementation`.`pln_connect`) AS `total`,`standartimplementation`.`created_at` AS `created_at` from `standartimplementation` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectpo`
--
DROP TABLE IF EXISTS `vprojectpo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectpo`  AS  select `project`.`id` AS `id`,`nomor_pr_po`.`po` AS `po`,`project`.`projectid` AS `projectid`,`project`.`infratype` AS `infratype`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`nomor_pr_po`.`created_at` AS `created_at`,`nomor_pr_po`.`updated_at` AS `updated_at` from (`nomor_pr_po` join `project` on((`nomor_pr_po`.`project_id` = `project`.`id`))) group by `project`.`id` having (`nomor_pr_po`.`po` = '') ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectpr`
--
DROP TABLE IF EXISTS `vprojectpr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectpr`  AS  select `a`.`id` AS `id`,`a`.`proc` AS `proc`,`a`.`ubis` AS `ubis`,`a`.`no_doc` AS `no_doc`,`a`.`projectid` AS `projectid`,`a`.`sitename` AS `sitename`,`a`.`siteid` AS `siteid`,`a`.`area` AS `area`,`a`.`regional` AS `regional`,`a`.`cluster` AS `cluster`,`a`.`mitra` AS `mitra`,`a`.`kode_tower_depan` AS `kode_tower_depan`,`a`.`tower` AS `tower`,`a`.`kode_tower_belakang` AS `kode_tower_belakang`,`a`.`tinggitower` AS `tinggitower`,`a`.`budget` AS `budget`,`a`.`sis` AS `sis`,`a`.`sitac` AS `sitac`,`a`.`imb` AS `imb`,`a`.`imb_jasa` AS `imb_jasa`,`a`.`qty_lahan` AS `qty_lahan`,`a`.`lahan` AS `lahan`,`a`.`biayatower` AS `biayatower`,`a`.`cme` AS `cme`,`a`.`pln` AS `pln`,`a`.`addtransport` AS `addtransport`,`a`.`addpln` AS `addpln`,`a`.`addcme` AS `addcme`,`a`.`longitude` AS `longitude`,`a`.`latituted` AS `latituted`,`a`.`infratype` AS `infratype`,`a`.`towerprovider` AS `towerprovider`,`a`.`provinsi` AS `provinsi`,`a`.`kabupaten` AS `kabupaten`,`a`.`status_id` AS `status_id`,`a`.`filename` AS `filename`,`a`.`status` AS `status`,`a`.`projectimplementationid` AS `projectimplementationid`,`a`.`towerimplementation` AS `towerimplementation`,`a`.`clusterimplementation` AS `clusterimplementation`,`a`.`mitraimplementation` AS `mitraimplementation`,`a`.`biayastandard` AS `biayastandard`,`a`.`biayaadditional` AS `biayaadditional`,`a`.`capex` AS `capex`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at` from (`vprojectimplementation` `a` left join `nomor_pr_po` `b` on((`a`.`id` = `b`.`project_id`))) where ((`a`.`status` = 'FINISH') and isnull(`b`.`project_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectstatus`
--
DROP TABLE IF EXISTS `vprojectstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectstatus`  AS  select `project_status`.`project_id` AS `project_id`,`project_status`.`status` AS `status`,`users`.`name` AS `name`,`users`.`id` AS `id`,`users`.`email` AS `email`,`users`.`level` AS `level`,`project_status`.`created_at` AS `created_at` from (`project_status` join `users` on((`project_status`.`user_id` = `users`.`id`))) where `project_status`.`id` in (select max(`project_status`.`id`) from (`project_status` join `users` on((`project_status`.`user_id` = `users`.`id`))) group by `project_status`.`project_id`,`project_status`.`user_id`,`project_status`.`status`) ;

-- --------------------------------------------------------

--
-- Structure for view `vregional`
--
DROP TABLE IF EXISTS `vregional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vregional`  AS  select distinct `project`.`regional` AS `regional` from `project` ;

-- --------------------------------------------------------

--
-- Structure for view `vscheduller`
--
DROP TABLE IF EXISTS `vscheduller`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscheduller`  AS  select `project`.`id` AS `id`,`project`.`projectid` AS `projectid`,`project`.`area` AS `area`,`project`.`status` AS `status`,`project`.`updated_at` AS `updated_at`,(to_days(now()) - to_days(`project`.`updated_at`)) AS `jmlhari` from `project` where (`project`.`status` not in ('NEW','FINISH','CANCEL')) ;

-- --------------------------------------------------------

--
-- Structure for view `vstandartimplementation`
--
DROP TABLE IF EXISTS `vstandartimplementation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vstandartimplementation`  AS  select `standartimplementation`.`id` AS `id`,`standartimplementation`.`regional` AS `regional`,`standartimplementation`.`cluster` AS `cluster`,`standartimplementation`.`tower` AS `tower`,`standartimplementation`.`tonase` AS `tonase`,`standartimplementation`.`pondasi` AS `pondasi`,`standartimplementation`.`biayatower` AS `biayatower`,`standartimplementation`.`erection_tower` AS `erection_tower`,`standartimplementation`.`transportasi` AS `transportasi`,`standartimplementation`.`pondasi_greenfiled` AS `pondasi_greenfiled`,`standartimplementation`.`bts_outdoor` AS `bts_outdoor`,`standartimplementation`.`me` AS `me`,`standartimplementation`.`fy` AS `fy`,`standartimplementation`.`pln_connect` AS `pln_connect`,`standartimplementation`.`created_at` AS `created_at` from `standartimplementation` ;

-- --------------------------------------------------------

--
-- Structure for view `vtahun`
--
DROP TABLE IF EXISTS `vtahun`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtahun`  AS  select `project`.`infratype` AS `infratype`,year(`project`.`created_at`) AS `tahun` from `project` group by `project`.`infratype`,year(`project`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalproject`
--
DROP TABLE IF EXISTS `vtotalproject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalproject`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`infratype`) AS `ordernya` from `project` group by `project`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectcancel`
--
DROP TABLE IF EXISTS `vtotalprojectcancel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectcancel`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`status`) AS `canc` from `project` where (`project`.`status` = 'CANCEL') group by `project`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectcanceltahunan`
--
DROP TABLE IF EXISTS `vtotalprojectcanceltahunan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectcanceltahunan`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`status`) AS `canc` from `project` where (`project`.`status` = 'CANCEL') group by `project`.`infratype`,year(`project`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectfinish`
--
DROP TABLE IF EXISTS `vtotalprojectfinish`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectfinish`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`status`) AS `fin` from `project` where (`project`.`status` = 'FINISH') group by `project`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectfinishtahunan`
--
DROP TABLE IF EXISTS `vtotalprojectfinishtahunan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectfinishtahunan`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`status`) AS `fin` from `project` where (`project`.`status` = 'FINISH') group by `project`.`infratype`,year(`project`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectnya`
--
DROP TABLE IF EXISTS `vtotalprojectnya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectnya`  AS  select `vtotalproject`.`infratype` AS `infratype`,ifnull(`vtotalproject`.`ordernya`,0) AS `ordernya`,ifnull(`vtotalprojectfinish`.`fin`,0) AS `fin`,ifnull(`vtotalprojectproses`.`prog`,0) AS `prog`,ifnull(`vtotalprojectcancel`.`canc`,0) AS `canc` from (((`vtotalproject` left join `vtotalprojectfinish` on((`vtotalproject`.`infratype` = `vtotalprojectfinish`.`infratype`))) left join `vtotalprojectproses` on((`vtotalprojectproses`.`infratype` = `vtotalproject`.`infratype`))) left join `vtotalprojectcancel` on((`vtotalprojectcancel`.`infratype` = `vtotalproject`.`infratype`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectnyatahunan`
--
DROP TABLE IF EXISTS `vtotalprojectnyatahunan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectnyatahunan`  AS  select `vtotalprojecttahunan`.`infratype` AS `infratype`,`vtotalprojecttahunan`.`tahun` AS `tahun`,ifnull(`vtotalprojecttahunan`.`ordernya`,0) AS `ordernya`,ifnull(`vtotalprojectfinishtahunan`.`fin`,0) AS `fin`,ifnull(`vtotalprojectprosestahunan`.`prog`,0) AS `prog`,ifnull(`vtotalprojectcanceltahunan`.`canc`,0) AS `canc` from (((`vtotalprojecttahunan` left join `vtotalprojectfinishtahunan` on((`vtotalprojecttahunan`.`infratype` = `vtotalprojectfinishtahunan`.`infratype`))) left join `vtotalprojectprosestahunan` on((`vtotalprojectprosestahunan`.`infratype` = `vtotalprojecttahunan`.`infratype`))) left join `vtotalprojectcanceltahunan` on((`vtotalprojectcanceltahunan`.`infratype` = `vtotalprojecttahunan`.`infratype`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectproses`
--
DROP TABLE IF EXISTS `vtotalprojectproses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectproses`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`status`) AS `prog` from `project` where (`project`.`status` not in ('NEW','CANCEL','FINISH')) group by `project`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojectprosestahunan`
--
DROP TABLE IF EXISTS `vtotalprojectprosestahunan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojectprosestahunan`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`status`) AS `prog` from `project` where (`project`.`status` not in ('NEW','CANCEL','FINISH')) group by `project`.`infratype`,year(`project`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vtotalprojecttahunan`
--
DROP TABLE IF EXISTS `vtotalprojecttahunan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotalprojecttahunan`  AS  select `project`.`infratype` AS `infratype`,count(`project`.`infratype`) AS `ordernya`,year(`project`.`created_at`) AS `tahun` from `project` group by `project`.`infratype`,year(`project`.`created_at`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cronjob`
--
ALTER TABLE `cronjob`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomor_pr_po`
--
ALTER TABLE `nomor_pr_po`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_implementation`
--
ALTER TABLE `project_implementation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_implementation_addtional`
--
ALTER TABLE `project_implementation_addtional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_implementation_standard`
--
ALTER TABLE `project_implementation_standard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standartimplementation`
--
ALTER TABLE `standartimplementation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cronjob`
--
ALTER TABLE `cronjob`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `nomor_pr_po`
--
ALTER TABLE `nomor_pr_po`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;
--
-- AUTO_INCREMENT for table `project_implementation`
--
ALTER TABLE `project_implementation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;
--
-- AUTO_INCREMENT for table `project_implementation_addtional`
--
ALTER TABLE `project_implementation_addtional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `project_implementation_standard`
--
ALTER TABLE `project_implementation_standard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `standartimplementation`
--
ALTER TABLE `standartimplementation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
