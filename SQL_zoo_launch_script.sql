-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 26 Janvier 2017 à 20:48
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliment`
--

CREATE TABLE `aliment` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `quantite_dispo` int(11) NOT NULL,
  `substitution` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `aliment`
--

INSERT INTO `aliment` (`id`, `designation`, `quantite_dispo`, `substitution`) VALUES
(1, 'Boeuf', 100, 10),
(2, 'Bambou', 500, 12),
(5, 'Souris', 100, 13),
(6, 'Foin', 1000, 14),
(7, 'Sardines', 800, 15),
(8, 'Branchages', 1200, 16),
(9, 'Granulés de céréales', 1500, 17),
(10, 'Volaille', 200, 1),
(12, 'Fruits (Pomme, poire, carotte)', 200, 2),
(13, 'Rongeurs', 200, 5),
(14, 'Granulés de foin', 200, 6),
(15, 'Maquereaux', 200, 7),
(16, 'Ecorces, fruits, herbes', 200, 8),
(17, 'Paillettes lyophilisées', 200, 9);

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `nom` varchar(128) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `date_arrivee` date NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `procede_identification` enum('puce','tatouage','aucun') DEFAULT NULL,
  `date_deces` date DEFAULT NULL,
  `zone_id` int(11) NOT NULL,
  `espece_id` int(11) NOT NULL,
  `sexe` enum('male','femelle') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `animal`
--

INSERT INTO `animal` (`id`, `nom`, `commentaire`, `date_arrivee`, `date_naissance`, `numero`, `procede_identification`, `date_deces`, `zone_id`, `espece_id`, `sexe`) VALUES
(3, 'Gizzi', '', '2001-01-05', '2001-01-02', 123132, 'puce', NULL, 2, 8, 'male'),
(4, 'Greta', NULL, '2003-09-02', '2003-09-02', 654521, 'puce', NULL, 11, 7, 'femelle'),
(5, 'Lala', '', '2005-09-30', '2004-02-04', 546521, 'puce', NULL, 2, 8, 'male'),
(6, 'Lelu', '', '2008-11-21', '2008-11-21', 98754, 'tatouage', NULL, 1, 9, 'femelle'),
(7, 'Opale', '', '2009-10-26', '2009-10-26', 654211, 'tatouage', '2016-12-10', 1, 10, 'male'),
(8, 'Riri', '', '2005-02-04', '2005-02-04', 564541, 'puce', NULL, 8, 13, 'femelle'),
(9, 'Loulou', '', '2005-02-04', '2005-02-04', 566541, 'puce', NULL, 8, 13, 'male'),
(10, 'Fifi', '', '2005-02-04', '2005-02-04', 987564, 'puce', NULL, 8, 13, 'femelle'),
(11, 'Lili', '', '2007-03-29', '2005-02-04', 98754, 'tatouage', NULL, 1, 14, 'male'),
(12, 'Uno', '', '2000-04-19', '2000-04-19', 21211, 'tatouage', NULL, 9, 15, 'femelle'),
(13, 'Umala', '', '2003-03-25', '2003-03-25', 56421, 'tatouage', NULL, 9, 15, 'male'),
(14, 'Ushka', '', '2012-05-31', '2012-05-31', 987542, 'tatouage', NULL, 9, 16, 'femelle'),
(15, 'Taro', '', '2013-02-05', '2012-01-15', 542151, 'puce', NULL, 9, 17, 'male'),
(16, 'Diesel', '', '2016-05-23', '2016-04-01', 121255, 'puce', NULL, 8, 18, 'femelle'),
(17, 'Doody', '', '2014-03-10', '2014-03-10', 65421, 'aucun', NULL, 10, 19, 'male'),
(18, 'Nemo', '', '2014-03-10', '2014-03-10', 6543212, 'aucun', NULL, 10, 19, 'femelle'),
(19, 'Dory', '', '2014-03-10', '2014-03-10', 121215, 'aucun', NULL, 10, 19, 'male'),
(20, 'Dixie', '', '2014-03-10', '2014-03-10', 4545654, 'aucun', NULL, 10, 19, 'femelle'),
(21, 'Lilu', '', '2015-03-13', '2015-01-12', 5422111, 'tatouage', NULL, 3, 20, 'male'),
(22, 'Gabbi', '', '2015-05-27', '2015-05-27', 112545, 'tatouage', NULL, 13, 21, 'femelle'),
(23, 'Uki', '', '2012-04-05', '2010-03-15', 123456, 'tatouage', NULL, 11, 7, 'male'),
(24, 'Enzo', 'Né dans le zoo', '2016-11-21', '2016-11-21', 191121, 'tatouage', NULL, 9, 15, 'femelle'),
(25, 'touktouk', NULL, '2017-01-24', '2017-01-24', 457895, 'puce', NULL, 11, 7, 'male'),
(26, 'bouba', NULL, '2016-12-08', '2016-12-08', 631798, 'puce', NULL, 1, 7, 'male');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE `espece` (
  `id` int(11) NOT NULL,
  `nom_scientifique` varchar(255) NOT NULL,
  `nom_vulgaire` varchar(255) NOT NULL,
  `nbre_individus_vivants` varchar(255) NOT NULL,
  `espece_menacee` enum('oui','non') NOT NULL,
  `famille_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `espece`
--

INSERT INTO `espece` (`id`, `nom_scientifique`, `nom_vulgaire`, `nbre_individus_vivants`, `espece_menacee`, `famille_id`) VALUES
(7, 'Ailuropoda melanoleuca', 'Panda géant', '3500', 'oui', 1),
(8, 'Ursus arctos', 'Ours brun', '200000', 'non', 1),
(9, 'Loxodonta Africana', 'Éléphant d\'Afrique', '40000', 'oui', 2),
(10, 'Elephas maximus', 'Éléphant d\'Asie', '40000', 'oui', 2),
(13, 'Alca torda', 'Petit Pingouin', '1000000', 'non', 4),
(14, 'Giraffa camelopardalis', 'Girafe', '40000', 'oui', 3),
(15, 'Panthera leo', 'Lion', '30000', 'oui', 5),
(16, 'Parahyaena brunnea', 'Hyène brune', '8000', 'oui', 6),
(17, 'Panthera tigris', 'Tigre', '3500', 'oui', 5),
(18, 'Cystophora cristata', 'Phoque à capuchon', '4000', 'oui', 7),
(19, 'Mikrogeophagus ramirezi', 'Ramirezi', 'Inconnu', 'non', 8),
(20, 'Alligator mississippiensis', 'Alligator d\'Amérique', '800000', 'non', 10),
(21, 'Varanus komodoensis', 'Dragon de Komodo', '7000', 'oui', 9);

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `famille`
--

INSERT INTO `famille` (`id`, `code`, `designation`) VALUES
(1, 15621, 'Ursidae'),
(2, 98784, 'Elephantidae'),
(3, 89454, 'Giraffidae'),
(4, 64654, 'Alcidae'),
(5, 15646, 'Felidae'),
(6, 14566, 'Hyaenidae'),
(7, 98951, 'Phocidae'),
(8, 21552, 'Cichlidae'),
(9, 98475, 'Varanidae'),
(10, 878441, 'Alligatoridae');

-- --------------------------------------------------------

--
-- Structure de la table `mange`
--

CREATE TABLE `mange` (
  `aliment_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `mange`
--

INSERT INTO `mange` (`aliment_id`, `animal_id`, `quantite`) VALUES
(1, 3, 10),
(12, 3, 10),
(2, 4, 10),
(12, 4, 10),
(1, 5, 10),
(12, 5, 10),
(8, 6, 10),
(12, 6, 10),
(7, 8, 1),
(7, 9, 1),
(7, 10, 1),
(8, 11, 10),
(12, 11, 10),
(6, 11, 10),
(1, 12, 10),
(1, 13, 10),
(1, 14, 10),
(1, 15, 10),
(15, 16, 10),
(17, 17, 1),
(17, 18, 1),
(17, 20, 1),
(17, 21, 1),
(10, 21, 10),
(13, 22, 10),
(2, 23, 10),
(17, 19, 1),
(1, 24, 5);

-- --------------------------------------------------------

--
-- Structure de la table `repartition_geographique`
--

CREATE TABLE `repartition_geographique` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `repartition_geographique`
--

INSERT INTO `repartition_geographique` (`id`, `designation`, `code`) VALUES
(1, 'USA (Floride)', 798789),
(2, 'USA (Lousianne)', 564454),
(3, 'Chine', 798741),
(4, 'Indonésie', 847441),
(5, 'Alaska', 987410),
(6, 'Colombie', 89741),
(7, 'Viêt Nam', 9875454),
(8, 'Thaïlande', 897112),
(9, 'Congo', 35612),
(10, 'Gana', 54651),
(11, 'Islande', 115685),
(12, 'Russie', 45482),
(13, 'Cameroun', 44561),
(14, 'Guiné', 87711),
(15, 'France (Pyrénées)', 321156);

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

CREATE TABLE `repas` (
  `date_repas` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantite` smallint(20) NOT NULL,
  `responsable_id` smallint(20) NOT NULL,
  `zone_id` smallint(20) NOT NULL,
  `aliment_id` smallint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `repas`
--

INSERT INTO `repas` (`date_repas`, `quantite`, `responsable_id`, `zone_id`, `aliment_id`) VALUES
('2016-12-28 00:00:00', 20, 5, 2, 1),
('2016-12-28 00:00:00', 20, 5, 2, 12),
('2016-12-27 00:00:00', 20, 5, 2, 1),
('2016-12-27 00:00:00', 20, 5, 2, 12),
('2016-11-27 00:00:00', 20, 5, 2, 1),
('2016-10-27 00:00:00', 20, 5, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `identifiant` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) NOT NULL,
  `type` enum('secretaire','responsable_zone','magasinier') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `identifiant`, `password`, `remember_token`, `type`) VALUES
(1, 'Roy', 'Antoine', 'roy.antoine', 'antoine45', '', 'responsable_zone'),
(2, 'Nadeau', 'Michel', 'nadeau.michel', 'nadeau46', '', 'magasinier'),
(3, 'Ferland', 'Virginie', 'ferland.virginie', 'ferland47', '', 'secretaire'),
(4, 'Lideau', 'Louis', 'lideau.louis', 'lideau48', '', 'responsable_zone'),
(5, 'Durand', 'Henri', 'durand.henri', 'durand49', '', 'responsable_zone'),
(6, 'Rossard', 'Mickaël', 'rossard.mickael', 'rossard50', '', 'responsable_zone');

-- --------------------------------------------------------

--
-- Structure de la table `vit`
--

CREATE TABLE `vit` (
  `espece_id` int(11) NOT NULL,
  `repartition_geographique_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vit`
--

INSERT INTO `vit` (`espece_id`, `repartition_geographique_id`) VALUES
(20, 1),
(20, 2),
(7, 3),
(10, 3),
(10, 4),
(21, 4),
(8, 5),
(18, 5),
(8, 6),
(19, 6),
(10, 7),
(10, 8),
(9, 9),
(14, 9),
(15, 9),
(9, 10),
(14, 10),
(17, 10),
(13, 11),
(13, 12),
(15, 13),
(16, 13),
(17, 14),
(8, 15);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `id` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `responsable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zone`
--

INSERT INTO `zone` (`id`, `designation`, `responsable_id`) VALUES
(1, 'Savane - Herbivores', 6),
(2, 'Montagne - Enclos des ours', 5),
(3, 'Terrarium des alligators', 4),
(8, 'Bassin des phoques et pingouins', 1),
(9, 'Savane - Carnivores', 5),
(10, 'Aquarium des ramirezi', 1),
(11, 'Montagne - Enclos des pandas', 6),
(13, 'Terrarium des dragons de komodo', 4),
(14, 'Forêt', 5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `aliment`
--
ALTER TABLE `aliment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `substitution` (`substitution`) USING BTREE;

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_animal_zone_idx` (`zone_id`),
  ADD KEY `fk_animal_espece1_idx` (`espece_id`);

--
-- Index pour la table `espece`
--
ALTER TABLE `espece`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_espece_famille1_idx` (`famille_id`);

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mange`
--
ALTER TABLE `mange`
  ADD PRIMARY KEY (`aliment_id`,`animal_id`) USING BTREE;

--
-- Index pour la table `repartition_geographique`
--
ALTER TABLE `repartition_geographique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`date_repas`,`responsable_id`,`zone_id`,`aliment_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vit`
--
ALTER TABLE `vit`
  ADD PRIMARY KEY (`espece_id`,`repartition_geographique_id`),
  ADD KEY `fk_espece_has_repartition_geographique_repartition_geograph_idx` (`repartition_geographique_id`),
  ADD KEY `fk_espece_has_repartition_geographique_espece1_idx` (`espece_id`);

--
-- Index pour la table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zone_responsable1_idx` (`responsable_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `aliment`
--
ALTER TABLE `aliment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `espece`
--
ALTER TABLE `espece`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `famille`
--
ALTER TABLE `famille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `repartition_geographique`
--
ALTER TABLE `repartition_geographique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `zone`
--
ALTER TABLE `zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_animal_espece1` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_animal_zone` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `espece`
--
ALTER TABLE `espece`
  ADD CONSTRAINT `fk_espece_famille1` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `vit`
--
ALTER TABLE `vit`
  ADD CONSTRAINT `fk_espece_has_repartition_geographique_espece1` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_espece_has_repartition_geographique_repartition_geographiq1` FOREIGN KEY (`repartition_geographique_id`) REFERENCES `repartition_geographique` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `fk_zone_responsable1` FOREIGN KEY (`responsable_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;