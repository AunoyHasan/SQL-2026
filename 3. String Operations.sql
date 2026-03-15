USE UniversityDB;

-- Pattern Matching using LIKE
-- Find the names of instructors whose name includes the  substring "ri"
SELECT InstName FROM Instructor
WHERE InstName LIKE '%ri%';

-- NULL value
-- Find all instructors salary whose salary is unknown
SELECT InstName, Salary
FROM Instructor
WHERE Salary IS NULL;

-- Adding using CONCATE
SET @TeachingHistory = CONCAT('CS-101', ',', 'CS-102', ',', 'CS-103'); # @ means, defining a varialbe like TeachingHistory
SELECT @TeachingHistory;

/*
Aggregate Functions
AVG(A)
MIN(A)
MAX(A)
SUM(A)
COUNT(A)
*/
SELECT AVG(Salary), MIN(Salary), MAX(Salary), SUM(Salary), COUNT(Salary) AS TotalInstructor
FROM Instructor;

-- COUNT(*): counts the number of rows in a relation/table. It does not ignore NULL values
SELECT COUNT(*) FROM Course;

-- Aggregate Functions ignores NULL Value
SELECT * FROM Instructor;

-- Aggregate functions take duplicate values
SELECT AVG(Salary) AS AvgSalaY
FROM Instructor
WHERE DeptName = 'Comp.Sci';

-- To ignore duplicate values, use DISTINCT keyword
-- Find the total number of instructors who teach a course in the Spring 2010 semester
SELECT COUNT(DISTINCT InstID) 
FROM Teaches
WHERE Semester = 'Spring' AND StudyYear = 2010;

-- Without using DISTINCT keyword
SELECT COUNT(InstID) 
FROM Teaches
WHERE Semester = 'Spring' AND StudyYear = 2010;

