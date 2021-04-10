-- LIMIT
SELECT * FROM utilisateurs LIMIT 3;

SELECT * FROM utilisateurs WHERE age>26 LIMIT 1;

-- MIN() ET MAX()
SELECT MIN(age) FROM utilisateurs;
SELECT MAX(age) FROM utilisateurs;

-- COUNT (), SUM(), AVG()
SELECT COUNT(*) FROM utilisateurs;
SELECT SUM(age) FROM utilisateurs;
SELECT AVG(age) FROM utilisateurs;
SELECT ROUND(AVG(Age),5) FROM utilisateurs;

-- ORDER BY
SELECT * FROM utilisateurs ORDER BY prenom ASC;
SELECT * FROM utilisateurs ORDER BY nom, prenom;
SELECT * FROM utilisateurs ORDER BY prenom ASC, nom DESC;

-- LIKE
SELECT * FROM utilisateurs WHERE nom LIKE 'p%';
SELECT * FROM utilisateurs WHERE nom LIKE '_a%'; -- peut selection mot avec a en 2ème lettre
SELECT * FROM utilisateurs WHERE age LIKE '3%';  -- peut sélection un integer
SELECT * FROM utilisateurs WHERE nom LIKE '%r';
SELECT * FROM utilisateurs WHERE nom LIKE 'p%r';
SELECT * FROM utilisateurs WHERE nom LIKE '%r%';

-- IN
SELECT * FROM utilisateurs WHERE ville_id IN (2, 3);
SELECT * FROM utilisateurs WHERE ville_id IN (
	SELECT id FROM villes WHERE nom LIKE '%n%');

-- GROUP BY
SELECT * FROM utilisateurs GROUP BY ville_id;
SELECT COUNT(id), ville_id FROM utilisateurs GROUP BY ville_id;

-- HAVING
SELECT COUNT(id), ville_id FROM utilisateurs GROUP BY ville_id WHERE age > 2; -- NE MARCHE PAS A CAUSE DU WHERE
SELECT COUNT(id), ville_id FROM utilisateurs GROUP BY ville_id HAVING COUNT(id) > 2;





