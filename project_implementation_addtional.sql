-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2018 at 11:42 AM
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
(24, 48, 'ADD TRANSPORT', 'LS', 1, 9000000, '2018-04-14 10:00:00', '2018-04-14 10:00:00'),
(25, 48, 'ADD CME', 'LS', 1, 10800000, '2018-04-14 10:00:00', '2018-04-14 10:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project_implementation_addtional`
--
ALTER TABLE `project_implementation_addtional`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project_implementation_addtional`
--
ALTER TABLE `project_implementation_addtional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
