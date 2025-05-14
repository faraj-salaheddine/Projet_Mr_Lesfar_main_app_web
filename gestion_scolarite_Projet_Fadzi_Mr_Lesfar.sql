-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 mai 2025 à 15:41
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_scolarite`
--

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `id_enseignant` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id_enseignant`, `nom`, `prenom`, `email`) VALUES
(2, 'adil', 'jeddi', 'adiljeddi0@gmail.com'),
(3, 'Fettah', 'Ziad', 'fettahziad@gmail.com'),
(4, 'moutaouakil', 'akram', 'akrammoutaoukil@gmail.com'),
(6, 'talal', 'hiba', 'hibatalal@gmail.com'),
(12, 'adil', 'jeddi', 'jeddiadil@gmail.com'),
(13, 'akram', 'hamidi', 'akramhamidi@gmail.com'),
(14, 'mohammed', 'rami', 'mohammedrami@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id_etudiant` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `id_filiere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id_etudiant`, `nom`, `prenom`, `date_naissance`, `id_filiere`) VALUES
(1, 'Bougrine', 'Ahmed', '2006-04-03', 1),
(3, 'Beyaali', 'Fatima Zehra', '2006-02-13', 1),
(4, 'Wajdi', 'Hiba', '2005-02-02', 1),
(5, 'adil', 'jeddi', '2005-12-03', 1),
(6, 'amin', 'bouabidi', '2009-12-23', 2),
(11, 'Bougrin', 'Ahmed', '2006-03-04', 1),
(12, 'Talal', 'karim', '2006-12-06', 2);

-- --------------------------------------------------------

--
-- Structure de la table `evaluations`
--

CREATE TABLE `evaluations` (
  `id_evaluation` int(11) NOT NULL,
  `id_etudiant` int(11) DEFAULT NULL,
  `id_matiere` int(11) DEFAULT NULL,
  `note` float DEFAULT NULL,
  `date_evaluation` date DEFAULT NULL,
  `type_controle` varchar(50) NOT NULL,
  `nom_filiere` varchar(50) NOT NULL,
  `nom_matiere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evaluations`
--

INSERT INTO `evaluations` (`id_evaluation`, `id_etudiant`, `id_matiere`, `note`, `date_evaluation`, `type_controle`, `nom_filiere`, `nom_matiere`) VALUES
(1, 5, 1, 17.5, '2025-04-01', '1ere controle', 'GI-genie-informatique', 'mathematique'),
(2, 12, 3, 16, '2025-04-02', '2eme controle', 'GI-genie-informatique', 'informatique');

-- --------------------------------------------------------

--
-- Structure de la table `filieres`
--

CREATE TABLE `filieres` (
  `id_filiere` int(11) NOT NULL,
  `nom_filiere` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `filieres`
--

INSERT INTO `filieres` (`id_filiere`, `nom_filiere`) VALUES
(1, 'Génie informatique'),
(2, 'Génie Civil'),
(3, 'GBI');

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

CREATE TABLE `matieres` (
  `id_matiere` int(11) NOT NULL,
  `nom_matiere` varchar(100) NOT NULL,
  `id_filiere` int(11) DEFAULT NULL,
  `id_enseignant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id_matiere`, `nom_matiere`, `id_filiere`, `id_enseignant`) VALUES
(1, 'Mathématiques', 1, 3),
(2, 'Reseau informatique', 1, 2),
(3, 'informatique', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','enseignant','etudiant') NOT NULL,
  `gmail` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `username`, `password`, `role`, `gmail`) VALUES
(1, 'Faraj Salaheddine', '$2y$10$iigGaA9IPz/Rg7Qvaso8nukAmB9gliNG6ax18ND5Clh25WX3LaFbi', 'admin', 'farajsalaheddine00@gmail.com'),
(12, 'Fettah Ziad', '$2y$10$X4o//kIF.qAAfOF16emVSuz9i1oDeIYlwv1.qEoWuGND6uNIBlT/C', 'admin', 'fettahziad@gmail.com'),
(14, 'adil jeddi', '$2y$10$PSBBxKxSuQega44xT74yxu1BXN.gLVEb/NwXFyS0ahrHVI.x0v5ke', 'enseignant', 'jeddiadil0@gmail.com'),
(29, 'ahmed', '$2y$10$eXiJcEDMCej/RMCce4px3.MIx11Z9NI39XAlPQYHhq0VFwsfelQv2', 'etudiant', 'ahmedbougrin@gmail.com'),
(30, 'karim', '$2y$10$1E60VJcp4aNbLSz3APFXJeV/COoV8oxwYV/t4dk08YDbtwJ6Llo7G', 'etudiant', 'karimtalal@gmail.com'),
(32, 'akram hamidi', '$2y$10$84e9Zp5nwliEP98j.fUeo.DAJF5WhnE3WfXvrEAw4uPj1042c/GKq', 'enseignant', 'akramhamidi@gmail.com'),
(33, 'mohammed', '$2y$10$Tf5ibtj8F3TgBVlj295pnOIUyi4JCXd0RZd..KVG.ro0BRGM4bR4C', 'enseignant', 'mohammedrami@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id_enseignant`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `id_filiere` (`id_filiere`);

--
-- Index pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id_evaluation`),
  ADD KEY `id_etudiant` (`id_etudiant`),
  ADD KEY `id_matiere` (`id_matiere`);

--
-- Index pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD PRIMARY KEY (`id_filiere`);

--
-- Index pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`id_matiere`),
  ADD KEY `id_filiere` (`id_filiere`),
  ADD KEY `id_enseignant` (`id_enseignant`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id_enseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id_evaluation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `filieres`
--
ALTER TABLE `filieres`
  MODIFY `id_filiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_ibfk_1` FOREIGN KEY (`id_filiere`) REFERENCES `filieres` (`id_filiere`);

--
-- Contraintes pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiants` (`id_etudiant`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matieres` (`id_matiere`);

--
-- Contraintes pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD CONSTRAINT `matieres_ibfk_1` FOREIGN KEY (`id_filiere`) REFERENCES `filieres` (`id_filiere`),
  ADD CONSTRAINT `matieres_ibfk_2` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignants` (`id_enseignant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
