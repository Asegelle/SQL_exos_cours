-- INNER JOIN
SELECT utilisateurs.nom, utilisateurs.prenom, villes.nom FROM utilisateurs
INNER JOIN villes ON utilisateurs.ville_id = villes.id;

SELECT utilisateurs.nom, utilisateurs.prenom, evenements.lieu FROM utilisateurs
INNER JOIN utilisateur_evenement ON utilisateurs.id = utilisateur_evenement.utilisateur_id
INNER JOIN evenements ON utilisateur_evenement.evenement_id = evenements.id;

-- LEFT JOIN
-- On garde les valeurs communes
SELECT utilisateurs.nom, utilisateurs.prenom, villes.nom FROM utilisateurs
LEFT JOIN villes ON utilisateurs.ville_id = villes.id;

-- On exclu les valeurs en communs
SELECT utilisateurs.nom, utilisateurs.prenom, villes.nom FROM utilisateurs
LEFT JOIN villes ON utilisateurs.ville_id = villes.id
WHERE villes.id IS NULL;

-- RIGHT JOIN
-- On garde les valeurs communes
SELECT utilisateurs.nom, utilisateurs.prenom, villes.nom FROM utilisateurs
RIGHT JOIN villes ON utilisateurs.ville_id = villes.id;

-- On exclu les valeurs en communs
SELECT utilisateurs.nom, utilisateurs.prenom, villes.nom FROM utilisateurs
RIGHT JOIN villes ON utilisateurs.ville_id = villes.id
WHERE utilisateurs.ville_id IS NULL;















-- ALIAS
-- Sur une colonne
SELECT nom FROM utilisateurs;
SELECT nom AS nom_utilisateur FROM utilisateurs;

-- Sur une table
SELECT nom AS nom_utilisateur FROM utilisateurs AS u
WHERE u.age > 30;


-- AVANT
SELECT utilisateurs.nom, utilisateurs.prenom, villes.nom FROM utilisateurs
INNER JOIN villes ON utilisateurs.ville_id = villes.id;

-- APRES
SELECT u.nom AS nom_utilisateur,
u.prenom AS prenom_utilisateur,
v.nom AS nom_ville
FROM utilisateurs AS u
INNER JOIN villes AS v ON u.ville_id = v.id;


-- AVANT
SELECT utilisateurs.nom, utilisateurs.prenom, evenements.lieu FROM utilisateurs
INNER JOIN utilisateur_evenement ON utilisateurs.id = utilisateur_id
INNER JOIN evenements ON utilisateur_evenement.evenement_id = evenements.id;

-- APRES
SELECT u.nom, u.prenom, e.lieu FROM utilisateurs AS u
INNER JOIN utilisateur_evenement ue ON u.id = utilisateur_id
INNER JOIN evenements AS e ON ue.evenement_id = e.id;


