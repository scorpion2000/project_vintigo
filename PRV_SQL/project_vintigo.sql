-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Feb 22. 09:47
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

--
-- A tábla adatainak kiíratása `hg_players`
--

INSERT INTO `hg_players` (`ID`, `PID`, `Money`, `Bank`, `XP`, `Kills`, `Gear`) VALUES
(1, '\"76561198057067491\"', 4900, 50000, '[\"PRIVATE\",0]', 0, '[[],[],[\"hgun_Rook40_F\",\"\",\"\",\"\",[\"16Rnd_9x21_red_Mag\",17],[],\"\"],[\"rvg_independant\",[[\"kss_tushenka_pork\",1],[\"kss_sausage\",1],[\"5Rnd_127x108_APDS_Mag\",1,5],[\"rhs_10Rnd_762x54mmR_7N14\",1,10]]],[\"rhs_vest_commander\",[[\"16Rnd_9x21_red_Mag\",1,17],[\"5Rnd_127x108_APDS_Mag\",1,5],[\"UK3CB_BAF_556_30Rnd_Blank\",1,30]]],[\"ace_gunbag\",[]],\"rhs_fieldcap_ml\",\"\",[\"Rangefinder\",\"\",\"\",\"\",[],[],\"\"],[\"\",\"ItemGPS\",\"ItemRadio\",\"ItemCompass\",\"ItemWatch\",\"\"]]'),
(2, '_SP_PLAYER_', 5000, 50000, '[\"PRIVATE\",0]', 0, '[[],[],[\"rhs_weap_makarov_pm\",\"\",\"\",\"\",[\"rhs_mag_9x18_8_57N181S\",8],[],\"\"],[\"rvg_independant\",[]],[\"rhs_vest_commander\",[[\"rhs_mag_9x18_8_57N181S\",4,8]]],[],\"rhs_fieldcap_ml\",\"\",[\"Rangefinder\",\"\",\"\",\"\",[],[],\"\"],[\"\",\"ItemGPS\",\"ItemRadio\",\"\",\"\",\"\"]]'),
(3, '76561198057067491', 0, 775800, '[\"PRIVATE\",0]', 0, '[[\"SMG_01_F\",\"\",\"\",\"rhsusf_acc_RX01\",[\"30Rnd_45ACP_Mag_SMG_01_Tracer_Red\",25],[],\"\"],[],[\"hgun_Pistol_heavy_01_F\",\"\",\"\",\"\",[\"11Rnd_45ACP_Mag\",11],[],\"\"],[\"rvg_independant\",[[\"kss_chips\",1],[\"kss_bottle_small\",1],[\"kss_sausage\",1],[\"ACE_fieldDressing\",1],[\"ACE_adenosine\",1],[\"ACE_plasmaIV_250\",1],[\"11Rnd_45ACP_Mag\",1,11]]],[\"rhsusf_spc\",[[\"ACE_salineIV_250\",1],[\"ACE_fieldDressing\",4],[\"ACE_morphine\",1],[\"ACE_epinephrine\",1],[\"ACE_splint\",2],[\"11Rnd_45ACP_Mag\",1,11]]],[\"B_Carryall_cbr\",[[\"ACE_surgicalKit\",1],[\"kss_caviar\",1],[\"kss_bottle_small\",1],[\"kss_shproti\",1],[\"ACE_adenosine\",2],[\"ACE_elasticBandage\",1],[\"ACE_fieldDressing\",1],[\"ACE_plasmaIV_250\",1],[\"ACE_epinephrine\",1],[\"kss_bottle_big\",1],[\"rhs_mag_m67\",1,1],[\"ACE_FlareTripMine_Mag\",1,1],[\"11Rnd_45ACP_Mag\",1,11],[\"ACE_M84\",1,1],[\"30Rnd_45ACP_Mag_SMG_01_Tracer_Red\",1,25],[\"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow\",2,25],[\"UK3CB_BAF_338_5Rnd_Blank\",3,5],[[\"UK3CB_BAF_L115A3\",\"\",\"\",\"rhsusf_acc_ACOG_3d\",[\"UK3CB_BAF_338_5Rnd\",5],[],\"\"],1]]],\"rhs_fieldcap_ml\",\"rhsusf_shemagh_gogg_od\",[\"Binocular\",\"\",\"\",\"\",[],[],\"\"],[\"\",\"ItemGPS\",\"\",\"\",\"\",\"\"]]');

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

--
-- A tábla adatainak kiíratása `hg_vehicles`
--

INSERT INTO `hg_vehicles` (`ID`, `PID`, `Classname`, `Plate`, `Alive`, `Active`, `Color`, `Inventory`) VALUES
(16, '76561198057067491', '\"C_Offroad_01_F\"', 9748, 1, 0, '\"Default\"', '[[[],[]],[[],[]],[[],[]],[[],[]]]'),
(18, '76561198057067491', '\"C_SUV_01_F\"', 2008, 1, 0, '\"Black\"', '[]');

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

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`u_id`, `u_UID`, `u_name`) VALUES
(9, '76561198057067491', 'Hullahopp');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_equipment`
--

CREATE TABLE `user_equipment` (
  `equip_id` int(11) NOT NULL,
  `equip_u_id` int(11) NOT NULL,
  `equip_primary` varchar(64) NOT NULL,
  `equip_secondary` varchar(64) NOT NULL,
  `equip_handgun` varchar(64) NOT NULL,
  `equip_uniform` varchar(64) NOT NULL,
  `equip_headgear` varchar(64) NOT NULL,
  `equip_vest` varchar(64) NOT NULL,
  `equip_backpack` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `user_equipment`
--

INSERT INTO `user_equipment` (`equip_id`, `equip_u_id`, `equip_primary`, `equip_secondary`, `equip_handgun`, `equip_uniform`, `equip_headgear`, `equip_vest`, `equip_backpack`) VALUES
(5, 1, 'L115A3', '', 'FNX-45 Tactical', 'RVG Independant Fatigues', 'Field Cap Mountain Les', 'SPC', 'Field Pack (Khaki)');

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
  `pers_thirst` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `user_persistance`
--

INSERT INTO `user_persistance` (`pers_id`, `pers_u_id`, `pers_location`, `pers_isAlive`, `pers_hunger`, `pers_thirst`) VALUES
(1, 9, '[1582.33,1426.44,69.3059]', 1, 90, 89);

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
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `hg_vehicles`
--
ALTER TABLE `hg_vehicles`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `user_equipment`
--
ALTER TABLE `user_equipment`
  MODIFY `equip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `user_persistance`
--
ALTER TABLE `user_persistance`
  MODIFY `pers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
