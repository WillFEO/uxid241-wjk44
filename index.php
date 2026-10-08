<?php declare(strict_types=1); ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UXID241 Recipe Site</title>
</head>
<body>
  <h1>Welcome to the UXID241 Recipe Site</h1>
  <p>Explore a variety of delicious recipes and cooking tips!</p>
  <form action="search.php" method="get">
    <label for="search-input">Search for a recipe:</label>
    <input type="text" id="search-input" name="q" required>
    <button type="submit">Search</button>
  </form>
</body>
</html>