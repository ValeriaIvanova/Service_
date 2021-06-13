-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: comics
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `artists_of_comic_book`
--

DROP TABLE IF EXISTS `artists_of_comic_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_of_comic_book` (
  `Comic_artist_ID` int NOT NULL,
  `Comic_book_ID` int NOT NULL,
  PRIMARY KEY (`Comic_artist_ID`,`Comic_book_ID`),
  KEY `Comic_book_ID` (`Comic_book_ID`),
  CONSTRAINT `artists_of_comic_book_ibfk_1` FOREIGN KEY (`Comic_artist_ID`) REFERENCES `comic_artist` (`ID`),
  CONSTRAINT `artists_of_comic_book_ibfk_2` FOREIGN KEY (`Comic_book_ID`) REFERENCES `comic_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_of_comic_book`
--

LOCK TABLES `artists_of_comic_book` WRITE;
/*!40000 ALTER TABLE `artists_of_comic_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_of_comic_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available`
--

DROP TABLE IF EXISTS `available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `available` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Count` int NOT NULL,
  `Price` int NOT NULL,
  `Discount` int NOT NULL,
  `Comic_book_ID` int NOT NULL,
  `Shipment_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Comic_book_ID` (`Comic_book_ID`),
  KEY `Shipment_ID` (`Shipment_ID`),
  CONSTRAINT `available_ibfk_1` FOREIGN KEY (`Comic_book_ID`) REFERENCES `comic_book` (`id`),
  CONSTRAINT `available_ibfk_2` FOREIGN KEY (`Shipment_ID`) REFERENCES `comic_shop` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available`
--

LOCK TABLES `available` WRITE;
/*!40000 ALTER TABLE `available` DISABLE KEYS */;
INSERT INTO `available` VALUES (2,62,120,10,4,1);
/*!40000 ALTER TABLE `available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comic_artist`
--

DROP TABLE IF EXISTS `comic_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comic_artist` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name1` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comic_artist`
--

LOCK TABLES `comic_artist` WRITE;
/*!40000 ALTER TABLE `comic_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `comic_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comic_book`
--

DROP TABLE IF EXISTS `comic_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comic_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Naimenovanie` varchar(250) DEFAULT NULL,
  `Format1` varchar(255) NOT NULL,
  `Description1` text NOT NULL,
  `Publishing_date` date NOT NULL,
  `FOC` date NOT NULL,
  `Label_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Comic_book` (`Label_ID`),
  CONSTRAINT `comic_book_ibfk_1` FOREIGN KEY (`Label_ID`) REFERENCES `lable` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comic_book`
--

LOCK TABLES `comic_book` WRITE;
/*!40000 ALTER TABLE `comic_book` DISABLE KEYS */;
INSERT INTO `comic_book` VALUES (4,'Criminal #12','Single issue','Text','2021-06-24','2021-06-20',1);
/*!40000 ALTER TABLE `comic_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comic_shop`
--

DROP TABLE IF EXISTS `comic_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comic_shop` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Adress` varchar(255) NOT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comic_shop`
--

LOCK TABLES `comic_shop` WRITE;
/*!40000 ALTER TABLE `comic_shop` DISABLE KEYS */;
INSERT INTO `comic_shop` VALUES (1,'б-р Победы, 21','+79048889999');
/*!40000 ALTER TABLE `comic_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comic_writer`
--

DROP TABLE IF EXISTS `comic_writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comic_writer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name1` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comic_writer`
--

LOCK TABLES `comic_writer` WRITE;
/*!40000 ALTER TABLE `comic_writer` DISABLE KEYS */;
/*!40000 ALTER TABLE `comic_writer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics_cover`
--

DROP TABLE IF EXISTS `comics_cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comics_cover` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name1` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `Description1` varchar(255) NOT NULL,
  `Cover_artist_ID` int NOT NULL,
  `Comic_book_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Cover_artist_ID` (`Cover_artist_ID`),
  CONSTRAINT `comics_cover_ibfk_1` FOREIGN KEY (`Cover_artist_ID`) REFERENCES `comic_book` (`id`),
  CONSTRAINT `comics_cover_ibfk_2` FOREIGN KEY (`Cover_artist_ID`) REFERENCES `cover_artist` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics_cover`
--

LOCK TABLES `comics_cover` WRITE;
/*!40000 ALTER TABLE `comics_cover` DISABLE KEYS */;
INSERT INTO `comics_cover` VALUES (3,'Incentive coveR','url.com/url.png','SDCC exclusive',4,4);
/*!40000 ALTER TABLE `comics_cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cover_artist`
--

DROP TABLE IF EXISTS `cover_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cover_artist` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Naimenovanie` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cover_artist`
--

LOCK TABLES `cover_artist` WRITE;
/*!40000 ALTER TABLE `cover_artist` DISABLE KEYS */;
INSERT INTO `cover_artist` VALUES (1,'Chip Zdarsky'),(2,'Chip Zdarsky'),(3,'Chip Zdarsky'),(4,'Chip Zdarsky'),(5,'Chip Zdarsky');
/*!40000 ALTER TABLE `cover_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) NOT NULL,
  `NAME1` varchar(100) NOT NULL,
  `ADRESS` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'customerEmail1@mail.com','Ivanov Ivan','Customer1_adress');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Naimenovanie` varchar(250) DEFAULT NULL,
  `Description2` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Pulp fiction','TEXT');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_of_comic_book`
--

DROP TABLE IF EXISTS `genres_of_comic_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_of_comic_book` (
  `Genre_ID` int NOT NULL,
  `Comic_book_ID` int NOT NULL,
  PRIMARY KEY (`Genre_ID`,`Comic_book_ID`),
  KEY `Comic_book_ID` (`Comic_book_ID`),
  CONSTRAINT `genres_of_comic_book_ibfk_1` FOREIGN KEY (`Genre_ID`) REFERENCES `genre` (`ID`),
  CONSTRAINT `genres_of_comic_book_ibfk_2` FOREIGN KEY (`Comic_book_ID`) REFERENCES `comic_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_of_comic_book`
--

LOCK TABLES `genres_of_comic_book` WRITE;
/*!40000 ALTER TABLE `genres_of_comic_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres_of_comic_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lable`
--

DROP TABLE IF EXISTS `lable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lable` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Naimenovanie` varchar(250) DEFAULT NULL,
  `Description2` varchar(511) NOT NULL,
  `Name_publisher` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lable`
--

LOCK TABLES `lable` WRITE;
/*!40000 ALTER TABLE `lable` DISABLE KEYS */;
INSERT INTO `lable` VALUES (1,'Label1','Text1','DC comics');
/*!40000 ALTER TABLE `lable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_avability`
--

DROP TABLE IF EXISTS `order_avability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_avability` (
  `Availability_ID` int NOT NULL,
  `Order_ID` int NOT NULL,
  `Count` int NOT NULL,
  PRIMARY KEY (`Availability_ID`,`Order_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `order_avability_ibfk_1` FOREIGN KEY (`Availability_ID`) REFERENCES `available` (`ID`),
  CONSTRAINT `order_avability_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `order_book` (`Order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_avability`
--

LOCK TABLES `order_avability` WRITE;
/*!40000 ALTER TABLE `order_avability` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_avability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_book`
--

DROP TABLE IF EXISTS `order_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_book` (
  `Order_number` int NOT NULL AUTO_INCREMENT,
  `Date1` timestamp NOT NULL,
  `Commentary` varchar(255) NOT NULL,
  `Type1` varchar(255) NOT NULL,
  `Worker_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Status1` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Order_number`),
  KEY `Worker_ID` (`Worker_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `order_book_ibfk_1` FOREIGN KEY (`Worker_ID`) REFERENCES `worker` (`ID`),
  CONSTRAINT `order_book_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_book`
--

LOCK TABLES `order_book` WRITE;
/*!40000 ALTER TABLE `order_book` DISABLE KEYS */;
INSERT INTO `order_book` VALUES (1,'2021-05-30 21:00:00','Free sheepment','Buy now',1,1,'Assembled');
/*!40000 ALTER TABLE `order_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `comic_shop_adress` int NOT NULL,
  `NAME1` varchar(255) NOT NULL,
  `POST` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `comic_shop_adress` (`comic_shop_adress`),
  CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`comic_shop_adress`) REFERENCES `comic_shop` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,1,'Даниил Данилов','ADMIN');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writers_of_comic_book`
--

DROP TABLE IF EXISTS `writers_of_comic_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writers_of_comic_book` (
  `Comic_writer_ID` int NOT NULL,
  `Comic_book_ID` int NOT NULL,
  PRIMARY KEY (`Comic_writer_ID`,`Comic_book_ID`),
  KEY `Comic_book_ID` (`Comic_book_ID`),
  CONSTRAINT `writers_of_comic_book_ibfk_1` FOREIGN KEY (`Comic_writer_ID`) REFERENCES `comic_writer` (`ID`),
  CONSTRAINT `writers_of_comic_book_ibfk_2` FOREIGN KEY (`Comic_book_ID`) REFERENCES `comic_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writers_of_comic_book`
--

LOCK TABLES `writers_of_comic_book` WRITE;
/*!40000 ALTER TABLE `writers_of_comic_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `writers_of_comic_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 18:00:39
