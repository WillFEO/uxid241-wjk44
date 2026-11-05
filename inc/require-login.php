<?php
// require-login.php
declare(strict_types=1);
session_start();

if (!isset($_SESSION['user_id'])) {
  header('Location: log-in.php');
  exit;
}