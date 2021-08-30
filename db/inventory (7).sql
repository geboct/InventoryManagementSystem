-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 03:43 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acccountID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `accountDetails` varchar(100) DEFAULT NULL,
  `Customers_customerID` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  `payMethod` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `productName` varchar(255) NOT NULL,
  `sellingPrice` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`productName`, `sellingPrice`, `quantity`, `total`) VALUES
('32', 21, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryName`) VALUES
('Laptop'),
('Table'),
('Desk'),
('Chair'),
('Printer'),
('Stapler');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `memberSince` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `name` varchar(255) NOT NULL,
  `level` int(3) NOT NULL,
  `status` enum('Active','Deactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`name`, `level`, `status`) VALUES
('Admin', 1, 'Active'),
('Employee', 2, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `printinvoice`
--

CREATE TABLE `printinvoice` (
  `invoiceNumber` int(11) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `unitPrice` double NOT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `grandTotal` double NOT NULL,
  `amountPaid` double NOT NULL,
  `balance` double NOT NULL,
  `employeeName` varchar(255) NOT NULL,
  `companyName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `printoutofstock`
--

CREATE TABLE `printoutofstock` (
  `barcode` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `salePrice` double NOT NULL,
  `stock` double NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `printsales`
--

CREATE TABLE `printsales` (
  `productName` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `salePrice` double NOT NULL,
  `total` double NOT NULL,
  `date` date NOT NULL,
  `employeeName` varchar(50) NOT NULL,
  `invoiceNumber` varchar(255) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `barcodeField` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `salePrice` double DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `dateAdded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`barcodeField`, `productName`, `salePrice`, `stock`, `description`, `category`, `dateAdded`) VALUES
('4543', 'Tecno Camon 15', 4, 76, 'The latest Techno Camon 15 pro', 'Mobile Phone', '2021-02-02'),
('45431', 'Center Field', 12, 308, 'A chewing Gum', 'Headset', '2021-02-03'),
('454311', 'Thisway', 1.5, 163, 'Thisway chocolate drink', 'Multi Sockets', '2021-01-03'),
('4543111', 'Extention Board', 50, 2, 'To charge phones', 'Multi Sockets', '2020-12-22'),
('45431111', 'Miksi Choco', 1.2, 328, 'Hot Tea', 'Mobile Phone', '2021-02-09'),
('454311111', 'NutriSnax', 3, 721, 'Biscuit', 'Headset', '2021-02-10'),
('454311112', '32', 21, 2183, 'dfd', 'Headset', '2021-02-02'),
('6008155007534', 'miski', 2, 61, 'plenty', 'Mobile Phone', '2021-02-09'),
('6033000085795', 'Milo Mix', 1.7, 5, '3 in  One milo mix', 'Mobile Phone', '2021-02-12'),
('889296132325', 'Hp printer', 230, 371, 'Deskjet 2130\nblack and white', 'Headset', '2021-02-07');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `invoiceNumber` varchar(20) DEFAULT '0',
  `barcode` varchar(100) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `purchasedPrice` double NOT NULL,
  `total` double NOT NULL,
  `date` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`invoiceNumber`, `barcode`, `productName`, `quantity`, `purchasedPrice`, `total`, `date`, `month`, `year`, `companyName`, `employeeName`) VALUES
('1', '26463464', 'Milo Mix', 34, 15, 510, 20201210, 0, 0000, 'Geboct Tech Solutions', 'Bril');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `barcode` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `sellingPrice` double NOT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `grandTotal` double NOT NULL,
  `amountPaid` double NOT NULL,
  `balance` double NOT NULL,
  `date` date NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`barcode`, `productName`, `sellingPrice`, `quantity`, `total`, `grandTotal`, `amountPaid`, `balance`, `date`, `companyName`, `employeeName`) VALUES
(NULL, 'miski', 2, 2, 4, 0, 500, 36, '2021-02-17', 'sad', 'bril'),
(NULL, 'Hp printer', 230, 2, 460, 0, 500, 36, '2021-02-17', 'sad', 'bril'),
(NULL, 'Extention Board', 50, 3, 150, 0, 25, 2.6, '2021-02-17', 'bril', 'bril'),
(NULL, 'NutriSnax', 3, 3, 9, 0, 25, 2.6, '2021-02-17', 'bril', 'bril'),
(NULL, 'Miksi Choco', 1.2, 2, 2.4, 0, 25, 2.6, '2021-02-17', 'bril', 'bril'),
(NULL, 'Tecno Camon 15', 4, 5, 20, 0, 25, 2.6, '2021-02-17', 'bril', 'bril'),
(NULL, 'Center Field', 12, 2, 24, 0, 50, 26, '2021-03-27', 'sa', 'bril'),
(NULL, 'Tecno Camon 15', 4, 3, 12, 0, 20, 8, '2021-03-27', 're', 'bril'),
(NULL, 'Miksi Choco', 1.2, 2, 2.4, 0, 1000, 74.2, '2021-03-27', 'salifu', 'bril'),
(NULL, 'Milo Mix', 1.7, 2, 3.4, 0, 1000, 74.2, '2021-03-27', 'salifu', 'bril'),
(NULL, 'Tecno Camon 15', 4, 2, 8, 82.7, 100, 17.3, '2021-04-22', 'd', 'bril'),
(NULL, 'Miksi Choco', 1.2, 3, 3.5999999999999996, 82.7, 100, 17.3, '2021-04-22', 'd', 'bril'),
(NULL, '32', 21, 3, 63, 82.7, 100, 17.3, '2021-04-22', 'd', 'bril'),
(NULL, 'Milo Mix', 1.7, 3, 5.1, 82.7, 100, 17.3, '2021-04-22', 'd', 'bril'),
(NULL, 'Thisway', 1.5, 2, 3, 82.7, 100, 17.3, '2021-04-22', 'd', 'bril');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(45) NOT NULL DEFAULT '1234',
  `accessLevel` enum('Admin','Employee') NOT NULL,
  `status` enum('Active','Deactive') NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `userImage` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `phone`, `password`, `accessLevel`, `status`, `lastLogin`, `userImage`) VALUES
(7, 'Salifu Gebilila', 'bril', 243930223, 'bril', 'Admin', 'Active', '2021-04-22 13:12:10', NULL),
(343, 'Emmanuel Nettey', 'Nettey', 987233212, 'emma', 'Employee', 'Active', '2021-04-22 13:09:36', NULL),
(344, 'Fatimatu Jibril', 'Fati', 987654332, '1234', 'Employee', 'Active', '2021-02-14 07:20:44', NULL),
(345, 'Sampson', 'Kuworye', 243930221, '1234', 'Employee', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usercredents`
--

CREATE TABLE `usercredents` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usercredents`
--

INSERT INTO `usercredents` (`username`, `password`) VALUES
('bril', 'bril');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`acccountID`),
  ADD UNIQUE KEY `accountName_UNIQUE` (`accountName`),
  ADD KEY `fk_Accounts_Customers1_idx` (`Customers_customerID`),
  ADD KEY `fk_Accounts_User2_idx` (`User_username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `barcode` (`barcodeField`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `userID` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
