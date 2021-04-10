-- FULL OUTER JOIN
(SELECT * FROM utilisateurs LEFT JOIN villes ON utilisateurs.ville_id = villes.id) 
UNION ALL 
(SELECT * FROM utilisateurs RIGHT JOIN villes ON utilisateurs.ville_id = villes.id WHERE utilisateurs.ville_id IS NULL);

-- UNION
SELECT nom FROM utilisateurs
UNION
SELECT nom FROM villes
ORDER BY nom;

SELECT nom FROM utilisateurs
UNION ALL
SELECT nom FROM villes
ORDER BY nom;