<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.

require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

try {
  $recipes = all_recipes($conn);
  $ingredients = ingredients_by_recipe($conn);
} catch (mysqli_sql_exception $e) {
  error_log($e->getMessage());
  http_response_code(500);
  exit('Something went wrong. Please try again later.');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recipes</title>
</head>
<body>
  <h1>Recipes</h1>
  <p><a href="index.php">Back to Home</a></p>

  <?php if (count($recipes) === 0): ?>
    <p>No recipes yet.</p>
  <?php else: ?>
    <p>Showing <?= count($recipes) ?> recipes.</p>
    <?php require __DIR__ . '/inc/recipe-list.php'; ?>
  <?php endif; ?>
</body>
</html>