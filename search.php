<?php
declare(strict_types=1);

// AI use: search query and results drafted with Claude (Anthropic), reviewed and tested by me.

require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

$q = '';
$errors = [];
$recipes = [];
$success = false;

if (isset($_GET['q'])) {
  $q = get_value('q');

  if ($q === '') {
    $errors[] = 'Please enter a search term.';
  }

  if (mb_strlen($q) > 100) {
    $errors[] = 'Search term must be 100 characters or fewer.';
  }

  if (empty($errors)) {
    try {
      $recipes = search_recipes($conn, $q);
    } catch (mysqli_sql_exception $e) {
      error_log($e->getMessage());
      http_response_code(500);
      exit('Something went wrong. Please try again later.');
    }
    $success = true;
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Search Results - UXID241 Recipe Site</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h1>Recipe Search</h1>
  <nav><a href="index.php">Back to home</a></nav>

  <?php if (!empty($errors)): ?>
    <ul>
      <?php foreach ($errors as $error): ?>
        <li><?= e($error) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

  <form class="search-form" action="search.php" method="get">
    <label for="search-input">Search for a recipe:</label>
    <input type="text" id="search-input" name="q" value="<?= e($q) ?>" required>
    <button type="submit">Search</button>
  </form>

  <?php if ($success): ?>
    <p><?= count($recipes) ?> result(s) for "<?= e($q) ?>"</p>
    <?php if (count($recipes) === 0): ?>
      <p>No recipes match that search. Try an ingredient like "garlic" or a category like "beef".</p>
    <?php else: ?>
      <?php require __DIR__ . '/inc/recipe-list.php'; ?>
    <?php endif; ?>
  <?php endif; ?>
</body>
</html>