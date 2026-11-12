<?php declare(strict_types=1);

require __DIR__ . '/inc/require-login.php';
require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

$id = (int) get_value('id');
$recipe = find_recipe($conn, $id);

// No recipe with that id: tell the browser with a 404 status
if ($recipe === null) {
  http_response_code(404);
  exit('Recipe not found');
}

$categories = mysqli_fetch_all(mysqli_query($conn, 'SELECT id, name FROM categories ORDER BY name'), MYSQLI_ASSOC);
$errors = [];
$title = $recipe['title'];
$subtitle = $recipe['subtitle'];
$category= (int)$recipe['category_id'];
$servings = (int)$recipe['servings'];

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
  $action = $_POST['action'] ?? '';

  if ($action ==='edit') {
    $form = read_recipe_form();
    $title = $form['title'];
    $subtitle = $form['subtitle'];
    $category = $form['category'];
    $servings = $form['servings'];

    $errors = validate_recipe($conn, $title, $subtitle, $category, $servings);

    // AI use: UPDATE flow and id-in-form-action approach suggested by Claude (Anthropic), reviewed and tested by me
    if (empty($errors)) {
      mysqli_execute_query($conn, 'UPDATE recipes SET title = ?, subtitle = ?, category_id = ?, servings = ? WHERE id = ?',[$title, $subtitle, $category, $servings, $id]);
      header('Location: recipe.php?id=' . $id);
      exit;
    }
  }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UXID241 Recipe Site Edit Recipe</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h1>Edit Recipe</h1>
  <?php if ($errors): ?>
    <ul class="error">
      <?php foreach ($errors as $error): ?>
        <li><?= e($error) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>
  <form action="edit-recipe.php?id=<?= (int)$id ?>" method="post">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" value="<?= e($title) ?>" required>
    <label for="subtitle">Subtitle:</label>
    <input type="text" id="subtitle" name="subtitle" value="<?= e($subtitle ?? '') ?>">
    <label for="category">Category:</label>
    <?php // AI use: category dropdown with selected option drafted by Claude (Anthropic), reviewed and tested by me ?>
    <select id="category" name="category" required>
      <option value="">Choose a category</option>
      <?php foreach ($categories as $cat): ?>
        <option value="<?= (int)$cat['id'] ?>" <?= $category === (int)$cat['id'] ? 'selected' : '' ?>><?= e($cat['name']) ?></option>
      <?php endforeach; ?>
    </select>
    <label for="servings">Servings (1 to 12):</label>
    <input type="number" id="servings" name="servings" value="<?= (int)$servings ?>" min="1" max="12" required>
    <button type="submit" name="action" value="edit">Save Changes</button>
  </form>
  <nav><a href="index.php">Back to home</a></nav>
  <nav><a href="recipes.php">Browse all recipes</a></nav>
  <nav><a href="log-out.php">Log Out</a></nav>
</body>
</html>