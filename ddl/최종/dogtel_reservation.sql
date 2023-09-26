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
  `re_num` varchar(50) NOT NULL,
  `re_me_id` varchar(10) NOT NULL,
  `re_date` varchar(15) NOT NULL,
  `re_end_date` varchar(15) NOT NULL,
  `re_s_count` int NOT NULL DEFAULT '0',
  `re_m_count` int NOT NULL DEFAULT '0',
  `re_l_count` int NOT NULL DEFAULT '0',
  `re_state` varchar(5) NOT NULL DEFAULT '미완료',
  `re_price` int NOT NULL DEFAULT '0',
  `re_real_price` int DEFAULT NULL,
  `re_use_point` int NOT NULL DEFAULT '0',
  `re_add_point` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`re_num`),
  KEY `reserv_to_member_idx` (`re_me_id`),
  CONSTRAINT `reservtome,` FOREIGN KEY (`re_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('test09262023-09-27test0926001','test0926','2023-09-27','2023-09-28',1,0,1,'완료',6000,6000,0,300),('test09262023-09-29test0926001','test0926','2023-09-29','2023-09-30',1,0,0,'완료',1500,1500,0,150),('test12342023-09-27test1234001','test1234','2023-09-27','2023-09-28',1,1,0,'완료',4500,4500,0,225),('test12342023-09-29test1234001','test1234','2023-09-29','2023-09-30',1,0,0,'미완료',1500,NULL,0,0),('test12342023-09-29test1234002','test1234','2023-09-29','2023-10-10',0,1,0,'완료',3000,3000,0,150);
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

-- Dump completed on 2023-09-26 22:21:05
