-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 08:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `queue`
--

-- --------------------------------------------------------

--
-- Table structure for table `2024-03-15`
--

CREATE TABLE `2024-03-15` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-03-15`
--

INSERT INTO `2024-03-15` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '787998388386', 'Hello Friend', '06:59 PM', 'In Office'),
(2, '582307308360', 'MR ROBOT', '07:50 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-03-18`
--

CREATE TABLE `2024-03-18` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-03-18`
--

INSERT INTO `2024-03-18` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '787998388386', 'Hello Friend', '07:47 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-01`
--

CREATE TABLE `2024-04-01` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-01`
--

INSERT INTO `2024-04-01` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '787998388386', 'Hello Friend', '03:34 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-02`
--

CREATE TABLE `2024-04-02` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-02`
--

INSERT INTO `2024-04-02` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '787998388386', 'Hello Friend', '03:49 PM', 'On Break'),
(2, '833411068753', 'jegg', '04:05 PM', 'On Break');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-09`
--

CREATE TABLE `2024-04-09` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-09`
--

INSERT INTO `2024-04-09` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '833411068753', 'jegg', '12:07 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-20`
--

CREATE TABLE `2024-04-20` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-20`
--

INSERT INTO `2024-04-20` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '582307308360', 'jegg', '10:35 PM', 'On Break');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-21`
--

CREATE TABLE `2024-04-21` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-21`
--

INSERT INTO `2024-04-21` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '582307308360', 'jegg', '12:04 AM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-26`
--

CREATE TABLE `2024-04-26` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-26`
--

INSERT INTO `2024-04-26` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '582307308360', 'jegg', '01:10 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-28`
--

CREATE TABLE `2024-04-28` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-28`
--

INSERT INTO `2024-04-28` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '582307308360', 'jegg', '06:56 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-04-29`
--

CREATE TABLE `2024-04-29` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-04-29`
--

INSERT INTO `2024-04-29` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '1043424614895', 'Zaulda', '05:34 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-05-04`
--

CREATE TABLE `2024-05-04` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-04`
--

INSERT INTO `2024-05-04` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '1043424614895', 'Zaulda', '08:22 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-05-05`
--

CREATE TABLE `2024-05-05` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-05`
--

INSERT INTO `2024-05-05` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '1043424614895', 'Zaulda', '05:09 PM', 'In Office'),
(2, '582307308360', 'jegg', '05:11 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `2024-05-06`
--

CREATE TABLE `2024-05-06` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-06`
--

INSERT INTO `2024-05-06` (`id`, `uid`, `name`, `timein`, `status`) VALUES
(1, '829069141170', 'jerome', '03:11 PM', 'On Break'),
(2, '977155464317', 'teddy', '03:52 PM', 'In Office');

-- --------------------------------------------------------

--
-- Table structure for table `fillup`
--

CREATE TABLE `fillup` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `section` varchar(250) NOT NULL,
  `department` varchar(250) NOT NULL,
  `course` varchar(250) NOT NULL,
  `professor` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  `uid` varchar(250) NOT NULL,
  `status` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proceed`
--

CREATE TABLE `proceed` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `section` varchar(250) NOT NULL,
  `department` varchar(250) NOT NULL,
  `course` varchar(250) NOT NULL,
  `professor` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  `uid` varchar(250) NOT NULL,
  `status` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proceed`
--

INSERT INTO `proceed` (`id`, `name`, `section`, `department`, `course`, `professor`, `date`, `uid`, `status`) VALUES
(17, 'hello friend', 'asdasd', 'CEA', 'BSElectrical', 'ENGR.NEQTUS', '2024-03-15 00:00:00', '3H', 'proceed'),
(18, 'proceed', 'A', 'CEA', 'BSElectrical', 'ENGR.NEQTUS', '2024-03-15 00:00:00', '6P', 'reject'),
(19, 'hello friend', 'asdasd', 'CEA', 'BSCompEng', 'ENGR.NEQTUS', '2024-03-15 00:00:00', '6M', 'proceed'),
(20, 'hellofriend', 'pceat-03-fs401ap', 'CEA', 'BSElectronics', 'Hello Friend', '2024-03-15 00:00:00', '4E', 'proceed'),
(21, 'mr robot', 'pceat-03-fs401ap', 'CEA', 'BSCompEng', 'MR ROBOT', '2024-03-15 00:00:00', '7H', 'reject'),
(22, 'test to mr robit', 'pceat-03-fs401ap', 'CEA', 'BSElectronics', 'Hello Friend', '2024-03-15 00:00:00', '6W', 'reject'),
(23, 'test to hello friend', 'pceat-03-fs401ap', 'CEA', 'BSCompEng', 'Hello Friend', '2024-03-18 00:00:00', '2P', 'proceed'),
(24, 'jegg', 'pceit-03-fs701a', 'CEAT', 'BSCompEng', 'jegg', '2024-04-02 00:00:00', '7X', 'proceed'),
(25, 'jhemar', 'pceit-03-fs701a', 'CEAT', 'BSCompEng', 'jegg', '2024-04-02 00:00:00', '5O', 'reject'),
(26, 'jhemar', '', 'CEAT', 'BSCompEng', 'jegg', '2024-04-09 00:00:00', '2I', 'proceed'),
(27, 'jhemar', 'pceit-03-fs701a', 'CEA', 'BSElectronics', 'jegg', '2024-04-09 00:00:00', '3R', 'proceed'),
(28, 'jegg', 'pceit-03-fs701a', 'CEA', '', 'jegg', '2024-04-20 00:00:00', '0A', 'proceed'),
(29, 'charles', 'pceit-03-fs701a', 'CBEA', '', 'jegg', '2024-04-20 00:00:00', '2E', 'proceed'),
(30, 'charles xavier', 'pceit-03-fs701a', 'CBEA', 'BSCompEng', 'jegg', '2024-04-20 00:00:00', '4Q', 'reject'),
(31, 'Gambit', 'pceit-03-fs701a', 'CBEA', 'BSCompEng', 'jegg', '2024-04-20 00:00:00', '5X', 'reject'),
(32, 'Gambito baby', 'pceit-03-fs701a', 'CBEA', 'BSElectrical', 'jegg', '2024-04-20 00:00:00', '2H', 'reject'),
(33, 'Gambito', 'pceit-03-fs701a', 'CBEA', 'BSCompEng', 'jegg', '2024-04-20 00:00:00', '2L', 'reject'),
(34, 'Gambito baby STUDPID', 'pceit-03-fs701a', 'CBEA', 'BSElectrical', 'jegg', '2024-04-20 00:00:00', '9K', 'reject'),
(35, 'HUH YUNJIN', 'pceit-03-fs701a', 'CBEA', 'BSElectrical', 'jegg', '2024-04-20 00:00:00', '4K', 'reject'),
(36, 'CK ', 'pceit-03-fs701a', 'CEA', 'BSCompEng', 'jegg', '2024-04-26 00:00:00', '0J', 'proceed'),
(37, 'CK jr', 'pceit-03-fs701a', 'CEA', 'BSCompEng', 'jegg', '2024-04-26 00:00:00', '2F', 'reject'),
(38, 'Gambito lessarifim', 'pceit-03-fs701a', 'CBEA', 'BSCompEng', 'Choose Professor', '2024-04-20 00:00:00', '3Y', 'reject'),
(39, 'CK jr jr', 'pceit-03-fs701a', 'CEA', 'BSCompEng', 'jegg', '2024-04-26 00:00:00', '9K', 'reject'),
(40, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'BSElectrical', '2024-04-28 00:00:00', '3R', 'reject'),
(41, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'BSCompEng', '2024-04-28 00:00:00', '1B', 'reject'),
(42, 'CK jr jr', 'P0F', 'CEA', 'BSCompEng', 'BSCompEng', '2024-04-28 00:00:00', '7W', 'reject'),
(43, 'CK jr jr', 'P0F', 'CEA', 'BSCompEng', 'BSCompEng', '2024-04-28 00:00:00', '1L', 'reject'),
(44, 'CK jr jr', 'P0F', 'CEA', 'BSCompEng', 'BSCompEng', '2024-04-28 00:00:00', '2U', 'reject'),
(45, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'BSCompEng', '2024-04-28 00:00:00', '4M', 'reject'),
(46, 'CK jr jr', 'P0F', 'CEA', 'BSCompEng', 'BSElectrical', '2024-04-28 00:00:00', '9T', 'reject'),
(47, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'BSCompEng', '2024-04-28 00:00:00', '0G', 'reject'),
(48, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'BSCompEng', '2024-04-28 00:00:00', '7P', 'reject'),
(49, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'BSCompEng', '2024-04-28 00:00:00', '8V', 'reject'),
(50, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'BSElectrical', '2024-04-29 00:00:00', '9Z', 'reject'),
(51, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'BSElectrical', '2024-04-29 00:00:00', '9C', 'reject'),
(52, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CBEA', 'BSElectrical', 'BSCompEng', '2024-04-29 00:00:00', '7N', 'reject'),
(53, 'Zaulda', 'PCEIT-03-FS802P', 'CBEA', 'BSCompEng', 'Zaulda', '2024-04-29 00:00:00', '6J', 'proceed'),
(54, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CEA', 'BSElectrical', 'Zaulda', '2024-04-29 00:00:00', '1L', 'reject'),
(55, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CBEA', 'BSCompEng', 'Zaulda', '2024-04-29 00:00:00', '9G', 'reject'),
(56, 'Zaulda', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-04-29 00:00:00', '7Q', 'reject'),
(57, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-04-29 00:00:00', '5L', 'reject'),
(58, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CEA', 'BSElectrical', 'Zaulda', '2024-04-29 00:00:00', '1H', 'reject'),
(59, 'Zaulda', 'PCEIT-03-FS802P', 'CBEA', 'BSElectrical', 'Zaulda', '2024-04-29 00:00:00', '7H', 'proceed'),
(60, 'Zaulda', 'PCEIT-03-FS802P', 'CBEA', 'BSCompEng', 'Zaulda', '2024-04-29 00:00:00', '1Q', 'reject'),
(62, 'Accept Sorting', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 00:00:00', '6C', 'proceed'),
(63, 'Reject Sorting', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 00:00:00', '5M', 'reject'),
(64, 'pending sorting', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 00:00:00', '2J', 'reject'),
(65, 'LIFO', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 00:00:00', '6Q', 'proceed'),
(66, 'ang buhay ay parang betlog di pantay', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 00:00:00', '4M', 'reject'),
(67, 'ang buhay ay betlog betlog lang', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:08:24', '8G', 'proceed'),
(68, 'ayan nasa top na siya', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:09:23', '4Y', 'reject'),
(69, 'Top or Bottom', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:10:47', '3A', 'reject'),
(70, 'isa pa top naman ako', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:11:41', '2Z', 'reject'),
(71, 'Zaulda', 'PCEIT-03-FS802P', 'CBEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:29:33', '4L', 'reject'),
(72, 'Zaulda', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:30:33', '9E', 'reject'),
(73, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CBEA', 'BSElectrical', 'Zaulda', '2024-05-04 15:34:40', '1X', 'reject'),
(74, 'Zaulda', 'PCEIT-03-FS802P', 'CBEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:44:02', '1Y', 'reject'),
(75, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:49:59', '4P', 'reject'),
(76, 'Zaulda', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:50:48', '9K', 'reject'),
(77, 'JHEMAR PEREZ', 'PCEIT-03-FS802P', 'CBEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:51:33', '8Y', 'reject'),
(78, 'Zaulda', 'PCEIT-03-FS802P', 'CEA', 'BSCompEng', 'Zaulda', '2024-05-04 15:53:11', '7H', 'reject'),
(79, 'CK jr jr', 'P0F', 'CEA', 'BSElectrical', 'jegg', '2024-05-05 11:20:52', '8Q', 'reject'),
(80, 'sdfa', 'asdf', 'CEA', 'BSCompEng', 'jerome', '2024-05-06 09:12:26', '2N', 'reject'),
(81, 'Jegg Jimenez', 'pceit-03-fs701a', 'CEA', 'BSCompEng', 'teddy', '2024-05-06 09:54:18', '6R', 'reject');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(250) NOT NULL,
  `uid` varchar(3000) NOT NULL,
  `name` varchar(3000) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `name`, `username`, `password`) VALUES
(1, '787998388386', 'Hello Friend', 'admin', '1234'),
(3, '582307308360', 'MR ROBOT', 'mrrobot', '0101'),
(8, 'NOT AVAILABLE', 'check register', '@checkregister', 'NOT AVAILABLE'),
(9, '582307308360', 'jegg', 'jeggjimenez', '12345'),
(11, '1043424614895', 'Zaulda', 'zaulda', '12345'),
(12, '829069141170', 'jerome', 'jerome123', '12345'),
(13, '977155464317', 'teddy', 'teddy123', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `2024-03-15`
--
ALTER TABLE `2024-03-15`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-03-18`
--
ALTER TABLE `2024-03-18`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-01`
--
ALTER TABLE `2024-04-01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-02`
--
ALTER TABLE `2024-04-02`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-09`
--
ALTER TABLE `2024-04-09`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-20`
--
ALTER TABLE `2024-04-20`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-21`
--
ALTER TABLE `2024-04-21`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-26`
--
ALTER TABLE `2024-04-26`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-28`
--
ALTER TABLE `2024-04-28`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-04-29`
--
ALTER TABLE `2024-04-29`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-05-04`
--
ALTER TABLE `2024-05-04`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-05-05`
--
ALTER TABLE `2024-05-05`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-05-06`
--
ALTER TABLE `2024-05-06`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fillup`
--
ALTER TABLE `fillup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proceed`
--
ALTER TABLE `proceed`
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
-- AUTO_INCREMENT for table `2024-03-15`
--
ALTER TABLE `2024-03-15`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `2024-03-18`
--
ALTER TABLE `2024-03-18`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-04-01`
--
ALTER TABLE `2024-04-01`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-04-02`
--
ALTER TABLE `2024-04-02`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `2024-04-09`
--
ALTER TABLE `2024-04-09`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-04-20`
--
ALTER TABLE `2024-04-20`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `2024-04-21`
--
ALTER TABLE `2024-04-21`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-04-26`
--
ALTER TABLE `2024-04-26`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-04-28`
--
ALTER TABLE `2024-04-28`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-04-29`
--
ALTER TABLE `2024-04-29`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-05-04`
--
ALTER TABLE `2024-05-04`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-05-05`
--
ALTER TABLE `2024-05-05`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `2024-05-06`
--
ALTER TABLE `2024-05-06`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fillup`
--
ALTER TABLE `fillup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `proceed`
--
ALTER TABLE `proceed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
