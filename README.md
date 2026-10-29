# uxid241-wjk44

## Project Description - Cookbook

A server-side online cookbook built with PHP and MySQL for UXID241 (Scripting for IDM II) at Drexel University. It serves visitors, who can browse, search, and filter a library of recipes and can view each recipe without logging in, and admins, who log in to a password-protected area to add, edit, and delete recipes. The app will be built incrementally across the term, so these features are in progress.

## How to run locally

1. Install XAMPP (Windows/macOS/Linux) or MAMP (macOS/Windows) and start **Apache** and **MySQL**.
2. Put this repo inside the server's web folder: `htdocs` for XAMPP (e.g. `C:\xampp\htdocs` or `/Applications/XAMPP/htdocs`) or MAMP's `htdocs`.
3. Open phpMyAdmin (XAMPP: `http://localhost/phpmyadmin`; MAMP: `http://localhost:8888/phpMyAdmin/`), go to **Import**, choose `schema.sql`, and run it. This creates the `cookbook` database with its `categories`, `recipes` and `ingredients` tables and seed data.
4. Copy `inc/config-example.php` to `inc/config.php` and fill in your MySQL username, password and port (XAMPP defaults: `root`, empty password, port 3306; MAMP defaults: `root` / `root`, port 8889).
5. Open `http://localhost/uxid241-wjk44/` (MAMP: `http://localhost:8888/uxid241-wjk44/`).

## Pages

- `index.php`: home page with the search form and a link to the full recipe list.
- `recipes.php`: the list page. Shows every recipe with its subtitle, category, servings and ingredients, read from the database with mysqli.
- `recipe.php?id=N`: one full recipe (title, subtitle, photo, ingredients, and every step with its photo). Every recipe title on the list and search pages links here.
- `search.php`: search results. Matches the keyword against recipe titles, subtitles, categories and ingredient names using a prepared statement.
- `inc/`: shared code. `db.php` connects to the database, `functions.php` holds the queries, `recipe-list.php` is the list markup both pages share, and `config.php` (not committed) holds credentials.

## Database

- `categories`: one row per category (Beef, Chicken, Fish & Seafood, Pork, Turkey, Vegetarian).
- `recipes`: title, subtitle, servings, created date, and `category_id`, a foreign key to `categories.id`.
- `recipes` also stores image paths (`main_image`, `ingredients_image`) pointing into `images-renamed/`.
- `steps`: one row per step (step number, title, instructions, image path), with `recipe_id` a foreign key to `recipes.id`.
- `ingredients`: one row per ingredient line (quantity, unit, name, sort order), with `recipe_id` a foreign key to `recipes.id`.

## AI Use

- Claude (Anthropic, Claude Opus 5.5) — general consultant, answering any questions about PHP setup. Used as a guide/teacher, looking at my code and given class materials and explaining concepts/giving code examples.
- Claude (Anthropic) was used during Week 3 to draft a step-by-step guide and example code for `schema.sql`, `inc/db.php`, `inc/config-example.php`, and `recipes.php`. I typed, ran, and tested the code myself. AI-assisted blocks are marked with an "AI use" comment in the file.
- Claude (Anthropic) was used during Week 4 (alpha) to draft the three-table schema and seed data from my recipe workbook, `inc/functions.php` (JOIN and search queries), `inc/recipe-list.php`, the error handling in `inc/db.php`, and the updated `recipes.php` and `search.php`, along with a guide explaining each part. It also reviewed my finished repo against the alpha requirements, and suggested the `servings` column and a fix for non-text search input. I loaded the schema, exported it from phpMyAdmin, and tested the pages myself.
- Claude (Anthropic) was used during Week 5 to draft the `steps` table and image-path data from my recipe workbook, the `find_recipe`, `recipe_ingredients` and `recipe_steps` functions, `recipe.php`, and the recipe links in `inc/recipe-list.php`. I ran the database update, exported the schema, and tested the pages myself.
- Seed data (recipe titles, subtitles, categories, servings and ingredients) comes from the course recipe PDFs, organized in my recipe workbook.
