-- Steven Szacahara
-- PE10 ISTE 608
-- Fall 2024

-- 1. The goal of this question is to produce a simple select with four 
-- columns ordered by “list_price”, descending. Write a SELECT statement that 
-- returns four columns from the Products table: product_code, product_name, list_price, 
-- and discount_percent. Then, run this statement to make sure it works correctly.

SELECT product_code, product_name, list_price, discount_percent
FROM Products;

-- Add an ORDER BY clause to this statement that sorts the result set by list price 
-- in descending sequence. Then, run this statement again to make sure it works correctly. 
-- This is a good way to build and test a statement, one clause at a time.

SELECT product_code, product_name, list_price, discount_percent
FROM Products
ORDER BY list_price DESC;

-- 2. The goal of this question is to concatenate two columns into one as an ALIAS ordered by 
-- “last_name”, ascending. Only customers with “last_name” starting with M to Z should be shown.
-- Write a SELECT statement that returns one column from the Customers table named full_name that 
-- joins the last_name and first_name columns.Format this column with the last name, a comma, 
-- a space, and the first name like this:
-- Doe, John
-- Sort the result set by last name in ascending sequence. Return only the customers whose last 
-- name begins with letters from M to Z.

SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM Customers
WHERE last_name REGEXP "^[M-Z]"
ORDER BY last_name ASC;

-- 3. The goal of this question is to produce a select with three columns where the list 
-- price is between 500 and 2000 (not inclusive) ordered by “date_added” descending.
-- Write a SELECT statement that returns these columns from the Products table:
-- product_name	The product_name column
-- list_price	The list_price column
-- date_added	The date_added column
-- Return only the rows with a list price that’s greater than 500 and less than 2000.
-- Sort the result set in descending sequence by the date_added column.

SELECT product_name, list_price, date_added
FROM Products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

-- 4. The goal of this question is to select five columns, CALCULATE two of them into a 
-- single column using an ALIAS, use that ALIAS to CALCULATE another column, and display 
-- only the first 5 rows ordered by “discount_price” descending. The SELECT used with an 
-- ALIAS is to save time when performing the math. You will NOT get full credit for this 
-- question if you compute “discount_amount twice”! Write a SELECT statement that returns 
-- these column names and data from the Products table:
-- product_name	The product_name column
-- list_price	The list_price column
-- discount_percent	The discount_percent column
-- discount_amount	A column that’s calculated from the previous two columns
-- discount_price	A column that’s calculated from the previous three columns
-- Round the discount_amount and discount_price columns to 2 decimal places.
-- Sort the result set by discount price in descending sequence.
-- Use the LIMIT clause so the result set contains only the first 5 rows.

SELECT 
    product_name, 
    list_price, 
    discount_percent, 
    ROUND(list_price * discount_percent / 100, 2) AS discount_amount, 
    ROUND((list_price - (SELECT discount_amount)), 2) AS discount_price
FROM Products
ORDER BY discount_price DESC
LIMIT 5;

-- 5. The goal of this question is to select seven columns and return only the rows HAVING an 
-- “item_total” greater than 500 ordered by “item_total” descending. In this question, 
-- you must use the word HAVING and an ALIAS. HAVING has two purposes: In this question, 
-- the purpose of HAVING is to substitute for the WHERE clause. The reason for that is that the 
-- WHERE clause cannot have an ALIAS. Professor Habermas will clearly lecture on how HAVING is 
-- different from WHERE in the next two weeks. In MySQL, physically where you place the HAVING, 
-- changes the meaning of the word HAVING. Write a SELECT statement that returns these column 
-- names and data from the Order_Items table:
-- item_id	The item_id column
-- item_price	The item_price column
-- discount_amount	The discount_amount column
-- quantity	The quantity column
-- price_total	A column that’s calculated by multiplying the item price by the quantity
-- discount_total	A column that’s calculated by multiplying the discount amount by the quantity
-- item_total	A column that’s calculated by subtracting the discount amount from the item price and then multiplying by the quantity
-- Only return rows where the item_total is greater than 500.
-- Sort the result set by item total in descending sequence.

SELECT 
    item_id,
    item_price,
    discount_amount,
    quantity,
    item_price * quantity AS price_total,
    discount_amount * quantity AS discount_total,
    (item_price - discount_amount) * quantity AS item_total
FROM Order_Items
HAVING item_total > 500
ORDER BY item_total DESC;

-- 6. The goal of this question is to select three columns and return only the rows where 
-- “ship_date” contains a NULL value.
-- Write a SELECT statement that returns these columns from the Orders table:
-- order_id	The order_id column
-- order_date	The order_date column
-- ship_date	The ship_date column
-- Return only the rows where the ship_date column contains a null value.

SELECT 
    order_id, 
    order_date, 
    ship_date
FROM Orders
WHERE ship_date IS NULL;

-- 7.The goal of this question is to produce a select with the NOW() function. 
-- You will have two columns: One called “today_unformatted” and one called “today_formatted”.
-- Write a SELECT statement without a FROM clause that uses the NOW function to create a row 
-- with these columns:
-- today_unformatted	The NOW function unformatted
-- today_formatted	The NOW function in this format: DD-Mon-YYYY
-- This displays a number for the day, an abbreviation for the month, and a four-digit year.

SELECT 
    NOW() AS today_unformatted, 
    DATE_FORMAT(NOW(), '%d-%b-%Y') AS today_formatted;

-- 8. The goal of this question is to produce a select with four columns. You will have 
-- to perform two CALCULATIONS using some of the columns. This requires an ALIAS 
-- (similar to question 4). Write a SELECT statement without a FROM clause that creates 
-- a row with these columns: price	100 (dollars)
-- tax_rate	.07 (7 percent)
-- tax_amount	The price multiplied by the tax
-- total	The price plus the tax
-- To calculate the fourth column, add the expressions 
-- you used for the first and third columns.

SELECT 
    100 AS price, 
    0.07 AS tax_rate, 
    (SELECT price * tax_rate) AS tax_amount, 
    (SELECT price + tax_amount) AS total;

-- Please note: Any time you JOIN tables, you must also use the USING or ON keyword to join them properly!

-- 9. The goal of this question is to produce a select that joins two tables together and returns three columns. 
-- You will then order the output by both the “category_name” and “product_name”. Write a SELECT statement that joins 
-- the Categories table to the Products table and returns these columns: category_name, product_name, list_price.
-- Sort the result set by category_name and then by product_name in ascending sequence.

SELECT 
    c.category_name, 
    p.product_name, 
    p.list_price
FROM 
    Categories c
JOIN 
    Products p USING (category_id)
ORDER BY 
    c.category_name ASC, 
    p.product_name ASC;

-- 10. The goal of this question is to produce a select that joins two tables and returns six columns. 
-- It must return one row for each address where the email address is “allan.sherwood@yahoo.com”.
-- Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: 
-- first_name, last_name, line1, city, state, zip_code.
-- Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.

SELECT 
    first_name, 
    last_name, 
    line1, 
    city, 
    state, 
    zip_code
FROM 
    Customers
JOIN 
    Addresses USING (customer_id)
WHERE 
    email_address = 'allan.sherwood@yahoo.com';

-- 11. The goal of this question is to produce a select that joins two tables and returns six columns. 
-- It must return one row for each customer, but only return addresses that are also the “shipping_address” for a customer.
-- Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, 
-- last_name, line1, city, state, zip_code. Return one row for each customer, but only return addresses that are the shipping address for a customer.

SELECT 
    first_name, 
    last_name, 
    line1, 
    city, 
    state, 
    zip_code
FROM 
    Customers
JOIN 
    Addresses USING (customer_id)
WHERE 
    shipping_address_id = address_id;

-- 12. The goal of this question is to produce a select that joins four tables and returns seven columns. 
-- You must use ALIASES for the tables! The output will then be ordered by “Last_name”, “order_date”, and “product_name”.
-- Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. This statement should 
-- return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
-- Use aliases for the tables.
-- Sort the final result set by last_name, order_date, and product_name.

SELECT 
    c.last_name, 
    c.first_name, 
    o.order_date, 
    p.product_name, 
    oi.item_price, 
    oi.discount_amount, 
    oi.quantity
FROM 
    Customers c
JOIN 
    Orders o USING (customer_id)
JOIN 
    Order_Items oi USING (order_id)
JOIN 
    Products p USING (product_id)
ORDER BY 
    c.last_name, 
    o.order_date, 
    p.product_name;

-- 13.The goal of this question is to produce a select that returns the “product_name” and “list_price”. 
-- It must return one row for each product that has the same “list_price” as another product (this is called a self-join).
-- Write a SELECT statement that returns the product_name and list_price columns from the Products table.
-- Return one row for each product that has the same list price as another product.Hint: Use a self-join to check that 
-- the product_id columns aren’t equal but the list_price columns are equal.
-- Sort the result set by product_name.

SELECT 
    p1.product_name, 
    p1.list_price
FROM 
    Products p1
JOIN 
    Products p2 USING (list_price)
WHERE 
    p1.product_id != p2.product_id
ORDER BY 
    p1.product_name;

-- 14. The goal of this question is to produce a select that returns two columns. It must return 
-- one row where the “product_id” contains a NULL value. Write a SELECT statement that returns 
-- these two columns: 
-- category_name	The category_name column from the Categories table
-- product_id	The product_id column from the Products table
-- Return one row for each category that has never been used. Hint: Use an outer join and only 
-- return rows where the product_id column contains a null value

SELECT 
    c.category_name, 
    p.product_id
FROM 
    Categories c
LEFT OUTER JOIN 
    Products p USING (category_id)
WHERE 
    p.product_id IS NULL;


