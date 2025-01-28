--example 6.1
SELECT *
FROM staff; 

--example 6.2
SELECT staffno, fname, lname, salary
FROM staff; 

--example 6.3 Use of DISTINCT
SELECT DISTINCT propertyNo 
FROM viewing;

--example 6.4 Calculated fields 
SELECT staffNo, fName, salary/12 AS monthly_salary
FROM staff;

--example 6.5 Comparision search condition
SELECT staffNo, fName, position, salary
FROM staff
WHERE salary > 10000;

--example 6.6 Compound comparision search conditions
SELECT *
FROM branch
WHERE city = 'London' OR city = 'Glasgow';

--example 6.7 Range condition (BETWEEN/NOT BETWEEN)
SELECT staffNo, fName, position, salary
FROM staff
WHERE salary BETWEEN 20000 AND 30000;

--example 6.8 Set membership search condition (IN/NOT IN)
SELECT staffNo, fName, lname, position
FROM staff
WHERE position IN ('Manager', 'Supervisor');

--example 6.9 Pattern match serach condition (LIKE/NOT LIKE)
SELECT ownerno, fname, lname, address, telno
FROM privateowner
WHERE address LIKE '%Glasgow%';

--example 6.10 NULL search condition (IS NULL/ IS NOT NULL)
SELECT clientno, viewdate
FROM viewing
WHERE propertyno = 'PR9512' AND comment IS NULL;

--example 6.11 single-column ordering 
SELECT staffNo, fName, lname, salary
FROM staff
ORDER BY salary DESC;

--example 6.12 multiple-column ordering 
SELECT propertyno, type, rooms, rent
FROM propertyforrent
ORDER BY type, rent DESC;