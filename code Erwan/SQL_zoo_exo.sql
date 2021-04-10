
-- -----------------------------------------------------------------------------------------
-- -------------------------------exo Zoo --------------------------------------------------
-- -----------------------------------------------------------------------------------------

-- •Combien y a-t-il d’animaux d’espèces différentes dans le zoo ?
SELECT count(DISTINCT espece_id) FROM animal;
-- 13

-- •Comment s’appelle les animaux qui sont décédés dans le zoo ?
SELECT nom FROM animal 
WHERE date_deces IS NOT NULL;
-- Opale

-- •Combien y a t'il d'animaux étant une espèce menacée dans le zoo ?
SELECT count(animal.nom) FROM animal
INNER JOIN espece ON animal.espece_id = espece.id
WHERE espece.espece_menacee = 'oui';
-- 14

-- •Lister les espèces extrêmement menacées avec moins de 10000 individus vivants restant
SELECT nom_scientifique FROM espece 
WHERE nbre_individus_vivants < 10000
AND  espece.espece_menacee = 'oui';
-- ne pas oubler le "espece menacé" car il y a 1 unknown pr nbr indiv vivants
-- 5 : 	Ailuropoda melanoleuca; Parahyaena brunnea; Panthera tigris
-- 		Cystophora cristata; Varanus komodoensis

-- •Combien y a t-il d'animaux venant de la répartition géographique ayant pour code 798 741 ?
SELECT count(animal.nom) FROM animal 
INNER JOIN espece ON animal.espece_id = espece.id
INNER JOIN vit ON espece.id = vit.espece_id
INNER JOIN repartition_geographique ON vit.repartition_geographique_id = repartition_geographique.id
WHERE repartition_geographique.code=798741;
-- penser à écrire le chiffre tout attaché !
-- 5

-- •Lister toutes les espèces du zoo avec leur famille par ordre alphabétique pour la famille
SELECT espece.nom_scientifique, espece.nom_vulgaire FROM espece
INNER JOIN famille ON espece.famille_id = famille.id
ORDER BY espece.nom_scientifique;
-- 13

-- •Combien Louis gère t-il d'animaux ?
SELECT count(animal.nom) FROM animal
INNER JOIN `zone`ON animal.zone_id = `zone`.id
INNER JOIN utilisateur ON ZONE.responsable_id=utilisateur.id
WHERE utilisateur.prenom = 'louis';
-- 2

-- •Combien y a t-il d'animaux venant de chaque répartition géographique ?
SELECT  repartition_geographique.designation, count(animal.nom) FROM animal 
INNER JOIN espece ON animal.espece_id = espece.id
INNER JOIN vit ON espece.id = vit.espece_id
INNER JOIN repartition_geographique ON vit.repartition_geographique_id = repartition_geographique.id
GROUP by repartition_geographique.designation;

-- •Lister les animaux qui mange de la viande
SELECT  animal.nom FROM animal 
INNER JOIN mange ON animal.id = mange.animal_id
INNER JOIN aliment ON mange.aliment_id = aliment.id
WHERE aliment.id IN (1,5,7,10,13,15);
-- 13

-- Lister les animaux qui mange autre chose que de la viande
 SELECT  animal.nom FROM animal 
INNER JOIN mange ON animal.id = mange.animal_id
INNER JOIN aliment ON mange.aliment_id = aliment.id
WHERE aliment.id NOT IN (1,5,7,10,13,15);                                                                                                                                                                                               les animaux qui mange autre chose que de la viande
-- 15











