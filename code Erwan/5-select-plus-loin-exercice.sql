-- Combien y a-t-il de villes dans le d�partement 44 ? 
SELECT COUNT(*) FROM cities
WHERE department_code = 44;
-- 212

-- R�cup�rer la liste des villes venant du d�partement 44 et afficher seulement les 100 premi�res
SELECT * FROM cities
WHERE department_code = 44
LIMIT 100;
-- 100 en tout

-- Afficher le code postal minimum et maximum des villes
SELECT MIN(zip_code), MAX(zip_code) FROM cities;
-- 01000 98882

-- D�terminer la coordonn�e central du d�partement 44
SELECT AVG(gps_lat), AVG(gps_lng) FROM cities
WHERE department_code = 44;
-- 47.3347287582692	-1.6775410063325669

-- Afficher la liste des villes du 44 commen�ant par lettre 's' et ayant comme troisi�me lettre un 'i'
SELECT * FROM cities
WHERE department_code = 44
AND name LIKE 's_i%';

-- Afficher les 10 villes ayant le plus grand code postal du 44
SELECT * FROM cities
WHERE department_code = 44
ORDER BY zip_code DESC
LIMIT 10;

-- Comptabiliser le nombre de ville de chaque d�partement
SELECT COUNT(*), department_code FROM cities
GROUP BY department_code;
-- 109

-- Comptabiliser le nombre de ville de chaque d�partement et afficher seulement ceux ayant plus de 30 villes
SELECT COUNT(*), department_code FROM cities
GROUP BY department_code
HAVING COUNT(*) > 30;
-- 100

-- Afficher toute les villes ayant pour d�partement 'Loire-Atlantique'
SELECT * FROM cities
WHERE department_code IN (
	SELECT code FROM departments
	WHERE name = 'Loire-Atlantique'
);
-- 212