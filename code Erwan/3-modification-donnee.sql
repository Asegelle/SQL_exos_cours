-- Pour ajouter une donn�e dans une table
INSERT INTO utilisateurs
VALUES (null, 'Erwan', 'Baccon', 30, 'eb@test.com', 'Nantes');

-- Pour Ajouter seulement certaines colonnes
INSERT INTO utilisateurs (id, prenom, nom, age, email)
VALUES (2, 'Erwan', 'Baccon', 30, 'eb@test.com');

INSERT INTO utilisateurs (id, prenom, nom, age, email)
VALUES (2, 'Erwan', 'Baccon', 30, 'eb2@test.com');

-- Ajout en utilisant le AUTO_INCREMENT
INSERT INTO utilisateurs
VALUES (null, 'Erwan', 'Baccon', 30, 'eb3@test.com', 'Nantes');

-- Pour supprimer une donn�e dans une table
DELETE FROM utilisateurs
WHERE id = 2;

DELETE FROM utilisateurs
WHERE email = 'eb@test.com';

-- Pour modifier une donn�e existante
UPDATE utilisateurs
SET prenom = 'Toto', nom = 'Titi'
WHERE id = 1
