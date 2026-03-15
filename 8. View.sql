USE UniversityDB;

CREATE VIEW Faculty AS 
SELECT InstID, InstName, DeptName FROM Instructor
WHERE DeptName NOT IN ('Finance', 'Music');

SELECT * FROM Faculty;

CREATE VIEW DepartmentSalary AS
SELECT DeptName, SUM(Salary) AS DepartmentSalary
FROM Instructor GROUP BY DeptName;

SELECT * FROM DepartmentSalary;

