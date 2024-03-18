-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2024 at 12:51 PM
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
(1, 'aklsdjklasjdk23', 'Hello Friend', '06:59 PM', 'In Office'),
(2, 'aklsdjklasjdk23', 'MR ROBOT', '07:50 PM', 'In Office');

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
(1, 'aklsdjklasjdk23', 'Hello Friend', '07:47 PM', 'In Office');

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
  `date` date NOT NULL,
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
  `date` date NOT NULL,
  `uid` varchar(250) NOT NULL,
  `status` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proceed`
--

INSERT INTO `proceed` (`id`, `name`, `section`, `department`, `course`, `professor`, `date`, `uid`, `status`) VALUES
(17, 'hello friend', 'asdasd', 'CEA', 'BSElectrical', 'ENGR.NEQTUS', '2024-03-15', '3H', 'proceed'),
(18, 'proceed', 'A', 'CEA', 'BSElectrical', 'ENGR.NEQTUS', '2024-03-15', '6P', 'reject'),
(19, 'hello friend', 'asdasd', 'CEA', 'BSCompEng', 'ENGR.NEQTUS', '2024-03-15', '6M', 'proceed'),
(20, 'hellofriend', 'pceat-03-fs401ap', 'CEA', 'BSElectronics', 'Hello Friend', '2024-03-15', '4E', 'proceed'),
(21, 'mr robot', 'pceat-03-fs401ap', 'CEA', 'BSCompEng', 'MR ROBOT', '2024-03-15', '7H', 'reject'),
(22, 'test to mr robit', 'pceat-03-fs401ap', 'CEA', 'BSElectronics', 'Hello Friend', '2024-03-15', '6W', 'reject'),
(23, 'test to hello friend', 'pceat-03-fs401ap', 'CEA', 'BSCompEng', 'Hello Friend', '2024-03-18', '2P', 'proceed');

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
(1, 'aklsdjklasjdk23', 'Hello Friend', 'admin', '1234'),
(3, 'ASDASDASDASD', 'MR ROBOT', 'mrrobot', '0101'),
(8, 'NOT AVAILABLE', 'check register', '@checkregister', 'NOT AVAILABLE');

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
-- AUTO_INCREMENT for table `fillup`
--
ALTER TABLE `fillup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `proceed`
--
ALTER TABLE `proceed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
