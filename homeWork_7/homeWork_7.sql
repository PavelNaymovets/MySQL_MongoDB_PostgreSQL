#1. Создать нового пользователя и задать ему права доступа на определенную базу данных (выбрать самостоятельно).
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'newPassword';
GRANT ALL PRIVILEGES ON homework_2._cities to 'new_user'@'localhost'; #Выдача прав использования БД
FLUSH PRIVILEGES; #Обновление прав использования БД
GRANT ALL PRIVILEGES ON vk.users to 'new_user'@'localhost'; #Выдача прав использования БД
FLUSH PRIVILEGES; #Обновление прав использования БД

#2. Сделать резервную копию базы, удалить базу и пересоздать из бекапа.
#Сделано

#3. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT count(*)
FROM vk.likes as l
	JOIN vk.profiles as pf
		ON l.user_id = pf.user_id
	JOIN vk.media as m
		ON pf.user_id = m.user_id
WHERE YEAR(current_date()) - YEAR(pf.birthday) < 10;

SELECT count(*) #Подсчитал общее количество пользоваталей младше 10 лет, которые поставили лайки
FROM vk.likes
WHERE user_id in(
	SELECT user_id
    FROM vk.profiles
    WHERE YEAR(current_date()) - YEAR(birthday) < 10
);

SELECT count(*) #Подсчитал общее количество пользоваталей младше 10 лет, которые получили лайки
FROM vk.likes
WHERE media_id in( #Получаю медиа пользователей младше 10 лет
	SELECT id
    FROM vk.media
    WHERE user_id in( #Получаю пользователей младше 10 лет
		SELECT user_id
        FROM vk.profiles
        WHERE YEAR(current_date()) - YEAR(birthday) < 10
    )
);

#4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT #Получаю гендер, считаю гендер тех, кто поставил лайк
	gender,
    count(gender)
FROM vk.profiles
WHERE profiles.user_id in(#Получаю всех пользователей которые поставили лай
	SELECT user_id
    FROM vk.likes
)
GROUP BY gender; #Группирую результат подсчета по гендеру

SELECT
	gender,
    count(gender)
FROM vk.profiles as pf
	JOIN vk.likes as l
	ON pf.user_id = l.user_id
GROUP BY gender;

#Задачи к собеседованию.
#Задача 1.
#Создаю таблицу пользователей.
CREATE TABLE `homework_3`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));
  
#Создаю таблицу лайков
CREATE TABLE `homework_3`.`likes` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `media_id` BIGINT UNSIGNED NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

#Создаю таблицу с медиа пользователя
CREATE TABLE `homework_3`.`media` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type_id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `body` VARCHAR(150) NULL DEFAULT NULL,
  `filename` VARCHAR(100) NULL DEFAULT NULL,
  `size` INT NULL DEFAULT NULL,
  `metadata` JSON NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`));

#Создаю таблицу с типом медиа пользователя
CREATE TABLE `homework_3`.`media_types` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));
  
#Добавляю внешний ключ в таблицу лайков на таблицы пользователей и медиа.
ALTER TABLE `homework_3`.`likes` 
ADD INDEX `fk_likes_users_idx` (`user_id` ASC) VISIBLE,
ADD INDEX `fk_likes_media_idx` (`media_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`likes` 
ADD CONSTRAINT `fk_likes_users`
  FOREIGN KEY (`user_id`)
  REFERENCES `homework_3`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_likes_media`
  FOREIGN KEY (`media_id`)
  REFERENCES `homework_3`.`media` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#Добавляю внешний ключ в таблицу медиа на таблицу тип медиа и пользователь.
ALTER TABLE `homework_3`.`media` 
ADD INDEX `fk_media_media_types_idx` (`media_type_id` ASC) VISIBLE,
ADD INDEX `fk_media_users_idx` (`user_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`media` 
ADD CONSTRAINT `fk_media_media_types`
  FOREIGN KEY (`media_type_id`)
  REFERENCES `homework_3`.`media_types` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_media_users`
  FOREIGN KEY (`user_id`)
  REFERENCES `homework_3`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#Добавлю столбец для возможности отозвать лайк. По умолчанию лайк не отозван - 0. Если лайк отозван - 1.
ALTER TABLE `homework_3`.`likes` 
ADD COLUMN `take_away_the_likes` BIGINT UNSIGNED NOT NULL DEFAULT 0 AFTER `created_at`;

#Добавлю столбец с датой, когда лайк был отозван.
ALTER TABLE `homework_3`.`likes` 
ADD COLUMN `take_away_at` DATETIME NULL AFTER `take_away_the_likes`;

#Добавлю таблицу с фото.
CREATE TABLE `homework_3`.`photo` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `media_photo_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));

#Добавлю таблицу с комментариями к фото.
CREATE TABLE `homework_3`.`comments_to_photo` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `photo_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `media_comment_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));

#Добавлю внешний ключ к таблице комментарии с фото для соответствия фото и комментария.
ALTER TABLE `homework_3`.`comments_to_photo` 
ADD INDEX `fk_comments_photo_idx` (`photo_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`comments_to_photo` 
ADD CONSTRAINT `fk_comments_photo`
  FOREIGN KEY (`photo_id`)
  REFERENCES `homework_3`.`photo` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#Добавлю таблицу с видео.
  CREATE TABLE `homework_3`.`video` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `media_video_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`));

#Добавлю таблицу с видео альбомом.
CREATE TABLE `homework_3`.`video_albums` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

#Добавлю внешний ключ для соответствия видео альбома и пользователя.
ALTER TABLE `homework_3`.`video_albums` 
ADD INDEX `fk_video_al_users_idx` (`user_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`video_albums` 
ADD CONSTRAINT `fk_video_al_users`
  FOREIGN KEY (`user_id`)
  REFERENCES `homework_3`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#Добавлю внешний ключ для соответствия видео и видео альбома.
ALTER TABLE `homework_3`.`video` 
ADD INDEX `fk_video_video_al_idx` (`album_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`video` 
ADD CONSTRAINT `fk_video_video_al`
  FOREIGN KEY (`album_id`)
  REFERENCES `homework_3`.`video_albums` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#Добавлю внешний ключ для соответствия фото альбома и пользователя.
ALTER TABLE `homework_3`.`photo_albums` 
ADD INDEX `fk_photo_al_users_idx` (`user_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`photo_albums` 
ADD CONSTRAINT `fk_photo_al_users`
  FOREIGN KEY (`user_id`)
  REFERENCES `homework_3`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#Добавлю внешний ключ для соответствия фото и фото альбома.
ALTER TABLE `homework_3`.`photo` 
ADD INDEX `fk_photo_photo_al_idx` (`album_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`photo` 
ADD CONSTRAINT `fk_photo_photo_al`
  FOREIGN KEY (`album_id`)
  REFERENCES `homework_3`.`photo_albums` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#Добавляю внешний ключ для ссылки из таблицы видео на конкретное видео в таблице медиа
ALTER TABLE `homework_3`.`video` 
ADD INDEX `asdasdasd_idx` (`media_vidoe_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`video` 
ADD CONSTRAINT `fk_video_media`
  FOREIGN KEY (`media_vidoe_id`)
  REFERENCES `homework_3`.`media` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#Добавляю внешний ключ для ссылки из таблицы фото на конкретное фото в таблице медиа
ALTER TABLE `homework_3`.`photo` 
ADD INDEX `fk_photo_media_idx` (`media_photo_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`photo` 
ADD CONSTRAINT `fk_photo_media`
  FOREIGN KEY (`media_photo_id`)
  REFERENCES `homework_3`.`media` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#Добавляю внешний ключ для ссылки из таблицы с комментариями к фото на конкретный комментарий под конкретным фото в таблице медиа.
ALTER TABLE `homework_3`.`comments_to_photo` 
ADD INDEX `eweewrw_idx` (`media_comment_id` ASC) VISIBLE;
;
ALTER TABLE `homework_3`.`comments_to_photo` 
ADD CONSTRAINT `fk_comments_media`
  FOREIGN KEY (`media_comment_id`)
  REFERENCES `homework_3`.`media` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
#Наполню данными получившуюся структуру.
#Заполняю пользователей
INSERT INTO `homework_3`.`users`(`first_name`,`last_name`) VALUES ('Ivanov', 'Ivan');
INSERT INTO `homework_3`.`users`(`first_name`,`last_name`) VALUES ('Pertov', 'Igor');
INSERT INTO `homework_3`.`users`(`first_name`,`last_name`) VALUES ('Sidorov', 'Stepan');
INSERT INTO `homework_3`.`users`(`first_name`,`last_name`) VALUES ('Chestnov', 'Dmitriy');

#Заполняю типы медиа
INSERT INTO `homework_3`.`media_types`(`name`) VALUES('photo');
INSERT INTO `homework_3`.`media_types`(`name`) VALUES('video');
INSERT INTO `homework_3`.`media_types`(`name`) VALUES('comment_to_photo');
INSERT INTO `homework_3`.`media_types`(`name`) VALUES('comment_to_video');

#Заполняю медиа для пользователя Иванов Иван, id = 1
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (1,1,'фото_1',10);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (3,1,'комментарий к фото','фото_1',12);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (2,1,'видео_1',20);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (4,1,'комментарий к видео','видео_1',22);

#Заполняю медиа для пользователя Петров Игорь, id = 2
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (1,2,'фото_1',10);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (3,2,'комментарий к фото','фото_1',12);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (2,2,'видео_1',20);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (4,2,'комментарий к видео','видео_1',22);

#Заполняю медиа для пользователя Сидоров Степан, id = 3
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (1,3,'фото_1',10);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (3,3,'комментарий к фото','фото_1',12);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (2,3,'видео_1',20);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (4,3,'комментарий к видео','видео_1',22);

#Заполняю медиа для пользователя Честнов Дмитрий, id = 4
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (1,4,'фото_1',10);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (3,4,'комментарий к фото','фото_1',12);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`filename`,`size`) VALUES (2,4,'видео_1',20);
INSERT INTO `homework_3`.`media` (`media_type_id`,`user_id`,`body`,`filename`,`size`) VALUES (4,4,'комментарий к видео','видео_1',22);

#Заполняю фото альбом
INSERT INTO `homework_3`.`photo_albums`(`name`,`user_id`)VALUES('фото альбом Иванова Ивана',1);
INSERT INTO `homework_3`.`photo_albums`(`name`,`user_id`)VALUES('фото альбом Петрова Игоря',2);
INSERT INTO `homework_3`.`photo_albums`(`name`,`user_id`)VALUES('фото альбом Сидорова Степана',3);
INSERT INTO `homework_3`.`photo_albums`(`name`,`user_id`)VALUES('фото альбом Честнова Дмитрия',4);

#Заполняю видео альбом
INSERT INTO `homework_3`.`video_albums`(`name`,`user_id`)VALUES('видео альбом Иванова Ивана',1);
INSERT INTO `homework_3`.`video_albums`(`name`,`user_id`)VALUES('видео альбом Петрова Игоря',2);
INSERT INTO `homework_3`.`video_albums`(`name`,`user_id`)VALUES('видео альбом Сидорова Степана',3);
INSERT INTO `homework_3`.`video_albums`(`name`,`user_id`)VALUES('видео альбом Честнова Дмитрия',4);

#Заполняю фото
INSERT INTO `homework_3`.`photo`(`album_id`,`media_photo_id`)VALUES(1,1);
INSERT INTO `homework_3`.`photo`(`album_id`,`media_photo_id`)VALUES(2,5);
INSERT INTO `homework_3`.`photo`(`album_id`,`media_photo_id`)VALUES(3,9);
INSERT INTO `homework_3`.`photo`(`album_id`,`media_photo_id`)VALUES(4,13);

#Заполняю видео
INSERT INTO `homework_3`.`video`(`album_id`,`media_vidoe_id`)VALUES(1,3);
INSERT INTO `homework_3`.`video`(`album_id`,`media_vidoe_id`)VALUES(2,7);
INSERT INTO `homework_3`.`video`(`album_id`,`media_vidoe_id`)VALUES(3,11);
INSERT INTO `homework_3`.`video`(`album_id`,`media_vidoe_id`)VALUES(4,15);

#Заполняю комментарии к фото
INSERT INTO `homework_3`.`comments_to_photo`(`photo_id`,`media_comment_id`)VALUES(1,2);
INSERT INTO `homework_3`.`comments_to_photo`(`photo_id`,`media_comment_id`)VALUES(2,6);
INSERT INTO `homework_3`.`comments_to_photo`(`photo_id`,`media_comment_id`)VALUES(3,10);
INSERT INTO `homework_3`.`comments_to_photo`(`photo_id`,`media_comment_id`)VALUES(4,14);

#Заполняю лайки
#Пользователь с id = 1, поставил лайк на фотографию пользователю с id = 2.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(1,5);
#Пользователь с id = 1, поставил лайк на фотографию пользователю с id = 3.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(1,9);
#Пользователь с id = 1, поставил лайк на комментарий пользователю с id = 2.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(1,6);
#Пользователь с id = 2, поставил лайк на фотографию пользователю с id = 1.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(2,1);
#Пользователь с id = 3, поставил лайк на фотографию пользователю с id = 1.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(3,1);
#Пользователь с id = 3, поставил лайк на фотографию пользователю с id = 2.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(3,5);
#Пользователь с id = 4, поставил лайк на фотографию пользователю с id = 3.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(4,9);
#Пользователь с id = 4, поставил лайк на видеозапись пользователю с id = 3.
INSERT INTO `homework_3`.`likes`(`user_id`,`media_id`)VALUES(4,11);

#Задача 1.
#Запрос ниже вибирает: id пользователя, имя, лайков получено, лайков поставлено, взаимные лайки
SELECT 
	us.id,
	us.first_name,
    COUNT(ls.user_id) as likes_are_given,
    likes_are_taken,
    likes_are_both
FROM users AS us
	JOIN likes AS ls
    ON us.id = ls.user_id
    LEFT JOIN abc
    ON us.id = abc.id
    LEFT JOIN www
    ON us.id = www.give_like
GROUP BY first_name;

#Представление содержащее айди пользователя и количество полученных им лайков.
create view abc as
select 
	users.id,
    users.first_name,
	count(likes.media_id) as likes_are_taken
from media 
	JOIN likes 
    ON media.id = likes.media_id
    JOIN users
    ON media.user_id = users.id
group by media.user_id;

#Представление содержащее айди пользователя и количество взаимных лайков. Например: пользователи 1 и 2 имеют взаимные лайки. Значит пользователь 1 будет иметь 1 взаимный лайк и пользователь 2 будет иметь 1 взаимный лайк в этой таблице.
create view www as
select give_like, count(give_like) as likes_are_both from qqq group by give_like;

#Представление содержащее айди взаимных лайков.
create view qqq as
select distinct l.give_like, l.get_like
from def as l
where l.give_like in (select id from users) and
      exists (select (select id from users)
              from def as l2
              where l2.give_like = l.get_like and 
                    l2.get_like = l.give_like
             );
             
#Представление содержащее айди: кто лайкнул, кого лайкнул.
create view def as
select likes.user_id as give_like, media.user_id as get_like from likes join media ON likes.media_id = media.id;

#Задача 2. Воспользуюсь созданным мною ранее представлением def, которая содержит айди кто лайкнул, кого лайкнул
#Создам представление в котором есть айди пользователя и количество данных им лайков. В таблицу войдут только те 
#пользователи которые лайкнули пользователей с id = 1,2,3 (лайк сам себе в данном примере не имеется, но если бы был, то тоже учитывался). 
#Пользователь с id 4 не попадет в выборку по условию задания. Мне не интересно кто его лайкнул и кого лайкнул он. В данном случае пользователь
#с id = 4 лайнул только пользователся 3(фото и видео)

create view pol as
select give_like, count(give_like) as gl from def where get_like in (1,2,3) and give_like in (1,2,3) group by give_like;

#Выберу id пользователей, которые поставили лайки всем участникам (id in (1, 2, 3)) и не поставили участнику с id = 4. Лайк себе не поставил ни один пользователь в моих данных. Значит количество данных им лайков должно быть как минимум > 1, так как лайк себе никто не ставил,
#а всего пользователей 3. Как минимум пользователь должен поставить 2 лайка без учета лайка себе. Но если он поставит и себе, то он все равно попадет в эту выборку. Несколько раз одну и туже сущность пользователь лайкнуть не может.
#Поэтому вариант с тем, что пользователь налайкает одну и ту же сущность множетство раз и попадет в выборку исключен.

select give_like from pol where gl > 1;

#Задача 3. Добавлены необходимые сущности. По условиям:
#● пользователь не может дважды лайкнуть одну и ту же сущность - Реализован триггер
DELIMITER //
CREATE TRIGGER insert_new_likes
BEFORE INSERT ON likes
FOR EACH ROW
	BEGIN
		IF NEW.user_id = OLD.user_id AND NEW.media_id = OLD.media_id THEN
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Attention, you cannot like the same entity more than once!';
		END IF;
    END//
DELIMITER ;
#● пользователь имеет право отозвать лайк - в таблице лайков есть столбец take_away_the_likes, который позволяет мягко забрать лайк.

select * from likes; # На данный момент пользователи не отзывали лайки

#● необходимо иметь возможность считать число полученных сущностью лайков и выводить список пользователей, поставивших лайки - через выборку из таблицы лайков и таблицы медиа можно легко получить того, кто поставил лайк и какой сущности этот лайк был поставлен через join. Таблица с медиа содержит название сущности и кому она принадлежит.
#● в будущем могут появиться новые виды сущностей, которые можно лайкать - новые сущности добавляются в таблицу media_types, получая id, затем создается таблица конкретной сущности, которая содержит ссылки на записи из таблицы media, в которой содержится название сущности, конкретного файла этой сущности, id владельца и прочая информация. Пример таких таблиц photo (фото разделены на альбомы photo_albums), video (video_albums).