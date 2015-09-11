--====================================================================
-- create the user
CREATE USER 'StreamStory'@'localhost' IDENTIFIED BY 'StreamStory';

-- create database
CREATE DATABASE StreamStory;
GRANT ALL PRIVILEGES ON StreamStory.* TO 'StreamStory'@'localhost';

--====================================================================

USE StreamStory;

CREATE TABLE user (e
	mail VARCHAR(100) PRIMARY KEY
);

CREATE TABLE model (
	mid INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(100) NOT NULL,
	model_file VARCHAR(255) NOT NULL UNIQUE,
	dataset VARCHAR(255) NOT NULL,
	is_realtime BOOLEAN NOT NULL DEFAULT 0,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (username) REFERENCES user(email)
);

CREATE TABLE model_base (
	mid INT PRIMARY KEY,
	base_dir VARCHAR(255) NOT NULL,
	FOREIGN KEY (mid) REFERENCES model(mid)
);

-- configuration of the friction coefficient
CREATE TABLE config (
	property VARCHAR(100) PRIMARY KEY,
	value VARCHAR(100) NOT NULL
);

INSERT INTO config (property, value) values ('calc_coeff', 'false');
INSERT INTO config (property, value) values ('deviation_extreme', '5');
INSERT INTO config (property, value) values ('deviation_major', '4');
INSERT INTO config (property, value) values ('deviation_significant', '3');
INSERT INTO config (property, value) values ('deviation_minor', '2');

INSERT INTO config (property, value) values ('deviation_extreme_lambda', '1');
INSERT INTO config (property, value) values ('deviation_major_lambda', '0.5');
INSERT INTO config (property, value) values ('deviation_significant_lambda', '0.08333333333333333');
INSERT INTO config (property, value) values ('deviation_minor_lambda', '0.041666666666666664');