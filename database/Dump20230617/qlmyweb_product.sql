-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: qlmyweb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `danhmuc` int NOT NULL,
  `gia` double NOT NULL,
  `tinhtrang` bit(5) NOT NULL,
  `mota` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ngaytao` date NOT NULL,
  `hinhanh` longtext NOT NULL,
  `soluong` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_product2_idx` (`danhmuc`),
  CONSTRAINT `FK_product2` FOREIGN KEY (`danhmuc`) REFERENCES `danhmuc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (48,'Tivi Samsung',6,7000,_binary '','<p>khong co</p>','2023-06-04','smartcity.jpeg',1),(49,'abc',6,1000,_binary '','<p><i><strong>huhu</strong></i></p>','2023-06-04','tivi.jpeg',1),(51,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(52,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(53,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(54,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(55,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(56,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(57,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(58,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(59,'abc',6,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(60,'abc',4,1000,_binary '','<p>hehe</p>','2023-06-04','tivi.jpeg',1),(61,'xyz',6,5000,_binary '','<p><i><strong>123456</strong></i></p>','2023-06-04','tx.png',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-17 22:49:44
