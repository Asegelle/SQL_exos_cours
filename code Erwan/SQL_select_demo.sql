-- ----------------------------------------------------------------------------
-- --------------------- partie Select ----------------------------------------
-- ----------------------------------------------------------------------------

USE select_demo;

-- SELECT
SELECT * FROM utilisateurs;

-- SELECT column
SELECT prenom, nom FROM utilisateurs;

-- SELECT DISTINCT
SELECT DISTINCT prenom FROM utilisateurs;

-- WHERE
SELECT * FROM utilisateurs WHERE id=1;
SELECT * FROM utilisateurs WHERE age>=30;
SELECT * FROM utilisateurs WHERE ville_id=1;

SELECT prenom, nom, age FROM utilisateurs WHERE age>=30;

-- WHERE CONDITION
SELECT * FROM utilisateurs WHERE ville_id!=1;
SELECT age FROM utilisateurs WHERE age BETWEEN 25 AND 37;
SELECT * FROM utilisateurs WHERE nom LIKE 'p%';
SELECT * FROM utilisateurs WHERE ville_id IN (2,3);

-- NOT
SELECT * FROM utilisateurs WHERE NOT ville_id!=1;
SELECT * FROM utilisateurs WHERE NOT age BETWEEN 28 AND 36;
SELECT * FROM utilisateurs WHERE NOT nom LIKE 'p%';
SELECT * FROM utilisateurs WHERE NOT ville_id IN (2,3);

-- AND
SELECT * FROM utilisateurs WHERE age >=30;
SELECT * FROM utilisateurs WHERE ville_id=1;
SELECT * FROM utilisateurs WHERE age >=30 AND ville_id=1;

-- OR
SELECT * FROM utilisateurs WHERE age <30;
SELECT * FROM utilisateurs WHERE ville_id=2;
SELECT * FROM utilisateurs WHERE age <30 OR ville_id=2;

-- NULL
SELECT * FROM utilisateurs WHERE ville_id IS NULL;
SELECT * FROM utilisateurs WHERE ville_id IS NOT NULL;



