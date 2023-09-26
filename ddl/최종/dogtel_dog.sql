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
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog` (
  `d_num` varchar(13) NOT NULL,
  `d_name` varchar(20) NOT NULL,
  `d_age` int NOT NULL,
  `d_age_type` char(1) NOT NULL DEFAULT 'Y',
  `d_gen` char(1) DEFAULT NULL,
  `d_kg` int NOT NULL,
  `d_detail` varchar(50) DEFAULT NULL,
  `d_me_id` varchar(10) NOT NULL,
  `d_si_name` varchar(6) NOT NULL,
  PRIMARY KEY (`d_num`),
  KEY `FK_member_TO_dog_1` (`d_me_id`),
  KEY `FK_size_TO_dog_1` (`d_si_name`),
  CONSTRAINT `FK_size_TO_dog_1` FOREIGN KEY (`d_si_name`) REFERENCES `size` (`si_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog`
--

LOCK TABLES `dog` WRITE;
/*!40000 ALTER TABLE `dog` DISABLE KEYS */;
INSERT INTO `dog` VALUES ('qweqwe1234001','노트',10,'Y','F',33,'','qweqwe1234','L'),('test0926001','왈왈',4,'Y','F',5,'','test0926','S'),('test0926002','뿌꾸',4,'Y','F',20,'','test0926','L'),('test0926003','써니써니',10,'Y','M',15,'','test0926','M'),('test1234001','왈왈',11,'Y','M',11,'','test1234','M'),('test1234002','짜장',5,'Y','M',17,'','test1234','M');
/*!40000 ALTER TABLE `dog` ENABLE KEYS */;
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
