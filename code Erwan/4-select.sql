-- SELECT
SELECT * FROM utilisateurs;

-- SELECT Column
SELECT age, prenom, nom FROM utilisateurs;
-- Meilleure pratique avec les colonnes

-- SELECT DISTINCT
SELECT DISTINCT prenom FROM utilisateurs;

-- WHERE
SELECT * FROM utilisateurs WHERE id = 1;
SELECT * FROM utilisateurs WHERE age >= 40;
SELECT * FROM utilisateurs WHERE prenom = 'Erwan';

SELECT prenom, nom, age FROM utilisateurs
WHERE prenom = 'Erwan';

-- WHERE CONDITION
SELECT * FROM utilisateurs
WHERE ville_id != 1;

SELECT * FROM utilisateurs
WHERE age BETWEEN 28 AND 36;

-- Attention avec ça
SELECT * FROM utilisateurs
WHERE prenom BETWEEN 'al' AND 'b';

SELECT * FROM utilisateurs
WHERE nom LIKE 'p%';

SELECT prenom, nom, age FROM utilisateurs
WHERE prenom IN ('Erwan', 'Alicia');

-- Equivalent du IN du dessus
SELECT prenom, nom, age FROM utilisateurs
WHERE prenom = 'Erwan' OR prenom = 'Alicia';


-- NOT
SELECT * FROM utilisateurs
WHERE NOT ville_id != 1;

SELECT * FROM utilisateurs
WHERE NOT age BETWEEN 28 AND 36;

SELECT * FROM utilisateurs
WHERE NOT nom LIKE 'p%';

SELECT * FROM utilisateurs
WHERE NOT ville_id IN (2, 3);

-- AND
SELECT * FROM utilisateurs
WHERE age >= 30;

SELECT * FROM utilisateurs
WHERE ville_id = 1;

SELECT * FROM utilisateurs
WHERE age >= 30 AND ville_id = 1;

-- OR
SELECT * FROM utilisateurs
WHERE age < 30;

SELECT * FROM utilisateurs
WHERE ville_id = 2;

SELECT * FROM utilisateurs
WHERE age < 30 OR ville_id = 2;

-- NULL
SELECT * FROM utilisateurs
WHERE ville_id = NULL; -- NE MARCHE PAS

SELECT * FROM utilisateurs
WHERE ville_id IS NULL;

SELECT * FROM utilisateurs
WHERE ville_id IS NOT NULL;
