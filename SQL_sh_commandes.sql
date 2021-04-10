/*
Veuillez trouver les requ�tes SQL permettant d�effectuer chacune des demandes suivantes :
   - Obtenir l�utilisateur ayant le pr�nom �Muriel� et le mot de passe �test11�, sachant que l�encodage du mot de passe est effectu� avec l�algorithme Sha1.
   - Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes.
   - Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes et y ajouter une colonne qui liste les identifiants des commandes associ�es.
   - Enregistrer le prix total � l�int�rieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantit�
   - Obtenir le montant total pour chaque commande et y voir facilement la date associ�e � cette commande ainsi que le pr�nom et nom du client associ�
   - (difficult� tr�s haute) Enregistrer le montant total de chaque commande dans le champ intitul� �cache_prix_total�
   - Obtenir le montant global de toutes les commandes, pour chaque mois
   - Obtenir la liste des 10 clients qui ont effectu� le plus grand montant de commandes, et obtenir ce montant total pour chaque client.
   - Obtenir le montant total des commandes pour chaque date
   - Ajouter une colonne intitul�e �category� � la table contenant les commandes. Cette colonne contiendra une valeur num�rique
   - Enregistrer la valeur de la cat�gorie, en suivant les r�gles suivantes :
        �1� pour les commandes de moins de 200�
        �2� pour les commandes entre 200� et 500�
        �3� pour les commandes entre 500� et 1.000�
        �4� pour les commandes sup�rieures � 1.000�
   - Cr�er une table intitul�e �commande_category� qui contiendra le descriptif de ces cat�gories
   - Ins�rer les 4 descriptifs de chaque cat�gorie au sein de la table pr�c�demment cr��e
   - Supprimer toutes les commandes (et les lignes des commandes) inf�rieur au 1er f�vrier 2019. Cela doit �tre effectu� en 2 requ�tes maximum

*/
   -- Obtenir l�utilisateur ayant le pr�nom �Muriel� et le mot de passe �test11�, 
   -- sachant que l�encodage du mot de passe est effectu� avec l�algorithme Sha1.
   SELECT * FROM client
   WHERE prenom = 'Muriel' AND password = SHA1("test11");

   -- Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes.
   SELECT commande_ligne.nom, COUNT(commande_ligne.nom)  FROM commande_ligne
   INNER JOIN commande ON commande_ligne.commande_id = commande.id 
   INNER JOIN client ON commande.client_id = client.id 
   GROUP BY  commande_ligne.nom 
   HAVING COUNT(commande_ligne.nom)>1
   ORDER BY COUNT(commande_ligne.nom) DESC;

   -- Obtenir la liste de tous les produits qui sont pr�sent sur plusieurs commandes 
   -- et y ajouter une colonne qui liste les identifiants des commandes associ�es.
   SELECT commande_ligne.nom, count(commande_ligne.nom),group_concat(commande_ligne.commande_id)  
   FROM commande_ligne
   INNER JOIN commande ON commande_ligne.commande_id = commande.id 
   INNER JOIN client ON commande.client_id = client.id 
   GROUP BY  commande_ligne.nom HAVING count(commande_ligne.nom)>1
   ORDER BY count(commande_ligne.nom) DESC;
   
   -- Enregistrer le prix total � l�int�rieur de chaque ligne des commandes, 
   -- en fonction du prix unitaire et de la quantit�
   UPDATE commande_ligne 
   SET prix_total = (prix_unitaire*quantite);

   -- Obtenir le montant total pour chaque commande et y voir facilement la date associ�e � cette commande 
   -- ainsi que le pr�nom et nom du client associ�
   SELECT client.prenom, client.nom, commande.id, commande.date_achat,sum(commande_ligne.prix_total)
   FROM commande_ligne
   INNER JOIN commande ON commande_ligne.commande_id = commande.id 
   INNER JOIN client ON commande.client_id = client.id   
   GROUP BY commande.id; 

   -- (difficult� tr�s haute) Enregistrer le montant total de chaque commande 
   -- dans le champ intitul� �cache_prix_total�
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

   -- Obtenir la liste des 10 clients qui ont effectu� le plus grand montant de commandes, 
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
 
   -- Ajouter une colonne intitul�e �category� � la table contenant les commandes. 
   -- Cette colonne contiendra une valeur num�rique
   ALTER TABLE commande
   ADD category TINYINT AFTER cache_prix_total;

 --   ALTER TABLE commande
 --   DROP COLUMN category;
  
   -- Enregistrer la valeur de la cat�gorie, en suivant les r�gles suivantes :
    --   �1� pour les commandes de moins de 200�
    --   �2� pour les commandes entre 200� et 500�
    --   �3� pour les commandes entre 500� et 1.000�
    --   �4� pour les commandes sup�rieures � 1.000�
   UPDATE commande
   SET category = (
    CASE
      WHEN cache_prix_total<200 THEN 1
      WHEN cache_prix_total<500 THEN 2
      WHEN cache_prix_total<1000 THEN 3
      ELSE 4
    END
   );
   
   -- Cr�er une table intitul�e �commande_category� qui contiendra le descriptif de ces cat�gories
   CREATE TABLE commande_category (
   id INT UNIQUE NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255),
   PRIMARY KEY(id)
   );

   -- Ins�rer les 4 descriptifs de chaque cat�gorie au sein de la table pr�c�demment cr��e
   INSERT INTO commande_category (id, nom)   VALUES (1 , 'commandes de moins de 200�');
   INSERT INTO commande_category (id, nom)   VALUES (2 , 'commandes entre 200� et 500�');
   INSERT INTO commande_category (id, nom)   VALUES (3 , 'commandes entre 500� et 1.000�');
   INSERT INTO commande_category (id, nom)   VALUES (4 , 'commandes sup�rieures � 1.000�');

   -- Supprimer toutes les commandes (et les lignes des commandes) inf�rieur au 1er f�vrier 2019. 
   -- Cela doit �tre effectu� en 2 requ�tes maximum
  DELETE FROM commande_ligne
  WHERE commande_id IN (SELECT id FROM commande WHERE date_achat < '2019-02-01');
  
  DELETE FROM commande
  WHERE date_achat < '2019-02-01';











