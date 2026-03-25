-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: airport_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircrafts` (
  `aircraft_id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `reg_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`aircraft_id`),
  UNIQUE KEY `reg_number` (`reg_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES (1,'Boeing 737-800','Boeing',189,'MNG-737-01'),(2,'Airbus A320','Airbus',180,'MNG-A320-02'),(3,'Boeing 787-9','Boeing',296,'MNG-787-03'),(4,'Airbus A321neo','Airbus',220,'MNG-A321-04'),(5,'Embraer E190','Embraer',100,'MNG-E190-05');
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  `aircraft_id` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `flight_number` (`flight_number`),
  KEY `fk_flight_aircraft` (`aircraft_id`),
  CONSTRAINT `fk_flight_aircraft` FOREIGN KEY (`aircraft_id`) REFERENCES `aircrafts` (`aircraft_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'MN101','Ulaanbaatar','Beijing','2025-06-01 08:00:00','2025-06-01 12:00:00',1),(2,'MN202','Ulaanbaatar','Tokyo','2025-06-02 10:30:00','2025-06-02 18:30:00',2),(3,'MN303','Ulaanbaatar','Seoul','2025-06-03 07:00:00','2025-06-03 13:00:00',3),(4,'MN404','Beijing','Ulaanbaatar','2025-06-04 14:00:00','2025-06-04 18:00:00',1),(5,'MN505','Tokyo','Ulaanbaatar','2025-06-05 20:00:00','2025-06-06 04:00:00',4),(6,'MN606','Ulaanbaatar','Frankfurt','2025-06-06 23:00:00','2025-06-07 06:00:00',3);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passport_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `passport_no` (`passport_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'Batbold','Dorj','MN1234567','batbold@example.mn','+97699001122'),(2,'Oyunaa','Ganbayar','MN2345678','oyunaa@example.mn','+97699003344'),(3,'Enkhtuyaa','Bold','MN3456789','enkh@example.mn','+97699005566'),(4,'Munkhbayar','Tsedev','MN4567890','munkh@example.mn','+97699007788'),(5,'Solongo','Batsuren','MN5678901','solongo@example.mn','+97699009900'),(6,'Ariunaa','Nyamdorj','MN6789012','ariunaa@example.mn','+97699001234'),(7,'Tegshbayar','Lkhagva','MN7890123','tegsh@example.mn','+97699005678');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `ticket_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passenger_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `seat_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `booking_date` date NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `ticket_number` (`ticket_number`),
  KEY `fk_ticket_passenger` (`passenger_id`),
  KEY `fk_ticket_flight` (`flight_id`),
  CONSTRAINT `fk_ticket_flight` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`),
  CONSTRAINT `fk_ticket_passenger` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'TKT-0001',1,1,'12A',250.00,'2025-05-01'),(2,'TKT-0002',2,1,'12B',250.00,'2025-05-01'),(3,'TKT-0003',3,2,'05C',480.00,'2025-05-02'),(4,'TKT-0004',4,2,'07A',480.00,'2025-05-03'),(5,'TKT-0005',5,3,'15B',320.00,'2025-05-04'),(6,'TKT-0006',1,3,'20A',320.00,'2025-05-04'),(7,'TKT-0007',2,4,'08C',260.00,'2025-05-05'),(8,'TKT-0008',6,5,'01A',510.00,'2025-05-06'),(9,'TKT-0009',7,6,'22D',890.00,'2025-05-07'),(10,'TKT-0010',3,6,'22E',890.00,'2025-05-07');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-25 10:57:44
