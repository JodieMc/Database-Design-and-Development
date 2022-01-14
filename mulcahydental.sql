-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2021 at 12:17 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mulcahydental`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `aptID` int(8) NOT NULL,
  `patientID` smallint(5) NOT NULL,
  `aptDateTime` datetime NOT NULL,
  `aptLength` time NOT NULL,
  `reminderSent` enum('YES','NO') DEFAULT NULL,
  `aptStatus` enum('SCHEDULED','CANCELLED','NO SHOW','COMPLETE') DEFAULT NULL,
  `cancelTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`aptID`, `patientID`, `aptDateTime`, `aptLength`, `reminderSent`, `aptStatus`, `cancelTime`) VALUES
(502, 5661, '2008-11-11 13:15:00', '00:15:00', 'YES', 'COMPLETE', NULL),
(503, 5662, '2008-10-10 14:30:00', '00:30:00', 'NO', 'COMPLETE', NULL),
(504, 5666, '2008-12-10 14:45:00', '00:15:00', 'YES', 'CANCELLED', '2008-12-07 15:00:00'),
(505, 5671, '2009-01-05 16:15:00', '00:30:00', 'YES', 'SCHEDULED', NULL),
(506, 5672, '2008-11-04 13:00:00', '00:15:00', 'YES', 'NO SHOW', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `billID` smallint(5) NOT NULL,
  `lineitem` smallint(5) NOT NULL,
  `aptID` int(8) NOT NULL,
  `lineitemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billID`, `lineitem`, `aptID`, `lineitemID`) VALUES
(1, 1, 502, 9008),
(2, 1, 503, 9008),
(3, 1, 504, 9007),
(4, 1, 505, 9006),
(5, 1, 506, 9003);

-- --------------------------------------------------------

--
-- Table structure for table `lineitem`
--

CREATE TABLE `lineitem` (
  `lineitemID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cost` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lineitem`
--

INSERT INTO `lineitem` (`lineitemID`, `name`, `cost`) VALUES
(9003, 'CHECK UP', '70.00'),
(9004, 'FILLING', '50.00'),
(9005, 'X-RAY', '60.00'),
(9006, 'CLEAN', '40.00'),
(9007, 'EXTRACTION', '80.00'),
(9008, 'WHITENING', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patientID` smallint(5) NOT NULL,
  `firstName` char(10) NOT NULL,
  `surname` char(10) NOT NULL,
  `dob` date NOT NULL,
  `address1` char(14) NOT NULL,
  `address2` char(14) NOT NULL,
  `county` char(14) NOT NULL,
  `postcode` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientID`, `firstName`, `surname`, `dob`, `address1`, `address2`, `county`, `postcode`) VALUES
(5661, 'PRIS', 'MURPHY', '1990-01-01', '19 RAINBOW LAN', 'KILTIMAGH', 'MAYO', '1234'),
(5662, 'MARC', 'KINGSTON', '1990-03-09', '1 SUNSHINE TCE', 'OUGHTERARD', 'GALWAY', '5672'),
(5663, 'YV', 'CORRIGAN', '1967-05-29', '17 ACORN ROAD', 'STROKESTOWN', 'ROSCOMMON', '8777'),
(5664, 'CIARA', 'DOWL', '1952-02-22', '5 DAISY LANE', 'STRANDHILL', 'SLIGO', '9096'),
(5665, 'MARIA', 'MURPHY', '1981-01-21', '11 TREE DRIVE', 'DROMAHAIR', 'LEITRIM', '9095'),
(5666, 'JOHN', 'MURPHY', '1981-01-28', '5 GREEN AVENUE', 'CLONAKILTY', 'CORK', '9082'),
(5667, 'PETER', 'CORRIGAN', '1981-01-21', 'SEA VIEW', 'BANDON', 'CORK', '9077'),
(5668, 'PETER', 'MURPHY', '1972-03-26', '11 TREE DRIVE', 'DROMAHAIR', 'LEITRIM', '9095'),
(5669, 'ALEX', 'WHITE', '1951-12-21', 'KING ROAD', 'KINSALE', 'CORK', '9012'),
(5670, 'SIMON', 'JAMESON', '1984-01-09', '1 SEA POINT', 'COBH', 'CORK', '9054'),
(5671, 'FIONA', 'GREEN', '1977-03-21', '11 GREEN HILL', 'BANTRY', 'CORK', '9083'),
(5672, 'MARY', 'MURPHY', '1981-04-14', 'LONG WALK', 'COBH', 'CORK', '9066'),
(5673, 'MARIA', 'RYAN', '1993-01-15', '2 YELLOW SQUAR', 'COBH', 'CORK', '9019'),
(5674, 'JENNIFER', 'WEST', '1967-07-21', 'SUNNY DRIVE', 'MALLOW', 'CORK', '9052'),
(5675, 'FELIX', 'LEVI', '1939-01-29', 'YEW DRIVE', 'MALLOW', 'CORK', '9077');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(8) NOT NULL,
  `billID` smallint(5) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `amountPaid` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `billID`, `paymentDate`, `amountPaid`) VALUES
(3, 1, '2008-12-12 15:10:00', '25.50'),
(4, 2, '2009-09-01 14:00:00', '50.00'),
(5, 3, '2008-10-10 15:00:00', '80.00'),
(6, 4, '2009-01-06 10:15:00', '20.00'),
(7, 5, '2008-11-11 16:30:00', '35.00');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `referralID` smallint(4) NOT NULL,
  `sentStatus` varchar(8) NOT NULL,
  `reportReceived` varchar(9) DEFAULT NULL,
  `reportPdf` mediumblob DEFAULT NULL,
  `patientID` smallint(5) NOT NULL,
  `specialistID` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`referralID`, `sentStatus`, `reportReceived`, `reportPdf`, `patientID`, `specialistID`) VALUES
(162, 'SENT', 'RECEIVED', NULL, 5661, 15),
(163, 'SENT', 'NULL', NULL, 5663, 15),
(164, 'SENT', 'NULL', NULL, 5673, 16),
(165, 'SENT', 'RECEIVED', NULL, 5670, 17),
(166, 'PENDING', 'NULL', NULL, 5670, 15),
(167, 'SENT', 'NULL', NULL, 5669, 18),
(168, 'SENT', 'NULL', NULL, 5664, 15);

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `specialistID` smallint(5) NOT NULL,
  `firstName` char(10) NOT NULL,
  `surname` char(10) NOT NULL,
  `address1` char(14) NOT NULL,
  `address2` char(14) NOT NULL,
  `county` char(14) NOT NULL,
  `postcode` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`specialistID`, `firstName`, `surname`, `address1`, `address2`, `county`, `postcode`) VALUES
(15, 'SARAH', 'BLACK', 'BLACK DENTAL', '7 STORE STREET', 'CORK', '8923'),
(16, 'JOHN', 'MARTIN', 'SHINE DENTAL', '9 KING STREET', 'CORK', '8927'),
(17, 'SARAH', 'FORAN', 'BLING', 'TOWN SQUARE', 'CORK', '8954'),
(18, 'FLORENCE', 'FINLAY', 'FLO FILLINGS', '6 DAME LANE', 'CORK', '8971');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`aptID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billID`,`lineitem`),
  ADD KEY `aptID` (`aptID`),
  ADD KEY `lineitemID` (`lineitemID`);

--
-- Indexes for table `lineitem`
--
ALTER TABLE `lineitem`
  ADD PRIMARY KEY (`lineitemID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientID`),
  ADD KEY `patientIndex` (`patientID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `billID` (`billID`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`referralID`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `specialistID` (`specialistID`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`specialistID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `billID` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`aptID`) REFERENCES `appointments` (`aptID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`lineitemID`) REFERENCES `lineitem` (`lineitemID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `bill` (`billID`);

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`),
  ADD CONSTRAINT `referrals_ibfk_2` FOREIGN KEY (`specialistID`) REFERENCES `specialist` (`specialistID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
