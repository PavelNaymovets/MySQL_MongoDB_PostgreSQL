use vk;

#1. Проверить работу блокировки таблиц на примере 2 любых таблиц (команда LOCK TABLE)
#Основная сессия. Устанавливаю блокировку в основной сессии на чтение или на запись. Установлю на запись.
 START TRANSACTION;
 LOCK TABLES users READ; #Блокирую основную и стороннюю сессию на запись. Могу только читать и в основной сессии и в сторонней.
 LOCK TABLES users WRITE; #Блокирую стороннюю сессию на запись и чтение. В основй могу и читать и писать.
 SHOW OPEN TABLES FROM vk; #Смотрю заблокированные таблицы.
 COMMIT;
 
 #Сторонняя сессия.
 START TRANSACTION;
 SELECT * FROM users; #Делаю выборку. Терминал ожидает. Не выполняет команду.
 CALL add_new_user('20', 'Baf', 'jonovich', 'sdf10mail', 'sdfjsfjsdifjsdijf', '9547516481'); #Пробую добавить нового пользователя через хранимую процедуру.  Терминал ожидает. Не выполняет команду.
 COMMIT;
 
 #Основная сессия.
 UNLOCK TABLES; #Снял блокировку.
 SHOW OPEN TABLES FROM vk; #Смотрю заблокированные таблицы.
 
 #Сторонняя сессия.
 SELECT * FROM users; #Запрос выполнен.
 CALL add_new_user('16', 'Baf', 'jonovich', 'sdf6mail', 'sdfjsfjsdifjsdijf', '9247557483'); #Запрос выполнен.
 
 #2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.
 # Чтобы не нарушать принцип согласованности при добавлении данных в таблицу юзера, нужно добавить данные в таблицу профайла.
 Delimiter //
CREATE PROCEDURE add_new_user(
us_no INT,
us_first_name VARCHAR(100),
us_last_name VARCHAR(100),
us_gender VARCHAR(100),
us_birthday VARCHAR(100),
us_hometown VARCHAR(100),
us_email VARCHAR(100),
us_password_hash VARCHAR(100),
us_phone VARCHAR(100)
)
BEGIN
START TRANSACTION;
INSERT INTO vk.users (id, firstname, lastname, email, password_hash, phone) 
values (us_no, us_first_name, us_last_name, us_email, us_password_hash, us_phone);

INSERT INTO vk.profiles (user_id, gender, birthday, photo_id, hometown)
VALUES(us_no, us_gender, us_birthday, us_no, us_hometown);

COMMIT;
END
//
Delimiter ;

#3. Проанализировать запрос с помощью EXPLAIN.
# Для анализа использую таблицу города из домашнего задания №2 (страны, города, регионы).
USE homework_2;
SELECT * FROM _cities;

#Визуализация плана запроса. Выборка города по id региона без индекса.
EXPLAIN ANALYZE
SELECT 
	_cities.title
FROM _cities
WHERE _cities.region_id = '1053480';

/*
Выборка города по id региона без индекса. В данном случае движок пробегает все строки в таблице, пока не найдет нужное совпадение.
-> Filter: (_cities.region_id = 1053480)  (cost=53546.30 rows=53121) (actual time=0.147..549.710 rows=6653 loops=1)
    -> Table scan on _cities  (cost=53546.30 rows=531213) (actual time=0.133..477.072 rows=542301 loops=1)
    
Выборка города по id региона с индексом. В данном случае движок использует индекс из бинарного дерева. Сортирует данные и при помощи бинарного поиска ищет нужный город по индексу индекса(region_id). Снизилась цена запроса.
-> Index lookup on _cities using fk_cities_regions_idx (region_id=1053480)  (cost=1940.30 rows=6653) (actual time=0.972..28.798 rows=6653 loops=1)
*/