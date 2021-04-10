 /*   Veuillez trouver les requêtes SQL permettant d’effectuer chacune des demandes suivantes :
   		 Obtenir la liste des 10 villes les plus peuplées en 2012
   		 Obtenir la liste des 50 villes ayant la plus faible superficie
   		 Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
   		 Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
   		 Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
   		 Obtenir la liste des 10 plus grands départements, en terme de superficie
   		 Compter le nombre de villes dont le nom commence par “Saint”
   		 Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
  		 Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne
   		 Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
   		 Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)
 */
 
-- 		Obtenir la liste des 10 villes les plus peuplées en 2012
SELECT ville_nom, ville_population_2012 FROM villes_france_free 
ORDER BY ville_population_2012 DESC LIMIT 10;
 
-- 		Obtenir la liste des 50 villes ayant la plus faible superficie
SELECT ville_nom, ville_surface FROM villes_france_free 
ORDER BY ville_surface ASC LIMIT 50;
 
--    	Obtenir la liste des départements d’outres-mer, 
-- 		c’est-à-dire ceux dont le numéro de département commencent par “97”
SELECT departement_nom,departement_code FROM departement 
WHERE departement_code LIKE '97%';
 
--    	Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
SELECT villes_france_free.ville_nom, villes_france_free.ville_population_2012,
departement.departement_nom FROM villes_france_free 
INNER JOIN departement ON villes_france_free.ville_departement=departement.departement_code
ORDER BY ville_population_2012 DESC LIMIT 10;

--    	Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune 
-- 		au sein de ces département, en triant afin d’obtenir en priorité les départements qui 
-- 		possèdent le plus de communes
SELECT departement.departement_nom, departement.departement_code, count(villes_france_free.ville_departement) 
FROM villes_france_free
INNER JOIN departement ON villes_france_free.ville_departement=departement.departement_code
GROUP BY villes_france_free.ville_departement
ORDER BY count(villes_france_free.ville_departement) DESC;
 
--    	Obtenir la liste des 10 plus grands départements, en terme de superficie
 SELECT departement.departement_nom, departement.departement_code, sum(villes_france_free.ville_surface)
 FROM villes_france_free
INNER JOIN departement ON villes_france_free.ville_departement=departement.departement_code 
GROUP BY villes_france_free.ville_departement
ORDER BY sum(villes_france_free.ville_surface) DESC 
LIMIT 10;

--    	Compter le nombre de villes dont le nom commence par “Saint”
SELECT count(villes_france_free.ville_nom) FROM villes_france_free
WHERE villes_france_free.ville_nom LIKE 'Saint%';
 
--    	Obtenir la liste des villes qui ont un nom existants plusieurs fois, 
-- 		et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
SELECT villes_france_free.ville_nom, count(villes_france_free.ville_nom)  FROM villes_france_free
GROUP BY villes_france_free.ville_nom
ORDER BY count(villes_france_free.ville_nom) DESC;
 
--   	Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur 
-- 		à la superficie moyenne
SELECT villes_france_free.ville_nom, villes_france_free.ville_surface
FROM villes_france_free
WHERE villes_france_free.ville_surface > (SELECT avg(villes_france_free.ville_surface)FROM villes_france_free)
ORDER BY villes_france_free.ville_surface DESC;

--    	Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
SELECT departement_nom, sum(villes_france_free.ville_population_2012)
FROM villes_france_free
INNER JOIN departement ON villes_france_free.ville_departement=departement.departement_code 
GROUP BY departement_nom HAVING sum(villes_france_free.ville_population_2012)>2000000
ORDER BY sum(villes_france_free.ville_population_2012) DESC;

--    	Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” 
-- 		(dans la colonne qui contient les noms en majuscule)
 UPDATE villes_france_free
 SET ville_nom = REPLACE(ville_nom, '-' , ' ')
 WHERE ville_nom LIKE 'SAINT-%';
 

 
 
 
 
 
 
 