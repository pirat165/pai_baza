-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Czas generowania: 08 Sty 2022, 17:21
-- Wersja serwera: 5.7.26
-- Wersja PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Baza danych: `Books`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Books_opinions`
--

CREATE TABLE `Books_opinions` (
  `ID_bo_op` int(11) NOT NULL,
  `ID_os` int(11) NOT NULL,
  `ID_book_sel` int(11) NOT NULL,
  `Recenzja` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `Books_opinions`
--

INSERT INTO `Books_opinions` (`ID_bo_op`, `ID_os`, `ID_book_sel`, `Recenzja`) VALUES
(1, 1, 1, 'piękna książka '),
(2, 1, 2, 'Pięknie'),
(3, 1, 3, 'SUper'),
(11, 1, 1, 'Recenzja'),
(12, 1, 2, 'Podoba mi się');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Books_select`
--

CREATE TABLE `Books_select` (
  `ID_book_sel` int(11) NOT NULL,
  `Autor` text NOT NULL,
  `Tytul` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `Books_select`
--

INSERT INTO `Books_select` (`ID_book_sel`, `Autor`, `Tytul`) VALUES
(1, 'Taylor Richard', 'Jak człowiek staje się mordercą. Mroczne opowieści psychiatry sądowego'),
(2, 'Tomasz Strzelczyk', 'Oddasz fartucha, czyli facet w kuchni'),
(3, 'Harlan Coben', 'Mów mi Win');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Opinions`
--

CREATE TABLE `Opinions` (
  `ID_opini` int(11) NOT NULL,
  `ID_os` int(11) NOT NULL,
  `Tytul` text NOT NULL,
  `Autor` text NOT NULL,
  `Ocena` int(10) NOT NULL,
  `Opinia` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `Opinions`
--

INSERT INTO `Opinions` (`ID_opini`, `ID_os`, `Tytul`, `Autor`, `Ocena`, `Opinia`) VALUES
(1, 1, 'testowy', 'autor', 3, 'testowa recenzja'),
(2, 1, '', '', 4, 'Recenzja'),
(3, 1, 'test', 'testa', 3, 'Recenzja1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `ID_os` int(11) NOT NULL,
  `Nazwisko` text NOT NULL,
  `Imie` text NOT NULL,
  `Mail` varchar(25) NOT NULL,
  `Haslo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `Users`
--

INSERT INTO `Users` (`ID_os`, `Nazwisko`, `Imie`, `Mail`, `Haslo`) VALUES
(1, 'Testowy', 'Jan', 'test@wp.pl', 'testowy123'),
(6, '', '', 'tw@wp.pl', '$2y$10$/SgBPNRlcNxLtOctGpD6x.m/bwVd2JxA554jTfEZFIACGbdXPLJhe'),
(7, '', '', 'we@we.pl', '$2y$10$4RVY1bmvs5SVMHQSrnPLgOMv0PplQGqo8oS7VkrsNiFeLy50dIULm'),
(8, '', '', 'fran@wp.pl', '$2y$10$ZtnvyLR73UoijLAWT2tW8eSX2iV9URRl8eq.yHNITSZQGdRRpkqWy');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Books_opinions`
--
ALTER TABLE `Books_opinions`
  ADD PRIMARY KEY (`ID_bo_op`),
  ADD KEY `ID_os` (`ID_os`),
  ADD KEY `ID_book_sel` (`ID_book_sel`);

--
-- Indeksy dla tabeli `Books_select`
--
ALTER TABLE `Books_select`
  ADD PRIMARY KEY (`ID_book_sel`);

--
-- Indeksy dla tabeli `Opinions`
--
ALTER TABLE `Opinions`
  ADD PRIMARY KEY (`ID_opini`),
  ADD KEY `ID_os` (`ID_os`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID_os`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `Books_opinions`
--
ALTER TABLE `Books_opinions`
  MODIFY `ID_bo_op` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `Books_select`
--
ALTER TABLE `Books_select`
  MODIFY `ID_book_sel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `Opinions`
--
ALTER TABLE `Opinions`
  MODIFY `ID_opini` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `ID_os` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Books_opinions`
--
ALTER TABLE `Books_opinions`
  ADD CONSTRAINT `books_opinions_ibfk_1` FOREIGN KEY (`ID_os`) REFERENCES `Users` (`ID_os`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `books_opinions_ibfk_2` FOREIGN KEY (`ID_book_sel`) REFERENCES `Books_select` (`ID_book_sel`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `Opinions`
--
ALTER TABLE `Opinions`
  ADD CONSTRAINT `opinions_ibfk_1` FOREIGN KEY (`ID_os`) REFERENCES `Users` (`ID_os`) ON DELETE NO ACTION ON UPDATE CASCADE;
