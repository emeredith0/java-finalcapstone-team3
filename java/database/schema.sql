BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, potlucks, dishes CASCADE;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	email varchar(50) NOT NULL UNIQUE,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	dietary_restrictions varchar(200),
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE potlucks (
	potluck_id SERIAL,
	name varchar(50) NOT NULL,
	description varchar,
	date DATE NOT NULL,
	time TIME NOT NULL,
	creator varchar (50),
	potluck_dietary_restrictions varchar(200),
	isRecurring boolean NOT NULL,
	frequency_days int,
	location varchar(200),
	CONSTRAINT pk_potlucks PRIMARY KEY (potluck_id)
);

CREATE TABLE dishes (
	dish_id SERIAL,
	dish_name varchar(100) NOT NULL,
	dish_dietary_restrictions varchar(200) NOT NULL,
	category varchar(50) NOT NULL,
	servings int NOT NULL,
	recipe varchar,
	dish_creator int,

	CONSTRAINT pk_dishes PRIMARY KEY (dish_id)
);

CREATE TABLE potluck_user (
	potluck_id int NOT NULL,
	user_id int NOT NULL,

	CONSTRAINT pk_potluck_user PRIMARY KEY (potluck_id, user_id),
	CONSTRAINT fk_potluck_user_potluck FOREIGN KEY (potluck_id) REFERENCES potlucks (potluck_id),
	CONSTRAINT fk_potluck_user_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE potluck_dish(
	potluck_id int NOT NULL,
	dish_id int NOT NULL,
	dish_rating int,

	CONSTRAINT pk_potluck_dish PRIMARY KEY (potluck_id, dish_id),
	CONSTRAINT fk_potluck_dish_potluck FOREIGN KEY (potluck_id) REFERENCES potlucks (potluck_id),
	CONSTRAINT fk_potluck_dish_dish FOREIGN KEY (dish_id) REFERENCES dishes (dish_id)
);



COMMIT TRANSACTION;
