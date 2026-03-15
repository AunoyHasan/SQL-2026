USE UniversityDB;

-- GROUPE BY
# Find the name and average instructor salry for each department
SELECT DeptName, AVG(Salary)
FROM Instructor
GROUP BY DeptName;

SELECT 

-- HAVING 
-- Find the name and average salary for those departments whose average salary  is greater than 65000
SELECT DeptName, AVG(Salary) AS AverageSalary
FROM Instructor
GROUP BY DeptName
HAVING AVG(Salary)>65000;
-- Here we use GROUP BY because HAVING fucntion works in group

-- Here we will get error, because wehre works each row. so we can not use WHEERE clause for aggregate funciton
SELECT DeptName, AVG(Salary)
FROM Instructor
GROUP BY DeptName
WHERE AVG(Salary)>65000;

# Subquereis 
-- Scaler subquery: if a subquery returns 1X1 relation
SELECT InstName, Salary
FROM instructor
WHERE Salary > (SELECT AVG(Salary) FROM Instructor);

