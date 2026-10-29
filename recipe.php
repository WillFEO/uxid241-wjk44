<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.
// One full recipe. Which one comes from the URL: recipe.php?id=5

require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

// (int) turns the URL text into a whole number; anything that isn't a number becomes 0
$id = (int) get_value('id');
$recipe = null;
$ingredients = [];
$steps = [];

try {
  if ($id > 0) {
    $recipe = find_recipe($conn, $id);
  }
  if ($recipe !== null) {
    $ingredients = recipe_ingredients($conn, $id);
    $steps = recipe_steps($conn, $id);
  }
} catch (mysqli_sql_exception $e) {
  error_log($e->getMessage());
  http_response_code(500);
  exit('Something went wrong. Please try again later.');
}

// No recipe with that id: tell the browser with a 404 status
if ($recipe === null) {
  http_response_code(404);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= $recipe === null ? 'Recipe not found' : e($recipe['title']) ?></title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body class="recipe-page">
  <nav><a href="index.php">Home</a> <a href="recipes.php">All recipes</a></nav>

  <?php if ($recipe === null): ?>
    <h1>Recipe not found</h1>
    <p>There is no recipe with that id.</p>
  <?php else: ?>
    <h1><?= e($recipe['title']) ?></h1>
    <p class="subtitle"><?= e($recipe['subtitle'] ?? '') ?></p>
    <?php if ($recipe['main_image'] !== null): ?>
      <img src="<?= e($recipe['main_image']) ?>" alt="<?= e($recipe['title']) ?>">
    <?php endif; ?>
    <p class="meta">Category: <?= e($recipe['category']) ?></p>
    <p class="meta">Serves <?= (int) $recipe['servings'] ?></p>

    <h2>Ingredients</h2>
    <?php if ($recipe['ingredients_image'] !== null): ?>
      <img src="<?= e($recipe['ingredients_image']) ?>" alt="Ingredients for <?= e($recipe['title']) ?>">
    <?php endif; ?>
    <ul class="ingredients">
      <?php foreach ($ingredients as $ingredient): ?>
        <li><?= e(format_ingredient($ingredient)) ?></li>
      <?php endforeach; ?>
    </ul>

    <h2>Steps</h2>
    <?php foreach ($steps as $step): ?>
      <section class="step">
      <h3>
        Step <?= (int) $step['step_number'] ?><?php if ($step['title'] !== null): ?>: <?= e($step['title']) ?><?php endif; ?>
      </h3>
      <?php if ($step['image'] !== null): ?>
        <img src="<?= e($step['image']) ?>" alt="Step <?= (int) $step['step_number'] ?>">
      <?php endif; ?>
      <p><?= e($step['instructions']) ?></p>
      </section>
    <?php endforeach; ?>
  <?php endif; ?>
</body>
</html>
