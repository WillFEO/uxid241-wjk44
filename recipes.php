<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.

require __DIR__ . '/inc/db.php';

// Fixed query, no user input, so mysqli_query is safe here
$sql = 'SELECT id, title, subtitle, category FROM recipes';
$result = mysqli_query($conn, $sql);
$recipes = mysqli_fetch_all($result, MYSQLI_ASSOC);
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

  <?php if (count($recipes) === 0): ?>
    <p>No recipes yet.</p>
  <?php else: ?>
    <ul>
      <?php foreach ($recipes as $recipe): ?>
        <li>
          <h2><?= htmlspecialchars($recipe['title']) ?></h2>
          <p><?= htmlspecialchars($recipe['subtitle'] ?? '') ?></p>
          <p>Category: <?= htmlspecialchars($recipe['category']) ?></p>
        </li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>
  <p><a href="index.php">Back to Home</a></p>
</body>
</html>