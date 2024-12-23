-- Szachara, Steven
-- HW# 06
-- 10/29/2024
-- Professor: Habermas, James

-- Query 1: Write a select statement that will display the current date
-- and time.

SELECT NOW();

-- Query 2: Write a SQL statement that will show the title for each book
-- and its category description (sports,romance, etc). Sort the results 
-- first by category description in descending order, followed by title
-- in ascending order

SELECT book.title, category.catdescription

FROM book

INNER JOIN category ON book.category = category.catid

ORDER BY category.catdescription DESC, book.title ASC;

-- Query 3: List the book titles and their ratings for all reviewers 
-- who do not work for a newspaper or any other news organization. 
-- A reviewer is employed by a newspaper, or other news organization, 
-- if their “Employed By” field contains a value.

SELECT reviewer.name, book.title, bookreview.rating

FROM book

INNER JOIN bookreview ON book.ISBN = bookreview.ISBN

INNER JOIN reviewer ON reviewer.reviewerid = bookreview.ReviewerID

WHERE reviewer.employedby IS NULL;

-- Query 4: For each book, show the title and the lastname and firstname
--  for the author(s) of the book. The results should be sorted by book 
-- title in A-Z order, followed by author lastname in A-Z order.

SELECT book.title, author.lastname, author.firstname

FROM book

INNER JOIN bookauthor on book.ISBN = bookauthor.ISBN

INNER JOIN author on author.authorID = bookauthor.authorID

ORDER BY book.title ASC, author.lastname ASC;

-- Query 5: What are the titles, author’s names, and prices for pre-owned 
-- books that are priced at $50.00 or below? Results should be sorted by 
-- price in descending order, followed by title in A-Z order.

SELECT book.title, author.lastname, author.firstname, ownersbook.price

FROM book

INNER JOIN bookauthor on book.ISBN = bookauthor.ISBN

INNER JOIN author on author.authorID = bookauthor.authorID

INNER JOIN ownersbook ON book.ISBN = ownersbook.ISBN

WHERE ownersbook.price <= 50.00

ORDER BY ownersbook.price DESC, book.title ASC;


-- Query 6: Show the titles of ALL books and if the book had a reviewer 
-- show the name of the reviewer(s)

SELECT book.title, reviewer.name

FROM book

LEFT JOIN bookreview ON book.ISBN = bookreview.ISBN

LEFT JOIN reviewer ON reviewer.reviewerID = bookreview.reviewerID;


-- Query 7: Write a subquery that will display the ISBN and title 
-- of book that have a category that starts with the letter ‘S’

SELECT book.ISBN, book.title

FROM book

INNER JOIN category ON book.category = category.catID

WHERE category.catdescription LIKE 'S%';

-- Query 8: Write a SELECT statement that will display the OwnerID, 
-- book title, and the owners last name and first name in the format 
-- of (Lastname, FirstName). This query should display the records 
-- in descending order of OwnerID. Please match the column headings 
-- provided in the output below

SELECT ownersbook.ownerid AS "Owner's ID", book.title AS "Book Title",
GROUP_CONCAT(owner.lastname, ", ", owner.firstname) AS "Owner"

FROM book

INNER JOIN ownersbook ON ownersbook.ISBN = book.ISBN

INNER JOIN owner ON owner.ownerid = ownersbook.ownerid

GROUP BY ownersbook.ownerid, book.title

ORDER BY ownersbook.ownerid DESC;


