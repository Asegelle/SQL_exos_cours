-- ----------------------------------------------------------------------------
-- --------------------- partie Base de Donn�es -------------------------------
-- ----------------------------------------------------------------------------

/*
-- Exo 1 : Creer un script qui permet de creer une BDD avec comme nom bdd_exercice

CREATE DATABASE BDD_EXERCICES;
DROP DATABASE bdd_exercice;
*/

/*
-- Exo 2 : Am�liorer le script pr�c�dent pour supprimer une BDD existante
		   bdd_exercice et de cr�er une BDD avec comme nom bdd_exercice si elle n�existe pas
		   
CREATE DATABASE IF NOT EXISTS BDD_EXERCICES;
DROP DATABASE IF EXISTS bdd_exercice;
*/


-- ----------------------------------------------------------------------------
-- --------------------- partie Types -----------------------------------------
-- ----------------------------------------------------------------------------

/*
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
*/


-- ----------------------------------------------------------------------------
-- --------------------- partie Tables ----------------------------------------
-- ----------------------------------------------------------------------------

/*
-- Exo 1 : Cr�er une table correspondant � une entit� Ville.
		   A vous de concevoir les diff�rents champs, leur typage et leurs contraintes.

DROP TABLE IF EXISTS villes;
CREATE TABLE villes (
id int UNIQUE NOT NULL AUTO_INCREMENT,	-- AUTO_INCREMENT pour choisir automatiquement une valeur
nom_ville VARCHAR(255) NOT NULL,
taille_ville DOUBLE,
nom_maire VARCHAR(255),
nbr_habitants INT, 
code_postal VARCHAR(255) NOT NULL ,
pays VARCHAR (255) DEFAULT 'France',
est_la_capitale TINYINT (1),
PRIMARY KEY (id)
);
*/

/*
-- Exo 2 : Cr�er une table correspondant � une entit� H�ro. (De jeu vid�o)
		   A vous de concevoir les diff�rents champs, leur typage et leurs contraintes.

DROP TABLE IF EXISTS heros;
CREATE TABLE IF NOT EXISTS heros (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) DEFAULT 'inconnu',
nom_de_hero VARCHAR(100) UNIQUE NOT NULL,
pouvoir TINYTEXT,
ville VARCHAR(100),
ennemi_jur� VARCHAR(100) DEFAULT 'inconnu',
point_de_vie_actuel MEDIUMINT NOT NULL,
point_de_vie_max MEDIUMINT NOT NULL,
PRIMARY KEY (id)
);
*/

