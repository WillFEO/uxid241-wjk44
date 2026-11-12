<?php declare(strict_types=1);

require __DIR__ . '/inc/require-login.php';
require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

$result = mysqli_execute_query($conn, 'SELECT email FROM users WHERE id = ?', [$_SESSION['user_id']]);
$user = mysqli_fetch_assoc($result);

$all_recipes = all_recipes($conn);
$categories = mysqli_fetch_all(mysqli_query($conn, 'SELECT id, name FROM categories ORDER BY name'), MYSQLI_ASSOC);
$errors = [];
$title = '';
$subtitle = '';
$category= 0;
$servings = 2;

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
  $action = $_POST['action'] ?? '';

  if ($action ==='create') {
    $form = read_recipe_form();
    $title = $form['title'];
    $subtitle = $form['subtitle'];
    $category = $form['category'];
    $servings = $form['servings'];

    $errors = validate_recipe($conn, $title, $subtitle, $category, $servings);

    // AI use: insert, mysqli_insert_id and redirect pattern suggested by Claude (Anthropic), reviewed and tested by me
    if (empty($errors)) {
      mysqli_execute_query($conn, 'INSERT INTO recipes (title, subtitle, category_id, servings) VALUES (?, ?, ?, ?)',[$title, $subtitle, $category, $servings]);
      $new_id = mysqli_insert_id($conn);
      header('Location: recipe.php?id=' . $new_id);
      exit;
    }
  }
  elseif ($action === 'delete') {
    // AI use: delete order (child rows first) and redirect suggested by Claude (Anthropic), reviewed and tested by me
    $id = filter_var(post_value('id'), FILTER_VALIDATE_INT);
    if($id) {
      mysqli_execute_query($conn, 'DELETE FROM ingredients WHERE recipe_id = ?', [$id]);
      mysqli_execute_query($conn, 'DELETE FROM steps WHERE recipe_id = ?', [$id]);
      mysqli_execute_query($conn, 'DELETE FROM recipes WHERE id = ?', [$id]);
    }
    header('Location: admin.php');
    exit;
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UXID241 Recipe Site Admin</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h1>Admin Panel: Logged in as <?= e($user['email']) ?></h1>
  <p>Welcome to the admin page!</p>
  <h2>Admin Actions</h2>
  <?php if ($errors): ?>
    <ul class="error">
      <?php foreach ($errors as $error): ?>
        <li><?= e($error) ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>
  <form action="admin.php" method="post">
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
    <button type="submit" name="action" value="create">Create Recipe</button>
  </form>
  <h2>All Recipes</h2>
  <ul>
    <?php foreach ($all_recipes as $recipe): ?>
      <li>
        <a href="recipe.php?id=<?= (int)$recipe['id'] ?>"><?= e($recipe['title']) ?></a>
        <a href="edit-recipe.php?id=<?= (int)$recipe['id'] ?>">Edit</a>
        <?php // AI use: POST delete form with hidden id suggested by Claude (Anthropic), reviewed and tested by me ?>
        <form method="post" action="admin.php" onsubmit="return confirm('Are you sure you want to delete this recipe?');">
          <input type="hidden" name="id" value="<?= (int)$recipe['id'] ?>">
          <button type="submit" name="action" value="delete">Delete</button>
        </form>
      </li>
    <?php endforeach; ?>
  </ul>
  <nav><a href="index.php">Back to home</a></nav>
  <nav><a href="recipes.php">Browse all recipes</a></nav>
  <nav><a href="log-out.php">Log Out</a></nav>
</body>
</html>