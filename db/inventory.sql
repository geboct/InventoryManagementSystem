-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2021 at 12:28 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE DATABASE [IF NOT EXISTS] inventory;
USE inventory;

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
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
  `customerName` varchar(255) NOT NULL
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
-- Table structure for table `printproductcat`
--

CREATE TABLE `printproductcat` (
  `barcodeField` varchar(100) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `salePrice` double NOT NULL,
  `purchasedPrice` double NOT NULL,
  `stock` double NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `dateAdded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `printpurchases`
--

CREATE TABLE `printpurchases` (
  `invoiceNumber` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `purchasedPrice` double NOT NULL,
  `total` double NOT NULL,
  `date` varchar(100) NOT NULL,
  `employeeName` varchar(50) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL
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
  `purchasedPrice` double NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `dateAdded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL,
  `companyName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasescart`
--

CREATE TABLE `purchasescart` (
  `invoiceNumber` varchar(50) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `purchasedPrice` double NOT NULL,
  `sellingPrice` double NOT NULL,
  `date` date NOT NULL,
  `description` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `employeeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `barcode` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `grandTotal` double NOT NULL,
  `amountPaid` double NOT NULL,
  `balance` double NOT NULL,
  `date` date NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

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
  `userImage` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
