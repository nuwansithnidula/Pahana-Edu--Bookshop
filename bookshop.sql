-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: bookshop
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin User','admin@example.com','admin123','default.jpg'),(2,'nidula nuwansith','nidula@123.com','ddddddddd','Screenshot 2025-03-30 002906.png'),(12,'saman kumara ','saman@gmail.con','1234','Screenshot 2025-03-30 002906.png');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_items` (
  `item_item_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_item_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_items_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_items`
--

LOCK TABLES `bill_items` WRITE;
/*!40000 ALTER TABLE `bill_items` DISABLE KEYS */;
INSERT INTO `bill_items` VALUES (1,2,8,NULL,1,950.00),(2,3,11,NULL,3,150.00),(3,2,12,NULL,1,950.00),(4,6,13,NULL,2,1800.00),(5,6,14,'Oxford English Dictionary',1,1800.00),(6,5,15,'Graph Book (80 pages)',1,180.00),(7,3,16,'A4 Writing Pad - 100 pages',1,150.00),(8,6,16,'Oxford English Dictionary',2,1800.00),(9,6,17,'Oxford English Dictionary',1,1800.00),(10,6,18,'Oxford English Dictionary',2,1800.00),(11,5,18,'Graph Book (80 pages)',1,180.00),(12,3,19,'A4 Writing Pad - 100 pages',2,150.00),(13,6,20,'Oxford English Dictionary',1,1800.00),(14,6,21,'Oxford English Dictionary',1,1800.00),(15,5,22,'Graph Book (80 pages)',1,180.00),(16,6,23,'Oxford English Dictionary',1,1800.00),(17,6,24,'Oxford English Dictionary',1,1800.00),(18,5,24,'Graph Book (80 pages)',3,180.00),(19,3,25,'A4 Writing Pad - 100 pages',2,150.00),(20,6,26,'Oxford English Dictionary',2,1800.00),(21,5,27,'Graph Book (80 pages)',1,180.00),(22,3,27,'A4 Writing Pad - 100 pages',1,150.00),(23,6,28,'Oxford English Dictionary',1,1800.00),(24,2,28,'Science Revision ',2,950.00),(25,6,29,'Oxford English Dictionary',1,1800.00),(26,2,29,'Science Revision ',2,950.00),(27,3,30,'A4 Writing Pad - 100 pages',1,150.00),(28,9,30,'Highlighter Set (4 colors)',2,520.00);
/*!40000 ALTER TABLE `bill_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(20) DEFAULT NULL,
  `bill_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `accountNumber` (`accountNumber`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `customers` (`accountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (4,'C001','2025-08-16 15:59:25',950.00),(5,'C002','2025-08-16 16:01:56',150.00),(8,'C003','2025-08-16 16:26:30',950.00),(11,'C001','2025-08-16 16:33:59',450.00),(12,'C002','2025-08-16 16:57:52',950.00),(13,'C002','2025-08-16 17:04:00',3600.00),(14,'C003','2025-08-16 17:09:33',1800.00),(15,'C003','2025-08-16 17:13:46',180.00),(16,'C003','2025-08-16 17:48:31',3750.00),(17,'C003','2025-08-16 19:56:02',1800.00),(18,'C003','2025-08-16 22:23:49',3780.00),(19,'C003','2025-08-16 22:26:07',300.00),(20,'C003','2025-08-16 23:57:05',1800.00),(21,'C003','2025-08-17 15:28:04',1800.00),(22,'C003','2025-08-17 15:35:03',180.00),(23,'C003','2025-08-17 15:41:21',1800.00),(24,'C003','2025-08-17 15:42:19',2340.00),(25,'C003','2025-08-21 00:09:42',300.00),(26,'C002','2025-08-21 00:17:08',3600.00),(27,'C002','2025-08-21 00:20:56',330.00),(28,'C002','2025-08-21 02:00:29',3700.00),(29,'C002','2025-08-21 02:01:13',3700.00),(30,'C002','2025-08-21 05:59:44',1190.00);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `accountNumber` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('C001','Nimesh Perera','123 Galle Road, Colombo','0771234567','nimesh.perera@example.com'),('C002','Anjali Fernando','45 Temple Lane, Kandy','0769876543','anjali.f@example.com'),('C003','Ruwan Jayasinghe','88 Beach Road, Galle','056547648678687','ruwanjay@gmail.com'),('C004','Namal Udugama','Gampha','0764567812','namal@gmail.com'),('C005','Sadaru Senanayaka','Warakapola','0778530812','Sadaru@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E1','Dinuwan kavinda','dnuwan@gmail.com','1234'),('E2','Tharushi','tharu@example.com','1234567'),('E4','kasun kumara','nuwan@gmail.com','trheryh');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'Science Revision ',950,30),(3,'A4 Writing Pad - 100 pages',150,100),(4,'Gel Pen (Blue)',60,200),(5,'Graph Book (80 pages)',180,80),(6,'Oxford English Dictionary',1800,15),(7,'School Backpack - Large',3200,20),(8,'Ballpoint Pen Set (Pack of 10)',400,75),(9,'Highlighter Set (4 colors)',520,40);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int DEFAULT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
INSERT INTO `payment_history` VALUES (1,12,'2025-08-16 16:57:52',950.00),(2,13,'2025-08-16 17:04:00',3600.00),(3,14,'2025-08-16 17:09:33',1800.00),(4,15,'2025-08-16 17:13:46',180.00),(5,16,'2025-08-16 17:48:31',3750.00),(6,17,'2025-08-16 19:56:02',1800.00),(7,18,'2025-08-16 22:23:49',3780.00),(8,19,'2025-08-16 22:26:07',300.00),(9,20,'2025-08-16 23:57:05',1800.00),(10,21,'2025-08-17 15:28:04',1800.00),(11,22,'2025-08-17 15:35:03',180.00),(12,23,'2025-08-17 15:41:21',1800.00),(13,24,'2025-08-17 15:42:19',2340.00),(14,25,'2025-08-21 00:09:42',300.00),(15,26,'2025-08-21 00:17:08',3600.00),(16,27,'2025-08-21 00:20:56',330.00),(17,28,'2025-08-21 02:00:29',3700.00),(18,29,'2025-08-21 02:01:13',3700.00),(19,30,'2025-08-21 05:59:44',1190.00);
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-21  8:48:31
