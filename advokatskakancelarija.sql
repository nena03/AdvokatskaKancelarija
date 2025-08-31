-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 30, 2025 at 09:14 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advokatskakancelarija`
--

-- --------------------------------------------------------

--
-- Table structure for table `advokat`
--

DROP TABLE IF EXISTS `advokat`;
CREATE TABLE IF NOT EXISTS `advokat` (
  `korisnikID` char(10) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `srednjeIme` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `pobedjeniSlucajevi` int NOT NULL,
  `izgubljeniSlucajevi` int NOT NULL,
  `reseniNagodbom` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` char(10) NOT NULL,
  `ulica` varchar(50) NOT NULL,
  `grad` varchar(50) NOT NULL,
  `specijalizacija` varchar(50) NOT NULL,
  PRIMARY KEY (`korisnikID`,`specijalizacija`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `advokat`
--

INSERT INTO `advokat` (`korisnikID`, `ime`, `srednjeIme`, `prezime`, `pobedjeniSlucajevi`, `izgubljeniSlucajevi`, `reseniNagodbom`, `email`, `telefon`, `ulica`, `grad`, `specijalizacija`) VALUES
('KOR001', 'Milos', 'Petar', 'Mitrovic', 20, 5, 3, 'milos@example.com', '060111222', 'Ulica advokata 1', 'Beograd', 'Krivicno pravo'),
('KOR002', 'Marija', 'Ana', 'Lazic', 15, 2, 5, 'marija@example.com', '060333444', 'Ulica advokata 2', 'Novi Sad', 'Porodicno pravo'),
('KOR003', 'Stefan', 'Nikola', 'Kovacevic', 10, 8, 7, 'stefan@example.com', '060555666', 'Ulica advokata 3', 'Nis', 'Privredno pravo');

-- --------------------------------------------------------

--
-- Table structure for table `kalendar`
--

DROP TABLE IF EXISTS `kalendar`;
CREATE TABLE IF NOT EXISTS `kalendar` (
  `korisnikID` char(10) NOT NULL,
  `vreme` datetime NOT NULL,
  `opis` varchar(50) NOT NULL,
  PRIMARY KEY (`korisnikID`,`vreme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kalendar`
--

INSERT INTO `kalendar` (`korisnikID`, `vreme`, `opis`) VALUES
('KOR001', '2025-08-05 10:00:00', 'Sastanak sa klijentom'),
('KOR002', '2025-08-06 12:00:00', 'Priprema dokumentacije'),
('KOR003', '2025-08-07 09:00:00', 'Sudjenje u Beogradu');

-- --------------------------------------------------------

--
-- Table structure for table `klijent`
--

DROP TABLE IF EXISTS `klijent`;
CREATE TABLE IF NOT EXISTS `klijent` (
  `korisnikID` varchar(10) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `adresa` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`korisnikID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `klijent`
--

INSERT INTO `klijent` (`korisnikID`, `ime`, `prezime`, `adresa`, `telefon`) VALUES
('KOR001', 'Marko', 'Markovic', 'Kralja Petra 12', '064123456'),
('KOR002', 'Jelena', 'Jovanovic', 'Nemanjina 45', '065987654'),
('KOR003', 'Petar', 'Petrovic', 'Bulevar 23', '063111222');

-- --------------------------------------------------------

--
-- Table structure for table `klijentracun`
--

DROP TABLE IF EXISTS `klijentracun`;
CREATE TABLE IF NOT EXISTS `klijentracun` (
  `korisnikID` char(10) NOT NULL,
  `racunID` char(10) NOT NULL,
  PRIMARY KEY (`korisnikID`,`racunID`),
  KEY `racunID` (`racunID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `klijentracun`
--

INSERT INTO `klijentracun` (`korisnikID`, `racunID`) VALUES
('KOR001', 'RAC001'),
('KOR002', 'RAC002'),
('KOR003', 'RAC003');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `korisnikID` char(10) NOT NULL,
  `lozinka` char(8) DEFAULT NULL,
  PRIMARY KEY (`korisnikID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`korisnikID`, `lozinka`) VALUES
('KOR001', 'lozinka1'),
('KOR002', 'lozinka2'),
('KOR003', 'lozinka3');

-- --------------------------------------------------------

--
-- Table structure for table `pravnidokumenti`
--

DROP TABLE IF EXISTS `pravnidokumenti`;
CREATE TABLE IF NOT EXISTS `pravnidokumenti` (
  `dokumentID` char(10) NOT NULL,
  `slucajID` char(15) NOT NULL,
  `datumKreiranja` date NOT NULL,
  `datumPoslednjeIzmene` date NOT NULL,
  `tip` varchar(50) NOT NULL,
  PRIMARY KEY (`dokumentID`,`slucajID`),
  KEY `slucajID` (`slucajID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pravnidokumenti`
--

INSERT INTO `pravnidokumenti` (`dokumentID`, `slucajID`, `datumKreiranja`, `datumPoslednjeIzmene`, `tip`) VALUES
('DOC001', 'SLC001', '2025-07-01', '2025-07-15', 'Tuzba'),
('DOC002', 'SLC002', '2025-06-20', '2025-07-05', 'Sporazum'),
('DOC003', 'SLC003', '2025-07-12', '2025-07-30', 'Dokazni materijal');

-- --------------------------------------------------------

--
-- Table structure for table `pravnislucaj`
--

DROP TABLE IF EXISTS `pravnislucaj`;
CREATE TABLE IF NOT EXISTS `pravnislucaj` (
  `slucajID` char(15) NOT NULL,
  `tuzilac` varchar(50) NOT NULL,
  `poslednjaAktivnost` date NOT NULL,
  `opis` varchar(50) NOT NULL,
  `datumPodnosenja` date NOT NULL,
  `trajanje` mediumint NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`slucajID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pravnislucaj`
--

INSERT INTO `pravnislucaj` (`slucajID`, `tuzilac`, `poslednjaAktivnost`, `opis`, `datumPodnosenja`, `trajanje`, `status`) VALUES
('SLC001', 'Marko Markovic', '2025-08-01', 'Parnica za imovinu', '2025-07-01', 90, 'U toku'),
('SLC002', 'Jelena Jovanovic', '2025-07-20', 'Razvod braka', '2025-06-15', 120, 'Zavrsen'),
('SLC003', 'Petar Petrovic', '2025-08-10', 'Naplata duga', '2025-07-10', 60, 'U toku');

-- --------------------------------------------------------

--
-- Table structure for table `prikazanou`
--

DROP TABLE IF EXISTS `prikazanou`;
CREATE TABLE IF NOT EXISTS `prikazanou` (
  `slucajID` char(15) NOT NULL,
  `vreme` datetime NOT NULL,
  `korisnikID` char(10) NOT NULL,
  PRIMARY KEY (`slucajID`,`vreme`,`korisnikID`),
  KEY `korisnikID` (`korisnikID`,`vreme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prikazanou`
--

INSERT INTO `prikazanou` (`slucajID`, `vreme`, `korisnikID`) VALUES
('SLC001', '2025-08-05 10:00:00', 'KOR001'),
('SLC002', '2025-08-06 12:00:00', 'KOR002'),
('SLC003', '2025-08-07 09:00:00', 'KOR003');

-- --------------------------------------------------------

--
-- Table structure for table `protiv`
--

DROP TABLE IF EXISTS `protiv`;
CREATE TABLE IF NOT EXISTS `protiv` (
  `protivnikID` char(10) NOT NULL,
  `slucajID` char(15) NOT NULL,
  PRIMARY KEY (`protivnikID`,`slucajID`),
  KEY `slucajID` (`slucajID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `protiv`
--

INSERT INTO `protiv` (`protivnikID`, `slucajID`) VALUES
('PRT001', 'SLC001'),
('PRT002', 'SLC002'),
('PRT003', 'SLC003');

-- --------------------------------------------------------

--
-- Table structure for table `protivnik`
--

DROP TABLE IF EXISTS `protivnik`;
CREATE TABLE IF NOT EXISTS `protivnik` (
  `protivnikID` char(10) NOT NULL,
  `ime` varchar(30) NOT NULL,
  `srednjeIme` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` char(10) NOT NULL,
  `ulica` varchar(50) NOT NULL,
  `grad` varchar(50) NOT NULL,
  `postanskiBroj` varchar(10) NOT NULL,
  `drzava` varchar(50) NOT NULL,
  PRIMARY KEY (`protivnikID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `protivnik`
--

INSERT INTO `protivnik` (`protivnikID`, `ime`, `srednjeIme`, `prezime`, `email`, `telefon`, `ulica`, `grad`, `postanskiBroj`, `drzava`) VALUES
('PRT001', 'Nikola', 'Milan', 'Nikolic', 'nikola@example.com', '061222333', 'Ulica 1', 'Beograd', '11000', 'Srbija'),
('PRT002', 'Ana', 'Jovana', 'Ilic', 'ana@example.com', '062333444', 'Ulica 2', 'Novi Sad', '21000', 'Srbija'),
('PRT003', 'Ivan', 'Stefan', 'Stankovic', 'ivan@example.com', '063444555', 'Ulica 3', 'Nis', '18000', 'Srbija');

-- --------------------------------------------------------

--
-- Table structure for table `racun`
--

DROP TABLE IF EXISTS `racun`;
CREATE TABLE IF NOT EXISTS `racun` (
  `racunID` char(10) NOT NULL,
  `datumPlacanja` date DEFAULT NULL,
  `iznos` int DEFAULT NULL,
  PRIMARY KEY (`racunID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `racun`
--

INSERT INTO `racun` (`racunID`, `datumPlacanja`, `iznos`) VALUES
('RAC001', '2025-07-20', 50000),
('RAC002', '2025-07-25', 75000),
('RAC003', '2025-07-30', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `sudskorociste`
--

DROP TABLE IF EXISTS `sudskorociste`;
CREATE TABLE IF NOT EXISTS `sudskorociste` (
  `slucajID` char(15) NOT NULL,
  `datumSledecegRocista` date NOT NULL,
  `sudnica` varchar(50) NOT NULL,
  `vreme` time NOT NULL,
  PRIMARY KEY (`slucajID`,`vreme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sudskorociste`
--

INSERT INTO `sudskorociste` (`slucajID`, `datumSledecegRocista`, `sudnica`, `vreme`) VALUES
('SLC001', '2025-08-15', 'Sudnica 1', '10:30:00'),
('SLC002', '2025-09-01', 'Sudnica 2', '11:00:00'),
('SLC003', '2025-09-10', 'Sudnica 3', '09:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
