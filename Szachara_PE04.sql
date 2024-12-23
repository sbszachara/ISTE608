-- Steven Szachara
-- ISTE608 August 2024
-- PE04

-- Question 1
-- Show the title(name) and the length of films, and part of the description (LEFT side)
-- Description includes 'fun'
-- Films are less than or equal to 100 mins, AND greater than or equal to 50 mins
-- ORDER BY Length of Film descending
-- Must match column headings and output

SELECT title as Title_of_Film, length AS Length_of_Film, LEFT(description,40)
AS 'Part of Description (LEFT Side) 40 Characters'
FROM film WHERE length <= 100 AND length >= 50 AND description LIKE '%fun%'
ORDER BY length DESC;

-- Question 2
-- Show names of film (title), and length, and the right side 60 char
-- of description of the words that contains 'Database' and 'California'
-- **** PE04 question 2 ASKS FOR 60 characters yet
-- **** displayed answer is only 55 characters
-- **** Also the descriptions are different than displayed
-- **** using different words

SELECT title as 'Title of Film', length as 'Length of Film', 
RIGHT(description, 60) AS 'Part of Description (Right Side)'
FROM film WHERE description LIKE '%Database%' OR description LIKE '%California%';

-- Question 3
-- Show name(title) of films and length and film rating
-- Select the records that length >= 120 mins AND < 140 mins AND rated 'G'

SELECT title AS 'Title', length AS 'Length of Film',
rating AS 'Rating' FROM film
WHERE length >= 120 AND length < 140 AND rating = 'G';

-- Question 4
-- Show title, length, and rating
-- that have 'river' in the title
-- And either R or PG-13

SELECT title AS 'Movie Title', length as 'Length of Film',
rating AS 'Rating' FROM film
WHERE title LIKE '%river%' AND (rating = 'R' OR rating = 'PG-13');

-- Question 5
-- title, release year, and rating of movies
-- released in 2006
-- length < 55
-- AND rating is "R" or "PG-13"

SELECT title AS 'Title', length AS 'Film Length', release_year AS 'Release Year',
rating AS 'Film Rating' FROM film WHERE release_year = 2006 AND length < 55
AND (rating = 'R' OR rating = 'PG-13');

-- Question 6
-- title, replacement cost and rating of movies
-- do not have an 'a' as the second letter of the name
-- have a replacement cost of 18.99
-- ORDER BY film title desc

SELECT title AS 'Film Title', replacement_cost AS 'Replacement Cost',
rating AS 'Film Rating' FROM film
WHERE title NOT LIKE '_a%' AND replacement_cost = 18.99
ORDER BY title DESC;

-- Question 7
-- titles, and LEFT(description, 55)
-- description contains "Frisbee" AND "Fanciful"
-- **** FROM PE04, THERE ARE NO FILMS IN THE FILM TABLE
-- THAT ARE 'A FAIR RACE' AND 'STING PIE', THE PE04 RESULT DOES NOT
-- MATCH BECAUSE THE FILMS THAT ARE LISTED DON'T EXIST 
-- SEE BELOW:****

-- mysql> SELECT title FROM film WHERE title = 'A FAIR RACE';
-- --------------
-- SELECT title FROM film WHERE title = 'A FAIR RACE'
-- --------------

-- Empty set (0.00 sec)

-- mysql> SELECT title FROM film WHERE title = 'STING PIE';
-- --------------
-- SELECT title FROM film WHERE title = 'STING PIE'
-- --------------

-- Empty set (0.00 sec)

-- ****ANSWER THAT SATISFIES QUESTION 7****
SELECT title AS 'Title', LEFT(description, 55) AS 'Partial Description (LEFT)'
FROM film
WHERE description LIKE '%Frisbee%' AND description LIKE '%Fanciful%';

-- Question 8
-- Title, rating, release year and length
-- rated PG13 AND released 2006 and length < 60
-- OR
-- rated R AND length < 55
-- DESCENDING rating order

SELECT title AS 'Title', rating AS 'Rating',
release_year AS 'Release Year', length AS 'length'
FROM film
WHERE (rating = 'PG-13' AND release_year = 2006 AND length < 60)
OR (rating = 'R' AND length < 55)
ORDER BY rating DESC;

-- Question 9
-- title and length
-- start with 'a' 'h' or 'j'
-- AND length < 70
-- ORDER BY title DESC

SELECT title AS 'Title', length AS 'Length_of_Film'
FROM film
WHERE (title LIKE 'a%' OR title LIKE 'h%' OR title LIKE 'j%')
AND length < 70
ORDER BY title ASC;

-- Question 10
-- Display current date and time twice
-- first from now()
-- second date like following
-- must match sample output

SELECT NOW() AS 'today_unformatted', 
DATE_FORMAT(NOW(), '%d-%b-%Y') AS today_formatted;

-- Question 11
-- Display film_id, release year, length, rating, rental rate, rental duration
-- and first 33 chars of the title
-- with the films that have:
-- release_year greater than 2005 AND
-- length less than 100 AND
-- rating is PG AND
-- rental_rate greater than or equal to 2 AND
-- rental_durration greater than or equal to 6 AND
-- title that does not start with a W or T

SELECT film_id, release_year, length, rating, rental_rate,
rental_duration, LEFT(title, 33) AS 'Title(Part)' FROM film
WHERE
release_year > 2005 AND
length < 100 AND
rating = 'PG' AND
rental_rate >= 2 AND
rental_duration >= 6 AND
(title NOT LIKE 'W%' AND title NOT LIKE 'T%')
ORDER BY title DESC;

























