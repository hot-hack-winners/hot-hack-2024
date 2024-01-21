CREATE DATABASE  IF NOT EXISTS `hot-hack-2024` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hot-hack-2024`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: ls-80cd1b8fb0252fde234d565db024b9593fd96ff4.ckxs1fhmtwsl.ap-southeast-2.rds.amazonaws.com    Database: hot-hack-2024
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `organisations_uuid` char(36) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `admin_fk1_idx` (`organisations_uuid`),
  CONSTRAINT `admin_fk1` FOREIGN KEY (`organisations_uuid`) REFERENCES `venues` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('2f2abf15-b741-11ee-afca-025a69a1f11b','a2e67853-b74f-11ee-afca-025a69a1f11b','string','string','$2b$10$wAwXEcqzLfLCOsHcNEpeCOKV8zEPwRGNZjX.XD'),('a7f86006-b766-11ee-afca-025a69a1f11b','a2e67853-b74f-11ee-afca-025a69a1f11b','TestOrganisation1','testorg@email.com','$2b$10$rOc/4T.Y6Xk7my64DKMq6eQJSaF6s.BY.v0H/i');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `uuid` char(36) NOT NULL,
  `spotify_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `popularity` int DEFAULT NULL,
  PRIMARY KEY (`uuid`,`spotify_id`),
  UNIQUE KEY `spotify_id_UNIQUE` (`spotify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES ('1f3f3ee0-b820-11ee-afca-025a69a1f11b','7jxJ25p0pPjk0MStloN6o6','Blind Guardian',53),('1f51abe9-b820-11ee-afca-025a69a1f11b','5eAWCfyUhZtHHtBdNk56l1','System Of A Down',78),('1f63f01a-b820-11ee-afca-025a69a1f11b','2tRsMl4eGxwoNabM08Dm4I','Judas Priest',65),('1f76fd8d-b820-11ee-afca-025a69a1f11b','2ye2Wgw4gimLv2eAKyk1NB','Metallica',81),('1f89c56a-b820-11ee-afca-025a69a1f11b','4O6RDLeFX5xuQ7IePFzVcl','Demons & Wizards',35),('1f9e0d80-b820-11ee-afca-025a69a1f11b','2RSApl0SXcVT8Yiy4UaPSt','Ayreon',42),('1fb015dc-b820-11ee-afca-025a69a1f11b','1IQ2e1buppatiN1bxUVkrk','Slayer',65),('1fc3a1c7-b820-11ee-afca-025a69a1f11b','05fG473iIaoy82BF1aGhL8','Slipknot',77),('1fd63ba5-b820-11ee-afca-025a69a1f11b','1f5GqyOPo0CkotzzRwviBu','The Lonely Island',56),('1fe88a3d-b820-11ee-afca-025a69a1f11b','5vbtZfRJjn2QLhPhtYpiqi','Daron Malakian and Scars On Broadway',49),('1ffd14fc-b820-11ee-afca-025a69a1f11b','1wUArE0NhHB8M1bU2WSplY','Nevermore',38),('200fc2cb-b820-11ee-afca-025a69a1f11b','2d0hyoQ5ynDBnkvAbJKORj','Rage Against The Machine',70),('20223d0f-b820-11ee-afca-025a69a1f11b','3RNrq3jvMZxD9ZyoOZbQOD','Korn',74),('2039c0a3-b820-11ee-afca-025a69a1f11b','1dfeR4HaWDbWqFHLkxsg1d','Queen',84),('204c84ad-b820-11ee-afca-025a69a1f11b','2pH3wEn4eYlMMIIQyKPbVR','DragonForce',58),('205faec9-b820-11ee-afca-025a69a1f11b','3IjLXN4eSksdGj8uDE4Jm1','Rhapsody Of Fire',41),('2072975e-b820-11ee-afca-025a69a1f11b','5M52tdBnJaKSvOpJGz8mfZ','Black Sabbath',72),('20855e74-b820-11ee-afca-025a69a1f11b','1XpDYCrUJnvCo9Ez6yeMWh','Tenacious D',61),('2098b8fc-b820-11ee-afca-025a69a1f11b','3TOqt5oJwL9BE2NG9MEwDa','Disturbed',72),('20adf04a-b820-11ee-afca-025a69a1f11b','7jy3rLJdDQY21OgRLCZ9sD','Foo Fighters',77),('c9bbce17-b81e-11ee-afca-025a69a1f11b','7A3EfKcEMZeHldRMXJmB45','Joshua Kyan Aalampour',55),('c9ce2ae0-b81e-11ee-afca-025a69a1f11b','6BF0bXbsdujMSMeFZBGcBq','Thomas Bergersen',65),('c9e132ca-b81e-11ee-afca-025a69a1f11b','38WbKH6oKAZskBhqDFA8Uj','ZUTOMAYO',63),('c9f5056d-b81e-11ee-afca-025a69a1f11b','4sf4DrAOkheqktxTyKm7tO','AmaLee',58),('ca081f58-b81e-11ee-afca-025a69a1f11b','2qvP9yerCZCS0U1gZU8wYp','Two Steps from Hell',63),('ca1d848d-b81e-11ee-afca-025a69a1f11b','0y0nI8lwDB2HRUPwDQuuiu','岡部啓一',49),('ca310ce5-b81e-11ee-afca-025a69a1f11b','0Riv2KnFcLZA3JSVryRg4y','Hiroyuki Sawano',65),('ca44120a-b81e-11ee-afca-025a69a1f11b','39gp1NxfhmLEyvNggMH4xg','Arleen Auger',35),('ca5739e9-b81e-11ee-afca-025a69a1f11b','06HL4z0CvFAxyc27GXpf02','Taylor Swift',2),('ca6a5eac-b81e-11ee-afca-025a69a1f11b','4aP1lp10BRYZO658B2NwkG','Andrew Lloyd Webber',61),('ca7cfdb0-b81e-11ee-afca-025a69a1f11b','1NRrtMvT3o1TI6I8XCuweq','MYTH & ROID',53),('ca8fa9f5-b81e-11ee-afca-025a69a1f11b','34QbYbTlUCLkZsQ8QmacV9','DJ Okawari',43),('caa283eb-b81e-11ee-afca-025a69a1f11b','3eNYrVLcWfjJ9JdH9kiPJO','Linked Horizon',61),('cab604a3-b81e-11ee-afca-025a69a1f11b','5kjhjobRqKH7jgi9kvHhU6','Dai',33),('cacbd7f5-b81e-11ee-afca-025a69a1f11b','62WlmMYBs1kbHHvlDpML1z','帆足圭吾',45),('cae03927-b81e-11ee-afca-025a69a1f11b','3AVA9bUTMNoJ9RrbmB0YfW','Halo',58),('caf5f479-b81e-11ee-afca-025a69a1f11b','2ookZjNsAvPdiaGWn86ub1','Truls Mørk',29),('cb0a3e19-b81e-11ee-afca-025a69a1f11b','1gIjaA2XzQwFRHIvVuKwJW','Dorothee Mields',36),('cb1fb67b-b81e-11ee-afca-025a69a1f11b','18moNotPmBWa2YZtRnIoZ3','Eir Aoi',50),('cb342659-b81e-11ee-afca-025a69a1f11b','1Mxqyy3pSjf8kZZL4QVxS0','Frank Sinatra',81);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendee_artists`
--

DROP TABLE IF EXISTS `attendee_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendee_artists` (
  `attendee_uuid` char(36) NOT NULL,
  `artist_uuid` char(36) NOT NULL,
  PRIMARY KEY (`attendee_uuid`,`artist_uuid`),
  KEY `attendee_artists_fk2_idx` (`artist_uuid`),
  CONSTRAINT `attendee_artists_fk1` FOREIGN KEY (`attendee_uuid`) REFERENCES `attendees` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendee_artists_fk2` FOREIGN KEY (`artist_uuid`) REFERENCES `artists` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee_artists`
--

LOCK TABLES `attendee_artists` WRITE;
/*!40000 ALTER TABLE `attendee_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendee_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendees` (
  `uuid` char(36) NOT NULL,
  `spotify_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendees`
--

LOCK TABLES `attendees` WRITE;
/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
INSERT INTO `attendees` VALUES ('008f3116-b815-11ee-afca-025a69a1f11b','22lcpomod62cjdgkvygmnauaa','Tex Andersen','fake@fake.com'),('5bfa2a40-b815-11ee-afca-025a69a1f11b','jessequickscope','jessequickscope','fake@fake.com');
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `uuid` char(36) NOT NULL,
  `spotify_artists_id` varchar(45) DEFAULT NULL,
  `gigs_uuid` char(36) NOT NULL,
  `attendees_uuid` char(36) NOT NULL,
  `ranking` varchar(45) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `venues_uuid` char(36) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `favorites_idx` (`spotify_artists_id`),
  KEY `favorites_fk2_idx` (`gigs_uuid`),
  KEY `favorites_fk3_idx` (`attendees_uuid`),
  KEY `favorites_fk4_idx` (`venues_uuid`),
  CONSTRAINT `favorites_fk1` FOREIGN KEY (`gigs_uuid`) REFERENCES `gigs` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorites_fk2` FOREIGN KEY (`attendees_uuid`) REFERENCES `attendees` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorites_fk3` FOREIGN KEY (`venues_uuid`) REFERENCES `venues` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES ('00e25356-b815-11ee-afca-025a69a1f11b','7jxJ25p0pPjk0MStloN6o6','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','53','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('00ee55d4-b815-11ee-afca-025a69a1f11b','5eAWCfyUhZtHHtBdNk56l1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','78','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('00f9eec7-b815-11ee-afca-025a69a1f11b','2tRsMl4eGxwoNabM08Dm4I','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0105a860-b815-11ee-afca-025a69a1f11b','2ye2Wgw4gimLv2eAKyk1NB','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','81','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('011291d8-b815-11ee-afca-025a69a1f11b','4O6RDLeFX5xuQ7IePFzVcl','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','35','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('011e6505-b815-11ee-afca-025a69a1f11b','2RSApl0SXcVT8Yiy4UaPSt','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','42','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('012abff2-b815-11ee-afca-025a69a1f11b','1IQ2e1buppatiN1bxUVkrk','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0136ffd0-b815-11ee-afca-025a69a1f11b','05fG473iIaoy82BF1aGhL8','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0142f856-b815-11ee-afca-025a69a1f11b','1f5GqyOPo0CkotzzRwviBu','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','56','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('01517222-b815-11ee-afca-025a69a1f11b','5vbtZfRJjn2QLhPhtYpiqi','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','49','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('015d753c-b815-11ee-afca-025a69a1f11b','1wUArE0NhHB8M1bU2WSplY','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','38','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0169d9c4-b815-11ee-afca-025a69a1f11b','2d0hyoQ5ynDBnkvAbJKORj','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','70','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0176f658-b815-11ee-afca-025a69a1f11b','3RNrq3jvMZxD9ZyoOZbQOD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','74','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('018308e1-b815-11ee-afca-025a69a1f11b','1dfeR4HaWDbWqFHLkxsg1d','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','84','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('018f56b7-b815-11ee-afca-025a69a1f11b','2pH3wEn4eYlMMIIQyKPbVR','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','58','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('019b1726-b815-11ee-afca-025a69a1f11b','3IjLXN4eSksdGj8uDE4Jm1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','41','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('01a70fcf-b815-11ee-afca-025a69a1f11b','5M52tdBnJaKSvOpJGz8mfZ','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('01b3a447-b815-11ee-afca-025a69a1f11b','1XpDYCrUJnvCo9Ez6yeMWh','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','61','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('01c01322-b815-11ee-afca-025a69a1f11b','3TOqt5oJwL9BE2NG9MEwDa','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('01cbf3fb-b815-11ee-afca-025a69a1f11b','7jy3rLJdDQY21OgRLCZ9sD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 04:24:42','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0800543c-b81f-11ee-afca-025a69a1f11b','7A3EfKcEMZeHldRMXJmB45','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','55','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('080e4ae0-b81f-11ee-afca-025a69a1f11b','6BF0bXbsdujMSMeFZBGcBq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('081c59ca-b81f-11ee-afca-025a69a1f11b','38WbKH6oKAZskBhqDFA8Uj','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('082d734d-b81f-11ee-afca-025a69a1f11b','4sf4DrAOkheqktxTyKm7tO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('083cde65-b81f-11ee-afca-025a69a1f11b','2qvP9yerCZCS0U1gZU8wYp','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('084bd77f-b81f-11ee-afca-025a69a1f11b','0y0nI8lwDB2HRUPwDQuuiu','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','49','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('085c6bde-b81f-11ee-afca-025a69a1f11b','0Riv2KnFcLZA3JSVryRg4y','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('086ad22b-b81f-11ee-afca-025a69a1f11b','39gp1NxfhmLEyvNggMH4xg','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','35','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0879792c-b81f-11ee-afca-025a69a1f11b','06HL4z0CvFAxyc27GXpf02','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','100','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('088792c2-b81f-11ee-afca-025a69a1f11b','4aP1lp10BRYZO658B2NwkG','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08959673-b81f-11ee-afca-025a69a1f11b','1NRrtMvT3o1TI6I8XCuweq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','53','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08a38104-b81f-11ee-afca-025a69a1f11b','34QbYbTlUCLkZsQ8QmacV9','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','43','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08b1b5d0-b81f-11ee-afca-025a69a1f11b','3eNYrVLcWfjJ9JdH9kiPJO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08c2a6a1-b81f-11ee-afca-025a69a1f11b','5kjhjobRqKH7jgi9kvHhU6','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','33','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08d28f63-b81f-11ee-afca-025a69a1f11b','62WlmMYBs1kbHHvlDpML1z','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','45','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08e21e27-b81f-11ee-afca-025a69a1f11b','3AVA9bUTMNoJ9RrbmB0YfW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('08f124ea-b81f-11ee-afca-025a69a1f11b','2ookZjNsAvPdiaGWn86ub1','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','29','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09012275-b81f-11ee-afca-025a69a1f11b','1gIjaA2XzQwFRHIvVuKwJW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','36','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09120334-b81f-11ee-afca-025a69a1f11b','18moNotPmBWa2YZtRnIoZ3','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','50','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09148829-b815-11ee-afca-025a69a1f11b','7jxJ25p0pPjk0MStloN6o6','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','53','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('091f5bd1-b815-11ee-afca-025a69a1f11b','5eAWCfyUhZtHHtBdNk56l1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','78','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09207df8-b81f-11ee-afca-025a69a1f11b','1Mxqyy3pSjf8kZZL4QVxS0','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','81','2024-01-21 05:36:31','a2e67853-b74f-11ee-afca-025a69a1f11b'),('092a4b30-b815-11ee-afca-025a69a1f11b','2tRsMl4eGxwoNabM08Dm4I','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09366011-b815-11ee-afca-025a69a1f11b','2ye2Wgw4gimLv2eAKyk1NB','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','81','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0940e1f0-b815-11ee-afca-025a69a1f11b','4O6RDLeFX5xuQ7IePFzVcl','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','35','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('094b4278-b815-11ee-afca-025a69a1f11b','2RSApl0SXcVT8Yiy4UaPSt','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','42','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0955c02c-b815-11ee-afca-025a69a1f11b','1IQ2e1buppatiN1bxUVkrk','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0961441e-b815-11ee-afca-025a69a1f11b','05fG473iIaoy82BF1aGhL8','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('096e51d6-b815-11ee-afca-025a69a1f11b','1f5GqyOPo0CkotzzRwviBu','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','56','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0978877c-b815-11ee-afca-025a69a1f11b','5vbtZfRJjn2QLhPhtYpiqi','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','49','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('0982da4d-b815-11ee-afca-025a69a1f11b','1wUArE0NhHB8M1bU2WSplY','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','38','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('098da21f-b815-11ee-afca-025a69a1f11b','2d0hyoQ5ynDBnkvAbJKORj','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','70','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09981aea-b815-11ee-afca-025a69a1f11b','3RNrq3jvMZxD9ZyoOZbQOD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','74','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09a2a1c0-b815-11ee-afca-025a69a1f11b','1dfeR4HaWDbWqFHLkxsg1d','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','84','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09ad0d1f-b815-11ee-afca-025a69a1f11b','2pH3wEn4eYlMMIIQyKPbVR','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','58','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09b7f701-b815-11ee-afca-025a69a1f11b','3IjLXN4eSksdGj8uDE4Jm1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','41','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09c26827-b815-11ee-afca-025a69a1f11b','5M52tdBnJaKSvOpJGz8mfZ','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09cd76c4-b815-11ee-afca-025a69a1f11b','1XpDYCrUJnvCo9Ez6yeMWh','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','61','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09dc24ad-b815-11ee-afca-025a69a1f11b','3TOqt5oJwL9BE2NG9MEwDa','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('09e7481d-b815-11ee-afca-025a69a1f11b','7jy3rLJdDQY21OgRLCZ9sD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 04:24:56','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1f486ef9-b820-11ee-afca-025a69a1f11b','7jxJ25p0pPjk0MStloN6o6','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','53','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1f5a71f9-b820-11ee-afca-025a69a1f11b','5eAWCfyUhZtHHtBdNk56l1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','78','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1f6d661d-b820-11ee-afca-025a69a1f11b','2tRsMl4eGxwoNabM08Dm4I','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1f802813-b820-11ee-afca-025a69a1f11b','2ye2Wgw4gimLv2eAKyk1NB','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','81','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1f93cc00-b820-11ee-afca-025a69a1f11b','4O6RDLeFX5xuQ7IePFzVcl','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','35','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1fa71a4f-b820-11ee-afca-025a69a1f11b','2RSApl0SXcVT8Yiy4UaPSt','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','42','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1fb979cb-b820-11ee-afca-025a69a1f11b','1IQ2e1buppatiN1bxUVkrk','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1fcccfb8-b820-11ee-afca-025a69a1f11b','05fG473iIaoy82BF1aGhL8','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1fdf38f7-b820-11ee-afca-025a69a1f11b','1f5GqyOPo0CkotzzRwviBu','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','56','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1ff359c9-b820-11ee-afca-025a69a1f11b','5vbtZfRJjn2QLhPhtYpiqi','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','49','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('200665da-b820-11ee-afca-025a69a1f11b','1wUArE0NhHB8M1bU2WSplY','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','38','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('201918e1-b820-11ee-afca-025a69a1f11b','2d0hyoQ5ynDBnkvAbJKORj','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','70','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('202fae96-b820-11ee-afca-025a69a1f11b','3RNrq3jvMZxD9ZyoOZbQOD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','74','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('2043198f-b820-11ee-afca-025a69a1f11b','1dfeR4HaWDbWqFHLkxsg1d','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','84','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('20562961-b820-11ee-afca-025a69a1f11b','2pH3wEn4eYlMMIIQyKPbVR','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('20689d14-b820-11ee-afca-025a69a1f11b','3IjLXN4eSksdGj8uDE4Jm1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','41','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('207c7e2a-b820-11ee-afca-025a69a1f11b','5M52tdBnJaKSvOpJGz8mfZ','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('208e8962-b820-11ee-afca-025a69a1f11b','1XpDYCrUJnvCo9Ez6yeMWh','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('20a1bb61-b820-11ee-afca-025a69a1f11b','3TOqt5oJwL9BE2NG9MEwDa','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('20b7661a-b820-11ee-afca-025a69a1f11b','7jy3rLJdDQY21OgRLCZ9sD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 05:44:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5897238d-b820-11ee-afca-025a69a1f11b','7jxJ25p0pPjk0MStloN6o6','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','53','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58a333a1-b820-11ee-afca-025a69a1f11b','5eAWCfyUhZtHHtBdNk56l1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','78','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58af91bc-b820-11ee-afca-025a69a1f11b','2tRsMl4eGxwoNabM08Dm4I','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58bc49c2-b820-11ee-afca-025a69a1f11b','2ye2Wgw4gimLv2eAKyk1NB','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','81','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58c96471-b820-11ee-afca-025a69a1f11b','4O6RDLeFX5xuQ7IePFzVcl','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','35','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58d591d2-b820-11ee-afca-025a69a1f11b','2RSApl0SXcVT8Yiy4UaPSt','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','42','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58e23300-b820-11ee-afca-025a69a1f11b','1IQ2e1buppatiN1bxUVkrk','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58ee2a66-b820-11ee-afca-025a69a1f11b','05fG473iIaoy82BF1aGhL8','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('58fb2876-b820-11ee-afca-025a69a1f11b','1f5GqyOPo0CkotzzRwviBu','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','56','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5907a731-b820-11ee-afca-025a69a1f11b','5vbtZfRJjn2QLhPhtYpiqi','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','49','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5913aa2c-b820-11ee-afca-025a69a1f11b','1wUArE0NhHB8M1bU2WSplY','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','38','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('591fcf0f-b820-11ee-afca-025a69a1f11b','2d0hyoQ5ynDBnkvAbJKORj','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','70','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('592db945-b820-11ee-afca-025a69a1f11b','3RNrq3jvMZxD9ZyoOZbQOD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','74','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('593a473d-b820-11ee-afca-025a69a1f11b','1dfeR4HaWDbWqFHLkxsg1d','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','84','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5946b702-b820-11ee-afca-025a69a1f11b','2pH3wEn4eYlMMIIQyKPbVR','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('59533745-b820-11ee-afca-025a69a1f11b','3IjLXN4eSksdGj8uDE4Jm1','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','41','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('595fba20-b820-11ee-afca-025a69a1f11b','5M52tdBnJaKSvOpJGz8mfZ','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('596bd853-b820-11ee-afca-025a69a1f11b','1XpDYCrUJnvCo9Ez6yeMWh','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5977eec0-b820-11ee-afca-025a69a1f11b','3TOqt5oJwL9BE2NG9MEwDa','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','72','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('59843299-b820-11ee-afca-025a69a1f11b','7jy3rLJdDQY21OgRLCZ9sD','2130ff41-b851-11ee-afca-025a69a1f420','008f3116-b815-11ee-afca-025a69a1f11b','77','2024-01-21 05:45:53','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c47ab4d-b815-11ee-afca-025a69a1f11b','7A3EfKcEMZeHldRMXJmB45','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','55','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c55b31b-b815-11ee-afca-025a69a1f11b','6BF0bXbsdujMSMeFZBGcBq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c63bcfe-b815-11ee-afca-025a69a1f11b','38WbKH6oKAZskBhqDFA8Uj','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c708b75-b815-11ee-afca-025a69a1f11b','4sf4DrAOkheqktxTyKm7tO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c7d89a7-b815-11ee-afca-025a69a1f11b','2qvP9yerCZCS0U1gZU8wYp','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c8c3deb-b815-11ee-afca-025a69a1f11b','0y0nI8lwDB2HRUPwDQuuiu','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','49','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c980032-b815-11ee-afca-025a69a1f11b','0Riv2KnFcLZA3JSVryRg4y','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5ca49c8b-b815-11ee-afca-025a69a1f11b','39gp1NxfhmLEyvNggMH4xg','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','35','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5caff84f-b815-11ee-afca-025a69a1f11b','06HL4z0CvFAxyc27GXpf02','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','100','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5cbc49ae-b815-11ee-afca-025a69a1f11b','4aP1lp10BRYZO658B2NwkG','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5cc9e9a6-b815-11ee-afca-025a69a1f11b','1NRrtMvT3o1TI6I8XCuweq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','53','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5cd6ce52-b815-11ee-afca-025a69a1f11b','34QbYbTlUCLkZsQ8QmacV9','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','43','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5ce2d646-b815-11ee-afca-025a69a1f11b','3eNYrVLcWfjJ9JdH9kiPJO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d03aa7b-b815-11ee-afca-025a69a1f11b','5kjhjobRqKH7jgi9kvHhU6','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','33','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d126772-b815-11ee-afca-025a69a1f11b','62WlmMYBs1kbHHvlDpML1z','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','45','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d1fbb40-b815-11ee-afca-025a69a1f11b','3AVA9bUTMNoJ9RrbmB0YfW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d2c668f-b815-11ee-afca-025a69a1f11b','2ookZjNsAvPdiaGWn86ub1','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','29','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d3b087e-b815-11ee-afca-025a69a1f11b','1gIjaA2XzQwFRHIvVuKwJW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','36','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d50aed4-b815-11ee-afca-025a69a1f11b','18moNotPmBWa2YZtRnIoZ3','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','50','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5d5d8bb5-b815-11ee-afca-025a69a1f11b','1Mxqyy3pSjf8kZZL4QVxS0','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','81','2024-01-21 04:27:17','a2e67853-b74f-11ee-afca-025a69a1f11b'),('c9c50e5e-b81e-11ee-afca-025a69a1f11b','7A3EfKcEMZeHldRMXJmB45','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','55','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('c9d7dd2d-b81e-11ee-afca-025a69a1f11b','6BF0bXbsdujMSMeFZBGcBq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('c9ea6e12-b81e-11ee-afca-025a69a1f11b','38WbKH6oKAZskBhqDFA8Uj','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('c9fe1cea-b81e-11ee-afca-025a69a1f11b','4sf4DrAOkheqktxTyKm7tO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca1215a2-b81e-11ee-afca-025a69a1f11b','2qvP9yerCZCS0U1gZU8wYp','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca27f8eb-b81e-11ee-afca-025a69a1f11b','0y0nI8lwDB2HRUPwDQuuiu','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','49','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca3ac9a9-b81e-11ee-afca-025a69a1f11b','0Riv2KnFcLZA3JSVryRg4y','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca4dab8f-b81e-11ee-afca-025a69a1f11b','39gp1NxfhmLEyvNggMH4xg','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','35','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca609215-b81e-11ee-afca-025a69a1f11b','06HL4z0CvFAxyc27GXpf02','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','100','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca73f0cb-b81e-11ee-afca-025a69a1f11b','4aP1lp10BRYZO658B2NwkG','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca861be8-b81e-11ee-afca-025a69a1f11b','1NRrtMvT3o1TI6I8XCuweq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','53','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('ca98c5b4-b81e-11ee-afca-025a69a1f11b','34QbYbTlUCLkZsQ8QmacV9','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','43','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('caab8eda-b81e-11ee-afca-025a69a1f11b','3eNYrVLcWfjJ9JdH9kiPJO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('cac0f242-b81e-11ee-afca-025a69a1f11b','5kjhjobRqKH7jgi9kvHhU6','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','33','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('cad4fcbe-b81e-11ee-afca-025a69a1f11b','62WlmMYBs1kbHHvlDpML1z','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','45','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('caea7dc2-b81e-11ee-afca-025a69a1f11b','3AVA9bUTMNoJ9RrbmB0YfW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('caff9950-b81e-11ee-afca-025a69a1f11b','2ookZjNsAvPdiaGWn86ub1','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','29','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('cb14a39c-b81e-11ee-afca-025a69a1f11b','1gIjaA2XzQwFRHIvVuKwJW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','36','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('cb2abfe2-b81e-11ee-afca-025a69a1f11b','18moNotPmBWa2YZtRnIoZ3','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','50','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('cb3ef5a3-b81e-11ee-afca-025a69a1f11b','1Mxqyy3pSjf8kZZL4QVxS0','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','81','2024-01-21 05:34:46','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f94059cc-b81e-11ee-afca-025a69a1f11b','7A3EfKcEMZeHldRMXJmB45','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','55','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f94cdae0-b81e-11ee-afca-025a69a1f11b','6BF0bXbsdujMSMeFZBGcBq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f959bd6c-b81e-11ee-afca-025a69a1f11b','38WbKH6oKAZskBhqDFA8Uj','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f966f715-b81e-11ee-afca-025a69a1f11b','4sf4DrAOkheqktxTyKm7tO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f976d9ed-b81e-11ee-afca-025a69a1f11b','2qvP9yerCZCS0U1gZU8wYp','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','63','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9839ffe-b81e-11ee-afca-025a69a1f11b','0y0nI8lwDB2HRUPwDQuuiu','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','49','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9909b1b-b81e-11ee-afca-025a69a1f11b','0Riv2KnFcLZA3JSVryRg4y','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','65','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f99ee308-b81e-11ee-afca-025a69a1f11b','39gp1NxfhmLEyvNggMH4xg','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','35','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9ae8797-b81e-11ee-afca-025a69a1f11b','06HL4z0CvFAxyc27GXpf02','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','100','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9bb7c51-b81e-11ee-afca-025a69a1f11b','4aP1lp10BRYZO658B2NwkG','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9c6ec4a-b81e-11ee-afca-025a69a1f11b','1NRrtMvT3o1TI6I8XCuweq','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','53','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9d47bd2-b81e-11ee-afca-025a69a1f11b','34QbYbTlUCLkZsQ8QmacV9','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','43','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9e2aa84-b81e-11ee-afca-025a69a1f11b','3eNYrVLcWfjJ9JdH9kiPJO','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','61','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9f0f8c7-b81e-11ee-afca-025a69a1f11b','5kjhjobRqKH7jgi9kvHhU6','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','33','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9ff8343-b81e-11ee-afca-025a69a1f11b','62WlmMYBs1kbHHvlDpML1z','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','45','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('fa0d2a13-b81e-11ee-afca-025a69a1f11b','3AVA9bUTMNoJ9RrbmB0YfW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','58','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('fa1b77e0-b81e-11ee-afca-025a69a1f11b','2ookZjNsAvPdiaGWn86ub1','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','29','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('fa2823a7-b81e-11ee-afca-025a69a1f11b','1gIjaA2XzQwFRHIvVuKwJW','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','36','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('fa34bc5d-b81e-11ee-afca-025a69a1f11b','18moNotPmBWa2YZtRnIoZ3','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','50','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b'),('fa40cdc4-b81e-11ee-afca-025a69a1f11b','1Mxqyy3pSjf8kZZL4QVxS0','2130ff41-b851-11ee-afca-025a69a1f420','5bfa2a40-b815-11ee-afca-025a69a1f11b','81','2024-01-21 05:36:06','a2e67853-b74f-11ee-afca-025a69a1f11b');
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gigs`
--

DROP TABLE IF EXISTS `gigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gigs` (
  `uuid` char(36) NOT NULL,
  `venue_uuid` char(36) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `spotify_playlist_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `gigs_fk1_idx` (`venue_uuid`),
  CONSTRAINT `gigs_fk1` FOREIGN KEY (`venue_uuid`) REFERENCES `venues` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gigs`
--

LOCK TABLES `gigs` WRITE;
/*!40000 ALTER TABLE `gigs` DISABLE KEYS */;
INSERT INTO `gigs` VALUES ('2130cf41-b851-11ee-af4a-025369a1f069','a2e67853-b74f-11ee-afca-025a69a1f11b','2024-01-20 19:00:00','2024-01-20 20:00:00','23IC6oAAtRRVQM3oYFbhqa'),('2130ff41-b751-11ee-afca-025a69a1f11b','a2e67853-b74f-11ee-afca-025a69a1f11b','2024-01-21 09:00:00','2024-01-21 10:00:00',''),('2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b','2024-01-21 00:00:00','2024-01-21 23:59:00','52G6YP7faDyHolY5JVNZ5v');
/*!40000 ALTER TABLE `gigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisations` (
  `uuid` char(36) NOT NULL,
  `name` varchar(45) NOT NULL,
  `ABN` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES ('047e1b0e-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('048dcc0d-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('09334671-b7f7-11ee-afca-025a69a1f11b','Jesse','1234432342'),('0a85bd42-b7f7-11ee-afca-025a69a1f11b','Jesse','1234432342'),('0c1c2beb-b7f7-11ee-afca-025a69a1f11b','Jesse','1234432342'),('0d771c75-b7f7-11ee-afca-025a69a1f11b','Jesse','1234432342'),('0fa0fe82-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('11788f60-b750-11ee-afca-025a69a1f11b','testName2','54321'),('19315931-b7f7-11ee-afca-025a69a1f11b','Jesse','1234432342'),('198628c5-b7f7-11ee-afca-025a69a1f11b','Jesse','1234432342'),('2c6a2849-b816-11ee-afca-025a69a1f11b','Jesse','1234432342'),('2f06acff-b816-11ee-afca-025a69a1f11b','Jesse','1234432342'),('2f116dcb-b816-11ee-afca-025a69a1f11b','Jesse','1234432342'),('3241bf29-b746-11ee-afca-025a69a1f11b','string','1234567'),('43fd5601-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('44193bb1-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('5f85450e-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('6125953a-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('62c84d34-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('62d8227d-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('648f017e-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('64a13d42-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('64faceae-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('650a899b-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('66a5db97-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('66baef21-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('878e9b05-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('87a84c03-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('8993c44f-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('8b302c7e-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('8b3f6023-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('a31074b0-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('a31df4e0-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('a3265347-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('a32e99da-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('a479683e-b815-11ee-afca-025a69a1f11b','Jesse','1234432342'),('a81c5655-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('b0cca6f7-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('b2d1ed24-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('b3f0c31e-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('b4024763-b811-11ee-afca-025a69a1f11b','Jesse','1234432342'),('bd3924c7-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('bd457cdc-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('beea2dd1-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('bf15898f-b7f6-11ee-afca-025a69a1f11b','Jesse','1234432342'),('e2212b91-b7f9-11ee-afca-025a69a1f11b','Jesse','1234432342'),('f6cd26e6-b814-11ee-afca-025a69a1f11b','Jesse','1234432342'),('fb795f81-b815-11ee-afca-025a69a1f11b','Jesse','1234432342');
/*!40000 ALTER TABLE `organisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scans`
--

DROP TABLE IF EXISTS `scans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scans` (
  `uuid` char(36) NOT NULL,
  `timestamp` datetime NOT NULL,
  `attendees_uuid` char(36) NOT NULL,
  `gigs_uuid` char(36) NOT NULL,
  `venues_uuid` char(36) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `scans_fk1_idx` (`attendees_uuid`),
  KEY `scans_fk2_idx` (`gigs_uuid`),
  KEY `scans_fk3_idx` (`venues_uuid`),
  CONSTRAINT `scans_fk1` FOREIGN KEY (`attendees_uuid`) REFERENCES `attendees` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scans_fk2` FOREIGN KEY (`gigs_uuid`) REFERENCES `gigs` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scans_fk3` FOREIGN KEY (`venues_uuid`) REFERENCES `venues` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scans`
--

LOCK TABLES `scans` WRITE;
/*!40000 ALTER TABLE `scans` DISABLE KEYS */;
INSERT INTO `scans` VALUES ('00d5a0a5-b815-11ee-afca-025a69a1f11b','2024-01-21 04:24:42','008f3116-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('07f31c0d-b81f-11ee-afca-025a69a1f11b','2024-01-21 05:36:31','5bfa2a40-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('090a0dc7-b815-11ee-afca-025a69a1f11b','2024-01-21 04:24:56','008f3116-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('1f35032d-b820-11ee-afca-025a69a1f11b','2024-01-21 05:44:17','008f3116-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('588b1636-b820-11ee-afca-025a69a1f11b','2024-01-21 05:45:53','008f3116-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('5c3aa3c4-b815-11ee-afca-025a69a1f11b','2024-01-21 04:27:17','5bfa2a40-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('c9b114e2-b81e-11ee-afca-025a69a1f11b','2024-01-21 05:34:46','5bfa2a40-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b'),('f9339cb8-b81e-11ee-afca-025a69a1f11b','2024-01-21 05:36:06','5bfa2a40-b815-11ee-afca-025a69a1f11b','2130ff41-b851-11ee-afca-025a69a1f420','a2e67853-b74f-11ee-afca-025a69a1f11b');
/*!40000 ALTER TABLE `scans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venues` (
  `uuid` char(36) NOT NULL,
  `organisations_uuid` char(36) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `venues_fk1_idx` (`organisations_uuid`),
  CONSTRAINT `venues_fk1` FOREIGN KEY (`organisations_uuid`) REFERENCES `organisations` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` VALUES ('a2e67853-b74f-11ee-afca-025a69a1f11b','11788f60-b750-11ee-afca-025a69a1f11b','Test Venue','123 Brisbane St, Brisbane QLD 4000');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hot-hack-2024'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-22  9:18:49
