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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `re_num` varchar(30) NOT NULL,
  `re_me_id` varchar(10) NOT NULL,
  `re_date` varchar(15) NOT NULL,
  `re_end_date` varchar(15) NOT NULL,
  `re_s_count` int NOT NULL DEFAULT '0',
  `re_m_count` int NOT NULL DEFAULT '0',
  `re_l_count` int NOT NULL DEFAULT '0',
  `re_state` varchar(5) NOT NULL DEFAULT '완료',
  `re_price` int NOT NULL DEFAULT '0',
  `re_real_price` int NOT NULL DEFAULT '0',
  `re_use_point` int NOT NULL DEFAULT '0',
  `re_add_point` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`re_num`),
  KEY `FK_member_TO_reservation_1` (`re_me_id`),
  CONSTRAINT `FK_member_TO_reservation_1` FOREIGN KEY (`re_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('15','user001','2023-09-18','2023-09-18',1,0,0,'완료',1500,1500,0,0),('16','user001','2023-09-18','2023-09-18',1,0,0,'완료',1500,1500,0,0),('17','user001','2023-09-18','2023-09-18',0,0,0,'완료',0,0,0,0),('18','user001','2023-09-18','2023-09-18',0,0,0,'완료',0,0,0,0),('19','user001','2023-09-18','2023-09-18',1,1,0,'완료',4500,4500,0,0),('user0012023-09-18null','user001','2023-09-18','2023-09-18',1,0,0,'완료',1500,1500,0,0),('user0012023-09-18user001001','user001','2023-09-18','2023-09-18',1,0,0,'완료',1500,1500,0,0),('user0012023-09-18user001002','user001','2023-09-18','2023-09-18',0,1,0,'완료',3000,3000,0,0),('user0012023-09-19user001001','user001','2023-09-19','2023-09-20',1,0,0,'완료',1500,1500,0,0),('user0012023-09-20user001001','user001','2023-09-20','2023-09-23',1,0,0,'완료',1500,1500,0,0),('user0012023-09-23user001001','user001','2023-09-23','2023-09-23',1,0,0,'완료',1500,1500,0,0),('user0012023-09-28user001001','user001','2023-09-28','2023-09-28',1,0,0,'완료',1500,1500,0,0);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-18 20:14:00
