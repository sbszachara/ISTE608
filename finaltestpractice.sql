1.
SELECT LastName, FirstName, GPA
FROM
Students
WHERE GPD >= 3.5;

2.
SELECT CourseName
FROM
Courses
WHERE Department = "Computer Science" AND Credits > 3;

3.
SELECT Courses.CourseName, COUNT(Enrollments.StudentID)
FROM
Courses
JOIN
Enrollments
USING(CourseID)
GROUP BY Courses.CourseName;

4.
SELECT Students.Major, AVG(Students.GPA) as "Average"
FROM
Students
GROUP BY Students.Major
HAVING AVG(Students.GPA) > 3;

5.
SELECT Students.LastName, Students.FirstName
FROM
Students
JOIN
Enrollments
USING(StudentID)
JOIN
Courses
USING(CourseID)
HAVING COUNT(Courses.Department = "Mathematics") >=1;

CORRECTED:
SELECT DISTINCT Students.LastName, Students.FirstName
FROM Students
JOIN Enrollments USING(StudentID)
JOIN Courses USING(CourseID)
WHERE Courses.Department = "Mathematics";


SELECT Students.StudentID, Students.LastName, Students.FirstName
FROM Students
JOIN Enrollments USING(StudentID)
GROUP BY Students.StudentID, Students.LastName, Students.FirstName
HAVING COUNT(Enrollments.CourseID) <= 2;

SELECT Courses.CourseName, CONCAT(Students.LastName, ", ", Students.FirstName) AS "Student Name", Enrollments.Grade
FROM
Enrollments
JOIN
Courses USING(CourseID)
JOIN
Students USING(StudentID)
WHERE Enrollments.Grade = 'A';

SELECT CONCAT(Students.LastName, ", ", Students.FirstName) AS "Student Name"
FROM Students
WHERE Students.StudentID NOT IN (
    SELECT Enrollments.StudentID
    FROM Enrollments
);

SELECT Courses.CourseName, AVG(Enrollments.Grade)
FROM
Courses
JOIN
Enrollments USING(Courses.CourseID)
GROUP BY
Courses.CourseName, Enrollments.Grade;


SELECT Courses.Department, CONCAT(Students.LastName, ", ", Students.FirstName) AS "Student Name"
FROM Students
JOIN
Enrollments USING(StudentID)
JOIN
Courses USING(CourseID)
WHERE Students.GPA = (
	SELECT MAX(Students.GPA)
	FROM STUDENTS;
);



Question 1: Write a SELECT query to list the full names of all borrowers who have checked out the book titled "Learning SQL".

SELECT CONCAT(Borrowers.FirstName, " ", Borrowers.LastName)
FROM
Borrowers
JOIN
Transactions USING(BorrowerID)
JOIN
Books USING(BookID)
WHERE Books.Title = "Learning SQL";

Question 2: Write a SELECT query to display all book titles that were published after 2018.

SELECT Title AS "Book Title"
FROM Books
Where PublicationYear > 2018;

Question 3: Write a SELECT query to show the number of books checked out by each borrower. Only include borrowers who have checked out more than one book.

SELECT CONCAT(Borrowers.FirstName, " ", Borrowers.LastName) AS "Borrower Name", COUNT(Transactions.TransactionID) AS "Book Count"
FROM
Borrowers
JOIN
Transactions USING(BorrowerID)
GROUP BY
Borrowers.FirstName, Borrowers.LastName, Transactions.TransactionID
HAVING COUNT(Transactions.TransactionID) > 1;

Question 4: Write a SELECT query to display the authors' names and the number of books each author has written.

SELECT CONCAT(Authors.FirstName, " ", Authors.LastName) AS Author Name, COUNT(Books.BookID) AS "Book Count"
FROM
Authors
JOIN
Books USING(AuthorID);


Question 5: Write a SELECT query to list all books currently checked out, including the borrower name and book title.

SELECT CONCAT(Borrowers.FirstName, " ", Borrowers.LastName) AS "Borrower Name",
Book.Title AS "Book Title"
FROM
Borrowers
JOIN
Transactions USING(Borrowers.BorrowerID);


