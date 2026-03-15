-- Creating Employee tables for running DML Operations like Insert, Delete and Update
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
HireDate DATE,
Salary DECIMAL(6, 2)
);

DROP TABLE Employees;

-- Insert Operation
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary) VALUES (1001, 'Alice', 'Jenn', '2023-01-15', 1000.50);
INSERT INTO Employees VALUES (1002, 'John', 'Cena', '2022-03-15', 1000.50);


INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary) 
VALUES 
(103, 'Bob', 'Jones', '2023-03-22', 6200.00),
(104, 'Charlie', 'Brown', '2023-05-10', 5800.00);

INSERT INTO Employees 
VALUES 
(1003, 'Bob', 'Jones', '2023-03-22', 6200.00),
(1004, 'Charlie', 'Brown', '2023-05-10', 5800.00);

SELECT * FROM Employees;

-- UPDATE Operation
UPDATE Employees
SET Salary = 8000.00
WHERE EmployeeID = 1004;

SELECT * FROM Employees;

-- DELETE Operation
DELETE FROM Employees 
WHERE EmployeeID = 103;

DELETE FROM Employees 
WHERE EmployeeID = 103;

DELETE FROM Employees 
WHERE EmployeeID = 104;

SELECT * FROM Employees;
