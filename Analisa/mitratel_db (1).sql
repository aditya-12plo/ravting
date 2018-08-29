-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2018 at 11:09 AM
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
(12, 'nugrohoaditya10@gmail.com', 'users', 'insert', '{\"name\":\"TEST123\",\"email\":\"test@test.com\",\"password\":\"$2y$10$HolbWD2bTy4RwJ\\/qIl66Ae7B5NdWmujVXCOxZcTI7GWSzNohAHEZm\",\"password_api\":\"e10adc3949ba59abbe56e057f20f883e\",\"level\":\"MANAGER UBIS\",\"area\":\"\"}', '2018-03-23 04:40:37', '2018-03-23 04:40:37');

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
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `project_id`, `users_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 258, 28, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 09:25:26', '2018-03-26 09:25:26'),
(2, 214, 28, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 10:50:04', '2018-03-26 10:50:04'),
(3, 170, 28, 'Project 18TS02B0515 Menunggu Approval', 0, '2018-03-26 11:19:37', '2018-03-26 11:19:37'),
(4, 255, 28, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 11:20:40', '2018-03-26 11:20:40'),
(5, 205, 28, 'Project 18TS02B0480 Menunggu Approval', 0, '2018-03-26 11:21:13', '2018-03-26 11:21:13'),
(6, 253, 28, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 11:22:04', '2018-03-26 11:22:04'),
(7, 261, 28, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 11:26:17', '2018-03-26 11:26:17'),
(8, 255, 29, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 11:33:04', '2018-03-26 11:33:04'),
(9, 255, 35, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 11:33:05', '2018-03-26 11:33:05'),
(10, 210, 28, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 11:33:53', '2018-03-26 11:33:53'),
(11, 171, 28, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 11:34:16', '2018-03-26 11:34:16'),
(12, 260, 28, 'Project 18TS02B0548 Menunggu Approval', 0, '2018-03-26 11:37:28', '2018-03-26 11:37:28'),
(13, 257, 28, 'Project 18TS02B0551 Menunggu Approval', 0, '2018-03-26 11:38:43', '2018-03-26 11:38:43'),
(14, 207, 28, 'Project 18TS02B0478 Menunggu Approval', 0, '2018-03-26 11:39:19', '2018-03-26 11:39:19'),
(15, 171, 29, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 11:40:03', '2018-03-26 11:40:03'),
(16, 171, 35, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 11:40:03', '2018-03-26 11:40:03'),
(17, 253, 29, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 11:45:06', '2018-03-26 11:45:06'),
(18, 253, 35, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 11:45:06', '2018-03-26 11:45:06'),
(19, 256, 28, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 11:46:41', '2018-03-26 11:46:41'),
(20, 264, 28, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 11:47:53', '2018-03-26 11:47:53'),
(21, 170, 29, 'Project 18TS02B0515 Menunggu Approval', 0, '2018-03-26 11:48:15', '2018-03-26 11:48:15'),
(22, 170, 35, 'Project 18TS02B0515 Menunggu Approval', 0, '2018-03-26 11:48:15', '2018-03-26 11:48:15'),
(23, 258, 29, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 11:48:37', '2018-03-26 11:48:37'),
(24, 258, 35, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 11:48:37', '2018-03-26 11:48:37'),
(25, 261, 29, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 11:49:21', '2018-03-26 11:49:21'),
(26, 261, 35, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 11:49:21', '2018-03-26 11:49:21'),
(27, 256, 29, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 11:57:01', '2018-03-26 11:57:01'),
(28, 256, 35, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 11:57:01', '2018-03-26 11:57:01'),
(29, 264, 29, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 11:57:11', '2018-03-26 11:57:11'),
(30, 264, 35, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 11:57:11', '2018-03-26 11:57:11'),
(31, 210, 29, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 11:57:22', '2018-03-26 11:57:22'),
(32, 210, 35, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 11:57:23', '2018-03-26 11:57:23'),
(33, 214, 29, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 11:57:33', '2018-03-26 11:57:33'),
(34, 214, 35, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 11:57:33', '2018-03-26 11:57:33'),
(35, 260, 29, 'Project 18TS02B0548 Menunggu Approval', 0, '2018-03-26 11:57:54', '2018-03-26 11:57:54'),
(36, 260, 35, 'Project 18TS02B0548 Menunggu Approval', 0, '2018-03-26 11:57:54', '2018-03-26 11:57:54'),
(37, 203, 28, 'Project 18TS02B0482 Menunggu Approval', 0, '2018-03-26 11:59:20', '2018-03-26 11:59:20'),
(38, 259, 28, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 12:00:28', '2018-03-26 12:00:28'),
(39, 201, 28, 'Project 18TS02B0484 Menunggu Approval', 0, '2018-03-26 12:00:50', '2018-03-26 12:00:50'),
(40, 171, 30, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 12:01:41', '2018-03-26 12:01:41'),
(41, 214, 30, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:01:52', '2018-03-26 12:01:52'),
(42, 170, 30, 'Project 18TS02B0515 Menunggu Approval', 0, '2018-03-26 12:02:59', '2018-03-26 12:02:59'),
(43, 210, 30, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 12:03:16', '2018-03-26 12:03:16'),
(44, 253, 30, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:03:32', '2018-03-26 12:03:32'),
(45, 264, 30, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 12:03:45', '2018-03-26 12:03:45'),
(46, 256, 30, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 12:03:54', '2018-03-26 12:03:54'),
(47, 258, 30, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 12:04:07', '2018-03-26 12:04:07'),
(48, 255, 30, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:04:18', '2018-03-26 12:04:18'),
(49, 263, 28, 'Project 18TS02B0545 Menunggu Approval', 0, '2018-03-26 12:05:27', '2018-03-26 12:05:27'),
(50, 214, 31, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:06:44', '2018-03-26 12:06:44'),
(51, 253, 31, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:07:29', '2018-03-26 12:07:29'),
(52, 256, 29, 'Project 18TS02B0552 Menunggu Perbaikan', 0, '2018-03-26 12:08:05', '2018-03-26 12:08:05'),
(53, 256, 35, 'Project 18TS02B0552 Menunggu Perbaikan', 0, '2018-03-26 12:08:05', '2018-03-26 12:08:05'),
(54, 210, 31, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 12:08:20', '2018-03-26 12:08:20'),
(55, 255, 31, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:08:47', '2018-03-26 12:08:47'),
(56, 199, 28, 'Project 18TS02B0486 Menunggu Approval', 0, '2018-03-26 12:09:46', '2018-03-26 12:09:46'),
(57, 216, 28, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:10:40', '2018-03-26 12:10:40'),
(58, 201, 27, 'Project 18TS02B0484 Menunggu Perbaikan', 0, '2018-03-26 12:13:13', '2018-03-26 12:13:13'),
(59, 215, 28, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-26 12:19:42', '2018-03-26 12:19:42'),
(60, 257, 29, 'Project 18TS02B0551 Menunggu Approval', 0, '2018-03-26 12:20:38', '2018-03-26 12:20:38'),
(61, 257, 35, 'Project 18TS02B0551 Menunggu Approval', 0, '2018-03-26 12:20:38', '2018-03-26 12:20:38'),
(62, 215, 29, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-26 12:20:50', '2018-03-26 12:20:50'),
(63, 215, 35, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-26 12:20:50', '2018-03-26 12:20:50'),
(64, 256, 30, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 12:21:04', '2018-03-26 12:21:04'),
(65, 260, 30, 'Project 18TS02B0548 Menunggu Approval', 0, '2018-03-26 12:21:33', '2018-03-26 12:21:33'),
(66, 205, 29, 'Project 18TS02B0480 Menunggu Approval', 0, '2018-03-26 12:21:56', '2018-03-26 12:21:56'),
(67, 205, 35, 'Project 18TS02B0480 Menunggu Approval', 0, '2018-03-26 12:21:56', '2018-03-26 12:21:56'),
(68, 207, 29, 'Project 18TS02B0478 Menunggu Approval', 0, '2018-03-26 12:22:09', '2018-03-26 12:22:09'),
(69, 207, 35, 'Project 18TS02B0478 Menunggu Approval', 0, '2018-03-26 12:22:09', '2018-03-26 12:22:09'),
(70, 216, 29, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:22:26', '2018-03-26 12:22:26'),
(71, 216, 35, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:22:26', '2018-03-26 12:22:26'),
(72, 259, 29, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 12:22:37', '2018-03-26 12:22:37'),
(73, 259, 35, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 12:22:37', '2018-03-26 12:22:37'),
(74, 216, 30, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:22:53', '2018-03-26 12:22:53'),
(75, 261, 30, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 12:23:05', '2018-03-26 12:23:05'),
(76, 216, 31, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:24:34', '2018-03-26 12:24:34'),
(77, 256, 31, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 12:24:59', '2018-03-26 12:24:59'),
(78, 170, 29, 'Project 18TS02B0515 Menunggu Perbaikan', 0, '2018-03-26 12:25:29', '2018-03-26 12:25:29'),
(79, 170, 35, 'Project 18TS02B0515 Menunggu Perbaikan', 0, '2018-03-26 12:25:29', '2018-03-26 12:25:29'),
(80, 170, 28, 'Project 18TS02B0515 Menunggu Perbaikan', 0, '2018-03-26 12:26:09', '2018-03-26 12:26:09'),
(81, 171, 31, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 12:26:24', '2018-03-26 12:26:24'),
(82, 260, 31, 'Project 18TS02B0548 Menunggu Approval', 0, '2018-03-26 12:26:43', '2018-03-26 12:26:43'),
(83, 261, 31, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 12:27:02', '2018-03-26 12:27:02'),
(84, 210, 1, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 12:28:04', '2018-03-26 12:28:04'),
(85, 210, 33, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 12:28:04', '2018-03-26 12:28:04'),
(86, 214, 1, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:28:39', '2018-03-26 12:28:39'),
(87, 214, 33, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:28:39', '2018-03-26 12:28:39'),
(88, 253, 1, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:29:04', '2018-03-26 12:29:04'),
(89, 253, 33, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:29:04', '2018-03-26 12:29:04'),
(90, 216, 1, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:29:16', '2018-03-26 12:29:16'),
(91, 216, 33, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:29:16', '2018-03-26 12:29:16'),
(92, 261, 1, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 12:29:51', '2018-03-26 12:29:51'),
(93, 261, 33, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 12:29:51', '2018-03-26 12:29:51'),
(94, 255, 1, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:30:02', '2018-03-26 12:30:02'),
(95, 255, 33, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:30:02', '2018-03-26 12:30:02'),
(96, 256, 1, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 12:30:22', '2018-03-26 12:30:22'),
(97, 256, 33, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 12:30:22', '2018-03-26 12:30:22'),
(98, 258, 31, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 12:30:49', '2018-03-26 12:30:49'),
(99, 264, 31, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 12:31:02', '2018-03-26 12:31:02'),
(100, 171, 1, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 12:31:25', '2018-03-26 12:31:25'),
(101, 171, 33, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 12:31:25', '2018-03-26 12:31:25'),
(102, 260, 30, 'Project 18TS02B0548 Menunggu Perbaikan', 0, '2018-03-26 12:31:51', '2018-03-26 12:31:51'),
(103, 260, 29, 'Project 18TS02B0548 Menunggu Perbaikan', 0, '2018-03-26 12:32:18', '2018-03-26 12:32:18'),
(104, 260, 35, 'Project 18TS02B0548 Menunggu Perbaikan', 0, '2018-03-26 12:32:18', '2018-03-26 12:32:18'),
(105, 264, 1, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 12:32:44', '2018-03-26 12:32:44'),
(106, 264, 33, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 12:32:44', '2018-03-26 12:32:44'),
(107, 258, 32, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 12:33:05', '2018-03-26 12:33:05'),
(108, 171, 34, 'Project 18TS02B0514 Menunggu Approval', 0, '2018-03-26 12:34:31', '2018-03-26 12:34:31'),
(109, 214, 34, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:34:43', '2018-03-26 12:34:43'),
(110, 255, 34, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:34:55', '2018-03-26 12:34:55'),
(111, 216, 34, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:35:17', '2018-03-26 12:35:17'),
(112, 253, 34, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:35:29', '2018-03-26 12:35:29'),
(113, 214, 1, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(114, 214, 27, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(115, 214, 28, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(116, 214, 29, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(117, 214, 30, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(118, 214, 31, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(119, 214, 32, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(120, 214, 33, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(121, 214, 34, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(122, 214, 35, 'Project 18TS02B0518 Menunggu Approval', 0, '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(123, 216, 1, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(124, 216, 27, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(125, 216, 28, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(126, 216, 29, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(127, 216, 30, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(128, 216, 31, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(129, 216, 32, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(130, 216, 33, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(131, 216, 34, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(132, 216, 35, 'Project 18TS02B0516 Menunggu Approval', 0, '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(133, 253, 1, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(134, 253, 27, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(135, 253, 28, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(136, 253, 29, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(137, 253, 30, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(138, 253, 31, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(139, 253, 32, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(140, 253, 33, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(141, 253, 34, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(142, 253, 35, 'Project 18TS02B0555 Menunggu Approval', 0, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(143, 255, 1, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(144, 255, 27, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(145, 255, 28, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(146, 255, 29, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(147, 255, 30, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(148, 255, 31, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(149, 255, 32, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(150, 255, 33, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(151, 255, 34, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(152, 255, 35, 'Project 18TS02B0553 Menunggu Approval', 0, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(153, 171, 1, 'Project 18TS02B0514 Menunggu Perbaikan', 0, '2018-03-26 12:39:32', '2018-03-26 12:39:32'),
(154, 171, 33, 'Project 18TS02B0514 Menunggu Perbaikan', 0, '2018-03-26 12:39:32', '2018-03-26 12:39:32'),
(155, 256, 31, 'Project 18TS02B0552 Menunggu Perbaikan', 0, '2018-03-26 12:40:06', '2018-03-26 12:40:06'),
(156, 210, 34, 'Project 18TS02B0475 Menunggu Approval', 0, '2018-03-26 12:40:20', '2018-03-26 12:40:20'),
(157, 261, 34, 'Project 18TS02B0547 Menunggu Approval', 0, '2018-03-26 12:40:37', '2018-03-26 12:40:37'),
(158, 261, 1, 'Project 18TS02B0547 Menunggu Perbaikan', 0, '2018-03-26 12:41:03', '2018-03-26 12:41:03'),
(159, 261, 33, 'Project 18TS02B0547 Menunggu Perbaikan', 0, '2018-03-26 12:41:03', '2018-03-26 12:41:03'),
(160, 210, 1, 'Project 18TS02B0475 Menunggu Perbaikan', 0, '2018-03-26 12:44:32', '2018-03-26 12:44:32'),
(161, 210, 33, 'Project 18TS02B0475 Menunggu Perbaikan', 0, '2018-03-26 12:44:32', '2018-03-26 12:44:32'),
(162, 264, 34, 'Project 18TS02B0543 Menunggu Approval', 0, '2018-03-26 12:45:39', '2018-03-26 12:45:39'),
(163, 264, 1, 'Project 18TS02B0543 Menunggu Perbaikan', 0, '2018-03-26 12:47:04', '2018-03-26 12:47:04'),
(164, 264, 33, 'Project 18TS02B0543 Menunggu Perbaikan', 0, '2018-03-26 12:47:05', '2018-03-26 12:47:05'),
(165, 264, 28, 'Project 18TS02B0543 Menunggu Perbaikan', 0, '2018-03-26 12:47:46', '2018-03-26 12:47:46'),
(166, 196, 28, 'Project 18TS02B0489 Menunggu Approval', 0, '2018-03-26 12:50:39', '2018-03-26 12:50:39'),
(167, 195, 28, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 12:50:55', '2018-03-26 12:50:55'),
(168, 213, 28, 'Project 18TS02B0519 Menunggu Approval', 0, '2018-03-26 12:52:48', '2018-03-26 12:52:48'),
(169, 203, 29, 'Project 18TS02B0482 Menunggu Approval', 0, '2018-03-26 12:53:29', '2018-03-26 12:53:29'),
(170, 203, 35, 'Project 18TS02B0482 Menunggu Approval', 0, '2018-03-26 12:53:29', '2018-03-26 12:53:29'),
(171, 196, 29, 'Project 18TS02B0489 Menunggu Approval', 0, '2018-03-26 12:53:40', '2018-03-26 12:53:40'),
(172, 196, 35, 'Project 18TS02B0489 Menunggu Approval', 0, '2018-03-26 12:53:40', '2018-03-26 12:53:40'),
(173, 195, 29, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 12:54:14', '2018-03-26 12:54:14'),
(174, 195, 35, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 12:54:14', '2018-03-26 12:54:14'),
(175, 259, 30, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 12:54:59', '2018-03-26 12:54:59'),
(176, 195, 30, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 12:55:10', '2018-03-26 12:55:10'),
(177, 205, 30, 'Project 18TS02B0480 Menunggu Approval', 0, '2018-03-26 12:55:22', '2018-03-26 12:55:22'),
(178, 257, 30, 'Project 18TS02B0551 Menunggu Approval', 0, '2018-03-26 12:55:35', '2018-03-26 12:55:35'),
(179, 257, 31, 'Project 18TS02B0551 Menunggu Approval', 0, '2018-03-26 13:02:34', '2018-03-26 13:02:34'),
(180, 203, 30, 'Project 18TS02B0482 Menunggu Approval', 0, '2018-03-26 13:03:00', '2018-03-26 13:03:00'),
(181, 257, 32, 'Project 18TS02B0551 Menunggu Approval', 0, '2018-03-26 13:03:48', '2018-03-26 13:03:48'),
(182, 256, 1, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 13:04:23', '2018-03-26 13:04:23'),
(183, 256, 33, 'Project 18TS02B0552 Menunggu Approval', 0, '2018-03-26 13:04:23', '2018-03-26 13:04:23'),
(184, 205, 31, 'Project 18TS02B0480 Menunggu Approval', 0, '2018-03-26 13:04:33', '2018-03-26 13:04:33'),
(185, 203, 31, 'Project 18TS02B0482 Menunggu Approval', 0, '2018-03-26 13:04:47', '2018-03-26 13:04:47'),
(186, 257, 1, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(187, 257, 27, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(188, 257, 28, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(189, 257, 29, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(190, 257, 30, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(191, 257, 31, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(192, 257, 32, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(193, 257, 33, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(194, 257, 34, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(195, 257, 35, 'Project 18TS02B0551 Menunggu Perbaikan', 0, '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(196, 258, 1, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 13:06:48', '2018-03-26 13:06:48'),
(197, 258, 33, 'Project 18TS02B0550 Menunggu Approval', 0, '2018-03-26 13:06:48', '2018-03-26 13:06:48'),
(198, 195, 31, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:07:05', '2018-03-26 13:07:05'),
(199, 206, 28, 'Project 18TS02B0479 Menunggu Approval', 0, '2018-03-26 13:32:02', '2018-03-26 13:32:02'),
(200, 262, 28, 'Project 18TS02B0546 Menunggu Approval', 0, '2018-03-26 13:35:09', '2018-03-26 13:35:09'),
(201, 263, 27, 'Project 18TS02B0545 Menunggu Perbaikan', 0, '2018-03-26 13:37:36', '2018-03-26 13:37:36'),
(202, 213, 29, 'Project 18TS02B0519 Menunggu Approval', 0, '2018-03-26 13:37:59', '2018-03-26 13:37:59'),
(203, 213, 35, 'Project 18TS02B0519 Menunggu Approval', 0, '2018-03-26 13:37:59', '2018-03-26 13:37:59'),
(204, 215, 30, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-26 13:39:41', '2018-03-26 13:39:41'),
(205, 196, 28, 'Project 18TS02B0489 Menunggu Perbaikan', 0, '2018-03-26 13:40:23', '2018-03-26 13:40:23'),
(206, 259, 31, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 13:42:38', '2018-03-26 13:42:38'),
(207, 215, 31, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-26 13:43:05', '2018-03-26 13:43:05'),
(208, 207, 30, 'Project 18TS02B0478 Menunggu Approval', 0, '2018-03-26 13:43:45', '2018-03-26 13:43:45'),
(209, 207, 31, 'Project 18TS02B0478 Menunggu Approval', 0, '2018-03-26 13:44:01', '2018-03-26 13:44:01'),
(210, 259, 1, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 13:45:15', '2018-03-26 13:45:15'),
(211, 259, 33, 'Project 18TS02B0549 Menunggu Approval', 0, '2018-03-26 13:45:15', '2018-03-26 13:45:15'),
(212, 195, 32, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:46:19', '2018-03-26 13:46:19'),
(213, 203, 32, 'Project 18TS02B0482 Menunggu Approval', 0, '2018-03-26 13:50:46', '2018-03-26 13:50:46'),
(214, 205, 30, 'Project 18TS02B0480 Menunggu Perbaikan', 0, '2018-03-26 13:51:27', '2018-03-26 13:51:27'),
(215, 203, 1, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(216, 203, 27, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(217, 203, 28, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(218, 203, 29, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(219, 203, 30, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(220, 203, 31, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(221, 203, 32, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(222, 203, 33, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(223, 203, 34, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(224, 203, 35, 'Project 18TS02B0482 Menunggu Perbaikan', 0, '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(225, 195, 1, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:53:45', '2018-03-26 13:53:45'),
(226, 195, 33, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:53:45', '2018-03-26 13:53:45'),
(227, 195, 34, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:57:15', '2018-03-26 13:57:15'),
(228, 256, 31, 'Project 18TS02B0552 Menunggu Perbaikan', 0, '2018-03-26 13:57:54', '2018-03-26 13:57:54'),
(229, 195, 1, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(230, 195, 27, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(231, 195, 28, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(232, 195, 29, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(233, 195, 30, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(234, 195, 31, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(235, 195, 32, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(236, 195, 33, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(237, 195, 34, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(238, 195, 35, 'Project 18TS02B0490 Menunggu Approval', 0, '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(239, 211, 28, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:49:35', '2018-03-26 20:49:35'),
(240, 211, 29, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:52:56', '2018-03-26 20:52:56'),
(241, 211, 35, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:52:56', '2018-03-26 20:52:56'),
(242, 211, 30, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:55:19', '2018-03-26 20:55:19'),
(243, 211, 31, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:57:17', '2018-03-26 20:57:17'),
(244, 211, 1, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:58:37', '2018-03-26 20:58:37'),
(245, 211, 33, 'Project 18TS02B0474 Menunggu Approval', 0, '2018-03-26 20:58:37', '2018-03-26 20:58:37'),
(246, 172, 28, 'Project 18TS02B0513 Menunggu Approval', 0, '2018-03-27 02:25:47', '2018-03-27 02:25:47'),
(247, 176, 28, 'Project 18TS02B0509 Menunggu Approval', 0, '2018-03-27 03:11:28', '2018-03-27 03:11:28'),
(248, 215, 1, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-27 03:17:51', '2018-03-27 03:17:51'),
(249, 215, 33, 'Project 18TS02B0517 Menunggu Approval', 0, '2018-03-27 03:17:51', '2018-03-27 03:17:51');

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

INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(11, '18TS02B0652', NULL, 'OUTER', 'MACRO', 'SMKN 1 PARDOMUAN', 'SDK126', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.053604', '2.9078731', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DAIRI', 593000000, 5554500, 68909600, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(12, '18TS02B0424', NULL, 'OUTER', 'MACRO', 'BLANG BINTANG 2', 'MAK133', 'AREA 1', 'SUMBAGUT', 'ACEH', 'Akses Insani', 'SST', 42, 'NL', '96.304636', '4.063866', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'ACEH', 'KAB. ACEH BARAT', 593000000, 5680500, 63929700, 74502000, 100000000, 149963275.27820638, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(13, '18TS02B0425', NULL, 'OUTER', 'MACRO', 'MUGO CUT', 'MBO135', 'AREA 1', 'SUMBAGUT', 'ACEH', 'Akses Insani', 'SST', 42, 'NL', '96.195096', '4.420391', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'ACEH', 'KAB. ACEH BARAT', 593000000, 5680500, 63929700, 74502000, 100000000, 149963275.27820638, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(14, '18TS02B0426', NULL, 'OUTER', 'MACRO', 'DESA JAWI JAWI', 'RAP052', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '100.112861', '2.498789', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(15, '18TS02B0427', NULL, 'OUTER', 'MACRO', 'DESA TELUK RAMPAH', 'RAP048', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.9023', '1.78211', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(16, '18TS02B0428', NULL, 'OUTER', 'MACRO', 'PKS TELUK RAMPAH', 'RAP047', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.882556', '2.54289', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(17, '18TS02B0429', NULL, 'OUTER', 'MACRO', 'DESA TORGANDA', 'RAP046', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '100.262905', '1.626796', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(18, '18TS02B0430', NULL, 'OUTER', 'MACRO', 'PT. SERBA HUTA JAYA', 'RAP041', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.936151', '2.224964', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(19, '18TS02B0431', NULL, 'OUTER', 'MACRO', 'DESA TELUK BINJAI', 'RAP040', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Cipto Sarana', 'SST', 42, 'NL', '99.907413', '2.533092', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LABUHANBATU', 593000000, 5554500, 68909600, 90000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(20, '18TS02B0432', NULL, 'OUTER', 'MACRO', 'SILANTOM JAE (PADANG PARSADAAN)', 'TRT891', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.329747', '1.8868674', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 5554500, 68000000, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(21, '18TS02B0433', NULL, 'OUTER', 'MACRO', 'SIMAMORA HASIBUAN', 'TRT890', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.865702', '2.198025', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 5554500, 68000000, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(22, '18TS02B0434', NULL, 'OUTER', 'MACRO', 'JAMBUR NAULI', 'TRT756', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.985053', '2.1177133', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 5554500, 68000000, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(23, '18TS02B0435', NULL, 'OUTER', 'MACRO', 'HILIMONDREGERAYA', 'TUK910', 'AREA 1', 'SUMBAGUT', 'KEP NIAS', 'Global Comtech', 'SST', 42, 'NL', '97.811369', '0.6279095', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. NIAS', 593000000, 6604500, 68000000, 80000000, 100000000, 155022760.5248998, 28916800, 20000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(24, '18TS02B0436', NULL, 'OUTER', 'MACRO', 'LAWA-LAWA LUO', 'GST714', 'AREA 1', 'SUMBAGUT', 'KEP NIAS', 'Global Comtech', 'SST', 42, 'NL', '97.710704', '1.0287733', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. NIAS', 593000000, 6604500, 68000000, 80000000, 100000000, 155022760.5248998, 28916800, 20000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(25, '18TS02B0437', NULL, 'OUTER', 'MACRO', 'GODUNG BOROTAN', 'TRT885', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.104221', '1.9977874', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 5554500, 68000000, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(26, '18TS02B0438', NULL, 'OUTER', 'MACRO', 'SITOLU OMPU', 'TRT764', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.075011', '1.7887', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI UTARA', 593000000, 5554500, 68000000, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(27, '18TS02B0439', NULL, 'OUTER', 'MACRO', 'MELA II', 'KPD735', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.388628', '2.087546', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI TENGAH', 593000000, 5554500, 68909600, 97200000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(28, '18TS02B0440', NULL, 'OUTER', 'MACRO', 'PT ANJ AGRI SIAIS', 'PSP778', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.16085', '1.1677', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI SELATAN', 593000000, 5554500, 68909600, 110000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(29, '18TS02B0441', NULL, 'OUTER', 'MACRO', 'REP. DESA BUKAS', 'PSP761', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.07558', '1.25357', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. TAPANULI SELATAN', 593000000, 5554500, 68909600, 110000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(30, '18TS02B0442', NULL, 'OUTER', 'MACRO', 'BITUNGAN BEJANGKAR', 'PYB823', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '99.272079', '0.412171', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. MANDAILING NATAL', 593000000, 5554500, 68909600, 115000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(31, '18TS02B0443', NULL, 'OUTER', 'MACRO', 'PARBULUAN V', 'SDK140', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.504883', '2.608067', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DAIRI', 593000000, 5554500, 68909600, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(32, '18TS02B0444', NULL, 'OUTER', 'MACRO', 'DESA DOLOK HULUAN', 'PMR009', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Indoteknik', 'SST', 42, 'NL', '98.7955', '2.8931', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. SIMALUNGUN', 593000000, 5554500, 63573300, 57201000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(33, '18TS02B0445', NULL, 'OUTER', 'MACRO', 'TANAH MERAH 2', 'KIS930', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.422324', '3.3399396', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(34, '18TS02B0446', NULL, 'OUTER', 'MACRO', 'TANAH ITAM HILIR', 'KIS929', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.427717', '3.2721335', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(35, '18TS02B0447', NULL, 'OUTER', 'MACRO', 'DUSUN 9 SUNGAI LAMA (SUNGAI LAMA)', 'KIS903', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.731925', '2.9590028', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(36, '18TS02B0448', NULL, 'OUTER', 'MACRO', 'SEI SILAU BARAT (LUBUK PALAS)', 'KIS869', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Madya Perdana', 'SST', 42, 'NL', '99.494414', '2.947145', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. ASAHAN', 593000000, 5554500, 68909600, 95000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(37, '18TS02B0449', NULL, 'OUTER', 'MACRO', 'NAMAN JAHE', 'STB369', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Winer', 'SST', 42, 'NL', '98.275275', '3.513732', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LANGKAT', 593000000, 5554500, 68909600, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(38, '18TS02B0397', NULL, 'OUTER', 'MACRO', 'KUTAMBARU 2', 'STB299', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Winer', 'SST', 42, 'NL', '98.265035', '3.842307', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LANGKAT', 593000000, 5554500, 68909600, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(39, '18TS02B0398', NULL, 'OUTER', 'MACRO', 'KUALA MUSAM', 'STB294', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Winer', 'SST', 42, 'NL', '98.17654', '3.627852', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. LANGKAT', 593000000, 5554500, 68909600, 120000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(40, '18TS02B0399', NULL, 'OUTER', 'MACRO', 'PEMUKIMAN BAGERPANG', 'LBP853', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.781948', '3.4119668', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(41, '18TS02B0400', NULL, 'OUTER', 'MACRO', 'HAMPARAN PERAK 3', 'LBP852', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.584544', '3.76252', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(42, '18TS02B0401', NULL, 'OUTER', 'MACRO', 'JATI MULYO', 'LBP838', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.992156', '3.533667', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(43, '18TS02B0402', NULL, 'OUTER', 'MACRO', 'PEMUKIMAN BUKIT CERMIN HILIR', 'LBP867', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '99.0397', '3.3024', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(44, '18TS02B0403', NULL, 'OUTER', 'MACRO', 'RAMBUNG BARU', 'LBP779', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.705397', '3.5443111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(45, '18TS02B0404', NULL, 'OUTER', 'MACRO', 'DESA DAMAK URAT', 'LBP777', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '98.983985', '3.218786', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(46, '18TS02B0405', NULL, 'OUTER', 'MACRO', 'DESA MALASORI', 'LBP775', 'AREA 1', 'SUMBAGUT', 'SUMUT', 'Ramos', 'SST', 42, 'NL', '99.0397', '3.302499', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA UTARA', 'KAB. DELI SERDANG', 593000000, 5554500, 68909600, 140000000, 100000000, 143379827.65335396, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(47, '18TS02B0406', NULL, 'OUTER', 'MACRO', 'AMPALU', 'PAR260', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.69292', '-1.5074', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(48, '18TS02B0407', NULL, 'OUTER', 'MACRO', 'NAGARI KOTA BESAR', 'MSJ123', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.66686', '-1.197778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(49, '18TS02B0408', NULL, 'OUTER', 'MACRO', 'RABI JONGOR', 'LSK083', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.712538', '0.290173', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(50, '18TS02B0409', NULL, 'OUTER', 'MACRO', 'PARIK', 'LSK091', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.51527778', '0.32980556', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(51, '18TS02B0410', NULL, 'OUTER', 'MACRO', 'SITUJUAH LADANG LAWEH', 'PAY622', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.6156389', '-0.32252778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(52, '18TS02B0411', NULL, 'OUTER', 'MACRO', 'PIOBANG', 'PAY624', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.5645773', '-0.21111582', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(53, '18TS02B0412', NULL, 'OUTER', 'MACRO', 'TAEH BUKIK', 'PAY625', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.6065935', '-0.13123171', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(54, '18TS02B0413', NULL, 'OUTER', 'MACRO', 'SITANANG', 'PAY626', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.762175', '-0.25707195', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(55, '18TS02B0414', NULL, 'OUTER', 'MACRO', 'LUBUAK LAYANG', 'LSK109', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '100.0591667', '0.55252778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(56, '18TS02B0415', NULL, 'OUTER', 'MACRO', 'LABUAH GUNUANG', 'PAY627', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.7155122', '-0.30738172', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(57, '18TS02B0416', NULL, 'OUTER', 'MACRO', 'KUBANG', 'PAY628', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.4948488', '-0.14095956', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(58, '18TS02B0417', NULL, 'OUTER', 'MACRO', 'TALANG MAUA', 'PAY629', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.5523056', '-0.05255556', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(59, '18TS02B0418', NULL, 'OUTER', 'MACRO', 'BARUAH GUNUANG', 'PAY630', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.393313', '0.015777', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(60, '18TS02B0419', NULL, 'OUTER', 'MACRO', 'MALAMPAH', 'LSK114', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '100.048429', '0.045156', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(61, '18TS02B0420', NULL, 'OUTER', 'MACRO', 'LANGUANG', 'LSK121', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '100.0234167', '0.64027778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(62, '18TS02B0421', NULL, 'OUTER', 'MACRO', 'LINGKUANG AUA', 'LSK122', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.75738889', '0.09711111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(63, '18TS02B0422', NULL, 'OUTER', 'MACRO', 'TALUAK TIGA SAKATO', 'PAR261', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.650426', '-1.497591', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(64, '18TS02B0423', NULL, 'OUTER', 'MACRO', 'PULAU RAJO INDERAPURA', 'PAR262', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.881255', '-2.02412', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(65, '18TS02B0370', NULL, 'OUTER', 'MACRO', 'SUNGAI SARIAK', 'PAR263', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.097998', '-2.417165', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(66, '18TS02B0371', NULL, 'OUTER', 'MACRO', 'VI LINGKUNG', 'PAR264', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '100.352338', '-0.626971', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PADANG PARIAMAN', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(67, '18TS02B0372', NULL, 'OUTER', 'MACRO', 'HARAPAN JAYA', 'PKR274', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '101.913669', '0.198909', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. PELALAWAN', 593000000, 5554500, 63068000, 170000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(68, '18TS02B0373', NULL, 'OUTER', 'MACRO', 'PAGARUYUNG', 'BKG076', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '101.238892', '0.481104', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. KAMPAR', 593000000, 5554500, 63068000, 190000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(69, '18TS02B0374', NULL, 'OUTER', 'MACRO', 'DANAU LANCANG 2', 'PPN102', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.833353', '0.892489', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(70, '18TS02B0375', NULL, 'OUTER', 'MACRO', 'KASANGMUNGKAL 2', 'PPN103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.757703', '1.063611', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(71, '18TS02B0376', NULL, 'OUTER', 'MACRO', 'SEROMBAU INDAH', 'PPN105', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.440558', '0.931839', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(72, '18TS02B0377', NULL, 'OUTER', 'MACRO', 'BATU TABA', 'BSK100', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.524155', '-0.543869', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(73, '18TS02B0378', NULL, 'OUTER', 'MACRO', 'BONJOL ABAI SIAT', 'MSJ124', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.623802', '-1.167779', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(74, '18TS02B0379', NULL, 'OUTER', 'MACRO', 'NAGARI SILAGO', 'MSJ154', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.247417', '-1.019806', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(75, '18TS02B0380', NULL, 'OUTER', 'MACRO', 'BUKIT JAYA NAGARI RANAH PALABI', 'MSJ156', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Mitra Sistematika Global', 'SST', 42, 'NL', '101.707221', '-0.966686', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. DHARMASRAYA', 593000000, 5554500, 67068000, 205000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(76, '18TS02B0381', NULL, 'OUTER', 'MACRO', 'KOTO GADANG GUGUAK', 'SLK101', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.671322', '-0.921462', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 5554500, 67068000, 136080000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(77, '18TS02B0382', NULL, 'OUTER', 'MACRO', 'AIE DINGIN', 'SLK102', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.8124019', '-1.14593308', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 5554500, 67068000, 136080000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(78, '18TS02B0383', NULL, 'OUTER', 'MACRO', 'DILAM', 'SLK103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.7414808', '-0.92024289', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 5554500, 67068000, 136080000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(79, '18TS02B0384', NULL, 'OUTER', 'MACRO', 'SELAYO', 'SLK104', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.608693', '-0.830375', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 5554500, 67068000, 136080000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(80, '18TS02B0385', NULL, 'OUTER', 'MACRO', 'TANJUNG BARULAK', 'BSK103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.521044', '-0.540758', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(81, '18TS02B0386', NULL, 'OUTER', 'MACRO', 'KOTO ALAM', 'BSK102', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.71145', '-0.552977', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(82, '18TS02B0387', NULL, 'OUTER', 'MACRO', 'TAMBAK', 'RGT106', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'AMPS', 'SST', 42, 'NL', '102.605237', '-0.3849', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. INDRAGIRI HULU', 593000000, 5554500, 63068000, 135000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(83, '18TS02B0388', NULL, 'OUTER', 'MACRO', 'TANI MAKMUR', 'RGT103', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'AMPS', 'SST', 42, 'NL', '102.372385', '-0.455405', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. INDRAGIRI HULU', 593000000, 5554500, 63068000, 135000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(84, '18TS02B0389', NULL, 'OUTER', 'MACRO', 'TAMBANGAN', 'BSK101', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.425305', '-0.514237', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. TANAH DATAR', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(85, '18TS02B0390', NULL, 'OUTER', 'MACRO', 'KAJAI', 'LSK088', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Sanjiwahana Persada', 'SST', 42, 'NL', '99.941061', '0.17127', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. PASAMAN', 593000000, 5554500, 67068000, 100000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(86, '18TS02B0391', NULL, 'OUTER', 'MACRO', 'JORONG TABUAH', 'SLK087', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Global Comtech', 'SST', 42, 'NL', '100.906476', '-1.268073', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. SOLOK', 593000000, 5554500, 67068000, 136080000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(87, '18TS02B0392', NULL, 'OUTER', 'MACRO', 'MUARA MUSU', 'PPN101', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.39071', '0.980074', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(88, '18TS02B0393', NULL, 'OUTER', 'MACRO', 'MAHATO', 'PPN100', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'Putra Aditya', 'SST', 42, 'NL', '100.189379', '1.373928', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'RIAU', 'KAB. ROKAN HULU', 593000000, 5554500, 63068000, 132000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(89, '18TS02B0394', NULL, 'OUTER', 'MACRO', 'LUBUAK BATINGKOK', 'PAY621', 'AREA 1', 'SUMBAGTENG', 'RIAU DARATAN', 'M Jusuf & Sons', 'SST', 42, 'NL', '100.6265556', '-0.15725', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA BARAT', 'KAB. LIMA PULUH KOTA', 593000000, 5554500, 67068000, 140000000, 100000000, 145786664.20619643, 28916800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(90, '18TS02B0395', NULL, 'OUTER', 'MACRO', 'DUSUN SUNGAI TAWAR', 'MSK077', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.74955', '-1.085126', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(91, '18TS02B0396', NULL, 'OUTER', 'MACRO', 'MANDIANGIN BATUBARA', 'SKY269', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.040694', '-2.399306', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(92, '18TS02B0450', NULL, 'OUTER', 'MACRO', 'KAMPUNG BARU', 'TJN101', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '107.62742', '-2.950952', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BELITUNG', 593000000, 5337805.2, 66150000, 170000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(93, '18TS02B0451', NULL, 'OUTER', 'MACRO', 'MUARA KIBUL', 'BKO103', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.033013', '-1.92898', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MERANGIN', 593000000, 5337805.2, 68909600, 124234000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(94, '18TS02B0452', NULL, 'OUTER', 'MACRO', 'SIMPANG LIMBUR 2', 'BKO104', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.422902', '-2.044218', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MERANGIN', 593000000, 5337805.2, 68909600, 124234000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(95, '18TS02B0453', NULL, 'OUTER', 'MACRO', 'TABIR', 'SRJ097', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.510048', '-1.971233', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. SAROLANGUN', 593000000, 5337805.2, 63709600, 124234000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(96, '18TS02B0454', NULL, 'OUTER', 'MACRO', 'NILO DINGIN', 'BKO106', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '101.832385', '-2.42709', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MERANGIN', 593000000, 5337805.2, 68909600, 124234000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(97, '18TS02B0455', NULL, 'OUTER', 'MACRO', 'TALANG KERINCI', 'SGE159', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.71221', '-1.735887', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MUARO JAMBI', 593000000, 5337805.2, 64000000, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(98, '18TS02B0456', NULL, 'OUTER', 'MACRO', 'RUKAM', 'SGE160', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.784233', '-1.409886', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. MUARO JAMBI', 593000000, 5337805.2, 64000000, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(99, '18TS02B0457', NULL, 'OUTER', 'MACRO', 'OP SELATAN', 'KTL117', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.0223', '-1.2226', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG BARAT', 593000000, 5337805.2, 67903200, 120000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(100, '18TS02B0458', NULL, 'OUTER', 'MACRO', 'DESA KUALA KAHAR', 'KTL119', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.272532', '-0.847129', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG BARAT', 593000000, 5337805.2, 67903200, 120000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(101, '18TS02B0459', NULL, 'OUTER', 'MACRO', 'BELALAU 2', 'LLG228', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '102.866802', '-3.2064', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA LUBUKLINGGAU', 593000000, 5337805.2, 68909600, 139500000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(102, '18TS02B0460', NULL, 'OUTER', 'MACRO', 'KARYA SAKTI 2', 'LLG231', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.123655', '-2.947808', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(103, '18TS02B0461', NULL, 'OUTER', 'MACRO', 'BTS ULU 2', 'LLG233', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.350153', '-3.458299', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(104, '18TS02B0462', NULL, 'OUTER', 'MACRO', 'MULYO HARJO 2', 'LLG234', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.301817', '-3.489037', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(105, '18TS02B0463', NULL, 'OUTER', 'MACRO', 'WONOREJO 2', 'LLG243', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '103.04017', '-3.12402', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(106, '18TS02B0464', NULL, 'OUTER', 'MACRO', 'SELANGIT 2', 'LLG244', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '102.787201', '-3.184593', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(107, '18TS02B0465', NULL, 'OUTER', 'MACRO', 'KALIBENING LINGGAU 2', 'LLG245', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'GPP', 'SST', 42, 'NL', '102.983811', '-3.185717', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI RAWAS', 593000000, 5337805.2, 68909600, 147000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(108, '18TS02B0466', NULL, 'OUTER', 'MACRO', 'GEDONG JAYA', 'BLU093', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.945968', '-4.364888', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. WAY KANAN', 593000000, 5337805.2, 67503200, 155000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(109, '18TS02B0467', NULL, 'OUTER', 'MACRO', 'MERBAU MENDAHARA', 'MSK072', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.59043', '-1.06355', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(110, '18TS02B0468', NULL, 'OUTER', 'MACRO', 'RANO', 'MSK073', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.773529', '-1.177134', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(111, '18TS02B0469', NULL, 'OUTER', 'MACRO', 'MENCOLOK', 'MSK074', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.50564', '-1.21497', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(112, '18TS02B0470', NULL, 'OUTER', 'MACRO', 'PANGKAL DURI', 'MSK075', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.563882', '-0.930482', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(113, '18TS02B0471', NULL, 'OUTER', 'MACRO', 'SINGKEP', 'MSK076', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.77889', '-1.073186', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG TIMUR', 593000000, 5337805.2, 66303200, 145000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(114, '18TS02B0472', NULL, 'OUTER', 'MACRO', 'DESA KARANG DAPO', 'OKU255', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.350659', '-3.856865', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(115, '18TS02B0473', NULL, 'OUTER', 'MACRO', 'CAMPANG TIGA ULU', 'MPR137', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.826511', '-3.793146', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(116, '18TS02B0570', NULL, 'OUTER', 'MACRO', 'CAMPANG TIGA ULU', 'MPR136', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.816465', '-3.768209', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(117, '18TS02B0571', NULL, 'OUTER', 'MACRO', 'DESA KARYA BAKTI', 'MPR135', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.860493', '-3.834329', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(118, '18TS02B0572', NULL, 'OUTER', 'MACRO', 'NIRWANA', 'MPR134', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.860667', '-3.802897', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(119, '18TS02B0343', NULL, 'OUTER', 'MACRO', 'TULUNG HARAPAN', 'MPR133', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.851193', '-3.912334', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(120, '18TS02B0344', NULL, 'OUTER', 'MACRO', 'DESA AIR BARU', 'MRD059', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.80747', '-4.390668', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU SELATAN', 593000000, 5337805.2, 66150000, 119500000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(121, '18TS02B0345', NULL, 'OUTER', 'MACRO', 'DESA KOTA TANAH', 'MPR131', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '104.7811', '-3.9387', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU TIMUR', 593000000, 5337805.2, 66150000, 162000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(122, '18TS02B0346', NULL, 'OUTER', 'MACRO', 'DUSUN TANJUNG', 'BLU092', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.720312', '-4.470874', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. WAY KANAN', 593000000, 5337805.2, 67503200, 155000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(123, '18TS02B0347', NULL, 'OUTER', 'MACRO', 'DUSUN BUAY BAHUGA 2', 'BLU091', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.61008', '-4.25952', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. WAY KANAN', 593000000, 5337805.2, 67503200, 155000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(124, '18TS02B0348', NULL, 'OUTER', 'MACRO', 'SUKAJAYA', 'GNS197', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.974005', '-4.961888', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TENGAH', 593000000, 5337805.2, 67503200, 140000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(125, '18TS02B0349', NULL, 'OUTER', 'MACRO', 'PANGKALAN BENTENG 2', 'PBI299', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.641134', '-2.841112', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(126, '18TS02B0350', NULL, 'OUTER', 'MACRO', 'SEBELIK ', 'PBI298', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.779153', '-2.727552', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(127, '18TS02B0351', NULL, 'OUTER', 'MACRO', 'ENGGAL REJO 2', 'PBI289', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.006655', '-2.558648', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(128, '18TS02B0352', NULL, 'OUTER', 'MACRO', 'BETUG DALAM', 'PBI288', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.256829', '-2.871115', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30');
INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(129, '18TS02B0353', NULL, 'OUTER', 'MACRO', 'CENDANA MUARA 2', 'PBI287', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.319747', '-2.464177', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.71, 29436100, 3000000, 2000000, 1000000, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-22 20:34:35'),
(130, '18TS02B0354', NULL, 'OUTER', 'MACRO', 'KARANG SARI 2', 'PBI286', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.712333', '-2.234325', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(131, '18TS02B0355', NULL, 'OUTER', 'MACRO', 'MARGO MULYO 2', 'PBI285', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.219074', '-2.513346', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. BANYUASIN', 593000000, 5337805.2, 66150000, 160000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(132, '18TS02B0356', NULL, 'OUTER', 'MACRO', 'SUNGAI LILIN 4', 'SKY273', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.090592', '-2.647241', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(133, '18TS02B0357', NULL, 'OUTER', 'MACRO', 'SRI KARANGREJO 3', 'SKY272', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.546771', '-2.274602', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(134, '18TS02B0358', NULL, 'OUTER', 'MACRO', 'SRI KARANGREJO 2', 'SKY271', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.49922', '-2.261907', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(135, '18TS02B0359', NULL, 'OUTER', 'MACRO', 'MUARA SUGIHAN 2', 'PBI284', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '105.199436', '-2.426966', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(136, '18TS02B0360', NULL, 'OUTER', 'MACRO', 'KARANG AGUNG', 'SKY270', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.445585', '-2.341117', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUSI BANYUASIN', 593000000, 5337805.2, 66150000, 185000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(137, '18TS02B0361', NULL, 'OUTER', 'MACRO', 'DESA BUKIT', 'AGR149', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.379147', '-3.842185', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU TENGAH', 593000000, 5337805.2, 66150000, 130500000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(138, '18TS02B0362', NULL, 'OUTER', 'MACRO', 'SINAR JAYA', 'MKO063', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '101.200934', '-2.476694', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. MUKOMUKO', 593000000, 5337805.2, 66150000, 117000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(139, '18TS02B0363', NULL, 'OUTER', 'MACRO', 'TEBAT AGUNG', 'TIS055', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.835345', '-4.266133', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. SELUMA', 593000000, 5337805.2, 66150000, 112500000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(140, '18TS02B0364', NULL, 'OUTER', 'MACRO', 'AIR KEMANG', 'MNA063', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.899026', '-4.396778', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU SELATAN', 593000000, 5337805.2, 66150000, 112500000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(141, '18TS02B0365', NULL, 'OUTER', 'MACRO', 'DESA TANAH BAWAH', 'SLT125', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.819213', '-2.034464', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA', 593000000, 5337805.2, 68909600, 170000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(142, '18TS02B0366', NULL, 'OUTER', 'MACRO', 'DESA SILIP', 'SLT124', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.846658', '-1.765897', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA', 593000000, 5337805.2, 68909600, 170000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(143, '18TS02B0367', NULL, 'OUTER', 'MACRO', 'DESA GUDANG', 'TBI068', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '106.038189', '-2.711434', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA SELATAN', 593000000, 5337805.2, 68909600, 165000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(144, '18TS02B0368', NULL, 'OUTER', 'MACRO', 'DESA SUKAJAYA', 'TBI067', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '106.18526', '-2.790359', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA SELATAN', 593000000, 5337805.2, 68909600, 165000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(145, '18TS02B0369', NULL, 'OUTER', 'MACRO', 'DESA TANJUNG PURA', 'KOB074', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.812802', '-2.371059', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA TENGAH', 593000000, 5337805.2, 68909600, 170000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(146, '18TS02B0319', NULL, 'OUTER', 'MACRO', 'DESA SINAR SURYA', 'MTK128', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Manolo', 'SST', 42, 'NL', '105.70248', '-2.107471', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANGKA BELITUNG', 'KAB. BANGKA BARAT', 593000000, 5337805.2, 66150000, 170000000, 100000000, 144260936.7093516, 29436100, 15000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(147, '18TS02B0320', NULL, 'OUTER', 'MACRO', 'PULOKERTO2', 'PLG777', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Girang Makmur', 'SST', 42, 'NL', '104.652919', '-3.026135', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA PALEMBANG', 593000000, 5337805.2, 68909600, 117000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(148, '18TS02B0321', NULL, 'OUTER', 'MACRO', 'DABUK MAKMUR', 'OKI376', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.13382501', '-3.79903381', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(149, '18TS02B0322', NULL, 'OUTER', 'MACRO', 'BUMIARJO', 'OKI375', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.97549211', '-3.88004659', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(150, '18TS02B0323', NULL, 'OUTER', 'MACRO', 'DESA SERAPEK', 'OKI374', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.76564633', '-3.55834791', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(151, '18TS02B0324', NULL, 'OUTER', 'MACRO', 'KUALA SUNGAI JERUJU', 'OKI373', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.853577', '-3.4909', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(152, '18TS02B0325', NULL, 'OUTER', 'MACRO', 'CAHAYA MAS 2', 'OKI372', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.7994794', '-4.15270954', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(153, '18TS02B0326', NULL, 'OUTER', 'MACRO', 'JAYA BAKTI', 'OKI371', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.02237125', '-3.95244704', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(154, '18TS02B0327', NULL, 'OUTER', 'MACRO', 'DESA KUANG DALEM TIMUR', 'OKI353', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '104.50486585', '-3.69549538', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN ILIR', 593000000, 5337805.2, 66150000, 135000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(155, '18TS02B0328', NULL, 'OUTER', 'MACRO', 'MARGA BAKTI', 'OKI367', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Transdata', 'SST', 42, 'NL', '105.08231117', '-3.95712848', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ILIR', 593000000, 5337805.2, 66150000, 141300000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(156, '18TS02B0329', NULL, 'OUTER', 'MACRO', 'SRI TEJO KENCONO', 'GNS196', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.34139', '-5.01838', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TENGAH', 593000000, 5337805.2, 67503200, 140000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(157, '18TS02B0330', NULL, 'OUTER', 'MACRO', 'RAMAYANA 3 LAMTENG', 'GNS195', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.30958', '-4.927561', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TENGAH', 593000000, 5337805.2, 67503200, 140000000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(158, '18TS02B0331', NULL, 'OUTER', 'MACRO', 'PT NEF 2', 'SKD179', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.591912', '-5.021576', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG TIMUR', 593000000, 5337805.2, 68909600, 127125000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(159, '18TS02B0332', NULL, 'OUTER', 'MACRO', 'KAWASAN INDUSTRI PT. ILP 2', 'MGA220', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.651285', '-4.42631', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TULANG BAWANG', 593000000, 5337805.2, 66150000, 126360000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(160, '18TS02B0333', NULL, 'OUTER', 'MACRO', 'BATU AMPAR', 'MNA062', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '103.120531', '-4.378711', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU SELATAN', 593000000, 5337805.2, 66150000, 112500000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(161, '18TS02B0334', NULL, 'OUTER', 'MACRO', 'TANJUNG BENANAK SP3', 'KTL115', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.971254', '-1.342375', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TANJUNG JABUNG BARAT', 593000000, 5337805.2, 67903200, 120000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(162, '18TS02B0335', NULL, 'OUTER', 'MACRO', 'WAY MEGAT', 'KLA292', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.632122', '-5.617671', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG SELATAN', 593000000, 5337805.2, 67503200, 140814000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(163, '18TS02B0336', NULL, 'OUTER', 'MACRO', 'GANDRI', 'KLA291', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.71778', '-5.69314', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG SELATAN', 593000000, 5337805.2, 67503200, 140814000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(164, '18TS02B0337', NULL, 'OUTER', 'MACRO', 'BALI AGUNG', 'KLA290', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.6643', '-5.60978', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. LAMPUNG SELATAN', 593000000, 5337805.2, 67503200, 140814000, 100000000, 138196003.2229575, 28137800, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(165, '18TS02B0338', NULL, 'OUTER', 'MACRO', 'SUMBER JAYA', 'PGA040', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '103.242691', '-4.099561', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA PAGAR ALAM', 593000000, 5337805.2, 66150000, 166500000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(166, '18TS02B0339', NULL, 'OUTER', 'MACRO', 'DESA MIDAR', 'SAT221', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '104.373996', '-3.273663', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. MUARA ENIM', 593000000, 5337805.2, 68909600, 135000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(167, '18TS02B0340', NULL, 'OUTER', 'MACRO', 'DESA PURBASARI', 'LHT188', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '103.27279', '-3.662409', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. LAHAT', 593000000, 5337805.2, 66150000, 135000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(168, '18TS02B0341', NULL, 'OUTER', 'MACRO', 'SPBU SUNGAI BENGKAL', 'MTB088', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '102.695532', '-1.536659', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAMBI', 'KAB. TEBO', 593000000, 5337805.2, 68909600, 150000000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(169, '18TS02B0342', NULL, 'OUTER', 'MACRO', 'KOTA PADANG', 'MRD058', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'Indoteknik', 'SST', 42, 'NL', '103.770819', '-4.336952', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KAB. OGAN KOMERING ULU SELATAN', 593000000, 5337805.2, 66150000, 119500000, 100000000, 144260936.7093516, 29436100, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(170, '18TS02B0515', '3/18TS02B0515/III/2018', 'OUTER', 'MACRO', 'BNPUHUN_LS_MTRATEL', 'TRG042', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.799781', '-0.27912', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. KUTAI KARTANEGARA', 593000000, 7452900, 74373300, 99000000, 90000000, 165920731.83, 33675900, 0, 0, 0, 115000000, 61, NULL, 'REPAIR AREA - GENERAL MANAGER AREA', '2018-03-19 06:32:30', '2018-03-26 12:26:09'),
(171, '18TS02B0514', '9/18TS02B0514/III/2018', 'OUTER', 'MACRO', 'TELAGA_SARI', 'KBA054', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '116.0078457821349', '-3.150903567679367', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. KOTABARU', 593000000, 7452900, 59535000, 105000000, 80000000, 165920731.83, 33675900, 0, 0, 0, 115000000, 88, NULL, 'REPAIR UBIS - MANAGER', '2018-03-19 06:32:30', '2018-03-26 12:39:32'),
(172, '18TS02B0513', '28/18TS02B0513/III/2018', 'OUTER', 'MACRO', 'KAMPUNG TENGAH', 'KSN022', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '113.284927', '-3.079772', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN TIMUR', 593000000, 7452900, 74373300, 140000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 140, '1522142715.pdf', 'AREA - GENERAL MANAGER AREA', '2018-03-19 06:32:30', '2018-03-27 02:25:47'),
(173, '18TS02B0512', NULL, 'OUTER', 'MACRO', 'BAMBAN', 'TML055', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '115.269923', '-2.168593', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. BARITO SELATAN', 593000000, 7452900, 55800000, 90000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(174, '18TS02B0511', NULL, 'OUTER', 'MACRO', 'CENAYAN', 'SHR026', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '110.681564', '-0.413754', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SANGGAU', 593000000, 7644000, 59535000, 112600000, 80000000, 169553519.0156344, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(175, '18TS02B0510', NULL, 'OUTER', 'MACRO', 'BATU KOTAM', 'NIK010', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.554047', '-2.285244', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(176, '18TS02B0509', '29/18TS02B0509/III/2018', 'OUTER', 'MACRO', 'NATAI BARU', 'PBU053', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.659258', '-2.623942', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 100000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 141, '1522145477.pdf', 'AREA - GENERAL MANAGER AREA', '2018-03-19 06:32:30', '2018-03-27 03:11:28'),
(177, '18TS02B0508', NULL, 'OUTER', 'MACRO', 'SPLIT_SEROJA_SEC1', 'BLC078', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '115.9205162250223', '-3.293494746638242', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. KOTABARU', 593000000, 7452900, 59535000, 105000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(178, '18TS02B0507', NULL, 'OUTER', 'MACRO', 'BELITANG DUA', 'SHR030', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '111.237974', '0.167491', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SANGGAU', 593000000, 7644000, 59535000, 112600000, 80000000, 169553519.0156344, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(179, '18TS02B0506', NULL, 'OUTER', 'MACRO', 'DEHES', 'KSN028', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '113.194035', '-1.404312', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN TIMUR', 593000000, 7452900, 74373300, 140000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(180, '18TS02B0505', NULL, 'OUTER', 'MACRO', '2120195_PKLNBUNTIMUR_CDC', 'PBU088', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.689444', '-2.604504', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(181, '18TS02B0504', NULL, 'OUTER', 'MACRO', 'PTANISENABAH', 'SBS063', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '109.507658', '1.349842', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SAMBAS', 593000000, 7644000, 59535000, 125000000, 80000000, 169553519.0156344, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(182, '18TS02B0503', NULL, 'OUTER', 'MACRO', '212A078L1_GMSAJANG2_CDC', 'SMA028', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '111.1858889', '-2.121861111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KOTAWARINGIN BARAT', 593000000, 7452900, 55800000, 130000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(183, '18TS02B0502', NULL, 'OUTER', 'MACRO', 'JAMBU KURIPAN', 'MRB080', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.7672727942891', '-2.712160082001645', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(184, '18TS02B0501', NULL, 'OUTER', 'MACRO', 'PT. TBM', 'RTA022', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '114.8823', '-2.703206', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. TAPIN', 593000000, 7452900, 59535000, 90000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(185, '18TS02B0500', NULL, 'OUTER', 'MACRO', 'PATIH SELERA', 'MRB096', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.63615', '-3.083282', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(186, '18TS02B0499', NULL, 'OUTER', 'MACRO', 'TANIPAH', 'MRB098', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.667116', '-3.228773', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(187, '18TS02B0498', NULL, 'OUTER', 'MACRO', 'PATIH MUHUR BARU', 'MRB106', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.559378', '-3.149151', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(188, '18TS02B0497', NULL, 'OUTER', 'MACRO', 'BELANDEAN', 'MRB107', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '114.5914097975355', '-3.188992151435884', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN SELATAN', 'KAB. BARITO KUALA', 593000000, 7452900, 55800000, 80000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(189, '18TS02B0496', NULL, 'OUTER', 'MACRO', 'KTC COAL MINING', 'KKP128', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Grand Telecom', 'SST', 42, 'NL', '114.46271', '-1.01488', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KAPUAS', 593000000, 7452900, 55800000, 90000000, 80000000, 165920731.82581547, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(190, '18TS02B0495', NULL, 'OUTER', 'MACRO', 'PT. BUMITAMA GUNAJAYA AGRO', 'KTP112', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '110.486376', '-2.266567', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. KETAPANG', 593000000, 7644000, 59535000, 91000000, 80000000, 169553519.0156344, 33675900, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(191, '18TS02B0494', NULL, 'OUTER', 'MACRO', 'DEIYAI 2', 'ENT021', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '136.269243', '-4.07145', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. PANIAI', 593000000, 15729000, 40060980, 42750000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(192, '18TS02B0493', NULL, 'OUTER', 'MACRO', 'KASUNAWEJA 2', 'SMI023', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '138.032651', '-2.300274', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(193, '18TS02B0492', NULL, 'OUTER', 'MACRO', 'UPT ARSO V / WIYANTRI', 'WRS053', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.626', '-2.81524', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(194, '18TS02B0491', NULL, 'OUTER', 'MACRO', 'SUGAPA', 'ENT020', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '137.0403', '-3.73889', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. PANIAI', 593000000, 15729000, 40060980, 42750000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(195, '18TS02B0490', '23/18TS02B0490/III/2018', 'OUTER', 'MACRO', 'PEMDA MAYBRAT 2', 'TMB052', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '132.194082', '-1.275396', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. SORONG SELATAN', 593000000, 15729000, 43624980, 56700000, 80000000, 222324013.57, 31500000, 30000000, 0, 0, 115000000, 134, NULL, 'FINISH', '2018-03-19 06:32:30', '2018-03-26 13:59:20'),
(196, '18TS02B0489', '22/18TS02B0489/III/2018', 'OUTER', 'MACRO', 'B2S BANDARA NDUGA (2G NEW COVERAGE)', 'AGA021', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '138.382898', '-4.6165', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 593000000, 15729000, 41194980, 51300000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 121, NULL, 'REPAIR AREA - GENERAL MANAGER AREA', '2018-03-19 06:32:30', '2018-03-26 13:40:23'),
(197, '18TS02B0488', NULL, 'OUTER', 'MACRO', 'BIME OKSIBI', 'OKS008', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '140.218595', '-4.484909', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 593000000, 15729000, 41194980, 51300000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(198, '18TS02B0487', NULL, 'OUTER', 'MACRO', 'B2S HUBIKIAK JAYAWIJAYA', 'WAM088', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '138.891974', '-4.041135', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 593000000, 15729000, 41194980, 51300000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(199, '18TS02B0486', '19/18TS02B0486/III/2018', 'OUTER', 'MACRO', 'SAIRO', 'MWR222', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '134.038635', '-0.802639', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. MANOKWARI', 593000000, 15729000, 41092200, 85000000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 44, NULL, 'AREA - GENERAL MANAGER AREA', '2018-03-19 06:32:30', '2018-03-26 12:09:46'),
(200, '18TS02B0485', NULL, 'OUTER', 'MACRO', 'WERSAR', 'TMB055', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '131.990039', '-1.468925', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. SORONG SELATAN', 593000000, 15729000, 43624980, 56700000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(201, '18TS02B0484', '17/18TS02B0484/III/2018', 'OUTER', 'MACRO', 'PLTA OREA', 'JAP645', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.01588', '-2.639646', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 46, NULL, 'REPAIR AREA - MANAGER AREA', '2018-03-19 06:32:30', '2018-03-26 12:13:13'),
(202, '18TS02B0483', NULL, 'OUTER', 'MACRO', 'NIMBOTONG', 'JAP676', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.03206', '-2.590674', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 593000000, 15729000, 41680980, 75000000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(203, '18TS02B0482', '15/18TS02B0482/III/2018', 'OUTER', 'MACRO', 'WATARIRI', 'MWR208', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '134.209293', '-1.250903', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. MANOKWARI', 593000000, 15729000, 41092200, 85000000, 80000000, 222324013.57, 31500000, 30000000, 0, 0, 115000000, 130, NULL, 'CANCEL', '2018-03-19 06:32:30', '2018-03-26 13:53:10'),
(204, '18TS02B0481', NULL, 'OUTER', 'MACRO', 'WERSAR', 'TMB043', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '131.97556', '-1.480319', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA BARAT', 'KAB. SORONG SELATAN', 593000000, 15729000, 43624980, 56700000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(205, '18TS02B0480', '5/18TS02B0480/III/2018', 'OUTER', 'MACRO', 'WANGGAR SARI', 'NAB097', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.345654', '-3.41487', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 80000000, 222324013.57, 31500000, 30000000, 0, 0, 115000000, 129, NULL, 'REPAIR UBIS - GENERAL MANAGER', '2018-03-19 06:32:30', '2018-03-26 13:51:27'),
(206, '18TS02B0479', '25/18TS02B0479/III/2018', 'OUTER', 'MACRO', 'MAIDEI', 'NAB094', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.832412', '-3.216261', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 116, NULL, 'AREA - GENERAL MANAGER AREA', '2018-03-19 06:32:30', '2018-03-26 13:32:02'),
(207, '18TS02B0478', '12/18TS02B0478/III/2018', 'OUTER', 'MACRO', 'SP 1 LAGARI', 'NAB120', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.730646', '-3.179111', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 80000000, 222324013.57, 31500000, 30000000, 0, 0, 115000000, 125, NULL, 'UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-19 06:32:30', '2018-03-26 13:44:01'),
(208, '18TS02B0477', NULL, 'OUTER', 'MACRO', 'WAROKI', 'NAB098', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '135.42027', '-3.368092', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. NABIRE', 593000000, 15729000, 42352200, 51300000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(209, '18TS02B0476', NULL, 'OUTER', 'MACRO', 'YENUSI', 'BIA132', 'AREA 4', 'PUMA', 'PAPUA', 'Amala', 'SST', 42, 'NL', '136.20628', '-1.172758', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. BIAK NUMFOR', 593000000, 15729000, 41092200, 85000000, 80000000, 222324013.57489616, 31500000, 30000000, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(210, '18TS02B0475', '8/18TS02B0475/III/2018', 'OUTER', 'MACRO', 'PALU_1233', 'SAK074', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'XLA', 'SST', 42, 'NL', '123.587359', '-1.712771', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. BANGGAI', 593000000, 8516448, 42601500, 71100000, 80000000, 152112482.5, 30168400, 0, 0, 0, 115000000, 93, NULL, 'REPAIR UBIS - MANAGER', '2018-03-19 06:32:30', '2018-03-26 12:44:32'),
(211, '18TS02B0474', '27/18TS02B0474/III/2018', 'OUTER', 'MACRO', 'KENDARI_70', 'RHA112', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.372935', '-4.751561', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. MUNA', 593000000, 8516448, 42945300, 63000000, 88000000, 151825305.67, 30168400, 0, 0, 0, 115000000, 139, '1522122556.pdf', 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-19 06:32:30', '2018-03-26 20:58:37'),
(212, '18TS02B0520', NULL, 'OUTER', 'MACRO', 'PALU_1541', 'DGL142', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Asa Berkat', 'SST', 42, 'NL', '119.695882', '-0.129828', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. DONGGALA', 593000000, 8516448.002999999, 42601500, 75600000, 80000000, 152112482.49748164, 30168400, 0, 0, 0, 115000000, 0, NULL, 'NEW', '2018-03-19 06:32:30', '2018-03-19 06:32:30'),
(213, '18TS02B0519', '24/18TS02B0519/III/2018', 'OUTER', 'MACRO', 'PALU_1540', 'PAL433', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Asa Berkat', 'SST', 42, 'NL', '120.132385', '-1.190754', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. DONGGALA', 593000000, 8516448.002999999, 42601500, 75600000, 80000000, 152112482.49748164, 30168400, 0, 0, 0, 115000000, 119, NULL, 'UBIS - MANAGER', '2018-03-19 06:32:30', '2018-03-26 13:37:59'),
(214, '18TS02B0518', '2/18TS02B0518/III/2018', 'OUTER', 'MACRO', 'KENDARI_101', 'RHA098', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.387663', '-4.847085', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. MUNA', 593000000, 8516448, 42945300, 63000000, 80000000, 151825305.67, 30168400, 0, 0, 0, 115000000, 84, NULL, 'FINISH', '2018-03-19 06:32:30', '2018-03-26 12:36:43'),
(215, '18TS02B0517', '21/18TS02B0517/III/2018', 'OUTER', 'MACRO', 'KENDARI_221', 'UNH051', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.222188', '-3.990222', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 593000000, 8516448, 42945300, 81000000, 80000000, 151825305.67, 30168400, 0, 0, 0, 115000000, 142, NULL, 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-19 06:32:30', '2018-03-27 03:17:51'),
(216, '18TS02B0516', '20/18TS02B0516/III/2018', 'OUTER', 'MACRO', 'WEDA BAY NIKEL', 'SSU020', 'AREA 4', 'PUMA', 'MALUKU', 'Nahrul Arbah', 'SST', 42, 'NL', '127.934238', '0.465702', 'UNTAPPED', 'PT. DAYAMITRA TELEKOMUNIKASI', 'MALUKU UTARA', 'KAB. HALMAHERA TENGAH', 593000000, 13482000, 58500000, 85000000, 80000000, 190671277.79, 31500000, 0, 0, 0, 115000000, 85, NULL, 'FINISH', '2018-03-19 06:32:30', '2018-03-26 12:36:58'),
(217, '18TS02B0310', NULL, 'OUTER', 'MACRO', 'PRINGSEWU IV', 'KOT171', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.988416', '-5.347441', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(218, '18TS02B0311', NULL, 'OUTER', 'MACRO', 'GEDUNG TATAAN V', 'KOT166', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.092211', '-5.365295', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. PESAWARAN', 805000000, 5337805.2, 84379000, 140000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(219, '18TS02B0312', NULL, 'OUTER', 'MACRO', 'CAMPANG 2', 'KOT173', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.735547', '-5.4125', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(220, '18TS02B0313', NULL, 'OUTER', 'MACRO', 'FAJAR ESUK 2', 'KOT169', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '104.95389', '-5.335235', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(221, '18TS02B0314', NULL, 'OUTER', 'MACRO', 'GEDUNG TATAAN IV', 'KOT170', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'GPP', 'SST', 42, 'NL', '105.078756', '-5.372757', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'LAMPUNG', 'KAB. TANGGAMUS', 805000000, 5337805.2, 84379000, 140000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(222, '18TS02B0315', NULL, 'OUTER', 'MACRO', 'PASAR KETAHUN', 'AGR138', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '101.823434', '-3.37948', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU UTARA', 805000000, 5337805.2, 66150000, 130500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(223, '18TS02B0316', NULL, 'OUTER', 'MACRO', 'URAI', 'AGR139', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '101.835027', '-3.368428', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. BENGKULU UTARA', 805000000, 5337805.2, 66150000, 130500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(224, '18TS02B0317', NULL, 'OUTER', 'MACRO', 'BATU BANDUNG 2', 'KPH020', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 2 (LAMPUNG, BENGKULU)', 'Transdata', 'SST', 42, 'NL', '102.723836', '-3.651373', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BENGKULU', 'KAB. KEPAHIANG', 805000000, 5337805.2, 66150000, 160920000, 100000000, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-22 22:51:42'),
(225, '18TS02B0318', NULL, 'OUTER', 'MACRO', 'PERKANTORAN PGA', 'PGA038', 'AREA 1', 'SUMBAGSEL', 'SUMSEL 1 (SUMSEL JAMBI BABEL)', 'AMPS', 'SST', 42, 'NL', '103.201165', '-4.041909', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SUMATERA SELATAN', 'KATA PAGAR ALAM', 805000000, 5337805.2, 66150000, 166500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(226, '18TS02B0573', NULL, 'INNER', 'MACRO', 'BANGKAL BINANGUN', 'CLP768', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '109.263397', '-7.651109', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. CILACAP', 805000000, 5733000, 92742000, 127710000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(227, '18TS02B0574', NULL, 'INNER', 'MACRO', 'CANGKOL MOJOLABAN', 'SKH775', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.892799', '-7.612757', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SUKOHARJO', 805000000, 5733000, 105000000, 135000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(228, '18TS02B0575', NULL, 'INNER', 'MACRO', 'PUNGGANGAN LIMPUNG', 'BAT669', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '109.926058', '-6.991209', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. BATANG', 805000000, 5733000, 104000000, 90000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(229, '18TS02B0576', NULL, 'INNER', 'MACRO', 'MUNTUNG', 'TMG678', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '110.054431', '-7.215226', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. TEMANGGUNG', 805000000, 5733000, 92742000, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(230, '18TS02B0577', NULL, 'INNER', 'MACRO', 'SENTONO', 'KLT674', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.72162', '-7.700252', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. KLATEN', 805000000, 5733000, 92742000, 108000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(231, '18TS02B0578', NULL, 'INNER', 'MACRO', 'JOHO PRAMBANAN', 'KLT686', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.513227', '-7.722244', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. KLATEN', 805000000, 5733000, 92742000, 108000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(232, '18TS02B0579', NULL, 'INNER', 'MACRO', 'RAKIT KULON', 'BJN678', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '109.52571', '-7.437893', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. PURBALINGGA', 805000000, 5733000, 92742000, 99000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(233, '18TS02B0580', NULL, 'INNER', 'MACRO', 'BENDO KEDUNGUPIT', 'SRA718', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.96595', '-7.362287', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SRAGEN', 805000000, 5733000, 92742000, 108000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(234, '18TS02B0581', NULL, 'INNER', 'MACRO', 'BANDARA GLAGAH', 'WAT655', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '110.078137', '-7.90542', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'DI YOGYAKARTA', 'KAB. KULON PROGO', 805000000, 5733000, 92742000, 130000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(235, '18TS02B0582', NULL, 'INNER', 'MACRO', 'CANDI GEDONGSONGO', 'UNR764', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '110.341865', '-7.210358', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SEMARANG', 805000000, 5733000, 105000000, 125000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(236, '18TS02B0583', NULL, 'INNER', 'MACRO', 'KEBONAGUNG', 'UNR765', 'AREA 3', 'JATENG', 'JATENG', 'Sanjiwahana Persada', 'SST', 42, 'NL', '110.301131', '-7.26163', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. SEMARANG', 805000000, 5733000, 105000000, 125000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(237, '18TS02B0584', NULL, 'INNER', 'MACRO', 'BLIGOREJO DORO', 'PKL712', 'AREA 3', 'JATENG', 'JATENG', 'IDE Sehati', 'SST', 42, 'NL', '109.693556', '-7.005004', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TENGAH', 'KAB. PEKALONGAN', 805000000, 5733000, 92742000, 99000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(238, '18TS02B0585', NULL, 'INNER', 'MACRO', 'DESA BENTEK', 'MTR308', 'AREA 3', 'BALNUS', 'NTB', 'Symmetry Contrating', 'SST', 42, 'NL', '116.082184', '-8.443817', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'NUSA TENGGARA BARAT', 'KAB. LOMBOK BARAT', 805000000, 6497400, 62637000, 78210000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(239, '18TS02B0586', NULL, 'INNER', 'MACRO', 'PADANGBULIA3', 'SGR173', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.140486', '-8.172745', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. BULELENG', 805000000, 4968600, 95000000, 200000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(240, '18TS02B0587', NULL, 'INNER', 'MACRO', 'MAUBESI3', 'KEF069', 'AREA 3', 'BALNUS', 'NTT', 'Symmetry Contrating', 'SST', 42, 'NL', '124.505728', '-9.491099', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'NUSA TENGGARA TIMUR', 'KAB. TIMOR TENGAH UTARA', 805000000, 6497400, 72000000, 84250000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(241, '18TS02B0588', NULL, 'INNER', 'MACRO', 'GELGEL', 'KLK076', 'AREA 3', 'BALNUS', 'BALI', 'Agcia Pertiwi', 'SST', 42, 'NL', '115.417855', '-8.571506', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(242, '18TS02B0589', NULL, 'INNER', 'MACRO', 'SAMPALAN', 'KLK078', 'AREA 3', 'BALNUS', 'BALI', 'Agcia Pertiwi', 'SST', 42, 'NL', '115.544369', '-8.727837', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(243, '18TS02B0590', NULL, 'INNER', 'MACRO', 'KEBON', 'BLI064', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.399549', '-8.393306', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. BANGLI', 805000000, 4968600, 115000000, 220000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(244, '18TS02B0591', NULL, 'INNER', 'MACRO', 'LEMBONGAN', 'KLK097', 'AREA 3', 'BALNUS', 'BALI', 'Agcia Pertiwi', 'SST', 42, 'NL', '115.459548', '-8.689192', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(245, '18TS02B0592', NULL, 'INNER', 'MACRO', 'ANTIGA KELOD', 'APR112', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.487565', '-8.530953', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KARANGASEM', 805000000, 4968600, 105000000, 240000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(246, '18TS02B0593', NULL, 'INNER', 'MACRO', 'SANGKAN GUNUNG', 'APR135', 'AREA 3', 'BALNUS', 'BALI', 'Sanjiwahana Persada', 'SST', 42, 'NL', '115.425317', '-8.469979', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BALI', 'KAB. KLUNGKUNG', 805000000, 4968600, 105000000, 225000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(247, '18TS02B0594', NULL, 'INNER', 'MACRO', 'BENDO MUNGALBANGIL', 'PSN420', 'AREA 3', 'JATIM', 'JATIM', 'Primatama Konstruksi', 'SST', 42, 'NL', '112.78725', '-7.59171', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. PASURUAN', 805000000, 5236140, 57821000, 151650000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29');
INSERT INTO `project` (`id`, `projectid`, `no_doc`, `proc`, `ubis`, `sitename`, `siteid`, `area`, `regional`, `cluster`, `mitra`, `kode_tower_depan`, `tower`, `kode_tower_belakang`, `longitude`, `latituted`, `infratype`, `towerprovider`, `provinsi`, `kabupaten`, `budget`, `sis`, `sitac`, `imb`, `lahan`, `cme`, `pln`, `addtransport`, `addpln`, `addcme`, `biayatower`, `status_id`, `filename`, `status`, `created_at`, `updated_at`) VALUES
(248, '18TS02B0595', NULL, 'INNER', 'MACRO', 'TUNJUNGTIRTOSINGOSARI1', 'MLG128', 'AREA 3', 'JATIM', 'JATIM', 'Infrako', 'SST', 42, 'NL', '112.63656', '-7.911175', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 805000000, 5236140, 62821000, 131850000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(249, '18TS02B0596', NULL, 'INNER', 'MACRO', 'KEPUHARJOKARANGPLOSO1', 'MLG127', 'AREA 3', 'JATIM', 'JATIM', 'PGN', 'SST', 42, 'NL', '112.627845', '-7.910788', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 805000000, 5236140, 62821000, 131850000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(250, '18TS02B0597', NULL, 'INNER', 'MACRO', 'PAGENTANSINGOSARI1', 'MLG125', 'AREA 3', 'JATIM', 'JATIM', 'Infrako', 'SST', 42, 'NL', '112.6593', '-7.89251', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 805000000, 5236140, 62821000, 131850000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(251, '18TS02B0598', NULL, 'INNER', 'MACRO', 'CANDIRENGGOSINGOSARI', 'MLG124', 'AREA 3', 'JATIM', 'JATIM', 'PGN', 'SST', 42, 'NL', '112.656467', '-7.889', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. MALANG', 805000000, 5236140, 62821000, 131850000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(252, '18TS02B0599', NULL, 'INNER', 'MACRO', 'BANJARSARICERME1', 'GSK366', 'AREA 3', 'JATIM', 'JATIM', 'Primatama Konstruksi', 'SST', 42, 'NL', '112.586783', '-7.181367', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA TIMUR', 'KAB. GRESIK', 805000000, 5236140, 62821000, 146700000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(253, '18TS02B0555', '6/18TS02B0555/III/2018', 'OUTER', 'MACRO', '3419_PAHAUMAN', 'NBA010', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Grand Telecom', 'SST', 42, 'NL', '109.635321', '0.271617', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KOTA PONTIANAK', 805000000, 7644000, 82637000, 125000000, 87000000, 0, 0, 0, 0, 0, 0, 86, NULL, 'FINISH', '2018-03-21 23:47:29', '2018-03-26 12:38:53'),
(254, '18TS02B0554', NULL, 'OUTER', 'MACRO', 'PT BUHUT', 'KKP002', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '114.483', '-1.12148', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KAPUAS', 805000000, 7452900, 62000000, 90000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(255, '18TS02B0553', '4/18TS02B0553/III/2018', 'OUTER', 'MACRO', '311CD15G9_SUNGAIBARU_XL', 'SBS031', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Grand Telecom', 'SST', 42, 'NL', '109.1985', '1.352888889', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. SAMBAS', 805000000, 7644000, 66150000, 125000000, 80000000, 0, 0, 0, 0, 0, 0, 87, '1522142715.pdf', 'FINISH', '2018-03-21 23:47:29', '2018-03-26 12:39:06'),
(256, '18TS02B0552', '13/18TS02B0552/III/2018', 'OUTER', 'MACRO', 'GN. MAKMUR 2', 'PNJ027', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.4139030393668', '-1.514078401808324', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 80000000, 0, 0, 0, 0, 0, 0, 133, NULL, 'REPAIR UBIS - EXECUTIVE GENERAL MANAGER', '2018-03-21 23:47:29', '2018-03-26 13:57:54'),
(257, '18TS02B0551', '11/18TS02B0551/III/2018', 'OUTER', 'MACRO', 'DS SULILIRAN BARU', 'TGT073', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.25543', '-1.98525', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 100000000, 0, 0, 0, 0, 0, 0, 113, NULL, 'CANCEL', '2018-03-21 23:47:29', '2018-03-26 13:06:03'),
(258, '18TS02B0550', '1/18TS02B0550/III/2018', 'OUTER', 'MACRO', 'PIANSAK', 'KTP096', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Nayaka', 'SST', 42, 'NL', '110.396647', '-1.70836', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KAB. KETAPANG', 805000000, 7644000, 66150000, 91000000, 100000000, 0, 0, 0, 0, 0, 0, 114, NULL, 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-21 23:47:29', '2018-03-26 13:06:49'),
(259, '18TS02B0549', '16/18TS02B0549/III/2018', 'OUTER', 'MACRO', 'MA SUBUSSALAM KUARO', 'TGT077', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.0944', '-1.81984', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 90000000, 0, 0, 0, 0, 0, 0, 126, NULL, 'PROCUREMENT - STAFF PROCUREMENT', '2018-03-21 23:47:29', '2018-03-26 13:45:15'),
(260, '18TS02B0548', '10/18TS02B0548/III/2018', 'OUTER', 'MACRO', 'SMPN 20 BALIKPAPAN', 'BPP126', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.88365', '-1.13222', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KOTA BALIKPAPAN', 805000000, 7452900, 82637000, 162000000, 80000000, 0, 0, 0, 0, 0, 0, 76, NULL, 'REPAIR UBIS - MANAGER', '2018-03-21 23:47:29', '2018-03-26 12:32:18'),
(261, '18TS02B0547', '7/18TS02B0547/III/2018', 'OUTER', 'MACRO', 'STKIP PAMANE TALINO_LS_KDI', 'NBA065', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 2 (KALBAR)', 'Grand Telecom', 'SST', 42, 'NL', '109.938236', '0.340363', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN BARAT', 'KOTA PONTIANAK', 805000000, 7644000, 82637000, 125000000, 90000000, 0, 0, 0, 0, 0, 0, 92, '1522088757.pdf', 'REPAIR UBIS - MANAGER', '2018-03-21 23:47:29', '2018-03-26 12:41:03'),
(262, '18TS02B0546', '26/18TS02B0546/III/2018', 'OUTER', 'MACRO', 'DS SEBAKUNG TAKA', 'TGT072', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.42778', '-1.56222', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KAB. PASER', 805000000, 7452900, 62137000, 63000000, 100000000, 0, 0, 0, 0, 0, 0, 117, '1522096487.pdf', 'AREA - GENERAL MANAGER AREA', '2018-03-21 23:47:29', '2018-03-26 13:35:09'),
(263, '18TS02B0545', '18/18TS02B0545/III/2018', 'OUTER', 'MACRO', 'PANGKUT II', 'KKN036', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Nayaka', 'SST', 42, 'NL', '113.918156', '-1.46631', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TENGAH', 'KAB. KAPUAS', 805000000, 7452900, 62000000, 90000000, 0, 0, 0, 0, 0, 0, 0, 118, NULL, 'REPAIR AREA - MANAGER AREA', '2018-03-21 23:47:29', '2018-03-26 13:37:36'),
(264, '18TS02B0543', '14/18TS02B0543/III/2018', 'OUTER', 'MACRO', 'PERTAMINA EP BALIKPAPAN', 'BPP046', 'AREA 4', 'KALIMANTAN', 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN) ', 'Indoteknik', 'SST', 42, 'NL', '116.87214', '-1.266262', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'KALIMANTAN TIMUR', 'KOTA BALIKPAPAN', 805000000, 7452900, 82637000, 162000000, 90000000, 0, 0, 0, 0, 0, 0, 96, NULL, 'REPAIR AREA - GENERAL MANAGER AREA', '2018-03-21 23:47:29', '2018-03-26 12:47:46'),
(265, '18TS02B0542', NULL, 'OUTER', 'MACRO', 'MCP KAMPUS STKIP WAMENA', 'WAM084', 'AREA 4', 'PUMA', 'PAPUA', 'Prasetia', 'SST', 42, 'NL', '138.944845', '-4.047568', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAWIJAYA', 805000000, 15729000, 45772200, 51300000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(266, '18TS02B0541', NULL, 'OUTER', 'MACRO', 'ASANO_4', 'JAP021', 'AREA 4', 'PUMA', 'PAPUA', 'XLA', 'SST', 42, 'NL', '140.68126', '-2.61089', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'PAPUA', 'KAB. JAYAPURA', 805000000, 15729000, 46312200, 75000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(267, '18TS02B0540', NULL, 'OUTER', 'MACRO', 'MAKASSAR_409', 'MRS159', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'XLA', 'SST', 42, 'NL', '119.530171', '-5.151087', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. MAROS', 805000000, 8516448.002999999, 49217000, 62100000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(268, '18TS02B0539', NULL, 'OUTER', 'MACRO', 'KENDARI_228', 'UNH053', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.0623522', '-3.918363577', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.002999999, 47717000, 81000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(269, '18TS02B0538', NULL, 'OUTER', 'MACRO', 'MAKASSAR_428', 'PKJ106', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '119.573695', '-4.833591', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. PANGKAJENE DAN KEPULAUAN', 805000000, 8516448.002999999, 49217000, 71100000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(270, '18TS02B0537', NULL, 'OUTER', 'MACRO', 'PARE PARE_1718', 'PLW112', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 42, 'NL', '119.205901', '-3.43668965', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. POLEWALI MANDAR', 805000000, 8516448.002999999, 48717000, 71009000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(271, '18TS02B0536', NULL, 'OUTER', 'MACRO', 'PARE PARE_1734', 'PLW120', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 42, 'NL', '119.3191188', '-3.427220147', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. POLEWALI MANDAR', 805000000, 8516448.002999999, 48717000, 71009000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(272, '18TS02B0535', NULL, 'OUTER', 'MACRO', 'KENDARI_256', 'KKA190', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Nabila Timur', 'SST', 42, 'NL', '120.9923795', '-3.317465933', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. KOLAKA', 805000000, 8516448.002999999, 47717000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(273, '18TS02B0534', NULL, 'OUTER', 'MACRO', 'KENDARI_257', 'KKA191', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Nabila Timur', 'SST', 42, 'NL', '120.9248163', '-3.372578046', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KAB. KOLAKA', 805000000, 8516448.002999999, 47717000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(274, '18TS02B0533', NULL, 'OUTER', 'MACRO', 'KENDARI_143', 'UNH044', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'GTU', 'SST', 42, 'NL', '122.053126', '-3.849057', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.002999999, 47717000, 81000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(275, '18TS02B0532', NULL, 'OUTER', 'MACRO', 'PARE PARE_1792', 'PLP231', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '120.38491', '-3.367155', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.002999999, 49217000, 76500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(276, '18TS02B0531', NULL, 'OUTER', 'MACRO', 'MAKASSAR_558', 'SIN100', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 42, 'NL', '120.247304', '-5.136587', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. SINJAI', 805000000, 8516448.002999999, 49217000, 71009000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(277, '18TS02B0530', NULL, 'OUTER', 'MACRO', 'MEARES SOPUTAN MINING', 'TDO355', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'XLA', 'SST', 42, 'NL', '125.0945', '1.5738', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. MINAHASA', 805000000, 8516448.002999999, 62000000, 100000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(278, '18TS02B0529', NULL, 'OUTER', 'MACRO', 'MAKASSAR_412', 'MRS161', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '119.63337', '-4.990129', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. MAROS', 805000000, 8516448.002999999, 49217000, 62100000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(279, '18TS02B0528', NULL, 'OUTER', 'MACRO', 'KENDARI_217', 'UNH050', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.11419', '-3.864753', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.002999999, 47717000, 81000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(280, '18TS02B0527', NULL, 'OUTER', 'MACRO', 'PARE PARE_1696', 'MAM145', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '118.914524', '-2.67541', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. MAMUJU', 805000000, 8516448.002999999, 48717000, 76500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(281, '18TS02B0526', NULL, 'OUTER', 'MACRO', 'TOB022-1', 'TOB086', 'AREA 4', 'PUMA', 'MALUKU', 'Prasetia', 'SST', 42, 'NL', '127.905803', '1.184531', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'MALUKU UTARA', 'KAB. HALMAHERA UTARA', 805000000, 13482000, 65000000, 85000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(282, '18TS02B0525', NULL, 'OUTER', 'MACRO', 'DMT RUJAB BUPATI LUWUK', 'LWK153', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'XLA', 'SST', 42, 'NL', '122.7866', '-0.997016', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGAH', 'KAB. BANGGAI', 805000000, 8516448.002999999, 47335000, 71100000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(283, '18TS02B0524', NULL, 'OUTER', 'MACRO', 'MAKASSAR_398', 'MRS157', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '119.524583', '-5.030472', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. MAROS', 805000000, 8516448.002999999, 49217000, 62100000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(284, '18TS02B0523', NULL, 'OUTER', 'MACRO', 'PARE PARE_1730', 'PLW119', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 42, 'NL', '119.2991036', '-3.378816872', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI BARAT', 'KAB. POLEWALI MANDAR', 805000000, 8516448.002999999, 48717000, 71009000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(285, '18TS02B0522', NULL, 'OUTER', 'MACRO', 'PARE PARE_1785', 'PLP228', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '120.352522', '-3.42013', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.002999999, 49217000, 76500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(286, '18TS02B0521', NULL, 'OUTER', 'MACRO', 'PARE PARE_1820', 'PLP235', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '120.3423267', '-3.385832166', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.002999999, 49217000, 76500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(287, '18TS02B0569', NULL, 'OUTER', 'MACRO', 'PARE PARE_1834', 'MAS108', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '120.524403', '-2.61503', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.002999999, 49217000, 76500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(288, '18TS02B0568', NULL, 'OUTER', 'MACRO', 'PARE PARE_1852', 'MAS114', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Amala', 'SST', 42, 'NL', '120.451686', '-2.609814', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. LUWU', 805000000, 8516448.002999999, 49217000, 76500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(289, '18TS02B0567', NULL, 'OUTER', 'MACRO', 'PARE PARE_1885', 'ENR063', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 42, 'NL', '119.754823', '-3.552974', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG', 805000000, 8516448.002999999, 49217000, 67500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(290, '18TS02B0566', NULL, 'OUTER', 'MACRO', 'PARE PARE_1890', 'ENR065', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Prasetia', 'SST', 42, 'NL', '119.865693', '-3.415933', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG', 805000000, 8516448.002999999, 49217000, 67500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(291, '18TS02B0565', NULL, 'OUTER', 'MACRO', 'PARE PARE_1940', 'ENR076', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '119.826806', '-3.416076', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG', 805000000, 8516448.002999999, 49217000, 67500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(292, '18TS02B0564', NULL, 'OUTER', 'MACRO', 'PARE PARE_1941', 'ENR077', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '119.8161368', '-3.356470269', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. ENREKANG', 805000000, 8516448.002999999, 49217000, 67500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(293, '18TS02B0563', NULL, 'OUTER', 'MACRO', 'PARE PARE_1974', 'SKG160', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 42, 'NL', '120.014335', '-4.143773', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. WAJO', 805000000, 8516448.002999999, 49217000, 71100000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(294, '18TS02B0562', NULL, 'OUTER', 'MACRO', 'GORONTALO_16', 'KTG250', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', 'SST', 42, 'NL', '124.1047124405', '0.9171579761', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. BOLAANG MONGONDOW', 805000000, 8516448.002999999, 62000000, 100000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(295, '18TS02B0561', NULL, 'OUTER', 'MACRO', 'KENDARI_118', 'UNH042', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'GTU', 'SST', 42, 'NL', '122.02594008068', '-3.8478892267933', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.002999999, 47717000, 81000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(296, '18TS02B0560', NULL, 'OUTER', 'MACRO', 'MAKASSAR_554', 'SIN099', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 42, 'NL', '120.261073', '-5.13779', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. SINJAI', 805000000, 8516448.002999999, 49217000, 71009000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(297, '18TS02B0559', NULL, 'OUTER', 'MACRO', 'KENDARI_191', 'KDI303', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'BSS', 'SST', 42, 'NL', '122.5455621', '-4.034289846', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI TENGGARA', 'KOTA KENDARI', 805000000, 8516448.002999999, 47717000, 81000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(298, '18TS02B0558', NULL, 'OUTER', 'MACRO', 'GORONTALO_21', 'KTG252', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', 'SST', 42, 'NL', '124.088607', '0.904294', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. BOLAANG MONGONDOW', 805000000, 8516448.002999999, 62000000, 100000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(299, '18TS02B0557', NULL, 'OUTER', 'MACRO', 'GORONTALO_46', 'KTG256', 'AREA 4', 'SULAWESI', 'SULUT, TENGAH, GORONTALO', 'Nahrul Arbah', 'SST', 42, 'NL', '124.024876', '0.558967', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI UTARA', 'KAB. BOLAANG MONGONDOW', 805000000, 8516448.002999999, 62000000, 100000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(300, '18TS02B0556', NULL, 'OUTER', 'MACRO', 'PARE PARE_1789', 'MLE154', 'AREA 4', 'SULAWESI', 'SULSELBARTRA', 'Asa Berkat', 'SST', 42, 'NL', '119.8797226', '-3.0106164', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'SULAWESI SELATAN', 'KAB. TANA TORAJA', 805000000, 8516448.002999999, 49217000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(301, '18TS02B0191', NULL, 'INNER', 'MACRO', 'SMA N 14 GARUT', 'GRT522', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.005162', '-7.15374', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(302, '18TS02B0192', NULL, 'INNER', 'MACRO', 'SMP N 2 PAGERAGEUNG', 'TSK927', 'AREA 2', 'JABAR', 'JABAR', 'Radik Insan Persada', 'SST', 42, 'NL', '108.181399', '-7.130898', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(303, '18TS02B0193', NULL, 'INNER', 'MACRO', 'SITUS AGUNG TAPA', 'TSK928', 'AREA 2', 'JABAR', 'JABAR', 'Radik Insan Persada', 'SST', 42, 'NL', '108.132286', '-7.192084', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(304, '18TS02B0194', NULL, 'INNER', 'MACRO', 'BADAKDAEH - RELOKPARNA', 'TSK931', 'AREA 2', 'JABAR', 'JABAR', 'Radik Insan Persada', 'SST', 42, 'NL', '108.115719', '-7.349635', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(305, '18TS02B0195', NULL, 'INNER', 'MACRO', 'PASAR GSP', 'CJR657', 'AREA 2', 'JABAR', 'JABAR', 'Tigabeka', 'SST', 42, 'NL', '107.066655', '-6.732588', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIANJUR', 805000000, 3592680, 91000000, 99000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(306, '18TS02B0196', NULL, 'INNER', 'MACRO', 'UJUNG JAYA , CIPELANG', 'SMD374', 'AREA 2', 'JABAR', 'JABAR', 'Abassy', 'SST', 42, 'NL', '107.930615', '-6.843724', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUMEDANG', 805000000, 3592680, 84683000, 88000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(307, '18TS02B0197', NULL, 'INNER', 'MACRO', 'PEMUKIMAN LINGGAPURA', 'CMS473', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.385003', '-7.193501', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(308, '18TS02B0198', NULL, 'INNER', 'MACRO', 'PEMUKIMAN CIJULANG', 'CMS476', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.197383', '-7.263086', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(309, '18TS02B0199', NULL, 'INNER', 'MACRO', 'GOLAT-KPCIWALEN', 'CMS478', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.227797', '-7.131343', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(310, '18TS02B0200', NULL, 'INNER', 'MACRO', 'JLNYAMPAY', 'BDB280', 'AREA 2', 'JABAR', 'JABAR', 'M Jusuf & Sons', 'SST', 42, 'NL', '107.64913', '-6.82009', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(311, '18TS02B0201', NULL, 'INNER', 'MACRO', 'CIGUGURGIRANG-KPCIPANJAK', 'BDB281', 'AREA 2', 'JABAR', 'JABAR', 'M Jusuf & Sons', 'SST', 42, 'NL', '107.587605', '-6.838184', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(312, '18TS02B0202', NULL, 'INNER', 'MACRO', 'DSNBAMBU', 'BDB282', 'AREA 2', 'JABAR', 'JABAR', 'M Jusuf & Sons', 'SST', 42, 'NL', '107.578709', '-6.789712', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(313, '18TS02B0203', NULL, 'INNER', 'MACRO', 'SARIREJA', 'SUB664', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.6903366667', '-6.702855', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(314, '18TS02B0204', NULL, 'INNER', 'MACRO', 'LETNAN UKIN', 'SUB666', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.775829', '-6.568318', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(315, '18TS02B0205', NULL, 'INNER', 'MACRO', 'DSSALAMJAYA-KEMBANGSARI', 'SUB667', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.614151', '-6.437243', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(316, '18TS02B0206', NULL, 'INNER', 'MACRO', 'DSNPADAHERANG-DSKRNGMULYA', 'CMS480', 'AREA 2', 'JABAR', 'JABAR', 'Jayateknik', 'SST', 42, 'NL', '108.688835', '-7.538222', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(317, '18TS02B0207', NULL, 'INNER', 'MACRO', 'PADASUKA-SAMARANG', 'GRT362', 'AREA 2', 'JABAR', 'JABAR', 'Arva Asia Partner', 'SST', 42, 'NL', '107.826891', '-7.221687', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(318, '18TS02B0208', NULL, 'INNER', 'MACRO', 'MARGAMULYASMD-LICIN', 'SMD363', 'AREA 2', 'JABAR', 'JABAR', 'Abassy', 'SST', 42, 'NL', '107.945962', '-6.808253', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUMEDANG', 805000000, 3592680, 84683000, 88000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(319, '18TS02B0209', NULL, 'INNER', 'MACRO', 'MASJID JAMI AL-IKHLAS1', 'GRT536', 'AREA 2', 'JABAR', 'JABAR', 'Wahana Lintassentra Telekomunindo', 'SST', 42, 'NL', '108.00319', '-7.220219', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(320, '18TS02B0210', NULL, 'INNER', 'MACRO', 'PEMUKIMAN PUNCAK DARAJAT', 'GRT534', 'AREA 2', 'JABAR', 'JABAR', 'Wahana Lintassentra Telekomunindo', 'SST', 42, 'NL', '107.759229', '-7.217217', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(321, '18TS02B0211', NULL, 'INNER', 'MACRO', 'MASJID AL-FALAH', 'GRT535', 'AREA 2', 'JABAR', 'JABAR', 'Wahana Lintassentra Telekomunindo', 'SST', 42, 'NL', '108.004691', '-6.984501', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. GARUT', 805000000, 3592680, 91000000, 63000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(322, '18TS02B0212', NULL, 'INNER', 'MACRO', 'PERUM SUKAHERANG SINGAPARNA', 'TSK937', 'AREA 2', 'JABAR', 'JABAR', 'Wideband Media Indonesia', 'SST', 42, 'NL', '108.098058', '-7.347097', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(323, '18TS02B0213', NULL, 'INNER', 'MACRO', 'PERUM PURWASARI CISAYONG', 'TSK938', 'AREA 2', 'JABAR', 'JABAR', 'Wideband Media Indonesia', 'SST', 42, 'NL', '108.151008', '-7.235666', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(324, '18TS02B0214', NULL, 'INNER', 'MACRO', 'PERUM SODONGHILIR', 'TSK939', 'AREA 2', 'JABAR', 'JABAR', 'Wideband Media Indonesia', 'SST', 42, 'NL', '108.083794', '-7.490293', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(325, '18TS02B0215', NULL, 'INNER', 'MACRO', 'TANJUNGJAYAWARUNGBDG', 'TSK945', 'AREA 2', 'JABAR', 'JABAR', 'Telekomindo Primakarya', 'SST', 42, 'NL', '108.119695', '-7.376069', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. TASIKMALAYA', 805000000, 3592680, 90000000, 127000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(326, '18TS02B0216', NULL, 'INNER', 'MACRO', 'KELSITU - KELKOTAKALER', 'SMD366', 'AREA 2', 'JABAR', 'JABAR', 'Abassy', 'SST', 42, 'NL', '107.920402', '-6.84635', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUMEDANG', 805000000, 3592680, 84683000, 88000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(327, '18TS02B0217', NULL, 'INNER', 'MACRO', 'PEMUKIMAN WINDURAJA', 'CMS481', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.371943', '-7.165128', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(328, '18TS02B0218', NULL, 'INNER', 'MACRO', 'PEMUKIMAN SUKAJADI', 'CMS482', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.324564', '-7.310864', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(329, '18TS02B0219', NULL, 'INNER', 'MACRO', 'PEMUKIMAN PAWINDAN', 'CMS484', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.328', '-7.33551', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(330, '18TS02B0220', NULL, 'INNER', 'MACRO', 'PEMUKIMAN CIGEMBOR', 'CMS492', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.36655', '-7.346416', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. CIAMIS', 805000000, 3592680, 90000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(331, '18TS02B0221', NULL, 'INNER', 'MACRO', 'CAGAKBRO', 'SUB674', 'AREA 2', 'JABAR', 'JABAR', 'Catra Arta Mulia', 'SST', 42, 'NL', '107.688172', '-6.66726', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUBANG', 805000000, 3592680, 94683000, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(332, '18TS02B0222', NULL, 'INNER', 'MACRO', 'KPPANGKALAN-SARIWANGI', 'BDB271', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.572098295041', '-6.85514532371041', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(333, '18TS02B0223', NULL, 'INNER', 'MACRO', 'PERTAMINABUMIPUTRA-BLOKWOTBOGOR', 'IND362', 'AREA 2', 'JABAR', 'JABAR', 'Sentosa Adi Perkasa', 'SST', 42, 'NL', '108.336274', '-6.35562', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. INDRAMAYU', 805000000, 3592680, 91000000, 87000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(334, '18TS02B0224', NULL, 'INNER', 'MACRO', 'CIHAMPELASCILILIN-SASAKBUBUR', 'BDB291', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.477545', '-6.930536', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(335, '18TS02B0225', NULL, 'INNER', 'MACRO', 'PERMANENISASIWANGUNSR', 'BDB289', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.612', '-6.84589', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(336, '18TS02B0226', NULL, 'INNER', 'MACRO', 'PERMANENISASIKAVELERIPAROMPONG', 'BDB292', 'AREA 2', 'JABAR', 'JABAR', 'Manolo Putra', 'SST', 42, 'NL', '107.58426', '-6.7956', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BANDUNG', 805000000, 3592680, 110035449.99999999, 110000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(337, '18TS02B0227', NULL, 'INNER', 'MACRO', 'TAMANBAHAGIA', 'SKB861', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Tigabeka', 'SST', 42, 'NL', '106.917583', '-6.92469', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUKABUMI', 805000000, 3592680, 104790000, 153000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(338, '18TS02B0228', NULL, 'INNER', 'MACRO', 'WANASARI', 'CKR931', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '107.084419', '-6.265153', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BEKASI', 805000000, 3592680, 97290000, 148500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(339, '18TS02B0229', NULL, 'INNER', 'MACRO', 'JLCIAULPASIR', 'SKB862', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Tigabeka', 'SST', 42, 'NL', '106.943977', '-6.923804', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. SUKABUMI', 805000000, 3592680, 104790000, 153000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(340, '18TS02B0230', NULL, 'INNER', 'MACRO', 'JLINSINYURSUTAMI', 'SRG968', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Tritama', 'SST', 42, 'NL', '106.0122728', '-6.0424922', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. SERANG', 805000000, 3592680, 109290000, 93948000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(341, '18TS02B0233', NULL, 'INNER', 'MACRO', 'LEUWINNGGUNG', 'DPK738', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.910984', '-6.396435', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(342, '18TS02B0234', NULL, 'INNER', 'MACRO', 'KAKAPSUKATANI', 'DPK741', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.892295', '-6.402716', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(343, '18TS02B0236', NULL, 'INNER', 'MACRO', 'CILENDEK', 'BOX289', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.782918', '-6.579887', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(344, '18TS02B0242', NULL, 'INNER', 'MACRO', 'COATESVILLAGE', 'CBN439', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.963489', '-6.355137', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(345, '18TS02B0243', NULL, 'INNER', 'MACRO', 'JLMANDORTADJIR', 'DPK742', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.737148', '-6.376162', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(346, '18TS02B0244', NULL, 'INNER', 'MACRO', 'PURWASARIKARAWANG', 'KRW976', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '107.408629', '-6.3908', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. KARAWANG', 805000000, 3592680, 119183000, 148500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(347, '18TS02B0245', NULL, 'INNER', 'MACRO', 'GRRENAMANI', 'PWK747', 'AREA 2', 'JABOTABEK', 'JABAR', 'Asa Berkat', 'SST', 42, 'NL', '107.441896', '-6.53087', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. PURWAKARTA', 805000000, 3592680, 110035449.99999999, 180500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(348, '18TS02B0246', NULL, 'INNER', 'MACRO', 'SUKAJAYACIBITUNG', 'CKR913', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '107.101512', '-6.237524', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BEKASI', 805000000, 3592680, 97290000, 148500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(349, '18TS02B0247', NULL, 'INNER', 'MACRO', 'JLTANAHBARU', 'BOX288', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.82243', '-6.569885', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(350, '18TS02B0250', NULL, 'INNER', 'MACRO', 'PASIRMULYA', 'KRW977', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '107.349883', '-6.321947', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. KARAWANG', 805000000, 3592680, 119183000, 148500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(351, '18TS02B0251', NULL, 'INNER', 'MACRO', 'TELAGAMURNI', 'CKR912', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '107.1104', '-6.252573', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BEKASI', 805000000, 3592680, 97290000, 148500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(352, '18TS02B0252', NULL, 'INNER', 'MACRO', 'GALUHMAS', 'KRW970', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '107.300698', '-6.33014', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. KARAWANG', 805000000, 3592680, 119183000, 148500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(353, '18TS02B0253', NULL, 'INNER', 'MACRO', 'VILLACIOMAS', 'CBN440', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.76618', '-6.586891', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(354, '18TS02B0254', NULL, 'INNER', 'MACRO', 'GRIYATELAGAPERMAI', 'DPK734', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Piranti Indonesia', 'SST', 42, 'NL', '106.858954', '-6.451123', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KOTA DEPOK', 805000000, 3592680, 120290000, 126000000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(355, '18TS02B0255', NULL, 'INNER', 'MACRO', 'PESONATAMANMONACO', 'CBN444', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Asa Berkat', 'SST', 42, 'NL', '106.957338', '-6.388794', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'JAWA BARAT', 'KAB. BOGOR', 805000000, 3592680, 120290000, 112500000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(356, '18TS02B0257', NULL, 'INNER', 'MACRO', 'JLPERANCISDADAP', 'TGR455', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '106.714391', '-6.089656', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. TANGERANG', 805000000, 3592680, 93290000, 151200000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(357, '18TS02B0258', NULL, 'INNER', 'MACRO', 'GRAHASEGOVIA', 'TGR467', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '106.53802', '-6.263701', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. TANGERANG', 805000000, 3592680, 93290000, 151200000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29'),
(358, '18TS02B0259', NULL, 'INNER', 'MACRO', 'AYANAGOLDENKARAWACI', 'TGR439', 'AREA 2', 'JABOTABEK', 'BOTABEK BANTEN', 'Jaganata Sakti Unggul', 'SST', 42, 'NL', '106.584194', '-6.25383', 'B2S', 'PT. DAYAMITRA TELEKOMUNIKASI', 'BANTEN', 'KAB. TANGERANG', 805000000, 3592680, 93290000, 151200000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'NEW', '2018-03-21 23:47:29', '2018-03-21 23:47:29');

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
(1, 258, 52, 'KALIMANTAN 2 (KALBAR)', 'TEST', '2018-03-26 09:25:26', '2018-03-26 09:25:26'),
(2, 214, 42, 'SULSELBARTRA', 'OK', '2018-03-26 10:50:04', '2018-03-26 10:50:04'),
(3, 170, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'TEST123', '2018-03-26 11:19:37', '2018-03-26 11:19:37'),
(4, 255, 42, 'KALIMANTAN 2 (KALBAR)', 'GRAND TELECOM', '2018-03-26 11:20:40', '2018-03-26 11:20:40'),
(5, 205, 42, 'PAPUA', 'PRASETIA', '2018-03-26 11:21:13', '2018-03-26 11:21:13'),
(6, 253, 42, 'KALIMANTAN 2 (KALBAR)', 'GRAND TELECOM', '2018-03-26 11:22:04', '2018-03-26 11:22:04'),
(7, 261, 42, 'KALIMANTAN 2 (KALBAR)', 'GRAND TELECOM', '2018-03-26 11:26:17', '2018-03-26 11:26:17'),
(8, 210, 42, 'SULUT, TENGAH, GORONTALO', 'XLA', '2018-03-26 11:33:53', '2018-03-26 11:33:53'),
(9, 171, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'NAYAKA', '2018-03-26 11:34:16', '2018-03-26 11:34:16'),
(10, 260, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'INDOTEKNIK', '2018-03-26 11:37:28', '2018-03-26 11:37:28'),
(11, 257, 62, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'INDOTEKNIK', '2018-03-26 11:38:43', '2018-03-26 11:38:43'),
(12, 207, 42, 'PAPUA', 'PRASETIA', '2018-03-26 11:39:19', '2018-03-26 11:39:19'),
(13, 256, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'INDOTEKNIK', '2018-03-26 11:46:41', '2018-03-26 11:46:41'),
(14, 264, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'INDOTEKNIK', '2018-03-26 11:47:53', '2018-03-26 11:47:53'),
(15, 203, 42, 'PAPUA', 'PRASETIA', '2018-03-26 11:59:20', '2018-03-26 11:59:20'),
(16, 259, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'INDOTEKNIK', '2018-03-26 12:00:28', '2018-03-26 12:00:28'),
(17, 201, 42, 'PAPUA', 'XLA', '2018-03-26 12:00:50', '2018-03-26 12:00:50'),
(18, 263, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'NAYAKA', '2018-03-26 12:05:27', '2018-03-26 12:05:27'),
(19, 199, 42, 'PAPUA', 'PRASETIA', '2018-03-26 12:09:46', '2018-03-26 12:09:46'),
(20, 216, 42, 'MALUKU', 'NAHRUL ARBAH', '2018-03-26 12:10:40', '2018-03-26 12:10:40'),
(21, 215, 42, 'SULSELBARTRA', 'BSS', '2018-03-26 12:19:42', '2018-03-26 12:19:42'),
(22, 196, 42, 'PAPUA', 'ABC', '2018-03-26 12:50:39', '2018-03-26 12:50:39'),
(23, 195, 42, 'PAPUA', 'AMALA', '2018-03-26 12:50:55', '2018-03-26 12:50:55'),
(24, 213, 42, 'SULUT, TENGAH, GORONTALO', 'ASA BERKAT', '2018-03-26 12:52:48', '2018-03-26 12:52:48'),
(25, 206, 42, 'PAPUA', 'PRASETIA', '2018-03-26 13:32:01', '2018-03-26 13:32:01'),
(26, 262, 62, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'INDOTEKNIK', '2018-03-26 13:35:09', '2018-03-26 13:35:09'),
(27, 211, 42, 'SULSELBARTRA', 'BSS', '2018-03-26 20:49:35', '2018-03-26 20:49:35'),
(28, 172, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'TEST1233', '2018-03-27 02:25:47', '2018-03-27 02:25:47'),
(29, 176, 42, 'KALIMANTAN 1 (KALSELTENG, KALTIM BAG. SELATAN)', 'PRESETIA', '2018-03-27 03:11:28', '2018-03-27 03:11:28');

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
(29, 10, 'TEST', 'LS', 10, 500000, '2018-03-26 12:26:43', '2018-03-26 12:26:43'),
(30, 10, 'TIANG', 'LS', 80, 60000, '2018-03-26 12:26:43', '2018-03-26 12:26:43'),
(40, 6, 'C', 'LS', 1, 8100000, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(41, 4, 'A', 'LS', 1, 9000000, '2018-03-26 12:39:05', '2018-03-26 12:39:05'),
(42, 4, 'B', 'LS', 1, 8000000, '2018-03-26 12:39:05', '2018-03-26 12:39:05'),
(43, 14, 'TRACE', 'LS', 1, 9000000, '2018-03-26 12:45:39', '2018-03-26 12:45:39'),
(45, 13, 'A', 'LS', 1, 90000000, '2018-03-26 13:04:23', '2018-03-26 13:04:23'),
(46, 26, 'A', 'LS', 1, 5000000, '2018-03-26 13:35:09', '2018-03-26 13:35:09'),
(48, 16, 'A', 'LS', 1, 987500, '2018-03-26 13:45:15', '2018-03-26 13:45:15');

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
(22, 18, 7046, 3539593.71, 18100, 38104529, 48411899, 22, 7789358, 60560600, 40908403, 33675900, '2018-03-26 12:05:27', '2018-03-26 12:05:27'),
(31, 10, 7046, 3539593.71, 18100, 38104529, 48411899, 22, 7789358, 60560600, 40908403, 33675900, '2018-03-26 12:26:43', '2018-03-26 12:26:43'),
(43, 6, 7046, 3428734.2, 18100, 44721484, 49657911, 22, 7575153, 62431900, 39627144, 33675900, '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(44, 4, 7046, 3428734.2, 18100, 44721484, 49657911, 22, 7575153, 62431900, 39627144, 33675900, '2018-03-26 12:39:06', '2018-03-26 12:39:06'),
(45, 7, 7046, 3428734.2, 18100, 44721484, 49657911, 22, 7575153, 62431900, 39627144, 33675900, '2018-03-26 12:40:37', '2018-03-26 12:40:37'),
(46, 14, 7046, 3539593.71, 18100, 38104529, 48411899, 22, 7789358, 60560600, 40908403, 33675900, '2018-03-26 12:45:39', '2018-03-26 12:45:39'),
(50, 11, 13448, 3539593.71, 18100, 59644299, 92398982, 34, 7789358, 62803100, 40908403, 33675900, '2018-03-26 13:03:48', '2018-03-26 13:03:48'),
(51, 13, 7046, 3539593.71, 18100, 38104529, 48411899, 22, 7789358, 60560600, 40908403, 33675900, '2018-03-26 13:04:23', '2018-03-26 13:04:23'),
(52, 1, 9649, 3428734.2, 18100, 53193848, 68003006, 25, 7575153, 62993400, 39627144, 33675900, '2018-03-26 13:06:48', '2018-03-26 13:06:48'),
(53, 26, 13448, 3539593.71, 18100, 59644299, 92398982, 34, 7789358, 62803100, 40908403, 33675900, '2018-03-26 13:35:09', '2018-03-26 13:35:09'),
(55, 16, 7046, 3539593.71, 18100, 38104529, 48411899, 22, 7789358, 60560600, 40908403, 33675900, '2018-03-26 13:45:15', '2018-03-26 13:45:15');

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
(1, 258, 27, 'APPROVED', 'ok', '2018-03-26 09:25:26', '2018-03-26 09:25:26'),
(2, 214, 27, 'APPROVED', 'ok', '2018-03-26 10:50:04', '2018-03-26 10:50:04'),
(3, 170, 27, 'APPROVED', 'data sudah ok', '2018-03-26 11:19:37', '2018-03-26 11:19:37'),
(4, 255, 27, 'APPROVED', 'sudah ok', '2018-03-26 11:20:40', '2018-03-26 11:20:40'),
(5, 205, 27, 'APPROVED', 'sudah ok', '2018-03-26 11:21:13', '2018-03-26 11:21:13'),
(6, 253, 27, 'APPROVED', 'ok', '2018-03-26 11:22:04', '2018-03-26 11:22:04'),
(7, 261, 27, 'APPROVED', 'sudak ok', '2018-03-26 11:26:17', '2018-03-26 11:26:17'),
(8, 255, 28, 'APPROVED', 'sudah ok juga', '2018-03-26 11:33:04', '2018-03-26 11:33:04'),
(9, 210, 27, 'APPROVED', 'ok', '2018-03-26 11:33:53', '2018-03-26 11:33:53'),
(10, 171, 27, 'APPROVED', 'ok', '2018-03-26 11:34:16', '2018-03-26 11:34:16'),
(11, 260, 27, 'APPROVED', 'sudah ok', '2018-03-26 11:37:28', '2018-03-26 11:37:28'),
(12, 257, 27, 'APPROVED', 'percobaan tinggi tower', '2018-03-26 11:38:43', '2018-03-26 11:38:43'),
(13, 207, 27, 'APPROVED', 'ok', '2018-03-26 11:39:18', '2018-03-26 11:39:18'),
(14, 171, 28, 'APPROVED', 'ok', '2018-03-26 11:40:03', '2018-03-26 11:40:03'),
(15, 253, 28, 'APPROVED', 'ok', '2018-03-26 11:45:06', '2018-03-26 11:45:06'),
(16, 256, 27, 'APPROVED', 'sudah maksimal', '2018-03-26 11:46:41', '2018-03-26 11:46:41'),
(17, 264, 27, 'APPROVED', 'sudah ok', '2018-03-26 11:47:53', '2018-03-26 11:47:53'),
(18, 170, 28, 'APPROVED', 'ok', '2018-03-26 11:48:15', '2018-03-26 11:48:15'),
(19, 258, 28, 'APPROVED', 'setuju', '2018-03-26 11:48:37', '2018-03-26 11:48:37'),
(20, 261, 28, 'APPROVED', 'setuju', '2018-03-26 11:49:20', '2018-03-26 11:49:20'),
(21, 256, 28, 'APPROVED', 'setuju', '2018-03-26 11:57:01', '2018-03-26 11:57:01'),
(22, 264, 28, 'APPROVED', 'setuju', '2018-03-26 11:57:11', '2018-03-26 11:57:11'),
(23, 210, 28, 'APPROVED', 'setuju', '2018-03-26 11:57:22', '2018-03-26 11:57:22'),
(24, 214, 28, 'APPROVED', 'setuju', '2018-03-26 11:57:33', '2018-03-26 11:57:33'),
(25, 260, 28, 'APPROVED', 'setuju', '2018-03-26 11:57:54', '2018-03-26 11:57:54'),
(26, 203, 27, 'APPROVED', 'sudah dicoba', '2018-03-26 11:59:20', '2018-03-26 11:59:20'),
(27, 259, 27, 'APPROVED', 'sudah ok', '2018-03-26 12:00:28', '2018-03-26 12:00:28'),
(28, 201, 27, 'APPROVED', 'sudah maksimal', '2018-03-26 12:00:50', '2018-03-26 12:00:50'),
(29, 171, 29, 'APPROVED', 'setuju', '2018-03-26 12:01:41', '2018-03-26 12:01:41'),
(30, 214, 29, 'APPROVED', 'setuju', '2018-03-26 12:01:52', '2018-03-26 12:01:52'),
(31, 170, 29, 'APPROVED', 'setuju', '2018-03-26 12:02:59', '2018-03-26 12:02:59'),
(32, 210, 29, 'APPROVED', 'setuju', '2018-03-26 12:03:16', '2018-03-26 12:03:16'),
(33, 253, 29, 'APPROVED', 'setuju', '2018-03-26 12:03:32', '2018-03-26 12:03:32'),
(34, 264, 29, 'APPROVED', 'setuju', '2018-03-26 12:03:45', '2018-03-26 12:03:45'),
(35, 256, 29, 'APPROVED', 'setuju', '2018-03-26 12:03:54', '2018-03-26 12:03:54'),
(36, 258, 29, 'APPROVED', 'setuju', '2018-03-26 12:04:06', '2018-03-26 12:04:06'),
(37, 255, 29, 'APPROVED', 'setuju', '2018-03-26 12:04:17', '2018-03-26 12:04:17'),
(38, 263, 27, 'APPROVED', 'sudah ok', '2018-03-26 12:05:26', '2018-03-26 12:05:26'),
(39, 214, 30, 'APPROVED', 'setuju', '2018-03-26 12:06:44', '2018-03-26 12:06:44'),
(40, 253, 30, 'APPROVED', 'ok', '2018-03-26 12:07:29', '2018-03-26 12:07:29'),
(41, 256, 30, 'REPAIR', 'sewa lahan masa kosong', '2018-03-26 12:08:05', '2018-03-26 12:08:05'),
(42, 210, 30, 'APPROVED', 'setuju', '2018-03-26 12:08:20', '2018-03-26 12:08:20'),
(43, 255, 30, 'APPROVED', 'ok', '2018-03-26 12:08:47', '2018-03-26 12:08:47'),
(44, 199, 27, 'APPROVED', 'sudah maksimal', '2018-03-26 12:09:45', '2018-03-26 12:09:45'),
(45, 216, 27, 'APPROVED', 'sudah ok', '2018-03-26 12:10:40', '2018-03-26 12:10:40'),
(46, 201, 28, 'REPAIR', 'tolong ditawar lagih harga lahan', '2018-03-26 12:13:12', '2018-03-26 12:13:12'),
(47, 215, 27, 'APPROVED', 'sudah ok', '2018-03-26 12:19:42', '2018-03-26 12:19:42'),
(48, 257, 28, 'APPROVED', 'sudah maksimal', '2018-03-26 12:20:38', '2018-03-26 12:20:38'),
(49, 215, 28, 'APPROVED', 'setuju', '2018-03-26 12:20:50', '2018-03-26 12:20:50'),
(50, 256, 29, 'APPROVED', 'setuju', '2018-03-26 12:21:03', '2018-03-26 12:21:03'),
(51, 260, 29, 'APPROVED', 'penambahan data sewa lahan', '2018-03-26 12:21:33', '2018-03-26 12:21:33'),
(52, 205, 28, 'APPROVED', 'ok', '2018-03-26 12:21:56', '2018-03-26 12:21:56'),
(53, 207, 28, 'APPROVED', 'ok', '2018-03-26 12:22:09', '2018-03-26 12:22:09'),
(54, 216, 28, 'APPROVED', 'ok', '2018-03-26 12:22:26', '2018-03-26 12:22:26'),
(55, 259, 28, 'APPROVED', 'ok', '2018-03-26 12:22:36', '2018-03-26 12:22:36'),
(56, 216, 29, 'APPROVED', 'ok', '2018-03-26 12:22:53', '2018-03-26 12:22:53'),
(57, 261, 29, 'APPROVED', 'ok', '2018-03-26 12:23:05', '2018-03-26 12:23:05'),
(58, 216, 30, 'APPROVED', 'setuju', '2018-03-26 12:24:34', '2018-03-26 12:24:34'),
(59, 256, 30, 'APPROVED', 'setuju', '2018-03-26 12:24:58', '2018-03-26 12:24:58'),
(60, 170, 30, 'REPAIR', 'kurangi harga sewa lahan', '2018-03-26 12:25:29', '2018-03-26 12:25:29'),
(61, 170, 29, 'REPAIR', 'pak harry minta harga sewa lahan dikurangi', '2018-03-26 12:26:09', '2018-03-26 12:26:09'),
(62, 171, 30, 'APPROVED', 'ok', '2018-03-26 12:26:24', '2018-03-26 12:26:24'),
(63, 260, 30, 'APPROVED', 'setuju', '2018-03-26 12:26:43', '2018-03-26 12:26:43'),
(64, 261, 30, 'APPROVED', 'setuju', '2018-03-26 12:27:02', '2018-03-26 12:27:02'),
(65, 210, 31, 'APPROVED', 'ok', '2018-03-26 12:28:04', '2018-03-26 12:28:04'),
(66, 214, 31, 'APPROVED', 'ok', '2018-03-26 12:28:39', '2018-03-26 12:28:39'),
(67, 253, 31, 'APPROVED', 'ok', '2018-03-26 12:29:04', '2018-03-26 12:29:04'),
(68, 216, 31, 'APPROVED', 'ok', '2018-03-26 12:29:16', '2018-03-26 12:29:16'),
(69, 261, 31, 'APPROVED', 'ok', '2018-03-26 12:29:51', '2018-03-26 12:29:51'),
(70, 255, 31, 'APPROVED', 'ok', '2018-03-26 12:30:02', '2018-03-26 12:30:02'),
(71, 256, 31, 'APPROVED', 'ok', '2018-03-26 12:30:22', '2018-03-26 12:30:22'),
(72, 258, 30, 'APPROVED', 'sudah ok pak', '2018-03-26 12:30:49', '2018-03-26 12:30:49'),
(73, 264, 30, 'APPROVED', 'setuju', '2018-03-26 12:31:02', '2018-03-26 12:31:02'),
(74, 171, 31, 'APPROVED', 'ok', '2018-03-26 12:31:25', '2018-03-26 12:31:25'),
(75, 260, 31, 'REPAIR', 'kamu perbaiki lagih', '2018-03-26 12:31:51', '2018-03-26 12:31:51'),
(76, 260, 30, 'REPAIR', 'perbaiki sewa lahan', '2018-03-26 12:32:18', '2018-03-26 12:32:18'),
(77, 264, 31, 'APPROVED', 'sudah ok', '2018-03-26 12:32:44', '2018-03-26 12:32:44'),
(78, 258, 31, 'APPROVED', 'persetujuannya pak untuk capes ini', '2018-03-26 12:33:05', '2018-03-26 12:33:05'),
(79, 171, 33, 'APPROVED', 'ok', '2018-03-26 12:34:31', '2018-03-26 12:34:31'),
(80, 214, 33, 'APPROVED', 'ok', '2018-03-26 12:34:43', '2018-03-26 12:34:43'),
(81, 255, 33, 'APPROVED', 'ok', '2018-03-26 12:34:55', '2018-03-26 12:34:55'),
(82, 216, 33, 'APPROVED', 'ok', '2018-03-26 12:35:17', '2018-03-26 12:35:17'),
(83, 253, 33, 'APPROVED', 'ok', '2018-03-26 12:35:28', '2018-03-26 12:35:28'),
(84, 214, 34, 'APPROVED', 'ok', '2018-03-26 12:36:43', '2018-03-26 12:36:43'),
(85, 216, 34, 'APPROVED', 'ok', '2018-03-26 12:36:58', '2018-03-26 12:36:58'),
(86, 253, 34, 'APPROVED', 'ok', '2018-03-26 12:38:53', '2018-03-26 12:38:53'),
(87, 255, 34, 'APPROVED', 'ok', '2018-03-26 12:39:05', '2018-03-26 12:39:05'),
(88, 171, 34, 'REPAIR', 'perbaiki lagih', '2018-03-26 12:39:32', '2018-03-26 12:39:32'),
(89, 256, 33, 'REPAIR', 'minta pernaikan data pak untuk sewa lahannya', '2018-03-26 12:40:05', '2018-03-26 12:40:05'),
(90, 210, 33, 'APPROVED', 'ok', '2018-03-26 12:40:20', '2018-03-26 12:40:20'),
(91, 261, 33, 'APPROVED', 'ok', '2018-03-26 12:40:37', '2018-03-26 12:40:37'),
(92, 261, 34, 'REPAIR', 'perbaiki', '2018-03-26 12:41:03', '2018-03-26 12:41:03'),
(93, 210, 34, 'REPAIR', 'perbaki lagih', '2018-03-26 12:44:32', '2018-03-26 12:44:32'),
(94, 264, 33, 'APPROVED', 'ok', '2018-03-26 12:45:39', '2018-03-26 12:45:39'),
(95, 264, 34, 'REPAIR', 'perbaiki lagih', '2018-03-26 12:47:04', '2018-03-26 12:47:04'),
(96, 264, 33, 'REPAIR', 'perbaikan di sewa lahan pak', '2018-03-26 12:47:46', '2018-03-26 12:47:46'),
(97, 196, 27, 'APPROVED', 'ok', '2018-03-26 12:50:39', '2018-03-26 12:50:39'),
(98, 195, 27, 'APPROVED', 'ok', '2018-03-26 12:50:55', '2018-03-26 12:50:55'),
(99, 213, 27, 'APPROVED', 'ok', '2018-03-26 12:52:48', '2018-03-26 12:52:48'),
(100, 203, 28, 'APPROVED', 'setuju', '2018-03-26 12:53:29', '2018-03-26 12:53:29'),
(101, 196, 28, 'APPROVED', 'setuju', '2018-03-26 12:53:40', '2018-03-26 12:53:40'),
(102, 195, 28, 'APPROVED', 'setuju', '2018-03-26 12:54:14', '2018-03-26 12:54:14'),
(103, 259, 29, 'APPROVED', 'ok', '2018-03-26 12:54:59', '2018-03-26 12:54:59'),
(104, 195, 29, 'APPROVED', 'ok', '2018-03-26 12:55:10', '2018-03-26 12:55:10'),
(105, 205, 29, 'APPROVED', 'ok', '2018-03-26 12:55:22', '2018-03-26 12:55:22'),
(106, 257, 29, 'APPROVED', 'sudah maksimal', '2018-03-26 12:55:35', '2018-03-26 12:55:35'),
(107, 257, 30, 'APPROVED', 'minta persetujuan direktur', '2018-03-26 13:02:34', '2018-03-26 13:02:34'),
(108, 203, 29, 'APPROVED', 'persetujuan direktur', '2018-03-26 13:03:00', '2018-03-26 13:03:00'),
(109, 257, 31, 'APPROVED', 'minta persetujuan direktur', '2018-03-26 13:03:48', '2018-03-26 13:03:48'),
(110, 256, 31, 'APPROVED', 'sudah ok', '2018-03-26 13:04:23', '2018-03-26 13:04:23'),
(111, 205, 30, 'APPROVED', 'ok', '2018-03-26 13:04:33', '2018-03-26 13:04:33'),
(112, 203, 30, 'APPROVED', 'persetujuan direktur', '2018-03-26 13:04:47', '2018-03-26 13:04:47'),
(113, 257, 32, 'CANCEL', 'dibatalkan projetc yah', '2018-03-26 13:06:02', '2018-03-26 13:06:02'),
(114, 258, 32, 'APPROVED', 'masih ok', '2018-03-26 13:06:48', '2018-03-26 13:06:48'),
(115, 195, 30, 'APPROVED', 'ok', '2018-03-26 13:07:05', '2018-03-26 13:07:05'),
(116, 206, 27, 'APPROVED', 'data sudah ok', '2018-03-26 13:32:01', '2018-03-26 13:32:01'),
(117, 262, 27, 'APPROVED', 'data sudah maksimal', '2018-03-26 13:35:09', '2018-03-26 13:35:09'),
(118, 263, 28, 'REPAIR', 'data sewa lahan masih kosong', '2018-03-26 13:37:36', '2018-03-26 13:37:36'),
(119, 213, 28, 'APPROVED', 'setuju', '2018-03-26 13:37:59', '2018-03-26 13:37:59'),
(120, 215, 29, 'APPROVED', 'setuju', '2018-03-26 13:39:40', '2018-03-26 13:39:40'),
(121, 196, 29, 'REPAIR', 'bisakah ddddana CME kita kurangi ?', '2018-03-26 13:40:23', '2018-03-26 13:40:23'),
(122, 259, 30, 'APPROVED', 'data sudah ok', '2018-03-26 13:42:37', '2018-03-26 13:42:37'),
(123, 215, 30, 'APPROVED', 'setuju', '2018-03-26 13:43:05', '2018-03-26 13:43:05'),
(124, 207, 29, 'APPROVED', 'sudah maksimal', '2018-03-26 13:43:45', '2018-03-26 13:43:45'),
(125, 207, 30, 'APPROVED', 'ok', '2018-03-26 13:44:01', '2018-03-26 13:44:01'),
(126, 259, 31, 'APPROVED', 'setuju', '2018-03-26 13:45:15', '2018-03-26 13:45:15'),
(127, 195, 31, 'APPROVED', 'kami meminta persetujuan direktur, karna harga tidak dibawah pasaran', '2018-03-26 13:46:19', '2018-03-26 13:46:19'),
(128, 203, 31, 'APPROVED', 'kami meminta persetujuan direktur karna harga diatas harga standard', '2018-03-26 13:50:46', '2018-03-26 13:50:46'),
(129, 205, 31, 'REPAIR', 'perbaiki nilai CME sehingga tindak meminta persetujuan direktur', '2018-03-26 13:51:27', '2018-03-26 13:51:27'),
(130, 203, 32, 'CANCEL', 'project dibatalkan', '2018-03-26 13:53:10', '2018-03-26 13:53:10'),
(131, 195, 32, 'APPROVED', 'project di lanjutkan', '2018-03-26 13:53:45', '2018-03-26 13:53:45'),
(132, 195, 33, 'APPROVED', 'sudah ada persetujuan direktur', '2018-03-26 13:57:15', '2018-03-26 13:57:15'),
(133, 256, 33, 'REPAIR', 'kami meminta data lampiran IMB', '2018-03-26 13:57:54', '2018-03-26 13:57:54'),
(134, 195, 34, 'APPROVED', 'data sudah final', '2018-03-26 13:59:20', '2018-03-26 13:59:20'),
(135, 211, 27, 'APPROVED', 'data sudah masuk semua', '2018-03-26 20:49:35', '2018-03-26 20:49:35'),
(136, 211, 28, 'APPROVED', 'setuju', '2018-03-26 20:52:56', '2018-03-26 20:52:56'),
(137, 211, 29, 'APPROVED', 'setuju', '2018-03-26 20:55:19', '2018-03-26 20:55:19'),
(138, 211, 30, 'APPROVED', 'setuju', '2018-03-26 20:57:17', '2018-03-26 20:57:17'),
(139, 211, 31, 'APPROVED', 'setuju', '2018-03-26 20:58:37', '2018-03-26 20:58:37'),
(140, 172, 27, 'APPROVED', 'sudah ok', '2018-03-27 02:25:47', '2018-03-27 02:25:47'),
(141, 176, 27, 'APPROVED', 'ok', '2018-03-27 03:11:28', '2018-03-27 03:11:28'),
(142, 215, 31, 'APPROVED', 'setuju', '2018-03-27 03:17:51', '2018-03-27 03:17:51');

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
  `level` enum('WASPANG','GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA','MANAGER UBIS','GENERAL MANAGER UBIS','EXECUTIVE GENERAL MANAGER UBIS','STAFF PROCUREMENT','MANAGER PROCUREMENT','DIRECTOR','ADMINISTRATOR') COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'ADMIN 12345', 'nugrohoaditya10@gmail.com', '$2y$10$z7k3CF0a60j.XwMLr4KoBeWYKO3AL8Kgh0Zo0Nav7FLRqVBZFK5PW', '827ccb0eea8a706c4c34a16891f84e7b', 'STAFF PROCUREMENT', 'AREA 4', NULL, 'vxKYCUcmmDbucrIid9qLSgQ1LStjUvYp61JcesCqpupW8AmKw0RcjErsuF1L', '2017-10-31 17:00:00', '2018-03-23 05:19:34'),
(27, 'ARIF ROCHMAN', 'arif.rochman@mitratel.co.id', '$2y$10$D8GWAqZ9RebXnbNGnh0xKOAV3s0MdyWY9yLlo/7Y8fUNBdfhWW8z2', '3e60e013ab6148896a6eba07895d8dcb', 'MANAGER AREA', 'AREA 4', NULL, 'Up8AYb4FtGK8nN8NQXniHiol1pGZZQkTQLHADmrvPmULx0sPCIRQBAeEE3r0', '2018-03-18 23:39:19', '2018-03-23 04:36:54'),
(28, 'IWAN ADJI', 'iwan@mitratel.co.id', '$2y$10$W.YwSmfHguTX10o/G/vqc.7sFeJb1f4c.nxlQ46XaxcqQFVFp2TgC', '3e60e013ab6148896a6eba07895d8dcb', 'GENERAL MANAGER AREA', 'AREA 4', NULL, 'a21fLdqEd6F3Khk19xELN6aZoBGiSGswUtZvigRmaRw4nNRnEIuIvpMCcwdU', '2018-03-18 23:40:34', '2018-03-18 23:40:34'),
(29, 'RUDI ALBERT', 'rudi.albert@mitratel.co.id', '$2y$10$IpAWJhdgS0IXK8vc8NGrcufVKO6RP6DJpw1S6Y8hV4eCVBdDDEwJy', '3e60e013ab6148896a6eba07895d8dcb', 'MANAGER UBIS', 'AREA 1', 'AREA 4', 'CCd7QkN9m9mcJQndVEy5yDJvGgReUH0gZ42pQBWyTnIW4qnSTJRDqJf4Wdgp', '2018-03-18 23:41:35', '2018-03-23 05:19:22'),
(30, 'HARRY RAMDAN', 'harry.ramdan@mitratel.co.id', '$2y$10$i6pjcPp08g1YQoTsJ3dZFuyUrKoHgxEG1lSYXGZLPa8BTpm127maW', '3e60e013ab6148896a6eba07895d8dcb', 'GENERAL MANAGER UBIS', '', NULL, 'Wcb1fhKBIO25fjPW8OahOkHVq9GEZmEy9VmDLdhANxwOCJ3wNgf0nsB0vrWH', '2018-03-18 23:42:38', '2018-03-18 23:42:38'),
(31, 'EDY SUSILO', 'edy.susilo@mitratel.co.id', '$2y$10$b3pvRB6C95Q7dOi/4Yzs9evUDKbeI1McfU/PEpZCJ0gkmDE2ouJSW', '3e60e013ab6148896a6eba07895d8dcb', 'EXECUTIVE GENERAL MANAGER UBIS', '', NULL, '9r7VKyuny4cpMHHtBFVWBU5OVYLjnAQl6TAkJlQG5B6eY02kUHMqJtEW1vq1', '2018-03-18 23:43:17', '2018-03-18 23:43:17'),
(32, 'THEODORUS ARDI HARTOKO', 'teddy.hartoko@mitratel.co.id', '$2y$10$EyLTv9IyRzjQDWs8HrkZ0.T0mJZVa5a9XtS/7yq9.pv9JCiN4GVrW', '3e60e013ab6148896a6eba07895d8dcb', 'DIRECTOR', '', NULL, 'RvHFnUmAqK9G06bLvfIXjg8s5Dse9nRMav5giCYlpmIfYYsuXEBcS4nIkhmF', '2018-03-18 23:44:39', '2018-03-18 23:44:39'),
(33, 'IHSAN PERBAWA GINANJAR', 'ihsan.pg@mitratel.co.id', '$2y$10$fU3s8r.Cdj1zxss1sK6/kuoMyytjihvpxuW6argLmBe740ke28ZrG', '3e60e013ab6148896a6eba07895d8dcb', 'STAFF PROCUREMENT', 'AREA 4', NULL, 'Kp6gjcbRJqaZS9TGXEm4GaLuJIt1TqmZ6JYrOYOcUQgpHolOmGF0ajDRlaey', '2018-03-18 23:45:22', '2018-03-18 23:45:22'),
(34, 'MOHAMMAD ALI AKBAR', 'mohammad.ali@mitratel.co.id', '$2y$10$inQeHx.ENWSGOwn9Yj53aeaL1kSdOzlH1VaU7vYWJuBGStgjUB.8W', '3e60e013ab6148896a6eba07895d8dcb', 'MANAGER PROCUREMENT', '', NULL, 'J4uI5EYC1MDftC4VM9AY5ZwGdrJbfjaajkIkRrLy2SJuDrTNATVyTxM8VZoh', '2018-03-18 23:46:13', '2018-03-18 23:46:13'),
(35, 'TEST123', 'test@test.com', '$2y$10$HolbWD2bTy4RwJ/qIl66Ae7B5NdWmujVXCOxZcTI7GWSzNohAHEZm', 'e10adc3949ba59abbe56e057f20f883e', 'MANAGER UBIS', '', NULL, NULL, '2018-03-23 04:40:37', '2018-03-23 04:40:37');

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
,`biayastandard` double(17,0)
,`biayaadditional` double(17,0)
,`capex` double
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
,`total` double(17,0)
,`created_at` timestamp
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
,`total` double(17,0)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprojectstatus`
-- (See below for the actual view)
--
CREATE TABLE `vprojectstatus` (
`project_id` int(11)
,`status` varchar(255)
,`created_at` timestamp
,`name` varchar(255)
,`level` enum('WASPANG','GENERAL MANAGER AREA','PROJECT MANAGER AREA','MANAGER AREA','MANAGER UBIS','GENERAL MANAGER UBIS','EXECUTIVE GENERAL MANAGER UBIS','STAFF PROCUREMENT','MANAGER PROCUREMENT','DIRECTOR','ADMINISTRATOR')
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
-- Structure for view `varea`
--
DROP TABLE IF EXISTS `varea`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `varea`  AS  select distinct `project`.`area` AS `area` from `project` ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojecareatutp`
--
DROP TABLE IF EXISTS `vavgprojecareatutp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojecareatutp`  AS  select `vprojectimplementation`.`area` AS `area`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capex`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun` from `vprojectimplementation` where ((`vprojectimplementation`.`infratype` = 'UNTAPPED') and (`vprojectimplementation`.`status` = 'FINISH')) group by `vprojectimplementation`.`area`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojecnstutp`
--
DROP TABLE IF EXISTS `vavgprojecnstutp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojecnstutp`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capex`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun` from `vprojectimplementation` where ((`vprojectimplementation`.`infratype` = 'UNTAPPED') and (`vprojectimplementation`.`status` = 'FINISH')) group by `vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojecregionaltutp`
--
DROP TABLE IF EXISTS `vavgprojecregionaltutp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojecregionaltutp`  AS  select `vprojectimplementation`.`regional` AS `regional`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capex`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun` from `vprojectimplementation` where ((`vprojectimplementation`.`infratype` = 'UNTAPPED') and (`vprojectimplementation`.`status` = 'FINISH')) group by `vprojectimplementation`.`regional`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojectareab2s`
--
DROP TABLE IF EXISTS `vavgprojectareab2s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojectareab2s`  AS  select `vprojectimplementation`.`area` AS `area`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capex`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun` from `vprojectimplementation` where ((`vprojectimplementation`.`infratype` = 'B2S') and (`vprojectimplementation`.`status` = 'FINISH')) group by `vprojectimplementation`.`area`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojectnsb2s`
--
DROP TABLE IF EXISTS `vavgprojectnsb2s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojectnsb2s`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capex`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun` from `vprojectimplementation` where ((`vprojectimplementation`.`infratype` = 'B2S') and (`vprojectimplementation`.`status` = 'FINISH')) group by `vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

-- --------------------------------------------------------

--
-- Structure for view `vavgprojectregionalb2s`
--
DROP TABLE IF EXISTS `vavgprojectregionalb2s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vavgprojectregionalb2s`  AS  select `vprojectimplementation`.`regional` AS `regional`,`vprojectimplementation`.`infratype` AS `infratype`,avg(`vprojectimplementation`.`budget`) AS `budget`,avg(`vprojectimplementation`.`capex`) AS `capex`,year(`vprojectimplementation`.`created_at`) AS `tahun` from `vprojectimplementation` where ((`vprojectimplementation`.`infratype` = 'B2S') and (`vprojectimplementation`.`status` = 'FINISH')) group by `vprojectimplementation`.`regional`,`vprojectimplementation`.`infratype`,year(`vprojectimplementation`.`created_at`) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_area`  AS  select `vprojectimplementation`.`area` AS `area`,`vprojectimplementation`.`infratype` AS `infratype`,ifnull(sum(`vprojectimplementation`.`budget`),0) AS `budgetNya`,ifnull(sum(`vprojectimplementation`.`capex`),0) AS `capexNya`,count(`vprojectimplementation`.`area`) AS `total` from `vprojectimplementation` where (`vprojectimplementation`.`status` = 'FINISH') group by `vprojectimplementation`.`area`,`vprojectimplementation`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_nasional`
--
DROP TABLE IF EXISTS `vplafon_capex_nasional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_nasional`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,ifnull(sum(`vprojectimplementation`.`budget`),0) AS `budgetNya`,ifnull(sum(`vprojectimplementation`.`capex`),0) AS `capexNya`,count(`vprojectimplementation`.`budget`) AS `total` from `vprojectimplementation` where (`vprojectimplementation`.`status` = 'FINISH') group by `vprojectimplementation`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_nasional_home`
--
DROP TABLE IF EXISTS `vplafon_capex_nasional_home`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_nasional_home`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,ifnull(avg(`vprojectimplementation`.`budget`),0) AS `budgetNya`,ifnull(avg(`vprojectimplementation`.`capex`),0) AS `capexNya` from `vprojectimplementation` where (`vprojectimplementation`.`status` = 'FINISH') group by `vprojectimplementation`.`infratype` ;

-- --------------------------------------------------------

--
-- Structure for view `vplafon_capex_regional`
--
DROP TABLE IF EXISTS `vplafon_capex_regional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vplafon_capex_regional`  AS  select `vprojectimplementation`.`infratype` AS `infratype`,`vprojectimplementation`.`regional` AS `regional`,ifnull(sum(`vprojectimplementation`.`budget`),0) AS `budgetNya`,ifnull(sum(`vprojectimplementation`.`capex`),0) AS `capexNya`,count(`vprojectimplementation`.`regional`) AS `total` from `vprojectimplementation` where (`vprojectimplementation`.`status` = 'FINISH') group by `vprojectimplementation`.`infratype`,`vprojectimplementation`.`regional` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectall`
--
DROP TABLE IF EXISTS `vprojectall`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectall`  AS  select `project`.`id` AS `id`,`project`.`projectid` AS `projectid`,`project`.`no_doc` AS `no_doc`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,(case when (`project`.`infratype` = 'UNTAPPED') then convert(concat('GM ',`project`.`tower`,' M') using latin1) else concat(`project`.`kode_tower_depan`,' ',`project`.`tower`,' ',`project`.`kode_tower_belakang`) end) AS `tinggitower`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`lahan` AS `lahan`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`biayatower` AS `biayatower`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from `project` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementation`
--
DROP TABLE IF EXISTS `vprojectimplementation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementation`  AS  select `project`.`id` AS `id`,`project`.`proc` AS `proc`,`project`.`ubis` AS `ubis`,`project`.`no_doc` AS `no_doc`,`project`.`projectid` AS `projectid`,`project`.`sitename` AS `sitename`,`project`.`siteid` AS `siteid`,`project`.`area` AS `area`,`project`.`regional` AS `regional`,`project`.`cluster` AS `cluster`,`project`.`mitra` AS `mitra`,`project`.`kode_tower_depan` AS `kode_tower_depan`,`project`.`tower` AS `tower`,`project`.`kode_tower_belakang` AS `kode_tower_belakang`,(case when (`project`.`infratype` = 'UNTAPPED') then convert(concat('GM ',`project`.`tower`,' M') using latin1) else concat(`project`.`kode_tower_depan`,' ',`project`.`tower`,' ',`project`.`kode_tower_belakang`) end) AS `tinggitower`,`project`.`budget` AS `budget`,`project`.`sis` AS `sis`,`project`.`sitac` AS `sitac`,`project`.`imb` AS `imb`,`project`.`lahan` AS `lahan`,`project`.`biayatower` AS `biayatower`,`project`.`cme` AS `cme`,`project`.`pln` AS `pln`,`project`.`addtransport` AS `addtransport`,`project`.`addpln` AS `addpln`,`project`.`addcme` AS `addcme`,`project`.`longitude` AS `longitude`,`project`.`latituted` AS `latituted`,`project`.`infratype` AS `infratype`,`project`.`towerprovider` AS `towerprovider`,`project`.`provinsi` AS `provinsi`,`project`.`kabupaten` AS `kabupaten`,`project`.`status_id` AS `status_id`,`project`.`filename` AS `filename`,`project`.`status` AS `status`,`project_implementation`.`id` AS `projectimplementationid`,`project_implementation`.`towerimplementation` AS `towerimplementation`,`project_implementation`.`clusterimplementation` AS `clusterimplementation`,`project_implementation`.`mitra` AS `mitraimplementation`,ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `project_implementation`.`id`)),0) AS `biayastandard`,ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `project_implementation`.`id`)),0) AS `biayaadditional`,(((((((((((ifnull((select `vprojectimplementationstandard`.`total` from `vprojectimplementationstandard` where (`vprojectimplementationstandard`.`project_implementation_id` = `project_implementation`.`id`)),0) + ifnull((select sum(`vprojectimplementationadditional`.`total`) from `vprojectimplementationadditional` where (`vprojectimplementationadditional`.`project_implementation_id` = `project_implementation`.`id`)),0)) + ifnull(`project`.`sis`,0)) + ifnull(`project`.`sitac`,0)) + ifnull(`project`.`imb`,0)) + ifnull(`project`.`lahan`,0)) + ifnull(`project`.`biayatower`,0)) + ifnull(`project`.`cme`,0)) + ifnull(`project`.`pln`,0)) + ifnull(`project`.`addtransport`,0)) + ifnull(`project`.`addpln`,0)) + ifnull(`project`.`addcme`,0)) AS `capex`,`project`.`created_at` AS `created_at`,`project`.`updated_at` AS `updated_at` from (`project` join `project_implementation` on((`project`.`id` = `project_implementation`.`project_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationadditional`
--
DROP TABLE IF EXISTS `vprojectimplementationadditional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationadditional`  AS  select `project_implementation_addtional`.`id` AS `id`,`project_implementation_addtional`.`project_implementation_id` AS `project_implementation_id`,`project_implementation_addtional`.`pekerjaan` AS `pekerjaan`,`project_implementation_addtional`.`satuan` AS `satuan`,`project_implementation_addtional`.`qty` AS `qty`,`project_implementation_addtional`.`harga` AS `harga`,floor((`project_implementation_addtional`.`qty` * `project_implementation_addtional`.`harga`)) AS `total`,`project_implementation_addtional`.`created_at` AS `created_at` from `project_implementation_addtional` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectimplementationstandard`
--
DROP TABLE IF EXISTS `vprojectimplementationstandard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectimplementationstandard`  AS  select `project_implementation_standard`.`id` AS `id`,`project_implementation_standard`.`project_implementation_id` AS `project_implementation_id`,`project_implementation_standard`.`tonase` AS `tonase`,`project_implementation_standard`.`pondasi` AS `pondasi`,`project_implementation_standard`.`biayatower` AS `biayatower`,`project_implementation_standard`.`erection_tower` AS `erection_tower`,`project_implementation_standard`.`transportasi` AS `transportasi`,`project_implementation_standard`.`pondasi_greenfiled` AS `pondasi_greenfiled`,`project_implementation_standard`.`bts_outdoor` AS `bts_outdoor`,`project_implementation_standard`.`me` AS `me`,`project_implementation_standard`.`fy` AS `fy`,`project_implementation_standard`.`pln_connect` AS `pln_connect`,floor(((((((((`project_implementation_standard`.`tonase` * `project_implementation_standard`.`biayatower`) + (`project_implementation_standard`.`pondasi_greenfiled` * `project_implementation_standard`.`pondasi`)) + `project_implementation_standard`.`erection_tower`) + `project_implementation_standard`.`transportasi`) + `project_implementation_standard`.`bts_outdoor`) + `project_implementation_standard`.`me`) + `project_implementation_standard`.`fy`) + `project_implementation_standard`.`pln_connect`)) AS `total`,`project_implementation_standard`.`created_at` AS `created_at` from `project_implementation_standard` ;

-- --------------------------------------------------------

--
-- Structure for view `vprojectstatus`
--
DROP TABLE IF EXISTS `vprojectstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojectstatus`  AS  select `project_status`.`project_id` AS `project_id`,`project_status`.`status` AS `status`,`project_status`.`created_at` AS `created_at`,`users`.`name` AS `name`,`users`.`level` AS `level` from (`project_status` join `users` on((`project_status`.`user_id` = `users`.`id`))) where `project_status`.`id` in (select max(`project_status`.`id`) from (`project_status` join `users` on((`project_status`.`user_id` = `users`.`id`))) group by `project_status`.`project_id`,`project_status`.`user_id`,`project_status`.`status`) ;

-- --------------------------------------------------------

--
-- Structure for view `vregional`
--
DROP TABLE IF EXISTS `vregional`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vregional`  AS  select distinct `project`.`regional` AS `regional` from `project` ;

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;
--
-- AUTO_INCREMENT for table `project_implementation`
--
ALTER TABLE `project_implementation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `project_implementation_addtional`
--
ALTER TABLE `project_implementation_addtional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `project_implementation_standard`
--
ALTER TABLE `project_implementation_standard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `standartimplementation`
--
ALTER TABLE `standartimplementation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
