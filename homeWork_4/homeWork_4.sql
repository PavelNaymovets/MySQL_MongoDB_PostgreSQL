USE VK;

#1 Создать VIEW на основе SELECT-запроса, который вы писали в ДЗ к уроку 3.

CREATE VIEW view_select_firstname as
	SELECT users.firstname FROM vk.users GROUP BY users.firstname;
SELECT * FROM view_select_firstname;

#2  Создать функцию, которая найдет пользователя по имени и фамилии.

DELIMITER //
CREATE FUNCTION get_user_by_frstN_lstN(us_firstname VARCHAR(100), us_lastname VARCHAR(100))
	RETURNS INT READS SQL DATA
	BEGIN
		DECLARE id_user INT;
        SELECT users.id
        INTO id_user
        FROM users
        WHERE firstname = us_firstname  AND lastname = us_lastname
        LIMIT 1;
        RETURN id_user;
	END
    //
DELIMITER ;

SELECT get_user_by_frstN_lstN('Leonor','Smitham');

#3 Создать триггер, который при обновлении профиля пользователя будет проверять его дату рождения. Если дата из будущего, то подменить ее на сегодняшнее число.

DELIMITER //
CREATE TRIGGER chage_user_birthday
BEFORE UPDATE ON profiles
FOR EACH ROW
	BEGIN
		IF NEW.birthday > CURRENT_DATE() THEN
			SET NEW.birthday = CURRENT_DATE();
		END IF;
    END
    //
DELIMITER ;

UPDATE `vk`.`profiles`
SET
`birthday` = CURRENT_DATE() + INTERVAL 1 YEAR
WHERE `user_id` = 1;

SELECT * FROM PROFILES;