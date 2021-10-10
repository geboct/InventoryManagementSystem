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
INSERT INTO `user` VALUES (7,'Salifu Gebilila','bril','243930223','bril','Admin','Active','2021-10-01 10:58:03',NULL),(348,'Fatimatu Jibril','fati','7876543210','1234','Employee','Active','2021-09-27 11:22:41','����\0JFIF\0\0\0\0\0\0��\0*Exif\0\0II*\0\0\0\0\01\0\0\0\0\Z\0\0\0\0\0\0\0Google\0\0��\0�\0\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\r\n\r\n\n\n\r\r\n\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r��\08�\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0K\0\0!1AQaq\"����2���BR�#b�3r$��C���%Scs4D�����\0\0\0\0\0\0\0\0\0\0\0\0��\0;\0\0\0!1AQ\"a2q��BR���#��3C��S���$��\0\0\0?\0�fI$���V<]y>���A�)�*���ЩP�3��O.�\\����=�Wn�!cWav������ZDLj�mX�>�!>���������\"^�7�\rS\0��p���Qy*�}W�8^0!���,��+��H\rC�͵E������L�$xq�2C$��\"������\"��#�2�6��Q U��xݡ��ekE��Q�6��>��h{T�/J��oiS#I�n�\0�k�9�R��E��5pZ���*A)�%�D�c^6��A�,��&���\r���\n�N$9k�a����@N�\nMMN����	�\ZV��h-Y!�����k7�#�T�E8�����mձ|�sSBsb^�8��1�E���jՠ�jU<�c/P�\\��������ۄ\n,�v7o��j�2{y(W]`-hIL�ogt픦Ã�\rb�\Z���DjF�8-&DB&vA%!��r4�\n�\Zȝ�Q$\\=��iN�qgxρ�Dv[T�	��ب׾N�<���,w [��1_|�\r\0dT�*6� i�p��KT��!a�K�,��S�ǸEC���\r3\nІ�p�$�*$J�z\Z�<�7n��2t�A�C��\"��\'����.@\0�b��Sw������٭)�tP�N/,(����}��ǿ6�܉\"�Z�ԲxP��RsC$J�)�*.�k+�zy��B�\0�b��Y���na�\n@�P.�Z���4j�*?-�J�t������\n�>�V/���CK\\��/Z�����%�\"Cp�o�Kp�\n݅*$\r�IO;k42{H�pgq�/��9���\0O��v��-|�c��������X)R��ѵ�\"w�� ރ�	��\06��YVV�j)k��n�xw\ZB��iZ�����4���4=2�E�\rKٵ�`7�C����zQ��V���`�CmG�t�ۢVɔ��E��k_V��Il�\r�!���\'j|�Zׄm��-��\0@����P����źa��P�>>�ݻ����� T8�\Z��+TBQ-�M��S�,��h~E�Աw7zl�}�µA�����jm�Zp�cU���\\�T5�C>�;w@��h�\"�!�Lx�#�D�\0ׅ`��Jm��Z�a��%��4\r`�4,��\n�McV�p�rl���+���\Z�،P*������(�Z� �~�׍ U,;�	)���v�d��*�%�p�����=-�rˍA�lʻ���F(8��M�S�`�p�)�nT��a@;ŋ����dl�5��˚5�z�w�IX9DHP\0=��:xo	\'�*-����|�w�*ւХ�\0�N]J�-m�\0��h^[�4g�8:���F���V$e�/Zۺ$m�߂%��b)ΌÓ�d�5�\0�^�(@:�L����Ǔ7:��Dr�$B��*g)�-V x�W��ڰ��T�,f ���q���Aʖ67&�p\\w^�1jb�&-�ќsж棻�	?@�&|�5�86f��v��Z�A$hj*�\n��\"%�&a�ڶ�~�G�,*���I�~�G�F�V�\"G�) \ZT���Ƽồ�պ�PT�r|E;�B9j�Hl���(�0r���$xȕ�����m����G�$�q��H2HbZ�?_(J#+M�حj>⧸Aq|���k����Wg=*�4�sۆ��.�X��U�\Z���Qm5U�TW�<����yR�����0���t�4�*�7z��#dHd�b��\"�z�ý�E�`�d 1\0;�\nB�v2�\\���Mv}Cq�x�k��Ĳ����8���E�JO����iM��{��o�pY	��O#��0�����}���4zX�F�Fj�Q��$�\"\'�@+��h�C���T,�(��ٛ��{�j�Z\Z�� �t��h�U[$B�ԗŘ����]#=$5�;+��|\rPGq`m�����%��ѹWƯ�KZ#�X$��層Z� ��le4���+�G\nIm��\Z�����cJ\\ޕ;�h�@�.���}8��A��#��\Z���p�2+cf(7���⚇��!$Z��WPx�C��ej-.�|�__8�����F�!u�\Z�E��_H�@{�Z�q�7vM���E�\"��Xpm���\"��%	�����y7�0:%�jK�g��)ۊ�\"w��)\n^��iz��CZ��Y�����0��I	\rrh8��)��)�J\0��Qfz���k��U�X@[�U�\rC5�]�\"t7��=\n\\��\"4$T��v�E_w)$s�q\r�\n}\03�VQ��^�	 XH��N]@��ņ�c��Hj\n�,�j�ݼU���\\\nh�1S�~Щ[��ɖ�N�\0��͋R��,�a|d� \Z���?of����rWAD�\\��f<\rU����,\\Ӳ&�r.�\Z\r��%[�B�P�Q�}���h��\ZMЎ�qf���z#�R�H fqRv�Cr�z �N-�,;A\"�pm󎄝�\"�KK�5|�o�\\�k�\\�����\r�1~t�H�E�iޭ^l<�S�.]�8�+��GɹA w~���\"����H,ts�~�z�-�Ą�m�_!iU�`�t�5w���X�dh��j??Lb\n9wvq���[\r��J�-wn6�!��%� �;6�	���hI\0�w4���H0�3T\0�+�\r9���(������,WCe*���ݢn�Hb�k,7�;|LC�!,b�N���{�m�����������~06X�.T�`��������ֹg=�\n�h�95�؃{�x1�`j�HYsm�4��v�ݽtL�B��rۅK����3d��s̛�A��^�P\Z���b�,��\\�E(���x�VD�eX����cBԁhy2�\Z\0Ĥ=�Y$��qLkg��~�����3I !�i�@�P�.E��|*��e`A)�c�%ʇ�u�r�6;�j��`\r�;sxv�6B��b/´<ylƆ�}�	�bbǠr>\\�Z�*f�0��^��\\�*K����$?6�6��d��EE�jn��hR������U�U�h-	��0�����Jm͊3� ��n�m-��b3��\n�~�	�a�w\"�<�°,�ōX��������zJX�\0���/��l�z	�E�\Z���Pu���M�&@!D�-��z�x}� �Ȣj�Q��/�\Z-���3�^�cG��$�����!U�N�\\_nqL�-\0@;�<�Y@���}h/�44#�Η�k�BP�<�[��zB;E��fc�<�\nެeAK\0�va��4.�lb%1 V�K\rC�w���H��7�����Џ\\�����j\Z��}��¦A�U�CZ�oo\\!eh�J�\0Q\'z��T�:H{\nҍJ\r{���X�m�\0��z�L,�H����`�C���N�|��2DQ%*�TT�\r\Z���+j��C,C\0A/F\r�wz4(�<�+��Hz�w�@ ;�@r�����J%@�ֵ46��\n��(���4KW��\"�Lj�@\"�r\"��VJ�IЊ=K�6���|�Z%3j�F���y�{�	)w;����\0�E�ǰX�٩V���R�Э�*e��yf��m�w����僎`;�g\Z�ׇQH���-ص�-B.��Ƒ%T;)�*�3�C��ZSlz*�T��+q��)��xt�e��\'17.H:�!�� z��:�˞ ��\Z��\"�a��➬b���yEyR�\'ݸX�qSw�2(ݫ@�un/��\rȅQ1���t���\rփD��A�m���\"�J�HĻ�X�3$ѫ��8�5Nǰ�a�`��w���\n��(HbK8���qMM��[�4zb�P��w�=4���A�5�$R�z\Z؇�M(M�,��P�E��3�}�����Ce*�0й$e<�k~e���r��Ҋ�f���\\��B��ZP6R5.�԰ ���I��<��\n�5\r��Wz�̕�S(j�-+��@��5h��j�*-�nOq��G��D���OV5[U$�ྻTk�$�Ky����sV���4D�p\r�8e�w��I+dN�-�.ɱ:�)S�	�Ē�W\'��Ŗ�����$6�����i���R(oM5�r�H�7�ıB:�<ˌ%���J�.�s��\Z�Ul�r���N.�4-���;.6�!�y~PW$c$86��\"שҺm	7��t�u��;7�A{�;\'G�^�Nd�H�������p�{��jO�q{4�i�M����G8	!vŭl_��Q;Cƴ?�?j`ce����《���R̵�1�-��ϧ��ad���3�;Zv2cI7�`v�GɋD)Cć����ʼL��!��.OZ���յ�ճ��+���ր�B�m��pM�4���uȵE���ގͨڗ�;\03\'9jR�r�-�V#���Z���w7�T� шpUv��M�b\Z�	e���;�Q��jk8�� �h������b�$���_�?fh.V��w;h����g�/�v��%�U�j��QO����\n�C�S����\Zr>o�\"�\nS����q�o�)�]X��Gb��:���|��f�̧\r���鉖{.	}WW���F��+Kҽ�b���/@�K��T���n�x��d�()(\nl)]l`��C��\0���&�G\'��\0���\"�2e*�F6$���`9\r\"��Dbz��%�5 P�p�Z�Ī��J]��B�g�,�6��N�KE~DIK2K:^��wo�4*�3��;�ZA�W�����#�$y���|!�\r,䃥���|X�\'�@�������ׇ�6+C0���0bR�bB���V����9*C�[-5׾�7�;%7+��b�\Z59����\"%A(Y&�!ņ��n ��dlb�Y P8:[B��h7{!L/��pV���dHb)b�Ʀե�?\0H������\0��aT�����v���܈sQ��[����:2���\r���ѩg\r�ǣ�-��.X��i��L!��Y7�Ӿ����)F��Z�cÇ��\Zɖ�fv����V*�����|\'@�i���\n�l�&���m��\Z1��������+�A�n�U�V�^|x���\",�u���u��<�Z)ڤ�[�Fz��bܭ�{�Ӥ�\rCs��S��A�#5�`������%KbH���*acP��C����|�$A�F���{�/q(3/qml��w���yÒ	\r��>F�9T\n剧!���n��.Ik�k���q�߂%��g\\^��3���J���XN.�狪^E�\r��\Z���q���cp8,5@�5�8\\۷���X;X,����U��_l��y���@��U��0�R^��^�B�#@���)��+��4�)���\Z�\0��M\n��\0/��ͼb���LGe��j�ܝ��4E$���da���Ԁ	1)���i�+�m_���4-�X�bԠwܓ=�x���9��uΕ\"��+]�)�)��g.M�M�Z�5��̔�ƽ��\0�b�^��.�Ţh �+���+�6\Zof�p�ն rCW��\\T��U��Z��vY�T1I5�5�<\Z�0�%��h��\n��\r��7�W\"�-�+�\n�Oh��=��4���!�]Ӟ�ʜ���\nKbr��C8@4��H���K{�fZ�q���S�v�N$�4I��\n�Sͭ��j���ħ\0��MxЁ�����D�@�\\�k�K���\"&д-A����w��#�Й˫�C�P\\(��ި�J���i�b�NC���6zPS\n�7�B��B	��-o_8���<k����աtX&+�)�hh�[T��K����S~�P�M�/���$����г��]�G��Ld�pm;�E =�Z�O��ش0J��8]͘�|�[�3n��H�-�S�Os�[���b(�kO�ʾ<����6g��ᛈ$�?�j\nTˇ,���gq��nH)\r��G=.�S���E��!�8�{�p�0�PX�$��M~��5�X�ocg~�x�4�d\r3j_�>���C����I���m�\"A��q����@��2h�m�_8	�g���hi�B�(����(�N��J���)\'G[V,�\Z���\r��$8\"����+��CS3}����7�B��	`�7��b6\"!He4��f�ݜ���b��b�\n|K԰\r��\\��%f�9�����n�\n-#f�\0ϩ.��(Z�+K���v��nbȻЭ]ŀ&�Cv�+�EșGf��ӷ[�7���&I��Y�z�A�����F����J�i��;�{\Z�$d�� ����anZ�\0�$�L���%�9\0�|B��,Z�@׸�S�吜�	�wV`�5�Ǫ���J��Y�@�\0i�����c$y\n!N��t����V�*%3\\���.ڹ:�[I�d�Ð�6�4��ׄ��\nK�����X�5�$�CL�Z\n�\n.�B�+]Y��\"\r�x��)���R���\\�q���\"�2���;��G�)vԍ��n���dj�b��Y^n<��r \\��H5!A�h�Z�<�۱�		sV%�ߨԑ���jY�Ўt���Ml�����8���x\r@��#Z-o�~�9ܙDiJ�����l�<�\\�{��H�R���Zwni��e��P��/�G��Ju�ס�\"�rH\'��xk�P7j����y&R6���w��\Zm��/�U&0��\n�\rW&�\"�r�Ub��Q�Qa|� *�����U%Ld\n�h_z]���{�WD�$C����6�V��eI�mt��@�� ��!��m��0�V)3�h6�^�W�ɚh�m�R�R4)R����)�lh������vZ����b��4f~\"��E��<�\\�{@��ӈ�8�r=���*iΟX����Ge��\"����i\0�svWݴ��s��P�#����xQ���	�nlK�U�Х��	4g8��=R��\Z��*p�3�/d��X�ij����Qf\r�aE\nv�Knx�%��?6��!u����j���|N���\n�݉ �����\r��\rQqlM������)��	�b|)˔�:ipi�Hd�-�NՋDzI�h�o�Xs�]��rˆ9���b���A�\Z9lR�.µ��\rW���	�(Q�	`F����-ՠ��\00	a]X�CFZ�KH�o�E5��L�l(�Z������$F���u0U�`*�$�`��PyD�������H-aø��0����\\\rt��$R�%�H�6�2��\r�2_��H�:ߪ�ً��,��sihf�V \0\\5H&��~wm�mPA��H`r��\0z�V��ѥ�Pr僕�ӓ���c�����R\\8U~&#l���XR��X�SмD������\0:�ajAl��%�!�z��Y��v��M*�(\0Z���w��F̂p��~�r�v4f\'h��~��sʴ��V����P%˃�uo.\ZŚ��p������QL�CZ�4��9��[c1�q�3�\Z��+c$ܵ�a�Z��P��P>���D�cp���[�֐�%�6�M�{}\"-����b\'d\r;��h|R$�	2��-���}�F,���ǁ7ۈ��\r%l�U���\nBF�%\0>��n�C$�#�/�y݌6�ơ���@���	�o�)��]PME��^\ZRC���Kp\0�����j��͢�rJ=%ow�G�v��\Z��aK��j�>UX�\0�X�oz\n&l�⅋��|��[��\0UCS��<�-���]I6ʐ�{��C%Jk؂�]ʃ8�`��3&7����Z��`�J�X8�����HW�%�S`�7w�ĵd��j��.x��x ��)\0=Z��X��@��OL���m�I���U�/\0\\�UGx�wCwP�c� k�w���� XR%r�W\"T��7��@1%��\Z�cr��@��,^��^���˜F�Q�r��`���w��P�F�)�pH�ͣp\Z���L�g��[�\0D:#\"t�S;_	������b�\0HJ�Km.�/�H�+���D�$�}ڞ!�jW�	�&����qB��\\����D�� �?z��w�{&�+�PZl�\0��MĆ��Z�x=��/�u*:9kQ�É���e��b3�\0�K9/p-Nofx���,��4ަ� ��������PAЍ�%��-\n�Ȑ���6��,I=��ŮWB��Lz9쪏Ƅ=����)�G掄6��)�NP� h�ЯNq�}J�d�K\ZC�_�MX�hv��z��e�5�۝lv�Em�b�����T�\0)�wr�����*�0����q�%�Aʒs(�T^ņ�[еA�Qw�W�<ah!IYpK9���7ΟXD������v:\r��$V���bP���}p�\0�.JIj�	���{�	$�ҕ��塑�l�0�}�б�!��@�)SF}���;�)P=c�P�%Z=��(Jh�:Z�u��O�h�\"|�-v�u��!1�1s\n�k�I���J7��B+G\"�>�^���`�&��\n�j[HG+%�����CK��d��-�c�v$0#���N�AJ�I ������#�m�x��G�vfa͈&�ht����sͫC�o�#�L�V.��6S�������������e(��\r,Zp�l��-WwPt�HM;�0�L)jeׯp\Z~��V@p��PqpR�C�B�`~��,��S�����XPɩ�����q�u��W\r����\0�WO����42K=X�*�wO��\0KQ̓r\n�\\l��v����K�mK��\'�u���`�pcf���s�NMq�Z��#���`x���2q��p�8%�[�s�Ը�Z �M,�7%�Ү��;�R_H���DOK��`��5���@raH�m�*֭�$w��ʸűqt�H��6Ł}8ٟ���R	�U^��֡����T2Pb�\0ͰO�<�ڒ\'l1BL�`�^�H���[xe�����MR	�5��>�x�%R����Bͦ�;�L\Zrm@Ig.G2K��\\���j�V�����v�\'��R0��k��:,TdX����\"�#��\0�а�ε���;*�a���V=V�MCŽ|��� ӈ���6;��Zo�{�g��*�ɜ��\Z�}h{�2Џc�.�o-�JE�W�?��� r-�U�;\Z����hy�/�wW��C@;Z��u�p%L���,�ޡ��c7������-�`�,sQI���)}Xj�5�~����|��Mn���\'h,A\np@��.�nF�H]�<��d�%�ד����!�� hP�����z�~�Lz��P+>�Wp��S��ryz�� �<Р\n%�j�\0��\Z��-f�����+a[�RX)���Rs(~Ռ\\�=n(M(Ղ�/h�2��]��F�pՁd\'޴��H����v�@�C��b�Z�߀z��;���س�6?(��F2����/���)pf:����R�L�5%�BIOs�H��-@��f�K�\0��`b�R�U ��qN�Z��8@{	��iJ��>��\nL�d��n.��m\"!MK�(�&��;�\"6ƣ��.���э˹���B�K!����C|\'����6�(��\0\0pi���?M���W$9#R\\\Z6ab�5Mi	Ad�[�\Z��8�yR���T����74�3��vվ\\ �aBq���Ф;Ѷ=�m^��(R�K�R��\0����[V�\n=8��@\0s������A�Z��{*�1e������[����o�c�K�\n�@H��-~\'͛�x1|���ٌ�J��\"��\"EТ����،���L�\\�=z\n�L�9I?���(K����6���\Z\0��_��7j9��ׯ���ѓH�\r��-�A�X��(`b+��mG�\" �I���ՋAt8�R��n�oT�z\0I�w})k��\n�:h����n>]�]l!\'}>L���,�.KPW�jŗ�VX@��jo�\Z\n\\�/]{�^#hV팴XE�o(T����&���bƅl��ؑ���4!*�\n�Ps5\Z���\"t�����ʿ7���\Z�-7Ԋ\n�!�����i��Ѐ<A&�����Sg��j;����Z�x.e\0�\0s�_�px�Hʒ�NMR6b�,�\"[�J�xS���I��W�@�P�+�Z$$X�kQ���娀��<���ш����\r�WM88�a\\}HL�;N(ĸҶ��\n��P\Z���]���w_4n�|F���v��q�\n۲R�~\',�(���[Xe��_�s��h��6��+��A�\0>�7�-��:\'d�=�SaXqX�ϫ�}�]�zP��kսI��R�@+�5P��� �;��w��\n�9��S(5�r���o\0֤Z�.x��}R�\"�B��N�ɰ���X��A�X��4���S�NN��g��Z7�a�yƎE�.@\0�܌��<��J�\nH5����N0�\"*I�C�ݛ@��|Δgg����W*�\0�=N����k\nC\'�F��#J���pگ\ZBмB�@�sW�jO\0ڵ�h���^�aԒt�`@�c�o��a��X%.�nf�$����c!S� \Z�\0{0�$k�^�x�#,�YA��6�\\�;]�E�*�Al���5a��J\"F&�]�\\ۆ��\0�kV,��� �J�B)NOj�ط`�5��9U�����?*��C�AD+�]���;�化ٚ�5K���ɑ\"U��B�X?�[B��P��^>�-��Piqb�>��!�5�P��ņ�k^�6�aK[��4�;���,rN�]�ai!�ġ��w}>|~m��\rto�}\"�оH�0_�Q�f����EQ�ۿ�t��ʔ���/c��Kc���9�<�X(�)1j�]����҈D�K�3���qY\'\r�	gk�Q�?�%��*j�u�oO�%���P���;�� Ԥ�<ט�n���7�������\0=+S_�Ms�*cԂ\0j��+V���u[�nj�U�(�rX��W��K�3v<)�(A��Ŏ�8m:�\0���(-w��pzwݙKV����t��U{��\Z�~��l�^��-L�C�T6�X�m!�2�p@r5�Y��g�.�й�AMJ�����u�\Z2MДYRhJ���R�<�<�+C2a\"��~2�`7�\rkX��\n�R��iw�!�\0Ɇ��0r���akP��.	H-ޖ=���$;�+�xT�`��:S5�A�,[z�G@�W�5jX�7pU@8�5zy���#,/j�f \ZS��2F��\r�0�S \0j�����m��l���K��	�hYA��#�\n޴B��C�,��+�8V�\'���(�&µ5��Fcf��5���)]<�M�\ri��S) ���FW��^�;x�H��%�����mY�3���^Fఠ�/\'��p~�(�\0�1�n�u��ZAS�p��{V�ЪV1s(�pJ��\'����1nP\Z\r������6�<-jo�L�Z�O��\0�*�9�e�ں����I3<]ht�E�~�g�����Kv �n�y@�!2�G{�\"a��`o?��f�\\ì�z�\Zl�[dL.!�j�WŇ+�_��NVaQڨ$_� �5pH/����Y@{�(��p+[ACz����G�1)U�T�Z��V��b�,!;k��_h}1V���k�x�)	�%��MM�����%�Q4��/��\0x���ցG*TScZqz��A4,u�O�:��@$T֌@�c�ݠ=�\"�q	��Ҕؽ[^��H\"���~��q�������\"��_���ʐ, Ȗ�\Z��|-V� ����J��L/S�\rB+p���!-�\"�j��_��DZ�(�p�b�׳�ʧD|9Ip�8�@J��p�T�(-ŜmR�Ʌw�;E{J�ȭ����,!d�\n����ތ�@�Y�s3�\ZB%��PV�oK�Hn^0��AA�0�Id�ҥ�jv�ŵaLK9��,M]ƺ�\0v�\n��\n��\Z�Ѯ�SAN�\08U� �\Z����`\09���ִ���-��;(�Z���.�B#q|���\\�\0�C�+V��(Vw�X(_�CWl�=K\\���j\nS� ��ɫ��\0\Z��%AD�@z�鷁7��\Z�H�\0��Z[��{���5�����e�^�F[��S��\Z��Sh\0�;�ԋX���0���\r��}�B�Dc&I�,���[P�HwP�L$�	.�)�,iZx58Et�)I4\"��^��u��h\r 0�u�)J�\Z�a�nu�b���X\r�\Z�XR���P$�Ǝ���B��Ջc+ERBe�� �ر$ܝ���r$U��Pb���M|��M���ha&�mܖ�h@5�,R�\'��í�)�-\"���sWJ������IF��eJ͋�>K�ç��s����A�B�v�Y���DF2zN��?��2 ���>��\n��\ZP�i�\"��-��%���m�#��(b�/V#g���[\02������^b��vrE����$�R�ع��wE�$��o-�z�\\P�D�5v��p���Q�a�¦�QV��P\\������Q�o��V��1S�x�[|�����;ܚ��k¢�m�!2]��+�j��X��L<;j�*�ƮMM7���o�	�<|F���Cy;�x����L�;3�����Cf¤\'����s�+�Q��Ӡ���Hr�c~�w7}��V5�a%�b������	 ��\"\\�eq��k>�_������?Ś��.��Vm\0��A]m�\rx5dj�������LQRCP�D�mǋ0k���\Z,ɖ� >g�4P[sz�\"��dm�\Z?�����#�8=�� 3)��\Z� G���@A�\r����H�@4�ŢM���b�e&��;=���w�#�\ZÖ�Mk�\08�\0�8���,F��X�Aj�X#[��z3HP�eP��\0�j6��v�j\Z��P��G�w��*a��&�a�iP���K��O`+ሠr�b^�*.X�-�?�q��),n�е��F����R.HNb���=�(�\rC�nmM�xp��¦`������!�TY��8���T���e��:M�]�\0��	\'�jY���1�u9h-SzAK@=-!<� P��5��\"�B(��qV�d��{s<Y���\"��2��Q�ͩ@)��<Y��1KfrHG�`v�_�%�%b�\r����p�\"�~�xqX���r�R� �Y��ۏ�+T$�.\"i��\0P��/⚜�Ҭ;�w�n�!�[��\0];▭�ދ2QR,@;׏�CP�	cNUןӺ�2J^�P\\m�`0��E�}CDOVF��痁-��oc$9�d�j��w���J,!�;S�i��	\'�h2@�����2\rH�/x�d���Ps��q:�r��q��+r�!��%��<��8��{dv5	r߶�w��^#�G� �P/@|U��;q���%\r��\r@,~L|���L��8�k����E��@�L\0�Fz�>��*�u$6abum���̉�!\rQ��<C�]��,a������o--F����j?�q�67���n�b(�HQ :��5#��_��{�4?+0;�B\r箐��D|�h]�\0���5�ɗ�������۴�\0�p�.t�!�jƑ�$�:��?�^+呰�)J�~ F]ك6�Z�D�ຈ��on$Ѵ��\Z�އK*fd�_�v�o���>(E�zd�u�CX���g���\n=��*���;@�ږt�\Zֆ�����D��qR� ��J�ϒEW!e����d��Ư����^��FV.T�3��I\rky�5��@��`k�)���j���-�W�g�r���ՠ�!n\nH�ԝX\n��-l`�s�����i�ӟ�#�Al�az�\0�*)�!\0��҂�mO;Q7vA�e���T�h/b�mA��Հ��=j�\Z%����G\Z��¹z\r��@��`�\r�j淭Z#☢f�g6�j�6Z��T�r���X�ew`KY�A֥��p�-KB�3�g���e\n14{R�<!TH؉j\\���	�\'�H�����I\'�JS���\'ז��-\n3��^�Y��)pJ^�K�ī\"\n�ѻ($3�aR�T���2X�r�$G,�ݍj[�~�J�\Z*��[jY0��\0S?i��-`mF��4*h�0	�cq�\"��3Lc��7�t�\rS��_�z��W|��ݫ�@��b�v\Z�4�pZ�i͡�je&����;���\Z�OO1���5�Y)�_qO�����)�@�?�\0#x,	\r2�A�faC@���C�t�����H-V�7�\ZZ_�G��u��ڝ���m�;pb�\r���\0R�wz���Z�E�:�FJ�8��ֵH�3I�\nZ�]C�\r�6��z�Dc��X���5�ۑ�m��6R_�(\0q��=���0%E�\\��޴�ü���c��JMR��#J\Zў�zh{Z��	F�\0oӘ��Wf:��*�#��E*-��+��M��Kp��rS9��k_3\09��ѹCоF�\r��H\0S罈�4+z\r[ڿ�,M5r���\"~$0���vvm)}�\0G���-J��Gc\\�#���\nA�MAu3\0*��,�^᷆� �0�0�R�{�%�C����#v���;,�?swV�@j�e��bV�4����5Y��o��!`��[��,��Z�����ᥤE�Je�\0kл���@4h�;T-8��nӽK���Y��\r?1r��,�)�9�Wp+���N�v�l��.�iV,��OK߾�r��r�K���v�ֻ\ra��A�nҚ�6bC0}��-�H��&�\nf�Ci��]����uh�1pQ#3Ԃ	-�];�hR�p	u1cBE�Gj�p�[�U�V���1��[R@����{�3ee��2��hhmB��9�+x��G˭h�˝�\rt�¼`$x�$z\n;����饧j��&Z�������M�M��%_Q]��,��������36�q�T��t�e���I{���-F,��Y_3�V*��Y�%��ŉ\"���,$�.�	�tK>b���xA�MR+���C�,,_�W!�\'SF�<)�\rъ�w���csn�g0cM��}wa[iIw�bpDX�5���O�%��\noZ��E����&�m�1&�Ŕ\r\r]�#�G�\0\"\ZU@u�v�5�A�%��-}�}��?�+[\r��\0Mjܸp�\r���r����\"6��2Un�p��N1[aIr�+���Cv�V��8���o�m�b�%���ճ�z�2�IZF�[��\rǌ\Zd �t��A�>{¦\ZKq@E�q�W�\"{<Az3�\0p�����\\x;Af)���p{$�b���r��(�ȹ�s5C�z`xĺBHo�A.�A�u6f=�\n,K��p	\n��i�7աe��A)!�@v%�I�5�j§����\Z��[~.��mJ�5��%�.2��w���L��0\\�X\nА[k�G��J�!����866sF��6�lqJ�M\r�?����\"U��3ײ�? �_/� ��U�V����F�����V��\n@#b(��Łsf�jB��\n��N��͘�\0f��{��Z�rUwt�8F���҃M42���sjK3���@ٜ��\rE>Ú�\"�C�k���_�A�$�\0�,�䊱5Л9!�\0��Pj;��ݦ=2��e_gHvm�\\\Z���IFض\\\\�A��?�5�k�h-�-��!ꖩ�(�rԦ��[u��(��R�<HKƔK׸>�LZ�+hxee9ɱ��En\r����	â�?��ܚ5u�5-�#w�\0�;��\rx�i5h|�B�9!IS2� ����+E)�BْJE;\n�\\��N���Z`v����*�P��/���Ta�A�$IS$+d��p���7�C�G.��Fu�Πs5�bյ\Z3wV�h#\nA�.�Ւ4\0q�\Z�h� 	@��j����ff��\Z/b����1dj��PZ�׀\Z\\Ո�zr`���C�o�;W�:8�	e��K���h^�5���z֏�Ѧ.��/i��\Z�Jz����ym7C�GT�RKhXm��Ʊ��@6�շ&�H+���(�Khk&��N��&<3���~p�<����B9�\nT9���܂�؇���Er ިTjjF���j�h�f,i�F�-/PmhBJ\0��{Q�ο�#W��AٳQ ���{B�:	%D仛\r\"=^Q�,��9(q�Z��z�3+v/O\nq.\\kS�EJ>F�Ғr�j��{�k��\nt�9�_��6��\r�)|�0��b	MjMB��g��:��qM+�@�\"ΑS�n0�	ä2C���?n�ڑ%+	^ye��>Vgb\rk�ڰ�7a�S\\�!$��7p�{�ǗdC�JC�ޔHq��\'shG����aٔC6p6��\ZАy�\'�1��2����ftIs�p�aE�\" 1`��\0�K\Z����I;@\\�����I�uz�wg{@KC�a\Z�������r�O�B���ڱ,��Sj���-Pa\\+B���e��{B��K٘S����X�#��Հ���\0�;�R��u�V%7PY<�|j�uX�;0�~�f\0�?�ݫ�-Τ�4�L�$�J@,\n���-AF���91j�B�3x�\n��߀��%\r�(�����0�g<I�J�M�Bea�{�*$����b�7.�v_�J=0��\0͡쏑�\Z�lb%���k�m˅St	K� ��@cBUN��u-P�%8�%�X�5M��!��04Ø%�)\0)�.�@5�\\��Zŗ�\"DHÂ�V�U�f?@��\'��\r>$+BC\0{Ufp�k������HQ��`Kj�/�U{T��В]�)�\\\Z�pF����HF�i�U�)K)��C��Y�@ h��_X���?�%�nC���\0�ɪ@fr���-Ư�2W+�l{K�Xܾ�j�N���k]�t��J��	7��BS�\Z!$h]_����5�O�j�햊W�ϗ!��r9aJ#�[��8\rQD���(\Z����\'uhjE�������\n�(�[��]�\0�+[)jr[���A�P�R����*)���-�>J�oJlG��/@#ٝ�XЂ����kq(��Mt\Z��8?�[�t�����ڀ����*a`-�$۞��5�Y��1�zl��Zߑ�r�n������\0�n��#j�6���l`�H\0ފ$���0T�h�����0\0|%@����~�./���ҕP�PZ�a�9<W�\r�����������)JAQ�a#��$��Hk6��\\�7\rr+�$;S�+R(\Z���_pҭ�	A5�$R�V��pk�y�7���\\e.H5$����oمM�@�\0��w��S��&�Z�͐�,�X�EI�9%��z�Kѩ��b��\Z��!�\r�f�w%�Q���&T��=@4\r�4Qg��`Ҡ#�!8B\"ƎOp�R��DbD��r���+R@�h�\\�l�=G+w5�\n�Ɣ��[d��+��k(3X��ެ\r�i\"1X���UJ�� S1JA�\0r��b�5����d�G3����4<�9�[�݌!;�e\0ط����V�/\r%������\0A,h�J�4.�hQY TR��С��w�Z3�T���,]�2v|�����`R��$7�Ғ�BXڊ�+1r���\ZP	-��z�B8�a^�.E*Z��E\n��X�%���}�u��k\0\0;\r\\X�|��d�X�\Z��|,��1QW�9�$7��+��a�b$�a�a�1�Ѳ�$Tq��E��*&i{6V\0_��\\�er\r�r�X���A�K�����D3�\Z���a)�d��h�%D�E�!����QR��C9p\rtm	k=I`\r\Z��4�HY\0�\\��Y��G��:E�\0�2�t\Z�ݝ�^��`%䌭<e%Ze���$���>͊�,�Q�Y�l*�t�B�I��iY|H%�aBCV���`�J5!����Y�XMw\n	E�	��hߕSѝoe���{��yEJ��c����w����.������g��{ �չ��=�crm@�< ɐb(�\'�׍���\0�K�P\Z�58knq_rC����F��u�w�\r8j0\0ZXWKSZk�\'#� t:�X[{\"=����Z�/�֐{|���&�h|�˷�%l�	*`w�7v{1�t��4$�܁\Z6���YB�J�\0��	�pܑn0Ҥ�� �n�#~to1T��d��e���b�G�@}�@�ұ����.�ݜ��C����Е �i�@?�\Z�g6]���	��Kj�Z��mmS\0U��r͗5��z��1p�c[bfH�P4wp���n̐������,�d��K��%�[K�\n^��0�6�p]ÂT�Jh@�܉j,�Ɓ݁�H�H���1Yb\']#⢩K��*pg!.�PBm�D�),\\��kV%�0�$�;>m]��i�hYQ`��q��(�]-b�Ox�+\'\r,�[�5�RƁ�͘����t.J�_���7���a�SԳ�Y�\0�q�Te�X\nj�>��=����[�\Z��\n�3e� (�2T	J����)� U�F\"at���qM;E�,	�n%�Nƶ=�:AYE@-��+�%����7\n*u�)k%)4\"�*މcJUu\n�*�se^�v�.Ib��\0\\h��)a�ԝ6��,�L�Q�:0)rH�9���d��^\rTsR@zٴ�c�nah3~\0���C^�z��C\0\Z�pA�A�Z)ք\0,X�%�������I-G~n(��\0-h[��ᜀC�����A��;e,��@L���C�f!ӕ�0�F��(������\n)Q���`�Oi��,(X�$����O\n�^dLČ�BU�S�*�����eP�����0��zm��jJƦW�0�6 +K��j�\\p�[�\'1�f��\rP^��?|��ˮV�)$�z�g���vE�8)����cp����..a��0PiXH�5\r�&��\0��浣C8�\Z�\r�)��bl��4����.L�C�jsV7�_�+.HiSk\r�`ӭi����-����\0oC����@:H5�����5�(Ʈ�ȵ�kE�R0��4�w�\Z:��\0x�?�EPXA \0t�w�ӎ�/B�\\�mkU��������6.L�d�X8�l@صE\"(�I���޽2!Ø\n�D��?�V��!W�/s�Y�ܗ����%��D_g��jZ�<�i7b�D�|�M(A:k�\0����\\�(5\\���ҭ��RT��\"�s�k�/���SpJ�/�J6��K�9T�T�K a��T*gII\'����مm��\nTC3e/M��b�iW�\'0��;!.US�_�E�\"���]�0�PŜ�! ��g�\rwj�d��\n7��b�ǃ��O!�BU�\0S3Z�9���07�u9�BAC&��\n��*�)�m\\P/V��h.�L�A\\�rw��lZ�>P8[!�m�\'q��-CUT����%d�<� �^�+��L�B���]��UI Щ�/O��5OfŒ)�GzB$? ���Z�e���R�K\\��jEl<�Rt�A���5 �5��Kőz�*@�s\n�*��ԥ�Wu�\0��E�ޑ]z�&f�)�\0$V��W�U(�&YZA,��.@r�$�ř�.��\"c��&TL�A5R���Q���^���ة�h[\0�͛-���\n��5w����\"���5Y��\0(=�94\r�<� �ys��!�C(v�\0H54#�A:;��V��=��	r@��\r�-���\0���T %�榀0��k��+��T���`���\0�;\0��:�òPš�8�G.�Q��9\Z��u=�t��\0Ww$�ZV\Z�	e9xB;ML�*H�@���$U[�1z&��E�;8,_3�+�e��\Z���w�\0��E�o�=\0ܭ8���L�JK���ĳ?yX� k��[��e�����n-���,����Jv��p�H�\0ڷN�b�҈�ų����Џ=Z�&d��\\5\0)fM\0׹�-��U��-�=�k4�����o�Ӽ��2Mܦ�F!�o�ht�k#5�\Z[Zw���K$2A��]���;/cf[G}=V+��H\\��Ӊ�Y�!��6@4��;��%��ß�^�G�E$�O]�����,j�\0����n�z��C!����\\����#cp�pnS�\\9K�\"�;��S\\�K5�ō����AK�a�C\'�\0-�o�\Z��*dc��gI4��po�Fi &Je���~g�\'	\"�\0�n��K������L66cw4�.5 sۅ�(�R$ى.Rf�I��͢�!�dΨz�hK��H�`{��a2XH������5ْ��aE�PY*~���K���F�]hi��&a�	�\\XĆ.�}X�.s��M\"�\0��T��$�o�@�ܗ�Cr2\\������~��.R�Ij��2��R����q����.�z]�H�o�,�*X��mˆ\00b�%���T�-d�MV3жRA�T$kv�,C{\r��keS�bⶮWpj]��3�0�4���(�A�*vp��#A����O�R���5줖 �Ԛ�:~\0i�;&�Q�R�V��%$�VPYM�(kG\r}i�$���AQ��1b�����b��C�Зb׆\n\r@H�r����C��p����V\"��T�,���)P��:޶�mք��L ��]�.\n���	b��\Z�GB�#-��	%��wj5�S�e�6K����\0�ќ�����43uȨ!3)%��pu5�ɠ��Eh��8�$,�Z�~���چ����BC$�0�ñ$0��Z8a���NZ�*Ի��׈b�b%����QGw˥�ɿiڂ��K�&��h�3h�ZQ��%�+��������9��=�\0���@�W%��\0�$��j[aV�zp���\'��Ըr�	@\Zl�poD!o�;�p߫`Z�SJ<�-�Awϕ�B������MX͢s�	��Gk�5!�jh\0��1ZH!=�H	$��5,���E��\r\'�B�L���),\\����m!�<2N��������]��-�׭ݾG�ѳ��`���G=�s��dR��]�͟c����69�/�\\jumbE��Qp?��q��&�]�`_����1\0�ڂ�p����D�l���8p������;AN�P\rnA��XQެ��I+��&Ҥ=hv��Ӳ�!��PCW�^���&�)�P�ۍ�Ū76ռ~�ݠT\Z��<M��x+`�$L �Z��ڌ\\5��u�����\0+��X�8U�ˋE�7�n�����bս���]�8%�wXIS=l�2��׶��2a\"o�	`�^�Sw�j6g�#A�eL\rJU�&�*�;Mů�Lڱ�w�%�*�Sa@�RR�!qKM(@��XS����\\��I�M*5$��M�^��։aIP����	ft�j\0q�G���!m%�6���hC6S�8b���[q���:Z�\0���T5��e!��R�w����\\�!ëTA����AaRU�+��BIv4nӤ$��g��5I��vH7�EK���,�=E��Y�E?JCeJ]E)7,C��!\Z����`�Յ��b��\n\n��\Z�%��Ŵbk���iF�x�|��������U�**�V�	��]V*��)t�I�,���Y�)4%�jΣH�`���#}R��\\\Z���Z�\0��B�\'�\0w\Z�{@\0�po�R�ƃ�eU�3���B~&\0�v\nA\0\n>�(Ԝ���$\0INa��L*;]�c`��J{��$�μٗ1)v��A=������d�%�e����W\n�p�T��X\0�VՅ��\0�$��R���)w`�t�$8.]�bZ\02�\rK�Jb@z1j:R�(2�!��5\\=�8�Y�\0���}9�Ҭ���bR�p�@.��\0\Z�+l�R�����z�NcKv^�M�C�`JE�z���#c%�)Q�c]/���.\0�� �R�6b�(s%�\Z&�jCܰT��0��%M^\0�A�tg#5��]s\\$\'�*S��U�\r¦�B\" {ҡ�Ӳ�H���xe?P�UX�����w$;(�kP\Z5�]I�����%�Qކ���j�}��*��0�����w�\Z9���aUz�T�T?o��,h\nv\"��!ݠ-�/�����[\r\Zڦ�;�6��̍�.�����e�av,\nܛ�k����G�7�z��uxp��$��0��q\0�����$�` �{�w#��Y_2����q����:��_��\Z��\\*S?r6����c���U/x�oI~_�d��\0�la��%:���\0D�i�s0r{��%�7��y:k���ܷ+�ɍ�o��b5�_��s�a��wˏ�������.��,�d8\"��.5Ap�ݬޱ�C����cd��a��Iz��V\\~�\r�xU��w�(����XW	���R�(1�$pr��_\\a�\0v32����x����?�H#���Rک�4�G��W���1��X���\r��_ŀ�ҋjR�Zw��{���N?�S��y���-�	eO�8�ŋ��λ\r���&�ςN�Z��\n�&�A$͔u̐�9?���j���2��&�,Z?ؗ*��X7a{�4�¬^�G�����ˇ�e����*\r��,4!nI��\n�O\ZEr�c2Z��K#�	xce~�Z���bY�K\njE����~L�{{�	�|S0�%TɘM\r�5m�s{��Q�nb�d��f���jb�n�Vo���w7�\"~�Ŀ��?��\0We)�ܚR�֜L2�w/�\'��>�\\���6�l�����%��	U*���_�9�����^�BX�C͔X\rfh\\�ʫ�~�e�ݜ�������\n� d~�e�\0��7���K.�,BKݬ����Yxp?��\0��4L�\0vBC�#���\\��w���9�������\n_��f���~ｬ���u�Q�D����Hj�\0x�?���[��9t�XV��*2�w3���K���#����3�=\r�P�H��9s9��\r!ws2��oc���~qG�\0�J9\0u��։��Q�|b��̩���1�n��V�¶/)y����U�@a�j�t����O���\0q_��+��\0��������}�߿\n���g\'��ɕ�xq��\Z���-���\Z�*��`	\'���x?����_�\'�?��e_�\0Ls���ls:���	$f)$I���^�M�\0�_��W�,��~�2W�rb˫,In�YI7�w�\0��%�[�\0����\0�U�&7���\0�U�T�/�Avu	%@�����4��������\0��\0������\0Y�����\0��	PR�d��Bz�U����Ճh�֗�\0\"�\0��\0�K��?�o��\0�#/��ې��KY?�LNVzvK�^�H���ޟ��\0#~�E�����r�\0��I$���I}�d��-H�݅�o����A~e��9v��f#*%-Gv.�*$��\0+�j?���C/o��?�韅yd1�M�:Q-س�Δ��oZ�?�x�\0��H��e���)��+JHo�̠d�Ւl�C)$���l\"���6��_���/�ޠ�6\'�\0Ҭ���Mr��2�rjA2��5�K1��Ŀ�_����\0�?�R�\0���q!!7����D����!���/���\0���~�f\\B?��?��B@~$گ$�i \0�P�g���^�I���~�e�����c��b1	,�$_�����d����s�\0���xg�1��+�j�.�@�w�b\\�Q�����W�{���\0�����u�#��\0rQ�z�U��j^�S��MJi�@���?t�=���\0��$}����������	&L� ��$9\0ԩ	=�;��K��|]O�.1�\0J[^�n�����_C���D�3\nf$��\0B�\"�jј�D��cr�u8���9�h��r�,{��d���J�}w�Z�G��cF��0�>��@rOj���(��]�� �$�����d�\\\0Y��옇�����Xw\"��{��@0<쏀؀\0��~5f����:21����<6�F�ͣT]�\"��/D�Ji\r���C�U��/�Ԡ�a�����~і0�g��������g{+�dJD�K(�����rw����40ABGɺ��Y��>M�B\rҠ|����gu�)�S�^�\n�>���(�~GKƿ�r�+l������%�ȁ��e�T�{#�:#ތ���KY�R�-,�LO��Z���4M|���x�cTP>,g����bƼ����ڲܯ�D1����^���֚�p�B���;��2���x8���R.a��@\n~ �={�����p98W,��,+��{�vy��-��S����I�8Z�����{<����O�S(�f�ў�Ҷ������r�w�X�暇���ڌ�܄�y�Mh?�\0����^��R��J;���3��IjL�4w���b/h���u�1]#�h\'ᘳ���0�\0h�կ�\Z!֩=�\\s���t�Ed$)D��\0��iR9�^1�V������ae��Aط�����df��	IK�-z1Ic��o_j.Sh�f$�#�S��]ⶫ�B�(ZV�lϵ�)��0����C̹�o8��_{.~~����\0JXx�c��Zf-�V�ْ�a�wQK�bT߹C����D)�+�}I����>\rpyx�Ye���,�p{��E�I?����#\r�\Z�_��R��J�s}����\'�V&�!Kz(ŀ>@|�{��7o��*v[��L����\'�\'6�$���e�Đ٬)�����{�1]�\\�E,L�o��ɀ1b�S-�-����.�e4�*� ب\'�G����N���iQ���;�\n�BTA��x$t�=���0���j��(��|�>T��֘��|��`���X[��_���{��\n�^@�|�i��\0b߸��@0�V��Z�rO��`˗�HhVU2r��;iYM��Q��x_y:E,k2�s���]CR�o�|��ĥ&���bI)PW7`��>t{q�^Rx\Z�P��5\0��,A�5�gV���76�Q\Z�H\rG f��v0@���������)��kV%�M4��;�V�,]$���SMt��.�E\'��~��<� K>Ig)�W�N1�wq�\0�o��ܛ�]����\\����lc��5��w+{C��lH�>��Ȓ.aeT\0��V�,���~�#%SI6BI��0����ˑ`����:�W\nqs2t��S�A/D%�\rg��M��g�R�6u}��N����_ܯ�莙���˖��J����p�25�PMn\\�G�~�S�%����}��}u)h����5�R@��H��C��5`B~3����^�?]��Q�c�F?����/���{����T���%+ruʡT�^��rw����7R���+����� �v&�o�6&Ѫ���XU);�\n�Z�荠ԍަ%\'0�hPNSq�&��ƶ&+�e�)x0^�ϖ&�Sо��-_铒Â�EZ�\"�l��9�ﲽ|�<Ϙ&�a�Ԁ�w{��\Z\rkd�c�>5߻3�:\'��\\��rP��VT�u*rI%����!�[p�U�����-h2Ե4���䐐�4\nH�,�L}Nx����P����>��#Օ/1Q_�\Zx6�*`c��Sɪ=I�����&ЄQ���CJ���$R�Ǒ�\"բ�΄bFo��KesK��`�trQϟK�{��?ħ@�LÞ�iI��G�-@�I)RRhAb	��	�̚���G��oE���o��O�c�͙)HOY+�R�����\nTT�y(������Q�M��/�)�$`�ɳR�}b&�Z�	�d�e�fP*9T��qDZ�i�b��$[�t�F�3�/!����e�)˗��0M��Ĭұ>�f̓�êdሕ��-`�`̔�L��A	.k�5�#�oQ.{��>t�nRq���ٳ	b�%<�ed�b��X���f�f��V��EM���71&\0&fYR�wZ��uv��b��Er��HU�f�}��+\'����PW�gS��(�a�;���E->�Z��ʌ��f���%s&Kę�*S)AA*\0��?ܟ�/���i�5?��s�ɢI�6b�7L���$���K�S�\nR݁\Zb��<⮑��C����	�eN�*N\0���h�\"�J�]��s({z/���g1h�����l�2bs&R����@%E�I%O���^Yc�#)ZF��6d��0�f�\\���TH̄�$�\0d��H�^�,�(��*���(���%%VB��[�r��%*�[e�*:\'�2~?	��6bT�*:҅1Jg)D�H+K9j4n�\"Z6�q]#1+��0�N`Բ��Cf�9���Ih��S�.N���E��>Q���Zt�\0Ng�\0�$��%ر��F������$�$Giޜhc��^ؖ9��}��[|Q�);B��nע;�e������:�;���BǷ�O���zʀ��¿�_�}�L7Bq��&��O	����7����\0jG����Z���������`�s6O�o�Ы������_�/���A,�	Z����w\'�=GI�<ؔ���\0i�q鳼q�f�j�i|�ju��7B��σ���?%4�It0�WX��R�7f:�\'۰�\0�������i����Ԑ�ʋ�؊*�I7���>B��L��f��S6QVjT��@�۝,�lj+��vM�,15kUN�J\\ɴD�t��*9	4ԖK��!��v�+�M\\��RM\n�R���ϧ1�ұ�U1d��>��4���hiF��H���\0�O�j���~p���v\r]�ӻV>����?�����}h�S9������h��L�I��!\0��a\\�Q�2�\"��0�=��+4ƒ>|���K���\"�p\0��-�\n;�5�?�M���͍�]f�q)%��#p���T��@Z��	g �OmS#>6G&~����\0f�KO��z����\\D�L��������\rB�$�����H,����ǻ�����\0>\'\ZM�4�����=��e���9��@��(F���\'8�^O�����Bxf�U\ZO���GHM���y�\\7���%��׳�w�?��G6��W7M��%�9_�g�d!T�M8���=��}��`pMe����XV��d���l}�V&B�:S�I��\0I\n����_�Ci��ه�kݾ\"Z���g����QA��B����-�<}�z��\"ARUձ&�j����6��W0���n�=�R��Jt����;��H��4a_QG�&H6�S��쐒�5Q�?MO�$��Ǒ�:��Z���?��W.M�垁*& H�C��%��쁚��et+;��\0?s�⠏C쾡A�������Č������ū:t�������P�\nNSQ�2�j���͘�E,Ѫ&.J�t��u��D�!&J���\n�+Rаr�1�2�\0�)�F/���uq⤒*�A�/HN���;%YĞ��)2�&LϒRV����g��<ҏ𣡍Q�{A�!s��-I��#�(&a��%�K�X��Pꪜ�Fu��>&��=��|����%8u�LJ��(�We�C��M�u��C&�fg���\\�f���@��UW�@KkWP�ҋr��M(�GK�������B��ʖP����M�	4���I`x9�X;�%�\0z>�L��̤aEIVe��K��K�w��(�3BT�l���(BsJR�@:��(*M-�%n�����m�N%X�\Z�S�`[�����h��.	r#$ӽ\Zc�H���7=r%H3B��gOQRޠ��S@\n��+��1����.�o�H�˛\"`��13VJ�`S�	ME��\n�xJʒ�¬`��L�\'&[-`�((Iz��j�b���m!��{��L�+��D�rS,�*����\nH!AZ���ş\r�|D��ݯ�_�L�0��f�2�B��\0}ԥrTt\0F�x�ɛ%��ӱ�;�|�KO��L��¸��h~�q���D�t��٣N�9jR��:�\Z>5�Oi�ǞQw��e����W�����9����c���EJ��\"��N9E2��1��c�#��蘓�R{Ң�����.�ռ~,�]�t�aU����W�����Ј�\0�e~���ïkA��W>�Q�t.�ZR���>�[���~�ʲ��>/�̝�L�8�j?�d�\0�1�G���������I���ث�K\\�+�9~ݯ������+j�����O�E(E�k8�ܵ����J^��F�R�19�mp*�b�p-f\"�F�$;U���\Z�.X�a�?�0t��.�d�@f4�X�C�P`�WVQ4�5��\Zh�$��J~��I?��rjt`>P�b��tB�Fv��ѽ�\Z=�OVqb	\\ɒ�����.^���I�I{P�����F?���|���\\�ep}��y��2��,�ar�қ}O�*vY$��b1i?�C�hg��{��	X�S�YN\\��cg��p��w#��g���|&�����u�2Z�&a\n4�;�����9FG�Ola�_O�6��oOgF��\0J����F�S��k���iE����෭������S)�\nJ�/Z��P9,���ŅEG|�ٍ��g��ү:ש��O�fn:t��[�d��\"�T�zG�}���8+�?+uW�}���\\96��C�ãT�O�N.<s��Κi�28|I\0���*��Y����fB)X%��2�����\0S#��}3٦1Fjg�E#�Je�(�D�\'6n��)[�*P=�ͻWA+V.GH�d�:��pWU�&�lْ�UUe� ��J�l�ԗ��6�Go��̵���C=�]��-J����n(���+���t�hh��g��{Uc�C�!�5�n��RT��f\0�\rA�\r�\r�����$�h��N7���$�J�&`�1����Չ]^ie,���(��i9��S�f�&>�Z0�5�L�Sp�*#<�bse*Y\'9J�����FDfSf�O��(��`��c4J	�53\'	�\nI9\ZY�1C1��\0#�s�K(�^H�t��B{G=i����Y	L��JUՅ)RY/��3&]�/L.�T���=��%�yR��pC�R2gebRr�J��*Ah�ʋ�C{W�rq,��R�KA�3!=W�X�C&��T�Z�aj)��Nf��9�&�JJfb�V�s�)3�� �+�<���9^��=P�zĬ�B�R&�d�-��(IB�C��5,����z�e�S%�KX\\�u.�9)\0�a5��*�ka�DQ��n�+��AI��R����	~�3f$�GS͒Sc�/S�/jּJe̞�2�.d�*jB�L�D����+%@ɽQ��������#�(�FpL��R$�J�1\n2�ޥe-�!k K\'�|�I�1H�o�{}^$��,Lu%)�؄�X��(�L�Vj&N`�� �������	��,�JS4��H���B��Ցs\rPz���\"��/M#x�+1Rʳ�b3�\"b���\Z*��Sv��N�^6�ٞq�3�jM��ʇ�qmy��b9\ZǺ0um��v�e�^��)k�e(�-I$���G�=���^�<�)�����zOz�t�X�$������#IK�\0�1�����$&m����\0�/�sӾ�e�B��$\0���j���/�9���\"ӽ]�s{�$\\>��F��7�r��YYSv�P�U$��p<s0\'��Oe��i)$���f��\\=5����j=�\'�\0�����<��S/�\0\"���^�b������ږ�\0E_���������1%�*���\04o�����)�0p�V�M����M���G��:����_���3�I�q�zLm^�˚u�h��4`�Z�g?�C6���nƱ�����s��_�ǱS�Ll��b~\"R���`i@��%�^>3$}=p$I;�,4RƖ\ZR�ZAN�Օ��\n$�rfP�¥��6�ڈ�y KS��a����3]⭦B�=*�\n�ME\0`SB�0bn�9\0Z�J���wsp�������cٷ�}����etV�������]pFy]H�J�+�yI>���ǾϦ�\0����nή�8a̷��z���0�G�����9�$}cJTe����S.��2�n��\"�����5��E���\n�F��J�Y����0���:�_5���ly@ꔕ$�Bs|Fc�JEB�Gw\0�*#���n�gн�������__��n2:zj��asT]j�\0�)p����Z9�貵L����يE��o�����T�d���PJr��R�Vap7K�*�f=�g{2����y����>�����}?�{�T�<�������V$$X����F4����\0	y�t\nI�c`͘��Hc��G���H��@\Z�E��q#ȴSlВELR���.�Z$0EG�@���\nC�j3����=���;e#��-��j\nS)K�n�Vsc��_S��H��:<Ε�(\0�����e&z������Y��3!Ȧ�,�Ƙ�Y_�4������C\n��aIR�ļ�i��=Sp\0w7v�����윒\\��~�i҇�W�~%𪘩y�I�e�+=a ײ�\\�pR��\"�{\"I\'bG���~e	��2�)�I�r��3%9��R\0��>�Y�\0c�r�����P�D�d���	=z�4Ļ%/K$�2�I�T���m˃L:�󤣶hx���\'��s˜�J�	I#=AH]�2��INV]����Y1�6kS_������F\0�$�I2��fF%��rIb�hIe]ݷ��ŏ�*Kɭb=�b�:j0�4�d�3�ZB�����RT�D\rI\n+[�r�uY����<�eKWP&N�5%J���6�J�RVR����h�1��sޖ��e˜��a�ȕ2R��~c�X��vn�ڑ�E��5�i�߲�ܭXU�uA΢�<��%�@u���C(��o�i�b4��5�f��M�ժf2�O�����L�0$PfI9���u��*P�:����c=��BK�D��qKRfJs+\0YJ��K��(��\n��U/o^L�@{�����_fP�%�*\nD�H��= 0\0�s�P9Tb9��u	U�粿��bQ�\"B���afK+I����\"h9t�Gh(=j~*�6�f���oHM�uyP��#���&Z��	˙�&bOaV��I���#�.n�]�(<�u(s\"4F�͔�)B��7̘���&���k�y��;\'�fS�+t�����]��\"��גS�^�\0���\00�I!s��b��8�F\\�B���ﺌR�MX�T�),���ݪ���cm��t�ܼ2��9��K���	�G�p${��h%����E��K�_�e�@�\0ܾ+@����X�^��H��7��1mi�\0��A�R�t�+��-ܥ\r��|��-Xd�].C�{��T�r֑�!��7.\r��Ï�(ߍTRfC��@�T�\Z�&��8�G<��)i�Mwc��=����|#��o���\0�G_؉��7��\0c�)�%3j�S�l���v��kugӶWU�^�$8\0��@����2=��\0�3�j�հ���/�l�AG#���S��Q�=\Z#�P��nhr4�Z�o��xR`4إ�\0�j�\nTC9и�X��!T!�,j;G�\0l�g�Jz>Z�%y���d�TANIi`	IuI$���{�N���|��\nR��V��ئcӪ@�O�=rG��˧���a�����V?x��2��I�e�5JT�ex}��ǆ\'�2r��?IYLwz�xN�>�1e��{\r;����`<��HÖxo�|E�@�u�	|����1Ij��6���p�&S/e���ͣ��!h�H@�@H~��1x��-�E$�\n6l)9�P	4�G��Ґ�\0>�����m^�KV�H�Q�\0�͡{�/\\��D�Խ�Y�?���5�T�%�f���\\��\r6�(ˑ%�]���f���\0B�ْ4\'B���%��L�6�u!Ӥ�+{C��ʙ}�3��3�vvZ�w����v��9մs^���b�]]��g!�\"j]�g	!4#*���5tY�\\��E=WKp��X�[\"�f�JJvk�Dzŝy<�����:K�,�ə4O��P���Y4b�\0ى`\\�!�T��.�^��o��gZ���4�\\��f!��-!I�3�M\\�Ƚ��\'s�jQRh���2��2����S\n��I)��\"����������M\Z\'��~_,��͘0�_S-yBe��\0����	�@����;�]\Z��Q����>��O���J�52RD��frHYQJB���v��-�\0[�uה�m+O�w��9-o�����:���*d����Y(P� ��*���1��_��I\Zg5H��=�j�\'3��Bq)@H�L��������AK�F����i�R��\'C(�$l��}��ԙRԵ!rfK�\"hF\\�o�C3�P�j��^���(���R��4���%��\n\\����O2ӕc�D�,�p{J�\02��;GM���z�I=RФ)(#*�\n�b��,��2��\'g$����6B���xD�^#*\\ܦ\\�hL�����L���=�ب�\0\rz�w������I�����/��T�!/<�+.fXP	�\rT�f�+p��c�_(OC~\Z�%XI��M3dLZ�.m8M\nBe�ij��Ԥ�r*���iݖ���~+��\'`יK겉��1)#�̂�)��c+��)���I�U�/ïP�4эY���+6gVL��fq9(�f��Tԫ)ZT�B�N���fyH�\"rr�>��t##�J��0 �D�D�m�V%B�ƣ���%���乄�$�L��q�q[t2]��\"IgF�C	ޘ�\0Hb���<�|o���Gd�Gx?�b9/ �w��;(�y�P���\"e�F����O�EZ,�����5O���$xSxu�;\rʶ�yV-QE\rخ�:���U�B80FB�o�K�\0=�Qbql�\0q�\0�������+�ĥ%���\0W��r��زǭ�߁RpS�$�Ce/\\�b��������.�h�{�S�>_�����v{EZ�)�۸�x���>��B�%��6z�H4�i�.`J[�(��kP��,V>&vz;+v����R�8�;�\\�0f�r���[��T$��nj	G(�NA�W$ȝ���bA\Z�.�N��.|v-Rخ#��<W^�0{��;��ع��6Dι]V\"n%I�Ő�*B\n�rp�P���\'�2%�F\\2��7(�t��2��7*�_�=x�l�}�3tl}��!�f��x��}G�!��6v��ɑ\\�/���b�z^�U��g�lpD�\"�j��}��ܣ��?��}�2tњ�{\'��:��Ҟq����}�����Jދ����WQ`���#WI��\"����Hp��KH��8�ԝCXF�	Y�NS%��ˠl�� Q�46����ru	:F�JR�/`}�R�EL	4ag��r��.��~�2Ԍ��㸙K5	)a@��]��\r{����>�-�fg�_eʖ8!�+m�>�\\��|LS������Da��&�\0%&aYJ�d�d��iQCP�˔��X�#�FJL��f71!A@�� ��0��YJH.;L����E7���quQqOTj���2l�JVP�!Hp���$�sQNd��]6�s��us��RU���H#����(eT\Z+P����4C;��34�~N���D��S1���D$\0\n���� ��d�mX�8)D��_�О�ᦕ�Ζ�	tl�P,{��\ZZ�q{�:��S���\Zz�-N,����������{�1���$ �K~���^R�1�B3��W�%t�#Н�Iz��2�D�H�dUԐ�̒C�c��[�;WL�>��VU��;��D���P���`@p�,��ڱ�VwTע)��\0X���-��F�ٯb#V���%v�\"��\n��\0N�;ZM�t�1䊊�����Ficm�*��G�=��7ʯ��_��&l�\r�L�e5������?�%a�AY�,_/��[��F���oe��*�Qc1YRL�\\�*���Ӵ��5�Eؾuv����]��3x>�R��m�V�J\\)π��}��Ï:����\ng��K��ޢb����N�Ci���?�ygP�j1�\0�n��T�\Z�\0�C���a}\\S��\n:*i�E�J���\\qs7f�u*oX��;�u��f�J�r�n�͇�SҐ�[�_�Q}Kf좽ve}#�r{rѕ�8�PVd0}�l�4EjGzB��_��@��BNLԹ�F���،��E8*�H�NPBj�v\0�.��j��o��V���H{5��k������E}�7,���a�?P�\0�[����_8W����X^�Y�M���99:�Vo���P3�0�|ǙR��;��6���#I��5��1]IrM,\n�y�l���f�Q�D���l���2��[r.������u�G�9���N�����e���E/ʆ �I��G�����Ó�f�C�Pg�?i&�)o�Bd}��cG,d�X�;�E\\��y�q��ڑ�}bR�#ge��F7�M�I/��4�_!l-�jF,�ab�u	4�#�@�o1ؓgz���R�4�f�fu�e�>aC�Ifcc����\0͠�|���]�q�\'r[`�h*�:^)���P��$�;/�j�Wf�5+�#�!Vv%�k\"�9S\0�Wd�,hpZ؉�qk\n�?qp�p\0r6���\"Xɘl�\0�A��5E�����ʮ�\Z*Q ��S(�j��Ϧ�\0��&oF�� +����3f�)5p�;,��y,�`�G������0	\np�c�2IU�x����22��٠r	��,��#����x�}�#�m�>�3N�\'HX�oasH�#�K�GC\Zq2Mى�t&l���TV����\nF�95Vg��|etQ�\0����cM-㎹.r�b��qD�o����M�WC�lA�\0ߏ,���<Qn��~�t0\0Ig�8��Gj\ZT0rrxE�V�w����͖_��RE-���p�`��Lg��ily⌴􏃦�G�*�ek���b�@�2�<��U2�2	A)P�\0S\0��}D�8~��G�(�F���ފ2��X� ʔ5R��\n��-Xg$��VH���vs)猪q|�,r�f����9��;�d�	�NL�2�3��a�\'��-��P��L�1ʴ���-��z\Z#�ZfS�}�t|���\"zֲ&����l�ͣ�}�R[9R�Đ]4VG).�&���\r�a��^�e�HJ�*L��|��iKDΦE��(!r���H2��H	Y�[D�8z�6�d}��ދ�*q�e-_Ж�	�\n�`��X%�W�e,!*s1sH�BSC��*H��F;;f%9��TpE\0ޏ�mF�CV�|먖>�0ţ#�x�k�&Y$�IK����y�ʁ�����O4��C��ԱνM�E*!�NDrk4�)ɳ�$Q���Pr�!�\\_pn�򁪞�dЍ\n�(�\nX�^�\ZT$\n\0�T���sJ.���1)+3��}f��wl�%\\���r6��\\9 ��Oe��s8OGS5(��a@Kr�Л6k5��|1u�Qj��O�NVl�,{�I��]K�xwq5mq�����v�,�Q��-�G\n�S���}�A/Q�C��\0hܽ�8G���(��rV$0\r,��7m�,XT�\\�^�a�qvi��/�����B�a������LQ���~̈́�s,ap �u.���u�SW$�yY�ܙ]�t1tч�����?��ǔeǑ�8�7L��=K�O\Z�9�x͘TtbF��/�rdՔ����\Z9r�|��Z!Xgml�$�c�\'vU�\n�*L�}7v�;�����\0�y%ؘ��v6\\�(x}�<�3�q��yh<��#��҂|��wC�VǇ��>՞%\\���\'��~�Jy�����b�a�hvQ�cf�fƌHtzT�>Q���	�wb��C*�r�~�\0���k�5�\0�\'`�~��:�N\rkA轟9T���$��d��\0�.\0��w��rz�`��Q)I��;�w6\ZكC\nTܦ���ӴGҜ\r+m\nWL�$e˶�V��ԽΆ��S\\�@(��,��>����{\r�G���J��}�\'f�\n%��ݸvCpf�(���t���}\r;���{�ė������q�F�/ɕH�Bз�!����׋��̮�H�/Q)l�ҝ3�˝1)yxtϘV%I�\0�:٪�D3\"Z\'L�N@�tw�j���t�u���7���x9�1��X��M?��)�LB�(��\0��j�$ �fT��W����?h����\\�\'�q8��3$��I�p�)\n�?e��\"b���	��9B�r��޺��[�3\'�HK���:+9S��.F��:GV��-���%#g�\0�d,	y�ˢ(Ř�{��c>F�\'�N|N\ZR��{��k���2V(\"i�0�\\�S唡jΐ�2���7ApI֊���?$�iĉ= �������*��~Qs�6Reb�\"wT����`.��v[�π�n�>��w�Jh�0�������0�����%IL��IRIJ�%ԛ��34�*��~8�p�W��f$��)�Fsj%$�C\0Ǵ���u$�WQ�E���ޖ�k?�\\��)��\\�R��s�B�p�$�u2��g�V��|1b��*ңU���\'����!J��TĨ�i$�]R�C�u�$�y��d%�N����ǂJ\r>P�÷H��	GT���`���r�G5\nVy�RZ^@��g�H)\0��d��Ҳŉ���l��F3	�X��L���(I딅�L�\"Z�&Z��eE#2(��B)y#<iyVo�e7�iXvX�	­��r:C�)�:&�A(!��Z���b�_���_��7�d}�{����9R��$������T���31	JFDK�S1`!S*�q�%��Ri�N{2w�~e!��rȂ4$���9��W�6Z�\\��s��:!Ԓ�b����hm��ѯ�d��詈Z��$hd�b\ZĤы���g��M�U%e���sEk��Œ��\r�1R�2�+1�S���Af&�MOh�ݐ�z�4�dbΛ�2�献Xѳ�nQ���m�i�tc1H�K�SP�\0���*��Rc��y.G{��P)LY*!��Z֣f\'�R�\\e52)��2���kJ�֍��PsZ?j��*:�$s�#g�}P6�c��֝���f�yDX����y2�J�=���.2M�a\0�\0\Zm�-\0s���F��$Q��f�P�*�#,��ER\'	U� �v�����44e��q���&��#��#���?3��\r����I��y�����<���:�a�\'bN�v�\0�4\'�����\rI&��\Z��s�� �T�%c�cI(�X*T/$+�� Z}V.g��]\0�=&���)��Q�?\'�x߫\Z�\0�Pw�E�p��|h��Ԑ3(U57{1zhkh��|R�\0�� ��A���\'}�\Z�E�3�@I9C�Y�+�\0��EY\n�Q9�Fd���g`i�\Z\\��DhR����\Z1 �j1�p�V,n�A�Wh:�\n���� ���\n�81�75�����o.j���{y���?�ϩ$�4g�Ь��0�#l`�3�T̾Q)�i��oIbr�Z�jI��^�����x�#������,FEK�+%s0���Ą�?�1�X�&l�baN\r�I�0��\0z��6��\0���\0?�ZIl�b�Md\"wEbg��*t��z0�-\0�N��]!%X�Q2��fK�J�zɳ1E�24��C�.=퟽T�^\r]�R�9�\'\'�x�PZ����/��*X\0�F\nh�4ӀR��\Z���TR����t�x�1���?�S�8����@����^A��\',(�\0�\'�0	VU��E�2�����i��~�_t����ID��20����4��a�+�\0�)�c:#+��D���L�K\\�Cɚs�[������or����\0>���q���^R�H���+<O���YBZ;} etJ�t�l����\'$��Y�t���qN�i�s_���1�o������:G�\r�;���bS�L��Ġ�J�Z��/0�����Bz�ϗ���$���iIՃ/|RKw�ϯ�_PKRm�oK��7�n��J�J���\"hʴ� ��6W�݀U�:l�\nߓ����k����w�e��S�\"Rs(�Y����Jsfs��n��Y��]���L��/�̕�\"��2z�����,��)���BT&���ʫ�e\"B����<m���������38����)%8d��R�:�y�g�3z���&1��̡uo�b���^�{��&l��z�&VA5S��É�n�gjd�$)Jʙ�R��7����4G^HO��y��sq�W6Z�RT��\"~r�i�&)EC�%J!H�P���&��/�~K�Ȓ�	��K��y�dHJ�͘+1��̚V���(r	l_\'r@Ɇ��H��ŕ)r���T��nY�3p�	̉��\\��֩Hq\n*��m_\rpU��a��b�IWHM3�v����V.e��$*d��V|�iI\\��\\y��n��~����ݜ�	�\'��&�d���f%%)+R���r�(J�]jI���#��5C$��7���3�̒��?�H4P�f�0\0��QH�R������=pw�~��\"�;	��R�sak����\"1c�L�5��VB\0u-��]*����=�Vp;բ��s$�\rX3\n\Z�������\'s=#H����{�\rJ��Tvs\0��;L�D%y�\0{��P�J{Gb��)1������\r�+�_1܎zA�o����b�Q�=1�ԏ8�$j�	k�_���[��F�HGZI�\ZS���)�(�\'���V��~��q~\rʶG��B�)\"��㓱nQ-�]��>w`|>E�KF?\'��	�qeL%]��\0$w���I��+��nV�\0+�\0�bE\\J��}��(8���D��1O���L��:�VŮ%����o�Eȧ�/סvY_q]w�\0h\rD�Q�}iˁ��S����۫󚇰�=^+i8�a9��@!.���_$f4v�0[<�\0���v�@Φ�XhL�\nv+*��o���Ԏn���\Z�R\nT\n�Ib�õ���,�\nQ_F���,�w��\ryY�0�9�D�	�؄��t��\rV�@fM\0������CH��}c�I�8�����g��\0;��ք��~���^�2#/,�y^Ŋя��\"j������I�{8 �1E��{���x�?3(>\Zz�>ss\'�§�����u���9sV�%)%JJM=���O�\0��\'�}��(����vL��rЄ���f�\0��˙GVJ@���cwK$��\'ɱ�Ť�)%Æ ��n8�GUN2\\��ZG@�J���JV��P\0(�\n�]E $�����`ȧd�Z�22��P��~�q�}+����LË����$<�=oG��G%J9�a�$�T�K\nWRK�Z����n�7ǡњ]��)�\0�����z�&LԱ̤L�RL�������Pg0�D��<�P��G��V&T�jdH��L�(�\\�)d��)P�,�hO�u(��;��\0��P����tp�&��#��C��.^�|AH���(�=c�8�\"�H�ҵ&�:�%���L�i�\Z:��$c�דc��fb��52�)�\'=S��3e�Hë*��)dr�AS��q�uK\'{W��GMFy%���G0�[�^%}�����dc�)$b%�\n�HK�������U,��p���:�JQ��[E��2��Fw�/�3gc�+2���`�,aq\n�*t��K�d����!+$����8̹{V9;Nޫz���et��>S�t��PKew 泱 �rM��ɍ��ȡ~���\0Z��Vs�TΑJhoO?�\Z�T�y�\rs���]���nOI����q�S�\Z�ӭX����̸$����XKN\r��p��Z���������z���\"�x)?�\n�P1����b]�!<}�=\\ej��Um	u�(����r^��\\���|_��Ns���q`c�&�\0�܃V��@ �G\"��gJ�c��$�X��q`t\0?QI�ƸCer������mN��@-��������� z����EI��z�(�/�\r3}S��ERe�`�nc&FA�Z��לT��Yl����;Å���E\r�n��EPx寎WLa�Fُ�z����S�=XE�h�Ɋ�O����\0{�6\Z6��f�>ȱ�l�7�;��sNLK�\\�0ܦ�QY*�8v�l_J%5R��K|�q�A��H�)�%)^�JU��d����-x&�2��R�������}>*�����g���D\'?�^�E�TV�*{C9&/lRj\"��Z3��\"H�\0���Z?�*4�k�8�����><�\0\"�:��j�!@�ڏgj�*:h��Q)�_��.TC���!�0�T9\0;a������ݢ�qӊ�J!�2e�.��]��D����\0r{!�r��x�s�%\"P�Հ��In�eՕ��٬�r�Fj�o-9BW�\Z;��_Л�a���N���ҍM�PaQH��S2=cDT����ϑQ���H8i�)L�R�eH�]J��9R�3�%�-���_s}-)ȗ��= O� �sR����JB�)SֲB�d�A\n	�/B96w^��~A��\'�\0�G���{�Ij�w폲iJf�$����I�-s?\"B�n�,�sV��ց192ҙ�ĥ�P��Ž����K�0��/\n�-�b&�^ O���ՍD�Х�9;0-_�R�._Z��$)v�����/g�J4��,�+�4��Vd�RְTU0�X��A/�D�\\�7G������&�6Lw��RVA\ne!�7��Q�(��%\'�>���\\�>3��J��yS�	(V3��b:�\'E�%\"j�6x�9s���z�X�+)D����6�ږ�O���ޖ����RTIs�+C�.l��f*�o�]��-,}����w�\\BRz���R��Nw�;�Wt�,�A�3�B�4%�-��N:L��c٬Y��L���&@ �\rU3=��Ҳ�J\nâ��}����^����^�!����\n^e�\n��V|�\0�=a2�␚!#�	*du���d,�\\�O�}\"���RS:l�MD����Vd\"PS1hNP��(�%3�T(B9���~N�s�3\\�w�*Q7!��OZ���M�6b�*м�@uyT�a�����Z_�»�̮#�n�C����BA2�03%�T�I���x59ʊ��k��^oil�.�oM莅_J�S&(�~���)Yn(��$�3I(V���%�JRL��Q��C4��+�����s�␕�Ie*|Ωa8��E! M�ʪS�ax�L������j���YE�Y��a�ei���!`�)��Vl(U�e��b�%#�J���%�d�r�;p��#�v�]$f�x�\"f�\\���4ęy{)AR֤���ʔ�-@����0�q��d��c��`}���eː��Z�ܽ|�U\"\\�X��8�\n�Θp�fX@2咙nJ㉛6	M�G�gS2�i��쮔�$��+5SRL�BՑ�ٙ�U��׭*��᳃��M7�=D�YW&3\'���2�d�x�?/T���a�13��.Z�1�X�S1(8ykC%Ev�=}�\n��;vdzt�ġKJ�W�,��	\0!$(�$��%*i3S,J�Tz�j�M���2�M�݄�N$Jġj�>%�L��P��� �)J+J�uiAi*H����ג8�~^tdR�{;������s�j�@�o^���/G�ׯ\\�,�_�I$�y���2��Ѧ-\"��%��F�(91M���L�&�nz뾼<c�z٩�p��*82�ީ��6�t�R*�}p�P*l���˔��	H��w�;T�GO,���ч$W�g��ߌ�)���\n�T�b�/����ze�4�m�^����P��tn|�뙘����eeǉRG/�rvٰb��LH͜z��b��A�餶S�h�2&` ~��m�3E�Ň*�\Z/$�쏼�d�us?i4?�:�شpz����x:�wrm�`>�z�9�j=��AH�z�X)P\n�Q�׫ES\"G2�C��;S�\0�c_�Q^�5\\�1}���TC\ZQ@�S�K~�Hz�i=�4B�Pn�P=nI5.^�&�0j�l�G/�.G&{��X�-�d��E.b���,Y�i.�\0�K`Y�\0�ܽ��c�I���mf�r�*4c��?|5藱�����	��(��:H��X�:T\Z�2IcG��nl�nI�E(����i\Z��$���WN�iH���I8<H&D�r�3w�i�F7�����\'g��2�a��0s0jFʗ;=I��2:±*n�]zҴ���Rre��[��K�0ӟ�q�)\'��1���F��\'���n\"T���5+Q� �g��4�ʝ1	2�Ne%\n�\n\0�-�t�J{�]?�\Z$�v�)�����d�Fi�82p�18��Q>z�SV�� ,~NZg�K��敚@��z�������zd��W-	�Хu��5JZ��1N��\0̥97:\04������}�^���(PN#��%G	4���(�Υ�5#0v��FY�Zf�QKg�;�\'+�:&Y_摄B�~az���#\n��Bց:wGtv|�e�Js�dYG_��Rv���_�]���>��.�J�2�3\0jl�� WP�����s���yF�킳I����r���À�P�%8p����i\Z�恽ɍ��ߤ�3�覙c�5��7\0�,�&��X�u>�,�S�ķl���l(�\0�3\\�+!���_hH��-�@s���v�AUћ3��&r��z���F�K�ˢ��VF=��O��~h���(����*Xe\0:�t�A��\0�щo���U�=���pY��.��Y�jI\\,�j\0*T��O�3����xMH(	K��0)�8w͕˖#�8�n�6�У������KP�2��6Ed;�a�B0u?�ie\r�|��QI�(Q���8e)#&\\�(��?�1�.j��8�CR�@��C�<���ˠz�\\aXbZJ���o��\"�����Yi� B�>���2���k�E�E��k���C�����2R���hF\'W�לr��	K�\Z1��1r(k�Lw�\'�*�K*Q\0$9���cfnR�S9v�8�O{Zg-_=��4v��.���X���K#���1.�Ƒ�*�_h]\r화�%��\0L��\"���1���pY�z·M�;4wZ4ޑ�rj<��\r�&O�ΚQ�^�︋eџ�vc=����Ft��\'~b�\Z�x��ON��.\r��ލ�L���ֱΉ��\nv���z*��&H�9��)?��y�(:���ڥ��nHE�L|}���$�z�SU��v4�W�D���4�	v���w{������nAV;��ՂXR�)S��w>h����*X5Ë����Ȯ���g�I�1Q�G�D�%��j��+�aB�\r�ރ�h�\"�)$Q�-��z;���f#1KB�&)+AZ����T\0R]�d�pC�ǽ�`��JL�>J�$y/I�\Z��\Z2�T��1~�,��L�	K�-nP���ʖr��S-��&���j�{����1x&r�.GI�]RT�Xr�+@��F�g�LI��i�<�\\�u~_���\0�Lb���:+�;�R�~O���d��� :Rs�QlQ��GnR>,J;RD�D+��g�s/e�Q���\'�:NVnN�	%h��kuK���OL�T�҇���`�u�,-��4��\0����燺Zk����H�6f!Xt\'�:nz�iX���L�77���fZ%M@K�J�r�H�>�g~Z���Tk��8lP��1=l�#*-\'\r���VT��bq2��O�+��)sզHHYLa�,��������,�N����ͷ�?�WEI�<L8©s%�̵tn=�\'+���c�\0Κ�?��i̐����Ri}K>r���G�혙��*V:�q��.lŨa�W��\"X\\,����:D�J9�g\'*��ٝ��ׇ�\0�����\\�|�k���������d��Y�b*ݓ���9��(d�2�M*��������Ul����J���(���R��6R�X9�YZ{@�JG���!�-���ʒR�ƞ��T!Ye#�!ea$0B�\n�Zs,�^A-�d\n=bIS����4�r���^����e\'��\'�b�NQ�E�Ӕ3�����))i�\r�1��q�SiR5�{C�R&���&�����L�曋�KLז���R�t�c��/T�j|9a��n���ۈ��X*ÕI�-=Fp���1E�J�a�&D�낐��Zɮ?�ݎ�t�̕u,�*fyIC �8���K͚Z��wMOƜ�_����N��l�a���	I����QZ�-AKn�e�rU$�M��x)�%`1!x��vnX�Q��{U���\r<%)(H&J�� �A���ؔ�.b��,��*d��5(l���̟�Ι�I�R�d���:��.Y\\Йk	n��1s�)�D��BшH>��;u���r��ۣ��I\nI\0Ո*�1#�R�+������B+�%E!&�)�S��(��|,JI$WN�)�q���;�)�� \\�PEr�;5o��+���ө�/\r=r�Yɕ0�P���+�4����/�#2�31�`��g,ܛ��{����pҦ���RԴ�1\0��\\6�IPT�>�	d��a�K9���.�\":[އI��&re~QU�S�R�e!+ViHT�2feᖄJLޯ$ŀ����o��A{��v�3J��N ���*r�IVA!���KT���Zf�C*�Y�����c�#�6�`=����%�^R��:\')d�eR��d�6\\��7T�0P��- 2e¢���6�Q��wG*\\��e�$e�a�\Za��v	C���8�_Q��X��-~�#,�9.KEb_B*5�1?I-���cޞ<8KUj�\n���G_ٿ4�\07T�\' �KBSL�������t�g�=o���~�0�\'�($��)Rj^� ��x��(����I]SQÿÔ\rx,�/��,�=8EN;`� \"��,�@���\rbČ�6΅錋�0S)��X�6>�4*�;;�	A�CEõ�:�W�Ҏ�-��@b�{]�+t�����\0�n��8Jg��\0Z[R�����wfʻcO�GO����k@,�/��7�=9�u�	�ƮK�\nQMrM���^��D��!�65�E���r\n�e���Rp�FT��\0�ۜ4v駑u��!V���^C+ũX�Je $�é&�+\n�{�FE��zGp�wo�OJ�f�)J)@�I�\0p��,���ڱ��s��\Z<+��my>�J�љrd���\Zb���\'��| (�6[�\r�|J�=����1�xS�B�W6^/\nV�+\r������B�\"r�52��L���{�i�.�s��S���͕#�+�%)�$/�XI	�D��_�d�K�3�F2Fi�$��J������\0?���K�\\���Y\'\Z�/	��KL��\r<�q=!�t�a�.p�n��7 )���=	_R�ITԮ�\0�5\n_����j������g�0�D��8�`�\0��K2GGt�-.��3\'ӿ��5*��&V;��͙��f���������;��W�%�Ԇc}�8\\$�%ⱕr�\\:=�@L�`�=��fO�<ఝ!�2L��RV����&�<�\0_��R�W��~��\0uV�����}%(bp�&��.t�X���(�\'	ђ�!J*��9�c�p-ek�5����AT�!s%Z�t�k���Z�Ʒ���gC��l�&F	)x|\nZ����ϛ2ku��Q%AS\'�.�H3O���-%.�R���1^�������2X\\��\0�Q	�RG���\\��:^��Qg��qrG����\"@�!X�9r����_S%�$K����`T��\0�e\'-@R�e�0`�����7��}�\0N�Z�K�&N���Ȝ�\"d��gW,�!k&�JAU\\�JOM�p`:7���\0���L�qr\'a�&KJ(��I�Y ��Se�vP�R�QI:�Ym��i_���q�V�/�I@HXb�j�-\nA]�,/+0�	��rO�Œ��\'�#���4L�3##���\"d�ӥ�-	r�HR�#���j��\'��������G6OM�\n��NV\"V\ZpP�����&K	5�)]\\��p���R�+�����{M����^>Q	�c/��ի!T��L�S{@g�K|���|�_N��o�>�^$�u)\0�v%�V[1%B�ITh��ݙY���\r�jܐ;\"��lMW�I�͸���($]\'14�r�4�{F�K3S��;f�yoH\\���=�bH\"�)Y�L� �Wh��:,b:2K�\0�P���ǲ\\�9��R��Ȕ��1n:2���\0�\0Q�L�4�Xp��[�|u���J$b�d�.r��4�-xYi��N=��ʤ�%$$)Ip*�WѫT�Y�u���~d%D6d��@�|�8��h�E��,?�d٢#%�]э�4ř?ˎ�_�-x*�j��d�Py�\r������Zb�ȫxm�_s�*)�2p,E}V2����%���&��E}�)����������3u{�9�&�M±��YD�F���=\0��?X�>S��8U������V� ��짶2s5��9�Iw�r�d������&OH���b�ܷ\n��1��-�kf��?OI�e����ŊOl�<�h�d��eӕ#l\"�|���	�A�����$��O����H�K�BW,=Z<�U��:�wgׄ��<�ΐ��>>��ҏr�J�rs�l��\0gMg��K�꣝��Q������\0�|s�Fd�A5�C�x0�SW��L��vUP���8��%T����P��hs¬H�U�k�kh*�BT�K��&���ƄU�ꅰ��j�We��\\$0��r{����ely9TjE\rK*�����?�R��� R	�c�o�\0����/+]����h��+�M#\\\"�ɒ�Z����0��:$�k�2���r�-�v\Zz����,F-X\0�(�\'K�.���U��r����я��T����\0)It�6�X���L!4=�C5s���ҩ�ҡ\"��}���(RZ�ɩB��gBe�1S�)��v�RMB��NΓ\'���c�G��G))�+�rU�L��R��!(�%�9\n�HB�0L���f^�c�d�/_����*�K+�,����$b1Sz6B�(ʔ�:��)j̒e�<�g���B^bT�,��5EΔ�#=8�Q�ᔙ]��%���6\\�R�u��<��h�Q?Z\0I�E�ĝ�\r��Ԯj����O���\n��al�+��U;� (����p��	,�ZfK��Y\ZuaP�t��R�OT���/�S*l��eS�ߟT�9�K2тNUUr�1\0\'���s����z��������`�*l�R����1�RdJ�9JD�W�Z��T%�2Jz�F[�YeS�I�{��MP�3�Pe�a�r�D�)sq2��Κ��(�f�e�U12��RԐ�ɥi��Q�����e�$�WW!O9F`+~�B��r��3�-sHHM������74�(�{k��Rp�lXíh��B��eʓ)�$B�W���I\'5�Pi�L��2�#N�1�-���s�IT�K2�e*�F1y�J�J���\0Η%EI��\'H��ѫN��-��\0^�bR��ԩBVyI��R��r�Zz���1	It��f�x%�Ki���rd:+�3�[e��((Z�i��0&b�eZ�36l���\'/l�ٲ��V_�������.d��ĥx�U�\0�12�R��I�40�^^���zΧ5:X�4�~vd��u�	\nX��ը	!Zz3��o�o�P��!R&��S6q=V\"j��A9�Vj�R�T)((J�:�Ց��o��� $\n\0\0�����o{4\"�Jׯ��H�.I����%E�2�]���Ψ����N!�G(�3��!\\�+u���\0�=���q|�fa@/��0�Ģ�Bm�h>������0��B�͛��u���(������_�VT(�q�2>�?�g(&PP��9uf)4j�:��c(�$e(�#�t�\0E� �.A�	��Gb+���oI��H9�f\0����m �Ԭ�P��f�t?XhR	�ŀ�z�^/Vp�٬c\'b	\\���	�2�`P�L��Qٮ\Z�\ZRv����36a�p�G��F�2IQ��\0�r�<�\Z�@mE���<gU����`��vI�&���c��(S�-�v�T���5�G�rՖ�OZ�ܜ���F��ѳ�GǤ8$�;��U�>�iϣ�$������75ۖ�\\m\0D�d�jJ^��ݒ��F��\\PXS���	P`*XQT���o	@��.;,t,�;�CE�J�呈[\0A܃�J�pO]H�Dܶ7\0Mi�\0����H�w_�z[	3�\0�~B=���3�2�\"�؝�]�LzE��n�q�0�e�|�{Eha����ŎAƁ��%4�[\'��N�F���.wH�xII��t�M$�*�ۍ5�{g����ɾ�Y!@����?h���e�@\nI�;s�R9���Q݅]�!�t���R��p�?yo��,���M���3�%kD��[�%�(M۴T�>%�BR��X\Z�-�jVq�\0��Ğ����\"R����CNS$�uh�.dɅj��J�LQʅ7O:��̙�7�R�@�?�\"�\ZT�R��%��S����OT�r��@�T�IX]g�n8��A�ی��&j0�\n�8��q@̚e�J��H�)S�	�Ӕ�d�s(Ɋ:����*��-a}��f����9_���H����s�	���Ԕ�s�@��J��e�:o�z�q��t��H�tv%8I)V93�U2r���@�\'Z�S�Ө�I�\n՜Z\n�rV�u\n1N�5jBWW4ae�K�a�\n\'d�(N��-TujL�	*Y+��`17Ǧ�e3�=�0��q�����p�\n��Ē�xYJ	� �T��(��V�\'3,7�]�b�����΍@�5 ��Đuޭw��R9�������v�KO�ze,\Z�ie5��C��cg94i�,I��wBK��]�e֤����k��[���S%WG��R�2PT���PY\"�驒\Z��P��d��c�F1��hB��i�d�@fm�Q�6$��d����B-ZA`:Ni$��3���PHPFP2��b�Ȋ��%m�Y<Jj�7��k��9�~[0��$���(��pW�w��ߠ�䘩2��z{s��,E��^��\Z-Bݏ���\Z[4c2#}G�E�r_�����Pm`�$&��P�X�\Z���J3�ml#_��qq{.�Og��ӳ�2��=PK҂��飿Ѩ��Nd�{���IqrX��X�SY��T�\0�:�����$���k�H�1v��X�8:�o��tQ��쇾�1[:�ѵ{0���R\r*4�4Ҽc��w��J�G�-n��[�@t����K\ZH�{>����@\nڷ$��i�+ts��)G{���x�N���)HSk�б�pm�~��KFLm4m �� �i�l�=�u��1ֶs�B�\0�n#B���P��\0ͮ��]��㹫�*�7�\n�n˂���ز�[��_�\0(�����w/B.��$�\Z�I&�emI��-�V��f44*-M��IUwklɤ:hl�/��Zj|=\n�YJz�D���*\0��^�e�`��F��ŻퟄՏʜ��?���/iU��H���<�I*<cO���\r)x�ݎd�<S�ilIl��t_�\n�OK�Cw�ĉ؈�y/��FF˒5ol��D���,�TY������7��w%l��=�MP�d�\n�s���فڍ��ӏH��&O�7��=��t�bPK�)O������to�.�m�/����~���0ƍщ���T�������R�[��}��_�d�&I�gL2�&YS&ҥNY-,�J��)Z�N\Z�3et|��8L	�&Bdc%�1�N����;,�K�S5�AYD��6̴v{c���r�LY2����$�&T�HDԥiRW#�r�(L\'���HJ\'H����`\n���ي3\\����&\\��q��l��f&|�N���|��Q*\n��5,Fr��!�\\���ԒT���\0az?	1R��23M�%���8,,�G))Zp� +2�٥j,F\\r���-R(t�/ժV-��L�\'U��LR��S!��OS�2�4()()9Vl�jM���]���:l�KP�0���RdL���\'\r�N�U/��:$u����I����D2���mv޿GJ�/�bU:sa�:��#󥐅��3�J��1EIB�	H �.�q�i����M��3\n�`�2aP����%!Y����l�d��φ\\���2�؝q@ �z��WG��\"إ(rlT�\0MK|�R�m؋�@\n����M����9��nB��6!\n�(8�����,�)�_3:��cB��c+%L�RK����Zj��yd���X#�W���%�$L���吵�D0*;��͜��&(<�Q^MS�E�O�^����\0�QR�j\n\n&%+Zб�~�\n�(T�����ǉ�+����|G��/�o�\rr�?4�����+�\0��U)Z��v.#N\\-RFl.���࿩�j��LW�K�1�d\'���#�RU�%Iu%.VB\",.�mY�\'ޞ -SR�d��B�3L��(��?�fI#��:��\\���\r�5kJg�*Z���ft� �\nY������M�H\'L/��	$gO�l)%����@�)/-JB�(���B�Hp�P~�fx{i�Z�zl�`���f(ZTP��5r�\0JNŊMt)6\"^�:�r֙g�\Z8��V�r7��>���	w_�]\Z�qy�z��t���_cb�U�>��\'\Z~\n2�s���4%D;l�v�ßu{㪑J�ѽ���s�i+j�!�ަ�����t�4������f���F��){1v~m\rKBdr��_j�K���&�.X^����e�wf�=c��S��o�Δ�)�z�\'�R����T���������t�����V��\r� �v��yGO��h�u���߻aңu�J�r>B9�kN����ͫ�0�9RGB%<D�c�\ZFl���ĩ�����\0���|BM-^�[ֺW����$�z��G��e������%����x�L�T��P[f7*k��-�Ʃ��Ð6�b���O?�BI�9��@H$�k0\Z�ǌW^H\'$��A7.�R�C���P����	7\Z�l�k�		�\"|ڰ��Z;���qV\rN]���SH��G�zgш�Wt�m!�\n��@�?	\r�d�\\�dN�#���)l�8�\"\'+�@)jkW;�}���A\Z���[�B�(�_>g��5hב�;;�,Z��1!���)bC3�~f8�bR��<?+�ݱ�&r���*׭#��N�5f/ҫ`�UO��+��Yk{�k��$�>l�5ah�*Z\n�:a�Дf`���!�N�o��:���n�5Ҿ��������<���ʚ����dL�6Z֕	N�*RL��z.��$�G,�:5O�N��D����\\ԢID��I�e��`)�)R�S!%!.z��3)*6?b�S	�������`\\�ҥ�&b&,,-5K���@OX�n�r�I�Ybb���z6j��U���g�\\�RW\'���\\�%SJ��X�*bV�T�����-`}��S,�Vl����2�fVM�3��uJ��%JRJ�5\n��d�+e�����}��PD���-K���_ˢL��R�8�-I3($g/�k͟(t)&]��2�f[����Nq*v	I�J��R�K	���c�,�*Q��3U(NH�f�)�)1�.tf�����t�H���̰����KL��KH+C-e9�02feZ���;��{L���k�_�j\'�\\��q�X@���Bvpf�yQ�-d-N�;	Y��K^Q�K���w�~Hêr���������\n���i#2��u֞�`I�����o�����\r��}�H��8��&AB�&-�$�j��jʔ �Z����P�|7�����M8).^�����OV\'\'�Ze䙆�&a*IPg!9����]��WҼ2�_6���Υ\Z�3�)�!i\\���k�L.�*�JH�7\"��jr��lR���^�� bfK32�[� �Re�6ΥPR����X���<���/#4��}��h��=�afb��*j��D���ɉ9�Tɲ�\"J��S�%����T��G~�:Y;��\n�H�<?H\Z�S�\"^��7(D�ɒ\n(RV�J���jː�Օ�+�d��T�D����K�^-K�&n	JH�0�֓��M\0�D��Z��\n�U0�Y*M�s�wA�=�o�o��a�$�jR�T���|ɩR)h�4�&f-�e$�V\'��z2��6N�\\ɫ��*bԖɕ)T�t�R\\~~jVs2��$v�U���{{���߻���+R��ɘ]�	xl>@\n�0�R�\0(�\0��wI��.��S7�/P�x�����]2�ڳ�#����������ix���]5IXՃ+�В�q��+D�K7B�8����}c��tl�%L����bZ�m��,���T��7ВՑ}fP���վ�xycQ��B�ɒ�td��)S�)pr��`��=��\r�wT�K��B�/�$%AA�a��RӃ2}$���O�_��<[VW>���������\n\n�\\�o�%��Knl�K��	J�\0,5f������ߩ�ƻQ`�p�3�:.L��I\n�8�=\Z9_�{`g���.�j���qǖG��tpƕ�$��@V�r�=�����jEi�KroK��\nj[{��	3e��Z��j��q���T��(�B\0X.K��o^f		e��=\r�-^���X^�YFJ�zĐ�\\�rjikQ;wáv\\D�0���\r���v�,���\0T���L}�=�2��G�?��2���cèU�1���8�c�\\]!%%h�U�P�2��MDؒ��������ߞI�%k\"�M@aP6��\0E%�^N~x�Ѱ�\"���N`�}��F�$63����\'OΑ�@r4�,���~��\r�q��v΍��UMi��οM�y<�o����s0I�5ַ���#��v|����ʙ-8r&�53%*F@�.RW7�bГ� ڵ	�h��.M�G���0��:=i���L�b��6fY(��R��R%&Y\\�iX9�(�@$�M�/G��s�{��I�%�a�:D�*\\�~Y\0�Zr	�t����Z\nr� t�.���%F_�w�/�\'�%x�2ZW<���FU(�(.i��3J��Nݠ\"���F	�\0r���t�\'��ʖ�搬P\\ɡsS�-T�!KL�������YW�=��Ϝ��c��e�e�\\�#$�3:.jd	j���+�rL�/4�� ��Эc�vOH��R%%��9ft�˝\'\r���%\n3%!S:�N�/�@�P�J\"qJ���o�\'�G�%I����KN�1��R�/�����s���)Ht�g 	Z�\'t��GE�{O��Q^!3��6d�1\\�H��8\\���1�,���Yʜ�>I�:��4�`��ᒅ��2dN¦fG�&b���Z\'L*A�P�әRP�#*�\0���8-+�j���-3�t�\0�Utq���I�!2��2�G�VB�J)@B��MHϝeʖ��	>w�~7{���Uc���U�O{��Y������̒��.Jf��L��ʀ�;�ia�J2)�$�0����Ȝ�{�&lx�S�h���C��q�gb$I3�&*D�I��hJU;�I�\n��(JR�3&s��#�4�\"�87��cq�Q�L��GV��(��JRPT\\��e) ��t��-�w\\��ޟ���ZRJn)�Phoh�8�#�w\'���#���\'������$�.Rs�J��8K�BɋQJ�&�$c��IE;��_n�^�������:NF%JO�dH�6\\�!g92̥T3K�&���:�	�Pe%������}�c?�뱘yXI���s�K\\�@�2`Zd&T�2�T���hS,�:OUfY�X���.2�X�&:H;8���\\w�c�����fvm5��U>\r}�ACb>Qo����>Y~%�������%.L�	�1d���tUh�C�=�[t|����l�wX/�\\G��e���e�9�p�Q�c���͠�$��a��%�i�>(щ��7�<w�)�n\r�5�\Z�U*l���71!g?4�Z7�(A	\r�#X��pe+g[�+�Ĩ�\"�0�}y�/��G�`�s;�~�6u�S)~h�P�7�x��Zc�i��A��NY����[9�!X	��h�I#c5 �z�pp.�GQ*I&�&�?e��.���cx�U��4�U�Y�	�-B9	hbq`�\0\\�j�`H��7Z\"I)\nj�sw\Zn^�\'I\0�{{;Pwj9ú����Ն���b\"�KG�W�\0�>���=�G�,�\0�)��R�>��?�g̺�S;��%Z�^?H�Ta[.�z�$0#+�@��MCg�K�DrJ�\'�@�H/��ɎvN��:8���3�Y��18�΂�fNL�gYzT���$���$���$��sfJAܞaǑ��$d�o�2$����ю��hH�;�F���e����?���+A\r1yO0)��Z��#����F�B�����.����o���#���Bp	4ё|�4p����$�*���	D�	T��sR�)?�\\��*l�r�������8~\'�릥#�{A��d˕�\\ĉS�JS�d�T��\0I	�RfI�Oe�:����r�c����ҡ���0��6wmR��2fET�r�a��P=���@̘��Mhe^M�C��=n&X�7��)&iu�J!\0���.sfI	���N��0��z\'�ɖ���*��)NpeK�r������fK噧V����n�g��H�췱�\r����I�T�(�d���\'��a*���hVUYҕ$T7t֚	Y�G�}\'\'1S�Y�.z�?�RЌ<���S2�a8	iwR�3O�T��N���m���m��!�\"B�^a��ZI��AAr�%k-֭+Zs>\\��KТp^\r�W��:ҹJ�D����\0�\\��NČٝҵ�\"h�\0�J�\0K�~+%Y���\"T�͒�Ζ&��%\n�� �(J���\\�r\"Zs/3��&ZJ��S�3�n�!r�o�����4�M�V�S)y�Y���J���JV|�#11W���r/��zh��ԯ���7�B\n\nՖl�,�ZU5#���ĵ�����X\ZbĹigRP�]���u%\\~���a��N��w_����_��k����Y8Ԭ(��AReIXB�,(�d��u�����J���vP�q��!e͘���QYʥN�6rg!r�-ekYQiR�B��X���v���b�_�u)31��J�~�J̥�Ɉ@�,ϖ�D�ɒ�)o��П��#����䬧�Q%r��%8TO������GR�2A�5y撕J1���\Zkf/�/vX��\r-�S2Q�L���Z�p�d���IPJ��R�J����ћ�Ou3B���Lɉ�J�D�ͤ��R�����PR%�yHK�59%Q�|R��讏]S�N=�ǑӆƢu2��S�B|O�hԣ�M ���AY%\rIh	�<N���\0Ӂ3��qVG+\\�\\�fQe͜���\0��\'�Uf+��PS�o�~�ԯ��,�i�wHt�j�=G-�ߺr&!&b�k\n���hO�_ڋ#\'����a��c�x@p���ѧ�̎�]�|&���Sڪ7f=�����\05�\0���H��v�T�G�^�=���u9V�#e����\Z����1?���GR\\�{�i~IH��&��Df�#�I�>���\0��\0��u�U��ӵ��^������-�\0�I�q�2tq�[�k������-M���Z�w����2�R.@\0�\ZI��^�!��	�Ij�V�R��Q�C^�����,�zҀ1\'v�q�_R=�D�\0�����V�/�j6� ��PJ@ʢj�@�>b)��<]\n�*ý\\ֿM�o��Tp�(���!?�<����z�h��Y�γ������R\Z��\0?!��FG��Jb� �i�2� ��w�K�rd��ZH$�T�|b�(�\\\'$g�+��aO\rpk�f�5Ox��B�P������Tm��m�|}�\nz��RK���˾S^;�dipk�[��D���ke5_k6������p�\0&9���hY,���{��*t�en�C�������ǵ�4c��},�!��ji��q�ʑ�_+�t{m:~#:8L�.A���5���JT�f)�\0\r�I^e!!!UbDz.���5g����o�)���v\r���b?,��˙]��� DԬ2�,)�3�����Irg�F�U����t�x��*�/�\n_Z�]��Җ��*vJ�M3����J_����tw���k�/��n���R�0a����Fa�d���72R�KI̜�eD\0V��O�,����W��ɓ�x�k�o��/�q���L����l�J��\nGR�2sd�\"xt�e,��L[h�ޫC��\'�/sӐ#���8u�8��|�����<�?a!2{.Eeӵ\'4�������rz\ZF�����*�\'.T�\"tɹf���FQ0%a攠��\n%I<l�b�C]ԩxuZ:p���W�nߑ�����)(��^vkRV�.\\�S�1e��+!O\\P���(X����M}��>��|�Ϡ�0��i$e���G|���:��\n(�sWW��޺HQo!G)*PT�2��:�t}s�gr�Y�2u���$z^�Z6l?I���\0���� �T>U\\��k��<nr��˚��x~�4�E �)Y�m���5�,q˻@sTQ��R�X��)	X ��b�ez�6#V5z��~I�v���B5hZzEG\"hΠ�Y@r�1ʔ�Le�RH֭�)�*,��-�J	\n��vD��r̦b&�#A[\\	��{1>�b\n��,�g$��T���S:�C�l���A�pU9n��Hd�)9YIK����\n�X�g�d��t^WE���R���������\0\\��]������c�w�U)A�\n��{�~\\jO7,ڕ�u�ciSfS�Z��\\�SV��TX�x��G��h�=L����4�\\3b��BSzx����&�rܞ�{�k%HB�1a q� 5&3G��QrGž����T�K�#d����W�L�����j�ÕZ�����Y�Q7Y����.��5�;�n\0GAAV̟���$������|aڥAYY��Y�\nܰ�c�2��ȳ�x�,��oj��3���z�3�_l��3Q�!@���\Z��c���%8��e����Fd*��&�����yN��x��őH��K�r\'�{7F���\"�7�5��X��ɤ�7��;L俈,o��\nH#B3����x����GC��ϕ��\0&��P�~��z�R����؊~�\n�9Ej/��X;ԖN`���Z�T󆰊I���\0`K��ltzx43Z,4�v7 ��N�ͣ<\'1+ũA�2�);v�>�0SHV	B6�����:��k�\0��\0*�I�����|����&Fb���XҾ�=���0Jfcz�O��L���94 8�H�w���1/�#N�c�����mǎ�ʔ��!�-m�>�^`�+35���3��>�5��t���&v����ܟ�n����Q�g%���v	e�(vOŝC�9��H����h���w�	ʉmF|�\'�I�Н�w�`G��\"V����*��_(˙���B_:F���\0�:&���\n~��]�Q�����nS�;���-�%�����s�6�N(�t�c��_޷��&(.xGW(BԐ�?X,�Z����M���uB�9,�\0tc�i�,K���򺰜J���r2�L�HQQ`َe?Qb�L�|gfC���J�58�4bXBJJP���	k	���.�ueɏ�q��y\Z��#�=�I�1�O\nh��#0���	�������J��(��W�}l�q�~����W��j������p�&�����B�IG>l���B���r̵-�R�E1�1e���=�e����2��kurR�ԒJ�K����Tf����ʔP��)5J�9z��46(�ʑ��p؉hA8��r�BT��i;5]X�eIF!��J~ �����,s��s�z����y28/ux�J�؜�J@	�	rT�t��\"c�#&d���Gf\nV�\'2S�]X�>�1=B���)�,ϓ:Y��ܳ$�)O�A~��*j�*68E˸O�$�l��ϻ���e�x儢dŬ.`(p���\\�6Z������T;32�6�o�Ӌ�i$ْ����\'�����%c�(Nj\\���\rK���Q�1b�:\\�1z�;��-x��8vN���晷7q��)tǻv+0�1XYұ⧧�3@`BR��D��AHR�5KXgŎnU�����K����_u8�KŃ1VS<�d�f$!2C�Rd@���+) �Zz=.Lm)$sz���l���;�2\0��Z�Z���pI��%�&z;s��!�LŤ����Gn�{m���}$�6i٥b%���	J%�j���ʄ��JL�RS7��%H���Q��,����/LO8T�V1���GY5@�4� &\\��|�̥�0�K̔�m�;Nˉ�VHQP�2�P%���!I`\\�I�h���-+e�n��I�X[��JB�JH`�\n���z���~|�[H���ݶnX\\J�Zs���8X9e^\r�(���ޭ�.=x䑪�E�܉$��@7\0��5#\\0�:�Z�,��?��i$b����W����ru	=�ۯ�$Ɏ-;����cd}��oɚ]L���zw���P��W1$�$���xǁa���V�ׄfk�l���?�N`UD����3�Ձ;�FÍ�ёE%�E>�[e�����N6gP��j2��В��Ƶ�8Fg�����Ѫ��`Hndk�N{J:+bz-�\'X�\'3a�r���\0��ė���\"����Vͯ	ӓ%���%I�e�;�	�q���de�t�\0f��,�=js\n��9w\"���4�Q��-��#�v�f�{��������.6�<�Y�̝����\\l�}��Ҭ\n��J��Mk��7CV<�䦎�2��ϙ�L U� �Φ��A�H�ר[��BÕ�@�֡��Y��\\\\�@44#ķq�VQՒ��1�y�\0駀k��l/�Ӱ��dPR�9�K���[�!���I��6����$C�`�3pۄ-�h�߅yO�Vd��U�&����PGκ�������\0�l	s��4��+ѝ��R�/H�I�$$�Ū���*��k��B�e��mP�#�����U�{?�����Ε.g��%�U���F�ɴrrF���F�Z�IJ��rى�t��)3\r�=35�f���=ŝ�\r)��h���Uw�8WS	�II&����Nd�J4P��3~J]3Ӥ�a�y����>t�K�gϓ/+�W]5fyȔ�-�	�Vs�%��]�X�Eg\r�{��0r�8n�N4�BU.`�$�]Rҕ��QZ��� Cb�*���Y_�=���`����02W�+��biu$�2��B鑙�@x�n��{�;�Z�*{c�98.�\n�r�aq�dbHŢR���JRʏ�R�(���4a��CĖ�[Z�������ء�W�X��L\n^%�p�&�1I���fL���fI*R��`\0Қ[�-�%��]6I���}9���fL��.Y�1R��KXRJ&II	,�w�f�9�u*R�ש��:^ړ��J�g%)Kh���v������#��U1�La��IRINe\0��X���xb�h�\'s&gIр\nsf�Ae�\rϾ����U��kp����$��T��\'�4 �f<;-S�̞�[D��H	�����)�2���w������),r���	.��@��e%.RW�E��dz���\"�K�;�� 8HQJ�)��t���V`���CH�srv����L�d����\0������k���h�ʁ�t�̠9��٘Y�bI�vsb%Qgs\'\r�$���)$9\Z5XWVo\n+fS�ZғO���t������	\'Z;˛#j��;�6yX�SNWnV�c$e)��N�j�˒�(z��A���~\\{Lw�/T�l�P����L�p|}�����_��#��p��>gg�Oii���[�\'.q�[�tʁ���%�pR�r<cs�	p<(��H �`�ٳ�<b,�AgSƦ��\"T\\N-D5�����-�����8��,sc�>�HHA��7����V,�����Y�V�Ʈvcl�K�e��Ӂ��AVg��:gH,+�`�$��\"1�zM��X0cBI�r٪�m�E-_i:}R�!4v\0���vfѼ�6|J[,�*:��=.ftL�\0�%�Hv�Z��zR���}S�P8�{D���%��]w�ݳ�JË�{�44#��N��l	3���jI,K7\r�D%?�0��ܝ�b�\Z=��V*hrXT��D&��`i{<+T��*2�����]��\Z*NJ�EΊ�CZ���T���\\�W�1��t��T�Gs�$����-��-��*f����t\"+{Q�)�R?U�\r�E�/R�\Z;S�����BH�w�<����Q�t?��ѯ�?�+B������\"l���t�����q*���>V.O��Fc������lo�ٚ9(c}�@�JC����\ZE�20x�i�\07��j~ތR�4�/��#�L��Kי���\\,�Ы,Lh��f��5���\n�f��~�=�8�2�H���Ĵ����$+�@AkѬ^��zk�N:`�ش�T�=��)9\'Kv9�`��Q@�)H#�����/AmQ���+�N\ZT��i���-J�Fd(,%=r@Y���!�	]Z�U�+n-�H�0�-��I��S�7�R�T����=��JY��K\0Q%�8��K\'t��*��f���.n�����be�F\ZbT��&\\J��Uf1��fZ�I�-��\'<�l���k����Lz�=�yJ�\\�f�$!*���M*�)2���\\vV�P��]��U��wq����k���Ft?Kv%�y�)*S��%j=^I�s�J�:��YAeɨ`Q�K�/�G��\0�2u3�Zl§ٞ��!z��!hR�)BL�%3��jS2Lħ*��PI����г-@��.���I����\nFIEi\"V (�d���W�Ș�������9kT�.�R�HR��\\��̟���L�O\\��˒���\nQ��r:e��L��͗�O[�dXJ��e۪���2�VJ\'�l�#\Z�I��IL�M�� ��$ ��XJ��Q���[fo�}�t�Y0R�#:�ZT��̙,L(\"b�/���g�JH=YP2�[�[�ְ��t�e�=A��6J�:����Bg,Β�KR�:�+\'�T�����\Z3=��%i|<ήaA��+=�HD��$#��j�¤LR����?m-=��}�{��N��8��3H�R�P�T��U���u%N̵j�J�&����f��K��r�6[2��j$�>P	l�C㋓7�\nH,\0p����G�3�^F�j;Q�Q�����ܡg�����,Y#�F ����hE9�ScT^�9��,�1����k����S+�kJ�f�+K5=4z�.0����I�h�8ΊO��֑׎4�9/+0�+���\\�,x�i�<������EF�=GG�R%n���)�.��i�;�=��2�Q:\Z�o���X��vg?e~#��)x�����=������k�C񱻒-�W���`���A\0�>�1�ݲf��2];ѥ ����־Q�[G-�3^�(�π��W��F;	8���v��b̬��CeU�$?&��Rـ��-�&����q�8�����:ri=(dʿ�7�cp��潫\Z�Η�%y�B��D��~���ؓ�\Z�<L�=�Ya`QL���Ӏ���ENLd)X��$�T�\nrj��5^P��d���җwa�<���X.�\\j�	�8��_�H4��h@��[P�8QRQ�S�C}u�`��?�@��j�T@�k?�>���#�=V�v,?J�K_Zw\nm$s����\0�.\"0��?h�KVFQ7�JSV�&H�F�f�.�rپ�b{D$h��O�8㾚Vw�hF(��\'�iIb���,�p_Տ��܎v_hJZZ6�>K|�)q��m4��B)��R[e�6?2�d�s�R4gkތ\\P��������j���n$��J�-x�־�|��Tk��<J�%馏�ӝ	&�\0�e������Ė\r��p��%:9_�#�L�2�\\��T�D����e=�A�����u0	SQ���+8Ƕ�i�V�g8�°��%X��gh�HV`�)XR�sB���H�=���j�%s�Ε����u�B�$�L�L�fd��%�K�33�1J@���L����l�@J��T���$�H��j\\޿+�HAF-SPJT$�u]���{7�y>ܥU>f.|��q3�a��\\�9̔����&L�B&�T�O��v�P!{T��-#^�x8�H*8��I�� JT�l���f��*�3eA	�BVȩ����*��h�{�����cJ�-�u�)��g.	�&���̅� �@|15��{ݙoq^�1S18t���db�S1S���0�L���	A%2�EL*�����Hh���:�L!�����A\\s�8��΅bf9$\0��g���v�\"	)l���,�e��R	���%قS��E�2����OCB�.дYvl�x(�%�k(Ie��I��AH#R��9rȺѸ�JX������,���T��Z�*]6������r�����ۡ����{?�\Z����:BSC�|s�fQ�ζw2B�\r\\�3�&���qq�\"���4�!��Rz\n�|�;�z�	���ǄV� 8�gK�����~%���LƭH�5i)@̉kZm��\"�����L%��������8�7؜P/�O�\0T����J�n9��ܿ4r^)z��X�eK�9�Cȁ�Ž5��^�i]�R����5We}��,���,kJ�S@p��Kڅ��U�Q�[���Od��;��^��o�gɣf6ލ���Z��0�Qs��=--(b�l�\0(1��iF��t�0\\�X^7ER9�-�]��:JJ�)�BI�@gS��\r\Z\Z�Z(s�0�S1��$��� �T��+\'{0}%�T���������t�VU����54��Q���X/!Z�������$��O��ׇ�ho����u����\\�.�C��i�мx6�g�\ng�rEH@6�6�|J�A��4\rjq�փͣ���l�Ɗ R�b�ڇo�X��]�*�U��\Z��B]�=Ņ/;b�%kC�Y�k�\n�#�H5%Njjo�\rD���&S�I��]@`��$w��pn	�<�#��\n��a��\\�D�b��4����\0�[��<aI`I֦���h+��2��梜U�E����x-�MF��H�1%��o�g\nIb@k��X\r&N�D�:[*���ǝƌ)�bU��R�nҍ׹�>@RĒ1ؼi��-�jO���oJyN�8�(�Gw#·�iw�R��$���G�Ōm�W�6 ��a�NJ?��Zq\n2��MbJ��^`�HQ!��ڍ7�.��B3\"^P��O��y]L�ݠr��Q`R���%�&ō��\Z�4�.BU?2¥���),V���=XZ�ʀTY,�M0�Z5�L���L�cg�����4J����f[�����+ 討������fà�A�\"L��Y�g�Z&���J�T\0JJʲ���eN��I``=��)bd����T��$�(��Q�-YG�&̝:X* �J�B�L/j���*�S�dOL�˓9I�&~\\̘����*dR�.o�*�̖��ek���F��\\��#*L��+�BJ���#��*���!o5)�Oh�b\0pO�՛oD{�Z��Ō9	D�rB0�i���/)2ē1�\0��J�81JA5�%*+i�0~���W>S�XFT�-��2e��Z�V��B�T���������������ER&\0��e,�-O� )s��T��<�d��fDp�ZL�/���ԭi���AJ�����, ���,���/��\'*�2�I诉��F!r�!@TKr�݌\n�;JBPTq�H9S��Җ�i+o��{/�6F\"z�,��%\nZպ�&vWr��-@��!��T�K�\'m�g[��y�\nL��%�E�H��c&IV��-�YZl���,�2_)Ԃk��b���xF_���\Za!�����l$��������Q��)��B*�h�m��i�y�G%�^�tRS����%h2��L�*v���p�V��h�[��cǉ���������[*H�(�GB9eK�3ƛ�1>��?�h�C=�%�Т}���%?�\0�hYe��¡�E΍�C��,İ����y��#ƹ�lXN��G�m�\Z~1S*�߰�i���J��w}a^y�i���:[����2Α�W�y3��\ZтG�,V�ޱ^,�{���Tq\'I��tXt�aG�\0��6g$�$� E�B����1�Al���bؿ2o��L3��?O����\r��$��$��y�R�\"]��tre`�%$��s�*3\Z9���c��&��\0C�����%\'0���ԝ\r��#=ƕ�nZ��ٵ$���T�������m��5���Y�5HV_�|�~lx���)����AW\ZX�׾�.\n�RB��Ij�X���Lf�S�I�5�l�fSܷ��;$�-1�ƩH��vb4�g�uJ.��O-���$n<�Fr@e�L��&)~�Ü��g0GvI?�;G�jP�l�r�a\n��w��N��0�s���q[������b]�S����x�_)\ZF$�O���hv#E��+���ȝ�LIH\rk���W�-��%	�Q�\0�ߟL��]I	� ����EmW�̾�K2�r��y�\Z~�R4�B�N���jP�v�R�{�9/���K��8�����L�.�T��u��4Ի�5yGO���{5�2p��.|��u`�	�f	��\\�9,�B~-j��(�2��H��_��1K���.x�6n1s���J���L�!\"P��Vd\0�ΰY��~�����	��q\n�+\r�I�������B^T¤��Ֆz��.-�U>Y����<��_�3���L�̚�L���M\\��(Je�|�$�꘣���JG��Y��MӸ� �f̚�=�\ZJ��x�LX�*Q9ff�*RRĀk\r\Z���?J{w6_I%8|L��?�L�:��\n�-22 K��)B�4:�)J�*B�������\0�)�12��R\'trq����bLԧ )\0 ���ј~�d�Jר##�)KHԳ8o��>����\'E\\\\� % �{;\r˗#�j(a;���;�e-iR姬���,\n�����u\'@��L>��fLĔ�Z�0 �J��$��P*�.�\'��a��J�d ���32i=��RG����$�\0ʖJv]�L�E�&Z�d��AH�{9��\'�*�;�	6�����z#��T�=�(��|㛒[gW���K���i���j����4bɵ9��/Y�&�O��J�=υ?�Yt��n��h�6��c����n͐ں.g1]-�M�<^��\"aa�\'W=ѫ�X�䊳6�,�6H�����`҅i����ܗ$c�,$�RZ�Ս�E�	\'�p�����S1�����$Jή��!j.YR�!�ʚ��kZF̘ݣ2˺I��o߮*hĶY���>Z�W�ҕ���-%�^1\\�F\r\\��dr�~��L\'�D�ɘ�6a�)R�yGiY�JBAp��F��[��W�մl�+��D��,/4����b\\���#[f��ix�QV�״��e�XD�Nʬ��J]��H*#P��C����w��2S�\"0�5{U$����[��L�f�N�ع�Qv[P�S��2O}F�:����p\'}���\'z+t�\n %����;��h������a��3\Z��Ҡ��ǓQ�Br=��6v��\Z���9�����lx���9Y�R\Z��C֎\\�v�޴�	D�%���Lُi�����g}T�w��7�BN$f�;�E1��E=��=!u5-��m�\0���l	X�x�\0:מ��,}	���pmxh���o.����)#��2�)\"�|�����y.*�K�\\��F \ZNX�����W5���L~�����z�G�4gu�K�}��Y>�qmY��)w��6��܀}/A���b����H��뮘���z�\0{ؠ~$��7sW���*~̓=��ve��\\�����\'�z��}�O|��fHb��Mɮ���{�.>����uI%�����r���nw��٩y/ߤ�e�s@���Iz�H���p$}��K�=���ɨp���Ro��O������\\����hW�S��s\0���WB.�~��{��C	s�O�h}�XE�E��3�,���Xf�6���D?5��7����#����{��7o+�Q����x1�a�$�,��p���j �$:\r/���!�Q���O@O�|\Z�iA��-�6�4A�2���eo���X�{�wΌݞ�E�r.�73��u~A.�\"\\�{[�JJ��1e(\')\'w�+Z_��0�a~Ǒ�/�o���ΖX9����a�X=���M��Y��$4�t��G?F�����A�6K�fNg�Xb���|ْ�@w��H�\"|H���Yz\r��L������Mu���4��gċ�V�Ixc�>�\"�C�����0��S\\Xe��8,~u�f����S�t�qbnF���$�\0�8�S���wc\ZT[G�tZO#��R�����_�H�O����_;�U�v�B����\0�_�2�Y �,��ع~��:�m�T�c���oh��#��{J�	0��c�$��\Z�+ڹt.jZ�㵠G�+qЯ��i��}*��tt����E9;l��~Q�S���iQ��֞\"<�m��\"d�T�\0�1gĕy�\Zo���Kë�bf��R�Q�R\0�H\0��Z�L�vF��/ǂ�}��J�/	.j��\'<�e3sNR���!9�f�\0(Z�Y�Ե�A� ��S��Цf!*	V/T������D�\n\n��Nj��~je�ےN���%H��\0s`����\r�H�gX@HP`�\0\Zq�޽�\'����L�T��fO��\0v�q*JL��]�e��?�Z�(A�l#GO�,v�%9qwU8T�\n\0T����T��+��������ov.?�v0uܜn��q�1��E_��Fַҽ>�h�(?&9Y�Z���,[��V�������R䊪�\0�,I���{W>��}����9\ZK��U�X��[==6c9c@;<6���6آ\'��q,\r�:�7�>�\Z\r���ƀS��;p��DV!�Yk���3�	�\Z�I�p,�g��T2E%�jK�x��	�b�-���h�3V���5�?�����97Ʈ��޹�㢲$������&�D�e	r�\0��S�G U�f^�z=ޟ3~P����[�>�8�[%G׼}�%�B歶�s�p(-��9���H{��CK�hk�6�!Sc #������Y\ZP�Z�׹��s��в�W֦�S��\nah �h��T\n�N�[�kD�iBm�A:\rI�*8�Zd���f\rF�\'z�I�4�8YM�TPI�8�\0�#s�Ū�æ����oK?�Y뿧��A&Iv�\Z?	Hή�ph��4\Zc\'a�\0��Һ5M�V��,gZ�)���[9уڵ��v��d\0��p�(N`�r�@a;��Cg��M�r�X�����/�>\Z�����?��<��O��KB�I,�pH\0S]���_�5����Uz��[[�qG[\nƽl��+]���KT��p~P>%y\'Ï�3\r�3\\4�]�j#�$=n���;K�^���a:`rą+��z�^�R�E�hmr�����)\"����O���{D��[r�H+<��Yt��/��R�,�6,�$0 �\0;��\08g�ˋ(}=2����6�5)�R{�^#��Z`]=�{8�i%3A�$�[������W-�Dp��d����W,��\0��_�4G�q�*}2e�_�<{�2���w����h��\\��\"ܿ�~-9^\\��t�=�Ծ�+�cΫ�K�#��ėL����G��M⼹#�pH�q|�?s�����ڒ��k���1G\Z�٥��n_�eO�Q��#__��Ʒ(J�9ye�/�{S�\'Bz���\Zd�ѻ\'lydx���V���8~`��%�K\\�&�dG�\Z��ä����B<5�)%\Zu3+�_\"��A�n�x;��v+�%W�4�-CZ���c����_1����/�k};שׂ�)*��Hp��✫�ݛ�I����];�9v7�J�T�IU3j�yr���%r=8F��T�ƕ�\"Ɯ�↗��2�P��Sg7v��h1�\n��A�E�q�<�\0�H��$�/\\�SG5���\n��8pT�$(jS����v��X�D�����$1x�i�j�eT�k����\0�	�*c�}����u$�1A�FIz�6��M8ӻ��<�Y>�sHn�8�5��HIN�D4K����J�@����\0�<G�2\\ǽ���n~�O\Z%������JP�x��Ġ�Y��~�z٢��\0�J#�MXp�l�\0N��_@�WQ��Cb��V��𫀽���y�����Q�,����C���jh���g^W�Ȼspw�Hji�w�^G��EArԥ8�~��M^��r\"Y$�f,n=��r��6H��C���q#N���`�����,ӎ�ФDɘj�$\r�5vj9!��b�ql�u	���I��Xdք�66�^�)�+T:Z8U�gk\r@�����\na&i� *�V}{7��0�������u;V��ce��;�fm�~��+��2��*��O��]OW&D�bIsJZQ`<++dk@�0,�E�jڀ�P����#��3Q��K��AcFx1t!���N���\r`9ocU����]\Z���x�k�`�t�2��@�q�04�a@�z����E/RE)_+�aI/�N�}K���:j��\"b{ �g;�����a,�b�K~ �\Z���hx��\\ɧ(j�k�qn��+kc�-av�t����hz$�bᙘ����G�x쭠����6\0ޅL;d[e��R�%�\0֯��C��Ċ�e1M�C�PE=4<���I՝�Z�@�\0_N�U���\Z�h���X\r�78n �T�	��0�\rb�^��:��b(D(l�C�)섐�]�\r�z�<ᖅ�VN,\Z��Z��fo.1;�:fd�nY�k�݄:�6�X�kW�\Z���f �\0j\\�>.׆�u@�����\0K\n_j@���[�ڷ��5���#X���B~���\"l���x�.�b[簿��*��\n\r.�޴n�b�Od��ڹnb��� Q1����s�w�?���&�>z�4 h K\r�������j\n�;�\"i��*C�\\����#X�{�~6����7��Vr�I����Za���g\'zvto���aD�u�Iv�d1;��4<^�iX�9�|��!�< Kc+g�f�}<V��%2����j���ۜ,�� ���<�����5�,�^��[���#�[�\Z��\r�����,t�<��T�3�?������9=��z@����B�X�ZŪ��=?Q�8Ș	��bkJ�Qb\'mC0�93�/fr�ϳۻ���0ʘI�3*���f�\Z�߆����,p�$����4���	�k#����\Zkpmu��XL�v�N�5f��o7t�ƅ��K��S�3ށ��=�K	�3К�z�U�C��i�P7(fţ�XH\'F.�R5��=��ܒN�jG����@�Y����k���^W��lܛm��A\"H$�@�9ۗo~J���39Ö���\"$�ʑ���n]��JVF�\nq�$�l��po�n�Ռ�6����0��*l���t�k�X�\"�o���<����`qK\nfvk�kn>��\n��j�[6�U<�[;(=��ڮ<v��3��Ē�YÁ����b�ʚ6b\\�z��p�~�$N]	�Vͷ�(1�IQ^|ڂk��n�Ċ1l9O@����T�ܳ�dD���x��p��YJnMj_O�YEe$/��o�j�bPG������gV����kdbں���mk�oan�m4pY�~t�M�A�^�����(.��Ew�R�f�}�E�B�k����vzb�qo(Lb���;z���\"�\0��x���d�&�n~���˸����\\nL%�\0Oc��\0�~\Z\"�	J��Ny\0���(�1i�s��&�z!x;5?��R?Hۉ\ZB�����^d9�ڕ�w�e���i�,(�aZja\Zݑ0����r����W{\r�5���=�&��\"�L� p#�I�|+H6�AV����>�_W:$�\0�s�aSګ��}�\Zln�O?ӵꢚi�(dV�\Z���1�^��a���KD��sZq\Z�5[\na�A�Ԓ2�µ�W�)����LM�n�k�����03�֡\"�v���h@L�M���U��S��Γ�,)\0(��<��{2f�b)vjvo��x��eۃ&��խ\n@������v{�v�G�+l�݀���-z�#>��F�p�ח�!,�[15$�ѫR�����=\'��,���-肤������sf�|		�\0X[K��hh��� �6��ŕ�[*Ҕ T�o/�\n�2��Y�/���1��Quh������A��S{3(�f�;�� 8���9��!�Z�=Os��X��FU�!�w$_��k��\r7�*@H�M\Z��NG���� \'l��O�[�ڿc\nA_�t��v���}�H4ɟ5�k�Ux�kD�4�@5����Vb�ۏ�g����|Q��!E�&����)�m�=�-� �p���$��	~K���hD�M)���`ʼ�#�$���rF�r�$=	�v=�#�\"J�C��5�P�qR���%a��^�n��v\"A\"[��\05O�`ևC%�.I�X�C�\n���1�Rƀ\\�Aw���Xc(���Z1��]�<����\Z�%Ö�^�X9�hF���[�׸��G�b�ב[%k\0jJ�@ag��=�]4*�}�H�GKdlq�G%��}�<)�I��Z���ǴnN�m\n�>�B�.�.t���o�(���Њ�՟���1f`c�f��1b��n`�&�f<����BR�\'�N�F\0\r��-rօ�q:l���W��_$j��cZ�K�\0�6��G��+Aw\'c`�zxB���\'��rC�P�Z\'j�fa��ś�\Zm��,��V���Q�2�v��X��V��\'m݃-lA�T\0^���f���FzX�m]�t��Hn� %���	����õ`&J�1U�kBİ0���&}�vU[m�}�-���݂��(��u~[C5`C1u�y�7��`v�t��MH:���4ot����/f�q��x6+���.\0jց�}��8,����6�%����Pl5�I\0���Z�w�\n�E+W�K��0�aA&s1r��?�;V��\n�\"uA�8�����,�,t{�p���x���4ĂC�7M���h�T2Hc�\0-�W$}^�V�L�mP4SѶ�!��,�˧��k��\r+�L�@ 6\Z��ڌ��1�����R���F��,�X�\0�Խǖ�J,CP��sS_�0l�L��PX�~T���3mB�V��0��C6�ǿ��a�\r���+S��w��2��\"��#9�n&�jk�Eo�J&�wȠ��W�\Z��\Z�6�%��?V=�\Z�^��`-�ټ��!�s�Ş�վV�¾FL�ͫhL��!�$�Ô-�4&��JAaD�����\'̻E40�Lp��-��t$�����\Z�`4��� �=	�1��K����� O�&:s3�V��T1eS(ik�\0w��XNBD�zk���A�șEZ�qP����G�dS0٨�&�\'���%9�CvIW�w\Z�aו1�F���iN���%�U����	���� 3�ـ\0X��}8D�\\�+]���&��A/B$Xč���\n�H,T�kFw\Z2M?�v������`.xv�uLov�9�\'������Ҡ�5���i[r;��Z\"4\njCT��r��CX�i|�v`�Y�����\"+��,���bA:m����K���M;��g�b`��Ј-Y,��I\r���QTF�H\'ε�������b[&\\�f�g<����������М����\n1��ݢ��n	���\Z\ZP��[D�k��_�\r�po�N�j�g��[�Wo\n��[��.;;�ǅ(\r�A�\\�\\�Y��S��*�\rМF#�Fn�\'Wp;�1rv�lD����}�y\r�9�q��O���9�X�%@l�%]�F;C\\��U�x%f��a�AEt-����}�0���T=3�ѫO���e�%\\ljl�\r���HD���:�7�E��	�J!�,���Q�y,̓��G,u6�|4zd�$����<b�ɭ�+/��(	Sa@�v5���\Z�r�F�r��H�<xz4�\n�\\A!��-^�X��G�X$��Z\Z�$��w:pj�[��(L9;W3���X��*��(�#�\Z	2i��6} v�s����W^�4+�K_}t�!�V��b��&�q�.t#S���	Z.[8�mM�~�CT�4�\0w\"��\r��E+v\r�-^W<�Ȇ�\0�Հff��\\DV;�		,C�;�Oh����\"#0�\"�\rQO�W~wh� ������$_�X�%�0�*	mt:��4X�,v�_�����-pL�T2��\0?v� �ű	wQcJP\Z���Օ�0:��v��m|�V\0lb����K�!��X��$����W��U�L��ƻ7վ��t4�!�р��}����)�^��E߃@��K;�@i�~������,�q�{\0[k���A�b��8,�W��E��tL���T�`/n����D�,�?3��p�A<���\035���h)6.z��KP0�Z�v���Y�b7vi�hj�Wp.7��~�S#*��8z|�X��i�g��$�I5���@I�\\����k��m�\Z�����7\'�����,T����znta��I4b@�.#ה\\�,�\'�\Z�8\0�bV�eL<��e���,�%d��\rei�a�J�^�p8I4��s�2����&��D����U�6���ZDa=-G5q7k׻�ǉ�x	j�g�׹�\"4 i�I���\00ht�9EI�9jG�½�$�.�Wa[�_����x��䚓�z�O�$�\r����X~6�c��f��>[�h��ݵ��ćĢ%�\0��?N�����H&�]��ȿ�p��+�\n���\r/g��>��w*�S�)���ܸ�oB�ª�\Zޚ��5��QRY�@R��ěsx��HR�]���4�d[�897&×���֜|�8=<a%�#���r���}���@0�T�]�4�����\Z�N�����ꗁ�9=\"})ʼ\r��B6~#�`/K��`_�Y\rTM�\'N�D#��[@V��UA��-��ɘ�	�^M����rС8\\\rnF�/��D`�Y�����7�B6�8��p͠�=G�\r�9j�?�������6�)�<M�|����U��q`䝫�n�d�ĳh�\0��KЉ�$%#���PW\0uzl�Xk��N4�R\n�����1b�\Z]\0�j����\Z�&zr�_PI���lQ�����LX���������1n�J\nP�~����<@Bb�R�z3����M�P����K�zW���!R� ��5lܞ;�%�*ku`3p�ա�\0����km�6�vJqx��:��Q\"�.eZ����zxq��X��\Z���AF�c!l��_ܿ/�[k��L�a \Z�fs����dYT�w.�0��W��\0�S:�`\ZۃO\r��,n�4v�n�q$[E2��[\n���W~U��B���&�a�麁oU���HA���v}\ro�������v�-���M)����`�{���]���<�-��[=X1,Ԧ��G0�@�ji���D�\Z5M�h��!��\nu�4��B;�зa�f0{���M���Ť�Ќg&垅�B��ŭ��X�UR��n5\'�b��Ln�7�m5���\"e\\�p�n��\0�J\r�Rt!�o����X#õ�������Z�4\rB��+e�4��5�Ԇ�a\n�3���j�^�p.�@�Łm������Pr�lx׉v~nPm����B7}�<V�ȕ���@>dV�����a�5%�+����\Z<�12�r�Mz���|�K��	�?Syk(Ŭ��,�\0��[��l\"�K�\rg����OGF�2!�\Z�&���$��\0|���<�\'�Ҥ������;ڦ���p�KD@���HҶ��+\r�=.+�tؼ0��K=�~@iX�%k�N�Y�� [��o-���V^-�C܊m�0\"����H���n}}ժ�\0��q,AH��z���d3�0`+���k�_p�����\0�~p�vzb���wTD�	������6�D��D��jY��SN��:��,����R�S��V�N)��i(��VR��k��\Z̈�v�U˷��օ�\'�ߙ��-]\0aO:�\0�J�\r�^��.v���^�H7��5\r�+\Z,�宠ڴ�0��c&�e@��K�=8�v�5Wu7s�mM���T;�j�\0*>�������ؑ`K�@\r�ϔ�^�x�5}-Z�}@�I$�l�Ƽ7��S�G$[`<�!�2���9g��΂Kt�\"�ce*��.�M��HU�g�,vCՙ���o��Ƅs\"ތ#U��du����ڣ�����\Z���Y�Kj�	�hN�b��ܶ���hd�9\n�\0޾���	¬�\0�\\��5v�J���\'m5�a��?�y,���*r���;Ң��q�\00R\"d�[���3t��w�Q�д�\n춀>�.ߌ*�aA*����z��Q�׫�E�+b�K�Pj@b�@�gXĵ�e �p�\0n#����	�`����{�&O����ܛ>�p�����B�Ɯ9W���]�f�K���\"Fk�u\"�|����Kr�Q�Ff���Zr\'���k���\'��Hvc�hN��qh	�@�Z�j���B��D	�o�񹆡�	��\0[_�:Z+d*p �Fw���&v��m�d-�!D�ׅ��ҭ\']n|�<� A2]��0fg�M��[��/�]��mO���\Z��s��u<��[�m��!NS^Gnb�++�׵jM���Ŏ7���V|������V$��>m��G�B4ER)zg���Cн�̦i�&��}Z3ʋR�)�,I�<�\0�UT3<��H{�{������)�&��0\0�[����;�TK��\r`a����V���j`\0z�_M�����.�mm���#�R&\Z���É�s�N8�fs��sƶ�HT�d�5�a{�޻�t��8t��=��x�I��6u@�	ݞ��Љ�#�3؀���\n��.�=z\n=�>��BŎ3̊�)np�ڴ@.s���F/�iX$���/��j\Z����`垧����Ր)5�����DJ�v2l�@��R4VD�*r@;��Z9����LU\Z/��+�`7aAʕ����p;֍���h=F��p-`�*�w,֐���%�!���_��Z���[p��!a�,9�\\3�/}~Ո�J�RE�ރ4;K���!IڏB�ky�Pg��G~�H����կ�+[%��W��?x-x\0v؛�\0�[��Fk.9u\rd��\nDn�-Z�=���\"���P����|���/�&�G�� �he�n�nso�� �/�hڃ���rT�`�����-�%J=�,�3WQ�4X%����%�aO���;#eu)���xѾ^0�+�\n}NϷ�%l��`�\0U��j�%+g5`���޴+B��bn~���6m	����M􈾠�����|��Z\Z1���&m/��}���J��g�\r��ϟ8~�&\"z������\'���q��ֱon�b�0l|�~�;���fP��{�o�9�l���b,,N�:����j�\nk�D2���t3]���E�˥$�W\n�Vk>�勎^QcV�%�IM�U�SW��h^t1:�*r�$��:\'��϶��J;	E��w~>���4-ݴ�r�Hvģ�&~.�~�� R���f���q@yE-���P�����|Q\Z�jPf�Ջ8�>��4K$b��8�`�6�l ��;z�����$�Үv�����\"�����!���8�[��n��b��Kw15��מЉ��L���ǃ\ZRdi\rEH:֡��hbA�#Z	���0����K�x�[�Y�?��aQHY�\rMhY��HN�F�����\Z4@��@�[��ꗁ�\0\\��U�~b��%XS$��25�[%x�56�]a�k�&��T�[@��4��My�SVH�.�\r]��&s\0�3�N��1U\Z�0����aiS�r\\v~?O6\Z<�Xw�]�k�D�1Zة�,H�\0�M�לF��J冿\"+Z[��RD&c�cKP�N�$B�����~�<X����AЗ����\\��3��!F�x�4AH�ԣ�u��������j��`��2f�}χt:B�1*]H�k\ZyA��ɵjT;�C��H��\Z1�m�,��=���ֺŴ#�Vz��;}�]\n\Zg�f�\r[-L����=q�J�*�M����V�\\����E|�K_���BF�=!#-E�����\0h7�D�1N\0Hk���R�����l��\'A�Sh�(�����C3���Ä\"�hd��R�?ǯ�+�(5K�4֥˝�\nB!Ņ���[?t�PS�S�?+=�ՠS\\��g��EymS�!�K\Z�{�S��ɴPX��h��O�?j���{�0o80VN��WJ3in�\0�O��7�5E�k��@�\r��]��Kx�lqkX�`�}��\"B�i$�����D�BjY��|	h�M��D♷ �+R}bDZ��̩`չ���h��2��K-���)�13���`�sq��Ad�[*��;��5<���J��w3����y�r�m���J�Ư��G���T�ʍU�s�8��M��Rn$��XR����!S�mGrK=<`G�F2l���zz�\00��1���>VsHrf@��ա�\\X�(=u�m��o�vH�cb�԰��E=�nɗ6�Y�OܓX>C`I���)����hj%�����<��_����r�wq`���(T%4/r3w�\0�[<&�5�-q�$�\"RE�ro�߅!R�VzýͻE�ք�6uڡ˟���q�S+�Xpg�j<)F�lb\r�|����b؄�Ջ�l֦����V%�[�<\Z�n�Ӧ�V-\\IS�SqU�nw��Y�2��]8��DF�s&�ߌZ�[*N���c�XT?i]�u6�G��p��TG\\O���6�a�I��|$�wp���@��	PrV������GA����|��\0�6r�S�m\Z�4�ɽ\"\nD�;�����Hae[�`{��߄2[%�2x���<!{wd�L6��Kݹx��X�iyS��UW�� V�t��g�xwShn4+vǥfܫ�z�<!8,B�Ngj�ؿ�ՠ�$��J�\0�ھ�brO#�Ե�o8�Xfh<��W͞�E� щ*�Z�,j\n�rӤLٶG�&q�����U0�@�׼0��k��[\Zf\\��`I��J���Rյ�U��>��e��$�ۙ��a[d�\0�\Z8��g��L�vKi��L#CL��.����%�����6f��*�X���-�\09Bv��X��Z��}t��d��з\rbD���\ri��by�R@�g[�5n.��\Z1Ю���H��?�8\\��eN�1v��|��\n��0֍r��4npTtK������x�K!3���\0o�\Z�lR���T����\nW��S2���\0\0y�`�j�JP��i��&m`[�V �\0^*��yn�e��*]H�:�7s��R�+vyE�ϕo��i��%f�Krی7h���ӕ�����.t�9k�,���H��C\Z��4\\�ejTW�8��z۾F��eY���,Q+r)Ν(�w�6|X�IKE%b8E���HT\n��35��������l�JE|4�F���~M`�-(�=_X�/#�\n���zxyĢY(SW�m�B2i�����w�@��g\Zֵ���Z�lt��}����*���#\"�ė�/��	���I�Jx���Man\rsS��EiYJ�Ze%�/�v��[�Bwl�wgvq�5�alO):���\0&zɖ�����k�+�(9J�����<�\0bv�ƣ�^*# ��scO\ZjI��$����޵}.��=��U7�8��jG�bs��vi㯃��W8�$��?�\\�����`gj۾�@�?��ʙA�����\r0��=�Ԋ��¶�ygAg5��~B\"��]�-��<���$0E`3��s��P�ͫ�|��o�$\r��]@���}�h�`��/��S(P��w�W@	�F6���\0(z�a\'jjn�a���g�Lw�-ޔ�`!EJ��a_�S���¿1k�\07��X=�\"g�6�ӕX�����\n����\nZ�]�����\r@bD�^�a����ʢX�ح����`��ɉ3έ�=���z������v�Q�91�P*ha�D�1��@r+L�P�h�h�EU\\�_O�YEv\"|�\0�:�%\"��C��R�Zt�DY�Ɉ\\ز���C�$��CН�R�ϡz�Ο-��E�=�����$��&�уs�E�H�Y��1�@���Њ\Z,<@sJ�;����r��!����(�.hsB��k�_h��J�v���G�84OYj-R���f���m�Dt* ���iꐭ���\"�g�\'�`4C3i{\\�P��+ЌXQ��4��+�jBv��~%��h��-׾�t�q^A�_Q��%�/�`��#V�7%(�ـn�W��p���J����$.�(Qo�\Z��O�O�P��z��~z�j�5o��z�w0�C=�+��o�#[+aɜH$�Z�x-z�-\\�r*Z��~���),�\ns7q�o����9�\0<^�JV�\\�=X�~��^Av\Zf�b8�|�����hRV�Ƽ��^\rZ�3��>�7|{�S�|x��ChK~E�z��aƴ��I7�\ZW��%� ��jv.�>U��=l7��x=i��{EN�Zƕ;�JC(��b��1������4:È�L�Zr^�\0�	ն���,HVĉ����X���_q�����W�7��6��	&U�:��{�R-���-SaW�C�D�M���:EvUN#x~�-��?H�(��-S!�%uM��*�k����dV֬B�$T�x4\'q��');
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
