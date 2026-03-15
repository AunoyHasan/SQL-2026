# INNER JOIN = Cartesian Product
SELECT * FROM Course, PreReq LIMIT 7;

# Natual Inner join do not use cartesial product
SELECT * FROM Course NATURAL JOIN PreReq LIMIT 7;

# Outer JOINS
-- LEFT OUTER JOIN: Prevents the rows in the left table 
SELECT * FROM Course NATURAL LEFT OUTER JOIN PreReq LIMIT 7;

-- RIGHT OUTER JOIN: Prevents the rows in the right table
SELECT * FROM Course NATURAL RIGHT OUTER JOIN PreReq LIMIT 7;

-- FULL OUTER JOIN: Prvents the rows in both tables
SELECT * FROM Course NATURAL FULL OUTER JOIN PreReq LIMIT 7;
-- MariaDB does not support the  FULL OUTER JOIN
-- use UNION instead
(SELECT * FROM Course NATURAL LEFT OUTER JOIN  PreReq LIMIT 7)
UNION
(SELECT * FROM Course NATURAL RIGHT OUTER JOIN PreReq LIMIT 7);


-- JOINS use by USING
SELECT * FROM Course JOIN  PreReq USING (CourseID);
SELECT * FROM Course NATURAL JOIN PreReq;

SELECT * FROM Course RIGHT OUTER JOIN PreReq USING (CourseID);
SELECT * FROM Course NATURAL RIGHT OUTER JOIN PreReq;

-- JOIN using ON
SELECT * FROM Course JOIN PreReq ON Course.CourseID = PreReq.CourseID;
SELECT * FROM Course JOIN PreReq WHERE Course.CourseID = PreReq.CourseID;

SELECT * FROM Course LEFT OUTER JOIN PreReq ON Course.CourseID = PreReq.CourseID;

SELECT * FROM Course LEFT OUTER JOIN PreReq ON TRUE WHERE Course.CourseID = PreReq.CourseID;
