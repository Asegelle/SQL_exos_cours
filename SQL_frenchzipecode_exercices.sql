-- ----------------------------------------------------------------------------
-- --------------------- exo Frenchzipecode -----------------------------------
-- ----------------------------------------------------------------------------

/*
-- Exo 1 	• : Réaliser un script qui permet de répondre à ces demandes :
•Récupérer la liste des régions
•Récupérer le code et le nom de chaque régions
•Récupérer la liste des villes venant du département 01
•Récupérer la liste des villes venant du département 01 en excluant les doublons des noms de ville
•Récupérer toutes les villes ayant un code postal entre 01000 inclus et 04000 exclus
•Récupérer toutes les villes de tous les codes département au dessus de 93 et ayant le code postal non 'vide'
•Récupérer toutes les villes ayant un code postal 'vide'
• Récupérer la liste des villes venant du département 01 ou du 44
*/

-- •Récupérer la liste des régions
SELECT name FROM regions;

-- •Récupérer le code et le nom de chaque régions
SELECT code,name FROM regions;

-- •Récupérer la liste des villes venant du département 01
SELECT name FROM cities WHERE department_code=01;
-- 414

-- •Récupérer la liste des villes venant du département 01
--  en excluant les doublons des noms de ville
SELECT DISTINCT name FROM cities WHERE department_code=01;
-- 407

-- •Récupérer toutes les villes ayant un code postal 
--  entre 01000 inclus et 04000 exclus
SELECT name FROM cities WHERE zip_code BETWEEN 01000 AND 03999;
-- 1538

-- •Récupérer toutes les villes de tous les codes département 
--  au dessus de 93 et ayant le code postal non 'vide'
SELECT name FROM cities WHERE department_code>93 AND zip_code IS NOT NULL;
-- 428

-- •Récupérer toutes les villes ayant un code postal 'vide'
SELECT name FROM cities WHERE zip_code IS NULL;
-- 52

-- • Récupérer la liste des villes venant du département 01 et du 44
SELECT name FROM cities WHERE department_code = 01 OR department_code = 44;
-- 626

-- SELECT count(*) FROM cities;


/*
-- Exo 2 	• : Réaliser un script qui permet de répondre à ces demandes :
•Combien y a t il de villes dans le département 44 ?
•Récupérer la liste des villes venant du département 44 et afficher seulement les 100 premières
•Afficher le code postal minimum et maximum des villes en BDD
•Déterminer la coordonnée centrale du département 44
• Afficher la liste des villes du 44 commençant par lettre 's' et ayant comme troisième lettre un 'i'
•Afficher les 10 villes ayant le plus grand code postal du 44
•Comptabiliser le nombre de villes de chaque département
•Comptabiliser le nombre de villes de chaque département et afficher seulement ceux ayant plus de 30 villes
•Afficher toutes les villes ayant pour département 'Loire Atlantique'
*/

-- •Combien y a t il de villes dans le département 44 ?
SELECT count(department_code) FROM cities WHERE department_code=44;
-- 212

-- •Récupérer la liste des villes venant du département 44 et 
--  afficher seulement les 100 premières
SELECT name FROM cities WHERE department_code=44 LIMIT 100;

-- •Afficher le code postal minimum et maximum des villes en BDD
SELECT min(zip_code),max(zip_code) FROM cities;
-- 01000 et 98882

-- •Déterminer la coordonnée centrale du département 44
SELECT avg(gps_lat), avg(gps_lng) FROM citiesWHERE department_code=44;
-- 47.3347287582692	et -1.6775410063325669

-- •Afficher la liste des villes du 44 commençant par lettre 's' 
--  et ayant comme troisième lettre un 'i'
/*
SELECT name FROM cities WHERE department_code=44;
SELECT name FROM cities WHERE name LIKE 's%' AND name LIKE '__i%';
*/
SELECT name FROM cities WHERE department_code=44 AND name LIKE 's_i%';
-- 37

-- •Afficher les 10 villes ayant le plus grand code postal du 44
SELECT name FROM cities WHERE department_code=44 ORDER BY zip_code DESC LIMIT 10;

-- •Comptabiliser le nombre de villes de chaque département
SELECT department_code,count(name) FROM cities GROUP BY department_code;
-- 109

-- •Comptabiliser le nombre de villes de chaque département 
--  et afficher seulement ceux ayant plus de 30 villes
SELECT department_code,count(name) FROM cities GROUP BY department_code HAVING count(name)>30;
-- 100

-- •Afficher toutes les villes ayant pour département 'Loire-Atlantique'
SELECT name FROM cities WHERE department_code=44;

SELECT * FROM cities WHERE department_code IN (
SELECT code FROM departments WHERE name = 'Loire-Atlantique');
-- 212


/*
-- Exo 3 	• : Réaliser un script qui permet de répondre à ces demandes :
•Afficher toutes les villes ayant pour département 'Loire Atlantique‘
•Afficher le nombre de départements qu'il y a en 'Pays de la Loire‘
•Afficher la liste du nombre de départements par région
•Afficher le nombre de ville ayant pour nom de région 'Pays de la Loire'
•Afficher chaque ville qui s'appelle 'Saint Paul' avec le nom de son département et de sa région
•Afficher le nombre de villes qui possède le mot ‘Saint’, étant en région ‘Pays de la Loire’
*/

-- •Afficher toutes les villes ayant pour département 'Loire Atlantique‘
SELECT cities.name FROM cities 
INNER JOIN departments ON cities.department_code=departments.code 
WHERE departments.name = 'Loire-Atlantique';

SELECT c.name FROM cities AS c
INNER JOIN departments AS d ON c.department_code=d.code 
WHERE d.name = 'Loire-Atlantique';
-- 212

-- •Afficher le nombre de départements qu'il y a en 'Pays de la Loire‘
SELECT name FROM departments
WHERE region_code = 52;

SELECT count(regions.code) FROM departments
INNER JOIN regions ON departments.region_code=regions.code
WHERE regions.name = 'Pays de la Loire';
-- 5

-- •Afficher la liste du nombre de départements par région
SELECT regions.name, count(regions.code) FROM departments
INNER JOIN regions ON departments.region_code=regions.code
 GROUP BY regions.code;
-- 19

-- •Afficher le nombre de ville ayant pour nom de région 'Pays de la Loire'
SELECT regions.name, count(cities.name) FROM cities
INNER JOIN departments ON cities.department_code=departments.code 
INNER JOIN regions ON departments.region_code=regions.code
WHERE regions.name = 'Pays de la Loire';
-- 1316

-- •Afficher chaque ville qui s'appelle 'Saint Paul' avec 
--  le nom de son département et de sa région
SELECT cities.name, departments.name, regions.name FROM cities
INNER JOIN departments ON cities.department_code=departments.code 
INNER JOIN regions ON departments.region_code=regions.code
WHERE cities.name LIKE 'Saint_Paul';
-- 14

-- •Afficher le nombre de villes qui possède le mot ‘Saint’, 
--  étant en région ‘Pays de la Loire’
SELECT regions.name, count(cities.name) FROM cities
INNER JOIN departments ON cities.department_code=departments.code 
INNER JOIN regions ON departments.region_code=regions.code
WHERE regions.name = 'Pays de la Loire' AND cities.name LIKE '%Saint%';
-- 260
