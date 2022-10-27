#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('1', 'necessitatibus', '1');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('2', 'sapiente', '2');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('3', 'quibusdam', '3');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('4', 'nemo', '4');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('5', 'nam', '5');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('6', 'similique', '6');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('7', 'omnis', '7');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('8', 'architecto', '8');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('9', 'ut', '9');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('10', 'quis', '10');


#
# TABLE STRUCTURE FOR: friend_requests
#

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('1', '1', 'unfriended', '1987-08-16 13:50:40', '1970-01-03 23:55:47');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('2', '2', 'unfriended', '2014-10-20 21:07:10', '2003-06-30 18:43:03');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('3', '3', 'approved', '1971-05-21 21:25:57', '1983-06-01 12:20:14');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('4', '4', 'declined', '2022-08-05 11:14:00', '1975-01-29 11:09:02');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('5', '5', 'approved', '2012-02-07 12:11:06', '1989-08-29 18:42:33');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('6', '6', 'declined', '1978-08-30 22:30:05', '1971-07-23 02:51:34');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('7', '7', 'approved', '2015-02-27 11:11:47', '1991-04-30 14:27:19');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('8', '8', 'unfriended', '1994-10-10 19:46:08', '1991-08-09 17:47:45');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('9', '9', 'declined', '1973-12-03 23:52:00', '2019-08-29 16:56:14');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `updated_at`) VALUES ('10', '10', 'unfriended', '2005-05-12 00:02:28', '1978-07-16 21:34:46');


#
# TABLE STRUCTURE FOR: likes
#

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('1', '1', '1', '1976-05-30 00:29:51');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('2', '2', '2', '2007-09-03 20:12:53');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('3', '3', '3', '1987-09-14 17:42:37');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('4', '4', '4', '2015-10-23 23:17:55');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('5', '5', '5', '1989-07-15 03:02:48');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('6', '6', '6', '2012-08-28 07:31:24');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('7', '7', '7', '2014-06-27 13:53:12');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('8', '8', '8', '1999-07-18 05:15:13');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('9', '9', '9', '1989-06-18 06:14:49');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('10', '10', '10', '1976-01-15 01:38:59');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('1', '1', '1', 'Qui qui rem voluptate fugit mollitia. Et laboriosam labore quaerat consequuntur autem voluptas perferendis. Mollitia aperiam dolore nihil voluptatum reprehenderit quisquam. Dolor minima sunt suscipit in.', 'aut', 366744816, NULL, '2010-09-02 00:02:47', '1987-09-04 17:07:26');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('2', '2', '2', 'Ipsam quis sit pariatur unde animi sint. Ut dolore rerum ullam. Ex voluptas repellendus labore qui minima.', 'nemo', 2306, NULL, '2011-07-13 21:17:39', '1982-09-18 17:23:44');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('3', '3', '3', 'Voluptatum eius et repellat ex enim. Similique laborum et ut quam rerum et. Accusantium rem aut tempore occaecati ut.', 'sint', 2, NULL, '1982-06-12 16:12:07', '1976-07-25 14:00:40');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('4', '4', '4', 'Eligendi corrupti id autem quae natus. Eveniet eligendi ipsa odit expedita repellendus soluta molestiae. Perspiciatis totam nam dicta sed. Explicabo totam vel reprehenderit provident asperiores et. Voluptas accusamus ut enim qui exercitationem.', 'enim', 5959001, NULL, '2014-11-26 22:30:25', '2000-12-27 05:53:39');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('5', '5', '5', 'Porro nisi sit delectus error laudantium. Officiis ut ab corrupti quaerat voluptatem omnis ipsam. Incidunt quae et et praesentium voluptatibus aut. Quisquam et ea eos aut in qui iusto.', 'numquam', 32928, NULL, '2003-01-26 22:36:12', '1981-03-08 21:13:36');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('6', '6', '6', 'Nam explicabo facere voluptatum doloribus et esse. Suscipit quia et vero atque consequuntur et. Veritatis odit vero voluptate id sequi qui. Quasi a possimus corporis et rerum ut sed.', 'excepturi', 687, NULL, '2003-03-13 13:49:49', '2022-06-24 05:02:19');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('7', '7', '7', 'Voluptatem aperiam consequuntur sit et optio maiores. Optio soluta nostrum nemo ut voluptatibus sed eos. Molestiae corporis velit cum dicta nemo voluptas. Est ipsa vitae voluptatem nostrum labore dolorem.', 'explicabo', 0, NULL, '2018-04-19 09:45:52', '2019-06-20 21:09:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('8', '8', '8', 'Tenetur velit provident ut et. Illum quam nisi perspiciatis sed pariatur nobis. Occaecati eaque in mollitia quam eum.', 'deserunt', 31005343, NULL, '1983-10-05 07:46:18', '1985-11-08 13:15:43');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('9', '9', '9', 'Aspernatur magni consequatur optio praesentium atque sed id. Corrupti est cumque quo asperiores voluptate dolores. Ut id occaecati est in aut sapiente.', 'at', 2659, NULL, '1983-08-16 04:22:12', '1986-11-23 21:22:09');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('10', '10', '10', 'Magni voluptatum sint molestiae natus. Quis saepe eum sed sunt non molestiae. At odit doloremque ullam id pariatur temporibus.', 'itaque', 641, NULL, '2022-04-18 16:16:14', '2004-07-31 23:22:18');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'fugiat', '2015-10-09 11:55:10', '2000-08-29 14:49:49');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'soluta', '1974-10-13 10:49:04', '2002-03-17 18:52:48');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'eius', '1971-11-21 10:09:46', '1997-12-06 20:38:38');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'dolores', '1996-04-11 10:36:53', '1978-04-29 22:05:40');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('5', 'similique', '2005-09-07 01:26:19', '1979-10-30 18:40:04');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('6', 'id', '1997-05-15 23:31:37', '1975-07-14 05:13:46');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('7', 'consectetur', '1975-11-07 23:51:09', '2011-08-02 15:05:35');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('8', 'aperiam', '1992-01-05 11:16:45', '1984-03-01 00:36:19');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('9', 'reprehenderit', '1995-08-06 22:25:18', '1993-03-24 02:18:10');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('10', 'quibusdam', '2013-07-30 17:04:18', '2021-07-21 23:53:04');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('1', '1', '1', 'A dolores fugit quos voluptas mollitia facere cumque. Velit aliquid maxime voluptas voluptatibus. Minima suscipit dicta consequatur saepe pariatur ex. Ullam vero sit delectus dolores consequatur in.', '2004-11-02 10:30:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '2', '2', 'Quis aut debitis aliquid assumenda maxime sunt. Quasi neque et esse facilis praesentium. Ducimus in sit omnis provident consequatur. Et dolores voluptas provident.', '1982-04-20 05:27:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('3', '3', '3', 'Qui delectus eos consequatur et dolorum. Et quaerat voluptatem sit corrupti. Illum quis quibusdam quia laborum sapiente id rerum.', '1997-01-19 19:48:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('4', '4', '4', 'Autem omnis quia nostrum quisquam enim fugit. Dolorem quo in qui eum officiis minima est. Unde et nesciunt tenetur et officia explicabo. Et hic voluptatum molestias et.', '2020-05-29 10:11:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('5', '5', '5', 'Quos illo temporibus quos aspernatur. Neque reiciendis quia esse quod. Est possimus ab maiores voluptatem aut enim et.', '2003-11-13 16:05:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('6', '6', '6', 'Sit dolor qui quis natus voluptates quod quos aut. Dignissimos est quo dolore animi doloremque at hic. Atque qui rem asperiores cupiditate et unde reiciendis dolorem.', '2007-04-30 20:24:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('7', '7', '7', 'Debitis voluptatem inventore voluptatibus consectetur. Ullam minima accusamus corrupti reiciendis corporis et magni consequatur. Autem at ut fugit voluptas.', '2011-07-12 23:39:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('8', '8', '8', 'Nobis ut deserunt ab fuga ut dolores. Tempora architecto quo molestiae commodi. Id atque in ea vitae ipsum eos. Voluptatem eum nesciunt eum officiis ullam non.', '1991-02-02 20:22:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('9', '9', '9', 'Est deserunt eum qui et sint blanditiis. Velit possimus nisi eius atque sed distinctio ab. Autem ipsum est tenetur dignissimos.', '1994-03-04 04:21:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('10', '10', '10', 'Eum maxime illum deserunt tenetur. Officia consequatur aperiam rem voluptates labore. Consequatur nemo pariatur eveniet ea iusto voluptatum sint. Ut enim sit aut.', '1986-01-28 10:31:13');


#
# TABLE STRUCTURE FOR: photo_albums
#

DROP TABLE IF EXISTS `photo_albums`;

CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('1', 'est', '1');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('2', 'ut', '2');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('3', 'delectus', '3');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('4', 'voluptatem', '4');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('5', 'veritatis', '5');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('6', 'sequi', '6');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('7', 'vitae', '7');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('8', 'suscipit', '8');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('9', 'porro', '9');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('10', 'quae', '10');


#
# TABLE STRUCTURE FOR: photos
#

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('1', '1', '1');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('2', '2', '2');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('3', '3', '3');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('4', '4', '4');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('5', '5', '5');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('6', '6', '6');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('7', '7', '7');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('8', '8', '8');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('9', '9', '9');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('10', '10', '10');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('1', NULL, '1981-05-15', '1', '2012-05-04 07:52:53', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('2', NULL, '1978-05-30', '2', '1985-09-10 04:30:11', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('3', NULL, '1993-01-28', '3', '1996-05-12 09:55:56', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('4', NULL, '2019-06-18', '4', '2003-09-12 16:52:42', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('5', NULL, '2013-09-09', '5', '2001-02-03 14:03:57', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('6', NULL, '2012-10-14', '6', '1986-12-11 21:08:57', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('7', NULL, '2002-05-03', '7', '1984-04-09 08:54:25', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('8', NULL, '1996-11-07', '8', '2016-06-16 09:04:28', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('9', NULL, '1986-07-18', '9', '1996-11-06 08:49:38', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('10', NULL, '1972-09-03', '10', '1977-08-20 01:43:06', NULL);


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('1', 'Avery', 'Wyman', 'wkessler@example.net', 'cfcb89c21e81abe79ac021d40d093ff72352387f', '413');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('2', 'Garland', 'White', 'zula55@example.com', '729c270f5d5b8e61298ad6d0d701cf6b3b7f3266', '829380');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('3', 'Esther', 'Hartmann', 'uupton@example.org', 'c78d7f08e424abdc8599e76d9f56eedf71dc5674', '320076');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('4', 'Shakira', 'Powlowski', 'padberg.buster@example.net', '7558c13ee5903b66dcb4389268f0d70d6eafbc22', '0');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('5', 'Wilfredo', 'Walker', 'jamaal30@example.net', '0cb758f4e1a26874d2f5fd58749649effdd5aa80', '64019');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('6', 'Tressa', 'O\'Kon', 'fausto.kulas@example.com', 'cbed2e81bd2294d84e6bb677e678e48046900b4f', '449102');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('7', 'Leonor', 'Smitham', 'jhessel@example.net', 'f4497accabe73e653bb7df809cdebd4d7b64de75', '65');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('8', 'Veronica', 'Konopelski', 'bschmitt@example.net', 'eeb768a24fafae4e36d2319e160eac9c8e5e0627', '1248187206');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('9', 'Keanu', 'Kilback', 'raven.orn@example.net', 'ad0927cc1ed8264ed6156a16d1d986af0cd3335f', '269');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('10', 'Frieda', 'Kling', 'leola.kohler@example.net', '686e1f5b04db138077ee54dcfcc1f55be2d61076', '329');


#
# TABLE STRUCTURE FOR: users_communities
#

DROP TABLE IF EXISTS `users_communities`;

CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('1', '1');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('2', '2');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('3', '3');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('4', '4');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('5', '5');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('6', '6');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('7', '7');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('8', '8');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('9', '9');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('10', '10');


