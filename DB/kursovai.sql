-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2021 at 01:48 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kursovai`
--

-- --------------------------------------------------------

--
-- Table structure for table `contracts_gamers`
--

CREATE TABLE `contracts_gamers` (
  `id` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  `id_organization` int(11) NOT NULL,
  `date_of_contract` date NOT NULL,
  `date_of_end` date NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contracts_gamers`
--

INSERT INTO `contracts_gamers` (`id`, `id_player`, `id_game`, `id_organization`, `date_of_contract`, `date_of_end`, `position`) VALUES
(1, 1, 1, 1, '2016-03-12', '2021-04-20', 'Sniper'),
(2, 4, 1, 1, '2018-03-11', '2021-06-12', 'Capitan'),
(3, 6, 1, 13, '2016-03-12', '2021-05-20', 'Rifler'),
(4, 9, 2, 12, '2020-03-11', '2024-06-12', 'Sniper'),
(5, 5, 3, 6, '2021-04-12', '2021-07-18', 'Kerri'),
(6, 8, 2, 13, '2021-07-07', '2027-08-01', 'Capitan'),
(7, 11, 4, 9, '2018-07-15', '2023-05-16', 'Midder');

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL,
  `Name_Discipline` varchar(40) NOT NULL,
  `Genre` varchar(20) NOT NULL,
  `Age_limit` int(10) NOT NULL,
  `Developer` varchar(20) NOT NULL,
  `Data_of_issue` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disciplines`
--

INSERT INTO `disciplines` (`id`, `Name_Discipline`, `Genre`, `Age_limit`, `Developer`, `Data_of_issue`) VALUES
(1, 'Counter-strike', 'shuter', 16, 'Valve', '2012-07-09'),
(2, 'Valorant', 'shuter', 16, 'Riot games', '2020-06-05'),
(3, 'Dota 2', 'MMORPG', 18, 'Riot games', '2010-05-22'),
(4, 'League of Legends', 'MMORPG', 18, 'Riot games', '2010-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Year` date NOT NULL,
  `Country` varchar(15) NOT NULL,
  `Meneger` varchar(30) NOT NULL,
  `Web_sait` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `Name`, `Year`, `Country`, `Meneger`, `Web_sait`) VALUES
(1, 'Navi', '2009-03-17', 'Ukrain', 'Zolotarev Evgeni', 'https//:www.navi.gg'),
(2, 'Astralis', '2016-05-17', 'Dinmark', 'Frederik Baskov', 'https//:www.astralis.gg'),
(3, 'Virtus.pro', '2003-07-14', 'Russian', 'Sergei Glamazda', 'https//:www.vp.gg'),
(4, 'Team Liquid', '2000-07-09', 'Nederland', 'Victor Gussen', 'https//:www.liquid.gg'),
(5, 'Evil Geniuses', '1999-01-18', 'USA', 'Nicole Jameson', 'https//:www.eg.gg'),
(6, 'Heroic', '2013-06-27', 'Dinmark', 'Erik Askered', 'https//:www.heroic.gg'),
(7, 'G2', '2013-03-20', 'France', 'Danny Engels', 'https//:www.g2.gg'),
(8, 'Fnatic', '2004-02-13', 'England', 'Semuel Metus', 'https//:www.fnatic.gg'),
(9, 'Ninga in Pyjamas', '2007-08-24', 'Sweden', 'Emil Crectensen', 'https//:www.nip.gg'),
(10, 'Nemiga', '2017-07-20', 'Belarus', 'Sergey Voronovich', 'https//:www.namiga.gg'),
(11, 'Nordavind', '2011-06-12', 'Norway', 'Stein Wilmann', 'https//:www.nordavind.gg'),
(12, '4kings', '1997-06-03', 'United Kingdom', 'Preben Gammelsæter', 'https//:www.4kings.gg'),
(13, 'OG', '2015-04-12', 'Dinmark', 'Mourtada Al-karbalaie', 'https//:www.og.gg'),
(14, 'Faze clan', '2010-03-10', 'USA', 'Lee Trink', 'https//:www.faze.gg'),
(15, '100 thieves', '2017-11-20', 'USA', 'Matthew Haag', 'https//:www.100thieves.gg');

-- --------------------------------------------------------

--
-- Table structure for table `participating_teams`
--

CREATE TABLE `participating_teams` (
  `id` int(11) NOT NULL,
  `id_tournament` int(11) NOT NULL,
  `id_organization` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participating_teams`
--

INSERT INTO `participating_teams` (`id`, `id_tournament`, `id_organization`) VALUES
(1, 3, 15),
(2, 3, 2),
(3, 3, 1),
(4, 3, 3),
(5, 3, 7),
(6, 3, 8),
(7, 3, 14),
(8, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `NickName` varchar(30) NOT NULL,
  `FIO` varchar(40) NOT NULL,
  `Date_of_birthday` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `NickName`, `FIO`, `Date_of_birthday`) VALUES
(1, 's1mple', 'Aleksandr Kostilev', '1998-10-12'),
(2, 'Perfecto', 'Ilya Zalytski', '1998-07-20'),
(3, 'Electronick', 'Denis sharipov', '1998-08-10'),
(4, 'Boombl4', 'Kirill Mihailov', '1999-05-12'),
(5, 'flamie', 'Egor Vasiliev', '1998-03-01'),
(6, 'Ropz', 'Roobin Kool', '2000-08-08'),
(7, 'Karrigan', 'Fin Anderson', '1991-09-22'),
(8, 'NBK', 'Natan Shmit', '1995-02-15'),
(9, 'ZywOo', 'Matheu Herbet', '2002-06-30'),
(10, 'Brollan', 'Ludvig Brulan', '2002-06-21'),
(11, 'Faker', 'Chimi Nigim', '2000-04-19');

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE `tournament` (
  `id` int(11) NOT NULL,
  `Tournament_Name` varchar(20) NOT NULL,
  `Prize` int(15) NOT NULL,
  `Date_start` date NOT NULL,
  `Date_end` date NOT NULL,
  `Organizer` varchar(20) NOT NULL,
  `id_game` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`id`, `Tournament_Name`, `Prize`, `Date_start`, `Date_end`, `Organizer`, `id_game`) VALUES
(1, 'ESL pro league 13', 1000000, '2021-03-15', '2021-04-04', 'ESL', 1),
(2, 'IEM Katowice 2021', 1000000, '2021-02-04', '2021-02-10', 'ESL', 1),
(3, 'Blast Premier', 2000000, '2021-01-12', '2021-01-18', 'Blast', 1),
(4, 'The International', 30000000, '2020-11-03', '2020-11-23', 'Valve', 3),
(5, 'Master championship', 2000000, '2020-08-12', '2020-08-22', 'Lolesports', 4),
(6, 'Rio 2021', 1000000, '2021-05-04', '2021-05-20', 'lolesports', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contracts_gamers`
--
ALTER TABLE `contracts_gamers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_player` (`id_player`),
  ADD KEY `id_organization` (`id_organization`);

--
-- Indexes for table `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participating_teams`
--
ALTER TABLE `participating_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_organization` (`id_organization`),
  ADD KEY `id_tournament` (`id_tournament`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_game` (`id_game`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contracts_gamers`
--
ALTER TABLE `contracts_gamers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `participating_teams`
--
ALTER TABLE `participating_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tournament`
--
ALTER TABLE `tournament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contracts_gamers`
--
ALTER TABLE `contracts_gamers`
  ADD CONSTRAINT `contracts_gamers_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `disciplines` (`id`),
  ADD CONSTRAINT `contracts_gamers_ibfk_2` FOREIGN KEY (`id_player`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `contracts_gamers_ibfk_3` FOREIGN KEY (`id_organization`) REFERENCES `organization` (`id`);

--
-- Constraints for table `participating_teams`
--
ALTER TABLE `participating_teams`
  ADD CONSTRAINT `participating_teams_ibfk_1` FOREIGN KEY (`id_organization`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `participating_teams_ibfk_2` FOREIGN KEY (`id_tournament`) REFERENCES `tournament` (`id`);

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `disciplines` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
