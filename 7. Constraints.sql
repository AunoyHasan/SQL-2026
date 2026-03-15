USE SalesRecords;

CREATE TABLE Section(
CourseID VARCHAR(8),
SectionID VARCHAR(8),
Semester ENUM('Fall', 'Spring', 'Summer'),
Studyyear DECIMAL(4, 0),
Building VARCHAR(7),
Room  VARCHAR(6),
TimeSlotID  VARCHAR(4),
PRIMARY KEY(CourseID, SectionID, Semester, StudyYear)
);

SELECT * FROM Section;

INSERT Section VALUES('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B');


CREATE TABLE Department(
DeptName VARCHAR(16),
Building VARCHAR(8),
Budget DECIMAL(8, 2),
PRIMARY KEY (DeptName)
);

INSERT Department VALUES('Computer Science', 'CS-101', 70000.5);
INSERT Department VALUES('electronics', 'EEE-102', 60000.5);
INSERT Department VALUES('Civil Eng', 'CE-103', 60000.5);
INSERT Department VALUES('BBA', 'BBA-104', 60000.5);

SELECT * FROM Department;

CREATE TABLE Instructor(
InstID VARCHAR(5),
InstName VARCHAR(20) NOT NULL,
DeptName VARCHAR(16),
Salary DECIMAL(5, 2),
PRIMARY KEY (InstID),
FOREIGN KEY (DeptName) REFERENCES Department(DeptName)
);

INSERT Instructor VALUES('Lc-01', 'Jumman', 'Computer Science', 800);
INSERT Instructor VALUES('Lc-02', 'Jessy', 'Civil Eng', 800);

-- will delete values, which are foreign keys violations
DELETE FROM Instructor WHERE DeptName = 'Computer Science';

DROP TABLE Instructor;
CREATE TABLE Instructor(
InstID VARCHAR(5),
InstName VARCHAR(20) NOT NULL,
DeptName VARCHAR(16),
Salary DECIMAL(5, 2),
PRIMARY KEY (InstID),
FOREIGN KEY (DeptName) REFERENCES Department(DeptName)
ON DELETE SET NULL
ON UPDATE CASCADE
);

INSERT Instructor VALUES
('Lc-01', 'Jumman', 'Computer Science', 800), 
('Lc-02', 'Kamman', 'Computer Science', 800),
('Lc-03', 'Lamman', 'Computer Science', 800),
('Lc-04', 'Samman', 'Computer Science', 800),
('Lc-05', 'Fannan', 'Computer Science', 800),
('Lc-05', 'Fannan', 'Computer Science', 800);

INSERT Instructor VALUES
('Lc-09', 'Elex', 'Civil Eng', 800),
('Lc-10', 'Martin', 'BBA', 800);

SELECT * FROM Instructor;