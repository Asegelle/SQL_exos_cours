-- Modification de données exercice

-- Exercice 1
DROP DATABASE IF EXISTS bdd_manip;
CREATE DATABASE IF NOT EXISTS bdd_manip;

USE bdd_manip;

CREATE TABLE animaux (
	id INT AUTO_INCREMENT,
	nom VARCHAR(255),
	age SMALLINT,
	espece VARCHAR(255),
	PRIMARY KEY(id)
);

INSERT INTO animaux (nom, age, espece)
VALUES ('Haglae', 9, 'chat'),
('Zen', 14, 'chien'),
('Casse-noisette', 2, 'lapin'),
('Hamtaro', 1, 'hamster'),
('Ned', 5, 'chien');

DELETE FROM animaux
WHERE nom = 'Zen';

UPDATE animaux
SET age = 6
WHERE age = 5;

UPDATE animaux
SET nom = 'Casse Couilles'
WHERE id = 3;

-- Suppression de toute les données de la table
-- Soit
DELETE FROM animaux;
-- Soit
TRUNCATE animaux;


































/*
DROP TABLE IF EXISTS animal;

CREATE TABLE IF NOT EXISTS animal (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(255),
	age TINYINT,
	espece VARCHAR(255),
	PRIMARY KEY(id)
);

INSERT INTO animal
VALUES (1, 'Haglae', 9, 'chat'),
(2, 'Zen', 14, 'chien'),
(3, 'Casse-noisette', 2, 'lapin'),
(4, 'Hamtaro', 1, 'hamster'),
(5, 'Ned', 5, 'chien');

DELETE FROM animal
WHERE nom = 'Zen';

UPDATE animal
SET age = 6
WHERE age = 5;

UPDATE animal
SET nom = 'Casse Noisette'
WHERE id = 3;

DELETE FROM animal;
*/