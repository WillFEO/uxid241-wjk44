-- schema.sql
-- Builds the cookbook database and its recipes table, then adds seed rows.
-- Seed data: the first 5 recipes from my recipe workbook (recipes_data_ver8.xlsx).
-- AI use: structure drafted with Claude (Anthropic), reviewed and run by me.

CREATE DATABASE IF NOT EXISTS cookbook
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE cookbook;

-- Start fresh each time this file is run
DROP TABLE IF EXISTS recipes;

CREATE TABLE recipes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(120) NOT NULL,
  subtitle VARCHAR(120),
  category VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO recipes (title, subtitle, category) VALUES
  ('Ancho-Orange Chicken', 'with Kale Rice & Roasted Carrots', 'Chicken'),
  ('Beef Medallions & Mushroom Sauce', 'with Mashed Potatoes', 'Beef'),
  ('Broccoli & Basil Pesto Sandwiches', 'with Romaine & Citrus Salad', 'Vegetarian'),
  ('Broccoli & Mozzarella Calzones', 'with Caesar Salad', 'Vegetarian'),
  ('Bucatini Alfredo', 'with Broccoli', 'Vegetarian');