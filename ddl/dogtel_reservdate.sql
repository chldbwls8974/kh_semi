CREATE DATABASE  IF NOT EXISTS `dogtel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dogtel`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: dogtel
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `reservdate`
--

DROP TABLE IF EXISTS `reservdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservdate` (
  `rd_num` int NOT NULL AUTO_INCREMENT,
  `rd_ro_num` int NOT NULL,
  `rd_br_num` int NOT NULL,
  `rd_date` varchar(15) NOT NULL,
  PRIMARY KEY (`rd_num`),
  KEY `rd_to_ro_idx` (`rd_ro_num`),
  KEY `rd_to_br_idx` (`rd_br_num`),
  CONSTRAINT `rd_to_br` FOREIGN KEY (`rd_br_num`) REFERENCES `branch` (`br_num`),
  CONSTRAINT `rd_to_ro` FOREIGN KEY (`rd_ro_num`) REFERENCES `room` (`ro_num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservdate`
--

LOCK TABLES `reservdate` WRITE;
/*!40000 ALTER TABLE `reservdate` DISABLE KEYS */;
INSERT INTO `reservdate` VALUES (13,1,1,'2023-09-21'),(14,1,1,'2023-09-22'),(15,2,1,'2023-09-21'),(16,2,1,'2023-09-22'),(19,1,1,'2023-09-22'),(20,1,1,'2023-09-23');
/*!40000 ALTER TABLE `reservdate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-22  9:13:35
