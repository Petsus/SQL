-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: petsus
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
-- Table structure for table `verification_user`
--

DROP TABLE IF EXISTS `verification_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expiration_date` datetime NOT NULL,
  `token` text NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_password_reset_user_user` (`user_id`),
  CONSTRAINT `fk_password_reset_user_user` FOREIGN KEY (`user_id`) REFERENCES `authorization_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_user`
--

LOCK TABLES `verification_user` WRITE;
/*!40000 ALTER TABLE `verification_user` DISABLE KEYS */;
INSERT INTO `verification_user` VALUES (24,'2023-11-20 03:57:40','89baccc3-cdca-4809-b7bf-7cf6be6d593b',34,'EMAIL'),(25,'2023-11-20 04:00:40','296e49aa-c1c3-4d1a-a49f-c07975fd30c2',2,'PASSWORD_RESET'),(26,'2023-11-20 04:01:02','17a5cfcd-16ae-4c9a-a2ee-2cb36f225e7c',2,'PASSWORD_RESET'),(27,'2023-11-20 04:01:58','75e7327f-01a3-4779-affb-7fdaaf91e8ba',2,'PASSWORD_RESET'),(28,'2023-11-20 04:02:14','857469d0-62be-40bf-bc6b-9ec28c52ac70',2,'PASSWORD_RESET'),(29,'2023-11-20 04:02:28','542de85c-4217-4f8a-91a3-f84ca556b23f',2,'PASSWORD_RESET'),(30,'2023-11-20 04:08:05','22e5fa5f-d8d6-4c3a-b0c8-ec2e30722012',2,'PASSWORD_RESET'),(31,'2023-11-20 04:08:57','dadc2b77-2880-4ed3-bef2-d044b219ec2b',2,'PASSWORD_RESET');
/*!40000 ALTER TABLE `verification_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20  2:58:12
