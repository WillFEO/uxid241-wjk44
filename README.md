# uxid241-wjk44

## Project Description - Cookbook

A server-side online cookbook built with PHP and MySQL for UXID241 (Scripting for IDM II) at Drexel University. As of the beta, visitors can browse all 40 recipes, search them by keyword, and open any recipe to see its ingredients and step-by-step photos, all without logging in. Admins log in to a session-protected area where they can add, edit, and delete recipes. Every database query that uses visitor or admin input goes through a prepared statement, passwords are stored only as `password_hash` hashes, and everything printed to the page is escaped with `htmlspecialchars`. The finished, polished site is the week 10 final.

## How to run locally

1. Install XAMPP (Windows/macOS/Linux) or MAMP (macOS/Windows) and start **Apache** and **MySQL**.
2. Put this repo inside the server's web folder: `htdocs` for XAMPP (e.g. `C:\xampp\htdocs` or `/Applications/XAMPP/htdocs`) or MAMP's `htdocs`.
3. Open phpMyAdmin (XAMPP: `http://localhost/phpmyadmin`; MAMP: `http://localhost:8888/phpMyAdmin/`), go to **Import**, choose `schema.sql`, and run it. This creates the `cookbook` database with its `categories`, `recipes`, `ingredients`, `steps` and `users` tables and seed data. No accounts are seeded; see **Admin login** below.
4. Copy `inc/config-example.php` to `inc/config.php` and fill in your MySQL username, password and port (XAMPP defaults: `root`, empty password, port 3306; MAMP defaults: `root` / `root`, port 8889).
5. Open `http://localhost/uxid241-wjk44/` (MAMP: `http://localhost:8888/uxid241-wjk44/`).

## Admin login

There is no seeded admin account. Registration is open:

1. Go to `log-in.php` (or click **Log In or Register Here** on the home page).
2. In the **Register** form, enter any valid email address and a password of at least 8 characters, then click **Register**.
3. Log in with the same email and password in the **Log In** form. You land on `admin.php`.

Any registered account can use the admin area. Logged-out visitors who open `admin.php` or `edit-recipe.php` are redirected to `log-in.php`.

## Feature built: Search

Type a keyword into the search box on the home page (or go to `search.php?q=chicken`). The search matches the keyword against recipe titles, subtitles, category names and ingredient names, using a prepared statement with `LIKE` parameters, and shows the matching recipes as cards. Each card links to the full recipe.

## Pages

- `index.php`: home page with the search form and a link to the full recipe list.
- `recipes.php`: the list page. Shows every recipe with its subtitle, category, servings and ingredients, read from the database with mysqli.
- `recipe.php?id=N`: one full recipe (title, subtitle, photo, ingredients, and every step with its photo). Every recipe title on the list and search pages links here.
- `search.php`: search results. Matches the keyword against recipe titles, subtitles, categories and ingredient names using a prepared statement.
- `log-in.php`: log in and register forms. Login looks the user up by email with a prepared statement, checks the password with `password_verify`, then calls `session_regenerate_id(true)` and stores the user's id in `$_SESSION`. Register saves the email and a `password_hash` result (never the plain password).
- `admin.php`: the admin area (session-protected). Shows who is signed in, a **create recipe** form (title, optional subtitle, category dropdown, servings 1 to 12, all validated on the server before a prepared `INSERT`), and a list of every recipe with **Edit** and **Delete** buttons. Delete is a POST form with a confirm prompt; it removes the recipe's ingredients and steps, then the recipe, each with a prepared `DELETE ... WHERE ... = ?`.
- `edit-recipe.php?id=N`: edit one recipe (session-protected). The form is pre-filled from the database, uses the same validation as create, and saves with a prepared `UPDATE ... WHERE id = ?`. An unknown id returns a 404.
- `log-out.php`: clears and destroys the session, then returns to the home page.
- `inc/`: shared code. `db.php` connects to the database, `functions.php` holds the queries plus the shared form helpers (`post_value`, `read_recipe_form`, `validate_recipe`), `recipe-list.php` is the list markup both pages share, `require-login.php` is the guard that sends anyone not logged in to `log-in.php`, and `config.php` (not committed) holds credentials.

## Database

- `categories`: one row per category (Beef, Chicken, Fish & Seafood, Pork, Turkey, Vegetarian).
- `recipes`: title, subtitle, servings, created date, and `category_id`, a foreign key to `categories.id`.
- `recipes` also stores image paths (`main_image`, `ingredients_image`) pointing into `images-renamed/`.
- `steps`: one row per step (step number, title, instructions, image path), with `recipe_id` a foreign key to `recipes.id`.
- `ingredients`: one row per ingredient line (quantity, unit, name, sort order), with `recipe_id` a foreign key to `recipes.id`.
- `users`: one row per account (unique email, `password_hash`, created date). Passwords are stored only as a `password_hash` result.

## AI Use

- Claude (Anthropic, Claude Opus 5.5) — general consultant, answering any questions about PHP setup. Used as a guide/teacher, looking at my code and given class materials and explaining concepts/giving code examples.
- Claude (Anthropic) was used during Week 3 to draft a step-by-step guide and example code for `schema.sql`, `inc/db.php`, `inc/config-example.php`, and `recipes.php`. I typed, ran, and tested the code myself. AI-assisted blocks are marked with an "AI use" comment in the file.
- Claude (Anthropic) was used during Week 4 (alpha) to draft the three-table schema and seed data from my recipe workbook, `inc/functions.php` (JOIN and search queries), `inc/recipe-list.php`, the error handling in `inc/db.php`, and the updated `recipes.php` and `search.php`, along with a guide explaining each part. It also reviewed my finished repo against the alpha requirements, and suggested the `servings` column and a fix for non-text search input. I loaded the schema, exported it from phpMyAdmin, and tested the pages myself.
- Claude (Anthropic) was used during Week 5 to draft the `steps` table and image-path data from my recipe workbook, the `find_recipe`, `recipe_ingredients` and `recipe_steps` functions, `recipe.php`, and the recipe links in `inc/recipe-list.php`. I ran the database update, exported the schema, and tested the pages myself.
- Claude (Anthropic) was used during Week 6 as a guide while I wrote the login, registration, admin and logout pages myself: it explained the lecture concepts, reviewed my code against the lecture and pointed out bugs to fix. It also wrote the form and message styles in `css/style.css` (marked with an "AI use" comment) and this README update.
- Claude (Anthropic) was used during Week 7 (beta) as a guide while I wrote the create, edit and delete features myself: it broke the work into steps, explained concepts (validation, Post/Redirect/Get, array destructuring, deleting child rows before the recipe), reviewed my code and pointed out bugs. It suggested the category dropdown, the POST delete form, the insert/redirect pattern and the category check in `validate_recipe()` (each marked with an "AI use" comment), wrote the admin list and dropdown styles in `css/style.css`, and drafted this README update.
- Seed data (recipe titles, subtitles, categories, servings and ingredients) comes from the course recipe PDFs, organized in my recipe workbook.
