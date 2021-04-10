DROP DATABASE IF EXISTS bdd_demo;

CREATE DATABASE IF NOT EXISTS bdd_demo;
USE bdd_demo;

-- Création de table
CREATE TABLE utilisateurs (
    id INT,
    prenom VARCHAR(255),
    nom VARCHAR(255)
);

-- Suppression de table
DROP TABLE utilisateurs;

DROP TABLE IF EXISTS utilisateurs;


-- Contraintes
CREATE TABLE utilisateurs (
	id INT NOT NULL AUTO_INCREMENT,
	prenom VARCHAR(255) NOT NULL,
	nom VARCHAR(255) NOT NULL,
	age SMALLINT DEFAULT 18,
	email VARCHAR(255) UNIQUE,
	PRIMARY KEY(id)
);

-- Modification de table
ALTER TABLE utilisateurs
ADD ville VARCHAR(255);

ALTER TABLE utilisateurs
DROP COLUMN ville;

ALTER TABLE utilisateurs
ADD ville VARCHAR(255);

ALTER TABLE utilisateurs
MODIFY ville VARCHAR(200);

