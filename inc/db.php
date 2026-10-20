<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.

// Throw an exception on any database error instead of failing silently
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// config.php returns an array of credentials (kept out of Git)
$config = require __DIR__ . '/config.php';

try {
  $conn = mysqli_connect(
    $config['db_host'],
    $config['db_user'],
    $config['db_pass'],
    $config['db_name'],
    $config['db_port']
  );
  mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
  // Real reason goes to the private error log; the visitor gets a generic 500
  error_log('Database connection failed: ' . $e->getMessage());
  http_response_code(500);
  exit('Something went wrong. Please try again later.');
}
?>