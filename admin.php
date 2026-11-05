<?php declare(strict_types=1);

require __DIR__ . '/inc/require-login.php';
require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

$result = mysqli_execute_query($conn, 'SELECT email FROM users WHERE id = ?', [$_SESSION['user_id']]);
$user = mysqli_fetch_assoc($result);

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
  <p>Welcome to the admin page! Functionality will be added here soon.</p>
  <nav><a href="index.php">Back to home</a></nav>
  <nav><a href="recipes.php">Browse all recipes</a></nav>
  <nav><a href="log-out.php">Log Out</a></nav>
</body>
</html>