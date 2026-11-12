<?php declare(strict_types=1);

require __DIR__ . '/inc/db.php';
require __DIR__ . '/inc/functions.php';

session_start();

if(isset($_SESSION['user_id'])){
  header('Location: admin.php');
  exit;
}

$error = '';
$message ='';

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
  $email = trim($_POST['email'] ?? '');
  $plain = $_POST['password'] ?? '';
  $action = $_POST['action'] ?? '';

  if ($action === 'login'){
    $result = mysqli_execute_query($conn, 'SELECT id, password_hash FROM users WHERE email = ?' , [$email]);
    $user = mysqli_fetch_assoc($result);

    if ($user !== null && password_verify($plain, $user['password_hash'])){
      session_regenerate_id(true);
      $_SESSION['user_id'] = $user['id'];
      header('Location: admin.php');
      exit;
    }

    $error = 'Invalid email or password';
  }

  if ($action === 'register'){
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $error = 'Invalid email format';
    }
    elseif(mb_strlen($plain) < 8) {
      $error = 'Password must be at least 8 characters long';
    }
    else {
      try {
        $hash = password_hash($plain, PASSWORD_DEFAULT);
        mysqli_execute_query($conn, 'INSERT INTO users (email, password_hash) VALUES (?, ?)', [$email, $hash]);
        $message = 'Registration successful. You can now log in.';
      } catch (mysqli_sql_exception $e) {
        $error = 'That email is already registered. Please log in or use a different email.';
      }
    }
  }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UXID241 Recipe Site Login/Registration</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h1>Log In</h1>
  <p>Use this page to log in or register for an account</p>
  <form action="log-in.php" method="post">
    <label for="login-email">Email:</label>
    <input type="email" id="login-email" name="email" required>
    <label for="login-password">Password:</label>
    <input type="password" id="login-password" name="password" required>
    <button type="submit" name="action" value="login">Log In</button>
  </form>
  <h1>Register</h1>
  <form action="log-in.php" method="post">
    <label for="register-email">Email:</label>
    <input type="email" id="register-email" name="email" required>
    <label for="register-password">Password:</label>
    <input type="password" id="register-password" name="password" minlength="8" required>
    <button type="submit" name="action" value="register">Register</button>
  </form>
  <?php if ($error): ?>
    <p class="error"><?= e($error) ?></p>
  <?php endif; ?>
  <?php if ($message): ?>
    <p class="message"><?= e($message) ?></p>
  <?php endif; ?>
  <nav><a href="index.php">Back to home</a></nav>
  <nav><a href="recipes.php">Browse all recipes</a></nav>
</body>
</html>