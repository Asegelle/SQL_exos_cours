-- Combien y a-t-il de villes dans le département 44 ? 
SELECT COUNT(*) FROM cities
WHERE department_code = 44;
-- 212

-- Récupérer la liste des villes venant du département 44 et afficher seulement les 100 premières
SELECT * FROM cities
WHERE department_code = 44
LIMIT 100;
-- 100 en tout

-- Afficher le code postal minimum et maximum des villes
SELECT MIN(zip_code), MAX(zip_code) FROM cities;
-- 01000 98882

-- Déterminer la coordonnée central du département 44
SELECT AVG(gps_lat), AVG(gps_lng) FROM cities
WHERE department_code = 44;
-- 47.3347287582692	-1.6775410063325669

-- Afficher la liste des villes du 44 commençant par lettre 's' et ayant comme troisième lettre un 'i'
SELECT * FROM cities
WHERE department_code = 44
AND name LIKE 's_i%';

-- Afficher les 10 villes ayant le plus grand code postal du 44
SELECT * FROM cities
WHERE department_code = 44
ORDER BY zip_code DESC
LIMIT 10;

-- Comptabiliser le nombre de ville de chaque département
SELECT COUNT(*), department_code FROM cities
GROUP BY department_code;
-- 109

-- Comptabiliser le nombre de ville de chaque département et afficher seulement ceux ayant plus de 30 villes
SELECT COUNT(*), department_code FROM cities
GROUP BY department_code
HAVING COUNT(*) > 30;
-- 100

-- Afficher toute les villes ayant pour département 'Loire-Atlantique'
SELECT * FROM cities
WHERE department_code IN (
	SELECT code FROM departments
	WHERE name = 'Loire-Atlantique'
);
-- 212