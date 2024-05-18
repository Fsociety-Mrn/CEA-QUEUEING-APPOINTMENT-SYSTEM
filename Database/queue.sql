-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2024 at 06:23 AM
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
-- Table structure for table `2024-05-14`
--

CREATE TABLE `2024-05-14` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL,
  `available` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-14`
--

INSERT INTO `2024-05-14` (`id`, `uid`, `name`, `timein`, `status`, `available`) VALUES
(1, '787998388386', 'Hello Friend', '03:32 PM', 'login', '1');

-- --------------------------------------------------------

--
-- Table structure for table `2024-05-16`
--

CREATE TABLE `2024-05-16` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL,
  `available` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-16`
--

INSERT INTO `2024-05-16` (`id`, `uid`, `name`, `timein`, `status`, `available`) VALUES
(1, '787998388', 'Hello Friend', '09:43 PM', 'login', '1');

-- --------------------------------------------------------

--
-- Table structure for table `2024-05-17`
--

CREATE TABLE `2024-05-17` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL,
  `available` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-17`
--

INSERT INTO `2024-05-17` (`id`, `uid`, `name`, `timein`, `status`, `available`) VALUES
(1, '787998388', 'Hello Friend', '11:51 PM', 'login', '0');

-- --------------------------------------------------------

--
-- Table structure for table `2024-05-18`
--

CREATE TABLE `2024-05-18` (
  `id` int(11) NOT NULL,
  `uid` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `timein` mediumtext NOT NULL,
  `status` mediumtext NOT NULL,
  `available` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2024-05-18`
--

INSERT INTO `2024-05-18` (`id`, `uid`, `name`, `timein`, `status`, `available`) VALUES
(1, '787998388', 'Hello Friend', '12:04 AM', 'login', '1');

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
(24, 'Test', 'aceas', 'CEA', 'BSElectrical', 'AL JAMES', '2024-04-08 00:00:00', '5U', 'reject'),
(25, 'again ', 'please', 'CBEA', 'BSCompEng', 'AL JAMES', '2024-04-08 00:00:00', '0B', 'proceed'),
(26, 'Ano ba tong nadadrama ? shocks ito bay a pag ibig na', 'pceat-03-fs401a', 'CEA', 'BSCompEng', 'AL JAMES', '2024-04-09 00:00:00', '9U', 'proceed'),
(27, 'Art Lisboa', 'asd', 'CEA', 'BSElectrical', 'AL JAMES', '2024-04-20 00:00:00', '2Q', 'proceed'),
(28, 'asdasdasd', 'pceat-03-fs201p', 'CBEA', 'BSCompEng', 'AL JAMES', '2024-04-21 00:00:00', '0X', 'proceed'),
(29, '', '', '', '', 'Choose Professor', '2024-04-21 00:00:00', '1K', 'proceed'),
(30, 'aa', 'sa', 'CEA', '', 'Choose Professor', '2024-04-25 00:00:00', '4J', 'proceed'),
(31, 'aa', '', 'CEA', 'BSCompEng', 'Choose Professor', '2024-04-25 00:00:00', '0A', 'proceed'),
(32, 'aa', 'S', 'CEA', 'BSCompEng', 'Choose Professor', '2024-04-25 00:00:00', '4Q', 'proceed'),
(33, 'aa', 'S', 'CEA', 'BSCompEng', 'BSElectronics', '2024-04-25 00:00:00', '8L', 'proceed'),
(34, 'aa', 'S', 'CEA', 'BSCompEng', 'BSCompEng', '2024-04-25 00:00:00', '0I', 'reject'),
(35, 'aa', 'S', 'CEA', 'BSCompEng', 'BSCompEng', '2024-04-25 00:00:00', '9G', 'reject'),
(36, 'aa', 'S', 'CEA', 'BSCompEng', 'Hello Friend', '2024-04-25 00:00:00', '5G', 'reject'),
(37, 'aa', 'S', 'CEA', 'BSCompEng', 'Hello Friend', '2024-04-25 00:00:00', '2S', 'reject'),
(38, 'aa', 'S', 'CEA', 'BSCompEng', 'Hello Friend', '2024-04-25 00:00:00', '3G', 'reject'),
(39, 'aa', 'S', 'CEA', 'BSElectrical', 'Hello Friend', '2024-04-25 00:00:00', '9X', 'reject'),
(40, 'asd', 'asd', 'CEA', 'BSCompEng', 'BSElectrical', '2024-05-12 00:00:00', '0F', 'reject'),
(41, 'Artmillen', 'asdasd', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '9A', 'reject'),
(42, 'Artmillen Hello Friend', 'asdasd', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '2F', 'reject'),
(43, 'Testing', 'pceat-03-fsfoap', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '4C', 'reject'),
(44, 'Testing', 'pceat-03-fsfoap', 'CEA', 'BSElectrical', 'Hello Friend', '2024-05-14 00:00:00', '8E', 'reject'),
(45, 'Testing', 'pceat-03-fsfoap', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '7A', 'reject'),
(46, 'Testing again', 'pceat-03-fsfoap', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '8N', 'reject'),
(47, 'Testing again agaion please p[leazx', 'pceat-03-fsfoap', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '6P', 'reject'),
(48, 'wow', 'asd', 'CEA', 'BSElectrical', 'Hello Friend', '2024-05-14 00:00:00', '9F', 'reject'),
(49, 'wow', 'asd', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-14 00:00:00', '0M', 'reject'),
(50, 'Hello Friend', 'pceat-03-fs401ap', 'CEA', 'BSCompEng', 'BSElectrical', '2024-05-15 00:00:00', '7K', 'reject'),
(51, 'test', 'pceat-03-fs210p', 'CEA', 'BSCompEng', 'BSElectronics', '2024-05-15 00:00:00', '2A', 'reject'),
(52, 'test', 'peat-asdasd-asdasd', 'CEA', 'BSCompEng', 'BSElectronics', '2024-05-15 00:00:00', '0Q', 'reject'),
(53, 'testing shiwt please o gode', 'asdasd', 'CEA', 'BSCompEng', 'BSCompEng', '2024-05-15 00:00:00', '5B', 'reject'),
(54, 'last na shit', 'PAA', 'CEA', 'BSElectronics', 'BSElectronics', '2024-05-15 18:24:30', '9O', 'reject'),
(55, 'wow again', 'A', 'CEA', 'BSElectronics', 'BSElectrical', '2024-05-15 00:00:00', '6D', 'proceed'),
(57, 'peding appoint test', 'pceat-03', 'CEA', 'BSCompEng', 'BSElectrical', '2024-05-16 12:27:25', '9L', 'proceed'),
(58, 'peding appoint testsdasdasdasd', 'pceat-03', 'CEA', 'BSElectrical', 'BSElectrical', '2024-05-16 12:29:16', '3W', 'proceed'),
(59, 'mina san', 'jojongyeon', 'CEA', 'BSCompEng', 'Hello Friend', '2024-05-16 15:45:54', '4X', 'proceed'),
(60, 'one in twice on million', 'asdasdasdasd', 'CBEA', 'BSElectronics', 'Hello Friend', '2024-05-16 15:46:31', '6P', 'proceed'),
(61, 'just in case', '123123', 'CBEA', 'BSCompEng', 'Hello Friend', '2024-05-16 16:14:35', '7R', 'proceed'),
(62, 'hel;lo freibnd', '123123', 'CBEA', 'BSCompEng', 'Hello Friend', '2024-05-16 16:15:00', '2B', 'proceed');

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
(1, '787998388', 'Hello Friend', 'admin', '1234'),
(3, '58230730', 'MR ROBOT', 'mrrobot', '0101'),
(8, 'NOT AVAILABLE', 'check register', '@checkregister', 'NOT AVAILABLE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `2024-05-14`
--
ALTER TABLE `2024-05-14`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-05-16`
--
ALTER TABLE `2024-05-16`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-05-17`
--
ALTER TABLE `2024-05-17`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2024-05-18`
--
ALTER TABLE `2024-05-18`
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
-- AUTO_INCREMENT for table `2024-05-14`
--
ALTER TABLE `2024-05-14`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-05-16`
--
ALTER TABLE `2024-05-16`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-05-17`
--
ALTER TABLE `2024-05-17`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `2024-05-18`
--
ALTER TABLE `2024-05-18`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fillup`
--
ALTER TABLE `fillup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `proceed`
--
ALTER TABLE `proceed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
