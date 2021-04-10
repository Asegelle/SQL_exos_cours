-- Exercice selection des données

-- Récupérer la liste des régions
SELECT * FROM regions;

-- Récupérer le code et le nom de chaque régions
SELECT code, name FROM regions;

-- Récupérer la liste des villes venant du département 01
SELECT * FROM cities
WHERE department_code = '01';
-- 414 en tout

-- Récupérer la liste des noms de villes venant du département 01 en excluant les doublons des noms de ville
SELECT DISTINCT name, department_code FROM cities
WHERE department_code = '01';
-- 407 en tout

-- Récupérer toutes les villes ayant un code postal entre 01000 inclus et 04000 exclus
SELECT * FROM cities
WHERE zip_code BETWEEN '01000' AND '03999';
SELECT * FROM cities
WHERE zip_code >= '01000' AND zip_code < '04000';
-- 1538

-- Récupérer toutes les villes de tout les codes département au dessus de 93 et ayant le code postal non 'vide'
SELECT name, department_code, zip_code FROM cities
WHERE department_code > '93' AND zip_code IS NOT NULL;
-- 428

-- Récupérer toutes les villes ayant un code postal 'vide'
SELECT * FROM cities
WHERE zip_code IS NULL;
-- 52

-- Récupérer la liste des villes venant du département 01 et du 44
SELECT * FROM cities
WHERE department_code = 01 OR department_code = 44;
-- 626