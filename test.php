<?php
declare(strict_types=1);

$project_name = 'My Cookbook';
echo "This is an echo test";
echo '<h1>' . $project_name . '</h1>';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <h1><?= $project_name?></h1>
</body>
</html>