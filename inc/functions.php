<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.
// Every reusable function lives here. Pages load it with require.

// Escape a value before writing it into HTML
function e(string $value): string {
  return htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
}

// Read one value from the URL query string, trimmed ('' if missing or not text)
function get_value(string $key): string {
  $value = $_GET[$key] ?? '';
  return is_string($value) ? trim($value) : '';
}

//Read one value from a post, trimmed ('' if missing or not text)
function post_value(string $key): string {
  $value = $_POST[$key] ?? '';
  return is_string($value) ? trim($value) : '';
}

// Every recipe with its category name. No user input, so mysqli_query is fine.
function all_recipes(mysqli $conn): array {
  $sql = 'SELECT recipes.id, recipes.title, recipes.subtitle, recipes.servings, recipes.main_image, categories.name AS category
          FROM recipes
          INNER JOIN categories ON recipes.category_id = categories.id
          ORDER BY recipes.title';
  $result = mysqli_query($conn, $sql);
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// Recipes whose title, subtitle, category or any ingredient contains $q.
// $q comes from the user, so it only reaches SQL as a bound parameter.
function search_recipes(mysqli $conn, string $q): array {
  $sql = 'SELECT DISTINCT recipes.id, recipes.title, recipes.subtitle, recipes.servings, recipes.main_image, categories.name AS category
          FROM recipes
          INNER JOIN categories ON recipes.category_id = categories.id
          LEFT JOIN ingredients ON ingredients.recipe_id = recipes.id
          WHERE recipes.title LIKE ?
             OR recipes.subtitle LIKE ?
             OR categories.name LIKE ?
             OR ingredients.name LIKE ?
          ORDER BY recipes.title';
  $like = '%' . $q . '%';
  $result = mysqli_execute_query($conn, $sql, [$like, $like, $like, $like]);
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// One recipe with its category name and image paths, or null if no recipe has this id.
// $id comes from the URL, so it only reaches SQL as a bound parameter.
function find_recipe(mysqli $conn, int $id): ?array {
  $sql = 'SELECT recipes.id, recipes.title, recipes.subtitle, recipes.servings,
                 recipes.main_image, recipes.ingredients_image, recipes.category_id, categories.name AS category
          FROM recipes
          INNER JOIN categories ON recipes.category_id = categories.id
          WHERE recipes.id = ?';
  $result = mysqli_execute_query($conn, $sql, [$id]);
  return mysqli_fetch_assoc($result);
}

// One recipe's ingredient lines, in recipe order
function recipe_ingredients(mysqli $conn, int $recipe_id): array {
  $sql = 'SELECT quantity, unit, name
          FROM ingredients
          WHERE recipe_id = ?
          ORDER BY sort_order';
  $result = mysqli_execute_query($conn, $sql, [$recipe_id]);
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// One recipe's steps, in order. title and image can be NULL.
function recipe_steps(mysqli $conn, int $recipe_id): array {
  $sql = 'SELECT step_number, title, instructions, image
          FROM steps
          WHERE recipe_id = ?
          ORDER BY step_number';
  $result = mysqli_execute_query($conn, $sql, [$recipe_id]);
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// One ingredient row as a line of text, e.g. "2 cloves Garlic" or "1 Lime" (no unit)
function format_ingredient(array $ingredient): string {
  $line = $ingredient['quantity'];
  if ($ingredient['unit'] !== null) {
    $line .= ' ' . $ingredient['unit'];
  }
  return $line . ' ' . $ingredient['name'];
}

// Read and clean the recipe form fields from POST (blank subtitle becomes null, bad numbers become false)
function read_recipe_form(): array {
  $title = post_value('title');
  $subtitle = post_value('subtitle');
  $subtitle = $subtitle === '' ? null : $subtitle;
  $category = filter_var(post_value('category'), FILTER_VALIDATE_INT);
  $servings = filter_var(post_value('servings'), FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 12]]);

  return [
    'title' => $title,
    'subtitle' => $subtitle,
    'category' => $category,
    'servings' => $servings
  ];
}

// Check the cleaned recipe fields; returns a list of error messages (empty = valid). AI use: category check drafted with Claude.
function validate_recipe(mysqli $conn, string $title, ?string $subtitle, int|false $category, int|false $servings): array {
  $errors = [];

  if ($title === '') {
    $errors[] = 'Title is required.';
  }
  elseif (mb_strlen($title) > 120) {
    $errors[] = 'Title must be no more than 120 characters long.';
  }

  if ($subtitle !== null && mb_strlen($subtitle) > 120) {
    $errors[] = 'Subtitle must be no more than 120 characters long.';
  }

  if (!$category) {
    $errors[] = 'Category is required.';
  }
  else {
    $check = mysqli_execute_query($conn, 'SELECT id FROM categories WHERE id = ?', [$category]);
    if (mysqli_num_rows($check) === 0) {
      $errors[] = 'Category does not exist, choose a valid category';
    }
  }

  if (empty($servings)) {
    $errors[] = 'Servings must be a whole number from 1 to 12.';
  }

  return $errors;
}
?>