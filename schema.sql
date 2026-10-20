-- schema.sql: exported from phpMyAdmin. Creates the cookbook database (categories, recipes, ingredients) with seed data.
-- AI use: schema and seed rows drafted with Claude (Anthropic) from my recipe workbook, then loaded and exported by me.

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2026 at 11:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cookbook`
--
CREATE DATABASE IF NOT EXISTS `cookbook` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `cookbook`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Beef'),
(2, 'Chicken'),
(3, 'Fish & Seafood'),
(4, 'Pork'),
(5, 'Turkey'),
(6, 'Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `quantity` varchar(10) NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `recipe_id`, `sort_order`, `quantity`, `unit`, `name`) VALUES
(1, 1, 1, '¾', 'cup', 'Jasmine Rice'),
(2, 1, 2, '¾', 'lb', 'Carrots'),
(3, 1, 3, '2', 'cloves', 'Garlic'),
(4, 1, 4, '1', 'bunch', 'Kale'),
(5, 1, 5, '1', NULL, 'Lime'),
(6, 1, 6, '1', NULL, 'Orange'),
(7, 1, 7, '2', 'Tbsps', 'Butter'),
(8, 1, 8, '4', NULL, 'Boneless, Skinless Chicken Breasts'),
(9, 1, 9, '1', 'Tbsp', 'Ancho Chile Paste'),
(10, 1, 10, '2', 'Tbsps', 'Crème Fraîche'),
(11, 1, 11, '3', 'Tbsps', 'Golden Raisins'),
(12, 2, 1, '2', NULL, 'Beef Medallions'),
(13, 2, 2, '2', 'cloves', 'Garlic'),
(14, 2, 3, '1', NULL, 'Shallot'),
(15, 2, 4, '1', 'bunch', 'Kale'),
(16, 2, 5, '2', 'Tbsps', 'Butter'),
(17, 2, 6, '1', 'Tbsp', 'Dijon Mustard'),
(18, 2, 7, '2', 'Tbsps', 'Verjus Blanc'),
(19, 2, 8, '4', 'oz', 'Cremini Mushrooms'),
(20, 2, 9, '¾', 'lb', 'Yukon Gold Potatoes'),
(21, 3, 1, '2', 'oz', 'Asiago Cheese'),
(22, 3, 2, '1', 'piece', 'Focaccia Bread'),
(23, 3, 3, '1', NULL, '8-Ounce Can Tomato Sauce'),
(24, 3, 4, '½', 'lb', 'Fresh Mozzarella Cheese'),
(25, 3, 5, '2', NULL, 'Clementines'),
(26, 3, 6, '2', 'cloves', 'Garlic'),
(27, 3, 7, '2', NULL, 'Romaine Lettuce Hearts'),
(28, 3, 8, '1', 'lb', 'Broccoli'),
(29, 3, 9, '1', 'oz', 'Golden Or Red Sweet Piquante Peppers'),
(30, 3, 10, '2', 'Tbsps', 'Crème Fraîche'),
(31, 3, 11, '1', 'Tbsp', 'Dijon Mustard'),
(32, 3, 12, '½', 'cup', 'Basil & Cashew Pesto (Contains Pine Nuts)'),
(33, 3, 13, '⅓', 'cup', 'Shaved Parmesan Cheese'),
(34, 3, 14, '1', 'Tbsp', 'Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)'),
(35, 4, 1, '2', 'Tbsps', 'Mayonnaise'),
(36, 4, 2, '1½', 'lbs', 'Pizza Dough'),
(37, 4, 3, '3', 'cloves', 'Garlic'),
(38, 4, 4, '1', NULL, 'Romaine Lettuce Heart'),
(39, 4, 5, '1', 'lb', 'Broccoli'),
(40, 4, 6, '1', 'cup', 'Part-Skim Ricotta Cheese'),
(41, 4, 7, '1', NULL, '8-Ounce Can Tomato Sauce'),
(42, 4, 8, '½', 'lb', 'Fresh Mozzarella Cheese'),
(43, 4, 9, '¼', 'cup', 'Grated Parmesan Cheese'),
(44, 4, 10, '2', 'oz', 'Black Cerignola Olives'),
(45, 4, 11, '1', 'Tbsp', 'Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)'),
(46, 4, 12, '1', NULL, 'Lemon'),
(47, 5, 1, '6', 'oz', 'Bucatini Pasta'),
(48, 5, 2, '½', 'lb', 'Broccoli'),
(49, 5, 3, '2', 'cloves', 'Garlic'),
(50, 5, 4, '¼', 'cup', 'Heavy Cream'),
(51, 5, 5, '2', 'Tbsps', 'Verjus Blanc'),
(52, 5, 6, '2', 'Tbsps', 'Crème Fraîche'),
(53, 5, 7, '¼', 'tsp', 'Crushed Red Pepper Flakes'),
(54, 5, 8, '3', 'Tbsps', 'All-Purpose Flour'),
(55, 5, 9, '¼', 'cup', 'Grated Pecorino Cheese'),
(56, 6, 1, '6', 'oz', 'Bucatini Pasta'),
(57, 6, 2, '1', NULL, '14-Ounce Can Datterini Tomatoes'),
(58, 6, 3, '2', 'cloves', 'Garlic'),
(59, 6, 4, '2', 'Tbsps', 'Butter'),
(60, 6, 5, '1', 'Tbsp', 'Capers'),
(61, 6, 6, '1', 'lb', 'Broccoli'),
(62, 6, 7, '¾', 'oz', 'Grana Padano Cheese'),
(63, 6, 8, '1', 'oz', 'Kalamata Olives'),
(64, 6, 9, '¼', 'tsp', 'Crushed Red Pepper Flakes'),
(65, 6, 10, '1', 'Tbsp', 'Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)'),
(66, 7, 1, '1', 'bunch', 'Kale'),
(67, 7, 2, '1', NULL, 'Lime'),
(68, 7, 3, '8', NULL, 'Flour Tortillas'),
(69, 7, 4, '¾', 'cup', 'Jasmine Rice'),
(70, 7, 5, '1', NULL, '28-Ounce Can Whole Peeled Tomatoes'),
(71, 7, 6, '4', 'oz', 'Cremini Mushrooms'),
(72, 7, 7, '3', 'cloves', 'Garlic'),
(73, 7, 8, '1', NULL, 'Yellow Onion'),
(74, 7, 9, '1', 'bunch', 'Chives'),
(75, 7, 10, '2', 'Tbsps', 'Ancho Chile Paste'),
(76, 7, 11, '1', 'Tbsp', 'Mexican Spice Blend (Ancho Chile Powder, Sweet Paprika, Garlic Powder, Ground Cumin, & Whole Mexican Oregano)'),
(77, 7, 12, '½', 'lb', 'White Cheddar Cheese'),
(78, 7, 13, '½', 'cup', 'Sour Cream'),
(79, 8, 1, '1½', 'lbs', 'Sweet Potatoes'),
(80, 8, 2, '4', NULL, 'Potato Rolls'),
(81, 8, 3, '¼', 'cup', 'Mayonnaise'),
(82, 8, 4, '21', 'oz', 'Wild Alaskan Pollock Fillets'),
(83, 8, 5, '2', NULL, 'Cage-Free Farm Eggs'),
(84, 8, 6, '2', 'Tbsps', 'Sweet Pickle Relish'),
(85, 8, 7, '1', NULL, 'Romaine Lettuce Heart'),
(86, 8, 8, '1', 'Tbsp', 'Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)'),
(87, 8, 9, '1¼', 'cups', 'Panko Breadcrumbs'),
(88, 8, 10, '¼', 'cup', 'Creamy Mustard Sauce'),
(89, 9, 1, '10', 'oz', 'Chopped Chicken Breast'),
(90, 9, 2, '1', 'head', 'Baby Bok Choy'),
(91, 9, 3, '¾', 'cup', 'Jasmine Rice'),
(92, 9, 4, '2', 'cloves', 'Garlic'),
(93, 9, 5, '1', 'Tbsp', 'Rice Vinegar'),
(94, 9, 6, '1', NULL, '1-Inch Piece Ginger'),
(95, 9, 7, '1', 'tsp', 'Sriracha'),
(96, 9, 8, '1', 'Tbsp', 'Honey'),
(97, 9, 9, '1', 'Tbsp', 'Sesame Oil'),
(98, 9, 10, '¼', 'cup', 'Cornstarch'),
(99, 9, 11, '2', 'Tbsps', 'Hoisin Sauce'),
(100, 10, 1, '½', 'lb', 'Green Cabbage'),
(101, 10, 2, '1', 'Tbsp', 'Rice Vinegar'),
(102, 10, 3, '4', NULL, 'Boneless, Center-Cut Pork Chops'),
(103, 10, 4, '2', NULL, 'Carrots'),
(104, 10, 5, '1', 'bunch', 'Chives'),
(105, 10, 6, '2', 'Tbsps', 'Tahini'),
(106, 10, 7, '2', 'Tbsps', 'Soy Sauce'),
(107, 10, 8, '¾', 'lb', 'Fresh Wonton Noodles'),
(108, 10, 9, '2', 'tsps', 'Sambal Oelek'),
(109, 10, 10, '1', NULL, '1-Inch Piece Ginger'),
(110, 10, 11, '¼', 'cup', 'Hoisin Sauce'),
(111, 11, 1, '4', NULL, 'Carrots'),
(112, 11, 2, '6', 'oz', 'Radishes'),
(113, 11, 3, '1', NULL, 'Lemon'),
(114, 11, 4, '2', 'cloves', 'Garlic'),
(115, 11, 5, '1', 'bunch', 'Parsley'),
(116, 11, 6, '2', 'Tbsps', 'Butter'),
(117, 11, 7, '2', 'Tbsps', 'Honey'),
(118, 11, 8, '4', NULL, 'Skin-On Barramundi Fillets'),
(119, 11, 9, '½', 'cup', 'Plain Greek Yogurt'),
(120, 11, 10, '1⅛', 'lbs', 'Yukon Gold Potatoes'),
(121, 11, 11, '1', 'Tbsp', 'Za\'atar Seasoning (Ground Sumac, Sesame Seeds, Salt, Ground Thyme, Whole Dried Oregano, & Crushed Aleppo Pepper)'),
(122, 12, 1, '1', NULL, 'Pie Crust (in Tin)'),
(123, 12, 2, '1', 'bunch', 'Kale'),
(124, 12, 3, '2', 'cloves', 'Garlic'),
(125, 12, 4, '1', NULL, 'Shallot'),
(126, 12, 5, '½', 'cup', 'Heavy Cream'),
(127, 12, 6, '1', NULL, 'Lemon'),
(128, 12, 7, '1', NULL, 'Apple'),
(129, 12, 8, '4', NULL, 'Cage-Free Farm Eggs'),
(130, 12, 9, '1', 'cup', 'Part-Skim Ricotta Cheese'),
(131, 12, 10, '1', NULL, 'Romaine Lettuce Heart'),
(132, 12, 11, '2', 'Tbsps', 'Sliced Roasted Almonds'),
(133, 12, 12, '1', 'Tbsp', 'Cajun Spice Blend (Smoked Paprika, Ground Yellow Mustard, Onion Powder, Garlic Powder, Whole Dried Oregano, Whole Dried Thyme, & Cayenne Pepper)'),
(134, 12, 13, '2', 'Tbsps', 'Crème Fraîche'),
(135, 13, 1, '2', NULL, 'Skin-On Barramundi Fillets'),
(136, 13, 2, '1', NULL, 'Sweet Potato'),
(137, 13, 3, '1', 'bunch', 'Kale'),
(138, 13, 4, '1', NULL, 'Avocado'),
(139, 13, 5, '1', NULL, 'Lime'),
(140, 13, 6, '1', NULL, 'Navel Orange'),
(141, 13, 7, '1', 'clove', 'Garlic'),
(142, 13, 8, '2', 'Tbsps', 'Roasted Pepitas'),
(143, 13, 9, '1', 'Tbsp', 'Mexican Spice Blend (Ancho Chile Powder, Smoked Paprika, Garlic Powder, Ground Cumin, & Dried Mexican Oregano)'),
(144, 14, 1, '4', NULL, 'Flour Tortillas'),
(145, 14, 2, '3', 'oz', 'Radishes'),
(146, 14, 3, '1', NULL, 'Orange'),
(147, 14, 4, '¾', 'lb', 'Yukon Gold Potatoes'),
(148, 14, 5, '6', 'oz', 'Cremini Mushrooms'),
(149, 14, 6, '1', NULL, 'Shallot'),
(150, 14, 7, '3', 'Tbsps', 'Roasted Peanuts'),
(151, 14, 8, '¼', 'cup', 'Sour Cream'),
(152, 14, 9, '1', 'oz', 'Sliced Pickled Jalapeño Pepper'),
(153, 14, 10, '1', 'oz', 'Golden Or Red Sweet Piquante Peppers'),
(154, 14, 11, '1', 'Tbsp', 'Spanish Spice Blend (Smoked Paprika, Ground Cumin, Ground Coriander, Dried Mexican Oregano, Cayenne Pepper, & Ground Cinnamon)'),
(155, 14, 12, '1', NULL, 'Romaine Lettuce Heart'),
(156, 14, 13, '2', 'Tbsps', 'Rice Vinegar'),
(157, 15, 1, '1½', 'lbs', 'Sweet Potatoes'),
(158, 15, 2, '1', 'lb', 'Broccoli'),
(159, 15, 3, '1', NULL, 'Lemon'),
(160, 15, 4, '2', 'Tbsps', 'Butter'),
(161, 15, 5, '¼', 'cup', 'Mayonnaise'),
(162, 15, 6, '4', NULL, 'Boneless, Skinless Chicken Breasts'),
(163, 15, 7, '¼', 'cup', 'All-Purpose Flour'),
(164, 15, 8, '½', 'cup', 'Grated Parmesan Cheese'),
(165, 15, 9, '1', 'Tbsp', 'Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)'),
(166, 16, 1, '10', 'oz', 'Ground Beef'),
(167, 16, 2, '2', NULL, 'Potato Buns'),
(168, 16, 3, '1', NULL, 'Sweet Potato'),
(169, 16, 4, '2', 'oz', 'Cheddar Cheese'),
(170, 16, 5, '1', 'oz', 'Sweet Piquante Peppers'),
(171, 16, 6, '2', 'Tbsps', 'Mayonnaise'),
(172, 16, 7, '1', 'tsp', 'Pimento Cheese Spice Blend (Garlic Powder, Ground Yellow Mustard, & Sugar)'),
(173, 17, 1, '6', NULL, 'Flour Tortillas'),
(174, 17, 2, '½', 'lb', 'Green Cabbage'),
(175, 17, 3, '1', NULL, 'Orange'),
(176, 17, 4, '1', NULL, 'Lime'),
(177, 17, 5, '3', 'oz', 'Radishes'),
(178, 17, 6, '1', 'clove', 'Garlic'),
(179, 17, 7, '¾', 'lb', 'Yukon Gold Potatoes'),
(180, 17, 8, '10', 'oz', 'Ground Pork Chorizo'),
(181, 17, 9, '2', 'Tbsps', 'Crème Fraîche'),
(182, 17, 10, '2', 'Tbsps', 'Grated Cotija Cheese'),
(183, 18, 1, '2', NULL, 'Cage-Free Farm Eggs'),
(184, 18, 2, '½', 'cup', 'Fregola Sarda Pasta'),
(185, 18, 3, '1', 'clove', 'Garlic'),
(186, 18, 4, '1', 'lb', 'Broccoli'),
(187, 18, 5, '1', NULL, 'Red Onion'),
(188, 18, 6, '1', 'bunch', 'Mint'),
(189, 18, 7, '2', 'Tbsps', 'Tahini'),
(190, 18, 8, '1', 'oz', 'Pecorino Romano Cheese'),
(191, 18, 9, '1', 'Tbsp', 'Za\'atar Seasoning (Ground Sumac, Sesame Seeds, Salt, Ground Thyme, Whole Dried Oregano, & Crushed Aleppo Pepper)'),
(192, 18, 10, '3', 'Tbsps', 'Roasted Almonds'),
(193, 18, 11, '1', NULL, 'Lemon'),
(194, 19, 1, '⅔', 'cup', 'Cracked Freekeh'),
(195, 19, 2, '½', 'cup', 'Sheep\'s Milk Yogurt'),
(196, 19, 3, '2', NULL, 'Carrots'),
(197, 19, 4, '2', 'cloves', 'Garlic'),
(198, 19, 5, '1', NULL, 'Lemon'),
(199, 19, 6, '1', 'bunch', 'Mint'),
(200, 19, 7, '2', NULL, 'Dried Medjool Dates'),
(201, 19, 8, '2', 'Tbsps', 'Pickled Peruvian Peppers'),
(202, 19, 9, '1¾', 'oz', 'Barrel-Aged Feta Cheese'),
(203, 19, 10, '2', 'Tbsps', 'Roasted Almonds'),
(204, 19, 11, '¼', 'tsp', 'Crushed Red Pepper Flakes'),
(205, 19, 12, '¾', 'lb', 'Brussels Sprouts'),
(206, 20, 1, '1', 'bunch', 'Kale'),
(207, 20, 2, '2', NULL, 'Cage-Free Farm Eggs'),
(208, 20, 3, '2', 'cloves', 'Garlic'),
(209, 20, 4, '1', 'head', 'Cauliflower'),
(210, 20, 5, '1', NULL, 'Lemon'),
(211, 20, 6, '2', 'Tbsps', 'Butter'),
(212, 20, 7, '1', NULL, 'Shallot'),
(213, 20, 8, '1', 'Tbsp', 'Capers'),
(214, 20, 9, '3', 'Tbsps', 'Panko Breadcrumbs'),
(215, 20, 10, '¼', 'cup', 'Grated Parmesan Cheese'),
(216, 21, 1, '2', NULL, 'Half Chickens'),
(217, 21, 2, '1', 'lb', 'Sweet Potatoes'),
(218, 21, 3, '4', 'oz', 'Cranberries'),
(219, 21, 4, '½', 'lb', 'Brussels Sprouts'),
(220, 21, 5, '2', 'Tbsps', 'Apple Cider Vinegar'),
(221, 21, 6, '2', 'Tbsps', 'Sugar'),
(222, 21, 7, '1', NULL, '1-Inch Piece Ginger'),
(223, 21, 8, '¼', 'cup', 'Roasted Walnuts'),
(224, 21, 9, '1', 'Tbsp', 'Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)'),
(225, 22, 1, '1', NULL, 'Pork Tenderloin'),
(226, 22, 2, '½', 'lb', 'Broccoli'),
(227, 22, 3, '2', 'cloves', 'Garlic'),
(228, 22, 4, '1', NULL, 'Apple'),
(229, 22, 5, '2', 'oz', 'Fontina Cheese'),
(230, 22, 6, '¼', 'cup', 'Milk'),
(231, 22, 7, '3', 'Tbsps', 'Panko Breadcrumbs'),
(232, 22, 8, '2', 'Tbsps', 'All-Purpose Flour'),
(233, 22, 9, '1', 'Tbsp', 'Apple Cider Vinegar'),
(234, 22, 10, '1', 'Tbsp', 'Southern Spice Blend (Onion Powder, Garlic Powder, Ground Yellow Mustard, Smoked Paprika, & Cayenne Pepper)'),
(235, 23, 1, '½', 'lb', 'Broccoli'),
(236, 23, 2, '1', NULL, 'Lemon'),
(237, 23, 3, '2', 'cloves', 'Garlic'),
(238, 23, 4, '1', 'Tbsp', 'Capers'),
(239, 23, 5, '1', 'Tbsp', 'Tomato Paste'),
(240, 23, 6, '¼', 'cup', 'Heavy Cream'),
(241, 23, 7, '1', 'Tbsp', 'Butter'),
(242, 23, 8, '6', 'oz', 'Whole Grain Pipe Rigate Pasta'),
(243, 23, 9, '2', 'oz', 'Roasted Piquillo Peppers'),
(244, 23, 10, '2', 'Tbsps', 'Grated Parmesan Cheese'),
(245, 23, 11, '2', 'Tbsps', 'Sliced Roasted Almonds'),
(246, 23, 12, '1½', 'tsps', 'Calabrian Chile Paste'),
(247, 24, 1, '1', NULL, 'Spaghetti Squash'),
(248, 24, 2, '1', NULL, 'Lime Leaf'),
(249, 24, 3, '½', 'cup', 'Jasmine Rice'),
(250, 24, 4, '1¾', 'cups', 'Light Coconut Milk'),
(251, 24, 5, '1', NULL, 'Lime'),
(252, 24, 6, '1', NULL, 'Yellow Onion'),
(253, 24, 7, '1', 'bunch', 'Mint'),
(254, 24, 8, '2', 'Tbsps', 'Dried Mung Beans'),
(255, 24, 9, '1½', 'Tbsps', 'Yellow Curry Paste'),
(256, 24, 10, '1', NULL, '1-Inch Piece Ginger'),
(257, 24, 11, '1', 'Tbsp', 'Sugar'),
(258, 24, 12, '½', 'lb', 'Baby Bok Choy'),
(259, 25, 1, '1', NULL, 'Turkey Breast Roast'),
(260, 25, 2, '⅔', 'cup', 'Semi-Pearled Farro'),
(261, 25, 3, '1', NULL, 'Apple'),
(262, 25, 4, '1', NULL, 'Lemon'),
(263, 25, 5, '1', NULL, 'Endive'),
(264, 25, 6, '1', 'bunch', 'Chives'),
(265, 25, 7, '2', 'Tbsps', 'Butter'),
(266, 25, 8, '1', NULL, 'Shallot'),
(267, 25, 9, '1', 'Tbsp', 'Honey'),
(268, 25, 10, '1', 'Tbsp', 'Whole Grain Dijon Mustard'),
(269, 26, 1, '1', 'bunch', 'Mint'),
(270, 26, 2, '2', NULL, 'Skin-On Salmon Fillets'),
(271, 26, 3, '2', 'cloves', 'Garlic'),
(272, 26, 4, '6', 'oz', 'Carrots'),
(273, 26, 5, '1', NULL, 'Lemon'),
(274, 26, 6, '¾', 'lb', 'Yukon Gold Potatoes'),
(275, 26, 7, '1', 'pinch', 'Saffron'),
(276, 26, 8, '1', 'Tbsp', 'Honey'),
(277, 26, 9, '½', 'cup', 'Plain Greek Yogurt'),
(278, 26, 10, '½', 'tsp', 'Crushed Aleppo Pepper'),
(279, 26, 11, '½', 'tsp', 'Ground Cumin'),
(280, 27, 1, '½', 'lb', 'Carrots'),
(281, 27, 2, '2', 'Tbsps', 'Maple Syrup'),
(282, 27, 3, '1', 'Tbsp', 'Butter'),
(283, 27, 4, '2', NULL, 'Boneless, Skinless Chicken Breasts'),
(284, 27, 5, '¾', 'lb', 'Yukon Gold Potatoes'),
(285, 27, 6, '2', 'Tbsps', 'Crème Fraîche'),
(286, 27, 7, '1', 'Tbsp', 'Sherry Vinegar'),
(287, 28, 1, '2', NULL, 'Strip Steaks'),
(288, 28, 2, '1', 'head', 'Butter Lettuce'),
(289, 28, 3, '2', 'cloves', 'Garlic'),
(290, 28, 4, '2', NULL, 'Russet Potatoes'),
(291, 28, 5, '1', 'bunch', 'Chives'),
(292, 28, 6, '3', 'Tbsps', 'Creamy Mustard Sauce'),
(293, 28, 7, '2', 'Tbsps', 'Butter'),
(294, 28, 8, '1', 'Tbsp', 'Red Wine Vinegar'),
(295, 29, 1, '1¼', 'lbs', 'Ground Beef'),
(296, 29, 2, '4', NULL, 'Potato Buns'),
(297, 29, 3, '2', 'cloves', 'Garlic'),
(298, 29, 4, '2', NULL, 'Scallions'),
(299, 29, 5, '2', NULL, 'Sweet Potatoes'),
(300, 29, 6, '½', 'lb', 'Baby Bok Choy'),
(301, 29, 7, '2', 'Tbsps', 'Hoisin Sauce'),
(302, 29, 8, '2', 'Tbsps', 'Sweet White Miso Paste'),
(303, 29, 9, '½', 'oz', 'Dried Shiitake Mushrooms'),
(304, 29, 10, '¼', 'cup', 'Mayonnaise'),
(305, 30, 1, '10', 'oz', 'Peeled & Deveined Shrimp'),
(306, 30, 2, '½', 'lb', 'Green Cabbage'),
(307, 30, 3, '6', 'oz', 'Lumaca Rigata Pasta'),
(308, 30, 4, '2', 'cloves', 'Garlic'),
(309, 30, 5, '1', NULL, '8-Ounce Can Tomato Sauce'),
(310, 30, 6, '1½', 'tsps', 'Calabrian Chile Paste'),
(311, 30, 7, '2', 'Tbsps', 'Crème Fraîche'),
(312, 30, 8, '2', 'Tbsps', 'Sliced Roasted Almonds'),
(313, 30, 9, '2', 'Tbsps', 'Verjus Blanc'),
(314, 31, 1, '1', 'bunch', 'Kale'),
(315, 31, 2, '1', NULL, 'Endive'),
(316, 31, 3, '2', 'cloves', 'Garlic'),
(317, 31, 4, '2', 'oz', 'Smoked Gouda Cheese'),
(318, 31, 5, '2', 'oz', 'Fontina Or Aged Alpine Cheese'),
(319, 31, 6, '1', NULL, 'Red Onion'),
(320, 31, 7, '¾', 'lb', 'Pizza Dough'),
(321, 31, 8, '4', 'oz', 'Cremini Mushrooms'),
(322, 31, 9, '1', NULL, 'Apple'),
(323, 31, 10, '1', 'Tbsp', 'Honey'),
(324, 31, 11, '1', 'Tbsp', 'Apple Cider Vinegar'),
(325, 32, 1, '2', NULL, 'Boneless, Skinless Chicken Breasts'),
(326, 32, 2, '4', NULL, 'Flour Tortillas'),
(327, 32, 3, '2', NULL, 'Scallions'),
(328, 32, 4, '6', 'oz', 'Chioggia Beet'),
(329, 32, 5, '1', NULL, 'Jalapeño Pepper'),
(330, 32, 6, '1', NULL, 'Lime'),
(331, 32, 7, '1', NULL, 'Navel Orange'),
(332, 32, 8, '3', 'Tbsps', 'Roasted Peanuts'),
(333, 32, 9, '2', 'oz', 'White Cheddar Cheese'),
(334, 32, 10, '¼', 'cup', 'Mexican Crema'),
(335, 32, 11, '1', 'Tbsp', 'Mexican Spice Blend (Ancho Chile Powder, Smoked Paprika, Garlic Powder, Ground Cumin, & Dried Mexican Oregano)'),
(336, 33, 1, '1', 'lb', 'Ground Pork'),
(337, 33, 2, '1', 'lb', 'Korean Rice Cakes'),
(338, 33, 3, '2', 'cloves', 'Garlic'),
(339, 33, 4, '2', 'heads', 'Baby Bok Choy'),
(340, 33, 5, '2', 'Tbsps', 'Soy Glaze'),
(341, 33, 6, '1½', 'Tbsps', 'Gochujang'),
(342, 33, 7, '1', NULL, '1-Inch Piece Ginger'),
(343, 33, 8, '¼', 'cup', 'Black Bean Sauce'),
(344, 33, 9, '¼', 'cup', 'Crème Fraîche'),
(345, 33, 10, '1', 'bunch', 'Chives'),
(346, 34, 1, '¾', 'cup', 'Jasmine Rice'),
(347, 34, 2, '2', NULL, 'Carrots'),
(348, 34, 3, '2', 'stalks', 'Celery'),
(349, 34, 4, '1', 'head', 'Baby Bok Choy'),
(350, 34, 5, '1', NULL, 'Orange'),
(351, 34, 6, '1', NULL, 'Lemon'),
(352, 34, 7, '2', 'cloves', 'Garlic'),
(353, 34, 8, '3', 'oz', 'Radishes'),
(354, 34, 9, '1', 'Tbsp', 'Sesame Oil'),
(355, 34, 10, '2', 'Tbsps', 'Soy Glaze'),
(356, 34, 11, '2', NULL, 'Cage-Free Farm Eggs'),
(357, 34, 12, '1', NULL, '1-Inch Piece Ginger'),
(358, 34, 13, '1½', 'Tbsps', 'Soy Marinade'),
(359, 34, 14, '2', 'Tbsps', 'Roasted Peanuts'),
(360, 35, 1, '¾', 'cup', 'Jasmine Rice'),
(361, 35, 2, '10', 'oz', 'Chopped Chicken Breast'),
(362, 35, 3, '1¾', 'cups', 'Light Coconut Milk'),
(363, 35, 4, '3', NULL, 'Carrots'),
(364, 35, 5, '1', NULL, 'Lime'),
(365, 35, 6, '1', 'head', 'Baby Bok Choy'),
(366, 35, 7, '½', 'cup', 'Dried Shiitake Mushrooms'),
(367, 35, 8, '2', 'tsps', 'Golden Mountain Sauce'),
(368, 35, 9, '1½', 'Tbsps', 'Yellow Curry Paste'),
(369, 36, 1, '2', NULL, 'Tilapia Fillets'),
(370, 36, 2, '½', 'cup', 'Black Beluga Lentils'),
(371, 36, 3, '2', 'cloves', 'Garlic'),
(372, 36, 4, '1', NULL, 'Lemon'),
(373, 36, 5, '½', 'lb', 'Broccoli'),
(374, 36, 6, '1', 'bunch', 'Parsley'),
(375, 36, 7, '2', 'Tbsps', 'Butter'),
(376, 36, 8, '1', 'oz', 'Golden Or Red Sweet Piquante Peppers'),
(377, 36, 9, '1', 'Tbsp', 'Capers'),
(378, 37, 1, '10', 'oz', 'Ground Chicken'),
(379, 37, 2, '1', 'head', 'Butter Lettuce'),
(380, 37, 3, '1', NULL, 'Navel Orange'),
(381, 37, 4, '3', 'oz', 'Radishes'),
(382, 37, 5, '2', NULL, 'Scallions'),
(383, 37, 6, '1', NULL, '1-Inch Piece Ginger'),
(384, 37, 7, '2', 'cloves', 'Garlic'),
(385, 37, 8, '2', 'Tbsps', 'Coconut Aminos'),
(386, 37, 9, '1', 'Tbsp', 'Rice Vinegar'),
(387, 37, 10, '2', 'Tbsps', 'Roasted Cashews'),
(388, 37, 11, '1', 'tsp', 'Togarashi Seasoning (Chile Pepper, Orange Peel, Sesame Seeds, Ginger, & Seaweed)'),
(389, 37, 12, '4', 'oz', 'Cremini Mushrooms'),
(390, 37, 13, '1', NULL, 'Red Onion'),
(391, 37, 14, '1', NULL, 'Carrot'),
(392, 37, 15, '1', NULL, 'Lime'),
(393, 38, 1, '2', NULL, 'Grassfed Strip Steaks'),
(394, 38, 2, '¾', 'cup', 'Jasmine Rice'),
(395, 38, 3, '1', NULL, '1-Inch Piece Ginger'),
(396, 38, 4, '2', 'cloves', 'Garlic'),
(397, 38, 5, '2', 'Tbsps', 'Ponzu Sauce'),
(398, 38, 6, '2', 'Tbsps', 'Soy Sauce'),
(399, 38, 7, '1', 'tsp', 'Sugar'),
(400, 38, 8, '4', 'oz', 'Snow Peas'),
(401, 38, 9, '2', NULL, 'Carrots'),
(402, 38, 10, '1', 'head', 'Baby Bok Choy'),
(403, 38, 11, '2', NULL, 'Scallions'),
(404, 38, 12, '1', 'Tbsp', 'Butter'),
(405, 39, 1, '¾', 'cup', 'Jasmine Rice'),
(406, 39, 2, '1', NULL, 'Shallot'),
(407, 39, 3, '2', 'heads', 'Baby Bok Choy'),
(408, 39, 4, '1', NULL, 'Lime'),
(409, 39, 5, '6', 'oz', 'Radishes'),
(410, 39, 6, '2', 'Tbsps', 'Ponzu Sauce'),
(411, 39, 7, '1', 'Tbsp', 'Soy Marinade'),
(412, 39, 8, '1', 'Tbsp', 'Sugar'),
(413, 39, 9, '2', NULL, 'Grassfed Strip Steaks'),
(414, 39, 10, '4', 'oz', 'Cremini Mushrooms'),
(415, 39, 11, '1', NULL, '1-Inch Piece Ginger'),
(416, 39, 12, '2', 'Tbsps', 'Sweet Chili Sauce'),
(417, 40, 1, '2', NULL, 'Boneless, Skinless Chicken Breasts'),
(418, 40, 2, '2', NULL, 'Carrots'),
(419, 40, 3, '1', NULL, 'Red Onion'),
(420, 40, 4, '2', 'cloves', 'Garlic'),
(421, 40, 5, '½', 'cup', 'French Green Lentils'),
(422, 40, 6, '1', 'bunch', 'Collard Greens'),
(423, 40, 7, '2', 'Tbsps', 'Tomato Paste'),
(424, 40, 8, '¼', 'tsp', 'Crushed Red Pepper Flakes'),
(425, 40, 9, '1', 'Tbsp', 'Capers'),
(426, 40, 10, '1', 'Tbsp', 'Apple Cider Vinegar'),
(427, 40, 11, '2', 'Tbsps', 'Crumbled Goat Cheese'),
(428, 40, 12, '1', 'Tbsp', 'Tuscan Spice Blend (Ground Fennel Seeds, Whole Fennel Seeds, Ground Rosemary, & Ground Sage)');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `subtitle` varchar(120) DEFAULT NULL,
  `servings` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `subtitle`, `servings`, `category_id`, `created_at`) VALUES
(1, 'Ancho-Orange Chicken', 'with Kale Rice & Roasted Carrots', 4, 2, '2026-10-20 18:42:04'),
(2, 'Beef Medallions & Mushroom Sauce', 'with Mashed Potatoes', 2, 1, '2026-10-20 18:42:04'),
(3, 'Broccoli & Basil Pesto Sandwiches', 'with Romaine & Citrus Salad', 4, 6, '2026-10-20 18:42:04'),
(4, 'Broccoli & Mozzarella Calzones', 'with Caesar Salad', 4, 6, '2026-10-20 18:42:04'),
(5, 'Bucatini Alfredo', 'with Broccoli', 2, 6, '2026-10-20 18:42:04'),
(6, 'Bucatini & Tomato Sauce', 'with Roasted Broccoli', 2, 6, '2026-10-20 18:42:04'),
(7, 'Cheesy Enchiladas Rojas', 'with Mushrooms & Kale', 4, 6, '2026-10-20 18:42:04'),
(8, 'Crispy Fish Sandwiches', 'with Tartar Sauce & Roasted Sweet Potato Wedges', 4, 3, '2026-10-20 18:42:04'),
(9, 'General Tso\'s Chicken', 'with Bok Choy & Jasmine Rice', 2, 2, '2026-10-20 18:42:04'),
(10, 'Hoisin-Glazed Pork Chops', 'with Stir-Fried Vegetables & Wonton Noodles', 4, 4, '2026-10-20 18:42:04'),
(11, 'Honey-Butter Barramundi', 'with Za\'atar Roasted Vegetables', 4, 3, '2026-10-20 18:42:04'),
(12, 'Kale & Ricotta Quiche', 'with Romaine, Apple, & Almond Salad', 4, 6, '2026-10-20 18:42:04'),
(13, 'Mexican-Spiced Barramundi', 'with Kale, Sweet Potato, & Avocado Salad', 2, 3, '2026-10-20 18:42:04'),
(14, 'Mushroom & Potato Tacos', 'with Romaine & Orange Salad', 2, 6, '2026-10-20 18:42:04'),
(15, 'Parmesan-Crusted Chicken', 'with Mashed Sweet Potatoes & Roasted Broccoli', 4, 2, '2026-10-20 18:42:04'),
(16, 'Pimento Cheeseburgers', 'with Sweet Potato Oven Fries', 2, 1, '2026-10-20 18:42:04'),
(17, 'Pork Chorizo Tacos', 'with Cheesy Roasted Potatoes', 2, 4, '2026-10-20 18:42:04'),
(18, 'Roasted Broccoli & Fregola Sarda Salad', 'with Hard-Boiled Eggs & Tahini Dressing', 2, 6, '2026-10-20 18:42:04'),
(19, 'Roasted Brussels Sprout & Freekeh Salad', 'with Lemon Yogurt & Barrel-Aged Feta', 2, 6, '2026-10-20 18:42:04'),
(20, 'Roasted Cauliflower Salad', 'with Caper Brown Butter & Parmesan Breadcrumbs', 2, 6, '2026-10-20 18:42:04'),
(21, 'Roasted Chicken & Fall Vegetables', 'with Cranberry & Ginger Compote', 4, 2, '2026-10-20 18:42:04'),
(22, 'Roasted Pork & Broccoli', 'with Apple, Cheese Sauce, & Garlic Breadcrumbs', 2, 4, '2026-10-20 18:42:04'),
(23, 'Roasted Red Pepper Pasta', 'with Lemon-Parmesan Broccoli', 2, 6, '2026-10-20 18:42:04'),
(24, 'Roasted Squash Curry', 'with Crispy Mung Beans & Jasmine Rice', 2, 6, '2026-10-20 18:42:04'),
(25, 'Roasted Turkey Breast & Farro-Endive Salad', 'with Brown Butter Apple Compote', 2, 5, '2026-10-20 18:42:04'),
(26, 'Salmon & Honey-Glazed Carrots', 'with Lemon-Saffron Yogurt Sauce', 2, 3, '2026-10-20 18:42:04'),
(27, 'Seared Chicken & Mashed Potatoes', 'with Maple-Glazed Carrots', 2, 2, '2026-10-20 18:42:04'),
(28, 'Seared Steaks & Garlic Butter', 'with Oven Fries', 4, 1, '2026-10-20 18:42:04'),
(29, 'Shiitake & Hoisin Beef Burgers', 'with Miso Mayonnaise & Roasted Sweet Potatoes', 4, 1, '2026-10-20 18:42:04'),
(30, 'Shrimp Fra Diavolo', 'with Lumaca Rigata Pasta', 2, 3, '2026-10-20 18:42:04'),
(31, 'Smoked Gouda & Mushroom Flatbread', 'with Endive & Apple Salad', 2, 6, '2026-10-20 18:42:04'),
(32, 'Spicy Chicken Quesadillas', 'with Beet & Orange Salad', 2, 2, '2026-10-20 18:42:04'),
(33, 'Spicy Pork & Korean Rice Cakes', 'with Bok Choy', 4, 4, '2026-10-20 18:42:04'),
(34, 'Sweet & Sour Vegetable Stir-Fry', 'with Fried Eggs & Peanuts', 2, 6, '2026-10-20 18:42:04'),
(35, 'Thai Curry Chicken', 'with Carrots & Bok Choy', 2, 2, '2026-10-20 18:42:04'),
(36, 'Tilapia & Black Lentil Salad', 'with Lemon Pan Sauce', 2, 3, '2026-10-20 18:42:04'),
(37, 'Togarashi Chicken Lettuce Cups', 'with Orange & Radishes', 2, 2, '2026-10-20 18:42:04'),
(38, 'Top Chef Ginger-Marinated Grassfed Steaks', 'with Stir-Fried Vegetables & Jasmine Rice', 2, 1, '2026-10-20 18:42:04'),
(39, 'Top Chef Seared Grassfed Steaks', 'with Sweet Chili-Glazed Vegetables', 4, 1, '2026-10-20 18:42:04'),
(40, 'Tuscan Chicken & Green Lentil Stew', 'with Goat Cheese', 2, 2, '2026-10-20 18:42:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
