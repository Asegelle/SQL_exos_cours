-- Afficher le nombre de villes ayant pour département 'Loire-Atlantique'
SELECT c.name, d.name FROM cities c
INNER JOIN departments d ON c.department_code = d.code
WHERE d.name = 'Loire-Atlantique';
-- 212

-- Afficher le nombre de département qu'il y a en 'Pays de la Loire'
SELECT COUNT(*) FROM departments d
INNER JOIN regions r ON d.region_code = r.code
WHERE r.name = 'Pays de la Loire';
-- 5

-- Afficher la liste du nombre de département par régions
SELECT COUNT(d.id), r.name FROM departments d
INNER JOIN regions r ON d.region_code = r.code
GROUP BY r.name;
/*
 *1	Guadeloupe
1	Martinique
1	Guyane
1	La Réunion
1	Mayotte
8	Île-de-France
6	Centre-Val de Loire
8	Bourgogne-Franche-Comté
5	Normandie
5	Hauts-de-France
10	Grand Est
5	Pays de la Loire
4	Bretagne
12	Nouvelle-Aquitaine
13	Occitanie
12	Auvergne-Rhône-Alpes
6	Provence-Alpes-Côte d'Azur
2	Corse
8	Collectivités d'Outre-Mer
 * 
 */


-- Afficher le nombre de ville ayant pour nom de région 'Pays de la Loire'
SELECT COUNT(c.id) FROM cities c
INNER JOIN departments d ON c.department_code = d.code
INNER JOIN regions r ON d.region_code = r.code
WHERE r.name = 'Pays de la Loire';
-- 1316

-- Afficher chaque ville qui s'appelle 'Saint-Paul' avec le nom de son département et de sa région
SELECT c.name, d.name, r.name FROM cities c
INNER JOIN departments d ON c.department_code = d.code
INNER JOIN regions r ON d.region_code = r.code
WHERE c.name = 'Saint-Paul';

-- Afficher le nombres de ville qui possède le mot ‘Saint’, étant en région ‘Pays de la Loire’
SELECT COUNT(c.id) FROM cities c
INNER JOIN departments d ON c.department_code = d.code
INNER JOIN regions r ON d.region_code = r.code
WHERE c.name LIKE '%Saint%'
AND r.name = 'Pays de la Loire';
-- 260

