-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Máj 31. 12:41
-- Kiszolgáló verziója: 10.1.36-MariaDB
-- PHP verzió: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `project_vintigo`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hg_players`
--

CREATE TABLE `hg_players` (
  `ID` mediumint(9) NOT NULL,
  `PID` varchar(32) NOT NULL,
  `Money` int(100) NOT NULL DEFAULT '0',
  `Bank` int(100) NOT NULL DEFAULT '0',
  `XP` text NOT NULL,
  `Kills` int(100) NOT NULL DEFAULT '0',
  `Gear` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hg_vehicles`
--

CREATE TABLE `hg_vehicles` (
  `ID` mediumint(9) NOT NULL,
  `PID` varchar(50) NOT NULL,
  `Classname` varchar(32) NOT NULL,
  `Plate` int(100) NOT NULL,
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Active` tinyint(4) NOT NULL,
  `Color` varchar(32) NOT NULL,
  `Inventory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hg_whitelist`
--

CREATE TABLE `hg_whitelist` (
  `Civilian` text NOT NULL,
  `West` text NOT NULL,
  `Resistance` text NOT NULL,
  `East` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `hg_whitelist`
--

INSERT INTO `hg_whitelist` (`Civilian`, `West`, `Resistance`, `East`) VALUES
('[]', '[]', '[]', '[]'),
('[]', '[]', '[]', '[]'),
('[]', '[]', '[]', '[]');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_UID` varchar(32) NOT NULL,
  `u_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_equipment`
--

CREATE TABLE `user_equipment` (
  `equip_id` int(11) NOT NULL,
  `equip_u_id` varchar(32) NOT NULL,
  `equip_primary` varchar(64) NOT NULL,
  `equip_secondary` varchar(64) NOT NULL,
  `equip_handgun` varchar(64) NOT NULL,
  `equip_uniform` varchar(64) NOT NULL,
  `equip_headgear` varchar(64) NOT NULL,
  `equip_vest` varchar(64) NOT NULL,
  `equip_backpack` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_persistance`
--

CREATE TABLE `user_persistance` (
  `pers_id` int(11) NOT NULL,
  `pers_u_id` int(11) NOT NULL,
  `pers_location` varchar(64) NOT NULL,
  `pers_isAlive` tinyint(1) NOT NULL,
  `pers_hunger` int(32) NOT NULL,
  `pers_thirst` int(32) NOT NULL,
  `pers_dir` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `hg_players`
--
ALTER TABLE `hg_players`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `PID` (`PID`);

--
-- A tábla indexei `hg_vehicles`
--
ALTER TABLE `hg_vehicles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `Classname` (`Classname`),
  ADD KEY `Plate` (`Plate`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- A tábla indexei `user_equipment`
--
ALTER TABLE `user_equipment`
  ADD PRIMARY KEY (`equip_id`);

--
-- A tábla indexei `user_persistance`
--
ALTER TABLE `user_persistance`
  ADD PRIMARY KEY (`pers_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `hg_players`
--
ALTER TABLE `hg_players`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `hg_vehicles`
--
ALTER TABLE `hg_vehicles`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT a táblához `user_equipment`
--
ALTER TABLE `user_equipment`
  MODIFY `equip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `user_persistance`
--
ALTER TABLE `user_persistance`
  MODIFY `pers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
