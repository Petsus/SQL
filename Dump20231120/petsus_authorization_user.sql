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
-- Table structure for table `authorization_user`
--

DROP TABLE IF EXISTS `authorization_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_user`
--

LOCK TABLES `authorization_user` WRITE;
/*!40000 ALTER TABLE `authorization_user` DISABLE KEYS */;
INSERT INTO `authorization_user` VALUES (1,'adashino.benio@gmail.com','$2a$10$cAKJHdTTPwCAW1Q55.oNreKFOAx64x3GdOEVD.ZoHfcOTept9JZ7C','Adashino Benio',1),(2,'makoto.nijjima@email.com','$2a$10$JqDFn.1kfsBHIu2ZDTxRJO9bjxVPKbQyt2p5zNdZM2M.Cu/7fP7eS','Makoto Nijiima',1),(3,'yukari.takeba@email.com','$2a$10$8nNCjAPUTvbGLLacgcn5AekGUVvzoYKRLr/UVyQwysJm95f1t63xK','Yukari Takeba',1),(5,'elizabeth.p3@email.com','$2a$10$PQW9mGfVmHtmkroSH1Ln1udZeytAyQdJom1AAY3fqF6ksdRLM/vSK','Elizabeth',1),(6,'margaret.p4@email.com','$2a$10$S1HccnDToT29WhwD3/C51eUEKiMizlUQOsC4tPEDfK8FfxQRq9AZG','Margaret',1),(34,'teste@email.com','$2a$10$GtnUWFpME9MMVaVA0tmdFOIIgSU5AZ.8FM7AytRXzZcAxK/GK52wm','teste',1);
/*!40000 ALTER TABLE `authorization_user` ENABLE KEYS */;
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
