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
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `po_num` int NOT NULL AUTO_INCREMENT,
  `po_point` int NOT NULL DEFAULT '0',
  `po_content` varchar(30) DEFAULT NULL,
  `po_me_id` varchar(10) NOT NULL,
  `po_re_num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`po_num`),
  KEY `FK_member_TO_point_1` (`po_me_id`),
  KEY `FK_reservation_TO_point_1_idx` (`po_re_num`),
  CONSTRAINT `FK_member_TO_point_1` FOREIGN KEY (`po_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_reservation_TO_point_1` FOREIGN KEY (`po_re_num`) REFERENCES `reservation` (`re_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (1,300,'테스트','user001',NULL),(2,1500,'테스트','user001',NULL),(11,1000,'이벤트 당첨','qwe',NULL),(12,1000,'이벤트 당첨','qwe',NULL),(18,0,'호텔 결제시 포인트 사용에 의한 차감','qwe','qwe2023-09-19qwe001'),(19,225,'호텔 결제에 의한 적립','qwe','qwe2023-09-19qwe001'),(20,-100,'호텔 결제시 포인트 사용에 의한 차감','qwe','qwe2023-09-20qwe001'),(21,140,'호텔 결제에 의한 적립','qwe','qwe2023-09-20qwe001'),(23,100,'관리자로 포인트적립 테스트','qwe',NULL);
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 17:41:43
