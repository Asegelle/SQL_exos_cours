/*
Veuillez trouver les requêtes SQL permettant d’effectuer chacune des demandes suivantes :
   - Obtenir l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
   - Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.
   - Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes et y ajouter une colonne qui liste les identifiants des commandes associées.
   - Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité
   - Obtenir le montant total pour chaque commande et y voir facilement la date associée à cette commande ainsi que le prénom et nom du client associé
   - (difficulté très haute) Enregistrer le montant total de chaque commande dans le champ intitulé “cache_prix_total”
   - Obtenir le montant global de toutes les commandes, pour chaque mois
   - Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, et obtenir ce montant total pour chaque client.
   - Obtenir le montant total des commandes pour chaque date
   - Ajouter une colonne intitulée “category” à la table contenant les commandes. Cette colonne contiendra une valeur numérique
   - Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
        “1” pour les commandes de moins de 200€
        “2” pour les commandes entre 200€ et 500€
        “3” pour les commandes entre 500€ et 1.000€
        “4” pour les commandes supérieures à 1.000€
   - Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
   - Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée
   - Supprimer toutes les commandes (et les lignes des commandes) inférieur au 1er février 2019. Cela doit être effectué en 2 requêtes maximum

*/
   -- Obtenir l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, 
   -- sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
   SELECT * FROM client
   WHERE prenom = 'Muriel' AND password = SHA1("test11");

   -- Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.
   SELECT commande_ligne.nom, COUNT(commande_ligne.nom)  FROM commande_ligne
   INNER JOIN commande ON commande_ligne.commande_id = commande.id 
   INNER JOIN client ON commande.client_id = client.id 
   GROUP BY  commande_ligne.nom 
   HAVING COUNT(commande_ligne.nom)>1
   ORDER BY COUNT(commande_ligne.nom) DESC;

   -- Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes 
   -- et y ajouter une colonne qui liste les identifiants des commandes associées.
   SELECT commande_ligne.nom, count(commande_ligne.nom),group_concat(commande_ligne.commande_id)  
   FROM commande_ligne
   INNER JOIN commande ON commande_ligne.commande_id = commande.id 
   INNER JOIN client ON commande.client_id = client.id 
   GROUP BY  commande_ligne.nom HAVING count(commande_ligne.nom)>1
   ORDER BY count(commande_ligne.nom) DESC;
   
   -- Enregistrer le prix total à l’intérieur de chaque ligne des commandes, 
   -- en fonction du prix unitaire et de la quantité
   UPDATE commande_ligne 
   SET prix_total = (prix_unitaire*quantite);

   -- Obtenir le montant total pour chaque commande et y voir facilement la date associée à cette commande 
   -- ainsi que le prénom et nom du client associé
   SELECT client.prenom, client.nom, commande.id, commande.date_achat,sum(commande_ligne.prix_total)
   FROM commande_ligne
   INNER JOIN commande ON commande_ligne.commande_id = commande.id 
   INNER JOIN client ON commande.client_id = client.id   
   GROUP BY commande.id; 

   -- (difficulté très haute) Enregistrer le montant total de chaque commande 
   -- dans le champ intitulé “cache_prix_total”
   UPDATE commande
   INNER JOIN 
   		( SELECT commande_ligne.commande_id, SUM(commande_ligne.prix_total) 
   		FROM commande_ligne
  		GROUP BY commande_ligne.commande_id )
   ON commande.id = commande_ligne.commande_id 
   SET commande.cache_prix_total = commande_ligne.SUM(commande_ligne.prix_total) 
   ;
  
UPDATE commande AS t1 
INNER JOIN 
    ( SELECT commande_id, SUM(commande_ligne.prix_total) AS p_total 
      FROM commande_ligne 
      GROUP BY commande_id ) t2 
          ON  t1.id = t2.commande_id 
SET t1.cache_prix_total = t2.p_total;


   -- Obtenir le montant global de toutes les commandes, pour chaque mois
   SELECT YEAR(date_achat), MONTH(date_achat), SUM(cache_prix_total)
   FROM commande
   GROUP BY YEAR(date_achat), MONTH(date_achat)
   ORDER BY YEAR(date_achat), MONTH(date_achat);

   -- Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, 
   -- et obtenir ce montant total pour chaque client.
   SELECT client.nom, client.prenom, SUM(commande.cache_prix_total) 
   FROM client
   INNER JOIN commande ON client.id = commande.client_id
   GROUP BY commande.client_id 
   ORDER BY SUM(commande.cache_prix_total)  DESC
   LIMIT 10;
   
    -- Obtenir le montant total des commandes pour chaque date
   SELECT commande.date_achat, SUM(commande.cache_prix_total)
   FROM commande 
   GROUP BY commande.date_achat
   ORDER BY commande.date_achat DESC;
 
   -- Ajouter une colonne intitulée “category” à la table contenant les commandes. 
   -- Cette colonne contiendra une valeur numérique
   ALTER TABLE commande
   ADD category TINYINT AFTER cache_prix_total;

 --   ALTER TABLE commande
 --   DROP COLUMN category;
  
   -- Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
    --   “1” pour les commandes de moins de 200€
    --   “2” pour les commandes entre 200€ et 500€
    --   “3” pour les commandes entre 500€ et 1.000€
    --   “4” pour les commandes supérieures à 1.000€
   UPDATE commande
   SET category = (
    CASE
      WHEN cache_prix_total<200 THEN 1
      WHEN cache_prix_total<500 THEN 2
      WHEN cache_prix_total<1000 THEN 3
      ELSE 4
    END
   );
   
   -- Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
   CREATE TABLE commande_category (
   id INT UNIQUE NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255),
   PRIMARY KEY(id)
   );

   -- Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée
   INSERT INTO commande_category (id, nom)   VALUES (1 , 'commandes de moins de 200€');
   INSERT INTO commande_category (id, nom)   VALUES (2 , 'commandes entre 200€ et 500€');
   INSERT INTO commande_category (id, nom)   VALUES (3 , 'commandes entre 500€ et 1.000€');
   INSERT INTO commande_category (id, nom)   VALUES (4 , 'commandes supérieures à 1.000€');

   -- Supprimer toutes les commandes (et les lignes des commandes) inférieur au 1er février 2019. 
   -- Cela doit être effectué en 2 requêtes maximum
  DELETE FROM commande_ligne
  WHERE commande_id IN (SELECT id FROM commande WHERE date_achat < '2019-02-01');
  
  DELETE FROM commande
  WHERE date_achat < '2019-02-01';











