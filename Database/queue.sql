-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2024 at 07:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `uid` varchar(250) NOT NULL
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
  `uid` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proceed`
--

INSERT INTO `proceed` (`id`, `name`, `section`, `department`, `course`, `professor`, `date`, `uid`) VALUES
(1, 'Ashley John', 'R', 'CBEA', 'BSCompEng', 'ss', '2024-03-05', '9U'),
(2, 'Ashley John', 'R', 'CEAT', 'BSElectrical', 'mana', '2024-03-05', '3W'),
(3, 'Ashley John', 'R', 'CBEA', 'BSCompEng', 'ss', '2024-03-05', '4D'),
(4, 'Ashley John', 'R', 'CEA', 'BSCompEng', 'ss', '2024-03-05', '3P'),
(5, 'Ashley John', 'R', 'CEA', 'BSElectrical', 'ss', '2024-03-05', '5C'),
(6, 'Ashley John', 'R', 'CEA', 'BSCompEng', 'ss', '2024-03-05', '6W'),
(7, 'Ashley John', 'R', 'CEA', 'BSCompEng', 'ss', '2024-03-05', '8Q'),
(8, 'Ashley John', 'R', 'CEA', 'BSElectronics', 'ss', '2024-03-05', '2H'),
(9, 'Ashley John', 'R', 'CEA', 'BSCompEng', 'ss', '2024-03-05', '0W'),
(10, 'Ashley John', 'R', 'CEA', 'BSCompEng', 'Professor Ronel Paglomutan', '2024-03-05', '7R'),
(11, 'Ashley John', 'R', 'CEA', 'BSElectrical', 'Professor Ronel Paglomutan', '2024-03-05', '7W'),
(12, 'Ashley John', 'R', 'CEA', 'BSCompEng', 'Professor Ronel Paglomutan', '2024-03-05', '9M');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '1234'),
(2, 'admin', '$2y$10$SDFkjh4SDFskjghgkjhjhSDF3wt5h.e2lSDFkgjkSDFkgjkhgiwksSDFL');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `fillup`
--
ALTER TABLE `fillup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `proceed`
--
ALTER TABLE `proceed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
