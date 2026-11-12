-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 12 nov. 2026 à 09:56
-- Version du serveur : 10.11.14-MariaDB-0ubuntu0.24.04.1
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `panini_volley`
--

-- --------------------------------------------------------

--
-- Structure de la table `Cahier`
--

CREATE TABLE `Cahier` (
  `Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Cahier_Joueur`
--

CREATE TABLE `Cahier_Joueur` (
  `Joueur_Id` int(10) NOT NULL,
  `Cahier_Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE `Joueur` (
  `Id` int(10) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Numero` int(2) NOT NULL,
  `Taille` int(3) NOT NULL,
  `Poste` varchar(50) NOT NULL,
  `Nombre` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `Id` int(10) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Mdp` varchar(50) NOT NULL,
  `Cahier_Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Cahier`
--
ALTER TABLE `Cahier`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Cahier_Joueur`
--
ALTER TABLE `Cahier_Joueur`
  ADD KEY `Cahier_Id` (`Cahier_Id`),
  ADD KEY `Joueur_Id` (`Joueur_Id`);

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Cahier_Id` (`Cahier_Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Cahier`
--
ALTER TABLE `Cahier`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Joueur`
--
ALTER TABLE `Joueur`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Cahier_Joueur`
--
ALTER TABLE `Cahier_Joueur`
  ADD CONSTRAINT `Cahier_Joueur_ibfk_1` FOREIGN KEY (`Cahier_Id`) REFERENCES `Cahier` (`Id`),
  ADD CONSTRAINT `Cahier_Joueur_ibfk_2` FOREIGN KEY (`Joueur_Id`) REFERENCES `Joueur` (`Id`);

--
-- Contraintes pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD CONSTRAINT `Utilisateur_ibfk_1` FOREIGN KEY (`Cahier_Id`) REFERENCES `Cahier` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
