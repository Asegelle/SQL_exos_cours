-- ----------------------------------------------------------------------------
-- --------------------- exo Frenchzipecode -----------------------------------
-- ----------------------------------------------------------------------------

/*
-- Exo 1 	� : R�aliser un script qui permet de r�pondre � ces demandes :
�R�cup�rer la liste des r�gions
�R�cup�rer le code et le nom de chaque r�gions
�R�cup�rer la liste des villes venant du d�partement 01
�R�cup�rer la liste des villes venant du d�partement 01 en excluant les doublons des noms de ville
�R�cup�rer toutes les villes ayant un code postal entre 01000 inclus et 04000 exclus
�R�cup�rer toutes les villes de tous les codes d�partement au dessus de 93 et ayant le code postal non 'vide'
�R�cup�rer toutes les villes ayant un code postal 'vide'
� R�cup�rer la liste des villes venant du d�partement 01 ou du 44
*/

-- �R�cup�rer la liste des r�gions
SELECT name FROM regions;

-- �R�cup�rer le code et le nom de chaque r�gions
SELECT code,name FROM regions;

-- �R�cup�rer la liste des villes venant du d�partement 01
SELECT name FROM cities WHERE department_code=01;
-- 414

-- �R�cup�rer la liste des villes venant du d�partement 01
--  en excluant les doublons des noms de ville
SELECT DISTINCT name FROM cities WHERE department_code=01;
-- 407

-- �R�cup�rer toutes les villes ayant un code postal 
--  entre 01000 inclus et 04000 exclus
SELECT name FROM cities WHERE zip_code BETWEEN 01000 AND 03999;
-- 1538

-- �R�cup�rer toutes les villes de tous les codes d�partement 
--  au dessus de 93 et ayant le code postal non 'vide'
SELECT name FROM cities WHERE department_code>93 AND zip_code IS NOT NULL;
-- 428

-- �R�cup�rer toutes les villes ayant un code postal 'vide'
SELECT name FROM cities WHERE zip_code IS NULL;
-- 52

-- � R�cup�rer la liste des villes venant du d�partement 01 et du 44
SELECT name FROM cities WHERE department_code = 01 OR department_code = 44;
-- 626

-- SELECT count(*) FROM cities;


/*
-- Exo 2 	� : R�aliser un script qui permet de r�pondre � ces demandes :
�Combien y a t il de villes dans le d�partement 44 ?
�R�cup�rer la liste des villes venant du d�partement 44 et afficher seulement les 100 premi�res
�Afficher le code postal minimum et maximum des villes en BDD
�D�terminer la coordonn�e centrale du d�partement 44
� Afficher la liste des villes du 44 commen�ant par lettre 's' et ayant comme troisi�me lettre un 'i'
�Afficher les 10 villes ayant le plus grand code postal du 44
�Comptabiliser le nombre de villes de chaque d�partement
�Comptabiliser le nombre de villes de chaque d�partement et afficher seulement ceux ayant plus de 30 villes
�Afficher toutes les villes ayant pour d�partement 'Loire Atlantique'
*/

-- �Combien y a t il de villes dans le d�partement 44 ?
SELECT count(department_code) FROM cities WHERE department_code=44;
-- 212

-- �R�cup�rer la liste des villes venant du d�partement 44 et 
--  afficher seulement les 100 premi�res
SELECT name FROM cities WHERE department_code=44 LIMIT 100;

-- �Afficher le code postal minimum et maximum des villes en BDD
SELECT min(zip_code),max(zip_code) FROM cities;
-- 01000 et 98882

-- �D�terminer la coordonn�e centrale du d�partement 44
SELECT avg(gps_lat), avg(gps_lng) FROM citiesWHERE department_code=44;
-- 47.3347287582692	et -1.6775410063325669

-- �Afficher la liste des villes du 44 commen�ant par lettre 's' 
--  et ayant comme troisi�me lettre un 'i'
/*
SELECT name FROM cities WHERE department_code=44;
SELECT name FROM cities WHERE name LIKE 's%' AND name LIKE '__i%';
*/
SELECT name FROM cities WHERE department_code=44 AND name LIKE 's_i%';
-- 37

-- �Afficher les 10 villes ayant le plus grand code postal du 44
SELECT name FROM cities WHERE department_code=44 ORDER BY zip_code DESC LIMIT 10;

-- �Comptabiliser le nombre de villes de chaque d�partement
SELECT department_code,count(name) FROM cities GROUP BY department_code;
-- 109

-- �Comptabiliser le nombre de villes de chaque d�partement 
--  et afficher seulement ceux ayant plus de 30 villes
SELECT department_code,count(name) FROM cities GROUP BY department_code HAVING count(name)>30;
-- 100

-- �Afficher toutes les villes ayant pour d�partement 'Loire-Atlantique'
SELECT name FROM cities WHERE department_code=44;

SELECT * FROM cities WHERE department_code IN (
SELECT code FROM departments WHERE name = 'Loire-Atlantique');
-- 212


/*
-- Exo 3 	� : R�aliser un script qui permet de r�pondre � ces demandes :
�Afficher toutes les villes ayant pour d�partement 'Loire Atlantique�
�Afficher le nombre de d�partements qu'il y a en 'Pays de la Loire�
�Afficher la liste du nombre de d�partements par r�gion
�Afficher le nombre de ville ayant pour nom de r�gion 'Pays de la Loire'
�Afficher chaque ville qui s'appelle 'Saint Paul' avec le nom de son d�partement et de sa r�gion
�Afficher le nombre de villes qui poss�de le mot �Saint�, �tant en r�gion �Pays de la Loire�
*/

-- �Afficher toutes les villes ayant pour d�partement 'Loire Atlantique�
SELECT cities.name FROM cities 
INNER JOIN departments ON cities.department_code=departments.code 
WHERE departments.name = 'Loire-Atlantique';

SELECT c.name FROM cities AS c
INNER JOIN departments AS d ON c.department_code=d.code 
WHERE d.name = 'Loire-Atlantique';
-- 212

-- �Afficher le nombre de d�partements qu'il y a en 'Pays de la Loire�
SELECT name FROM departments
WHERE region_code = 52;

SELECT count(regions.code) FROM departments
INNER JOIN regions ON departments.region_code=regions.code
WHERE regions.name = 'Pays de la Loire';
-- 5

-- �Afficher la liste du nombre de d�partements par r�gion
SELECT regions.name, count(regions.code) FROM departments
INNER JOIN regions ON departments.region_code=regions.code
 GROUP BY regions.code;
-- 19

-- �Afficher le nombre de ville ayant pour nom de r�gion 'Pays de la Loire'
SELECT regions.name, count(cities.name) FROM cities
INNER JOIN departments ON cities.department_code=departments.code 
INNER JOIN regions ON departments.region_code=regions.code
WHERE regions.name = 'Pays de la Loire';
-- 1316

-- �Afficher chaque ville qui s'appelle 'Saint Paul' avec 
--  le nom de son d�partement et de sa r�gion
SELECT cities.name, departments.name, regions.name FROM cities
INNER JOIN departments ON cities.department_code=departments.code 
INNER JOIN regions ON departments.region_code=regions.code
WHERE cities.name LIKE 'Saint_Paul';
-- 14

-- �Afficher le nombre de villes qui poss�de le mot �Saint�, 
--  �tant en r�gion �Pays de la Loire�
SELECT regions.name, count(cities.name) FROM cities
INNER JOIN departments ON cities.department_code=departments.code 
INNER JOIN regions ON departments.region_code=regions.code
WHERE regions.name = 'Pays de la Loire' AND cities.name LIKE '%Saint%';
-- 260
