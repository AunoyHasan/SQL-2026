USE UniversityDB;

# Set membership conditions: IN and NOT IN 
-- IN and NOT IN can be used in WHERE and HAVING clauses for making conditons.
# select the name of instructors whose name is neither Mozart and Einstein
SELECT InstName 
FROM Instructor
WHERE InstName NOT IN('Mozart', 'Einstein');

# find courses offered both in Fall 2009 and in Spring 2010
SELECT DISTINCT CourseID FROM Section
WHERE Semester='Fall' AND StudyYear=2009
AND CourseID IN 
(SELECT CourseID FROM Section WHERE Semester='Spring' AND StudyYear=2010)


# Conditions using ALL and SOME
-- SOME
# Find names of Instructors with salary greater than that of some (at least one) instructor in the Finance Department
SELECT InstName 
FROM Instructor
WHERE Salary > SOME(SELECT Salary FROM Instructor WHERE DeptName = 'Finance'); 

-- ALL Condition
# Find names of Instructors with salary greater than that of all instructor in the Finance Department
SELECT InstName 
FROM Instructor
WHERE Salary > ALL(SELECT Salary FROM Instructor WHERE DeptName = 'Finance'); 

-- Condition using  EXISTS and NOT EXISTS for checking empty or not empty 
# Find all courses taught in both Fall 2009 semester and in the Spring 2010 Semester
SELECT CourseID From Section AS S
WHERE Semester='Fall' AND StudyYear=2009 AND 
EXISTS (SELECT * FROM Section AS T WHERE Semester='Spring' AND StudyYear=2010 AND S.CourseID = T.CourseID);

# Compound Queries using UNION, INTERSECT and EXCEPT
-- Find courses offered in Fall 2009 OR Spring 2010
(SELECT CourseID FROM Section WHERE Semester='Fall' AND StudyYear=2009)
UNION
(SELECT CourseID FROM Section WHERE Semester='Spring' AND StudyYear=2010);

-- Find courses offered in Fall 2009 AND Spring 2010
(SELECT CourseID FROM Section WHERE Semester='Fall' AND StudyYear=2009)
INTERSECT
(SELECT CourseID FROM Section WHERE Semester='Spring' AND StudyYear=2010);

# can be used also using IN 
SELECT CourseID 
FROM Section 
WHERE Semester='Fall' 
AND StudyYear=2009 
AND CourseID IN (SELECT CourseID FROM Section WHERE Semester='Spring' AND StudyYear=2010);

# Find all courses offered in Fall 2009 but not in Spring 2010
(SELECT CourseID FROM Section WHERE Semester='Fall' AND StudyYear=2009)
EXCEPT 
(SELECT CourseID FROM Section WHERE Semester='Spring' AND StudyYear=2010)

-- can be done using NOI IN
SELECT CourseID 
FROM Section 
WHERE Semester='Fall' AND StudyYear=2009 AND
CourseID NOT IN (SELECT CourseID FROM Section WHERE Semester='Spring' AND StudyYear=2010)
