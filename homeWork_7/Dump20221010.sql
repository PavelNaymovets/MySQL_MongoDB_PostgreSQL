-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: homework_3
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Temporary view structure for view `abc`
--

DROP TABLE IF EXISTS `abc`;
/*!50001 DROP VIEW IF EXISTS `abc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `abc` AS SELECT 
 1 AS `id`,
 1 AS `first_name`,
 1 AS `likes_are_taken`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments_to_photo`
--

DROP TABLE IF EXISTS `comments_to_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_to_photo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` bigint unsigned NOT NULL,
  `media_comment_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eweewrw_idx` (`media_comment_id`),
  KEY `fk_comments_photo_idx` (`photo_id`),
  CONSTRAINT `fk_comments_media` FOREIGN KEY (`media_comment_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_comments_photo` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_to_photo`
--

LOCK TABLES `comments_to_photo` WRITE;
/*!40000 ALTER TABLE `comments_to_photo` DISABLE KEYS */;
INSERT INTO `comments_to_photo` VALUES (1,1,2),(2,2,6),(3,3,10),(4,4,14);
/*!40000 ALTER TABLE `comments_to_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `def`
--

DROP TABLE IF EXISTS `def`;
/*!50001 DROP VIEW IF EXISTS `def`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `def` AS SELECT 
 1 AS `give_like`,
 1 AS `get_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `take_away_the_likes` bigint unsigned NOT NULL DEFAULT '0',
  `take_away_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_users_idx` (`user_id`),
  KEY `fk_likes_media_idx` (`media_id`),
  CONSTRAINT `fk_likes_media` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,5,'2022-10-08 18:30:12',0,NULL),(2,1,9,'2022-10-08 18:30:12',0,NULL),(3,1,6,'2022-10-08 18:30:12',0,NULL),(4,2,1,'2022-10-08 18:30:12',0,NULL),(5,3,1,'2022-10-08 18:30:13',0,NULL),(6,3,5,'2022-10-08 18:30:13',0,NULL),(7,4,9,'2022-10-08 18:30:13',0,NULL),(8,4,11,'2022-10-08 18:33:11',0,NULL);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` varchar(150) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types_idx` (`media_type_id`),
  KEY `fk_media_users_idx` (`user_id`),
  CONSTRAINT `fk_media_media_types` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'NULL','фото_1',10,NULL,'2022-10-08 17:21:06',NULL),(2,3,1,'комментарий к фото','фото_1',12,NULL,'2022-10-08 17:23:23',NULL),(3,2,1,'NULL','видео_1',20,NULL,'2022-10-08 17:23:23',NULL),(4,4,1,'комментарий к видео','видео_1',22,NULL,'2022-10-08 17:25:17',NULL),(5,1,2,NULL,'фото_1',10,NULL,'2022-10-08 17:35:29',NULL),(6,3,2,'комментарий к фото','фото_1',12,NULL,'2022-10-08 17:35:29',NULL),(7,2,2,NULL,'видео_1',20,NULL,'2022-10-08 17:35:29',NULL),(8,4,2,'комментарий к видео','видео_1',22,NULL,'2022-10-08 17:35:29',NULL),(9,1,3,NULL,'фото_1',10,NULL,'2022-10-08 17:35:35',NULL),(10,3,3,'комментарий к фото','фото_1',12,NULL,'2022-10-08 17:35:35',NULL),(11,2,3,NULL,'видео_1',20,NULL,'2022-10-08 17:35:35',NULL),(12,4,3,'комментарий к видео','видео_1',22,NULL,'2022-10-08 17:35:35',NULL),(13,1,4,NULL,'фото_1',10,NULL,'2022-10-08 17:35:41',NULL),(14,3,4,'комментарий к фото','фото_1',12,NULL,'2022-10-08 17:35:41',NULL),(15,2,4,NULL,'видео_1',20,NULL,'2022-10-08 17:35:41',NULL),(16,4,4,'комментарий к видео','видео_1',22,NULL,'2022-10-08 17:35:41',NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'photo'),(2,'video'),(3,'comment_to_photo'),(4,'comment_to_video');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint unsigned DEFAULT NULL,
  `media_photo_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_photo_al_idx` (`album_id`),
  KEY `fk_photo_media_idx` (`media_photo_id`),
  CONSTRAINT `fk_photo_media` FOREIGN KEY (`media_photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_photo_photo_al` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,1),(2,2,5),(3,3,9),(4,4,13);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_al_users_idx` (`user_id`),
  CONSTRAINT `fk_photo_al_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'фото альбом Иванова Ивана',1),(2,'фото альбом Петрова Игоря',2),(3,'фото альбом Сидорова Степана',3),(4,'фото альбом Честнова Дмитрия',4);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pol`
--

DROP TABLE IF EXISTS `pol`;
/*!50001 DROP VIEW IF EXISTS `pol`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pol` AS SELECT 
 1 AS `give_like`,
 1 AS `gl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qqq`
--

DROP TABLE IF EXISTS `qqq`;
/*!50001 DROP VIEW IF EXISTS `qqq`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `qqq` AS SELECT 
 1 AS `give_like`,
 1 AS `get_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ivanov','Ivan'),(2,'Pertov','Igor'),(3,'Sidorov','Stepan'),(4,'Chestnov','Dmitriy');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint unsigned DEFAULT NULL,
  `media_vidoe_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_video_al_idx` (`album_id`),
  KEY `asdasdasd_idx` (`media_vidoe_id`),
  CONSTRAINT `fk_video_media` FOREIGN KEY (`media_vidoe_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_video_video_al` FOREIGN KEY (`album_id`) REFERENCES `video_albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,1,3),(2,2,7),(3,3,11),(4,4,15);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_albums`
--

DROP TABLE IF EXISTS `video_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_al_users_idx` (`user_id`),
  CONSTRAINT `fk_video_al_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_albums`
--

LOCK TABLES `video_albums` WRITE;
/*!40000 ALTER TABLE `video_albums` DISABLE KEYS */;
INSERT INTO `video_albums` VALUES (1,'видео альбом Иванова Ивана',1),(2,'видео альбом Петрова Игоря',2),(3,'видео альбом Сидорова Степана',3),(4,'видео альбом Честнова Дмитрия',4);
/*!40000 ALTER TABLE `video_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `www`
--

DROP TABLE IF EXISTS `www`;
/*!50001 DROP VIEW IF EXISTS `www`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `www` AS SELECT 
 1 AS `give_like`,
 1 AS `likes_are_both`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'homework_3'
--
/*!50003 DROP FUNCTION IF EXISTS `get_like` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_like`(give_like_1 INT) RETURNS int
    READS SQL DATA
begin
return(
select distinct l.get_like
from def as l
where l.give_like = give_like_1 and
      exists (select give_like_1
              from def as l2
              where l2.give_like = l.get_like and 
                    l2.get_like = l.give_like
             )
);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_like` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_like`(out give_like INT, give INT)
begin
select distinct l.get_like into give_like
from def as l
where l.give_like = 1 and
      exists (select 1
              from def as l2
              where l2.give_like = l.get_like and 
                    l2.get_like = l.give_like
             );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `abc`
--

/*!50001 DROP VIEW IF EXISTS `abc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `abc` AS select `users`.`id` AS `id`,`users`.`first_name` AS `first_name`,count(`likes`.`media_id`) AS `likes_are_taken` from ((`media` join `likes` on((`media`.`id` = `likes`.`media_id`))) join `users` on((`media`.`user_id` = `users`.`id`))) group by `media`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `def`
--

/*!50001 DROP VIEW IF EXISTS `def`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `def` AS select `likes`.`user_id` AS `give_like`,`media`.`user_id` AS `get_like` from (`likes` join `media` on((`likes`.`media_id` = `media`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pol`
--

/*!50001 DROP VIEW IF EXISTS `pol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pol` AS select `def`.`give_like` AS `give_like`,count(`def`.`give_like`) AS `gl` from `def` where ((`def`.`get_like` in (1,2,3)) and (`def`.`give_like` in (1,2,3))) group by `def`.`give_like` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qqq`
--

/*!50001 DROP VIEW IF EXISTS `qqq`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qqq` AS select distinct `l`.`give_like` AS `give_like`,`l`.`get_like` AS `get_like` from `def` `l` where (`l`.`give_like` in (select `users`.`id` from `users`) and exists(select (select `users`.`id` from `users`) from `def` `l2` where ((`l2`.`give_like` = `l`.`get_like`) and (`l2`.`get_like` = `l`.`give_like`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `www`
--

/*!50001 DROP VIEW IF EXISTS `www`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `www` AS select `qqq`.`give_like` AS `give_like`,count(`qqq`.`give_like`) AS `likes_are_both` from `qqq` group by `qqq`.`give_like` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-10 19:52:18
