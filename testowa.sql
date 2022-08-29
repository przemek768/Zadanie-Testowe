-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Sie 2022, 14:53
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `testowa`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `materializez_workers`
--

CREATE TABLE `materializez_workers` (
  `workers_name` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `workers_lastname` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `workers_remuneration` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `materializez_workers`
--

INSERT INTO `materializez_workers` (`workers_name`, `workers_lastname`, `workers_remuneration`) VALUES
('Adam', 'Rak', 5000),
('Adam', 'Bąk', 5000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `workers`
--

CREATE TABLE `workers` (
  `workers_id` int(11) NOT NULL,
  `workers_name` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `workers_lastname` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `workers_date_of_birth` date NOT NULL,
  `workers_remuneration` float NOT NULL,
  `workers_beginning_of_employment` date NOT NULL,
  `workers_end_of_employment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `workers`
--

INSERT INTO `workers` (`workers_id`, `workers_name`, `workers_lastname`, `workers_date_of_birth`, `workers_remuneration`, `workers_beginning_of_employment`, `workers_end_of_employment`) VALUES
(1, 'Adam', 'Rak', '1982-08-18', 5000, '2017-08-11', '2021-08-20'),
(2, 'Adam', 'Bąk', '1984-08-18', 5000, '2015-08-11', '2020-08-20'),
(3, 'Adam', 'Szpak', '1984-08-18', 5000, '2017-08-11', '0000-00-00'),
(4, 'Bartek', 'Szpak', '1984-08-18', 5000, '2015-08-11', '0000-00-00');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zatrudnieni pracownicy w kolejnych latach`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zatrudnieni pracownicy w kolejnych latach` (
`Zatrudnieni pracownicy w kolejnych latach` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura widoku `zatrudnieni pracownicy w kolejnych latach`
--
DROP TABLE IF EXISTS `zatrudnieni pracownicy w kolejnych latach`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zatrudnieni pracownicy w kolejnych latach`  AS SELECT count(0) AS `Zatrudnieni pracownicy w kolejnych latach` FROM `workers` WHERE `workers`.`workers_end_of_employment` not like '0%' AND `workers`.`workers_beginning_of_employment` between '2015-01-01' and cast(current_timestamp() as date)  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`workers_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `workers`
--
ALTER TABLE `workers`
  MODIFY `workers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
