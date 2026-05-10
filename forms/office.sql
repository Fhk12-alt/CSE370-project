-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 09:31 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `office`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(8) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`) VALUES
('16101901', 'Shoiab', 'Akter');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `admin_id` varchar(8) NOT NULL,
  `user` varchar(8) NOT NULL,
  `pass` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`admin_id`, `user`, `pass`) VALUES
('16101901', '16101901', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `allowance`
--

CREATE TABLE `allowance` (
  `base_amount` int(11) NOT NULL,
  `emp_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allowance`
--

INSERT INTO `allowance` (`base_amount`, `emp_id`) VALUES
(30000, '17101902'),
(1000, '17101903');

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

CREATE TABLE `deduction` (
  `type` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deduction`
--

INSERT INTO `deduction` (`type`, `amount`) VALUES
('absence', 250),
('Food_pri', 150),
('late_fine', 100),
('parking', 50);

-- --------------------------------------------------------

--
-- Table structure for table `deduction_employee`
--

CREATE TABLE `deduction_employee` (
  `emp_id` varchar(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `frequency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deduction_employee`
--

INSERT INTO `deduction_employee` (`emp_id`, `type`, `frequency`) VALUES
('17101902', 'late_fine', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(8) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `first_name`, `last_name`, `type`) VALUES
('17101901', 'Amirul', 'Haque', ''),
('17101902', 'gazi', 'rehan', 'part_timer'),
('17101903', 'gazi', 'emdad', 'part_timer');

-- --------------------------------------------------------

--
-- Table structure for table `employee_users`
--

CREATE TABLE `employee_users` (
  `emp_id` varchar(8) NOT NULL,
  `user` varchar(8) NOT NULL,
  `pass` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_users`
--

INSERT INTO `employee_users` (`emp_id`, `user`, `pass`) VALUES
('17101901', '17101901', '1233'),
('17101902', '17101902', '4321'),
('17101903', '17101903', '4321');

-- --------------------------------------------------------

--
-- Table structure for table `intern`
--

CREATE TABLE `intern` (
  `emp_id` varchar(8) NOT NULL,
  `start_date` date NOT NULL,
  `Leaves_taken` int(11) NOT NULL,
  `Progress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `part_timer`
--

CREATE TABLE `part_timer` (
  `emp_id` varchar(8) NOT NULL,
  `start_date` date NOT NULL,
  `leaves_taken` int(11) NOT NULL,
  `Progress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `part_timer`
--

INSERT INTO `part_timer` (`emp_id`, `start_date`, `leaves_taken`, `Progress`) VALUES
('17101902', '2014-04-23', 0, 0),
('17101903', '2015-04-23', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permanent`
--

CREATE TABLE `permanent` (
  `emp_id` varchar(8) NOT NULL,
  `start_date` date NOT NULL,
  `leaves_taken` int(11) NOT NULL,
  `raise_progress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requst`
--

CREATE TABLE `requst` (
  `emp_id` varchar(8) NOT NULL,
  `serial` int(11) NOT NULL,
  `request` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requst`
--

INSERT INTO `requst` (`emp_id`, `serial`, `request`) VALUES
('17101902', 2, 'hello there is a problem in my absesne');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`user`),
  ADD UNIQUE KEY `pass` (`pass`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `allowance`
--
ALTER TABLE `allowance`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`);

--
-- Indexes for table `deduction`
--
ALTER TABLE `deduction`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `deduction_employee`
--
ALTER TABLE `deduction_employee`
  ADD PRIMARY KEY (`emp_id`,`type`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD UNIQUE KEY `emp_id` (`emp_id`);

--
-- Indexes for table `employee_users`
--
ALTER TABLE `employee_users`
  ADD KEY `employee_users_ibfk_1` (`emp_id`);

--
-- Indexes for table `intern`
--
ALTER TABLE `intern`
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `part_timer`
--
ALTER TABLE `part_timer`
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `permanent`
--
ALTER TABLE `permanent`
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `requst`
--
ALTER TABLE `requst`
  ADD UNIQUE KEY `serial` (`serial`),
  ADD KEY `requst_ibfk_1` (`emp_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `allowance`
--
ALTER TABLE `allowance`
  ADD CONSTRAINT `allowance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deduction_employee`
--
ALTER TABLE `deduction_employee`
  ADD CONSTRAINT `deduction_employee_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deduction_employee_ibfk_2` FOREIGN KEY (`type`) REFERENCES `deduction` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_users`
--
ALTER TABLE `employee_users`
  ADD CONSTRAINT `employee_users_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `intern`
--
ALTER TABLE `intern`
  ADD CONSTRAINT `intern_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `part_timer`
--
ALTER TABLE `part_timer`
  ADD CONSTRAINT `part_timer_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permanent`
--
ALTER TABLE `permanent`
  ADD CONSTRAINT `permanent_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requst`
--
ALTER TABLE `requst`
  ADD CONSTRAINT `requst_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
