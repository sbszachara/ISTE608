-- Szachara, Steven
-- PE08
-- Fall 2024
-- ISTE 608

-- PE#8 - Question 1 
-- Mom is concerned that you’re not going to be able 
-- to cook traditional family meals. Show her that
-- you have lots of her recipes stored in your database. 
-- Please match the following output

SELECT name AS "Recipe Name" FROM recipe WHERE source = "Mom";

-- -- PE#8 - Question 2
-- You’ve invited friends for dinner, but they’re on a diet. 
-- Find recipe names that have fewer than 800
-- calories per serving. Please match the following output.

SELECT recipe.name FROM recipe 
INNER JOIN nutrition USING(recipeID) 
WHERE nutrition.unit = "calories" AND nutrition.quantity < 800;

-- PE#8 - Question 3
-- You’re going to serve Beef Parmesan for dinner. Create
-- a shopping list (item and quantity) of ingredients. 
-- Organize the rows of your output in Ingredient Name 
-- descending order. Please match EXACTLY the following sample output.

SELECT ingredients.name AS "Ingredient Name", 
ingredientlist.quantity AS "QTY"
FROM recipe
JOIN ingredientlist ON recipe.recipeid = ingredientlist.recipeid
JOIN ingredients ON 
ingredientlist.ingredientid = ingredients.ingredientid
WHERE recipe.name LIKE 'Beef Parmesan%'
ORDER BY ingredients.name DESC;

-- PE#8 - Question 4
-- You’ve invited friends for dinner, but they’re vegetarian. 
-- Find recipes that do not use beef, pork, chicken, or lamb. 
-- Organize your output by recipe name in descending order. 

SELECT DISTINCT recipe.name
FROM recipe WHERE recipe.recipeid 
NOT IN (
	SELECT recipe.recipeid FROM recipe
	JOIN ingredientlist ON recipe.recipeid = ingredientlist.recipeid
	JOIN ingredients ON
	ingredientlist.ingredientid = ingredients.ingredientid
	WHERE ingredients.type IN('beef', 'chicken', 'lamb')
)
ORDER BY recipe.name DESC;

-- PE#8 - Question 5
-- You feel like eating Beef or Chicken. Find the names of your 
-- beef and chicken recipes that have fewer than 1200 calories 
-- per serving. Please match the output below

SELECT recipe.name as "Recipe_Name",
nutrition.quantity as "QTY",
nutrition.unit as "calories"
FROM recipe
INNER JOIN nutrition USING(recipeID)
JOIN ingredientlist ON recipe.recipeid = ingredientlist.recipeid
JOIN ingredients ON
ingredientlist.ingredientid = ingredients.ingredientid

WHERE nutrition.unit = "calories"
AND ingredients.type IN('beef', 'chicken')
AND nutrition.quantity < 1200;

-- PE#8 - Question 6
-- Find all recipe names that start with “A” or “B” or “C” 
-- and the quantity of calories that are stored in
-- your recipes database. Organize your rows by the names 
-- of the recipes in ascending order. Please match the output 
-- below including the column headings.

SELECT recipe.name AS "Recipe_Name",
nutrition.quantity AS "QTY",
nutrition.unit AS "Nutrition_Name"
FROM recipe
INNER JOIN nutrition USING(recipeID)
WHERE nutrition.unit = "calories"
AND (recipe.name LIKE "A%" 
	OR recipe.name LIKE "B%"
	OR recipe.name LIKE "C%")
AND nutrition.unit = "calories"
ORDER BY recipe.name;






