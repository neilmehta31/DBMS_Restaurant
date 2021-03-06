-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: rest
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
-- Table structure for table `bench`
--

DROP TABLE IF EXISTS `bench`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bench` (
  `BENCH_NUM` int NOT NULL,
  `ISOCCUPIED` tinyint(1) DEFAULT NULL,
  `WAITER_ID` int DEFAULT NULL,
  PRIMARY KEY (`BENCH_NUM`),
  KEY `WAITER_ID` (`WAITER_ID`),
  CONSTRAINT `bench_ibfk_1` FOREIGN KEY (`WAITER_ID`) REFERENCES `waiter` (`WAITER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bench`
--

LOCK TABLES `bench` WRITE;
/*!40000 ALTER TABLE `bench` DISABLE KEYS */;
INSERT INTO `bench` VALUES (0,0,1),(1,1,2),(2,0,3),(3,0,4),(4,0,5),(5,0,1),(6,0,2),(7,0,3),(8,0,4),(9,0,5),(10,0,1),(11,0,2),(12,0,3),(13,0,4),(14,0,5),(15,0,1),(16,0,2),(17,0,3),(18,0,4),(19,0,5),(20,0,1),(21,0,2),(22,0,3),(23,0,4),(24,0,5),(25,0,1),(26,0,2),(27,0,3),(28,0,4),(29,0,5);
/*!40000 ALTER TABLE `bench` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20  1:50:34
