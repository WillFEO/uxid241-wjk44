<?php
declare(strict_types=1);

// AI use: drafted with Claude (Anthropic), reviewed and tested by me.
// Shared recipe grid. The page that requires this sets $recipes first.
?>
<ul class="recipe-grid">
  <?php foreach ($recipes as $recipe): ?>
    <li class="recipe-card">
      <a href="recipe.php?id=<?= (int) $recipe['id'] ?>">
        <?php if ($recipe['main_image'] !== null): ?>
          <img src="<?= e($recipe['main_image']) ?>" alt="">
        <?php endif; ?>
        <h2><?= e($recipe['title']) ?></h2>
      </a>
      <p><?= e($recipe['subtitle'] ?? '') ?></p>
      <p class="servings">Serves <?= (int) $recipe['servings'] ?></p>
    </li>
  <?php endforeach; ?>
</ul>