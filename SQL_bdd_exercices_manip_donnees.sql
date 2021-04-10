-- ----------------------------------------------------------------------------
-- --------------------- partie Manipulation des données ----------------------
-- ----------------------------------------------------------------------------

/*
-- Exo 1 :	•Créer une table ‘animal’ avec ces données
			•Supprimer la ligne qui a pour nom ‘Zen’
			•Modifier la ligne qui a un âge de 5 ans et la changer avec un âge de 6 ans
			•Modifier la ligne qui a pour identifiant 3 avec le nom ‘Casse Noisette’
			•Supprimer toutes les données de la table
*/
DROP DATABASE IF EXISTS bdd_manip_des_donnees;
CREATE DATABASE IF NOT EXISTS bdd_manip_des_donnees;

USE bdd_manip_des_donnees;

DROP TABLE IF EXISTS animaux;
CREATE TABLE IF NOT EXISTS animaux(
id int NOT NULL UNIQUE AUTO_INCREMENT,
nom varchar(20),
age TINYINT,
espece varchar(20),
PRIMARY KEY (id)
);

INSERT INTO animaux (id, nom, age, espece) VALUES 
(null, 'Haglae', 9, 'chat'),
(null, 'Zen', 14, 'chien'),
(null, 'Casse-noisette', 2, 'lapin'),
(null, 'Hamtaro', 1, 'hamster'),
(null, 'ned', 5, 'chien');


DELETE FROM animaux WHERE nom='Zen';

UPDATE animaux SET age=6 WHERE id=5;

UPDATE animaux SET nom='Casse noisette' WHERE id=3;

DELETE FROM animaux;
truncate animaux; 	-- équivalent à DELETE FROM 

