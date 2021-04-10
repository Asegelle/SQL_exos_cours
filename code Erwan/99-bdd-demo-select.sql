DROP DATABASE IF EXISTS select_demo;

CREATE DATABASE IF NOT EXISTS select_demo;
USE select_demo;

CREATE TABLE IF NOT EXISTS villes (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    code_postal VARCHAR(5),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS comptes (
    id INT NOT NULL AUTO_INCREMENT,
    pseudo VARCHAR(255),
    mot_de_passe VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS evenements (
    id INT NOT NULL AUTO_INCREMENT,
    lieu VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS utilisateurs (
	id INT NOT NULL AUTO_INCREMENT,
	prenom VARCHAR(255) NOT NULL,
	nom VARCHAR(255) NOT NULL,
	age SMALLINT DEFAULT 18,
	email VARCHAR(255) UNIQUE,
	ville_id INT,
	compte_id INT UNIQUE,
    FOREIGN KEY (ville_id) REFERENCES villes(id),
    FOREIGN KEY (compte_id) REFERENCES comptes(id),
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS utilisateur_evenement (
    utilisateur_id INT NOT NULL,
    evenement_id INT NOT NULL,
    PRIMARY KEY(utilisateur_id, evenement_id)
);

--
-- Contraintes pour la table `utilisateur_evenement`
--
ALTER TABLE utilisateur_evenement
  ADD CONSTRAINT fk_utilisateur_evenement_on_utilisateurs FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id),
  ADD CONSTRAINT fk_utilisateur_evenement_on_evenements FOREIGN KEY (evenement_id) REFERENCES evenements(id);

INSERT INTO villes
VALUES (1, 'Nantes', '44000'),
(2, 'Orléans', '45000'),
(3, 'Tours', '37000'),
(4, 'Angers', '49000');

INSERT INTO comptes
VALUES (1, 'Admin', '123456789'),
(2, 'User1', '123456789'),
(3, 'User2', '123456789'),
(4, 'User3', '123456789'),
(5, 'User4', '123456789'),
(6, 'User5', '123456789');

INSERT INTO evenements
VALUES (1, 'Piscine'),
(2, 'Restaurant'),
(3, 'Cinéma');

INSERT INTO utilisateurs
VALUES (null, 'Erwan', 'Baccon', 30, 'eb@test.com', 1, 1),
(null, 'Alicia', 'Pradier', 25, 'ap@test.com', 1, 2),
(null, 'Gregoire', 'Coggoti', 32, 'gc@test.com', 1, 3),
(null, 'Erwan', 'Philippe', 42, 'ep@test.com', 2, 4),
(null, 'Marc', 'Pradier', 55, 'mp@test.com', 3, 5),
(null, 'Eveline', 'Locrate', 37, 'et@test.com', NULL, 6);

INSERT INTO utilisateur_evenement 
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(4, 3),
(5, 3),
(2, 3),
(6, 3),
(2, 2);
