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

// Every recipe with its category name. No user input, so mysqli_query is fine.
function all_recipes(mysqli $conn): array {
  $sql = 'SELECT recipes.id, recipes.title, recipes.subtitle, recipes.servings, categories.name AS category
          FROM recipes
          INNER JOIN categories ON recipes.category_id = categories.id
          ORDER BY recipes.title';
  $result = mysqli_query($conn, $sql);
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// Recipes whose title, subtitle, category or any ingredient contains $q.
// $q comes from the user, so it only reaches SQL as a bound parameter.
function search_recipes(mysqli $conn, string $q): array {
  $sql = 'SELECT DISTINCT recipes.id, recipes.title, recipes.subtitle, recipes.servings, categories.name AS category
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

// All ingredient lines, grouped by recipe: [recipe_id => [row, row, ...]]
function ingredients_by_recipe(mysqli $conn): array {
  $sql = 'SELECT recipe_id, quantity, unit, name
          FROM ingredients
          ORDER BY recipe_id, sort_order';
  $rows = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);

  $grouped = [];
  foreach ($rows as $row) {
    $grouped[$row['recipe_id']][] = $row;
  }
  return $grouped;
}

// One ingredient row as a line of text, e.g. "2 cloves Garlic" or "1 Lime" (no unit)
function format_ingredient(array $ingredient): string {
  $line = $ingredient['quantity'];
  if ($ingredient['unit'] !== null) {
    $line .= ' ' . $ingredient['unit'];
  }
  return $line . ' ' . $ingredient['name'];
}
?>