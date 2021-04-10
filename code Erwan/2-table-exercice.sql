-- TYPES
DROP TABLE IF EXISTS typages;
CREATE TABLE typages(
	id INT,
	nom_ville VARCHAR(255),
	age_utilisateur SMALLINT,
	est_present TINYINT,
	date_anniversaire DATE,
	recette_cuisine TINYTEXT,
	quantite DOUBLE,
	prix DOUBLE,
	trigramme CHAR(3),
	sexe CHAR(1) -- OU TINYINT
);

-- TABLES EXERCICES

DROP TABLE IF EXISTS villes;
CREATE TABLE villes(
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
	nom VARCHAR(255) NOT NULL,
	nom_maire VARCHAR(255),
	prenom_maire VARCHAR(255),
	population INT UNSIGNED,
	surface DOUBLE,
	departement VARCHAR(255) NOT NULL,
	region VARCHAR(255) NOT NULL,
	code_postal VARCHAR(255) NOT NULL,
	pays VARCHAR(255) DEFAULT 'FRANCE',
	est_la_capitale TINYINT(1),
	PRIMARY KEY(id)
);


DROP TABLE IF EXISTS heros;
CREATE TABLE heros(
	id INT AUTO_INCREMENT,
	pseudo VARCHAR(255) UNIQUE NOT NULL,
	nom VARCHAR(255) DEFAULT 'inconnu',
	classe VARCHAR(255) DEFAULT 'Guerrier',
	pouvoir VARCHAR(255),
	element_pouvoir VARCHAR(255),
	niveau SMALLINT,
	point_de_vie_actuel MEDIUMINT NOT NULL,
	point_de_vie_max MEDIUMINT NOT NULL,
	PRIMARY KEY(id)
);