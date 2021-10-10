-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `inventory`
--

/*!40000 DROP DATABASE IF EXISTS `inventory`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `inventory`;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `acccountID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `accountDetails` varchar(100) DEFAULT NULL,
  `Customers_customerID` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  `payMethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acccountID`),
  UNIQUE KEY `accountName_UNIQUE` (`accountName`),
  KEY `fk_Accounts_Customers1_idx` (`Customers_customerID`),
  KEY `fk_Accounts_User2_idx` (`User_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `productName` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('Chair'),('Stapler'),('ointments'),('chocolate drinks'),('Powdered Milk'),('Milo'),('Can Milk'),('biscuit');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyinfo`
--

DROP TABLE IF EXISTS `companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyinfo` (
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lastBackUpTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinfo`
--

LOCK TABLES `companyinfo` WRITE;
/*!40000 ALTER TABLE `companyinfo` DISABLE KEYS */;
INSERT INTO `companyinfo` VALUES ('Brils Innovation centre','Pokuase- Amamorley					','0243930223','gebililasalifu@gmail.com',NULL);
/*!40000 ALTER TABLE `companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `memberSince` date DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedpurchases`
--

DROP TABLE IF EXISTS `deletedpurchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedpurchases` (
  `invoiceNumber` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `purchasedPrice` double NOT NULL,
  `total` double NOT NULL,
  `date` varchar(100) NOT NULL,
  `employeeName` varchar(50) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedpurchases`
--

LOCK TABLES `deletedpurchases` WRITE;
/*!40000 ALTER TABLE `deletedpurchases` DISABLE KEYS */;
INSERT INTO `deletedpurchases` VALUES ('','Nido Essentia',7,1.2,8.4,'2021-09-27','bril',''),('INV-0000009','mmmmmmmmmm',9,2,18,'2021-09-29','bril','mmmmmmmmmm'),('INV-0000008','fffffff',3,3,9,'2021-09-29','bril','ffffff'),('INV-0000009','mmmmmmmmmm',9,2,18,'2021-09-29','bril','mmmmmmmmmm'),('INV-0000009','mmmmmmmmmm',9,2,18,'2021-09-29','bril','mmmmmmmmmm'),('INV-0000008','fffffff',3,3,9,'2021-09-29','bril','ffffff'),('INV-0000007','kkkkkkkkkkkkkkkkk',9,9,81,'2021-09-29','bril','kkkkkkkkkk'),('INV-0000006','agshJZxjhZ',3,8,24,'2021-09-29','bril','asdas'),('INV-0000005','sghdjhf',3,3,9,'2021-09-29','bril','dfdf'),('INV-0000004','Royal Digestive ',38,0.5,19,'2021-09-29','bril','Nutifoods Ghana'),('INV-0000003','Non-Dairy ',12,0.5,6,'2021-09-29','bril','Balona'),('INV-0000006','fdf99',9,9,81,'2021-09-29','bril','dfddf'),('INV-0000005','hgghfhgfh',9,9,81,'2021-09-29','bril','ghvhgvhg'),('INV-0000004','ashdhdhj',8,9,72,'2021-09-29','bril','nbjk'),('INV-0000005','shadihidhsu',4,23,92,'2021-09-29','bril','sdsfcs'),('INV-0000004','zxgcvhjzjv',8,8,64,'2021-09-29','bril','hgfufu'),('INV-0000004','xjhbzjhvbxjhvz',8,7,56,'2021-09-29','bril','hgfhjv'),('INV-0000005','gjhghujg',9,9,81,'2021-10-01','bril','hufgufgghu');
/*!40000 ALTER TABLE `deletedpurchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedsales`
--

DROP TABLE IF EXISTS `deletedsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedsales` (
  `invoiceNumber` varchar(100) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `date` date NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedsales`
--

LOCK TABLES `deletedsales` WRITE;
/*!40000 ALTER TABLE `deletedsales` DISABLE KEYS */;
INSERT INTO `deletedsales` VALUES ('',NULL,'Center Field',12,2,24,'2021-09-27','','bril'),('',NULL,'Tecno Camon 15',4,5,20,'2021-09-27','','bril'),('',NULL,'Milo Mix',1.7,2,3.4,'2021-09-27','','bril'),('',NULL,'Miksi Choco',1.2,2,2.4,'2021-09-28','','bril'),('',NULL,'32',21,2,42,'2021-09-28','','bril'),('INV-0000003',NULL,'zdajhs',15,3,45,'2021-10-01','sali','bril');
/*!40000 ALTER TABLE `deletedsales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `name` varchar(255) NOT NULL,
  `level` int(3) NOT NULL,
  `status` enum('Active','Deactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('Admin',1,'Active'),('Employee',2,'Active');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printinvoice`
--

DROP TABLE IF EXISTS `printinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printinvoice`
--

LOCK TABLES `printinvoice` WRITE;
/*!40000 ALTER TABLE `printinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `printinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printoutofstock`
--

DROP TABLE IF EXISTS `printoutofstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printoutofstock` (
  `barcode` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `salePrice` double NOT NULL,
  `stock` double NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printoutofstock`
--

LOCK TABLES `printoutofstock` WRITE;
/*!40000 ALTER TABLE `printoutofstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `printoutofstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printproductcat`
--

DROP TABLE IF EXISTS `printproductcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printproductcat`
--

LOCK TABLES `printproductcat` WRITE;
/*!40000 ALTER TABLE `printproductcat` DISABLE KEYS */;
INSERT INTO `printproductcat` VALUES ('1234567','Tecno kd6',790,700,12,'Laptop','mobile phone','2021-09-01'),('4543','Tecno Camon 15',4,0,64,'Mobile Phone','The latest Techno Camon 15 pro','2021-02-02'),('454311','Thisway',1.5,0,160,'Multi Sockets','Thisway chocolate drink','2021-01-03'),('4543111','Extention Board',50,0,1,'Multi Sockets','To charge phones','2020-12-22'),('45431111','Miksi Choco',1.2,0,328,'Mobile Phone','Hot Tea','2021-02-09'),('6008155007534','miski',2,0,61,'Mobile Phone','plenty','2021-02-09'),('6033000085795','Milo Mix',1.7,0,5,'Mobile Phone','3 in  One milo mix','2021-02-12');
/*!40000 ALTER TABLE `printproductcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printpurchases`
--

DROP TABLE IF EXISTS `printpurchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printpurchases`
--

LOCK TABLES `printpurchases` WRITE;
/*!40000 ALTER TABLE `printpurchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `printpurchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printsales`
--

DROP TABLE IF EXISTS `printsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printsales`
--

LOCK TABLES `printsales` WRITE;
/*!40000 ALTER TABLE `printsales` DISABLE KEYS */;
INSERT INTO `printsales` VALUES ('Thisway',1,1.5,1.5,'2021-09-03','bril',NULL,NULL,NULL),('Miksi Choco',2,1.2,2.4,'2021-02-17','bril',NULL,NULL,NULL),('Thisway',2,1.5,3,'2021-04-22','bril',NULL,NULL,NULL),('Milo Mix',2,1.7,3.4,'2021-03-27','bril',NULL,NULL,NULL),('Miksi Choco',3,1.2,3.5999999999999996,'2021-04-22','bril',NULL,NULL,NULL),('miski',2,2,4,'2021-02-17','bril',NULL,NULL,NULL),('Milo Mix',3,1.7,5.1,'2021-04-22','bril',NULL,NULL,NULL),('NutriSnax',2,3,6,'2021-09-03','bril',NULL,NULL,NULL),('Tecno Camon 15',2,4,8,'2021-04-22','bril',NULL,NULL,NULL),('NutriSnax',3,3,9,'2021-02-17','bril',NULL,NULL,NULL),('Tecno Camon 15',3,4,12,'2021-03-27','bril',NULL,NULL,NULL),('Tecno Camon 15',4,4,16,'2021-09-03','bril',NULL,NULL,NULL),('Tecno Camon 15',5,4,20,'2021-02-17','bril',NULL,NULL,NULL),('Center Field',2,12,24,'2021-03-27','bril',NULL,NULL,NULL),('32',2,21,42,'2021-09-03','bril',NULL,NULL,NULL),('Extention Board',1,50,50,'2021-09-03','bril',NULL,NULL,NULL),('32',3,21,63,'2021-04-22','bril',NULL,NULL,NULL),('Extention Board',3,50,150,'2021-02-17','bril',NULL,NULL,NULL),('Hp printer',2,230,460,'2021-02-17','bril',NULL,NULL,NULL);
/*!40000 ALTER TABLE `printsales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `barcodeField` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `salePrice` double DEFAULT NULL,
  `purchasedPrice` double NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `dateAdded` date NOT NULL,
  UNIQUE KEY `barcode` (`barcodeField`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1233424','zdajhs',15,12,7,'sdsf','Chair','2021-09-17'),('1234567','Tecno kd6',90,70,12,'Tecno kd6','bril','2021-09-16'),('1235478787','Tin Milo',17,15,5,'Canned Milo','Milo','2021-09-28'),('1263715634','Royal Diegestive',2,2,3,'biscuit','biscuit','2021-09-29'),('23123423','mmmmmmmmmm',2,2,8,'mmmmmmmmmmm','Stapler','2021-09-29'),('243543545','Nido Essentia',1.6,1.2,12,'Powdered Milk','Powdered Milk','2021-09-28'),('3643838','shadihidhsu',22,23,2,'dasxc','Stapler','2021-09-29'),('4543','Tecno Camon 15',4,0,62,'The latest Techno Camon 15 pro','Mobile Phone','2021-02-02'),('45431','Center Field',12,0,305,'A chewing Gum','Headset','2021-02-03'),('454311','Thisway',1.5,0,153,'Thisway chocolate drink','Multi Sockets','2021-01-03'),('4543111','Extention Board',50,0,1,'To charge phones','Multi Sockets','2020-12-22'),('45431111','Miksi Choco',1.2,0,319,'Hot Tea','Mobile Phone','2021-02-09'),('454311111','NutriSnax',3,0,718,'Biscuit','Headset','2021-02-10'),('454311112','32',21,0,2175,'dfd','Headset','2021-02-02'),('45678','hgghfhgfh',9,9,4,'gfhvgvhgvh','Stapler','2021-09-29'),('5678','ashdhdhj',9,9,8,'fgujhgfu','Stapler','2021-09-29'),('6008155007534','miski',2,0,61,'plenty','Mobile Phone','2021-02-09'),('6033000085795','Milo Mix',1.7,0,5,'3 in  One milo mix','Mobile Phone','2021-02-12'),('6425398178108','Royal Digestive ',0.6,0.5,38,'Biscuit','biscuit','2021-09-29'),('6756567575','kkkkkkkkkkkkkkkkk',9,9,9,'kkkkkkkkkkkkkkkkkkkkk','Chair','2021-09-29'),('6757657','gjhghujg',9,9,9,'yuuygug','Powdered Milk','2021-09-29'),('76543355131','Non-Dairy ',0.6,0.5,12,'Powdered Milk','Powdered Milk','2021-09-28'),('786732486','sghdjhf',2,3,3,'dsfs','Stapler','2021-09-29'),('8397829983','agshJZxjhZ',9,8,3,'duygfuhgfhsdhkjshd\nhskgjjdhgjhsgd\niosduiohiu','Stapler','2021-09-29'),('87236482763482','zxgcvhjzjv',9,8,8,'hasdgjg','Stapler','2021-09-29'),('8797987','fdf99',9,9,9,'dff','ointments','2021-09-29'),('88929613232','Malt n Milk',3,2,5,'2biscuit','Stapler','2021-09-24'),('889296132325','Hp printer',230,0,371,'Deskjet 2130\nblack and white','Headset','2021-02-07'),('898737323','This Way',1.6,1.5,10,'Chocolate drink','chocolate drinks','2021-09-24'),('9828828823','fffffff',3,3,3,'fffffffff','ointments','2021-09-29'),('9890787656','Joy ointment',4,3.2,31,'herbal cream','ointments','2021-09-01'),('9980317323','Nido Essentia',2.6,1.2,12,'sachet nido powdered','chocolate drinks','2021-09-24');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `invoiceNumber` varchar(20) DEFAULT '0',
  `barcode` varchar(100) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `purchasedPrice` double NOT NULL,
  `sellingPrice` double NOT NULL,
  `total` double NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES ('INV-0000001','1235478787','Tin Milo',12,15,17,180,'2021-09-28','Canned Milo','Milo','bril','Nestle Ghana'),('INV-0000003','1263715634','Royal Diegestive',6,2,2,12,'2021-09-29','biscuit','biscuit','bril','Nutrifoods'),('INV-0000002','243543545','Nido Essentia',4,1.2,1.6,4.8,'2021-09-28','Powdered Milk','Powdered Milk','bril','Nestle Ghana');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasescart`
--

DROP TABLE IF EXISTS `purchasescart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasescart`
--

LOCK TABLES `purchasescart` WRITE;
/*!40000 ALTER TABLE `purchasescart` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasescart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `invoiceNumber` varchar(100) NOT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('INV-0000001',NULL,'Royal Diegestive',2,1,2,3.2,5,1.8,'2021-09-30','salifu','bril'),('INV-0000001',NULL,'Miksi Choco',1.2,1,1.2,3.2,5,1.8,'2021-09-30','salifu','bril'),('INV-0000002',NULL,'Tin Milo',17,1,17,19.4,20,0.6,'2021-09-30','JAck','bril'),('INV-0000002',NULL,'Miksi Choco',1.2,2,2.4,19.4,20,0.6,'2021-09-30','JAck','bril'),('INV-0000003',NULL,'Thisway',1.5,2,3,48,50,2,'2021-09-30','sali','bril'),('INV-0000004',NULL,'Royal Diegestive',2,1,2,48,50,2,'2021-09-30','verna','bril'),('INV-0000005',NULL,'shadihidhsu',22,1,22,48,57,9,'2021-09-30','saw','bril'),('INV-0000006',NULL,'Tecno Camon 15',4,1,4,48,50,2,'2021-09-30','sawq','bril'),('INV-0000006',NULL,'Nido Essentia',1.6,1,1.6,48,50,2,'2021-09-30','sawq','bril'),('INV-0000006',NULL,'Nido Essentia',2.6,1,2.6,48,50,2,'2021-09-30','sawq','bril'),('INV-0000007',NULL,'32',21,3,63,48,50,2,'2021-09-30','tawiah','bril'),('INV-0000007',NULL,'hgghfhgfh',9,2,18,48,50,2,'2021-09-30','tawiah','bril'),('INV-0000008',NULL,'Royal Diegestive',2,1,2,48,50,2,'2021-09-30','john','bril'),('INV-0000008',NULL,'32',21,3,63,48,50,2,'2021-09-30','john','bril'),('INV-0000008',NULL,'hgghfhgfh',9,1,9,48,50,2,'2021-09-30','john','bril'),('INV-0000009',NULL,'Miksi Choco',1.2,4,4.8,4.8,5,0.2,'2021-10-01','sam','bril'),('INV-0000010',NULL,'mmmmmmmmmm',2,1,2,26,30,4,'2021-10-01','hayford','bril'),('INV-0000010',NULL,'Center Field',12,2,24,26,30,4,'2021-10-01','hayford','bril'),('INV-0000011',NULL,'shadihidhsu',22,1,22,26,30,4,'2021-10-01','jack','bril'),('INV-0000011',NULL,'Tecno Camon 15',4,1,4,26,30,4,'2021-10-01','jack','bril'),('INV-0000012',NULL,'Thisway',1.5,3,4.5,16.5,51,34.5,'2021-10-01','samjoe','bril'),('INV-0000012',NULL,'Center Field',12,1,12,16.5,51,34.5,'2021-10-01','samjoe','bril');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(45) NOT NULL DEFAULT '1234',
  `accessLevel` enum('Admin','Employee') NOT NULL,
  `status` enum('Active','Deactive') NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `userImage` mediumblob DEFAULT NULL,
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'Salifu Gebilila','bril','243930223','bril','Admin','Active','2021-10-01 10:58:03',NULL),(348,'Fatimatu Jibril','fati','7876543210','1234','Employee','Active','2021-09-27 11:22:41','ÿØÿà\0JFIF\0\0\0\0\0\0ÿá\0*Exif\0\0II*\0\0\0\0\01\0\0\0\0\Z\0\0\0\0\0\0\0Google\0\0ÿÛ\0„\0\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\r\n\r\n\n\n\r\r\n\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rÿÀ\08ª\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0K\0\0!1AQaq\"‘¡ğ2±ÁÑBRá#bñ3r$‚’C¢²Ò%Scs4Dƒ“ÂÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0;\0\0\0!1AQ\"a2q‘¡BRÑğ#±á3CÁñS’¢Ò$ÿÚ\0\0\0?\0øfI$ÙÇ»V<]y>ƒºÑAì)á¿*¶»ÀĞ©PÅ3ìÍO.ş\\Œ†±‹= Wnı!cWavæò¡úÛÁ¡ZDLjmX–>!>¡±¥­ÀÓÃÏæ\"^¬7á\rS\0ÀÔpÁ»¡Qy*Ü}W×8^0!‹ƒ©,‹‚+åçH\rCàÍµEé§Êºìô™Lû$xqä2C$¦\"„Ğş¢ôÚ\"“»#‰2ä6ÚQ U…xİ¡û“ekE”¬Q‰6¦Ú>¼¢h{T—/JëàoiS#IÍnÉ\0óké¥9ÅR–ÇE„ 5pZ ·Î*A)»%ÍD—c^6ŞËA«,áå&¥™È\rµòá\n¶N$9kÛaÈïÊ£@NÂ\nMMNšĞú¤	ä\ZVå¾ãh-Y!¨ÌÄ´k7Ú#˜T–E8ÛåÏüÀmÕ±|ĞsSBsb^À8ûó1‰E™ÁÂjÕ ¾jU<°c/PÈ\\µÑøšµ…«ÈÛ„\n,¥v7o™ï„jô2{y(W]`-hILogtí”¦Ãƒï\rbø\Z¢À»DjFã8-&DB&vA%!Åïr4ã\n›\ZÈ†Q$\\=îüiNîqgxÏØDv[T‚	°¨Ø¨×¾NÄ<’ö,w [™ó1_|¸\r\0dTÜ*6Ê i£p§¹KTÀÆ!aÂK,îàSÇÇ¸ECŠ•\r3\nĞ†Ôp‹$´*$Jíz\Z¹<7nıÌ2tA™C«\"¯°\'ç¦Û.@\0åb§çSwàÔï‚¢²‘Ù­)¯tPëN/,(µÖÑÉ}ÂÇ¿6Ü‰\"²ZªÔ²xPÔøRsC$JØ)À*.Çk+‰zyÃÆB´\0¶búèY‰âßnaº\n@ÎP.ÍZÚö¼4j˜*?-€Jêtï­€×ù…»\nœ>ƒV/¿­¸CK\\Š˜/ZÊÇÆõ¤%»\"CpÌoáKpç\nİ…*$\rìIO;k42{H¨pgqëº/²š9úÌÿ\0O±ğ¯vçó-|ºc³’ÖôÕ÷åğX)R¡òÑµş\"w˜Å Şƒ…	ÿ\06„´YVVäºj)k†£nßxw\ZB¡ê’iZµ€¥ëş4Š¾ƒ4=2èEµ\rKÙµà`7ªC¥Èí©½ÛzQ¼V¤ÒÑ`ÂCmGğtˆÛ¢VÉ”ŠŠEì»k_V…‹Il\r—!À¡‰\'j|œZ×„mŒ’-áÃ\0@¥š¤ĞPšîĞŞÅºa³Pí§>>ğİ» ·¡ª¨ T8ğ¿\Z½Ì+TBQ-ÛMöì“S±,üÛh~EªÔ±w7zlÕ}ÃÂµA´ÒÈşêjmåZp„cU¡Š‘\\ÀT5¬C>·;w@îôhÙ\"Ô!ûLx›#ƒDò\0×…`â¬çJmÍıZºa¡’%½4\r`Ú4,¥ä‰\nÄMcV pôrlüÛÆ+ŒÛÑ\Z¡ØŒP*–İö·(Z½ ø~Ç× U,;—	)¦´ğvñd¥ª*å–%«pÎû°®Ÿ=-ĞrËAĞlÊ»ñõ¼F(8•¹M¿S`ùpƒ)™nT”“a@;Å‹÷ıá·dl©5İÙËš5€zèw‡IX9DHP\0=†ş:xo	\'á*-”°¡£|w´*Ö‚Ğ¥Š\0æN]J®-mÿ\0Ä¡h^[—4g˜8:ïİØF ±ËV$eğ/ZÛº$mŠß‚%¬¸b)ÎŒÃ“˜dí5â\0å^à(@:…L°ÅÚÎÇ“7:¸ïDr¢$BğÕ*g) -V xÔWƒÚ°³ÓTé,f Üôq´ÊÁAÊ–67&¶p\\w^÷1jb²&-‹ÑœsĞ¶æ£»Œ	?@¤&|‡5Ü86f£×vÒZÙA$hj*¿\n°Ú\"%&a¥Ú¶ä~¯Gˆ,*‚íúIï~ĞGÛFñVÒ\"G•) \ZT§ŞÆ¼á»“©ÕºœPT¤r|E;˜B9j†Hlô¹©(£0rÕÏÖ$xÈ•‚ìÁçümüˆ±ÍG¥$¯q¶ßH2HbZÀ?_(J#+M•Ø­j>â§¸Aq|¬kı§ï¤Wg=* 4ØsÛ†±µ.ÔXÃÀU·\ZéöŠQm5U³TW<·€¶yRëİÜüö0£µät™4­*ê7z÷Ö#dHdéb„ü\"§zÛÃ½àEş`‘d 1\0;Ô\nB®v2à\\¤ªíMv}Cqúx³k€¢Ä²õïîĞ8¥ØÚE¤JO¬–¤ÌiM÷¥{áûo€pY	¸µO#¹¬0áÀ–¾Ô}âÆè4zXàFÇFj“Q§Ê$¸\"\'ä@+ššhÇCüÂÆT,(—¹Ù›ş­{¢jÉZ\ZÆÔ ’tååh²U[$BÃÔ—Å˜½ËÕç]#=$5¶;+ì|Â‰\rPGq`m·Ş¬ˆ·%©£Ñ¹WÆ¯çKZ#ÆX$Ÿ½ï¨»ZÑ µ±le4¿ Î+üG\nIm¯Ù\Zšèú‰cJ\\Ş•;Ãh@ª.“àô}8ñúA‹õ#™¤\Z°¹äp¼2+cf(7ƒƒ¦âš‡é†!$Z„ÜWPxÂC°ej-.Ô|Í__8¶¶ÀÄàF—!uØ\ZE”ä_Hš@{‰ZÙq”7vM¢Î×E”\"ŒÌXpm«õä\"Îä%	ÄÂÎàìy7§0:%êjK¿g³°)ÛŠ\"w õ)\n^İÄiz‹ØCZ€’YáÈØú0ØI	\rrh8Ôø)¦¶)åJ\0ƒ©Qfz’–×kó®U¤X@[«Uª\rC5Â]Ì\"t7›³=\n\\¾Õ\"4$TÊèvûE_w)$sî¦–†q\r‹\n}\03ƒVQµë^ø	 XHà’N]@³éÅ†‘cÒì…Hj\nÕ,üjíİ¼U±éš\\\nh¾1S¿~Ğ©[¶ãÉ–ÁNÀ\0–«Í‹R–Ö,»a|dË \ZÙØè?of„¾Ôî„rWAD‚\\‚Ôf<\rUŞıìÂ,\\Ó²&Ñr.×\Z\r“Æ%[ÀB†PáµQ«}øÄã‘h¬Š\ZMĞËqfôğÑz#äR”H fqRv­Crƒz äN-ñÂ‘,;A\"ƒpmó„¡\"ÇKKĞ5|½oğ\\‚k‹\\ÓÕş‘¶\rÈ1~t´HÓEÉiŞ­^l<¡S.]Ñ8í+«ùGÉ¹Â…A w~îñæ\"¡´†ÈH,tsæ~†z -²Ä„ømİ_!iU`”t³5w¸ãÃX‘dhœÇj??Lb\n9wvqÀóÒ[\rØåJŒ-wn6ô!Û•%Ã ÷;6	¡¨ŠhI\0€w4¨îåH0¤3T\0µ+ã\r9¦‚Â(×³ÛÏçš,WCe*¯¦Ìİ¢nçHb±k,7±;|LCŸ!,bÑN•«€{mÇÊ½†ÅÈøˆæõ¹~06X–.Tğ`Õï¯­®íò¥ŠÖ¹g=¯\nİh±95£Øƒ{íx1õ`jÆHYsmˆ4äŞv€İ½tLéBô rÛ…KÀ¶˜Ë3dµõsÌ›ò¯ªA²À^»P\ZüŒ…bå,Š¨\\€E(æŠïòx³VD´eX‹Ñø¹cBÔhy2Ã\Z\0Ä¤=¨Y$ò°î„qLkgŒö~©âÅÌ3I !†iı@ÛPæ”.Eí·|*ÖÁe`A)»c¡%Ê‡èuÒrì6;’jìë`\r‡;sxvÈ6BÈb/Â´<ylÆ†¤}Š	ÓbbÇ r>\\ÁZ¹*f‡0âï^êÀ\\«*Kö¨À–$?6­6ˆ‘d’æ¬EE…jnĞíhRÆîö¶€÷UşUh-	–Š0¢‹’î¢ÚJmÍŠ3­ ¸n€m-ßëb3ÉÄ\n¨~¦	ÍaÃw\"Ñ<€Â°,ÅÅX€ÜÚç‰¦‰ÚzJXÔ\0¾¦Î/å½l±z	˜E¶\Z›„Pu¨­ŒM‡&@!DÛ-†‡zíx}¤ ™È¢jäQõ‰/Î\Z-ŠÅâ3ˆ^´cGõÂ$Œ„­û!U¹N¤\\_nqLè-\0@;ò<ÌY@’ÁÀ}h/ü44#ŸÎ—¼k»BPü<°[ õzB;Eˆ™fcëˆ<¯\nŞ¬eAK\0òva û4.Çlb%1 VÍK\rCìwˆö„H²”7©ãÁ»¾Ğ\\¯ƒ‡øj\Zƒ“}«Â¦A‚UëCZØoo\\!ehˆJ–\0Q\'zî‰àT¶:H{\nÒJ\r{¼›òXÙmÌ\0×ÃzÄL,…Hƒ¼­Ç`±Cê¤ëNú|ëá2DQ%*¡TT\r\ZãÃÆ+jØ÷C,C\0A/F\r­wz4(Ü<‚+ÜÀHzøwÄ@ ;è@r½­·ñ´J%@Öµ46îã\n–ì(¼Âô4KWøô\"è«LjÒ@\"àr\"ïå¼Vï€J¨IĞŠ=KÜ6Öğë|‚Z%3jÍFÊÛüyÀ{Ñ	)w;—æÁÿ\0E¢Ç°X›Ù©Vª´åRİĞ­‘*eö’yfä×mïw ±ª–åƒ`;±g\Z¶×‡QH©™-Øµî-B.ÜÙÆ‘%T;)Ò*Ä3µCùŸZSlz*âTÁ+q½Ò)¸ÓxtÅe©‹\'17.H:å!¡× z°á:Ë ¶Ú\Z—ˆ\"–a§òâ¬b¶©ĞyEyR¾\'İ¸X¿qSwÃ2(İ«@Üun/áİ\rÈ…Q1Å¤¸tĞÓÊ\rÖƒD…’A°mˆ©Ğ\"í‚J†HÄ»îX»3$Ñ«¥Å8í5NÇ°‘a®`ú‹w°ãÂ\n—¨(HbK8²ªÇqMM»â[ 4zb¨Pš÷wÜ=4®ÑÅAˆ5$R–z\ZØ‡ªM(Mš,Œ­PEá›3¸}òÒÛòÇCe*Û0Ğ¹$e<›k~e‰‚”rîûÒŠ³f»Úñ\\®ôB²ÎZP6R5.ÈÔ° ö‹®I«©<öµ\n‰5\rÀ”WzĞÌ•ÎS(jç-+±æ@ßÄ5hğò‚j÷*-£nOq©åGíùD½ƒ™OV5[U$Òà¾»Tk»$ûKyº‹sV…Œë’4DÓp\rÍ8e­wõ¼I+dN„-ş.É±:ˆ)S©	ÖÄ’ÃW\'†€Å–…£µ©Ë$6–¶ıÈi’íR(oM5²r§HŠ7°Ä±B:<ËŒ%ú‚‡J–.äs­è\ZüUl™r–ÙN.ú4-¥ø‘;.6î!y~PW$c$86¡¨\"×©Òºm	7êètÉu—ò;7¯A{¹;\'G»^ŸNdôH«”³ÑÒôç£pŠ{½àjO•q{4Ài•M¢àG8	!vÅ­l_û€Q;CÆ´?Ì?j`ce«³Şßã€Šª†¿RÌµ‹1©-ŞÁÏ§ˆ›ad¡ˆí3â;Zv2cI7¸`væGÉ‹D)CÄ‡à¸ÂÊ¼Lº†!Åö.OZÁ‚“ÕµêÕ³šı+¦°ÉÖ€öB“m¬ÕpMª4ÊığuÈµEÕÌÔŞÍ¨Ú—Ş;\03\'9jR¯ré-ÄV#ĞÉìZïåÌw7„Tİ ÑˆpUváûMşb\Z¼	e…¤›;¨Q¶jk8×Ä ½hŠìà¼µb‘$’Äí_í?fh.Vˆ‘w;hù™ÆÔgä/âvˆ¸%‰UÃjªğQOÅİåİ\nôCÏSÁ˜½É\Zr>oº\"Ø\nSš‚¹ğ¯q‰oÉ)‘]XåÛGbÛ¬:•’¨|²Â†ôf Ì§\réàé‚é‰–{.	}WW‹“ãFÂÙ+KÒ½Ìb¶İĞ/@ÌK‹šT±Ûânêx÷´dĞ()(\nl)]l`÷ûCËê\0ğåÉ&ÙG\'Åÿ\0ˆ­Ò\"¶2e*ÃF6$Õï`9\r\"ØÓDbzÁ˜%5 Pôp­ZäÄª“‰J]›´B—g ,–6¦ƒN†KE~DIK2K:^ú°wo÷4*¤3Ùì;ÑZAÀWÅíÁÆ#º$yˆš•|!ê\r,äƒ¥ëãÍ|Xô\'¤@º©şİéÆî×‡…6+C0à„¤0bR÷bBı­¹Vˆ‰ÃË9*C‚[-5×¾µ7Ö;%7+öªbö\Z59Ôâ¶İ\"%A(Y&•!Å†Îœn ¤ùdlbÍY P8:[BÌÉh7{!L/ö‘pVš¿òdHb)b£Æ¦Õ¥„?\0HƒˆŸû”\0òşaT—‘ª†£v€‰ÜˆsQÊç[¶üŞâ:2¢¸½\r˜’³Ñ©g\r¥Ç£´-‘….XØêi£ŸL!ĞôY7¡Ó¾Ş·±‡)FúZ×cÃ‡Şñ\ZÉ–fv§ğÜıV*“¾†¤|\'@iö·ó\n†l²&ªÌüm®‘\Z1®¶ŒıÛıÇŞ+ãA‰nUÜV^|x„•ø\",¢u…¾uï…Ú<‡Z)Ú¤ø[íFz‚ÛbÜ­ó„{“Ó¤°\rCs«›SÍùAÒ#5±`ü¯ô½Íè%KbHã—íâ*acP¢ÌC™»ƒÄ|â$A³F­Àî¥{Œ/q(3/qmlëŞwÎÂyÃ’	\rÏà>F±9T\nå‰§!µúénğ‚.IkøkÀš×qòˆß‚%²Âg\\^£3¿‰ôJ‚˜¹XN.éç‹ª^Eú\r”\ZµŒéqÄ­«cp8,5@…5â8\\Û·Ô–‚X;X,¨î€Ÿ€ÑU®ì_l¢àyö€›@¡¨U¬Ú0×R^Û^¤B§#@ÂôÔ)Á¿+ïì4ü)âîŞ\Zÿ\0˜³M\nš¥\0/¦ÇÍ¼b§¡ÆLGeìÔj–ÜŞ4E$¬©•daŠƒ¨Ô€	1)×ÏÎi+šm_ù¨æ4-”XÁbÔ wÜ“=Øx©ÅØ9 ×uÎ•\"•ù+]Ì))ø“g.M¨MÇZÂ5¡ÅÌ”ÎÆ½’ÿ\0íbÌ^¬.€Å¢h «+Š„€+•6\Zof«p‹Õ¶ rCWÕÅ\\TïU‡àZ‡Â… vYØT1I5ğ5â<\Z¹0¢%°§h°¸\näş\rÈÃ7¡W\"“-ª+¤\nêOh›÷=ØÚ4Ğí™!€]Ó¯ÊœÉÙÄ\nKbr§‚C8@4ôõHõ±K{åfZq¶½äS„v„N$‡4IÊÜ\n•SÍ­üÀj‹°Ä§\0†ÌMxĞŞÕááÛD“@Â\\¤k K±®¬\"&Ğ´-AÀ§İÄwñÚ# Ğ™Ë«ƒC«P\\(±äŞ¨öJ¢º¬iËbçNCçÎÄ6zPS\nè7ûBÓĞB	®®-o_8éÉì®<k¾µãËÕ¡tX&+‘)æhhğ[T˜ÄK¨ä¯¼S~£PäMª/ÆãÎ$´òÃĞ³éË]­GòŠÆLd„pm;…E =˜Z¥Oã¯ñØ´0J«8]Í˜Ä|‹[ñ3nÚèHì-£S¹Osı[„¶b(ìkOóÊ¾<âö„ò6gÊİá›ˆ$Â?”j\nTË‡,À gqÈÅnH)\r–°G=.ÏSáóçEà„!ƒ8¥{Ápş0ÉPXÅ$½´M~°Ê5°XÙocg~êµx·4«d\r3j_“>®ÔúCµªöIí¦‚›»m¼\"A³Ùq®àúù@°2hâ£më_8	Çgòú³hi·B¡(‘”³(NÏÊJ´†š)\'G[V,ü\ZİÛ\rÄÊ$8\"Àë§„+ÕCS3}ˆ¦Œ7î…˜BÌÌ	`—7¦b6\"!He4•¿f€İœ‡€½b´ìb’\n|KÔ°\râô‹\\ŠÇ%f÷9™‰şÒänæ\n-#f£\0Ï©.ş‡(ZĞ+K– ÃvºƒnbÈ»Ğ­]Å€&ÍCv+¤EÈ™Gf³åÓ·[Ó7 µ²&IÍYz’AÁƒ¾–Fˆ›ƒ£J¯iÇÀ;­{\ZÖ$dÁÚ ©¨ÅÉanZÿ\0‘$ÆLÌÑ%ß9\0Ü|B„†,Z@×¸‹S¡åœ®	ÊwV`é5ÕÇªÁ¾ŞJ˜•Y”@ÿ\0i£éÊïc$y\n!Nß…t–ğúÀVÁ*%3\\–äà.Ú¹:´[I‰dÎÃ6ï4Êâ×„ˆş\nKœÜ”óøXñ5Ò$„CLãZ\n¹\n.ÁB +]YÆş\"\r¾x¨µ)ˆÈìRª‘æ\\ñqÀÊ˜\"Š2‚…È;¸ÕG²)vÔøÀnĞèòdj¶büY^n< ør \\¶®H5!A³hÄZÚ<§Û±€		sV%ƒß¨Ô‘ö±jY©Ğtƒ†Ml½û¡¨ò8Ğ»x\r@†ï#Z-o¯~âº9Ü™DiJ³ğõ´l‘<•\\¸{ÍßHˆRÀ³‘Zwni¾°e†´P½ª/çG¶‘JuÈ×¡Å\"ürH\'ŸßxkƒP7jŠ‡ò¯y&R6æáèwáÆ\ZÂ™mİÏ/¼U&0Á‡\n±\rW&´\"•r¹UbÏßQÃQa| *„¶µÜ”U%Ld\nÜh_z]‡™‹{´WD¡$C»“àü6…VùÁeI¡mt©ù@’¢ ¥Ë!Ÿmôï0ÒV)3æh6ì^‘W‘Éšhím¸RÛR4)R¢¶‚•)lh“Şä§óøvZƒ’ ÔbÆ÷4f~\"ßàE<\\°{@×ÓÓˆ¯8©r=”ÙÍ*iÎŸX¹´ÊGeÉ\"–—ªÅi\0™svWİ´¨ùs‰²Pä#åüƒöxQŠê’î	½nlKùU†Ğ¥œŸ	4g8–½=R•ù\ZôÉ*pÄ3—/dğâXóij„ìQf\r½aE\nvÁKnx‚%¿´?6Šè!u£ÑÃj×™·|N¹¦•\nÊİ‰ ö‰ÑÇÃ\rÜÛ\rQqlMˆàßÌëÄ)­î	ób|)Ë”²:ipi½Hd†-ÜNÕ‹DzIÔhïo„Xs«]rË†9ªÄğbäó õAÜ\Z9lR†.Âµ¨Ö\rW«õ	Œ(Qõ	`Fà¹†ñò-Õ «ÿ\00	a]XùCFZØKH¨oÔE5óÖLòl(ƒZ™ˆİêç€Ã$FÀÅÎu0UÈ`*Î$ƒ`àíPyD‹¦†­ÜíÜH-aÃ¸òÀ0€ÕËü\\\rt·Ö$RÙ%ÁH§6„2€«\rÏ2_¼íH­:ßªÌÙ‹÷±,ıÕsihfV \0\\5H&¬Ö~wmámPA°H`r‚’\0zíV§–Ñ¥ÈPråƒ•ËÓ“’±ĞcßÆ’­´R\\8U~&#l´¶®XR¯ÆX­SĞ¼D†«‡ÆêÊ\0:ïajAl‚Ó%õ!ˆz³êY´âvù–M*š(\0Zº“Äw´FÌ‚pÃ÷~ÑrÕv4f\'hØÉ~„äsÊ´§ŒV ¤ÉP%Ëƒâuo.\ZÅš¼pÒõ³ßïüQL‡CZ¼4´ş9À¦[c1›q§3ó\Zéº+c$ÜµşaáZĞÉPÊŸP>¾´D»cp‰¦ª[ÏÖ%Ë6üM¯{}\"-Á¹ó­b\'d\r;Üh|R$¶	2¯µ-¦ß} F,”Ç7ÛˆäÍ\r%l”UŞÚ\nBFì’%\0>ãínúC$“#¶/£yİŒ6Æ¡‹˜Ï@ÌÀê	ûoÆ)òÀ]PME‘ş^\ZRC›íKp\0‘ß÷ƒ¹j±òÍ¢‰rJ=%owªGv×é\Z¢„aK£jÔ>UXğ\0ÛXªoz\n&l‚â…‹ª|¾‘[•\0UCSìÌ<à-ì³‡]I6Ê­{ÁáC%JkØ‚ä]Êƒ8‹`¶‹3&7»€ÜZÏÂ`äJ£X8Üø÷ˆHW™%éS`ö7wî«Äµd¦ÄjÁ.xÕßx ±³)\0=Z®ìXüÃ@«ĞOLÌÔÛmªIá¶ü¢Uì©/\0\\×UGxùwCwPµc§ k¡wùŸù¬ XR%r€W\"T‘È7Ìù@1%‹›\Z¸crÍëŒ@ÅÉ,^Æô^üšËœFØQérò€ä¹`÷©«w‹PÈFÁ)¡pH¨Í£p\ZÒğˆLÃg«[¸\0D:#\"tÆS;_	«şâ¾ô€Ğbÿ\0HJêKm.ì/ÏHÓ+â•»D»$¸}Ú!·jW²	Ä&»²ˆµqBú¤\\ïßö´D…Î †?zÔw½{&çº+½PZl–\0Š—MÄ†Ø½ZÔx=¢İ/îu*:9kQ¸Ã‰„íÙe‰Áb3¡\0K9/p-Nofx»å‹ìµ,‘À4Ş¦” Ôâõª°©ÏPAĞ‰%ƒí©-\nŞÈ©òÃ6•ì,I=ì‡Å®WBˆÆLz9ìªÆ„=Èûìğ)ŒGæ„6 )ËNP· hÒĞ¯Nq¹}J—dáK\ZCÜ_ÎMXÌhvò×z¼èe‰5ìÛlv»EmÙbªßë¡¾ğT©\0)Éwr‡ñåş*–0À’ï£ØqÒ%AÊ’s(ĞT^Å†[ĞµAÊQwéW¹<ah!IYpK9ÌâÄ7ÎŸXD‡±ªìáïv:\rõÂ$VÊäìbP‘±ş}p‹\0†.JIj‡	—­¡{¨	$ÊÒ•óòˆå¡‘‰l«0·}şĞ±!šˆ@­)SF}èİğ;¬)P=c…P³%Z=˜(Jh–:Z…u¯…Oãh€\"|§-vîuë¬!1Ü1s\nÛkÁIÕ´’J7Áí¦B+G\"”>ğ^–ˆ‘`É&œü\nj[HG+%–µÅÀ¥CKÚğ¬dˆ—-Éc½v$0#‡ÌÀNAJ’I ”€¢âÏÙ#¼mÇx€üGåvfaÍˆ&Öht…ç€æÉsÍ«CÃo¼#ˆLƒV.Ê¸6S§ˆª•¨‹á§ÏÎŒ‹e(Æà\r,Zp‰l„­-WwPtóHM;È0ëL)je×¯p\Z~ğò¢V@p–¡PqpRÜCüBÚ`~’†,š”SÀ’ßåÅXPÉ©«ŸÓüqŞu ÑW\rœ¦Ğ\0ûWO€·±›42K=XÔ*àwO¼Ê\0KQÍƒr\n£\\läÁv¶… ĞK‡mK§Ä\'Ÿu¡“µ`ªpcfºósİNMqˆZ#ŞÍò`xíïÁ2q—Èpä8%®[ás¾Ô¸†Z ´M,¦7%Ò®¡È;ƒR_H³¾‰DOK†’`”5ĞÚÄ@raHömõ*Ö­$wò…å‚Ê¸Å±qt€H¾À6Å}8ÙŸº…í°R	‰U^ îÖ¡§ÖºÃT2Pbû\0Í°O©<’Ú’\'l1BLò`^ÕHù“¥[xeÀ’¬©¥MR	¨5äÖ>´x»%R„‚š–BÍ¦–;L\Zrm@Ig.G2Kû\\µÑà¹j€V‘‡–ÁÀv¼\'ÄšR0ìç¼k›ç¾:,TdXÖÕëâ\"#–\0¨Ğ°áÎµ‰°¦;*öa¶‡ŒV=V MCÅ½| ­« Óˆ³·Â6;ˆZoÃ{¹g§Ş*±Éœ’ª\Zì}h{Ì2ĞcÂ.öo-ÏJE©Wş?ÎğŠ r-¡Uó;\Z°ğ‚ßhy‰/£wWë¬ÃC@;Zô¥u¾p%L€¤’,¥Ş¡Üóc7€º«ÒÚî-½`¾,sQI¶ƒ…)}Xj5à~şµ‚å|ŸµMn÷áÂ\'h,A\np@³.ÖnFŸH]Ä<–Àd—%Ø×“¨íş!Ûô hP¸³­Åózã~¡LzšÏP+Â>±WpÁöS¾ôryzãÚ Ü<Ğ \n%Ëjÿ\0ÏÒ\Z¬–-f£‡¡ªâ+a[¢RX)İÆìRs(~ÕŒ\\·=n(M(Õ‚¤/h¼2úÜ]ÀæFÔpÕd\'Ş´±îHäÍÁ¡v†@ÌC”‘bÚZÁß€zı ;£ÊÂØ³ë¹6?î¿(‰±F2¸ä³Öô/êœáò)pf:±¸«œRLÀ5%éBIOs¼H¡†-@”‡fÍKæ\0å§È`bËR¤U º´qNÕZÁª8@{	“½iJš‡>ë´­\nL©dÕÜn.êò †m\"!MKè(Ö&×;\"6Æ£ËÉ.ôÕËÑË¹ˆBñK! ĞèC|\'‹¸îç6Ñ(™Ã\0\0piÀ‚ñ?MáÅá•W$9#R\\\Z6abÛ5Mi	Adª[–\Z¤Ô8ºyRüö†TÁÁ§±74š3ƒÚvÕ¾\\ ·aBq’êàĞ¤;Ñ¶=Ïm^˜(R™KêR·ÿ\0¸šîÌ[V½\n=8œ¡@\0sŸˆĞæ¡­A´Zª…{*œ1eŠ²ƒ¨—ª[¾¢¢Úo·cÑK¥\n’@Hø¾-~\'Í›çx1|…¢ÌÙŒ“J°å\"¬Ü\"EĞ¢º ÄØŒ½LÜ\\ë¼=z\nÃL×9I?¨‡¥(K·¢÷´6’”Ë\Z\0İñ_Ëê7j9Œ¹×¯åÜñÑ“H¥\rÃË-ÜAÛX¦Ë(`b+¸¡mGÊ\" äI‰¡ÛÕ‹At8ùRÉ÷n±oT„z\0I›w})kïå\nö:h´’õîn>]Ñ]l!\'}>Lõ€ı,È.KPWøjÅ—àVX@îñjo˜\Z\n\\Â/]{Ÿ^#hVíŒ´XE×o(TÆ’´ı&ûµ¼bÆ…l©Ø‘¿™ù4!*Ë\n“Ps5\Z»‚Æ\"t¨’õßÊ¿7úÂù\Z…-7ÔŠ\nõ!îƒ°Šèi¤ĞĞ€<A&ıû´¾SgÒíj;ÀıâZx.e\0¥\0sº_êpx‹HÊ’ãNMR6bí¼,†\"[ò¥­J½xSÆ¶ĞIÄáW@ÏPŠ+ÈZ$$XíkQ…õ´å¨€÷Ê<ˆ·ËÑˆö™¸•\rWM88½a\\}HLÒ;N(Ä¸Ò¶öÖ\n‰áP\ZŒ¬]şÜâw_4nË|FŒù‰vÖúqã\nÛ²RÙ~\',ä(ä‘ÊÚ[Xe¢Ö_›s¶àhş‹6ÒĞ+«²AÜ\0>»7İ-Ú:\'dñ=—SaXqXµÏ«°}’]ézPœ¨kÕ½I£ëRÇ@+´5P·°¦ ¸;¦ºw¾Í\nô9äÌS(5ÜrĞüùo\0Ö¤Z´.x‘æ}R«\"‡B¤NŒÉ°Ø­©XAÜXšı4£°áSÙNN‹¹g½Z7a­yÆEÃ.@\0ŠÜŒø<ÒöJ\nH5½¹ëÇN0›\"*IšC¸İ›@ÌÄ|Î”gg‡úŠÑW*¤\0‚=N§µ·øk\nC\'¡Fœ€#J‡¿“pÚ¯\ZBĞ¼BÀ@ÊsWøjO\0ÚµÛh©íĞ^aÔ’t¾`@¸c³oÊüa­ X%.õnfô$ğäõ„c!Så— \Z€\0{0¨$kÏ^øxª#,‚YA˜—6²\\³;]¹E”*à½AlÊöì5aº´J\"F& ]\\Û†ú›\0îkV,Éü» ±J¨B)NOjÒØ·`è5õá9U™Ò‘Ş‹?*×åCÓAD+À]Ÿş;¡åŒ–Ùš›5KğĞÂÉ‘\"U‡ÔBüX?Ÿ[B«²PÂ’Ûæ^>š-’ØPiqbô>¼â¯!à5ƒPâÏÅ†Ük^è6ÁaK[¼î4ş;àöÑ,rNû]¨ai!˜Ä¡ÙÁw}>|~m‘¦\rto»}\"ÚĞ¾H0_“Qõf„ ÉEQÙÛ¿×tÈÆÊ”ÃÀ±/c¿®Kc§ ç9<ïX(Œ)1j°]¶àğÒˆDÇK³3òûqY\'\r¨	gkäQë¼?Š%ĞÉ*jußoO´%µ ¯P’¢Û;Â•õ¤ Ô¤æ<×˜ûnêÂ˜ 7¸ØÑô ôñ\0=+S_‹Ms´*cÔ‚\0jÁø+Vğğ‹u[ÙnjØU›(ßrXœWƒÅKè3v<)®(A«ìÅ¬8m:Ğ\0€¡«(-wš‹pzwİ™KV¡œÔót§”U{’ì\ZŠ~§älÜ^¦-L°CĞT6®Xøm!Ğ2€p@r5íYµgá.ÀĞ¹‡AMJæåÉÕşu­\Z2MĞ”YRhJ¬ÊÚRµ<è<Ì+C2a\"¤²~2÷`7æ\rkX‰Ø\nëRªå˜iw¼!ÿ\0É†ïÕ0råş–akP½”.	H-Ş–=˜’â $;€+ÀxTı`€ë:S5¸A°,[zïG@òWÇ5jX‡7pU@8æ5zy²ÚÚ#,/jàf \ZS´‹2FšÅ\r¹0°S \0jù™¹÷mŞñl€ŠİKš±	´hYA‹ó#å\nŞ´B‚¬C†,§æ+·8V™\'³•Ã(›&Âµ5Ğ¤FcfáÉ5Ê‚’)]<»M§\riÚS) ©ÊFW°£^ş;x™H‚Ñ%œ–—mYØ3€œ÷^Fà° ç/\'ÙÉp~(ÿ\0æ1±n„uä…ÉZASÈp¸ {VªĞªV1s(¥pJ•¡\'ƒ‹‚Û1nP\Z\r‹˜“˜³6ö<-jo‚L™Z­O­ÿ\0¶*¦9§e©Úº¾ÖùÇI3<]ht™Eè~ßg¨¾ƒ¦Kv ÓnÚy@î!2ÓG{»\"aˆå`o?£ˆfˆ\\Ã¬‡zó\Zlñ[dL.!ÆjÔWÅ‡+Ã_ ÖNVaQÚ¨$_º ä5pH/®â¦€Y@{¥(ş©p+[ACz­£³íGò1)UTäZ´ûVœábÆ,!;kâÚ_h}1V†‹Škäxê)	ô%ÃMM÷àåª%ŒQ4ìî/àÿ\0x¡½–ÖG*TScZqz±A4,uáO·:Áğ@$TÖŒ@õc¥İ =«\"äq	’ÚÒ”Ø½[^ø•H\"§¥¯~Óñq›ÈÔóğ‰¿\" …_’’ïÊ, È–é\Z‹«|-V© óïŠäÇJƒÃL/Sö\rB+p÷ë!-¡\"£jŠé_›ïDZÑ(·pÏbş×³îÊ§D|9IpÌ8í@J¾p‘Tˆ(-ÅœmRíÉ…w‹;E{J½È­èö¥‰,!dü\n’–ÊÚŞŒÁ@’Yès3¿\ZB%äŒ¬PV½oKêHn^0®ùAAâ0…Id›Ò¥˜jvìÅµaLK9ˆ¥,M]Æº³\0vç\n¢¼\nØÅ\ZŠÑ®ÌSANÿ\08U² ¤\Z³şªƒ`\09€ÖÎÖ´í—-†Ô;(‚Züîá.‰B#q|ÅÍê\\ÿ\0ÊC·+VŸ¨(Vw£X(_ÔCWl»=K\\–‘©j\nS€ Œ©É«‡ÿ\0\Zˆ¹%AD»@zÑé·7¤¦\Z¼HÅ\0£ÒZ[ü˜{Ğ›ƒ5ĞäÔæÚeè^•F[ ±Sˆ£\Z¨çSh\0¨;ÆÔ‹X Ë£0 ±¹\rı£}ùBÇDc&Iñ,§µ‰[PÓHwP„L$	.š)÷,iZx58Etù)I4\"¤î^õàuˆ›h\r 0óu¡)Jˆ\Z¨a¸nuãb¶ö¸X\rµ\ZºXR ½¶î‡P$Æ³Ú×BîâÕ‹c+ERBeáè† ÙØ±$ÜøøÄr$UüĞPbı ¥M|œMøÔí–ha&»mÜ–½h@5ô,R¤\'“ÈÃ­¨)§-\"¿—ÔsWJ·Ùöáê»ÇIFŒãeJÍ‹Å>K¼Ã§áÓs¶£ç„A“Bív¥YêßÌDF2zN—£?¹¬2 õ©ˆ>¿\nåê\ZPîiæ\"—ò½-¡ò¤‡%¸÷ßmŞ#–ì(b’/V#gàí¶ğ[\02æêô³ü½^bÎvrEô½â$ÈRêØ¹§ÀwE$ˆ‚o-½zç\\PíDº5v¡«pÛ×²Qåa¨Â¦QV¿®P\\“‹ŠúˆQîoŸœVĞö1Sîx¸[|»·ˆ;Üš³kÂ¢ÑmÚ!2]šÄ+–jŞÛXüéL<;j¾*–Æ®MM7ÓüÄoÔ	Ÿ<|FÌÄìCy;ßx®öÄÓLß;3µ‡¾ĞÄCfÂ¤\'ìãÄsÒ+QŠ™Ó ¬ËÊHrÖc~Íw7}áãV5™a%¶b†¾¢¼Èï	 Øì\"\\»eq¨¨k>à_üÁ´€ÖÀ?Åš‚õ.á›ÈVm\0²“A]m³\rx5dj€Â—ƒ–‰ÉLQRCPüDmÇ‹0k‡‰À\Z,É–÷ >gâ4P[sz…\"œ©dm”\Z?íûëİÊ#Ù8=‡Á 3)êä\Z· G«°ª@AÌ\r•·®–Hß@4ãÅ¢M¡®…bóe&€Ü;=ëÅõw¼#‹\ZÃ–“Mk«\08ÿ\0”8¦ğê,FÀ”X½AjÔX#[ìÍz3HP’ePèû\0j6©¯vÂj\ZÅÈPÜâ‘GÜw³*a¶¹&…a¥iP»¶K±ãO`+áˆ rÕb^¡*.Xµ-ç³?€q©Ù),nÄĞµùèF…î÷ËR.HNbôÙÍ=±(ö\rCÙnmMÂxpáÈÂ¦`œ³ÊÁ¡!îTYˆ½8îÌÎTˆŠØe¤³:M]Ë\0é©ç	\'àjYÖìÇ1¨u9h-SzAK@=-!<Ù PÙó5¨›\"ìB(Á†qVˆdŠ†{s<YƒÀî°\"¯´2“Q™Í©@)©û<YÈØ1KfrHGì‡`vÜ_ê%¢%b\r…œŠpë\"~ÍxqX…ªªrÊR™ ”Y´ÕÛ¾+T$¹.\"iáÿ\0PûÅ/âšœ¦Ò¬;w”n°!Ê[¶ÿ\0];â–­Ş‹2QR,@;×«CP¨	cNU×ŸÓº‚2J^„P\\m¥`0¡‚Eõ}CDOVFš‚ç—-§ñoc$9Ïd‡jùƒwášòJ,!é£;S÷iõå	\'±h2@¥ç‡îäô‚2\rHß/xÀd¡ŠùPs®»q:ÃrÀ¿qŞâ+r­!¨±%Üğ<¥…8çô{dv5	rß¶Çw·­^#¯G¥ æP/@|U«ğ;q†ÒÛ%\r›‹\r@,~L|¢·ê‡L‡ş8ökšôãÀE‰è@§L\0¿Fzñ¹>ñ­*å‰u$6abumôûÂÌ‰“!\rQ”†<C¹]ğ‘ä,aŸ«¢ö¥o--F˜£ğój?êq¡67îØÅnb(ÉHQ :”5#_á{Ÿ4?+0;B\rç®…D|h]È\0÷±­5ßÉ—±½±»‚—©Û´ÿ\0íp§.tä!ÄjÆ‘Ú$Õ:¾Ú?û^+å‘°±)J³~ F]Ùƒ6µZ¤D˜àºˆ­‡on$Ñ´¶°\Z±Ş‡K*fdŠ_õvƒoğú»>(EêzdÀuªCXš¶ígĞÑÜ\n=¤»*«€Ì;@ŸÚ–tå\ZÖ†„ÕáŞÀD½ÈqR© ŠÓJÓÏ’EW!e™“ìöd½¨Æ¯Á­­œ^ıßFV.Tû3ñÌI\rky³5Œ·@¡†`k’)ùöj·Ş-ÎW¾gÜrÙé¥ÈÕ ¡!n\nHìÔX\nŸñ¬-l`âs•®ö¡¥i¸ÓŸ…#ĞAl¦azõ\0*)ç!\0İÁÒ‚¯mO;Q7vA’e›‹ĞT¿h/bämAÆåšÕ€¨µ=j•\Z%­™Ü×G\ZšùÂ¹z\rÛê@¬ÂŸ`Ê\r¥jæ·­Z#â˜¢fËg6©jÓ6Z§¸T»r…º’X ew`KYªAÖ¥¶«p‹-KB3Ág¡ø›e\n14{RŒ<!THØ‰j\\à	ã¡\'¼H­êºÂI\'³JS´À·\'×–Ï¶-\n3ƒƒ^ĞY£°)pJ^ÃKšÄ«\"\n²Ñ»($3¨aRÚTÜóÔ2X©r‰$G,³İj[~è±J\Z*¯ [jY0ıÿ\0S?i‡”-`mFõÂ4*h°0	ácqÜ\"¥¦3LcÆŞ7‹tø\rS¦­_„zÙáW|Ãİ«½@·­b§v\ZÁ4 pZäiÍ¡¨je&ùùêñ;—‘’\Z¾OO1ÇÖñ5ÈY)–_qO¿ñùÀÔ)¯@À?ÿ\0#x,	\r2ÅA¨faC@Çé€Ct«¾¯ÃçH-VÈ7‹\ZZ_×G¾ÉuÍÍÚ®ıá”mñ;pbş\rßĞÈ\0RÊwz€ßÛZĞE:¡FJÃ8ŸÜÖµHâ3I¢\nZƒ]Cì\rÇ6×øz«Dc°øX›À–5ñÛ‘Âmğ6R_´(\0qÂõ=îãø0%Eˆ\\ŒÀŞ´¦Ã¼‘¯Úc ØJMRÖ´#J\ZÑ—zh{Zà–	Fº\0oÓ˜©ŸWf:ëÆ*—#¡’E*-š®+”öMèõKpãärS9š§k_3\09¤ĞÑ¹CĞ¾FÊ\r˜ùH\0Sç½ˆû4+z\r[Ú¿°,M5rş­Ä\"~$0¤Ïvvm)}‹\0GÊÑ¦-JƒÓGc\\ß#ö„“\nAËMAu3\0*åÀ,Ô^á·†‹ ¬0í0¾R£{»%ÍC”±»·#vÛÁ–;,î?swVå”@jğ¯e¤˜bVé4ÒÌç5Yßáoá¨ü!`Àô[…,ê¡ZÌÍÇÁûá¥¤E¶Je’\0kĞ»éñ×@4hÈ;T-8Â°nÓ½K‚ÁYµØ\r?1rÄ,å)¨9†Wp+ª€ÍN÷vĞl¯ˆ.¢iV,µ¨OKß¾•rƒ˜r’K”»‹vÜÖ»\raš¤AènÒšµ6bC0}öî¤-®HÄá&Š\nfÊCiÚ‘]ê÷°Úuh•1pQ#3Ô‚	-¹];ÌhR¾p	u1cBEÅGjpï[³UÚVĞ˜“1†à[R@ø¶©¥{â•3eeâÒ2‚îhhmB…9½+xµğGË­hÅËÅ\rtàÂ¼`$xÉ$z\n;—¡Ü½é¥§jğ¦&Zù¤ÜÌ¡ÙìM¨MâØ%_Q]Å,ÑÀ¨²à¥™Ã36¶qÆT¬ˆt¹eƒI{è³Ü-F,‰ØY_3»V*‡ØYÁ%·İÅ‰\"»Â,$å.§	ÌtK>bÚæ ÜxAÑMR+¦Ÿ¼C¹,,_ŒW!Š\'SFµ<)´\rÑŠ—wáåşcsnŠg0cM‡Ì}wa[iIw§bpDX—5ÙÃìOÎ%‰Ó\noZÜEøÄú†&Ìm§1&Å”\r\r]#ËGÿ\0\"\ZU@u·v®5úA•% ‡-}Í}¸§?æ+[\r–‹\0MjÜ¸pÚ\rŒ¸rĞìú÷\"6ˆ‘2UnêpæßN1[aIr­+ã¹äÚCvèV˜8°©©o¹mábè%„€ÃÕ³úz¤2ĞIZFµ[‡à\rÇŒ\Zd ât³µAæ>{Â¦\ZKq@EËqšW¾\"{<Az3ÿ\0pøš¨ì\\x;Af)§êÍp{$¹bœ—Ør€Ø(‰È¹¬s5CŠz`xÄºBHoØA.ïAµu6f=ñ¶\n,KÃ‹p	\nµ«i¯7Õ¡e±A)!¨@v%ÔI¨5§jÂ§±€ÉÚ\Zµ©[~.ÅÅmJ¼5ª–%ò.2¦•w½ùüLíÈ0\\‹X\nĞ[kÚG¿˜JÉ!‰œÀà866sF‹ç6ÓlqJŸM\r¼?¸Ùô­\"U€‰3×²Ä? Í_/¼ ’§UÆV–©¡øF•¬ìö¼Våè\n@#b(ÍıÅsfãjB´Û\n…°NÀÎÍ˜€\0f¶ ï ‹{«Z±rUwt¤8F„¾€ÒƒM42ºØùsjK3„‚ê@Ùœåğ\rE>Ãš§\"áC³kåøö_íAš$Ó\0œ,ÀäŠ±5Ğ›9!õ\0›ØPj;İĞİ¦=2ì¸e_gHvmÍ\\\Z¹­ƒIFØ¶\\\\ AÚà?î5æköh-¾-ˆ!ê–©Ê(ÛrÔ¦ìÑ[u ò(âìRÉ<HKÆ”K×¸>‡LZª+hxee9É±«³En\r«Áä«Á	Ã¢å?ª€Üš5uŸ5-£#w¢\0Œ;½Í\rx¿i5h|‹BĞ9!IS2† µÜñî°…ä+E)¸BÙ’JE;\nä\\ìíNµæúZ`vø™ì*‡P¸¡/›µÉTa”A°$IS$+dŒ£p×Ìì7“C´G.Ş‹FušÎ s5bÕµ\Z3wVÛh#\nA©.úÕ’4\0q·\ZšhÜ 	@«’jõ²²³ff¦æ\Z/b”‚ÔÃ1djÔ°PZ„×€\Z\\Õˆ™zr`’—ıC´oÌ;WÄ:8®	e…àKÑğh^Ô5šÄézÖá¶Ñ¦.ÊÚ/i­ª\Z£JzùÁ­„ym7C´GTˆRKhXm®ğ”Æ±²‘@6¶Õ·&ÓHÂ†+Úõ¿(®Khk&»‘N± &<3©ö~p¾<ÈìêïB9Ò\nT9äÉÑÜ‚àØ‡åãèEr Ş¨TjjFàÛøjÀh“f,ißF¯-/PmhBJ\0Ãñ{Q•Î¿æ#WÁ™AÙ³Q ¾ ß{BÕ:	%Dä»›\r\"=^QÑ,—µ9(qÜZ”z¢3+v/O\nq.\\kSÄEJ>F³Ò’r±j‡ {›kº…\ntµ9_ı¶6ÕÈ\rÎ)|Œ0¨‘b	MjMBágîÚ:™ªqM+Ü@¨\"Î‘S¨n0ì	Ã¤2CĞø™?nûÚ‘%+	^ye–À>Vgb\rkÀÚ°¢7aâS\\Õ!$µİ7p–{€Ç—dC¥JCÅŞ”Hq£¸\'shG¥¡ÃÂaÙ”C6p6¢\ZĞyŞ\'€1‰Ã2”ÅêïftIs£p„aEŒ\" 1`Áÿ\0ÚK\Züö¼I;@\\”áÙI·uz€wg{@KCÑa\Z¶¤®õäÌ´rÌO«B•’²Ú±,Ö¿Sj§ ¨-Pa\\+BÙ‘£e«‚{B’KÙ˜S®èâX¸#­¡Õ€æÍÿ\0™;ĞRïÅu©V%7PY<|jñuXœ;0€~Îf\0‡?©İ«°-Î¤Â4¯Lˆ$’J@,\n‹–ı-AF¯ƒÚ91jÉBå»3x¡\n¥¥ß€ãÒ%\r™(¥ø™È0ëg<IçJ¸MBeaÆ{°*$µ˜†ábê7.ûv_¼J=0† \0Í¡ì‘¿\Zñ„lb%¡¶ôk½mË…St	K–  @cBUNîøu-P´%8§%ìX¸5Mó¨!¯Î04Ã˜%À)\0)€.ï@5ø\\ãZÅ—è\"DHÃ‚«V U³f?@úí¼\'¢³\r>$+BC\0{Ufp›k®ÉØ‰ŒHQÌê`KjÅ/¯U{T²¥Ğ’]ˆ)í\\\Z×pF­åŞØHFæ¯i³U€)K) “C¤ÊY§@ hØŞ_X›à†?§%¥nC³ºˆ\0ØÉª@frû³Ş-Æ¯2W+²l{K¤XÜ¾®j·NŠÏ´k]‰t—ÊJ…è	7ÚÒBS\Z!$h]_ûá£Ö5ßO´j’í–ŠWíÏ—!¶ír9aJ#å[óã§8\rQD·ÑÃ(\ZŞÚö´\'uhjE‰ÀŞÖåëÊ\n°(ı[¶¯]ÿ\0Ä+[)jr[‹÷ŠA¡PùR¨û“­*)­ŸÎ-–>JµoJlG§ƒ/@#ÙƒXĞ‚Ìúúkq(Mt\Z¥Ã8?´[×tˆ‹†öØÚ€£¿„*a`- $Û¶´5ŠYÊà1ízlÅùZß‘Ğr’nüØÓø‡İ\0°nÌ×#jµ6åÇÉl`ŠH\0ŞŠ$½²Ô0T…hô¡ğ„¸0\0|%@¨³¶¶~è./‡…Ò•P›PZïaæ9<WÊ\rœ‡¡¸­ÀØîâü)JAQ¥a#”å$ØöHk6”à\\š7\rr+¡$;S´+R(\Z—¡â_pÒ­„	A5ì°$R¹V¢àpk½y´7€–’\\e.H5$Óıî‘ÜoÙ…M‘@¹\0³õwºÆS­Ã&ÀZĞÍ¹,”X²EI«9%êÉzKÑ©èbşœ\Z—¨!”\r´f©w%©Q¶Èœ&TšÔ=@4\r•4Qgßä`Ò #İ!8B\"ÆOp©Rûå‰DbDÒÉr’À³+R@æhî\\Šl”=G+w5©\nîÆ”ĞÚ[d¡Ò+˜¡k(3XÉŞ¬\rÃi\"1X©‰ªUJ‚¦ S1JAÿ\0r€Ëb­5Ûå»d™G3¸—«‡4<ƒ9ã[ªİŒ!;¤e\0Ø·›€ÅËVÖ/\r%åÀê¨³‘«\0A,hïJæ4.ÂhQY TRºĞ¡œåw Z3ÑT¼€©,]2v|¡À£‚`RÀ†$7àÒ’ìBXÚŠí+1rãÑØ\ZP	-ªäz¤B8åa^Ñ.E*Z½ûE\nĞíX•%……É}Áu®Ğk\0\0;\r\\X¥|‚¨d«X…\Z±«|,Ÿ1QWò 9â$7û¬+Äña­b$Éa¶añ1í›Ñ²ä$Tq­¹EĞ*&i{6V\0_´\\»er\r·rÎX¶¨AÅKìèÌ­İD3è\Z®õ©a)±dˆ”hô%DEÁ!Ç­Ú´QRÙC9p\rtm	k=I`\r\ZŠ4ÂHY\0«\\¥ÅY’ G÷:E”\0±2…t\Z¨İ¨^¢¼`%äŒ­<e%ZeÌÂÔ$ÒäÑ>ÍŠÇ,å‰QÌYÒl*×t¶BIÑÏiY|H%¶aBCVÀ‘`ôJ5!ø»÷²YâXMw\n	E	õöhß•SÑoe½ì{˜yEJüc»îÜwƒ°Œ•.¡¥Èîãg€’{ é‚Õ¹ï=crm@ş< Éb(Ô\'ü×áû•\0”KØP\ZÜ58knq_rCøÄ¨Fçí¥uƒw°\r8j0\0ZXWKSZkÒ\'#§ t:îX[{\"=Ôö®üZÀ/ÏÖ{|Œİ†&Àh|¼Ë·”%lˆ	*`wó7v{1·t˜Ö4$Ü\Z6§ŸœYBJõ\0Ùê	ƒpÜ‘n0Ò¤“Ù ènô#~to1T“ädÅáe°ÊïbçGø@}…@îÒ±°™…Ã.Ôİœ¸ßCÄíŸ€Ğ• èi•@?÷\Zóg6]­ò	­…Kjâ®ZÌêmmS\0UÈé˜rÍ—5À¡zâà1p¶c[bfH¾P4wp‡¸²nÌç‰º•„,Òd¤—K»—%[K˜\n^Ğó0š6©p]Ã‚TËJh@¢Ü‰j,ìÆİøHôH¹¥·1Yb\']#â¢©KŒ´*pg!.ÀPBmíDÊ),\\²‚kV%Ã0ı$–;>m]ÛïiˆhYQ`”¹q£Š(µ]-bÎOxé…+\'\r,“[¹5¾RÆÍÍ˜åÍÖìt.JŸ_‰”ö7ªßøaÈSÔ³µY¿\0²q÷TeÌX\njà>Ú=˜‘ÚÙ[õ\Z°\nœ3e¡ (…2T	JÎÅÚ)­ UìF\"at³¹ÍqM;Eˆ,	¨n%µNÆ¶=‘:AYE@-™Û+Ú%É¹º›7\n*uø)k%)4\"…*Ş‰cJUu\n¥*Õse^…v.Ib¢À\0\\håê)a£Ô6¥ª, LÒQğ–:0)rH­9¹Ùõdßô^\rTsR@zÙ´±cÙnah3~\0‰…¥C^ßz¹ªC\0\Z·pAŸA€Z)Ö„\0,X¹%öûÊ¦ÀêI-G~n(ÒÜ\0-h[‹áœ€CŒ¿¼¥Aê;e,éı@L™•óCåf!Ó•Ë0­F–¯(ìé’Éµ\n)Q¥ô¸`¾Oi¡Ê,(X†$„ÔÚçO\nˆ^dLÄŒ©BU—S *£¶×ŞñeP¼Ÿ†Ğ0Îâ¯zm¼ó¥jJÆ¦W—0–6 +KÛj»\\p£[¦\'1Àfœå\rP^æÚ?| ÂË®Vı)$×zğg®¾²vE¡8)™ƒŠ…cp‡ïøª..a’½0PiXHÔ5\r˜&†ÿ\0¦½æµ£C8è\Z§\rÆ)±bl¢ô4ù‡Ûç.LÑC°jsV7õ_”+.HiSk\r¡`Ó­iå÷ï€İ-†¢®ÿ\0oC˜…Š®@:H5ıÛùÄí¶5Ğ(ÂŒÆ®áÈµ¶kER0¢ì4…wŠ\Z:¦¯\0xñ¥¼?ËEPXA \0t«wÔÓ»/B¤\\’mkU†õ¡ùñå³Ô6.LdX8æl@ØµE\"(ÙI—³ıŞ½2!Ã˜\n•D¨Š?«Vó‰ì!Wƒ/sÄY¸Ü— £×ä%„üD_g¯µjZì<ìi7b¦D–|¶M(A:kŞ\0ØÀÈ\\ì(5\\µÈÒ­ùöRTâÁ\"ôsúkÁ/âüáSpJ–/ßJ6 ’K9TÛT¶K a¥ŠT*gII\'µ·éÙ…mÖÂ \nTC3e/MÀËbäiWì–\'0€¶;!.USÖ_ÒE‘\"¢ğ›ò]Ÿ0×PÅœİ! ¹§g´\rwj§d³ú\n7‹¸bÍÇƒ×âO!£BU„\0S3Zà9ŠŞÀ07¹u9ÙBAC&Í€\n¸…*ä)m\\P/VŠâh.†L‘A\\´rw­’lZ…>P8[!ì€mÚ\'q˜ü-CUT¶úÒ%dº<‰ º^Ã+ÕLÍBôµ‹]ˆˆUI Ğ©Ô/OŠƒ5OfÅ’)ÏGzB$? ªƒ€ZÍeªª†Rá©K\\ĞÙjEl<ÂRtıAšÁ®5 ½5¹ÌKÅ‘zª*@Ês\n©*¡‹Ô¥•WuÉ\0µœE‰Ş‘]zƒ&fæ¤)ö\0$V¡ÎWÓU(–&YZA,Õ€.@rš$¦Å™È.‚Î\"câÃ&TLİA5Rå‹æQ¨ê ^¶‡’Ø©èh[\0éÍ›-êõÌ\nµ5w¥øÂí\"¡–Ç5Y”ö\0(=œ94\r±<‰ ¦yséÚ!ŠC(vÿ\0H54#´A:;ÄíVÄ©=§	r@»‹\rµ-Á‹à\0ã–ºT %ìæ¦€0Êãk‘+òÀTôíÚ`¬ÌÉ\0€;\0à†:ÔÃ²PÅ¡Ø8¨G.ÚQ˜›9\ZŞ›u=ˆt†ı\0Ww$ZV\Zü	e9xB;ML¨*HÑ@’‘À$U[Ğ1z&ƒE“;8,_3±+¡eÀî\Z§¿€w­\0à€E©o÷=\0Ü­8˜œL¢JK³­èÄ³?yX kµÉ[Ùã˜eÊ¬ÆÀ†n-¾µŞ,—‹êéJvªàpÉH­\0Ú·Nìb‰ÒˆÚÅ³©‹—«Ğ=Zê¬&díª\\5\0)fM\0×¹Ì-ÙU……-§=ˆk4é ³Úo˜Ó¼¸Î2MÜ¦F!ëo†htØk#5Ü\Z[Zwóï‚ôK$2A«“]»ÆĞ;/cf[G}=V+«ĞH\\½‹Ó‰ÔYü!¶€6@4îÎ;êñ%°ÃŸÌ^ãGåE$ËO]û›—–Ñ,jĞ\0©»ônşzÀîC!³¥šÅ\\İûÁ«#cpöpnS”\\9K°\"Ü;›ŠS\\ÉK5ßÅ‹µ­èAKÔa†C\'ÿ\0-”oµ\Zœ„*dc“ gI4äßpoçFi &JešÂì~gÕ\'	\"ÿ\0ínĞ K±¹ää€ğõL66cw4­.5 sÛ…¢(R$Ù‰.RfàIîÏÍ¢©!ÑdÎ¨z¨hKõH©`{õa2XH¿Âù­ğÓ5Ù’àòaE¯PY*~É½éK‡³‚FÃ]hi®²&a€	©\\XÄ†.§}X¹.sæ…M\"ÿ\0¸³T”$“oÕ@ûÜ—šCr2\\¾ÍËÁ‹Š~¬Ô.RIjÖò2ĞÙRª€‚¡q•²¹©.†z]şH„oĞ,»*X¢émË†\00b†%ö¹T™-d€MV3Ğ¶RA£T$kvı,C{\r“‰keS±bâ¶®Wpj]¶¼304‚¢’(ÌA¨*vpÀ×#A­°Ù§OÒR¢àı5ì¤– åÔš¼:~\0iö;&×Q¦R´Vı‹%$æVPYM»(kG\r}iĞ$èôµAQÊç1b³¸­€¦bèæ CöĞ—b×†\n\r@HÈr”°ç•Cšƒp—€˜ÍV\"•­T ,’¯…)Píáˆ:Ş¶†mÖ„åÃL ƒğ]”.\nƒ»º	båÁ\ZÚGBù#-îÌ	%‰£wj5ÅSÙeƒ6Kƒ•ªÊ\0ĞÑœµ±¢¢ô43uÈ¨!3)%Á¡pu5ÀÉ ­àEhŒ«8‡$,—Z‹~—¡äŠÚ†”áÒˆBC$‹0¥Ã±$0£“Z8aª€NZØ*Ô»€à×ˆbŞb%ú„Ó†QGwË¥É¿iÚ‚— K‹&ÁëhÊ3h‘ZQİË%ß+¸ÌÁšš«‘˜9ø´=È\0¨±¯@¢W%’ÿ\0©$ûj[aV zp€öÈ\'”ĞÔ¸rö	@\ZlşpoD!o™;¨pß«`ZÀSJ<—-”AwÏ•ÔB³³”³šåMXÍ¢sÁ	š®Gká5!êjh\0±å1ZH!=¢H	$’Ä5,ÌÄöEûë\r\'ªB¤LÕŞä),\\“£ŒÏm!ë”<2Nˆù®“şåùˆ]£-Ü×­İ¾GæÑ³´Ï`¢´ßG=ûs‰ÛdR¡İ]…ÍŸc£ï£à69÷/ú\\jumbE²ÇQp?ûq…¢&´]ö`_öïòˆÂ1\0ÔÚ‚úpÔÒü¹DŒlĞÌ8pÔ½÷ùëª;AN™P\rnAı¤XQŞ¬ğÑI+²Ò&Ò¤=hvù¸Ó²Å!äØPCWõ^¶ğå&)˜PÛªÅª76Õ¼~’İ T\Z—ï<Mµx+`º$L µZ„‹ÚŒ\\5í¼u°÷…ŠÄ\0+ÁîX8UÛË‹EŠ7±n†™ÔâØbÕ½‰®º]¢8%²wXIS=lŸ2¢ì×¶ç’ò2a\"oÂ	`Ä^ÄSwÉj6gµ#A²eL\rJUˆ&ä*ú;MÅ¯ùLÚ±°w°%Í*§Sa@ÇRRô!qKM(@¸íXSôµèñ\\¹ÖIÙM*5$æã•MÄ^ì¶Ö‰aIP«ÕÀÌ	ft•j\0qÃG®Ë×!m%Ø6ı§´hC6Sñ8b¡¡[qéêìš:Z·\0”·ıT5áÄe!ƒèRöwœ±Èš\\µ!Ã«TAø™„AaRU›+¶BIv4nÓ¤$ˆØgà†5I½˜vH7íEKÕÄ‘,«=E”ìYÊE?JCeJ]E)7,Cµè!\Zü€˜ì`¹Õ…‹šbâ¤Ğ\n\n‡Ê\Z’%©Å´bkÀÁÌiFÔxç|‡¸®¤’”€U—**šV´	«ï¼]V*‘é)tI±,Ôœ€YÈ)4%ÜjÎ£H—`Í™ò¸#}R”€\\\Z˜ş£ZÔ\0©¿BÚ\'¹\0w\Z{@\0ÔpoˆR¯ÆƒİeUâ3ÀºB~&\0¨v\nA\0\n>‡(Ôœ‡š…$\0INağà©L*;]’c`›‚J{¢ü$¥Î¼Ù—1)vıA=¢¨šå¹Íd¢%–e¸«¿ÃW\nÙpã´TÌX\0â»VÕ…°ø\0—$ÚRÀ®ƒ)w`çt…$8.]ÓbZ\02Ô\rKÁJb@z1j:R’(2¹!®ä5\\=8€Y´\0¨ªÍ}9ñÒ¬ğÇbRép‘@.±í\0\Z§+lÛR¨âÓÙ°zÀNcKv^™MêC–`JE©z¸ªÚ#c%–)Q©c]/š¢µ.\0•ã æºR•6bä(s%Ø\Z&€jCÜ°TŠ²0Â˜¾”%M^\0üAêtg#5Œ’]s\\$\'â*SÜóUÈ\rÂ¦€B\" {Ò¡ÜÓ²îHø†™xe?PÑUX‚’ ÌÁw$;(²kP\Z5„]Ií°“ˆ¸%ˆQŞ†‘¸j¹}´Š*¹à0£—´¤Ów¨\Z9¥œßaUzàTôT?o´§,h\nv\"Ü!İ -‘/àæšøÂ[\r\ZÚ¦‡;ò6ğÂÌ™.‚è‰ÓÏôeªav,\nÜ›¬kÅìüıGı7şz˜³uxp¯õ$‘Ğ0‡Œq\0ª¡òç$` ×{´w#îßY_2Šş¿ğq¥íş™:·ù_áë\Zî \\*S?r6ıÖê½cù¿ìU/xúoI~_òdğÿ\0‡la ™%:ö”¿\0D²iÈs0r{¯Õ%Ì7ıy:k­şŸÜ·+ğÉ§oş¡b5º_§sÑaîÎwËëı‚ıâÁõ.«ğ¿Œ,Ód8\"€Ì.5ApÏİ¬Ş±ıCûÁ…øcdşña•ÖIz‚V\\~–\rÇxUîÎw§(ş —¼XW	›øRÆ(1$prïß_\\aÿ\0v32ü˜Ÿ¼x•şƒº?ğ•ŠH#­”¢RÚ©¶4¬GîÆW®õù1—¼X—‡ú\r•ø_Å€©Ò‹jR§Zw˜¹{¯™­N?©S÷—y‹„ü-â	eO’8²Å‹ûÎ»\rû«&ûÏ‚N»Zü‹\nü&âA$Í”uÌ­9?„îÆj®õù2Çï&ü,Z?Ø—*ëåX7a{ó4àÂ¬^ŒGî¶çäÁûË‡ùeú¥şñ*\rù‰,4!nIİÃ\nêO\ZEr÷c2Z’ıK#ï	xce~±ZÎÃëbYËK\njE»™¼É~Lµ{{£	…|S0Ÿ%TÉ˜M\ró5m­s{½•Q¿nbôd§ğ³‹f¤›¸jbônÎVo™á÷w7ó\"~ŞÄ¿…‚?Êÿ\0We)ÜÜšR¶ÖœL2÷w/ª\'íü>Œ\\ßÂÆ6İl’À‚ÙÉ%ˆ©	U*üùÅ_»9®û—êŞ^ŒBX CÍ”X\rfh\\–Ê«—~õeÏİœÏø£úƒ÷‹\nñ d~±eÿ\0­‡7š¬ÄK.¥,BKİ¬ëø—êYxp?ôÿ\0Âş4LÙ\0vBCÌ#³±È\\µ„w˜Ÿ»9ßñÇõûÁ…\n_á»îfÉñ™Ü~ï½¬ÅîÆuüQıDıâÀüHjÿ\0x²?ıÆ[Í›9tØXVş*2¿w3§ÊıK·°¾#ğÁŒ¡3¤=\rËP’Hì»å9s9«¨\r!ws2ü˜ocô ä~qGÿ\0äJ9\0u«¹Ö‰° Qø|b¿İÌ©ıõù1¿nãşVÂ¶/)yò¬‰¥Uİ@a¨j€tƒû¹–Oï¯Éÿ\0q_·ñ+ıÿ\0ô»‹õäŠ¡}íß¿\n½±÷g\'™¯É•¿xqøƒ\Z¿Âî-ˆëå\Zè…*Ö†`	\'‰«‡x?»ıÈş_ò\'ï?‘şe_ÿ\0Lsêø‰ls:µ¢¢	$f)$I¹³¨^êMÿ\0Ü_ıäWï,ı¹~ğ2WárbË«,In¥YI7®w¨\0½è%î¦[ÿ\0©ş¯ÿ\0èUï&7üóÿ\0‚UøT/ŠAvu	%@–»õ„›4‰û­‘¿ú«ÿ\0«ÿ\0úûÅßçÿ\0YŸ…¹ÿ\0îÒ	PRŠd”‡BzóUúŠ«”ÕƒhıÖ—ÿ\0\"ÿ\0êÿ\0¹K÷–?üoóÿ\0ƒ#/ğ¹øÛÑÊKY?êLNVzvK’^ÀHû¬×ŞŸéÿ\0#~ñEñ×şÃşrÿ\0üÀI$’„’I}·d½Å-H‹İ…æoòûÂüA~e‰…9vüÑf#*%-Gv.Õ*$èô\0+÷j?üòC/o·ü?¨éŸ…yd1ÅMÔ:Q-Ø³‚Î”÷oZ˜?»xÿ\0şHŸ·eü‹ó)Ëü+JHoÌÌ d“Õ’lÎC)$“¸³l\"ÕîÆ6«¾_’şÅ/ŞŞ ¿6\'ÿ\0Ò¬šÍMrœ´2ÁrjA2Èƒ5›K1ı×Ä¿_§öïÿ\0–?¨Rÿ\0’õq!!7– ÁîD¶®¡Ï!ıÖÁ/û“ÿ\0óı„~ñf\\B?¨¼?áÆB@~$Ú¯$€i \0›P×g‹º¸^ÖIùşÂ~òeóş£ÓøcÃ˜b1	,£$_‰’Ûíòdı×Åæsÿ\0óı‹xgü1ê+øj.¼@¸w—b\\ŞQ¡àÂí÷W§{ø“ÿ\0óıŠ¥ïuÄ#úÿ\0rQøzÃUæâj^†SÌİMJi—@ÁÁÖ?tñ=÷Ëÿ\0Ïö$}æËæı¹éïÃè	&Lç ÌÔ$9\0Ô©	=¥;©ÀKÔ¹|]O».1ÿ\0J[^´nÃï“¬‹_C‘ôŸD©3\nf$‚•\0B¾\"éjÑ˜‘D¤‘crÃu8¥‰ü9ªhõ¸rÇ,{ íd©¶øJ}wËZGµ£cF‚º0¤>ƒ´@rOjåÍÔ(Á©]¡ù ³$”Š¤¤ då\\\0Yèæ½ì˜‡º“Ú…Xw\"¢ô{œ®@0<ì€Ø€\0Ê—~5fÔîÍİ:21ºœ³¸<6®FîÍ£T]…\"Å/DÓJi\r šïCàUˆŸ/Ô çaú· é~Ñ–0õgêúŸƒ‰ÏÑg{+ÑdJD¤K(ø…ÉıÇrw²ôİ40ABGÉº¦Yäå>M‚B\rÒ |ƒü£gué˜)—S^©\næ>¡Œ—(³~GKÆ¿şr¬+l©ÄôÒ%ËÈºŒeT‹{#ó:#ŞŒ‹îÄKY½Rñ-,ŠLOµâZ²öÛ4M|ŠÎò”·xæcTP>,gÁ‘ÃãbÆ¼¯áöúÚ²Ü¯÷D1úˆŸŠ^…„ãÖšãˆpúBö§Á;šäº2›’’x8óƒÚĞR.a°ì@\n~ ={ˆŠÚú­p98W,ª,+Áª{âvyÄõ-¯¢S²Áæ–óI·8Z±»‘’Á{<“¯×ÇO”S(ÆfÃÑïÒ¶íªãö›êÙrèwçXææš‡‚Øç·ÚŒöÜ„²yÓMh?¦\0àØßå^ã÷Rş§J;šù™3½ÆIjLš4wŒüb/hÏÑôuÃ1]#îh\'á˜³«’š0ÿ\0hìÕ¯‰\Z!Ö©=£\\sÇÁ¤t—Ed$)Dˆ\0ÕØiR9Ç^1ïVŒ±Îü˜•ae¿ÆAØ·ÏøƒØÑdf›Ğ	IK—-z1Ic“øo_j.Shªf$¹#¼Søğ]â¶«ƒBß(ZV“lÏµÚ)”è¾0±’ÔÇCÌ¹Éo8Ìæ_{.~~ŸäÃÿ\0JXx“c¸ÑZf-èV¦Ù’€aåwQKÅbTß¹CÂâ¿©âD)ı+ù}I…ø·È>\rpyx¥Yeù€ş,şp{½ì®EõI?¨§À#\rñ\Zä_‡ÀRğ‹JÏs}¼ˆ€ò\'ÈV&¸!Kz(Å€>@|¡{Òò7oª¬*v[óûL•ú“á\'à³\'6ñ$ô¨åe‘ÄÙ¬)˜ò§ş”ö{‰1]¶\\ÒE,LÀoÖÌÉ€1b´S-•-ğ¯ş¯â.îe4*Â Ø¨\'êG‘Œ ˆNŠ¤iQûı¡;Ó\n‹BTAø‡x$t¡=ÏÆü0´¼¡jèÄ(÷|ê>TƒŞÖ˜½±|Œ€`íÀæX[±»_€şÀ{Ò\nÉ^@á|¡iÃÿ\0bß¸Ÿ¹@0îVŠûZğrOÄ±`Ë—ˆHhVU2r‚•;iYM€Q¡£x_y:E,k2åsøËØ]CRøo†|÷ŠÄ¥&¦¥‘bI)PW7`ôÒ>t{qÈ^Rx\ZĞP¸½5\0ĞŞ,AÃ5ÃgV­›ô‹76ÖQ\ZËH\rG f£æv0@Øä×à¢¦¢˜)’‚kV%©M4»Ø;ÄV…,]$¿îíSMtâºÙ.E\'ü°~â¸<İ K>Ig)«WÃN1õwqÿ\0­oĞğÜ›ø]«Ôúî\\ñú’ülcéÊ5Áów+{C¥á’lHæ>ĞÖÈ’.aeT\0³ÜVÚ,¢·~Ò#%SI6BI¹Ğ0ó³çõ”Ë‘`ƒ›ş‡:öW\nqs2tÀÓSğ¦A/D%À\rg«êM£ÉgëR6u}ŸìN§¯‡Ú_Ü¯¯è™ÑŞÀË–´ÊJ¦å¼Èpª25©PMn\\ÂG«~§Sö%·øè×}¡ö}u)hš¥€‘5ÓR@¸˜H˜€C“•5`B~3¿´¢İ^Î?]îßQÓcûF?º•Úå/¯©²{¹÷œT¬Äé%+ruÊ¡T½^šõrwÆìóı7R³Æß+Ÿïø”µ ‡v&Ïoâ6&Ñª”‹XU);·\nZè ÔŞ¦%\'0hPNSqÖ&ÆÆ¶&+ºe©)x0^ÁÏ–&õSĞ¾¨¬-_é“’Ã‚…EZÜ\"Ël“9ìï²½|‘<Ï˜&ªaíÔ€‚w{‡¡\Z\rkdßcí£>5ß»3Ó:\'ó˜¥È\\ÅõrP†êVT’u*rI%€ÀŒ”!İ[p¹U›¯±Ç-h2Ôµ4™½’ä¹4\nHï,ãL}Nxãù«”P¤åò¯ï>Íû#Õ•/1Q_€\Zx6õ*`cÈõSÉª=Iìş×Şß&Ğ„Q£œÏCJ€ÄË$R…Ç‘Î\"Õ¢„Î„bFoŠÎKesKµ¹`ÑtrQÏŸKİ{ç“æ?Ä§@”LÃ±iIš‘G«-@I)RRhAb	ìö	öÌšËšÚG”êoE©Áºo ¦OÄc²Í™)HOY+«R²”¯´\nTTî©y( àšóÔQ¯Mšî/Ú)“$`ÌÉ³R¹}b&ªZ–	Èd¡eÜfP*9TÕíqDZîi£b¥$[Ät˜F¹3ñª/!â  ğ’e¤)Ë—Œ·0MÑÒÄ¬Ò±>ôfÌ“ƒÃªdáˆ•“-`­`Ì” Lµî°A	.kÙ5Î#öoQ.{Èö>t¼nRq¸œ¸Ù³	bÒ%<Äed¡b‰ëX–‰ºfîf˜¥VÒEMÃâú71&\0&fYR†wZ•Ûuvˆ†bªÀEr“îHUÓf¥}Ÿ+\'ùÉêëPWÖgSõ(İaı;¸½ƒE->ê¶Z«±ÊŒ÷¶fà‡Ä%s&KÄ™É*S)AA*\0©?ÜŸï/¡ÅÃi™5?ßîsÙÉ¢IŸ6b•7LÂ•¨œ©$”„…K¹S¬\nRİ\Zbõ³<â®‘¨ûC‡›é	¸eN™*N\0„ ·h„\"ÎJ®]’–s({z/¤£´g1h›èùÂlã2bs&Rƒ¸ÎÉ@%EÉI%O  ø^Yc±#)ZFÜŞ6d¥â0Ófİ\\¹éÌTHÌ„•$ÿ\0dƒÄH¦^Ó,É(å¸”*•ş¾(âÌÀ%%VB““[çr ß%*ñ[eÉ*:\'µ2~?	‡6bT¼*:Ò…1Jg)DÒH+K9j4nù\"Z6q]#1+Åá0ÌN`Ô²ÄÓCf¨9ËÚÊIh·ğS•.N°©§EÈ>Q½¿©ZtÕ\0Ngÿ\0š$¦—%Ø±¹ºF÷‚°¥$¡$GiŞœhcÇõ^Ø–9¸¤}¡÷[|QÉ);B”ïn×¢;ÌeıàÉü«ó:÷;óËòBÇ· OŸŞûzÊ€½ÏÂ¿_’}àL7BqÄ˜&öîO	û¡ó7ú—í’ÿ\0jGŞöşZû¨©ûƒùåú`¶s6OşoıĞ«ÛÙğ şéà_Ç/Óû§A,­	Z½Éîw\'Î=GIÔ<Ø”™óÿ\0iôqé³¼qáfÊjŠi|¾juÒÆ7BìãÏƒûì˜?%4ºIt0êWX€—R€7f:Ç\'Û°ÿ\0ü“‡û£¥ìiş„•ÔáÊ‹æØŠ*™I7­™>BÓåL²Âf’äS6QVjT¨ƒ@âÛ,Élj+çÄvMÁ,15kUNÇJ\\É´D€t»¸*9	4Ô–K¿é¡!€ñƒv…+ªM\\’ìRM\n©RìììÏ§1ŠÒ±ÔU1d¦Ä>É4¢æ–hiF™¤H£Ûÿ\0¶Ojó‡íÈ~pÄâæv\r]…Ó»V>©îşò?Àù÷¶é¦}h™S9ãçö¢hùûLÈI–ô!\0ùøa\\†Qõ2»\"õØ0ò=íç+4Æ’>|÷×ÒKŸŒ‘\"¹p\0¨±-»\n;ê5?ÖM¤ÙÈÍõ]f™q)%ù¾#pö æ®TÅÉ@Z¥Ê	g ©OmS#>6G&~ƒö´ÿ\0fôKOöézÒîßÛ\\Dé†Lù…²• »°¸\rB×$İôŒ¾ØÇöH,°î¨ùÇ»×Ííÿ\0>\'\ZM÷4×û¯ü–=°’e”°Ì9ı@÷(Fİñƒ¥ê\'8Æ^O³ô˜¡ÔBxf­U\ZOºÉæGHM”Ÿyƒ\\7úˆå•%œú×³òwÆ?ùG6°ûW7Mº¥%ı9_’gÑd!TªM8¿Î=ÑÒ}¬Í`pMeâÇÃXVÓädŸ¨¯l}™V&B¥:SIí‚\0I\n°ÊîÍ_ñCiÁ»Ù‡ökİ¾\"ZåçÅg”„åê²QAˆ©B­äô-ì³<}Ùz´Î\"ARUÕ±&„jìô®æ¥6¿W0¬ôônÒ=„R–•JtŠş ;¶ÉH±°4a_QGæ&H6şS¶ûì’†5Q©?MO™$’äÇ‘ë:§–Zàîû?¢íW.M°å*& HˆCÍ‡%÷Ùìš””et+;© \0?s¦â Cì¾¡A´üèñ¾ÖéßÄŒ×ÈşÒû¯Å«:t‰²åõ™’ P¢\nNSQ”2j©¿îÍ˜ŸE,Ñª&.JÆt¯¹u„ÈD…!&J–¬Ó\n‰+RĞ°r1Ò2å\0Ó) F/Œ­¶uqâ¤’*ûAì/HN‘‰“;%YÄ¤•)2Ö&LÏ’RVê’ù€g£Æ<Òğ£¡Q«{Aî!s‚›-I‰#˜(&a“”%’K·Xš±Pêªœ¤FuÆË>&èÚ=°÷|¹ø¼ô%8u•LJŠó(ËWe’C²©MÅu¸úC&šfg§ı…\\Üf’‰@……UWø@KkWPŒÒ‹r²ØM(´GKû¼œ®‘‘‹BÑÕÊ–P êÎäM°	4ş ¹I`x9í¹X;ê%ÿ\0z>ÌLÅáÌ¤aEIVe¸¢Kš€K÷wˆÑ(Ú3BTöl½ÑÁ(BsJRê@:÷·(*M-‰%nÑÎı¬÷m‹N%X¬\Zå¥S’`[±šÄĞh”½.	r#$Ó½\ZcÅHÅÍ÷7=r%H3BœgOQRŞ ²ÆS@\n‹«+¬»1ì‡Õ¤“.ôo¹HÄË›\"`È¡13VJÎ`SÙ	MEˆí\nœxJÊ’ıÂ¬`ú…L–\'&[-`¯((Iz„“j¼b¾ÖØm!ŞĞ{³ÆL+‰ÈDÙrS,«*‹«¶ \nH!AZ‡¾ÀÅŸ\r°|DŸİ¯°_“LÃ0õ³f¯2ÖB†ì\0}Ô¥rTt\0F¼xèÉ›%êÑÓ±¬;|ãKOÁ—L¥Â¸ì—àh~Şq‹¨Dètš•Ù£Nö9jR”à:\Z>5íOiãÇQwÉ÷eõìğüW°ÊıÃÂ9Ÿµ±¯cíçûEJÒò\"ÈûN9E2¹õ1Š¶cú#¡Ğè˜“ÚR{Ò¢“­¨üš.ÏÕ¼~,£]ŸtÈaUû‡‡óWµáèËşĞˆÿ\0àe~ááüÃ¯kAº¦W>¡Qºt.¢ZR”Š>®[¹£ë~ÅÊ²ôñ’>/íÌİL˜8¹j?ødÿ\0»1ûG¨ÇÉå¦í÷ßÓùI½”ƒØ«¬K\\+Â9~İ¯±Ïú¹Ğö+j—„¡OÕE(EÉk8­Üµ™ˆJ^¨ıFâRäŠ19êmp*ôbÏp-f\"¾F³$;UËÕÅ\Z.Xaö?µ0t’¢.Õdî@f4µX®CÉP`²WVQ4°5³›\Zh„$€‘J~—I?­rjt`>P×bğ˜tB›Fv‹íÑ½ş\Z=˜OVqb	\\É’ú”¨õÃ.^ÚĞÌIÌI{P·×ıƒ…F?Ö×ê|ÇÚÙ\\Ÿep}‡Âyúö2‘ä”,Ëar‹Ò›}O”*vY$¢…b1i?©Chg®ã…{ÉÂ	XÙSûYN\\ÎÊcg«”pº¬w#›Ÿgëğç|&›şŒê¾åºu—2ZË&a\n4;Ãá¤’Ç9FGéOlaû_O6ÒİoOgFö£\0J’¤¥ØFí»Såßkô’êiEğÏÑËà·­œƒÚş’ÎS)Ò\nJˆ/ZÜÔP9,ÀØÀÅ…EG|óÙôøgÔæÒ¯:×©‚÷OÑfn:tû [³d‘•\"£T×zGÕ}ŸÓü8+ô?+uWÛ}§›©\\96¿ûCÉÃ£TOÓN.<sŞÎšiø28|I\0ÛîÒ*”´Y¢‡µØfB)X%•™2¯áêò¨ÿ\0S#·é}3Ù¦1Fjg­E#¬Je•(öD£\'6n¬§)[Ì*P=´Í»WA+V.GHÜdô:òŞpWU‡&«lÙ’ùUUeÈ ”€J†lÅÔ—êÌ6ïGoöÙÌµ¨©‚C=î]×È-Jâæ±æºî§n(êô+œ»¤t™hhó÷g¨Œ{UcÑCÄ!è„5¿n°¥RTÎôf\0ê\rA¡\rñ\r˜±İ$ªháûN7Ñò$ÌJ†&`Í1’¥¼µÕ‰]^ie,›×÷(¨©i9º°Sêfê&>‘Z0½5íLÉSpè*#<™bse*Y\'9Jµ•µ–ëFDfSf‹O“£(º´`æûc4J	—53\'	«\nI9\ZY—1C1ÔÌ\0#²s€K(‘^HÑtš¿B{G=i››¤ÌY	LÄçJUÕ…)RY/˜‡3&]Ù/L.ÍT‡£=¤œ%ãyR¤¢pC­R2gebRr›Jæß*Ah¡Ê‹èC{Wšrq,¨äR¦KAš3!=WõXºC&‰ÔTñZ“aj)±ØNf„Ï9Ğ&”JJfbÒVÙs²)3„Ñ æ+«<Œ¯´9^ÙÏ=PëzÄ¬ÉBÈR&ªdğ-¤†(IBC¤­5,ğİÍ¤z´eñS%¥KX\\Åu.9)\0™a5êÒ*•kaÎDQ‹¯næ±+˜©AIÂR…È‚	~Ğ3f$…GSÍ’Sc¨/SÙ/jÖ¼JeÌ¢2„.d´*jB§LêD¢©™å¥+%@É½QÈØıˆ£‹öà¥#ş(¥FpLäÌR$¢JŠ1\n2„Ş¥e-‘!k K\'ı|ÆIÈ1HŒo¶{}^$‘Ö,Lu%)’Ø„¢XÏÕ( L”Vj&N`¨¥ ¸¢Êı®ê	˜³,ËJS4¤æH–©‹B²ºÕ‘s\rPz—ÊÎ\"Îé/M#xö+1RÊ³ªb3¨\"b‹• \Z*€ÀSv’Nç^6šÙqô3İjMÀî§Ê‡¼qmy‰Ãb9\ZÇº0umÃåveÒ^ö“)k–e(”-I$¡ñùGÈ=¥îæ^§<²)¤›áÙëzOz±tĞXœ$Úô¢š½ö#IKÿ\0©1ÍıÒÏã$&mıôÃÿ\0Ç/ÍsÓ¾÷eÍBå™™$\0¢’—jùı/»9ğäŒş\"Ó½]˜s{ç‡$\\>·õF»ì7µrğ™ÚYYSvÎP»U$±ì¸p<s0\'¹íOeåëi)$—şf‹Ş\\=5üßÕj=ö\'ÿ\0¢¯ú‡Ú<ò÷S/ÿ\0\"ü™×^ùböåù£Ê÷Ú–ÿ\0E_õ±‹º¹ıÅù1%ï–*¯†ÿ\04oşÍô¸Ÿ)§0p“V©M£êÆéMÓÇÛG–ë:ÅÕËâ­_øÌ3ÙIïqó§œzLm^ÑËšu¦húÕ4`æƒZËg?ÔC6ŸônÆ±Ç÷Çìsíç_îÇ±SûLlù–b~\"R‚­Ù`i@Ô‰%ê^>3$}=p$I;æ,4RÆ–\ZR£ZANˆÕ•æÉ\n$’rfP‹Â¥ˆÌ6’Úˆ±y KSÚşa†Íì3]â­¦B=*«\n•ME\0`SBÃ0bn´9\0ZÈJ…ÃÓwspÁâ¥õã§¥cÙ·÷}âí¿†ù¸etV£ª®¿ùŒ¥]pFy]H›J§+™yI>¹£ì¾Ç¾Ï¦ÿ\0Üù´šnÎ®«8aÌ·•Ìz¨¦Ï0ÚG°¸‹ö9ş$}cJTe”œ†¡S.ù¹2¼nĞêŸ\"ìÔıãû5ù©E’°Å\nµF…¿J¬YšñÏê0·¸™:Œ_5äæøly@ê”•$ÊBs|Fc½JEBÑGw\0Ô*#Äõ½nøgĞ½İ÷³ìÊâ’__éên2:zj¤™asT]jì¹\0å)p¬®ö„Z9Ñè²µLöÓ÷¯ÙŠEñÇoŸö³‰TĞdËíÌPJr£´RäVap7K›*ªf=¿g{2¥ÜÑó¿y½íÉí>›íƒğŸÍı}?¸{ìT¼<´£¬òºÔ–ÃV$$XÜÑãİF4Òôÿ\0	yòt\nI¦c`Í˜¿ˆHcÁëG€ÙÒHÈÉ@\Z’Eº‹q#È´SlĞ’ELR…§‘.ïZ$0EGÊ@²îì\nC‘j3Ñì‘ú½=¦£É;e#¤û-Ğåj\nS)KŠnƒVsc¸_S“H·ù:<Î••(\0¥€€äç»e&zÎÕ‰¾ò°â¡Y†„3!È¦Ê,„Æ˜ôY_ƒ4½¡Á¥ôâC\n…™aIRÂÄ¼iÌä=Sp\0w7vìö’û¡ìœ’\\ÑË~ÚiÒ‡êWÁ~%ğª˜©yå¥I˜eå+=a ×²Ì\\×pR’’\"Ù{\"I\'bGÛ«±~e	Š¬2›)–IÌrõƒ3%9‰ËR\0³Ô>ìYÿ\0cÉrÄı±™ºPıDÅdƒÔå	=z´4Ä»%/K$2æIñT½˜¡mËƒL:üó¤£¶hxÏÅú\'„€sËœ§J	I#=AH]2¨¨INV]²èñá©Y1Ï6kS_‘Îı£÷ÀF\0ã²$–I2úÂ€æfF%Š•rIbçhIe]İ·ÁÓÅ¶*KÉ­b=îb—:j0Ø4ÎdÊ3ÈZB‰š¤¦RTáD\rI\n+[¹rÙuY–÷™ï<áeKWP&NŸ5%JÍÕæ™6ÁJªRVR…Àœ­h¦1ù¶sŞ–÷öeËœ†Åa¦È•2R§¨~càXvnî€Ú‘¦E•ù5¼iíß²şÜ­XUâ¦uAÎ¢¬<ôâ%ä@u´„‚C(°ªo³i«b4ÓÓ5f½öMÕªf2¥O–©’–œL£0$PfI9Ô³Õu„Ñ*P¥:àĞãêc=”üBKÄDËëqKRfJs+\0YJ—ØK…‚(ˆ\nÁU/o^Lç@{ô±³ğ‚_fPš%Î*\nDåHêÓ= 0\0¡sâP9Tb9¦èu	Ušç²¿‰ôbQ‡\"BÉØÄafK+IêÄÀ¥\"h9táGh(=j~*á»6¿fı÷¦oHMÁuyP‚´#‰³¥&ZæÊ	Ë™Ğ&bOaV¤ÍIĞı­#¨.nÁ]Ã(<Éu(s\"4F©Í”æ)BÈË7Ì˜¿±å&‚—k¤y‘;\'ÄfS´+tŸòÈÀ ]—…\"©¯×’Sğ^÷\0ñ±ñÿ\00ÈI!s¥ƒbÜÜ8ùF\\·B£‰ôïºŒRçMXÊTµ),´ŠáİªÔá‰cmİ‰t¹Ü¼2÷9Š»Kœá»ï	ğ˜G‘p${•Åh%ŸùéâEñáKĞ_°eç@ÿ\0Ü¾+@ƒ¥ãåXŸ^ûHªò7şç1miÿ\0 ûAøRôt¹+ÜŞ-Ü¥\rşú|›¾-Xdü].C­{ÑæT‰rÖ‘™!‰‰7.\röÙÃ¶(ßTRfC†™@ıTó\Zá&Ã8ëG<÷Ñ)iÁMwc“ˆ=´³³|#ïoØæÿ\0÷G_Ø‰®¦7õÿ\0cæ)©%3jéSl¡¦¯v°âkugÓ¶WUÕ^Ë$8\0º›@÷š¤´2=–™\0ì3ĞjìÕ°¬ıö/¨lğ›AG#á ‚ S…ÉQ«=\Z# P‚nhr4áZ¸oµ¡xR`4Ø¥É\0°j†\nTC9Ğ¸¬Xô´!T!ê,j;Gÿ\0lĞgğ³†Jz>ZÓ%yŒéâdçTANIi`	IuI$‚¶{—N›õî|›Ú\nRÌâ¼V¿¡Ø¦cÓª@æOŞ=rGÔâË§Ÿ”Æa±²ÏÀV?xŠ¼2¿³Iøe¤5JT·ex}ãÇ†\'Ù2rÜ?IYLwzßxNè¾>×1e™ö{\r;²°ƒÁ`<¡ãHÃ–xo±|E÷@è¯uò	|¤°°1IjéÖ6§ÄÅp†&S/e¸îŸæÍ£ ú!h‰H@™@H~æñ1xáÃ-‡E$µ\n6l)9…P	4™G…öÒÿ\0>¥«¤’ğm^‘KV—HÔQ\0“Í¡{Ñ/\\ùDÔ½£Yƒ?ù˜±5êTá%á”f„•à\\½¼\r6Ò(Ë‘%¦]‹“Úfßìÿ\0B±Ù’4\'BÌÀ‹%ÍóLó6¶u!Ó¤Ú+{CïÊÊ™}3Âä3×vvZéw©ö‚î¤v°û9Õ´s^öÖb‚]]©„g!ß\"j]Îg	!4#*’Â5tYŞ\\–¸E=WKpªä‰Xò[\"ÇfÌJJvkàDzÅy<ãèåàÔ:KØ,ÙÉ™4OüÀPÊè˜ÙY4b–\0Ù‰`\\!ŸT—’.^ôo»î®gZ‰ø€4Î\\””f!ºµ-!IÊ3€M\\¸È½£İ\'söjQRhÍô²2äÊ2ª¼ÙİS\nˆ˜I)ìµ\"ÏÄÃäêş¢ãèëM\Z\'ıÕ~_,ÏÌÍ˜0é_S-yBe¥ê\0‚µ’—	Ì@°Ëş§;”]\ZğàQ¾Š÷>”™O‰š´J—52RD¤‰frHYQJB–¢•v”É-ñ\0[Ëu×”—m+Oêw°û9-î˜œo¸ùŠ¬:ñÓ×*d°”¤¦Y(Pš ¥™*Á”æ¡1™û_ºåI\Zg5H”÷=j×\'3‰ÉBq)@HëL¤„‚™„¼µ²AKİF°¾iÆRŒ‹\'C(§$lŞñ}„üÔ™RÔµ!rfK\"hF\\Éo‘C3…PjåÍ^±èã(µ£R‹Ú4µûƒ%Ìë±\n\\ùø‰çO2Ó•c§D¡,†p{J¿\02†ì¹;GM›ìÂz•I=RĞ¤)(#*Á\n bôŞ,¸Õ2®É\'g$èÃòÑ6B¦âŒÙxD®^#*\\Ü¦\\ÉhLéÁÌÔËLÅ€™=ªØ¨ÿ\0\rz—wËĞÊô¸¤I•–‰ /©ŠTÁ!/<¨+.fXP	Ì\rT·fì½+píÒc©_(OC~\ZÓ%XI©ÄM3dLZæ.m8M\nBeæij™™Ô¤çr*’îšÜiİ–¤ÀÂ~+òÒ\'`×™Kê²‰éë1)#¬Ì‚…)‚»c+ÑÈ)«á¦ì¹I¤Uè/Ã¯P¬4ÑYÄÉÅ+6gVL¹¦fq9(’f§ªTÔ«)ZT³BáNÂÈã§fyHí\"rr¼>¹Œt##©J‡‰0 üD¹DømV%BãÆ£¹ßÊ%Áùšä¹„Å$‘L§q÷q[t2]ÆÅ\"IgF¿C	Ş˜ÿ\0Hbñ¹€<è|oãš¦GdèGx?ûb9/ øw°†;(ùy¹P­¡–\"eáF€êùåOªEZ,íÑéø5OšÈ$xSxuè¥;\rÊ¶«yV-QE\rØ®©:æãäU’B80FB©oùKÿ\0=şQbql¼\0qÿ\0¸’¼¾¯—‚+áˆÄ¥%˜Õÿ\0WßürƒÓØ²Ç­ÓßRpS»$¸Ce/\\ébö¾í¾ÑÈöô£.’hë{Sø>_²”œÄv{EZĞ)ìÛ¸áxøêƒî>™ÜBæ%Ÿ½6z·H4Çi´.`J[à(”âkPš¸,V>&vz;+v»˜ØÔRŸ8„;“\\Ã0fØr½Å[ŒàT$²Ínj	G(ÓNA„W$È‰”£bA\Zå.ÊN¡´.|v-RØ®#ƒ¢<W^ş0{…í;áËØ¹²ú6DÎ¹]V\"n%I”Å©*B\nÁrp±PÅôû\'³2%‰F\\2ë£Û7(òtµô2¨Ç7*ù_Ê=x”lã}£3tl}ìÑ!Öf¯“xˆó}G´!Ô6vğãÉ‘\\ô/ì‚î’ãbÏz^¿Uóé”g†lpDŒ\"j˜×}Ü£Š­?Ôå}«2tÑšÃ{\'ª:³¿Òqæú¾}±ÙÙéã’JŞ‹ÒıËWQ`¼¼¼#WIÔÃ\"ù™ŞHpÇŠKHµ«8©ÔCXFìŠ	Y–NS%ÑİË l¢ô Qè46İëÈòru	:FèJRÛ/`}œRİEL	4ag¹±rÕî .úú~¢2ÔŒ¹ûã¸™K5	)a@­Ì]¸÷\r{‹³´ã>£-ÓfgÙ_eÊ–8!ì+m¸>¬\\äçš|LS’ûÆíÓØDa°“&¨\0%&aYJ”d¥d°ÌiQCPÑË”œ¾Xš#‘FJLùf71!A@Ñ ‚•0Ì¥YJH.;L»‡ŸE7ÙíquQqOTj•2lÅJVPÉ!Hp”¨·$²sQNdñô]6‡säãus”ûRUø¹‚H#úòÒà(eT\Z+P«ÍÆæ4C;¿™34³~N—ö†D”©S1””D$\0\n•™­• ¬“d‚mXß8)Dº§_øĞĞá¦•”Î–°	tl‰P,{–§\ZZ¼q{»:’êSŒÆ\Zzù-N,†¿ö¬–®»Öåî{º1¬ı¼$ ôK~¤ƒÀ^Rş1¹B3™WÛ%t¿#ĞñIz ö2“DH§dUÔÎÌ’C€cÂû[Ã;WLõ>ÎêVUº³;èD™ÔP”öˆ`@p°,ƒÚ±æVwT×¢)Ëè\0X§ÅÚ-˜ÕFúÙ¯b#VíÎì£%v½\"¤™\nªÿ\0Nš;ZM¢t™1äŠŠ“¿ÄñıFicmö*ü—Gû=š¤7Ê¯ü®_½&l¿\rêL§e5¸¯ÈÆÏè?‰%aÓAY‰,_/À³[şÓÂF¸õúoeıÊ*ÔQc1YRLÁ\\´*˜ª–Ó´›5œEØ¾uvÀúÇ]«ò3x>‹R¨êmÒVJ\\)Ï€ãå}¿ÄÃ:“û«ò\ng³êK‘˜Ş¢b’ÏıÅNüCi°ñ?ˆygPßj1‡\0 n—µT¥\Zÿ\0ÌCñïšÂë–a}\\S¾Ô\n:*iĞEşJ Œ¹\\qs7fˆu*oXãù;Ùu¦¤fùJƒr¨nèÍ‡«SÒÙ[ì_‘Q}Kfì¢½ve}#§r{rÑ•õ8¸PVd0}¹l÷4EjGzB•™_ÚÙ@øBNLÔ¹›FˆÎõØŒ¾ÙE8*¢HìNPBjÚv\0ã.¾ßj›£oÁŠVàŒïH{5–Çk•©ÚÀŞE}Ç7,ãÀ”aÔ?Pÿ\0©[¾¥‡„_8W’¨ç‹X^ˆYıMÉßÆ99:•VoÇå÷P3º0†|Ç™R¾¬;ÏÒ6âÉñ#I™²5¸”1]IrM,\nÜy¤l†–äf—QåD££–lÓ¯Ò2æÉ[r.„ûø‚ŒèuµGı9‡şØN—©ŒßŞeğ×İE/Ê† æIİÔGƒ†óîÇÃ“ÚfÕCÌPg£?i&š)oá˜Bd}«æcG,dşX…; E\\Úåy‹q¿‰Ú‘È}bR¥#ge«íF7€MI/ú³4Ë_!l-ÏjF,¹abuï›£	4¸#±@¢o1Ø“gzã›íœRû4›fïfue’>aC’Ifcc µ‚û\0Í ´|ÍÈ÷]£qÒ\'r[`å¸h*€:^)½ØÉP¤¹$;/£j¨Wf€5+Æ#Û!Vv%Àk\"„9S\0ïWdì,hpZØ‰”qk\nÌ?qp¡p\0r6µ¶Æ\"XÉ˜l€\0ÎA «5EÁ©†Â×Ê®™\Z*Q ìàS(§jˆ–Ï¦ÿ\0şÕ&oFà°á +ù¼ìõ3fË)5pì’;,µy,í`ƒG…–ÊìëÒ0	\npêcë2IUèxôğ‹º22¥ÅÙ r	´ô,¢Ÿ#¤àÆÕxè}§#m™>º3N‡\'HXãoasHÊ#£KèGC\Zq2MÙ‰Æt&l¦ …TV¨®ô§\nFù95VgŠŠ|etQ©\0×ï»ÑÛcM-ã¹.r³b‘‚qDĞoüéİşMWC½lAØ\0ß,ª¬Ã<Qnèé~Çt0\0Ig»8«ƒGj\ZT0rrxE°VÌw½ËÍ–_ú‰RE-ù•Ùp¢`«Lg„åilyâŒ´ôƒ¦ôG­*±ek’…¦b©@Ì2×<€İU2ó2	A)PÈ\0S\0¬ó}D8~ŒèGá(êF¹†èŞŠ2–‰Xä Ê”5R¦É\n”‘-Xg$¢ŒVHÌéëvs)çŒªq|ù,rÚf¤ıšè9²•;ó¢d©	¦NLì2‚3ÊÆaÒ\'¬ä-šP¤ÌL¥1Ê´®ÉË-¤Õz\Z#ZfS£}İt|ÁŒÃ\"zÖ²&™¡¥®lŸÍ£Å}‚R[9RŒÄ]4VG).£&˜ñÃ\r¤aúØ^eâHJñ*L´¦|£ıiKDÎ¦E”³(!r’¬ÆH2—ÙH	Yæ›[D8zù6¯d}ˆèŞ‹*qœe-_Ğ–¹	ë\nä`°âX%¹Wäe,!*s1sH¡BSCœ²*H·áF;;f%9€ÕTpE\0Ş•mFÌCV´|ë¨–>™0Å£#™x‰k­&Y$IK­²„—y…Ê ¢´áûO4²ã¿C£ìÔ±Î½M­E*!©NDrk4á)É³Ö$QÇáÀPr¹!˜\\_pn­òªèdĞ\n—(æ\nXî^ä±\ZT$\n\0ïTƒŞèsJ.‘Çë1)+3©}fû¼wlà%\\¾—”r6ªÎ\\9 éÎOe¹ùs8OGS5(”ça@Kr€Ğ›6k5²·|1u²Qjü–O¦NVl˜,{­Iı ]Kxwq5mqÊåäÌñv™,ƒQåõ-G\nÜSäÄâ}™A/QÃCŞÿ\0hÜ½£8G´Ìú(ÉÙrV$0\r,ù§7m,XT\\¿^Œaïqviìî/Ùô“™»BÔaëë‘èãö¾LQ¥ú•~Í„Ÿs,ap Ìu.Äø’uĞSW$’yYúÜ™]¶t1tÑ‡‚ûö†•?ú•Ç”eÇ‘8›7LàÂ’Ê=KÖO\ZÓ9ºxÍ˜TtbF‘£/´rdÕ”ãèã–\Z9r›|›â’Z!XgmlŞ$cê\'vU“\nš*Lö}7vØ;¿­ÃÆÿ\0Ûy%Ø˜³ãv6\\€(x}ã›<ó›¹3£qŠ¤yh< Ã#ĞÒ‚|˜üwC…VÇ‡ñœ>Õ%\\œ¼½\'³Ø~JyñŒ¹úÙåå—béahvQµcfïfÆŒHtzTÎ>QĞÃí	àwbËÒC*¦rß~İ\0œkú5ÿ\0î\'`‡~³Û:œN\rkAè½Ÿ9T“Ùò$‰‹dÔ—\0¸.\0ÊúwøùrzÄ`š‡Q)I§÷;·w6\ZÙƒC\nTÜ¦¬§Ó´GÂ—Òœ\r+m\nWL¾$eË¶”VæÆÔ½Î†ÅòS\\@(×,¡Ü>„šğ‡{\r…G©¥•J›â}\'f¬\n%„êİ¸vCpfÒ(¦ƒğt³ÕÍ}\r;ÔşŒ{éªÄ—ÔñÆÙôì‰q‰F‡/É•H¹BĞ·³!‚èÌİ×‹”ŒÌ®HÒ/Q)l£Ò3ÕË1)yxtÏ˜V%I’\0Ì:ÙªıD3\"Z\'LªN@’tw¬jæè¥ÓtuŠ÷Ï7©Á™x9Ó1˜ÇXèÔM?—)ÎLBå™(ÃÌ\0ºjä$ ¨fTº×W­Œñè?hıµÇË\\´\'£q8‰Ó3$àñIšpå)\nÉ?eËÁ\"b’¬Á	ÄÌ9B”rŒ¤Şº„İ[‚3\'íHK‘†œ:+9S„Õ.Fƒ:GV¼ -œÓÇ%#gå\0…d,	y«Ë¢(Å˜ô{ëùc>F¤\'äN|N\ZRåş{…‰kÄà—2V(\"i—0Ê\\©Så”¡jÎ…2¬¶­7ApIÖŠ½øš?$©iÄ‰= ¤£‹—‰Áœ*§¨~Qs6RebÁ\"wT¢³Ùë`.¡©v[²Ï€šn¸>‘÷wïJhœ0˜´©ìõ‰É0¢„æ¥%ILÄçIRIJç%Ô›ã•İ34±*¸™~8€póWÕöf$¬Ñ)–Fsj%$’C\0Ç´ñØéu$ÎWQóE«£àŞ–÷k?š\\¾­)“…\\R°©s–Bpê$Ìu2ó†ëgÍVİó|1b”©*Ò£U™î¯¬\'¤§®™!J•‰TÄ¨¥i$‰]R±CÚu’$–yÜİd%‘NôŸ¡×Ç‚J\r>PéŸÃ·H¯Ò	GT™˜”`²ræ©G5\nVy½RZ^@ •gáH)\0¹ûd¢İÒ²Å‰¤×àlıìF3	ÒXéâLµÈÆ(Ië”…ÊL‰\"Zû&Z‚eE#2(ÔB)y#<iyVo„e7êiXvX©	Â­¥­r:CŠ)ë²:&¸A(!ÖÚZíñbí_„¿Ø_†Õ7êd}ç{²ÇôŠÓ9Rğò$ÉÁ¬£¬Tˆ˜§31	JFDK–S1`!S*©qç†%ÚªRiŸN{2wå¤~e!­rAÌ‘4$²³Ô9ìÏW6Z·\\Ÿ©s§¥:!Ô’‘bé¸«àhmçäÑ¯»d™˜è©ˆZ‘Ù$hd±b\ZÄ¤Ñ‹Œ×ägÆM·U%eğŒÈsEk­Å’áê\r¸1R2Ç+1ıS¡ËAf&•MOhÑİ€zİ4”dbÎ›ƒ2òçŒ®XÑ³è£nQèû—miÃtc1H“K¤SPÿ\0Úş *¡£RcÏõy.G{¥ÇP)LY*!œêZÖ£f\'µRÌ\\e52)Œ2‰’è¬kJˆÖ©¨PsZ?jõí*:˜$s³#g”}P6¶cÉÖãëåf”yDXø¡ûÆy2ôJ’=úóæ.2Mša\0ñ\0\Zm¯-\0sÂ©ŒÒF´é$Qîîf¾PÌ*ì#,îéER\'	U± ëv…·¸¿Œ44eš³qÇËì&¾¼#§‰#£³œ?3È¨\rçÎøˆI—Ày¨ü²ü£<òöò:Šaõ\'bNëvÿ\0•4\'¼‘Êñå½\rI&©ı\Zııs¸ â¶Tö%cÕcI(õX*T/$+Õâ Z}V.g«Ã]\0«=&ŸÏŞ)ÉÀQÍ?\'şxß«\Zÿ\0õPwúEîšpıä|h¥‚Ô3(U57{1zhkhÄÓ|R¶\0©ˆ ¦ÙA¾¦€\'}í\Z®E±3’@I9C‹YÛ+›\0™ë³EY\nËQ9¿FdªÁÎg`i©\Z\\‡ĞDhR´¼¤š\Z1 Üj1ÚpÛV,n€A¡Wh:œ\nº–Ñ Ğéç\nä81•75»›íƒ©o.j¸¬{y¶ğ£Ç?¾Ï©$ 4gŠĞ¬Éá0Î#l`š3ÊTÌ¾Q)’i†ìoIbrËZ¿jIğÂ^¢œÃÙßx½#Œ•†›Ñø,FEK+%s0òåÏÄ„¶?¤1ÁX„&l™baN\r™I›0öò\0zª²6îÿ\0§÷ÿ\0?õZIlïbúMd\"wEbg£±*tÉÓz0¯-\0•NÇõ]!%X·Q2ğıfKÂJ–zÉ³1E”24ÛãC÷.=íŸ½Tî“^\r]ŠR¤9•\'\'Óx‰PZ•¯¯û/£“*X\0¢F\nh—4Ó€R—³\Z´šØTRçüü¶tßx’1ÈÀà?ÓS‰8“ˆ–œ@ô’ÃÍ^A‹Â\',(”\0¤\'¬0	VU•¨E®2á¯óóşåi«Õ~¥_tŠéID¹‰20‹ëñø4ËÆaæ+ÿ\0…)Æc:#+™ÈDş‹ÇLÃK\\ÜCÉšsæ”[û¾¿çùÁorŒ·ôÿ\0>¿ÔÙqŞèú^R³H•Ñë+<O–·éYBZ;} etJ²t†l´«‹Ã\'$ÃıY¸t¬¬ÙqNãiés_ççà²1ùoËğß¨Ö:Gß\rº;‰¸•bSÔL“Ä ¿JÉZçá±/0„¯¯ÂÌBzÔÏ—…š…$„áä¡iIÕƒ/|RKwëÏ¯×_PKRmÕoKÁô7¾n†‰JˆJ’ªš\"hÊ´©  ³6WŞİ€Uì:l¿\nß“ËçÇñkàùËÚwáeÂÊS“\"Rs(¥Y„¯¬ÎJsfsÚÌnáÍYºç]³ì»L»®/ÁÌ•î\"²—2z¤£«˜¡,¤©)œ©©BT&¥“ÛÊ«…e\"B²§•“<mü¿ĞêÃ­²¡÷38¨õ¸Õ)%8d°–R¥:ä©yŠg¹3zµ…Õ&1Ì¤Ì¡uoå‰bÄü³^À{–Ä&lœzæ&VA5S¤ËÃ‰‹n¶gjdÙ$)JÊ™ÓRëÍ7®Òò¯å4G^HOáÚy™sqW6ZÁRT¢”\"~r†i“&)EC¤%J!H‰P¬ó&¤³/‡~Kó½È’•	…ËK–™y¦dHJæÍ˜+1ŠæÌšV”…©(r	l_\'r@É†ŒHûŸÅ•)r±«íT…ªnY3pË	Ì‰ƒª\\™ÒÖ©Hq\n*•¢m_\rpUØÆa½ÊbÈIWHM3”v‚¦¡¢V.e‰¥$*d©“V|İiI\\ÎÙ\\yãÇn†Œ~¦Õîãİœé	š\'Îë&¦d™™”f%%)+R¯™”r¥(J‚]jIš¼¹#®’5C$±ù7®‰é3ÚÌ’™ˆ?ÔH4P²fÉ0\0ş•QH¯RÑæú¾—á=pwú~£â\"î;	¶ÏRÉsak¨òÒä\"1cÉL×5¡’VB\0u-İØ]*¬Áš=úVp;Õ¢‡ís$š\rX3\n\Zşª¹öÓÍÏ\'s=#H£‰”æ©{‚\rJ¹ìŠTvs\0ù›;LŒD%y¨\0{š¶PÔJ{Gbßï)1ÚéøÑËê\r™+õ_1ÜzA¦o­¾ãÕb¹Q¡=1§Ô8É$j‹	kõ_¿Ûş[œ³F¸HGZI¹\ZSîôä)Æ(ü\'çØVüÛ~ø¦q~\rÊ¶G¯µB—)\"Âã“±nQ-•]›¦>w`|>EÑKF?\'¥¾	¹qeL%]¶¸\0$w›¶€I¾ +’nVÿ\0+ÿ\0ÁbE\\J…‡}­µ(8ÁëDìé1O™ñàªL¬Â:ôVÅ®%¡Âğõo´EÈ§•/×¡vY_q]wÿ\0h\rDóQ¥}iËÑËS€èùÊÛ«óš‡°­=^+i8—a9ñ²ç€@!.”„Õ_$f4vÊ0[<—\0›Š¸vı@Î¦ĞXhLÉ\nv+*¬ÂŠÉo…€±ÔnµÀ\Z¶R\nT\n…IbèÃµ¨¯Î,­\nQ_F¶½’,“wª”\ryYí0Ğ9•D†	ÊØ„‹€t¨ò\rVÓ@fM\0şÓåŞ¬şCHš¸}cÜIÖ8£ÆËş£gÔå\0;¢šÖ„½™~ŠØ^Š2#/,Åy^ÅŠÑö£\"jˆÌµ’’àI‚{8 1E–¤{ğÇíxœ?3(>\Zz¼>ss\'„Â§©€œÄu¸‰ç9sV²%)%JJM=ƒ´úOÒ\0‰\'¼}â¾í(”ıŒövL½rĞ„ø‰³f¬\0ÅæË™GVJ@­€âcwK$–Ê\'É±ÊÅ¤³)%Ã† ¸Ün8ŠGUN2\\”ÑZG@ÊJÌÄËJV¢êP\0(€\n‹]E $¨ö²€—`È§d¶Z›22õÔPÉ~óq¡}+†‘ŒëLÃ‹‘Œèõ$<¹=oGô¿G%J9¥aì$ŒT¤K\nWRKçZ—‡£›nß7Ç¡Ñš]´½)ÿ\0ºƒêÏzë&LÔ±Ì¤L¬RL´’ÀÊÊÍPg0íºD”Ó<—P›‹GÅÆV&T¬jdHš¥L•(ä\\µ)dš”)P…,ªhOéu(Œ¥;úÿ\0…’P¶µ·øtpÉ&“İ#™ûCìÖ.^ƒ|AH›†(¥=c§8•\"…HêÒµ&ã:ƒ%•Œ«LŠi®\Z:ø¾$cÚ×“cöó¤fb±52±)•\'=SŒÉ3eäHÃ«*—™)dr…AS¥ÌqºuK\'{WãóGMFy%ÕøşG0ö[İ^%}—úódc“)$b%â\n–HKõ“„„¤„öU,Õ¬p²§ê:ÌJQ‡[E‘é2ö·Fwİ/´3gc°+2±’¥`ú,aq\n*t”ŒKÊd€°Œå!+$„œ ‡8Ì¹{V9;NŞ«z¦§et„µ>SÚt’PKew æ³± ÇrMÑØÉ¨ìÈ¡~®ıÿ\0Z¶è´VsèTÎ‘JhoO?—\ZƒTÕy’\rs›Š¶]›ÑnOI³áêÇqÄS¸\ZşÓ­Xºˆ·¢Ì¸$–ÀöXKN\rØ§pòî Z½–ÌÚ•Š†¯z¥ËÙ\"îx)?Ú\n€P1Ëğ» —b]ƒ!<}’=\\ejÄà±Um	u³(öƒĞr^¥”\\Ğé|_ô»NsÇş§q`c‰&È\0‡ÜƒVí­@ ‘G\"œ…gJôc‰¹$‚Xóq`t\0?QIìÆ¸Cer‘”èª³—mNüé@-£ÃØìàçÈÍ zõ§§ÒEIŒ¸zÚ(’/‹\r3}SéüEReñ`­nc&Fî‘¦Aá•Zé§Ë×œT´¶Yl‰³ş;Ã…û´»E\ršnÇá§EPxå¯WLaÉFÙ˜z´€ö«Sì=XE©h¯ÉŠÀOíÙß÷\0{Õ6\Z6¶¤fÏ>È±”l½7¤;“°sNLK³\\Ø0Ü¦ŒQY*Á8v˜l_J%5R€âK|ıqAªHÃ)¯%)^ÒJUÄ¶d¿ÏÖæ-x&¼2¿‹RğŸë×ù…Úä}>*õëøï„“±gõë×D\'?¯^¸EêTVâˆ*{C9&/lRj\"œ‹Z3–ş\"Hÿ\0³çıZ?ş*4çk8¡´‘£Ş><Ô\0\"„:˜öjÕ!@ŠÚgj’*:h¢¶Q)ø_´ü.TC€·ë!ì0ºT9\0;a±ÊÈ¶ğİ¢•qÓŠ™J!Å2eı.¸è]÷¬D¨‡–‚\0r{!›rÎÜx¹s¤%\"P”Õ€£ºIn×eÕ•µìÙ¬år€Fjño-9BWĞ\Z;àå_Ğ›Áa¼ãÛNéÄñÒMŸPaQHøÙS2=cDTŒÆüàÏ‘QöÚH8ià©)LÇR³eHÈ]JÊ¶9R¥3°%„-Œ—¹_s}-)È—ƒ= O— ¥sR™™‚¦JBò)SÖ²BdºA\n	Í/B96w^Œö~A¼™\'ÿ\0ëGşØÍ{ IjÎwí²iJfÏ$¯¨¥IÂ-s?\"BÈn·,‰sV‰ÙÖ192Ò™²Ä¥ªP¤Å½˜‰şÈKë0²‘/\n•-Áb&É^ O•‰êÕDÜĞ¥™9;0-_ÔR•._Zœä$)vÕëùØ/gJ4«,™+Å4éİVdåRÖ°TU0æXÍıA/ªDÇ\\µ7G¥›Èß¡Ÿ&¸6Lw±˜RVA\ne!ˆ7³¬QÔ(ÅÚ%\'Ã>öûİ\\¼>3 çJŸ‡ySñ	(V3¬Äb:ì\'EÌ%\"j—6x—9s§­”z©X„+)DĞİßõ6ÊÚ–¿OÄúƒŞ–¬“‘ò¹RTIs•+C†.l¤Ùf*oŠ]Ï-,}öšúwÙ\\BRz©¤ÂR²‡Nwš;ÎWt¥,ùAÊ3¬BË4%¹-—¨N:LÖúcÙ¬YëœL €©&@ ö\rU3=²’Ò²°J\nÃ¢‘Í}†ÈÊ^¦™è^’!­•ñÌ\n^e¥\n›„V|ÿ\0—=a2åâš!#¯	*du‰æÏdî®,Î\\ˆO±}\"¼éŒRS:lÔMDÂ‰¤çVd\"PS1hNP…«(Í%3©T(B9ªëÁ~Nªs…3\\èŸwİ*Q7!òâOZ•“ÖM6bå«*Ğ¼¡@uyT™a’œé–ûÇZ_ĞÂ»®Ì®#Ùn™C‰–´BA2×03%–T©I˜­x59ÊŠ¥Ïk´Ú^oilİ.®oMè…_JµS&(É~ë)Yn(á×$å3I(V’œ¡%çJRL¹ÏQª¯C4ä®Ğ+îû¥–¹s¥â••Ie*|Î©a8®±E! M¤ÊªS•ax¹L¾°¬´ñãj¤„†YEÜY˜Áaúei—ÖÏ!`¯)’·Vl(Uäeêób¥%#­J€£œ%àdrº;pø™#£vö]$f‰xµ\"f©\\²¯é§4Ä™y{)ARÖ¤õ¹ØÊ”Ñ-@§©ñ0Ëqäçdéòc›´`}—ö¤eË±ŒZ„Ü½|µU\"\\¹X•“8â\næÎ˜pÁfX@2å’™nJã‰›6	M©GğgS2¨iìì®””$™+5SRL‚BÕ‘ºÙ™ÔU‡Í×­*’úá³ƒ¡M7Ó=D‘YW&3\'¦º©2Ïdªx™?/T•×a×13µ.ZÒ1X”S1(8ykC%EvÂ=}ı\n›ê;vdztÔÄ¡KJ W˜,¤¨	\0!$(ƒ$«ó%*i3S,J”TzÅj‡M‚ôŒ³ê2¾M‹İ„î–N$JÄ¡jÃ>%æLü¸Pş¼Ó ƒ)J+J¥uiAi*HøÂËå×’8»~^tdR“{;”³ëÖşŒs¤j€@úo^´Š›/GŸ×¯\\£,ô_¤I$£yüüã2ƒ–Ñ¦-\"Äù%¨ÎF¿(91MÆĞğšL¨&÷nzë¾¼<c™zÙ©–p“ê*82€Ş©¸š6ìtĞR*¢}pP*lÀÏÇË”µ­	H Ôwš;TÅGO,Õ­èÑ‡$WŞgöçßŒé‹)’„\n¨Tñbá/Şº‘êzeÇ4òmœ^¯«”åPàÀtn|òë™˜“©úÇeeÇ‰RG/²rvÙ°b½ÚLHÍœzõşbµ×Aºé¤¶Sè¯hñ2&` ~•…mÈ3E“Å‡*Ú\Z/$¥ì¼Îd¬us?i4?í:ò¸Ø´pz•ãÜx:³wrm½`>½zÒ9öj=¤±AHùzõX)P\nó—Që×«ES\"G2üC¥ú;Sÿ\0‡c_õQ^«5\\š1}ãã…âTC\ZQ@½S˜K~¢HzÆi=4BäPnÛP=nI5.^Í&¶0j•l­G/¥.G&{¾X€-ÑdÀõE.båÉï,Y¼i.¹\0ÔK`YÜ\0äÜ½Š×c£I‘¹€mf¡r*4cº˜?|5è—±éÁ¯÷‘	ñ¡(ëƒ:HŸ¿X—:T\Z÷2IcGÉnlúnIûE(©èÉái\ZàŠ$ìËáWNøiHÂûÄI8<H&DĞr…3wÅiî†F7ğÅĞø•\'gâñ2§ağó0s0jFÊ—;=Išå2:Â±*n¡]zÒ´…‘ÖRreô[­ŸKà0ÓŸıqß)\'º…1’öÇF›ï\'İÄÌn\"TÉÒ×5+Q Ëg·ü4ÅÊ1	2ĞNe%\n‘\n\0’-ìtœJ{»]?ñ\Z$Ïv)Šš‰“Öd¦Fi82pó18¥ÈQ>zñSV„¡ ,~NZgõKş·æ•š@–ËzíçùÁÒàî’zd¹‹W-	êĞ¥u’—5JZæâ1N™Ò\0Ì¥97:\04ËÃãÑäÍ}Å^›—Œ(PN#•¨%G	4„©‹(Î¥À5#0v¸FYÊZfÌQKgç–;¤\'+¦:&Y_æ‘„Bç~az¤äÇ#\n‰ŠBÖ:wGtv|´e’JsÖdYG_ÙÑRvŸùê_š]±çû>½é.‘JÔ2Û3\0jlµÁ WP¤Ôş˜ösàóéyFí‚³IŸèÙrƒâåÃ€ÊP±%8p®ù²Ùi\Z÷æ½ÉûÁß¤3éè¦™c€5”¹7\0ì,Ê&ı’Xçu>»,ÅS²Ä·l½Âìl(ÿ\0ã3\\Ñ+!¯§¯_hHÅ¹-Ì@sÌüÍvğAUÑ›3ù„&rµ³zæü™FŒK¾Ë¢¾×VF=°¡OÕë~hÍÔÅ(°Æì¯í*Xe\0:”tÃAÉÜ\0§Ñ‰oÔÆÏUĞ=ìÉápY¥¡.íÛY»jI\\,¾j\0*TœîO£3ø“¥ÁxMH(	K¡Ü0)«8wÍ•Ë–#â¨8“nÛ6ÇĞ£ŠúãâøKP¿2¡˜6Ed;Ùa“B0u?Üie\r¯| –QIí(QíÆÌ8e)#&\\Š(Ùú?”1¹.jà›8àCRÃ@›ŸCÒ<üåÜË zî\\aXbZJ«ãóo­—\"ëÑõÀÆYi— B½>»¢‰2ø–ğk­E¼EàâŸk¦‹¥Cºğí½¹ÅË2R¦µhF\'Wß×œrúŒ	K¹\Z1ÍÕ1r(kâ«Lw³\'Ò*„K*Q\0$9ğÛÕcfnR¤S9v«8§O{Zg-_=„è4vÔñ.Ñê±àX×ÔæK#“úã§1.íÆ‘¥*Ñ_h]\rí™”%‹ÿ\0Lğ÷\"Èèİ1ô‚å°pY½zÎ‡MÛ;4wZ4Ş‘érj<£©\rÊ&OÙÎšQä^ ï¸‹eÑŸ†vc=ªÎòÖFt‡÷\'~bÊ\Z°xóİONáó.\rØòŞ¾LÆõëÖ±Î‰©\nv‹–Äz*ÏŒ&Hè‘9ßâ)?ü¶yÙ(:×úˆÚ¥ìÑnHEãL|}çÆË$z†SU†ì±v4şWDªÎÂ4¹	vŞÖ w{ÑËêÁènAV;ğœ Õ‚XRî)SüÂw>h‰‰œ®*X5Ã‹“¡¿¢È®ÂÊógÕIÛ1QóGî‹D±%œ¨j”’+©aBÌ\r‘ŞƒÀhˆ\"…)$QÀ-İèz;·àë¢f#1KBÒ&)+AZ´±ĞT\0R]Æd¸pCĞÇ½œ`­½JLú>J£$y/I›\ZâÊ\Z2øTÒ¶1~Ü,üˆLÅ	KË-nP³”²Ê–r«áS-‰í&á¢ÄjÈ{ı™€›1xî›&rÕ.GIş]RT‰XÂ™rğ+@F‡g…LI˜™i™<\\ìu~_óëÿ\0“LbšÑ×:+ñ;‡R²~O¤®¶dŒª• :RsªQlQş¡GnR>,J;RDğD+Ôgès/e³Qù©º\'¤:NVnN»	%h™kuK—ˆÁOL¼T¹Ò‡ôæ¡`”u,-µÁ4¶ÿ\0Ïóû™ç‡ºZküú›ßHş6f!Xt\' :nzñiXèáL“77ô§­fZ%M@KÌJÊræHÔ>¨g~Zôä­ôTk¾ë8lPÆã1=l”#*-\'\r‹ÄşVT••bq2ğâOæ±+œã)sÕ¦HHYLaÏ,øôåŸ§õ,‡N•ŸçşÍ·Ú?ÆWEI—<L8Â©s%áÌµtn=Î\'+­‘…c‡\0Îš‚?¤áiÌ°‚ éRi}K>r¥øşGÍí˜™•*V:ÌqÅô†.lÅ¨aúWò“‚ú\"X\\,µËèì:D™J9€g\'*‚ŒÙ–“×‡ÿ\0Åï×Á\\Ó|úkğõüÎÃíâçõdáÎYİb*İ“˜Œê9‹å(d¨2–M*ÖâÉ»ÉÅ±“UlâĞô—J©“Õ(™€ËRŒÃ6RÚX9ÁYZ{@–JGôËš!ğ-Ê™ÚÊ’RàÆ”éT!Ye#¬!ea$0BŠ\nZs,Î^A-òd\n=bISŒ®ù4âr“£Ò^ĞôÒÒe\'•\'šb°NQŠEŒÓ”3¬ËÂ•ç¬•))iƒ\r†1„ŸqºSiR5å{CÓR&¤’&¯©‰‰LÄæ›‹ÇKL×–´¬‰RÆtä©cş¯/T©j|9aØÑn‹şÒÛˆŸX*Ã•IÍ-=Fp‘ŠŸ1EŠJ³aÑ&DÔë‚¤ªZÉ®?†İÑtÒÌ•u,¥*fyIC ¥8¤”©KÍšZ•†wMOÆœ…_ŞîØèNŞélÏaı é•	Iü´ —QZ•-AKnöeªrU$¤MÇıx)Ã%`1!xœÒvnXİQƒÅ{UÓç©\r<%)(H&J•‚ ÍAš¢ŒØ”‘.b’¡,¥*dËå5(lÁÛÚÌŸºÎ™éIóRœd²€Œ:–¤.Y\\Ğ™k	n¥Õ1så)D¹‰BÑˆH>ªŒ;uÉÖér»úÛ£À I\nI\0Õˆ*Š1#‰RÜ+²£Íå“àíB+”%E!&º)ìSğ€(½”|,JI$WNÍ)•q“ØÔ;—)¡É \\æ™PEr¤;5oÃø+œ’ä¡Ó©™/\r=rYÉ•0ËP–¹¥+—4”öç­/•#2ì31ô`¢Òg,Ü›£Ÿ{»÷§ÒpÒ¦áæÌRÔ´¯1\0„†\\6™IPTÌ>Ì	d¢½aêK9‹ş†.é\":[Ş‡IÌÃ&re~QU¹S”Róe!+ViHT±2feá–„JLŞ¯$Å€¡§²Ëo‚×A{õÆv°3J‘ƒN ‰ˆ™*ræIVA!Ÿ”­KT œëZf¡C*€Y–“éâøcÃ#ô6Ÿ`=îÏÄâ%É^R’¬:\')d¬eR’…dÉ6\\•§7T¥0Pš•- 2eÂ¢®Ëá6İQÕ½wG*\\›¢e¥$eãaİ\ZaÚàv	C°8ä_Q»œX¡‡-~í#,°9.KEb_B*5Ò1?I-¢åêcŞ<8KUj¸\n—ğùG_Ù¿4ÿ\07Tª\' ÄKBSLÀ‹†ÕÓÃt±gÚ=o¾Œñ„~ù0ó\'¤($§)Rj^• ğßx¹Ò(Š›ÑI]SQÃ¿Ã”\rx,¦/şÏ,Û=8EN;`Ë \"¿æ,Œ@íÃ‚\rbÄŒÒ6Î…éŒ‹—0S)©ÒX¯6>ø4*•;;ö	AŸCEÃµÓ:ªW±Ò¼-áÇ@b–{]Æ+tÀõÁÌÿ\0‹n8Jg¨ÿ\0Z[R††¡ˆ«wfÊ»cOƒGO¹Ùñ°¢k@,Ô/³»7Ì=9”uĞ	”Æ®Kå\nQMrM€­ğ’^´D´—!65âEôör\n³e°¡RpìFT„Ô\0½Ûœ4vé§‘u›æ!V¥“^C+Å©X¬JeÂ $½Ã©&Ç+\n¥{¡FE¾ zGpöwoÂOJªf•)J)@ÌIÊ\0p”¹,ô€Ú±ôäsŠ¿\Z<+‚‹my>‚JêÑ™rd°òé\Zb¬¥³\'€·| (±6[‚\r|JÔ=éÎ¹§1ÉxS…BÊW6^/\nV•+\r‰”… ™™B“\"rÓ52”µLìş£{´iÅ.Ös¼¶S¤ÎÃÍ•#™+“%)ê$/óXI	ŒDäş_¥d¥K•3¬F2Fi…$ºê‡JİÓã×üÿ\0?©¡åK“\\öïÚY\'\Z…/	ŠÄKL¥§\r<àq=!ùt©a³.pèn”‘7 )˜„ô†=	_R©ITÔ®ÿ\0‡5\n_çùàŠjùçÇçõïg¤0«D„õ8œ`ÿ\0³¥K2GGt®-. °3\'Ó¿•—5*ªÆ&V;ñÍ™ØŸf·õµÂíı¨¹É;úıWû%şÔ†c}½8\\$¤%â±•rğ¸\\:=À@LÔ`°=ĞÓfO“<à°!2L²œRVœÁ¥ù&ı<ÿ\0_®ßR¿W¶š~¼ÿ\0uVşŸÜ÷³}%(bp’&áÑ.t‰X¼ØÜ(Ç\'	Ñ’ñ!J*èñ9µcúp-eké5áÀœ²ATõ!s%ZïtíkŸ ²Z×Æ·ø×égCÀôl¤&F	)x|\nZ“…–ªÏ›2kuøÌQ%AS\'•.ëH3Oõú¹-%.æRÒçË1^ù½àÌÂá×2X\\´’\0ëQ	ÌRGí‹ö\\Ñê:^ÜÒQg¨¼qrGö“ŞŞ\"@Å!X¡9rğòæÊ_S%ó$K˜ ¤®`Tê\0²e\'-@R”eö0`‚ù’£²7«³}ÿ\0NœZçK™&N£ÄôÈœ™\"dÉægW,…!k&–JAU\\¸JOM•p`:7ñŒÿ\0³±ŠLùqr\'a‚&KJ(£¹I¢Y ”©Se—vPæR…QI:ğYm­™i_‰ùÙqóV/ò˜I@HXbœjæ-\nA]Õ,/+0ø	©ºrO²Å’¬\'â#¾Œ›4L‘3##©²’\"d©Ó¥¤-	rÁHRå¹#´…Ôj¥‰\'¡£“ıÉö«ñG6OM§\n•ÉNV\"V\ZpPş²æâÒ&K	5“)]\\¹´p£ıÁR+…¼•Â{MøºÇÉ^>Q	ìc/ƒÕ«!T¹ˆLùS{@g×K|©ø€|ˆ_N©ç’oñ>¯^$°u)\0ªv%»V[1%BƒITh½Âİ™Y¸‚é\r¨jÜ;\"À’lMWâI¶Í¸âªËõ($]\'14©rà¥4à{F¬K3S“;fÌyoH\\™ô=§bH\" )Y»Læ ¹Wh‹ã’:,b:2KĞ\0ïP”„ªÇ²\\ü9®ÄR¥È”é”õ1n:2Ú÷ÿ\0ÿ\0QßLà4ĞXp÷”[¶|uÓÜJ$båd«.rº´4Á-xYiÖN=²®Ê¤ä%$$)Ip*İWÑ«TüY™u±º~d%D6d‚Ï@ì|8ÓÓhèE—‘,?£dÙ¢#%Ÿ]Ñ«4Å™?Ëë_Î-x*™j†d‘Pyë\rğçÚàêZbñÈ«xmå”_sà*)è¯2p,E}V2çË«%Øà×&ƒïE}©)³…Ÿ¾·¯²×Ş3u{Š9ú&¤MÂ±Şí¹YDËF£Óİ=\0”¤?XŠ>Sú’8UÛı»˜“”V™ ¤øì§¶2s5¬ê9€Iw€rÌd”¿”Óü&OHáŒÉbâ»Ü·\nøÅ1”›-”kfí?OI²e“ÆÑÑÅŠOlÇ<©hÕdâ”eÓ•#l\"|­ìÎ	¥AÁ»üŒ$õ¡O¡ıÅH’K¹BW,=Z<‡U÷Ú:¸wg×„†ô<…Îä°>>¹ÅÒrÑJ•rsÄlÓÿ\0gMg¼±Kê£¯¬QŸş™¯§ÿ\0¨|sˆFd²A5ÍCŠx0ÓSWÉÙLôé¤vUPìîï˜8¡ı%TåÆÒàP§³hsÂ¬Hì…Uèkµkh*šBT²Kº€&Ô¸ÕÆ„Uê…°Œ˜jåWe²\\$0³—r{ÎÁâıely9TjE\rK*¶ßø„ò?€R“º¼ R	İcşoÿ\0—¿áí¿…/+]ÇÑÒáh©³+†M#\\\"‡É’ÂZ ¢ËÂ0’ğ”:$ËkÀ2†ĞÌr¶-€v\Zzå¿Œ›,F-X\0Ä(†\'K–.ÏÉÃU’ÍrÙüš“Ñœ T’áµ\0)Itó6´X¹½…L!4= C5sİü‹Ò©¥Ò¡\"¬Ö}åÎË(RZ„É©BúÔgBe¯1S¤)’ÀvRMB‚‚NÎ“\'ÍøócµGÄûG))›+òrU†LéÅRŒ©!(™%“9\n”HB“0L–•ªf^­c²d«/_ãÊï»õ*K+ú,ŸÃâ$b1Sz6B•(Ê”Ó:µ•)jÌ’eŒ<Åg˜•¦B^bT¢,ƒ5EÎ”é#=8üQÀá”™]‰¨%õ‹Ÿ6\\ÜRÂ„u²¼<©’h…Q?Z\0IçªE‘Ä³\réÔ®j”¾ÃO˜¹©\nš™alÙ+Á‰U;ş (ÊüÒÎp©Ä	,èZfK•Y\ZuaPµtöîR¦OTşŒÃ/¬S*l¤¥eSğßŸT‘9å¥K2Ñ‚NUUr•1\0\'´ÒìsúŠ£æŒz½¨’‘ˆ—‰Â`•*lìRñ¥ €1ñRdJ™9JDàW‰ZÂÒT%¨2Jzä¥F[©YeSıIÂ{ÄÀMP“3£Peâ§a±rÒDµ)sq2ğ„Îš•§(ÄfÅeÌU12æåRÔ…É¥i’İQĞı¡÷äeâ•$ËWW!O9F`+~®BåõrÇş3Ó-sHHM¼ƒ¬ÃÚæ¹74—(Ë{kïÅRpølXÃ­hšŒB¦‡eÊ“)×$BÒW¬ƒI\'5ĞPiL­Û2Ë#N’1ı-ø –s„ITÕK2ó‰e*¬F1yJ’JğÅ²\0Î—%EI—Ÿ\'H›ÛÑ«Nİù-áÿ\0^ÆbR¹³Ô©BVyI›šR¦­rÀZz©Œ…1	ItËêf‰x%ĞKi£ÕÅrd:+ñ3‡[e•ˆ((Zæ­i—ı0&båeZÁ36lá•ÔË\'/lÏÙ²ƒ·V_ö¨É‚÷ã.dé‡Ä¥x€Uÿ\0ƒ12RÂÕI40Ë^^¬ÌÊzÎ§5:Xñ4š~vd“´u™	\nXòÛÕ¨	!Zz3œ²oáo£Pü±!R&áÔS6q=V\"jçÌA9óVjÔR£T)((J€:¾Õ‘üo£ğá $\n\0\0 °·ïŒo{4\"îJ×¯¢HÓ.Iõë×É%Eñ2’]šÅÎ¨¾¢¶‚N!¨G(‹3Ë!\\Ú+uáÙÿ\0ˆ=ñû¡q| fa@/¿Î0åÄ¢íBmòh>ô¥—ÃÌË0ƒÉB¯Í›¿Œu½™Ë(ê£Šô·´_ÔVT(•qè“2>ş?£g(&PP‚Á9uf)4j†:Àœc(¶$e(É#œtÿ\0Eª ¨.Aâ	ã™ÙGb+ÔÈôoI¥…H9†f\0’ìïm ÅÔ¬¶P¸³fÁt?XhR	ıÅ€çzÇ^/VpÚÙ¬c\'b	\\²ƒı	ƒ2‰`P¡L¤°QÙ®\Zµ\ZRv¨µìÆ36a¾pùG­ãFš2IQôÿ\0³rŒ<”\ZË@mE¯ËÆ<gU¹¿Äê`û¦vI·&…‚¥cÉØ(S±-¹vìT¬æˆ5·GÏrÕ–ÜOZ€Üœ‡àûF©´Ñ³ŞGÇ¤8$”;š³UÜ>ÖiÏ£ª$Î¦š’ÎÁ75Û–\\m\0DédšjJ^§´İ’û‘FùÄ\\PXSÀ©Á	P`*XQT¹­îo	@©®.;,t,¥;CEµJÄå‘ˆ[\0AÜƒ±J‹pO]HåDÜ¶7\0Miÿ\0˜ùëÎH–w_Áz[	3ÿ\0Ê~B=Íèñ™3è±2¼\"›Ø¶]ÃLzEøån„q£0‰e|£{EhaŸÀø¥ÅAÆ¸æ%4†[\'şÒNşF»Èô.wH§xII‘¯t—M$š*ÖÛ5—{g½—¨˜É¾ÑY!@ø±«¸?hŠ“¶eœ@\nI«;s¢R9›‚õQİ…]÷!Ôt£”¥R—äpĞ?yoíí,¦ì²£M÷Ó3¤%kD•Ï[²%Ë(MÛ´T²>%äBR¥X\Zõ-ŸjVqÿ\0û×Ä•—\"RŠ„ÅÎCNS$”uh•.dÉ…jÈåJ¥LQÊ…7O:ÉÚÌ™ò7‰Rü@é?Ä\"†\ZTÉR¹³%àÊSÖ«®ÇOT™rÌä¥@¥TÆIX]gn8×èA÷ÛŒü¶&j0Ò\nğ8™’q@ÌšeåJ´ªH—)SÖ	’Ó”„d’s(ÉŠ:·Ïøç*×õ-a}÷ªf®—†™9_’Ãâ¦H¤¨¥sÉ	œ¬’Ô”™sÅ@‡ÈJ’•eø:oÉzÉqàÃtÏâ•HÁtv%8I)V93ÖU2råáä™@«\'Z™S©Ó¨™IÈ\nÕœZ\né®rVôu\n1N¹5jBWW4aeõKÃañ\n\'dÄ(N˜¤-TujLã‡	*Y+”¯`17Ç¦õe3ê=Ğ0şğq¿öŒœäpå\næ™ÉÄ’¹xYJ	¦ ÈT¬á(–¢V¥\'3,7Ã]—b¬º¨ì˜Î@Ñ5 ¨·ÄuŞ­w£ŠR9™“Ñİèßv˜KOèze,\Zšie5€øC¥“cg94i–,IØìwBK¡Ò]ËeÖ¤®¢ k˜“[ï’òS%WG³òR‡2PT‘PY\"Ÿé©’\Z‰ÜPÂ÷d”¹cöF1ºÑhB²‰i«d²@fmƒQÍ6$ØÂdœ¼±ñB-ZA`:Ni$§«3¶–PHPFP2…ÚbİÈŠ±å”%mòY<Jj’7Œçkäî9ƒ~[0Ü$š³ƒ(´èpW—wñãß ˆä˜©2æúz{sù…,E„¯^¼¡\Z-Bİ«ñŒÙ\Z[4c2#}G³E­r_Øü‹üàPm`Ë$&¾ P”Xª\Zú¨„J3Óml#_¾ñ’qq{.‹Og÷‰Ó³¿2´ç=PKÒ‚üëé£¿Ñ¨¨ÙNdÍ{¢¦¥IqrXúãX´SY»ôT´\0à:ˆ‡“Õ±$Îí±kÎHí1v±ÃXÁ8:´o„“tQ™Ğì‡¾â1[:ºÑµ{0 ¤¸R\r*4©4Ò¼c¯w‰“JŒGµ-n¡Ù[¹@t§¡ÎÍK\ZHÅ{>¢•¥˜@\nÚ·$ı¹iÇ+tsºŒ)G{¶ö™x‰N°´)HSk”Ğ±¤pm©~«KFLm4m ³ Æiµl¯=ÜuòŠå½1Ö¶sÄBÿ\0ùn#BªìóP‘ÿ\0Í®Çê]‹ï£ã¹«¡*³7´\nßnË‚·³ªØ²Ï[±¢_ÿ\0(¹¨£‹ˆw/B.Ìõ$Š\Z½I&ÄemIŠ£-V˜¶f44*-MÙÅIUwklÉ¤:hl¯/ÕÃZj|=\nÑYJz‘DÕØ *\0ã¨ï„^eô`—¦FÓÓÅ»íŸ„ÕÊœ¨È?¨œÇ/iU³ì–Hæäû<²I*<cO¹ìú\r)xÈİdú<SãilIl¸¼t_ñ\nÔOKÅCw‘Ä‰Øˆ¢y/’ÈÂ„FFË’5ol½®D„’­,TYû€ÔÓä†7‘èw%låÓ=éMPëdä\nøs’»İÙÚÎñÓH“¯&O´7ÁÑ=‰étÍbPKµ)O½£ÔãítoÅ.äm/ĞÙú²~çúÚ0ÆÑ‰°à†T×öë¦ãÏü®RÙ[‰Ê}ôû_ùd &IšgL2‚&YS&Ò¥NY-,†JÄä¡)Z£N\Z“3et|óÒ8L	—&Bdc%Œ1åN˜‰‰™;,¥KëS5ÔAYDÅÍ6Ì´v{cĞà‹rî¾LY2§ĞÒœ$ù&TäHDÔ¥iRW#òr¥(L\'¬”‰HJ\'Hœµ…ª`\nÛğİÙŠ3\\”çãú&\\‰¬q’†lù³f&|ÄNœµª|™ëQ*\nœê“5,Fr­!åƒ\\±·±Ô’TŒ—ÿ\0az?	1RäÎ23M%õ•8,,òG))ZpÊ +2ºÙ¥j,F\\rƒ”¶-R(tæ/ÕªV-èÌL¬\'U†ÄLR¿âS!ò‘”ÎOS‹2Ó4()()9VlŠjMúÓ]¾‡–:l‰KP0²¥¦RdL™‡™\'\rÖN–U/·Ÿ:$u¤¤õ“I–•¨ËD2‹±ŸmvŞ¿GJÅ/”bU:sa–:µö#ó¥…•3ˆJú¡1EIBˆ	H ¼.¨q³iÂûßÂM›•3\n€`é—2aP˜®¬„%!YÔıßlêd”ÎÏ†\\³«ƒ2®Øq@ ‚zêWG¹İ\"Ø¥(rlTô\0MK|ïR×mØ‹²@\n®’ĞÊM²œ¾9•nB”–6!\nì(8²¨¢ìÔ,ç)Ë_3:¹cB§­c+%Là¹RK¹¥‡ZjÁùyd»ŞÍX#ò¤Wö«§%á$L²Òåµ¨D0*;¯™Íœ½„&(<“Q^MS¨EÈO²^õ°óÿ\0ÒQR™j\n\n&%+ZĞ±˜~€\n©(T•”éÍÛÇ‰Â+¿ƒ…‘|Gòò/ÙoÄ\rrÑ?4À‰£””+ÿ\0Ë‹U)Zò¨ğv.#N\\-RFl.Øııà¿©–j¦õLWÕK™1’d\'œ¤…#©RU%Iu%.VB\",.…mY±\'Ş -SR‚d™éBû3L”…(«ª?ÔfI#²ô:»Š\\¤Šİ\rï5kJg *Z‚òûfté Ì\nY‡œ€”•M™H\'L/ĞÓ	$gO¼l)%§Ê¥¥@­)/-JBØ(¤œ‹BÒHpèP~Éfx{i¤Z§zlË`±òçf(ZTP¢…5r¨\0JNÅŠMt)6\"^:’rÖ™gª\Z8„øV­r7¨µ>¾¸Æ	w_Ì]\Zğqy²z¹ët¸š_cbÚU…>ñèº\'\Z~\n2¶sşƒé4%D;lªv¬ÃŸu{ãª‘J™Ñ½•ö¡s­i+j¥!Ş¦Á¹şít™4‹âûÌıäf˜º©F™Û){1v~m\rKBdr‡Û_jæK–’„&ª.X^õáöãeéwfœ=cí§ÉSØßoêÎ”)±z—\'ƒRµ…ííT‰ñ±ÖôğÎé£Æt¨Üä’ØàV°¶\r¡ ¿vœîyGO§Åhâu™‘ôß»aÒ£u­Jîr>B9kN‡§òÍ«Ÿ0ãº9RGB%<Dçc«\ZFl’µ¢Ä©œçñ‰ÿ\0åøŠ|BM-^º[ÖºW¹±—$¼zšğGæ³ãe¨ šœÎÕ%œ†úğxÃLêTúP[f7*k‹-âÆ©Š«Ã6áb£©âO?BI¸9“ß@H$åk0\ZüÇŒW^H\'$¹ÜA7.ƒR‡Cö†²P”¤€Û	7\Z‚lÖkÚ		Ç\"|Ú°İÈZ;àæqV\rN]¦‘½SHöÚGzgÑˆ¤Wt¢m!Ó\n©¿@¤?	\r±dƒ\\£dNË#À•ª)lµ8ş\"\'+®@)jkW;Ğ}÷÷A\Zœî¦[£Bè©(È_>g–Õ5h×‘Ó;;¹,Zµ1!Óú‰)bC3ì~f8İbR<?+Ñİ±&r†©½*×­#‰÷NÆ5f/Ò«`ìUO«·+íÕYkÂ{ïkŞ¬$>l³5ah•*Z\n×:aêĞ”f`’§¹!’Nìoé¢ò:‰ÊênÎ5Ò¾ùğò¥ÍÄÍÀœ<Á‰ÃÊšç²²µdLÓ6ZÖ•	N§*RL²åŒz.Ÿ£$¯G,•:5O¼N’D¥£ÕÏ\\Ô¢IDõÌIÊe¡`)ó)RÀS!%!.z“ƒ3)*6?bºS	™Ç„¤®`\\¹Ò¥•&b&,,-5Kº”£@OX§n²rI­YbbğŞüz6j™ØU§ÔâgË\\éRW\'‰‘Š\\¤%SJÂÔX„*bVªTƒã’Ú’-`}øàS,ËVl©‰Ÿ…2ğfVM›3¼øuJš©%JRJ•5\n–©d¯+e˜èÀâ}ãôPD™ˆÁ-Kœ©ø_Ë¢L¶R¤8Ÿ-I3($g/‘kÍŸ(t)&]´2šf[¦½àôNq*v	IìJ‰R¤K	ù®¹có,©*Qˆ3U(NHëf•)¦)1±.tfı‘ö¬tÙHèùòÌ°¹«œ¤KL”‰KH+C-e9Õ02feZØ¬Ç;¨ƒ{L»éÑkÙ_Åj\'É\\äàqıX@˜’™Bvpf‰yQÕ-d-N¤;	Y”æK^Q­KĞÊôwâ~HÃªr¥â•”¤“…˜²\n¥•¶i#2„¶uÖ®`IÈôËºòoÅııóı\r£ }ìH›„8ş´&ABÖ&-–$­jíõjÊ” ªZ™–“˜Pƒ|7ÜãäÛÔM8).^ÁûÛüúOV\'\'«Zeä™†&a*IPg!9‚‡êì]‰WÒ¼2¿_6™¯¦Î¥\Zô3)Ñ!i\\¥‚©kì¨L.î*ùJH¨7\"éŒjrƒ´lRµ³Ñ^îä bfK32Ì[¤ ÎReÏ6Î¥PR€°„¥XñÛÁ<™¡Û/#4£Š}ÑòhŞì=Úafbæä›*j¤ÊD®¡ÌÉ‰9åªTÉ²û\"JÇåSÕ%‹õ¤­T¯óG~§:Y;õ­\nÀHè<?H\ZçSç\"^¨Í7(DôÉ’\n(RV¤J”ŒåjËÕ•Í+‰d’×TÚDô¦¢ºK™^-K“&n	JH0ÒÖ“‹ÁM\0¹Dµ®Z¦Ì\nÇU0¾Y*M²s„wA…=£oéoÂîa§$©jRÈTµ•®|É©R)hË4â&f-›e$¹V\'ÔÉz2õ‰6Nğ¹‡\\É«˜µ*bÔ–É•)Tütô†R\\~~jVs2º¹$vÂŸâµUÇş‹{{Óİß»Èõá+R„éÉ˜]œ	xl>@\nŠ0éRˆ\0(°\0ÉÔwI§ª.ÆÕS7Ó/Pßx®¦•¡­]2¼Ú³‚#åŞé¢ø¤‘ˆöÙix„€¢]5IXÕƒ+ƒĞ’qò¼+DÕK7B‹8¨«³é}cÓãŸtlÃ%L«†öÆbZµmëÆ,“°ÂT‹İ7Ğ’Õ‘}fP»‹‡Õ¾£xycQ¢BçÉ’Ætd™’)Sß)prö©`¢ú=À¨\rwTÍK§³B›/¨$%AAüa—ÎRÓƒ2}$â³üOü_ø£<[VW>©ÑÔıö­˜”\n\nŠ\\½oå%KnlúKĞá	J \0,5f¾±äóÜæß©ÓÆ»Q`§pÆ3Ê:.LÃÏI\nê8Ã=\Z9_â{`gìòÅ.Æj¾íqÇ–GßÚtpÆ•Ÿ$áÃ@VìrŠ=™ñ¯ºjEióKroK¨À\nj[{Á»	3e„Z³êjÀóqÍûÄTöÈ(áB\0X.K……o^f		e˜‹=\rœ-^ıˆÓX^ĞYFJÔzÄá”\\‡rjikQ;wÃ¡v\\Dô0ø‡ê\rÂ°–vÂ,§°ÿ\0T–§íL}è=ê2¸ÏGĞ?öğ2äéÚcÃ¨U³1€Ÿ˜8´c”\\]!%%h¼UËPÜ2áñ°MDØ’¹²éµä´ù×ßIÄ%k\"¬M@aP6ÿ\0E%Ù^N~xìÑ°½\"’§ÉN`ë}ôùF©$63²û¤”\'OÎ‘Ù@r4¨,ûéá~®£\r›q§ÜvÎÁ€UMi¦ÏÎ¿MŒy<²oƒ·±s0I¸5Ö·îúóŒ#v|ûø›ÂÊ™-8r&æ™53%*F@´.RW7¬bĞ“” Úµ	¦hîû.M»GÚÁÁ0Şî:=iÖãLÕb…Ÿ6fY(¥¥R¥¦R%&Y\\ùiX9¦(Í@$ˆMÊ/G“Ñsî{¢æI±%æa•:D‘*\\´~Y\0¢Zr	‚t¹¤ŠæZ\nrç tá.èìÏ%F_Øw½/¬\'Ö%x¡2ZW<’™ÊFU(¨(.iœ©3JÒáNİ \"­ïF	î¯\0rá×Òtµ\'€ÂÊ–„æ¬P\\É¡sSÖ-TÔ!KL´™´×æ×­YW£=’ÂÏœ¯şcŸ¤eâe¦\\Ã#$™3:.jd	j“˜•+ŞrLå/4œ ¶—Ğ­c·vOHûƒR%%™9ftéË\'\rˆëÒ%\n3%!S:ÙN“/ª@˜P´J\"qJÑÂào†\'İGâ%IêñØËKN£1“‰Rä/ı»®—•s‡ôÕ)Ht¥g 	Z„\'t¨GEÂ{O†ÂQ^!3Š›6dÅ1\\©H’‰8\\‹˜ƒ1ò,Š¨—YÊœ§>I·:ú’4¯`ıÛá’…Ïğ¸2dNÂ¦fGª&b’£‰Z\'L*A’PòÓ™RP…#*Ö\0Œùò8-+òjéáİ-3®tÿ\0±UtqÁÉÅI—!2°ø2¹G­VB´J)@BÊóMHÏeÊ–¬ù	>wí~7{‹æÏUcŠõU®O{Ë÷Y…Åá¦áåâÌ’¹‘.Jfƒ‡LÄËÊ€¬;¶ia‰J2)€$„0éú¬‘Èœ£{¶&lx»S­h¡î«ØCÑÓqÓgb$I3Š&*D•I–™hJU;¶I“\n³¯(JR·3&sÖê#ª4\"É87³¯cqòQ‡LåÍGV’¤(õ‰JRPT\\¨e) ±tÊø-–w\\èŞŸ”‘ÙZRJnî™‰)ÛPhohÙ8½#Ÿw\'öİö#£±ı\'ŒÁ§”âá$•.RsÈJúÃ8K’BÉ‹QJ&•$c¡ÍIE;ÓÙ_nÛ^ŸÜè¾Öû¾ë:NF%JOådHŸ6\\·!g92Ì¥T3K–& ö³:É	 Pe%Ğı–ìãë}Êc?®ë±˜yXI‹¹s§K\\¼@™2`Zd&TÆ2ÖT‰“ÙhS,Ó:OUfYÆXş¢Æ.2úXà&:H;8æšïû\\wëcÀ“££Âfvm5î¸Š”²U>\r}±ACb>Qoúú¡>Y~%°Ü·½­¤%.Lš	Ú1d’“ÑtUhğCÅ=–[t|áøƒöl¦wX/Ä\\G¢èeòö³e»9¶píQ­c¬‘šÍ ã$¤¥aßá%‹i«>(Ñ‰¤ìµ7Ú<wÛ)Œn\r5Ÿ\Z·U*lÀ”¤71!g?4ÕZ7œ(A	\rõ#XìÂpe+g[÷+ĞÄ¨Ì\"€0æ}yÇ/®Gµ`s;×~æ¥6uÔS)~h“PÎ7ãxÏîZc¼iñÜA‘NY¤–Á[9â!X	áÏhÊI#c5 ùz´pp.ìGQ*I&ã&„?eÅ‰.“ı£cxèU¡‚4ÕU¥YÍ	¨-B9	hbq`•\0\\€j£`HÖú7Z\"I)\nj‚sw\Zn^à¥\'I\0è{{;Pwj9Ãº˜€ªÕ†¦Åşb\"ØKGíWÿ\0æ>ĞıÈ=§Gü,â\0Â)éıRò¦>•Ò?“gÌºåS;„µ%Z^?H¾Ta[.ôz§$0#+ü@»MCg…K“DrJÌ\'´@²H/®ßÉvN™ø:8º¥Ã3¸YàÚ18´Î‚’fNL¸gYzT€ĞÊ$³€ş$½¡”$¥ósfJAÜaÇ‘İ$d¥o2$ÑÀğşÑ­³hH¿;øFŒ³íe¸ñÑô?áç¥å¡+A\r1yO0)•©Z¹ş#‡ÕåïFØBÁåè.Îîş­o§™Ë#¥ ºBp	4Ñ‘|Ú4p¬ùãß$œ*Âæâ	D©	TÌásRÃ)?Ó\\µü*l©rê¡ŒŞÇÙØŞ8~\'™ë¦¥#”{A‹èdË•Š\\Ä‰SÜJSÍdäT¥ÿ\0I	ÓRfI”Oe¤:ìüÖrôc¿ø—¡Ò¡Šë‚Ñ0±Í6wmR„ƒ2fET©råaóÍP=”„©@Ì˜÷©Mhe^M™C ¹=n&X›7ª™)&iu¡J!\0•…¨.sfI	Š›ÉNá½0äáz\'óÉ–™è¹*–±)NpeKr”’¤ŒÄfKå™§V‚•‹—nÊgÛİH«ì·±İ\rŠœ¹ØIèTä(ªdÉ’µ\'¬Åa*øÒÆhVUYÒ•$T7tÖš	Y’G±}\'\'1S†YÉ.z±?ÓRĞŒ<²”©S2©a8	iwR3Oê˜T½ÓN‘§¶m˜”÷mÑë•!™\"B±^a†ZIê¥ÊAAræ%k-Ö­+Zs>\\³âKĞ¢p^\rªW¸¬:Ò¹JëD©‹–µ\0 \\ËÄNÄŒÙÒµÍ\"hÿ\0ÄJƒ\0KŠ~+%Y‰‘î\"T¤Í’…Î–&¤¤%\n–¥ ¯(J¥Ë\\Âr\"Zs/3„¤&ZJ’•SŸ3Œn!r£oÆş°³Ÿ4àµMëVİS)yñY’°©JåâæJV|ç#11W——µr/–—zhôªÔ¯¢Ö7ÜB\n\nÕ–lå,ªZU5#ŒüâÄµ¬ ‰ÂX\ZbÄ¹igRP´]‡®ïu%\\~ŠŠóa—ŞNùıw_øş…œ_¹ùküìÅÌY8Ô¬(„¤AReIXBÕ,(öd åu€ î”ÏÓJû“vPéq‰Ÿ!eÍ˜”¤ÎQYÊ¥NüÂ•6rg!rÕ-ekYQiRÖB’‡X‹”švŒï¹òbñ_‡u)31µ®J~ÌJÌ¥çÉˆ@›,Ï–³DÉ’)o‰ê‹ĞŸ‡å#¹¸‰Ùä¬§óQ%r¥©%8TO¥Ìş™—„GR€2A™5yæ’•J1’­¡\Zkf/Ú/vX¥£\r-ûS2Q¤LêÖÆZpëd¬¬ IPJ²¥RÈJÒ¢À¤Ñ›èOu3B’¤âLÉ‰ÄJšDåÍ¤¥ÌRñ¼Ó’PR%¥yHK•59%Qà|R·³è®]SáN=ÑÇ‘Ó†Æ¢u2ûSüB|OáhÔ£ä„M ±êAY%\rIh	ğ<NæĞÿ\0Ó3·®qVG+\\\\€fQeÍœ›ßÿ\0´“\'ªUf+´›PSßoñ~‡Ô¯ÁŸ,—iòwHt·j–=G-Èßºr&!&b†k\n‡¥˜hO„_Ú‹#\'ÀùşÊaëÛcÌx@pµ¢äÑ§ôÌ­]…|&›óŒéSÚª7f=¬ëøÇÄ\05¸\0÷ùíHèÂvTÓGÑ^æ=¸–´u9V—#e‡©¯ê\Zğ®íËë1?½à³ëGR\\Í{½i~IH”æ¥&×ó½Df”#àµI˜>”ª–\0÷ÿ\0ˆàuêU£§Óµäæ^ıÇüÂÕÍ-ÿ\0ëIÄqÚ2tqù[òk“ù“æÓ-M ØZ·w°°°Ğ2ÕR.@\0£\ZI¶Ä^ü!ØÉ	˜IjVĞRû»QœC^€¹˜€,÷zÒ€1\'vĞq„_R=èDÅ\0–À£š—V¬/µj6† ÉéPJ@Ê¢jä‘@æ€>b)¨¤<]\nĞ*Ã½\\Ö¿M²oğÀTp‡(‰…Á!?¥<õÀÇÔzúhù·Y÷Î³Š–¤œÄèR\ZæÖ\0?!¨æµFG¢±Jbæ é™i 2– »ÜwÃKŠrd¥ÌZH$T¯|b–(³\\\'$gú+¦±aO\rpkfù5OxÔÍBÊP¢”å°õá›Tm Îmğ|}ï\nz“ˆRK¨“™Ë¾S^;Âdipk„[ä÷Dá–ì½ıke5_k6¾‹ö  †p­\0&9“ÇêhY,êşÃ{ÒÄ*t¹en“C˜¾úßøŒğÇµº4cÈî³Ò},è!ÉÁji¹¨q¯Ê‘Â_+´t{m:~#:8L—.Aœ‰×5˜©JT°f)\0\rÙI^e!!!UbDz.©—5gªÁ›ôo»)ªèìv\rğó„õb?, èË™]´¬« DÔ¬2Ğ,)3ö‡ú±ÓIrgFœU÷¯îªtÙxÊõ*™/¹\n_Z©]™²Ò–¼è*vJÀM3’§ö…J_êõ¡³twÛÏâk½/îÂná…¦RÒ0aŒüÜÙFad¿Ê—72RµKIÌœ¥eD\0V®‡OÖ,İÖİWÄÉ“¦xÒkoşû/îŸqú™ÈL™“±ælá‰J“ˆ\nGRœ2sdŸ\"xtÕe,”¤L[hßŞ«Cƒ½\'º/sÓ#ğŸ—ÃÊ8uÍ8²|……‰ÒÃ<¬?a!2{.EeÓµ\'4¶†Ç±Ğşë±rz\ZFáù¨›Š*—\'.TÙ\"tÉ¹fáæÍFQ0%aæ” ‚¶\n%I<lbûC]Ô©xuZ:péåğWËnß‘“½ÁÏÑ)(”¼^vkRV¡.\\™SÓ1e•”+!O\\P¹«(XŸ·ÅÎM}Ú™>Æû|êÏ ú0¥Çi$e’’íG|¹˜ü:…•\n(¤sWW“ĞŞºHQo!G)*PT 2®áŸ:’t}sÀgr§Y˜2uÑí$z^ÙZ6l?I„°¡\0€²» …T>U\\»k—Ï<nr´Ëš‹x~4©E ¤)Y¨m¹—¸5ò¬,qË»@sTQÒRÇX¼á)	X ©†b…ez†6#V5zŞö~I÷v³“ÖB5hZzEG\"hÎ —Y@r”1Ê”¨LeìRHÖ­)÷*,ÎÃ-ÙJ	\nš•vDÀ’rÌ¦b&ª#A[\\	ğ§{1>Ğb\n¦†,”g$öÆT¥”¦S:’C°l œ¡A‘pU9n€ÃHd•)9YIK’ùÂ‹‚ê\nøX“g†d»ªt^WE…œÈR‚ˆ¨¢’¯•Äö\0\\²Î]¼“á÷ıÓcöw¢U)Aê\n’ë{~\\jO7,Ú•¤u°ciSfS¢Z–Ô\\ŠSV‘©TX™xâìGóëh¢=L“íÉŞ4÷\\3bŞä·BSzx„šÒ”&­rÜÍ{Úk%HB—1a q¯ 5&3GäûQrGÅ¾ñıà«‰TÂK•#dŠéõWƒÂ‚LææÉÜôjŠÃ•Z¤Ø¢şYšQ7Y„¡˜‚.¿Ô5ê;n\0GAAVÌŸ£í™$¦„Ìéõâ|aÚ¥AYY†éYª\nÜ°şcÕ2ÈÉÈ³ÑxÃ,çÔojéÆ3­–öz3Ø_l²­3Qñ!@‘¯á\Zü£c¬°£%8³ëe½±—ˆFd*¿©&à÷·ŒyN§¦xÙÖÅ‘HÉÏK´r\'İ{7F™‰é\"Ä7é5ïõXâõÉ¤š7ôé;Lä¿ˆ,oüÎ\nH#B3•¸Óxæàê§GCáÖÏ•æâ®\0&£´Pş~£³z‚R·§ÂåØŠ~«\nı9Ej/ÙX;Ô–N`íûœZÌTó†°ŠI¢ÔÎ\0`Kªltzx43Z,4—v7 µ›NòÍ£<\'1+Å©A’2Ó);v¸>—0SHV	B6¦°¨ºô:Ïákÿ\0¯ÿ\0*¾I¦ô×Ø|ç«ÔÎÕ&FbÄòõXÒ¾§=®áò0Jfcz«O¥âªLŒ³94 8¥H¿w’–‹1/#NÃc¦ÙÖÀîmÇñÊ”Ùê!†-mÙ>^`¥+35æ„ÂÇ3½‰>5£¢t·°Ò&v”€¢ÁÜŸ¼nøšÑÏQíg%ö×İv	e•(vOÅC¹Â…9¸áH®ìÑñh¡‡÷w„	Ê‰mF|Ê\'IóĞÃw¶`G¹Ì\"V’»Õæ*Úï_(Ë™ü­¢B_:FÛìÿ\0º:&õˆÌ\n~µö]˜Qœ™û©nSÉ;Øö-%„¥ˆÎõs»6­N(­t’cı¥_Ş·²ò&(.xGW(BÔ†?X,æZîõÏMÒÊæuB“9,ÿ\0tciÅ,Kš™Àòº°œJ–¥€r2ÒLÆHQQ`Ùe?Qb¥Lç|gfC¢ıÕJ‘58ƒ4bXBJJP‘ñĞ	k	í©“Ûå.éueÉäq¢Üy\Z¶#£=ÎI•1æO\nh€#0•‰–	²µŸÍ© ¥Jê°ã(êÔWÊ}l“q„~ŸªşÇWìÑjäş¿¡¯Üpë&Ì’ˆ•ˆBIG>lâÄÌB„´„rÌµ-R»E1é1eî‚µ³ÏÎ=³eŒ¹ÉÉ2ú¼kurRÔ’J¦K•’’Tfåê“ù¼Ê”P²£)5J…9z…¹46(¹Ê‘èpØ‰hA8µ­rÒBT”™i;5]Xë§eIF!ì¦J~  „ùõí,s›¸sşzô’Œy28/ux¥J–Øœ†J@		rTÆtÅµ\"c©#&d„¥Gf\nV—\'2S”]X¹>é1=BğÒñ)•,Ï“:Y–Ü³$È)OÆA~¦ç*jÊ*68EË¸O$»l¯ìÏ»‘–e¥xå„¢dÅ¬.`(pÓÂ \\§6ZŠÊú±ˆ˜T;32æ„6ûoĞÓ‹¨i$Ù’ö‡İŞ\'óëÄÊÅ%cª(Nj\\¾ÊÎ\rK’™‰Qê1b¡:\\£1z¦;«•-xğå8vN×óşæ™·7q—ô)tÇ»v+0êš1XYÒ±â§§«3@`BR‘ŠD“‚AHRÃ5KXgÅnUæøçû¸K³¶Àé_u8õKÅƒ1VS<ËdÊf$!2CËRd@«ú§+) ‹Zz=.Lm)$szäûlŠö;¥2\0™ıZZ‚À pIÃå“%§&z;sœä!ÂLÅ¤…ªè÷Gn{m™ü³}$¬6iÙ¥b%°”©	J%­jœµÍÊ„©äJL¶RS7¬Ä%Hşœ‚Q¸ø,‹‘‰è¼/LO8TÕV1¦¬ªGY5@™4• &\\”Í|‰Ì¥¯0íKÌ”­m±;NË‰èVHQPš2P% Ê!I`\\æI¯h••Õ-+e™n†èI¨X[œ®JBJH`•\n€¤Óz¸±~|²[HÛÓáİ¶nX\\J•Zs­ô×8X9e^\rí(¤ìŞ­ï.=xä‘ªûEíÜ‰$‰‹@7\0šø5#\\0Ï:µZ‡,Ññ?ˆ™i$bâ½ÕùÇW³¦£ó˜ru	=ÓÛ¯Ä$É-; ‡ùàcd}ŸoÉš]LšÑÄzwÛÅÍP©³W1$$˜ÓöxÇa‘²‚V™×„fkÁl™²û?†N`UD¢¼ÍÀ3ÊÕ;»FÃéÑ‘E%ÊE>Ÿ[e³ğ‡ÄN6gPù¶j2ñÄĞ’À‚Æµü8Fg•šûœ™Ñª–`HndkßN{J:+bz-¾\'X¨\'3aèr„€”\0İÇÄ—¯„\"¢¨çÊVÍ¯	Ó“%²¥•%I¯eÁ;‡	Óq“’ÙdeÚtÿ\0fıû,¥=js\näå9w\"¡ø†4QìÕ-Á›#Õvòfæ{áÂ’”¤½¤Çá.6†<ßYìÌ¬êôı\\lÖ}üãÒ¬\n”¥J–ÊMk™‡7CV<±ä¦ì2÷ÆÏ™çL UÁ µÎ¦Œ AáHÜ×¨[¤“BÃ•Ê@ÔÖ¡ûâYáæ\\\\¥@44#Ä·qÛVQÕ’À‘1‚yÿ\0é§€kÃ÷l/ƒÓ°õ§dPR·9ŸKƒ¶Ñ[Û!¦ŠµI½É6ÌïÍà$C©`×3pÛ„-±hëß…yO„Vd¸ëU«&Ñôş›PGÎº´¥’ÎÕÕ—\0€l	sãÆ4ÙÎ+ÑèÜRˆ/HÌIÂ$$©ÅªöåÂ*›¤kÃ£BÃeëÎmPÜ#ÏÉìõğU¡{?Šª­ºÆÎ•.gôÁ%ƒUéŞúFèÉ´rrF™®ôFËZûIJˆärÙ‰âtåÚ)3\rÒ=35éfûîø=Å¢\r) „h÷úî¤Uw¢8WS	ÒII&™´ƒNdëJ4PãÂ3~J]3Ó¤úaşy›á¬“>tüKàgÏ“/+«W]5fyÈ”‘-²	ÌVs¨%„­]«XÙEg\rÄ{Šê0rñ8nºN4ªBU.`Ÿ$¡]RÒ•¨¦QZ’¼‹ Cbç*àÌıY_§=˜´`¦Œ˜02W‹+À¥biu$Í2óîBé‘™’@xªn¢Ò{õ;ÛZô*{cî»98.§\n™räaq™dbHÅ¢R–¡ÕJRÊõRê±(„Š„4aÇÔCÄ–Û[Z³£“²¨¸¯Ø¡íW°XÙøL\n^%áp“&“1I–ØÅfL±œüfI*R‹¢`\0Òš[†-·%·à¢]6I¤©ğ}9îû¥fLÁá§.Y—1R¥•KXRJ&II	,ùw¡f9×u*R”×©Ôé:^Ú“äèJég%)Kh¥àåv¡®‘ÁÅ#·–U1˜La–¡IRINe\0à€X‘§÷xbÔhñ¹\'s&gIÑ€\nsfÊAe¹\rÏ¾èèÎå°UŠªkp¤«â•$‚äT¦´\'€4 ìf<;-S”ÌÂ[Dª•H	³¦•˜)ò2›Ñw¢Á–´­Ë),r¯é­	.—Ì@”–e%.RWÓE½£dz™ú™\"ÅKí;‰‹ 8HQJˆ)Ìå•t¨€’V`ÂøÁCHªsrvÁ‘ÒÉL°d¨Ì‘ÿ\0ãø®¡şàk»Åëh©ÊÄtŒÌ 9ÊïÙ˜YËbIØvsb%Qgs\'\rŠ$¤¤•)$9\Z5XWVo\n+fS†ZÒ“Oõ²§t’ªæşâî	\'Z;Ë›#j‘»;Û6yX•SNWnVñc$e)ü¾NjË’¤(z›ÓAüü¡~\\{Lw’/TlşP±œäêL©p|}ø—ÇâÕ_Òœ#Óôp…£>ggéOii˜ùÇ[ã¿\'.q³[ÄtÊ¢Œ%÷pRÕr<csœ	p<(ÛåH ï¤`•Ù³”<b,AgSÆ¦°¶\"T\\N-D5òõêñ-—“Áƒ8ôÑ,scè>œHHA¡«7ÔĞüãV,«‚Œ‰òYÅVúÆ®vclÄKe’ÖÓõèAVg°ı:gH,+¡`Ê$ùİ\"1ÒzMŸ²X0cBIµrÙªÛm¡E-_i:}RÀ!4v\0ö†ôvfÑ¼ã6|J[,Ç*:Ÿ¶=.ftLº\0¢%µHvúZ±ázî“²RŸÔô}SİP8–{D°¤Ü%í]wñİ³½JÃ‹‡{¸44#üÌNÇÈl	3”áèjI,K7\rÓD%?´0¨«ÜşbÖ\Z=ÊìŒV*hrXTÕD&–á`i{<+T„»*2¨ü²½©]´‰\Z*NJöEÎŠûCZÎËøTìà‹\\ÍWÉ1ôœtùïTêGs—$¯»ÏÂ-³Ÿ-‡†*f‹ÕÁ§t\"+{QŒ)”R?Uø\rüE£/Rê\Z;Sš³ŸœBH«wŞ<ıÙêéQ¶t?·ÒÑ¯»?Œ+B¶©€÷\"l Ë€t€öĞóîq*ÑÂê>V.O´¨Fcš÷¶İÁ˜lo¸Ùš9(c}­@øJCøøëô„”\ZE«20x¿iê\07¹Øj~ŞŒR 4³/¿ş#–L¬ÎK×™¿‹ø\\, Ğ«,LhÇæf²¬5åê¢\nŠfìæ~õ=‘8‚2õHş”éJÌ‚¯õ²±$+â@AkÑ¬^ÁÌzkİN:`šØ´æTà¹=©­)9\'Kv9`™ˆQ@ì)H#°•¬÷/AmQÄû+N\ZT‘ˆi©˜¥-JœFd(,%=r@YŠ¶!æ	]ZU’+n-ğHÚ0İ-ìÔIš™S7¼R§TºŒ¼‰=¬ÙJY•K\0Q%€8§‰K\'t•Å*¯ëfØçì….nÅáº¥’•beåF\ZbTµ’&\\JšÆUf1“ÖfZ“I-“ş\'<ºlËçûkŸÇüãLz©=ÙyJé\\øf™$!*œ©ÀM*ì”)2¥è\\vV¥P¤º]œÌUÒáwqô ıªk‡²×Ft?Kv%ªy›)*S©å%j=^IësÊJŠ:ÄãYAeÉ¨`Q£K†/¹Gûÿ\02u3œZlÂ§Ù—!zÕÖ!hRÑ)BLÅ%3ğ†jS2LÄ§*¥£PI–¢‰²Ğ³-@ˆé.ÕÁÌI—ñıÓ\nFIEi\"V (ªdµ¨…WäÈ˜ ©Ÿ™”„—9kTä.«RÁHR‚í\\…ÂÌŸ²§¥L¼O\\•Ë’¯Ë¥\nQ˜ór:e­–L¾¤Í—ØO[ÖdXJ€”eÛªµÓ2úVJ\'®lå#\Z´I™ÎILÔMåõ ¤Í$ ¥”XJ„¶Q–šò[fo£}ãtY0Ræ#:ÀZT¤ Ì™,L(\"bÑ/«›Ög’JH=YP2’[‰[äÖ°ŞÖt¢eÏ=Aš¼6JÊ:¹™Š‰Bg,Î’¥KRŸ:¿+\'¡T´Â¡à™\Z3=ºÇ%i|<Î®aA–É+=¥HDáÙ$#òàªj„Â¤LRÁş’Œ?m-=ìŞ}Ó{ÅÅNÃÌ8Ôõ3H–R–P®T‰«Uª…Øu%NÌµj“J¼&§£¥f˜¥K¨ÌrÛ6[2²Ûj$»>P	lò’Cã‹“7¬\nH,\0pÒÍÂÇGÜ3ó^Fßj;Q‚Q²ÒğÆîÜ¡gÓÍüÉÓ,Y#ÃF ˆæhE9§ScT^Ò9¦,ø1–û…ïkÁñßâS+ókJ³fÊ+K5=4z†.0«³ÕIÚhá8ÎŠOé˜ãÖ‘×4ù9/+0+ìêÅ\\Î,x«i•<­½ŠÀé¸úEF˜=GGûR%nÎÀµ)ì.ø©i;£=—“2ÊQ:\Zğo¯†¦XĞÊvg?î ·e~#×Ê)xè×èÁã=€ƒğæúkåCñ±»’-ôW±ªë`€€ìA\0>ş1ãİ²fûº2];Ñ¥ ‘¦ŸÏÖ¾QÒ[G-ú3^Ÿ(íÏ€şí›Wó‹«F;	8 »¯v±àbÌ¬¾CeUô$?&¸¡î€¶RÙ€öĞ-Ã&›êıÚqƒ8¶„„ÑÖ:ri=(dÊ¿ï7cp›‘æ½«\ZÆÎ—³%yB€¥D„å³~«¨»Ø“½\Zæ<LÒ=¤Ya`QLììàÓ€­«ÄENLd)X‚•$ñT¨\nrjÕø5^P­²dË¡‹Ò—wa©<ÙõÑX.ª\\jı	¿8ˆ”_ûH4¿Âh@Õë[P÷8QRQ©SëC}u`ÑØ?Ò@Á jµT@Ék?Ú>•‡î#ç=Väv,?J©K_Zw\nm$sœ¨·ÿ\0Æ.\"0©˜?hæKVFQ7JSV¼&H©Ffã.ärÙ¾Ãb{D$hªŸO·8ã¾šVw¿hF(Îô\'°iIb”³±,šp_Õ¥ŠÜv_hJZZ6Ì>K|)q ©m4õå¥B)˜åšR[eŒ6?2dåsÇR4gkŞŒ\\P‘•½‡‰šªj†´án$˜ªJË-x…Ö¾½|öŠTk¦<J–%é¦ÈÓ	&¬\0õešÒî — ­Ä–\ráËpĞÏ%:9_â#¤L¹2\\ù‹TÆD¹š”…e=¼A®©íÚu0	SQà•–+8Ç¶˜iâVşg8ÊÂ°——%X©½gh¡HV`•)XR‚sBàù¢HØ=²ö¦jÕ%s§Î•ƒ™ŠÄuªB×$ÊL‰L©fd²…%ÄK›331J@í®ºL‰œ÷Úlú@JÂÌTù£¬$•H”¹j\\Ş¿+ªHAF-SPJT$‡u]òíÓ{7ßy>Ü¥U>f.|¹“q3¥a¤É\\¹9Ì”£ ¹«&L¬B&ÌT×Oú€vÂP!{T‰-#^é¯x8¹H*8ãÖIÀá JT¬lù“Šfª¨*3eA	ËBVÈ©‰Ûªò*µ³hÅ{ÎÄ’êåcJ²-ñuõ)’„g.	Ê&ÎÄ±Ì…¨ Ñ@|15ÛÀ{İ™oq^ô1S18tÍÅşdbğS1S¥0ËLà”„	A%2ÙEL*ªÓğÂÎHhÉÙô:úL!ş€ªA\\s§8ÉËÎ…bf9$\0ºÀg¨±àvâ\"	)l‰˜¢,æ eŸ²R	«•%Ù‚S³ÎEî­2ÆÚíÇOCBô.Ğ´YvlÌx(–%õk(Ie¨¥I‘ÚAH#R‚Ä9rÈºÑ¸ÄJX˜€¤œÀ‡, ÅëT—¹Zì*]6••í™‚r¥ü²ğŠÛ¡”“àÏ{?\Z¦ºÌÛ:BSC§|s²fQ–Î¶w2B\r\\Ş3Î&û–qq\"ÂÔõ4à!²ÇRz\nì|×Í¾ÑzÇ	«“ÉÇ„VÅ 8çgKİ©§îå~%ı™ÄLÆ­H‘5i)@Ì‰kZmû€\"ší›ÙıL%ÜÒ‰ƒ«ÆÛÒ8†7ØœP/ÔOÿ\0TÏı¶ßJÇn9ñóÜ¿4r^)zÓÑX†eKš9¡CÈãÅ½5ù¡^×i]±Rö«ˆ¹5We}½º,ÎÁ©,kJÀS@p³öKÚ…˜U¯Qş[¡åOd‚’;—±^Ô©oÔgÉ£f6Ş§şËZ‹±0¿QsÆØ=--(bªlÿ\0(1èiF‘£tö0\\ÜX^7ER9™-³]èÜ:JJò)ëBIÎ@gSÜ\r\Z\ZÓZ(s 0òS1ĞÖ$’ÌÔ ŠT–å+\'{0}%T“¢«îøŠ˜ŸtVUö£§•54ÕÃQƒëİX/!ZÇäìşÒÏ¢$Òé’O‘ ×‡‡hoÛÆëèuı—¬‡\\À.ï™C‘øiÄĞ¼x6ïg³\ngérEH@6ä6…|JÊA»–4\rjq£ÖƒÍ£±ŠålœÆŠ RµböÚ‡o¬X¡ ]±*™U«¸\ZîB]Ë=Å…/;bß%kCµYk¿\nì#ÑH5%Njjoá\rDÑÚ½&S€I¨í‘]@`ü$wÇÒpn	Ÿ<êµ#¤ã±\n™óa¯„\\ÎD¶b§ã4²ˆÿ\0¨[£Ø<aI`IÖ¦Ãùõh+êÚ2‹Ææ¢œUãEİŞÕôx-•MFÓäHò1%¡»og\nIb@kŸâ¿X\r&NÖD¼:[*¼¯İÇÆŒ)ÑbU ĞR—nÒ×¹Ô>@RÄ’1Ø¼i ê-ÀjO†”«oJyN‹8‰(åGw#Â·ùiw—R¢¾$öåGïÅŒmšW½6 ”™a¤NJ?«’Zq\n2ú•MbJ–^`èHQ!¢äÚ7Ú.“éB3\"^P™êOôÎy]Lğœİ r™½Q`Rºš–%ø&ÅöŸ\ZŒ4±.BU?2Â¥å²³),V” Ì=XZ‰Ê€TY,éM0§Z5î“—ŒL°¬ËLÅcg‰ÒòğÍ4JêÒŞÏf[”‚£œ’+ è¨•÷ƒˆ“ÖfÃ ÊAÃ\"LÅÊYÎg®Z&”ö³JÎT\0JJÊ²€©eN£®I``=£Å)bdÌ±ÕÊTáÖ$(£†Q—-YGõ&Ì:X* ¤J™BËL/jğÁÃ*ô‡´S–dOL„Ë“9I˜&~\\Ì˜”©ÉÈ*dRŒ.o‹*çÌ–€³ek‘šòFûÈ\\µ#*Lòœñ+ÈBJ¦ÌÃ#…²*–‰ê!o5)ÊOh¢b\0pOÈÕ›oD{áZğ‹ÅŒ9	DérB0¦i”“Ö/)2Ä“1±\0 ™J—81JA5ö%*+i²0~÷”àW>SœXFTË-Õç2e”çZ‚V¼óB’T„­Š”•ÎÔÛ¶Œ†ßş¡ER&\0™Óe,“-OÔ )s·T²•<²dÄÊfDp®ZLœ/¾ãÔ­i”¥‡AJŠ•ù™ò, ¨³,œËå/•İ\'*ö2·Iè¯‰÷øF!r—!@TKr©İŒ\n’;JBPTq©H9S—ãÒ–øi+oÁ±{/ï6F\"z„,•¡%\nZÕº¥&vWr ¡-@“•!™ÕT“K‹\'m»g[èÉyˆ\nL¬»%ªE¿HñÌc&IV™¿-›YZlòûÆ,Š2_)Ô‚k“İbû¼ıxF_‰–­\Za!òÖú÷æ±l$òòÊÚíà‰¸QÇÆ)ËÓB*ìhämÕ”i£yùG%Ë^„tRSåö‰‹%h2ìLÜ*vôŞpÎVÀhè™[èècÇ‰«½™¦åıÊèÄ[*HÛ(ûGB9eKƒ3Æ›°1>ÏÈ?”héC=ò˜%Ğ¢}ŠÂô%?ÿ\0hYe®üÂ¡ôEÎöC’é‘,Ä°“â¢Ìyåê#Æ¹òlXN…’Gúmİ\Z~1S*ôß°Øi‰íËJ†Äw}a^yÇi’¬×:[İô»Æ2Î‘§W‘y3äÇ\ZÑ‚G»,VÀŞ±^, {£±¢Tq\'I€¿tXt¡aGÿ\0¸¢6g$$î EßB¶ŠŠ÷1ƒAlª­ÚbØ¿2o§µL3ÊÙ?OéÏÃæ\rË…$¸˜$ğ»êyÅRÉ\"]ıçtre`Ó%$²†sû*3\Z9¥ªüc‹í&å‰ÿ\0C©ì·ş±Â%\'0©Ò‹Ô\rÀŸ#=Æ•ĞnZŸ‰Ùµ$Ñù†T©½‚šÅşÜmÄî5ï‰à…Y³5HV_Õ|µ~lxı‰ä)‰İÕAW\ZX°×¾Å.\níRBÌÏIjÔXƒ¦ğ•Lfì¦S²Iæ5ól«fSÜ··£;$â-1ºÆ©Hıévb4gĞuJ.§÷O-Öô¯$n<ŸFr@eÌLÙø&)~ÊÃœª¡g0GvI?š;G™jP—lrúa\n¨ıwÂğNëğ0Ìs®œşq[éØÖÂÅb]€SĞñûxÄ_)\ZF$½OñÊÃhv#E¼Ş+¢ÖÅÈ™LIH\rkŸãËW²-½–%	¨Qÿ\0˜ßŸL­ò]I	ê šúõüEmW¢Ì¾ˆK2–rìÏy¨\Z~ãR4†BÆNé¤†jPá°vâRË{’9/¿ü§K–„8™™•”L¹.ÍT°¤uŠı4Ô»Õ5yGOĞæÕ{52pÒÑ.|ÉËu`¨	³f	€Í\\ô9,èB~-jÌÈ(¾2ŠüH®ö_öÓ1K•ˆŸ.x‘6n1s¥ËëJ„ÄËLŒ!\"PÎ–Vd\0ÉÎ°YÔğ‘®~¦‹ÒıÒ	ü¥q\nÄ+\rƒIüÀê×ÖöÒB^TÂ¤×õÕ–z°‹.-ÑU>YµûÑÆ<”­_™3±™ÆL¤Ìš‰L²‰§M\\±™(Je¦|´$œê˜£œëJGÓÀY­ûMÓ¸” âfÌš™=œ\ZJ–™xÅLX•*Q9ff*RRÄ€k\r\Zôõ›?J{w6_I%8|LÉÉ?˜LÌ:”Ë\n‘-22 KÃË)B“4:æ)J”*B¡»Ìßáÿ\0Û)Ó12å«¼R\'trq€²“ÔbLÔ§ )\0 •¨Ñ˜~¢dÒJ×¨##é)KHÔ³8o¿ƒ>¶Œü–\'E\\\\æ % ’{;\rË—#‹j(a;Šäëƒ;¡e-iRå§¬–å¡,\nƒßá¡é¡u\'@Œ·L>‘öfLÄ”®Z•0 ¤JŠ±$‹‘P*ñ.\'¶ßa°ŠJÒd ™©É32i=—RGôåêÃ$²\0Ê–Jv]»LŸEû&ZdŒ´AHª{9„Š\'²*Á;Ü	6ğèßz#¡€Tµ=³(Ÿ«|ã›’[gWìàÊKÄå¥ùi£—áj¬ÜáŞ4bÉµ9ßÂ/Y¾&¨O‡ÚJä=Ï…?˜YtİÛnƒñh¯6”æc–âûnÍÚº.g1]-ÏMä<^¢¹\"aaç\'W=Ñ«¥XŞäŠ³6¸,‰6Hßşé¾`Ò…ió‡ìŸğ‹Ü—$c¦,$¶RZ‚ÕEÍ	\'êp¾÷ÃÒS1ğêÀÉë$JÎ®¯!j.YR¥!ŒÊšÊkZFÌ˜İ£2ËºIöoß®*hÄ¶Y°ËÖ>Z’WúÒ•„“-%Õ^1\\±F\r\\¹údr½~ŒüL\'¨DåÉ˜ƒ6a•)RÙyGiYÉJBApæ„ĞFµÓ[¤ÑWÆÕ´l+ïöD¹§,/4àé”À¬b\\†Øæ¨#[fø“ixåQVÌ×´¾ôeÈXDÄNÊ¬£¬J]²ÀH*#P€¢CáéûÓwÀ™2S£\"0¡5{U$—ä£ƒ[ç«·LçfÇNÊØ¹¨Qv[PS›¼2O}FÂ:†Šã¤ğ«p\'}õğˆ\'z+t±\n %“ÍÈç¯;‘ÄhÉÊıùaœ3\ZœàÒ ĞÕÇ“Q©Br=§¬6vı“\ZËıŸ9Š¨°±£lxúÛÇ9YìR\Z„CÖ\\ĞvšŞ´á	D¦%®ÂÏLÙi÷òğ¹µg}T­wÓÂ7ÀBN$fĞ;×E1»èE=ĞÅ=!u5-ømÄ\0­¿Àl	X¹x„\0:×¼á,}	’õ³pmxhºŸo.¬±ƒÅ)#°¢2ß)\"¤|™Ÿø‹Öy.*–K”\\•íF \ZNX±øô‹—W5äÍöL~ˆ»„öózïG­4gu“K}‹ğY>òqmY§½)wä¾6ˆºÜ€}/Aòıèb¢ÆÕHğ°®ğë®˜Ÿ³±zÿ\0{Ø ~$«š7sWÊíó*~Íƒ=ğâœve°©\\ìÕõòÚ\'ì¸z²Ò}ñO|ÅÉfHbÌÎMÉ®äÀû{û.>¥¿ûîœuI%¢ˆÑÈrş®ğŸnwÀ¯Ù©y/ß¤İe‡s@¦ÕIzëHÑöíp$}œıK²=ùŸˆÉ¨pù‡RoòóO¶ÇÊìçê\\—ïüÙhWûS‘˜s\0ü´‹WB.†~£¦{÷”C	sÖO—h}ŸXEÖE‘ô3õ,à½ñáXf—6º„¥D?5øè7¤ÕÃÁ#ĞËÈÄ{æÃ7o+ Qìıµóx1êaê$º,‰épşöğj Ö$:\r/µ­­!ŸQöÅûO@O¼|\ZiA‡ö-È6ı4A¬2êñùeo¡ËèXÄ{ƒwÎŒİÖE…r.Š73 Òu~A.\"\\Á{[JJ¥§1e(\')\'wÊ+Z_Îõ0şa~Ç‘ø/Ÿoğù˜Î–X9ƒ¦ºé¥a–X=¦ŠŸM–é¦YÜÈ$4étùÃG?F›°øõAû6KÚfNg´Xbõ¥“|Ù’®@wÖôH¸\"|HúúYz\r‘íLŸş¤²ÚæMu¨Íâ4¾±gÄ‹òVğIxc±>Ø\"ïC«§¸Ğø0ú´S\\XeèË8,~u¶fµ…ß¤S–t‹qbnFùƒé$ \0¥8S“½ğwc\ZT[GµtZO#±¤Rû…Îö’_îHâO‡‘’_;ùU©vêB´ˆÿ\0ê_â2äY ¹,Œ Ø¹~ÑË:±mŸTµc±ÊohÓñ#Éä{J‚	0ÓÄcÅ$øÍ\Z»+Ú¹t.jZ–ãµ Gã+qĞ¯¨…i™ù}*À§ttœã¨”E9;lÏú~Q†Sœ¶¢iQŠå‘Ö\"<m¨ø\"dêTÿ\0æ1gÄ•yµ\Zo³şÅKÃ«´bf™«RÈQÌR\0ì†H\0‚íZÆLıvFÒô/Ç‚Ê}îÀJÁ/	.j€˜\'<Õe3sNRŠ”á!9†fš\0(ZíY¤ÔµıAğ “‰S§ıĞ¦f!*	V/T¬©˜’ÈÈDÄ\n\n¹ªNj½ß~jeÄÛ’NÌóè¡%H³ÿ\0s`à“ƒë\rH½gX@HP`ô\0\Zq«Ş½£\'“¾¿¡LºT£ÛfOÚÿ\0v³q*JLôõ]’eºå­?ªZÂ‡Ä(A­l#GOÔ,vß%9qwU8T°\n\0TÜÒüÌT³µ+°¦¨Ãô¦İÉov.?Ìv0uÜœn§¦qÚ1ÉïE_óFÖ·Ò½>íhæ(?&9YZ—Üò,[ŸŒV¹´èã¾ú½­RäŠª³\0Ş,Iğîà{W>”ê}“…«›9\ZK¯UÛXòÊ[==6c9c@;<6î¿ø‹6Ø¢\'Ìíq,\r™:µ7ú>Ï\Z\rŒÆ€SŞÀ;pã«ÃDV!€Yk–†æº3°	Ó\ZIõp,Õg½áT2E%¤jKëx£½	Úb-ÅïÏhë3V†ÖÁ5Ğ?Ìü¯Ÿ„97Æ®íÂŞ¹ò‚ã¢²$—¦´¨õµ&†D®e	r€\0ç¾çS¤G U†f^–z=ŞŸ3~P­ĞÉ•[ä>œ8Á[%G×¼}Œ%Bæ­¶°sÀp(-€µ9½™®H{øùCK‘hk·6ä!Sc #•Ç¯¼¢Y\ZPìZ÷×¹µò„s°¨Ğ²€WÖ¦›SÖÜ\nah ›hïÈT\níNø[ØkD¤iBmûA:\rIÊ*8ò†Zd ¥Éf\rF©\'zîI 4¯8YMØTPIÃ8Œ\0ï#s«Åªä³Ã¦˜­šŠoK?ÄYë¿§¼ÃA&IvĞ\Z?	HÎ®âph­Í4\Zc\'a¨\0ÌÕÒº5M¹Vµ´,gZ€)÷ß[9ÑƒÚµ‡î v£Òd\0ÎÊpÌ(N`örô@a;îƒÛCgáİMúrèXááÉàË/ >\Z‡İş›‹?ˆ‰<’ğO†‹KBªI,´pH\0S]şñ_¨5è©«İUz¹£[[›qG[\nÆ½lÄü+]˜öKTÁÀp~P>%y\'Ã”3\rÓ3\\4éŒ]™j#á$=nâğë;K‘^¿µa:`rÄ…+õ¡z³^¤RÄEŸhmr‚ƒÑíÖ)\"¸‰‚…O˜–Ê{D“«[rÇH+<“äYtğò/ÛÌR³,Í6,õ$0 –\0;Îÿ\08gÕË‹(}=2½àâ€­6Õ5)½R{Ü^#êçZ`]=¸{8éi%3AÃ$½[û³–©–W-³Dp¨ğdğ¾ş±àW,³ÿ\0á¤í³_º4Gªqô*}2e©_ˆ<{±2‹öÈw®Š±şh“ê\\½™\"Ü¿Ä~-9^\\ƒ›t¬=ŸÔ¾ß+ÃcÎ«€KÔ#ø•Ä—L²İG¼éMâ¼¹#‘pHâq|†?sÁ‡–¢äÚ’·Êk°»Ò1G\ZîÙ¥¦Ñn_âŠeOåQ§ş#__„ÜÆ·(J–9yeü/â{S‡\'BzÀÁ‹\ZdÓÑ»\'lydxÛ†üV¦ŠÛ8~`·Ú%ÉK\\á&¶dGâ½\ZáÖÃ¤ù•èµäB<5ş)%\Zu3+¾_\"íé˜AnŞx;´Ìv+ñ%W—4™-CZæòşc£‹¯ì_1ÎËì÷/ºk};ï¬«³)*©ŒHpæÆâœ«Ìİ›ÚI¯‘áö];›9v7¤JÖT¢IU3jôyrçñ%r=8F¨ŠTİÆ•ï\"Æœüâ†—‚ô2´Pà×Sg7v«†h1ú\n„õAÔEËq°<€\0ëH°–$ã/\\ SG5û«á\nİœ8pTõ$(jSš€·­v‰²X¬Dì¥Ëş¡±$1xëiÙjÁeTàk–õ¹ÿ\0İ	Ø*cÜ}ˆáô´u$’1AØFIzĞ6‚M8Ó»å¨<ŒY>·sHnğ8’5áHINøD4K®í¯ ñ€J @¾¤Šÿ\0½<Gè2\\Ç½À¶n~ŒO\Z%ƒ‰¨©”ĞJPëx®ØÄ ÕY…µ~êzÙ¢Ëô\0éJ#¿MXp×l…\0N®Ä_@ÕWQÂCbÂíV¯Îğ«€½ù¦Îy„í¹üßQ‘,¥ĞÒÈCê­ÉØjhõùèg^WäÈ»spw©HjiÀw‰^G±ªEArÔ¥8’~äíM^¹½r\"Y$Üf,n=ÖúrŠã´6HÁªC£³·q#NúÄà`¤®¥Íè,ÓªĞ¤DÉ˜jÀ$\rÈ5vj9!¢•bæqlÚu	ğúÂI…ÏXdÖ„’66ç^ø)¶+T:Z8UÆgk\r@ÙË÷Šä›\na&i¹ *ÍV}{7ï‚Õ0œ¦ ©øu;V„ºceËí;—fm³~+î­È2¥‹*„²OÎÃ]OW&D†bIsJZQ`<++dk@„0,ÁEÀjÚ€¾Pçêğò #Òå3QÙÛK³âAcFx1t!ÂÅîNí”€î\r`9ocUëÁ­]\Z©½xÅkæ`ªtŸ2Á¯@àq¬04©a@§z÷¡ïˆ™ÌE/RE)_+‰aI/ÙNµ}K»õå´:jŠÚ\"b{ –g;Ñìú¸æa,•båK~ ¨\Z¾õ¨hx±¨\\É§(jkŞqnİÚ+kcÊ-avßt¾ÉúÅhz$bá™˜ş«“½G—xì­ °é¯Ú6\0Ş…L;d[e†ØR÷%ˆ\0Ö¯¶ÑC»²ÄŠÒe1M¶CËPE=4<è°œIÕ­Zƒ@ÿ\0_Nò¢UŠ—ğ–\Z½h‡õX\rŠ78n €Tµ	®Ú0­\rbŠ^€¹:±ğb(D(lŒC±)ì„ä]Å\rözğ<á–…‘VN,\ZŠ‚Z¾ƒfo.1;…:fdnY˜k¸İ„:¦Â6»X¸kWÂ\Zõ¤f ÿ\0j\\à>.×†îu@£ßö’Å\0K\n_j@¸ÃÊ[İÚ·¥µ5°#XÀ³ßB~Ãé\"lğ™«òõxš.—b[ç°¿ßÂ*–¸\n\r.¯Ş´níbËOd¢èÚ¹nbïÂÓ Q1‹’À·sšw?Äí•&µ>zø4 h K\rèäğ“ğäj\n ;\"i÷ˆ*Cå\\Ÿ¥ü‡#Xú{É~6õÆ€‰7­VrüIğÚİÑZa¢Äé—g\'zvto©ˆåaD¥uèIv·d1;šù4<^…iXì9²|Í÷!¨< Kc+g¹fä}<V¢‡%2ïÁƒìjíÜõÛœ,•° ” š<ƒ’¦è5ä†,ì^¹˜[‡ó‚#É[˜\Z½ê\rµœŸæ,tÑ<ØÓTÜ3†?´÷ğã‹9=‡—z@ìâæäB½X´ZÅªÅÍ=?Qà8È˜	ŠÊbkJ½Qb\'mC0¤93‰/fr‘Ï³Û»µñ0Ê˜I™3*€¡·fš\Z—ß†Ôá´™,p¨$ö†È4òîã	àk#×ö‹\ZkpmuµâXLñv¹N·5f®»o7t±Æ…ŸK€£S´3ŞÀÃ=ŠK	£3Ğšëz¿U¦C–›iúP7(fÅ£ËXH\'F.ÍR5€¹=‡±Ü’NÎjG›ó‚ôÆ@ÎY ºªškëé€^W¥ìlÜ›m„ÃA\"H$Ä@ê9Û—o~Jø´¤39Ã–¶æÆ\"$ËÊ‘ÈĞên]¶´JVF‰\nqÙ$–l—·poån¼ÕŒ—6ÄÃë«ğ0­*lıªÙtÜkÏX¬\"ÒoµÁó<‰¿„è`qK\nfvkkn>»å\nØùjï[6şU<É[;(=ªšÚ®<v‰¶3’ÏÄ’ÀYÃ«±¯•bÁÊš6b\\‘z‘¸pô…š~Ÿ$N]	®VÍ·¯(1²IQ^|Ú‚kÚ²nÍÄŠ1l9O@áÅÆáTÑÜ³ÀdDµ†€x±³pÒØYJnMj_O¼YEe$/ëá½oç¤jä bPG–¾¿ˆ‹gV©¿†ĞkdbÚº°¯»mkÅoan‹m4pYß~t¬M»AÍ^¢»÷Ã(.€˜EwĞRífú}àEBók¸¿×Ævzb˜qo(Lb–¹ ;zåÉé\"ş\0÷úx—²‰d±&»n~°Á©Ë¸¶–­ş\\nL%Ç\0OcÅÿ\0À~\Z\"ä	JåNy\0ä‘(°1i±sµó&¸z!x;5?¹êR?HÛ‰\ZB¦…¡“ˆ^d9ÙÚ•«wÅe¾ËÄi­,(ÔaZja\Zİ‘0Šèû›rÇæúÀW{\r…5À«Ø=´&µş\"ÆLı p#’I¿|+H6ÈAV‡áæä‹>§_W:$…\0ôsÚaSÚ«šù}¡\ZlnáO?Óµê¢ši§(dV­\Zàƒ1Ì^µşaá‹ÅKD’çsZq\Zí5[\na¡A‹Ô’2ƒÂµ»W‡)“ÈÌÁLMˆnÜk¯œéŒÀ“03Ö¡\"ƒvïòñh@L MĞ•…UÌÔSğÎ“Ñ,)\0(ñ©ó¹<â¶Ó{2fÏb)vjvo¦‡xœğeÛƒ&ï˜ØÕ­\n@ê¸ŞÌõñv{ÁvÆG±+lšİ€ïõ¤-z€#>­úF¶pÀ×—Ê!,ò[15$åÑ«Rü¶‚· =\'µÀ,üµâ-è‚¤ÎìÁ´«Ôsf…|		£\0X[KíëhhÊÀÂ ¸6»ŠÅ•ä[*Ò” Té¡o/´\n‘2úµYè/éÑ¢1À–Quhı¼‰úAŠÑS{3(úfó;Òì 8¿†î9Ùü!¢ZÄ=Os·ñX—êFUÃ!€w$_´ìk°·\r7 *@HœM\Z™ˆNG“¸çÕ \'lÏëOú[¸Ú¿c\nA_št¤»v™ÎÃ}íH4ÉŸ5Ák¹Ux‘kDÚ4ù@5‡†¶VbºÛÔgˆçéã|Q–Ç!E&çøıä)ömï©=Ñ-ù Õp¨òò $ó„ò	~K¶×çhD™M)ãÇÕ`Ê¼¢#¯$‘£ßrF»rÚ$=	v=×#ä\"J—CŠÉ5ƒP—qR‚Ä%aÃÍ^¶nëÁv\"A\"[’ö\05O­`Ö‡C%Ì.IûXÓCå\níÀ—1­RÆ€\\µAwçæ²Xc(æÏZ1õö]š<¥³¾ä\ZÂ%Ã– ^„X9ñ¶­hF‚‡È[Ö×¸®ŸGôbÈ×‘[%k\0jJ”@agäŞ=Ñ]4*‰}ÀHÛGî©…KdlqÏG%Ãï}´<)¼I½è‘ZçÇ´nN€m\n¶>‚Bè.Å.t¹»ÂoÉ(°™®ĞŠúÕŸ»Âú1f`c»fàà1bõ¿n`Ê&f<ŞÏÎ–BR†\'´N­F\0\r³æ-rÖ…¢q:lÂåÜWäÑ_$jƒ“cZK¹\0»6ßÌG “+Aw\'c`ç‘zxBù²Ë\'†ÍrC‹PûZ\'jËfa¦…Å›ô™\Zm„ª,¥›VÕşQË2ÈvÕÒXèïV·„\'mİƒ-lA£T\0^‰«ğ©f€¶öFzX¶m]ştåëHní… %Ëíµ	¡¹ úÃµ`&J›1UêkBÄ°0„ú‡&}ÉvU[m½} -’¸ìİ‚¡«(šu~[C5`C1u·yĞ7¯­`vÚt¹´MH:“©Å4ot¢„Õæ/f¹qôòx6+ˆ³Š.\0jÖÈ}„8,ôå¾ô6í%Øü‡­Pl5ËI\0³¤éZówÖ\nÒE+W­Kéò0õaA&s1rûš?ğ;VÁÚ\n‘\"uAà8¿£À— ,Ì,t{‘p£·ÇxŠãÉ4Ä‚C—7MËò½ÌhğT2Hcÿ\0-©W$}^ŒVÅL«mP4SÑ¶ô!’Ñ,™Ë§˜ùkÅí\r+àLœ@ 6\ZˆÕÚŒİò1à¸—«üR´ÜFˆù,•XØ\0ÖÔ½Ç–±J,CPïsS_´0l„Lµ³PXé~T„Ùé3mBïVÕß0‹”C6§Ç¿ëóa½\rœ£+SÃùw§„2…«\"–è#9ôn&Íjk»EošJ&“wÈ ¤WÊ\Z¨–\Z§6´%Àî?V=ğ\Z´^€–`-¹Ù¼„ª!ésÅûÕ¾VûÂ¾FL…Í«hLíà! $–Ã”-±4&ãJAaD™µ‘\'Ì»E40ÅLpÀ-ı·t$Ö‘êĞô\ZÍ`4·ÏÕ  =	‘1ÚìKƒ­¼œ¸ O’&:s3®V°ç«T1eS(ikÿ\0wáçXNBDÓzkâ‡•A±È™EZÄqP¥—¬GÀdS0Ù¨Õ&õ\'åÅÚ%9êCvIWÜw\ZÀa×•1ªF‚îiNø–%¬U€½µ 	®ıÑ 3¶Ù€\0XÜó}8D‹\\¡+]·ê&¯İA/B$XÄµç§Ö\nÒH,T„kFw\Z2M?˜vŠÓµğçş`.xvÅuLovÀ9ñ\'€Å‰äåÒ ÷5¼À¦i[r;“óZ\"4\njCTîÛr¤ÛCX¹i|Êv`Y²ğôıÑ\"+©‰,…œ“bA:mÂ „ÅK‹šîM;šƒg¦b`õé°Ğˆ-Y,™£I\rÎÄíQTFìH\'Îµ³š«»åİÛb[&\\ßfÓg<ÄĞÚ¥ƒ© ı¸ëĞœ’·À\n1§İ¢¶¬n	Ã¡Ô\Z\ZP·´[D¢kÔˆ_õ\rÛpo­Nğjg–·[ÕWo\nœ[³ü.;;èÇ…(\rŠA\\“\\ÀY·©Sæñ*ù\rĞœF#µFnÑ\'Wp;¶1rv…lDù€œ·}Çy\ræ9ÀqÙåO£¾ú9úXÃ%@l£%]¡F;C\\÷éUäx%fµ­a»AEt-Îô¿£}µ0îÊãT=3ÉÑ«O§ø…e%\\ljlà\rø˜‘HDúÄ:÷7«E¨	‹J!,ã¸ëÆQÕy,Ì“”ŠG,u6Š|4zd·$“§óö<bèÉ­ƒ+/°î¥(	Sa@¤v5®–­\ZÎrğF¬r–ÎHµ<xz4€\nØ\\A!Èîµ-^ˆX±²Gï¥X$ÑáZ\ZÏ$‚×w:pj÷[ÆÑ(L9;W3»ğÊX®*í±Ù(ò·#ê\Z	2i™É6} vßsì±¡£W^ù4+äK_}t©!ƒV›ïb¡’&‘q¡.t#Sµéİ	Z.[8ÌmMÅ~±CTÆ4ÿ\0w\"ç‹Ö\r˜E+v\r¹-^W<â¶È†\0¡Õ€ff·­\\DV;ú		,C†;ìOhïˆø\"#0­\"”\rQOİW~whß “ ³€á´ò$_ŒX´%–0ó*	mt:Óé4X¶,v«_ÅûªıÑ-pLÀT2òà\0?v‰ ¦Å±	wQcJP\Z¿ˆ‹Õ•Õ0:âîvšÕm|½V\0lbÖë˜ÔíK!’²X´Î$ÚÎü˜Wéé UÉLÃŞÆ»7Õ¾Œt4Ï!ÀÑ€æÖ}ëÄÚ¶)Í^ÄÜEßƒ@ĞÈK;ƒ@i¥~–îã­ÂÄ,«q¸{\0[k›ÀŒAİbÖ‚8,‘WóùE•ºtL‰¤³Té`/náããèDÏ,æ?3û¸p•A<™”¯\035«±×h)6.z™¬KP0ãZvğˆÓYäb7viÉhj—Wp.7Ùü~°S#*ÈÆ8z|®XùÁi‰g”¶$½I5Ôğù@I€\\²Éà½k§ùm\Z¬€¨µ¬7\'˜Ş÷€Ñ,T©Áİ÷znta¢ÎI4b@æ.#×”\\,®\'å¯\Z›8\0ıbVÄeL<âà¨e¸ç·Ò,Ò%dâ\rei‰aåJï¼^è¡p8I4×ãs´2™Á÷ı&æûD…’‰U»6ÜõáZDa=-G5q7k×»çÇ‰ìx	j¾gò×¹í\"4 i½Iòîÿ\00ht©9EIµ9jG«Â½„$Î.úWa[»_‡ø€•x©¬äš“Ìz¬O¨$š\r©Á»ëX~6Éc°éfÕµ>[˜h„ÔİµîãÄ‡Ä¢%Š\0ú?N£äæˆ†H&º]…ÍÈ¿ƒpŠ§+Ò\núÎ\r/gáè¿>ø­w*„S’)£°¶Ü¸ÁoB Âªá\ZŞšóî¶5ŸQRY™@R‚¯Ä›sx‰ĞHRË]©óş4d[€897&Ã—Œ†×Öœ|ƒ8=<a%…#µ˜r–ÕÛ}ëé ğ@0òT½]ô4§•øîĞ\ZñN—ÜÖõê—À9=\"})Ê¼\rşĞB6~#‹`/KÜê`_‚Y\rTMõ\'ND#Ç[@V€‹UAÏæ-­ŞÉ˜¢	×^M¾„’rĞ¡8\\\rnF×/äÚD`YèÁ¨Æç7“B6Æ8öœpÍ í=GÚ\rè”9j¸?ªÚßÀ¼¯6ì)Ú<M’|¯©ÔUƒÔq`ä«ÛnÉdËÄ³hÚ\0òáKĞ‰¯$%#ëæşPW\0uzlÀXkßN4ûR\n•‹èş”1b\Z]\0¶jø¯¡\Z²&zrœ_PIšĞlQ•ÂÀ‚ÅLXñØÄÙÔâ½şÀ1nøJ\nP­~ £–¬<@BbÏRÔz3°ó¯ù‡M P¼½‘½KëzW»Ê½!Rñ Ú5lÜ;Â%ê*ku`3p×Õ¡Ò\0™˜€ükm¼6vJqxÑ÷:êQ\"˜.eZŒ—­÷zxq†îX¯Î\Z½ßAF‹c!l¦©_Ü¿/´[kĞÏLöa \ZÖfs¹Â¤èdYTÖw.ä0ššWÎ\0£S:­`\ZÛƒO\ríç,n•4vnäq$[E2´ö[\n¡˜ˆW~U¸ùB·à”&ªa£éºoU‡‚ÑHA °­v}\roÆ‚‚œ·¨©vá¨-Êğ—êM)œØÚÕ`{À‘Ö]ÀîÜ<¢-ŠÂ[=X1,Ô¦µáG0Ô@Ãji÷¥¡DÈ\Z5MøhŸ®!±¹\nu¨4¹áB;®Ğ·aªf0{ÓÅéM‹ë³ÂÅ¤ÂĞŒg&å…©BÜøÅ­úÚXËUR€n5\'b¶½Lnî7òm5…–ô\"e\\—p nûÿ\0ˆJ\rRt!Ãoããå€X#Ãµşàöé•†ÂZÜ4\rBÌç—+eŒ4æ©5«Ô†îa\nù3ÓÀ‘jÓ^îp.İ@‰Åm©ÈëõˆĞPr’lx×‰v~nPm£ÉÌãB7}ù<VôÈ•’’Ã@>dVıïÂ‘¬aš5%Í+ú…ğÚ\Z<•12ÖrMz¸¨ú|âK‘¼	½?Syk(Å¬Ô€,Âƒ\0¿ù[øÀl\"ÔKì\rgµáÊØOGFå¿2!š\ZÆ&ºŠ–$Òÿ\0|¼«<Ø\'¸Ò¤êÀ¸„ÈÂ;Ú¦Àµ‡p‡KD@õšèHÒ¶·+\r=.+útØ¼0ÈòK=«~@iX´%k¢NŒYÏ¢ [š©o-ø´½V^-ŠCÜŠmï¡0\"¯’©ÔH¶·ân}}Õªà\0ÎÅq,AHÒÛz­¡Òd3À0`+»ık‘_p´ÌÀ«ÿ\0~pîvzbŞû»wTDä	™‰Êú—¯6£DíèDõ‚jY†šSNø±:¦´,­¼ÍøRºSº¤VN)œ•i(‚öVR‰®kñ‡í\ZÌˆ˜v£UË·ßåÖ…î\'»ß™ÕÁ-]\0aO:Ã\0„J°\rª^¢¼.v€£²^‹H7¨Ó5\râ¹+\Z,‹å® Ú´ú0„í¥c&Øe@’çK·=8˜vÈ5Wu7s­mM÷ãèT;¯jš\0*>ƒø©Šš±¸Ø‘`K@\råÏ”±^¶xÍ5}-Zñ}@²I$lÜÆ¼7İá˜S­G$[`<­!Ù2‹¦ú9g¾¯Î‚Kt‹\"«ce*û.“MÉõHUƒg§,vCÕ™Ÿš½o‚Â¢Æ„s\"ŞŒ#UÀËdu‰»¹Ú£è÷…Ù\Z¹ÎÎYèKjÜ	òhNÉb’ÁÜ¶ÇäÃhd€9\nñ\0Ş¾œÀä	Â¬õ\0š\\ƒ¬5vøJËÎÉ\'m5¨aöË?Øy,€îš*rİ¢Á;Ò¢¬‹qÿ\00R\"dÍ[æêñ©ˆ3tÉûw÷Q¾Ğ´Â\nì¶€>Ö.ßŒ*çaA*ÍæışzÁ»Qš×«‹E‘+bÔKìPj@bş@àgXÄµØe Öpÿ\0n#­‚‰š	 `¾åÇÒ{ &OÑîÎÁÜ›>Ûp¥ ö‚ÃBéÆœ9W½àÓ]Îf‚KŞÕó\"Fk€u\"º|Á’Ù¥Kr¿QãFfØŞÒZr\'µ‡›k·Ş\'€–HvcähN ¿qh	’@­ZïjŸçüBòÃD	äoñ¹†¡¬	Êã\0[_”:Z+d*p ×Fwñó´Ğ&vš®m³d-ƒ!D¸×…ü­Ò­\']n|ì<¼ A2]ŠŸ0fgıM«Ğ[çÚ/â]…´mOøõ¬\Zòás”Şu<µâ[çm‘±!NS^Gnb†++§×µjM´áüÅ7°¦‘V|ëÕüš°ÑV$¨«>mö¥GB4ER)zgİåüCĞ½ÌÌ¦i¿&µü}Z3Ê‹R½)½,Iñ<ÿ\0ÌUT3<¾H{’{ÔØ¶Ğä)È&¥ø0\0ë[ıâ‡Èô;TK“Ù\r`aõÛÄ÷V‰À¹j`\0zé_MÆ‘“¡·.®mmßí¯#¯R&\Z’ìÌÃ‰òs¤N8Øfs±ñsÆ¶×HT½dÏ5¸a{›Ş»˜t…‘8tÙÏ=÷«xˆIıŠ6u@¥	İâšîĞ‰×#‹3Ø€»»‹\nóƒÈ.´=z\n=¸>äùBÅ3ÌŠò)npÔÚ´@.sü›F/âiX$õ€ñ/¦¬j\ZÂ †Õ`å§û¯àô€Õ)5õ¥™ùùDJv2lß@ÜùR4VD*r@;³ïZ9¯ø†îµLU\Z/‰Œ+©`7aAÊ•…€À¢p;Ö¥Ü÷h=F•…p-`¿*‚w,Ö¶¹•%·!èì¸_˜‡Z±²æ[p£ó¿!aÑ,9³\\3Û/}~Õˆ‚JëREÈŞƒ4;KîÅ!IÚBökyÒPgâÀG~ó©HŞ–½õÕ¯”+[%™ºWø¡?x-x\0vØ›ÿ\0¸[ÇÊFk.9u\rd—Ü\nDnĞ-ZÔ=­Æ\"ÀÀPùÓıÄ|·‰¶/ˆ&£GÜÜ ­he˜nÌnsoëüÂ •/ÀhÚƒ¯ø†rTô`ÚòØğÚ-Œ%J=§,û3WQÄ4X%‡ˆ˜ã%µaO™†;#eu)İöøxÑ¾^0é+È\n}NÏ·ó¤%l„®`ÿ\0UúÁj‚%+g5`õ±§Ş´+BÂïbn~•‚Ä6m	­èÎŞMôˆ¾ ¡‰®àê|€úZ\Z1 ¶„&m/¶¾}ö‹ûJŠógĞ\rÅÛÏŸ8~Ğ&\"zöïåëÕá’\'’’çq£ÛÖ±on„b0l|ˆ~Ñ;‘³¢fPæºî{´oâ9ÏlÓ˜§b,,NÔ:ï†ÅĞjó\nk•D2˜®’t3]¿Š÷E”Ë¥$ÑW\n–Vk>æå‹^QcV´%ŒIMƒUùSWòçh^t1:Ô*r¤$•‘:\'†¢Ï¶üÌJ;	E†w~>¹À 4-İ´ËrßHvÄ£ß&~.õ~æô R¢ÂÊf±áÇq@yE-ˆ­éPÚÔùúÑ|Q\ZØjPf°Õ‹8ş>ĞÊ4K$bƒğ£8¡`¸6ğl ş«;z¦ÂÍßğ$‚Ò®v¦Üü ª\"…›«İÏ!ô€ı±8Œ[†ünÈÁb¡êKw15«»×Ğ‰ØöL•’ÑÇƒ\ZRdi\rEH:Ö¡ŸƒhbAÓ#Z	…œë0©‚êìK¡x¬[³Y´?òóaQHYÇ\rMhYÀÛHNÖF…›¹\Z4@¤@ê[ˆåê—É\0\\ÒŞUñ~bƒº%XS$¬Û25±[%xŠ56]ašk‚&ù¤T­[@Îş4ğ…My±SVHÏ.×\r]‚Ï&s\0À3½N°ä1U\Zù0ÜıŠäaiSår\\v~?O6\Z<¬Xw£]÷kò¬Dü1ZØ©Š,H‹\0ÜMÛ×œF€öJå†¿\"+Z[Â˜RD&ccKPêN¯$B´ÅĞÕï~½<X”AĞ—ô·–‘\\‰3—¿!FÕx±4AH–Ô£uáƒ‹òÊÍj·•`¿‘2f·}Ï‡t:B÷1*]Hõk\ZyA’¼ÉµjT;ğC¥ Hƒ‰\Z1şm˜,¯×=ÚÍËÖºÅ´#‘Vzş–;}Œ]\n\Zgãfå\r[-L¢¹íæ=q‹JÛ*­M­‹ÅôVÙ\\ã ö€ŞE|ïK_»øBFë=!#-E­«½·ÿ\0h7ºD’1N\0Hkë¦ığR§°•ş’lõ\'AÀShŒ(±…ÅÊC3ŸÃÃ„\"ˆhdÀÍRî?Ç¯¬+Ù(5K±4Ö¥Ë½\nB!Å…—³–[?tÀPS’S ?+=›Õ S\\…‚g‚•EymSä!ä¬K\Z‘{ùSˆÕÉ´PXˆ­hãÏO”?j»¡÷{0o80VNÃõWJ3inÿ\0”O £7÷5E¶k×ü@í\r†£]ëËKxÅlqkX `ú}ÎÂ\"BØi$Š÷øı„DÃBjY›è|	h®MØëDâ™· ‚+R}bDZÙäÌ©`Õ¹á÷ÚhÍÑ2€àK-Çäğ)‘13§“¡`ï·sqˆ£AdÈ[*‰¨;êŞ5<âÚÑJØä¨w3‡«ÕêyŠr„m–¤ˆJŸÆ¯À¼GÙŞ¨T“ÊU´s§8ÖãMÍáRn$‡»XR£ñÍ!S§mGrK=<`GêF2lÖğÛzzÿ\00½¿1•ş•>VsHrf@ÆİÕ¡Š\\XÖ(=u©mñovH™cbÖÔ°ÓçE=‹nÉ—6ŒÂY¿OÜ“X>C`I˜ô©)­Ÿ…›hj%‡Õìì<ş°_¡ÈÃÌröwq`æıĞ(T%4/r3w\0‡[<&ù5õ-qòƒ$š\"Â•REØro½ß…!RĞVzÃ½Í»E¸Ö„“6uÚ¡ËŸ õò†qØS+ÌXpgØj<)F…lb\r¥|¯Ëé·bØ„ÎÕ‹îlÖ¦Ï¨Ú‰V%¸[¸<\Z¡nÊÓ¦ıV-\\IS¡SqUónwõ¼Y 2”Ü]8ˆµDFÊs&úßŒZ‘[*NÄğ‹c¨XT?i]u6¿Gõ¤p³­TG\\O•÷à6ÕaÒIÛ›|$åwpû¿ª@”¬	PrVáôµ¼ü¡GA™¯«ğ|õÚ\0Ö6r›SÚm\Zì4ÕÉ½\"\nDÅ;¾œôÜÀHae[°`{‰ùß„2[%…2x®»ö<!{wdîL6äÏKİ¹xÀ¡XòiÂŒyS¿„UW¢Õ V²tßgĞxwShn4+vÇ¥fÜ«¹z·<!8,B¦NgjØ¿Õ ş$ä£JŞ\0ÖÚ¾übrO#ó›Ôµ¶o8£Xfh<™©WÍ¢E‰ Ñ‰*¥Zœ,j\nÅrÓ¤LÙ¶G¯&qö‰ŞØÜU0’@Ø×¼0¾‘k‚ä[\Zf\\ó`IÜ…J˜®ØRÕµØU¨Ü>ğ­ïeÑà$ÉÛ™¿•a[dŠ\0Ğ\Z8ñ¾gÕLşvKiÁ´L#CLÆş.âıÛÀ%‰²ıì6f«Ã* Xş¾õ-·\09Bv§²XåÔZåÏ}tÀËdæ¸ÔĞ·\rbD¹„\riŞíbyÃR@âg[˜5n.ÃÎ\Z1Ğ®®ÉëH¯¦?Ç8\\…°eN«1v£|¡¥\nÙã0Örú°4npTtK‚Õñùõx”K!3ôÿ\0o¤\Z¡lR”ÌäTëÏå¯Ş\nWÁ¢S2‡‹ÿ\0\0yÁ`±jŸJP®šiˆ¤&m`[ÄV Ş\0^*‚úynøe–Ê*]H³:‰7s ‹R¤+vyE©Ï•oŞği°¦%f¬KrÛŒ7h­‘ÖÓ•­ßå´.tÀ9kÂ,Š¢¹H¦¼C\Z½4\\£ejTW›8òùzÛ¾F´ïeY³õŞ,Q+r)Î(•wì¯6|X¢IKE%b8EÉœ¶HT\nèİ35…¹¨ş»£…lìJE|4ÑF¨óş~M`‹-(½=_X©/#\nî‡zxyÄ¢Y(SWmë„B2iµ›‹‘«wŠ@ òg\ZÖµñ®Ğ‚ZÅltñú}¼äÕè*ÙíÊ#\"ØÄ—§/·ó	ÀüŒI«JxÂÚÅMan\rsSßèEiYJÕZe%Ç/óv·Œ[ÛBwl™wgvqŞ5æalO):ŸÀÿ\0&zÉ–ºİéãük¤+ä(9J©ùµ€¥<Ú\0bv¥Æ£‡^*# §ŠscO\ZjI…Š$˜©åÈŞµ}.¯´=‹°U7ƒ8ÖìjG•bsÀÌviã¯ƒú¤W8ù$²Ô?È\\óğ‚•`gjÛ¾ï@ü?ˆàÊ™A£±®àÖ\r0Äæ=ÔÔŠÔ÷Â¶ÔygAg5Ùê~B\"¨ò]‰-ö°<èğÍ$0E`3ò¯Ìs…¡P´Í«Š|©·o$\rƒ‰]@ÌÜ›}h`…‡/£ŠS(P ç¯wàW@	¯F6©¾ÿ\0(z‘a\'jjnöa¯Êg¦LwŸ-Ş”ô`!EJšÕa_³S»ÎØÂ¿1kÿ\07İãX=¶\"g•6ÀÓ•Xš¹†ª˜\nœÁ¸·\nZ°]›µõå\r@bDÍ^—aà½¼âÊ¢X©Ø­ûÈûı`¨•É‰3Î­¯=¹Á©z•æÌÜóßv†Q 91P*ha”Dï1õ@r+LÅP‹hôh±EU\\ï_O´YEv\"|ÿ\0¬:‰%\"±ÅCöÙR‘ZtıDY•Éˆ\\Ø²…îµC¤$¹ÖCĞÇRÅÏ¡zßÎŸ-ãÍEÛ=©ÂÏ$ÒÁ&ÔÑƒsúEóH©Y’•1›@ÕïÓĞŠ\Z,<@sJ–;‡ˆÃÀrññ!Ÿ­á(.hsBæíkî_hœŒJÖv¦µ­G¯84OYj-RˆˆfáµÜÛmøDt* ĞÀùiê­£ÒÁ\"‡gá¯\'ş`4C3i{\\ØPüô+ĞŒXQÁÉ4âì+£jBvù‘~%ÍÃh©–-×¾Ùtïq^Aª_QÙä%ˆ/©`×Ê#V´7%(ÜÙ€nóW§®p•¢ÆJç—ñäÚ$.Ë(Qoˆ\ZñÔO”OÀP€zÓø~zò†j‹5oâãz–w0‘C=ƒ+Îå›oæ#[+aÉœH$ë”ZÏx-zÄ-\\ör*Zƒ•~Éì³),š\ns7qßoñÒ¯“9ÿ\0<^ÑJVè\\Å=Xæ~­å^Av\Zf‡b8÷|¯§ÈıÉhRVæ¦Æ¼şÀ^\rZ“3ú…>š7|{ÈS‚|x°£ChK~EÌzÛùaÆ´‚‚I7ş\ZW×Î%… Ìíjv.Ü>U…¢=l7ˆâx=iÊğ{ENÈZÆ•;íJC(ú‡b‰á£1£ö‚Õ¤ò4:ÃˆÏL™Zr^ÿ\0œ	Õ¶çÇÂ,HVÄ‰Âš†¨ï†í°X©¸_qÁ¶‹Õ¶W™7ïÀ6Ğé	&UŸ:÷­{ıR-­•¶-SaWúC¥D¼Mëö¤:EvUN#x~Ñ-ˆ›?H²(­ò-S!¨%uM‡í*±k™‘¥˜dVÖ¬B×$Tæx4\'qÿÙ');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercredents`
--

DROP TABLE IF EXISTS `usercredents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercredents` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercredents`
--

LOCK TABLES `usercredents` WRITE;
/*!40000 ALTER TABLE `usercredents` DISABLE KEYS */;
INSERT INTO `usercredents` VALUES ('bril','bril');
/*!40000 ALTER TABLE `usercredents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-01 10:58:42
