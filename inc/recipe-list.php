<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.
// Shared recipe list. The page that requires this sets $recipes and $ingredients first.
?>
<ul>
  <?php foreach ($recipes as $recipe): ?>
    <li>
      <h2><?= e($recipe['title']) ?></h2>
      <p><?= e($recipe['subtitle'] ?? '') ?></p>
      <p>Category: <?= e($recipe['category']) ?></p>
      <p>Serves <?= (int) $recipe['servings'] ?></p>
      <h3>Ingredients</h3>
      <ul>
        <?php foreach ($ingredients[$recipe['id']] ?? [] as $ingredient): ?>
          <li><?= e(format_ingredient($ingredient)) ?></li>
        <?php endforeach; ?>
      </ul>
    </li>
  <?php endforeach; ?>
</ul>