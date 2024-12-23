-- Steven Szachara
-- HW05 Fall 2024 ISTE 608

-- 1. Current Date and Time
SELECT CURRENT_TIMESTAMP;


-- 2. UNION statment following two queries together using the UNION keyword
-- a. Show companyname, division, and listing for interviews WHERE listing was posted 'y'
-- b. show the companyname, division, and listing for those interview where a listing was
-- not posted indicated by 'n'

SELECT companyname, division, listing 
FROM interview 
WHERE listing IN ('n')

UNION

SELECT companyname, division, listing 
FROM interview 
WHERE listing IN ('y');


-- 3. Write a SQL INNER JOIN statement that will accomplish an 
-- intersection between the employer and the interview tables. 
-- Display the companyname, division, and statecode attributes
-- from the employer table. (Hint: Make sure you are joining 
-- on the ENTIRE PRIMARY key/foreign key relationship.)

SELECT employer.companyname, employer.division, employer.statecode
FROM employer

INNER JOIN

interview

USING (companyname, division);


-- 4. Write a SQL statement that accomplishes a 
-- difference between the state and employer tables (STATE-EMPLOYER).

SELECT statecode, description
FROM state

WHERE NOT EXISTS
(
	SELECT statecode FROM employer WHERE employer.statecode = state.statecode
);


-- 5. Write a SQL statement that does a projection of the location 
-- and qtrcode attributes of the quarter table.

SELECT DISTINCT

location, qtrcode

FROM
quarter;


-- 6. Write a SQL statement that does a selection from the 
-- quarter table showing the quarters 20201 and 20204 only. 
-- Please use the IN operator

SELECT qtrCode, location, minSal, minHrs 
FROM quarter
WHERE qtrCode IN ('20201', '20204');


-- 7. Write a SQL statement that will show the companyname, 
-- statecode, and full state name for each employer.

SELECT employer.companyname, employer.statecode, state.description
FROM employer

INNER JOIN

state

USING(statecode);


-- 8. Write a SQL statement that will show the descriptions for 
-- ALL states as well as the companynames of employers located each state.

SELECT state.description, employer.companyname
from state

LEFT JOIN

employer

USING(statecode);


-- 9. You noticed an inconsistency in the employer table. 
-- Change all the records with the company name 
-- "Rochester Application Software" to "Rochester Software Design".
-- You must use an UPDATE command to accomplish this task.

UPDATE employer
SET companyname = "Rochester Software Design"
WHERE companyname = "Rochester Application Software";


-- After the above change has been completed with an UPDATE command, 
-- write a query that displays the companyname, division, 
-- address and zipcode that have the company name 
-- LIKE "Rochester Software Design" OR a company 
-- name that starts with “S”. Please match the 
-- column headings of the sample output below.

SELECT companyname AS 'Company Name', division AS 'Division', 
CONCAT(address, ', ', zipcode) AS 'Address & Zip'
FROM employer

WHERE companyname = "Rochester Software Design"
	OR companyname LIKE "S%";



