<?php declare(strict_types=1);

function get_value(string $key): string {
  return trim($_GET[$key] ?? '');
}

function e(string $value): string {
  return htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
}

$q = '';
$errors = [];
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
</head>
<body>
  <h1>Recipe Search</h1>
  <p><a href="index.php">Back to home</a></p>

  <?php if (!empty($errors)): ?>
    <ul>
      <?php foreach ($errors as $error): ?>
        <li><?= e($error) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

  <?php if ($success): ?>
    <p>You searched for: <?= e($q) ?></p>
    <p>Recipe results will appear here once the database infrastructure is set up.</p>
  <?php endif; ?>

  <form action="search.php" method="get">
    <label for="search-input">Search for a recipe:</label>
    <input type="text" id="search-input" name="q" value="<?= e($q) ?>" required>
    <button type="submit">Search</button>
  </form>
</body>
</html>