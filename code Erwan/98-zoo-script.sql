-- Combien y a-t-il d’animaux d’espèces différentes dans le zoo ?
SELECT COUNT(DISTINCT espece_id) FROM animal;
-- 13

-- Comment s’appelle le nom de l’animal qui est décédé dans le zoo ?
SELECT nom FROM animal
WHERE date_deces IS NOT NULL;
-- Opale

-- Combien y a t'il d'animaux étant une espèce menacée dans le zoo ?
SELECT COUNT(*) FROM animal AS a
INNER JOIN espece e ON a.espece_id = e.id 
WHERE e.espece_menacee = 'oui';
-- 14

-- Lister les espèces extrêmement menacées avec moins de 10000 individus vivants restant
SELECT nom_scientifique, nbre_individus_vivants FROM espece e
WHERE espece_menacee = 'oui'
AND nbre_individus_vivants < 10000;

-- Combien y a t-il d'animaux venant de la repartition géographique ayant pour code 798 741 ?
SELECT COUNT(*) FROM animal AS a
INNER JOIN espece e ON a.espece_id = e.id
INNER JOIN vit v ON e.id = v.espece_id
INNER JOIN repartition_geographique rg ON v.repartition_geographique_id = rg.id
WHERE rg.code = 798741;
-- 5

-- Lister toutes les espèces du zoo avec leur famille par ordre alphabétique pour la famille
SELECT e.nom_scientifique, e.nom_vulgaire, f.designation FROM espece e
INNER JOIN famille f ON e.famille_id = f.id
ORDER BY f.designation;

-- Combien Louis gère t-il d'animaux ?
SELECT COUNT(*) FROM animal a
INNER JOIN zone z ON a.zone_id = z.id
INNER JOIN utilisateur u ON z.responsable_id = u.id
WHERE u.prenom = 'Louis';
-- 2

-- Combien y a t-il d'animaux venant de chaque repartition géographique ?
SELECT COUNT(*), rg.designation FROM animal a
INNER JOIN espece e ON a.espece_id = e.id
INNER JOIN vit v ON e.id = v.espece_id
INNER JOIN repartition_geographique rg ON v.repartition_geographique_id = rg.id
GROUP BY rg.designation;

-- Lister les noms des animaux qui mange de la viande
SELECT a.nom, a2.designation FROM animal a
INNER JOIN mange m ON a.id = m.animal_id 
INNER JOIN aliment a2 ON m.aliment_id = a2.id
WHERE a2.id IN (1, 5, 7, 10, 13, 15)
ORDER BY a.id;

-- Lister les noms des animaux qui mange autre chose que de la viande
SELECT a.nom, a2.designation FROM animal a
INNER JOIN mange m ON a.id = m.animal_id 
INNER JOIN aliment a2 ON m.aliment_id = a2.id
WHERE a2.id NOT IN (1, 5, 7, 10, 13, 15)
ORDER BY a.id;



