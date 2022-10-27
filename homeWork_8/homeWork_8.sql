-- Задание 3. Запросы из методички
CREATE DATABASE vk;

CREATE TYPE wine AS (
	wine_vineyard varchar(50),
	wine_type varchar(50),
	wine_year int
);

CREATE TABLE pairings (
	menu_entree varchar(50),
	wine_pairing wine
);

INSERT INTO pairings VALUES
	('Lobster Tail', ROW ('STAG s Leap', 'Chardonnay', 2012)),
	('Elk Medallions', ROW ('Rombauer','Cabernet Sauvignon', 2012));
	
SELECT (wine_pairing).wine_vineyard, (wine_pairing).wine_type
FROM pairings
WHERE menu_entree = 'Elk Medallions';

-- Задание 4. Написать скрипт, добавляющий в БД vk на PostgreSQL, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

CREATE TABLE users (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(6) NOT NULL,
	dtae_of_birth DATE NOT NULL
);

CREATE TABLE public (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE profile (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	user_id INT NOT NULL,
	public_id INT
);

--Наполню таблицы данными
INSERT INTO users (first_name, last_name, gender, dtae_of_birth)
VALUES ('John', 'Doe', 'Male', '01/01/2000');
INSERT INTO public (name) VALUES ('group');
INSERT INTO profile (user_id, public_id) VALUES (1,1);

--Посчитаю возраст человека в таблице пользователей
SELECT first_name, AGE(NOW(), dtae_of_birth) as age FROM users;

--Добавлю внешние ключи в таблицу профайла для связи таблицы профайла, пользователей, сообществ
ALTER TABLE profile ADD fk_user_id BIGINT REFERENCES users(id);
ALTER TABLE profile ADD fk_public_id BIGINT REFERENCES public(id);

--Создаю индексы для таблицы пользователей для атрибутов имени и фамилии
CREATE INDEX first_name_idx ON users(first_name);
CREATE INDEX last_name_idx ON users(last_name);
