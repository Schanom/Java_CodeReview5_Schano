-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Dez 2020 um 13:32
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr5_famazon_schano`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(13) NOT NULL,
  `total_price` float NOT NULL,
  `date` datetime NOT NULL,
  `fk_shopping_cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `total_price`, `date`, `fk_shopping_cart_id`) VALUES
(2, 649.99, '2020-12-16 12:28:48', 1),
(3, 488.99, '2020-12-11 12:28:48', 3),
(4, 699.99, '2020-12-16 12:28:48', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `product_id` int(13) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` float NOT NULL,
  `amount` int(6) NOT NULL,
  `fk_shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`product_id`, `name`, `price`, `amount`, `fk_shop_id`) VALUES
(1, 'RTX 3080', 699.99, 7, 1),
(2, 'RX 6800 XT', 649.99, 4, 2),
(3, 'i9-10900k', 488.99, 27, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop`
--

CREATE TABLE `shop` (
  `shop_id` int(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `address` varchar(80) NOT NULL,
  `zip` varchar(12) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shop`
--

INSERT INTO `shop` (`shop_id`, `name`, `address`, `zip`, `city`, `country`) VALUES
(1, 'Nvidia', 'Einsteinstraße 172/5th floor', '81677', 'München', 'Deutschland'),
(2, 'AMD', '1 Commerce Valley Dr E', 'ON L3T 7X6', 'Thornhill', 'Kanada'),
(3, 'Intel', '2200 Mission College Blvd.', 'CA  95052', 'Santa Clara', 'USA'),
(4, 'Kingston', 'asdfstreet 5', '1160', 'Vienna', 'Österreich');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `shopping_cart_id` int(13) NOT NULL,
  `payment_method` enum('PayPal','Creditcard','Banktransaction','') NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shoppingcart`
--

INSERT INTO `shoppingcart` (`shopping_cart_id`, `payment_method`, `fk_user_id`, `fk_product_id`, `fk_shop_id`) VALUES
(1, 'Banktransaction', 1, 2, 2),
(2, 'Creditcard', 2, 3, 3),
(3, 'Banktransaction', 1, 3, 3),
(4, 'Creditcard', 2, 2, 2),
(5, 'PayPal', 3, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `zip` varchar(12) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `zip`, `city`, `country`, `address`, `email`) VALUES
(1, 'Peter', 'Parker', '1070', 'Vienna', 'Österreich', 'Kaiserstraße 2-4', 'notspiderman@gmail.com'),
(2, 'Tony', 'Stark', '1190', 'Vienna', 'Österreich', 'Grinzingerstrasse 133', 'iamironman@gmail.com'),
(3, 'Clint', 'Barton', '3400', 'Klosterneuburg', 'Österreich', 'Mühlengasse 2-4', 'uselessavengernumber2@gmail.com');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_shopping_cart_id` (`fk_shopping_cart_id`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_shop_id` (`fk_shop_id`);

--
-- Indizes für die Tabelle `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indizes für die Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`shopping_cart_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_shop_id` (`fk_shop_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `shop`
--
ALTER TABLE `shop`
  MODIFY `shop_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `shopping_cart_id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_shopping_cart_id`) REFERENCES `shoppingcart` (`shopping_cart_id`);

--
-- Constraints der Tabelle `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`);

--
-- Constraints der Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `shoppingcart_ibfk_3` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
