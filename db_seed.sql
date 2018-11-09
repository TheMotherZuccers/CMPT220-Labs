-- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: site_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'describe what the item looks like/what it is',
  `notable_damage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'note any damage to the item when it was received by the lost and found office',
  `environment_found` enum('inside','sunny','rain','snow','humid') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'state the environment the item was found in',
  `position_found` point NOT NULL COMMENT 'Coordinates the item was found at',
  `position_radius` int(11) DEFAULT NULL COMMENT 'Radius around position_found the item may have been in',
  `position_comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'added details on where the item was found',
  `finder_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_finder_id_foreign` (`finder_id`),
  KEY `items_admin_id_foreign` (`admin_id`),
  CONSTRAINT `items_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `items_finder_id_foreign` FOREIGN KEY (`finder_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
INSERT INTO `items` VALUES (1,'iPhone XXXXXX','None','inside','\0\0\0\0\0\0\0\�o_\�{R��[Ɏ�\�D@',NULL,'comment test',1,1,'2018-09-30 22:22:11','2018-09-30 22:22:11'),(2,'My Heart','Broken','rain','\0\0\0\0\0\0\0\��&�|R��ǅ&?\�D@',NULL,'Tina please call me, I miss you',2,1,'2018-10-01 18:49:08','2018-10-01 18:49:08'),(3,'Red Shirt','None','sunny','\0\0\0\0\0\0\0\0��{R�� I�\n\�D@',10,'It\'s a v nice :ok_hand: shirt, 10/10',2,1,'2018-10-01 19:30:12','2018-10-01 19:30:12'),(4,'Glasses','None','inside','\0\0\0\0\0\0\0\0)L\�{R��x�A�\�D@',NULL,'Hancock',3,1,'2018-10-03 17:43:20','2018-10-03 17:43:20');
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` multipoint NOT NULL COMMENT 'The place that an item was found in. For a single point, just enter one. To represent the spot as a polygon, enter multiple points. To enter the spot as a circle, put a value in the radius column\n',
  `description` varchar(256) DEFAULT NULL COMMENT 'A breif description of the position (only needed for pre-defined locations)',
  `radius` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(6,'2018_09_30_221102_create_items_table',2);
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `presidents`
--

DROP TABLE IF EXISTS `presidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `num` int(11) NOT NULL,
  `dob` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presidents`
--

LOCK TABLES `presidents` WRITE;
INSERT INTO `presidents` VALUES (1,'Martin','Van Buren',8,'1782-12-05 00:00:00'),(2,'John','Tyler',10,'1790-03-29 00:00:00'),(3,'Millard','Fillmore',13,'1800-01-07 00:00:00'),(4,'Franklin','Pierce',14,'1804-11-23 00:00:00'),(5,'Theodore','Roosevelt',26,'1858-10-27 00:00:00'),(7,'George','Washington',1,'0000-00-00 00:00:00'),(10,'Woodrow','Wilson',28,'0000-00-00 00:00:00'),(11,'William','McKinley',25,'0000-00-00 00:00:00'),(12,'Harry','Truman',33,'0000-00-00 00:00:00');
UNLOCK TABLES;

--
-- Table structure for table `stuff`
--

DROP TABLE IF EXISTS `stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stuff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `time_found` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_condition` text,
  `coordinate` point DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff`
--

LOCK TABLES `stuff` WRITE;
INSERT INTO `stuff` VALUES (1,'iPhone MMXVIII','2018-09-28 18:18:36','Brand new','\0\0\0\0\0\0\0\�\�mn\�D@\��p\�{R�'),(2,'Notebook','2018-09-28 18:54:41','Damaged','\0\0\0\0\0\0\0\�\�?\�D@����{R�');
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (2,'Sad Boi','sad.boi@yahoo.rus',NULL,'$2y$10$F.TKeq5Q/KoJUPcimRg6uuAhHYyUaPkyXcgLnBwMjfEYjtkcwzIrC','DIvN1o9jo2dke5rNtVZRSxS5Quu8nhk4HikW2rQu8gwP4IVP6Gp1th3VRUc0','2018-10-01 18:48:03','2018-10-01 18:48:03','default');
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09 15:42:41
