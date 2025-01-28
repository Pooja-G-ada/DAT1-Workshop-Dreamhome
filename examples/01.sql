--AGGREGATE FUNCTION

--6.13 Use of COUNT(*)
SELECT COUNT(*) as myCount
FROM propertyforrent
WHERE rent > 1050;

--6.14 Use of COUNT(DISTINCT)
SELECT COUNT(DISTINCT propertyno) AS myCount
FROM viewing 
WHERE viewdate BETWEEN '1-May-13' AND '31-May-13';

--6.15 Use of COUNT and SUM
--find the total number of Managers and the sum of their salaries
SELECT COUNT(staffno) AS myCount, SUM(salary) AS mySum
FROM staff
WHERE position = 'Manager';

--6.16 Use of  MIN, MAX, AVG
--find the minimum, ,aximum, and average staff salary
SELECT MIN(salary) AS myMin, MAX(salary) AS myMax, AVG(salary) AS myAvg 
FROM staff;

--6.17 Use of  GROUP BY
--find the number of staff working in each branch and the sum of their salaries 
SELECT branchno, COUNT(staffno) AS myCount, SUM(salary) AS mySum 
FROM staff 
GROUP BY branchno 
ORDER BY branchno;

select '';
--6.18 use of HAVING clause
--for each branch office with more than one member of staff, 
-- find the number of staff working in each branch 
-- and the sum of their salaries  
SELECT branchno, COUNT(staffno) AS myCount, SUM(salary) AS mySum 
FROM Staff
GROUP BY branchno 
HAVING COUNT(staffno)>1
ORDER BY branchno;

SELECT '';
--6.19 Subquery - all staff working at '163 Main St'

--FIRST list all from staff list 
-- SELECT * 
-- FROM staff; --we see that branchno is foreign key, so we wouldnt know which on is '163 Main ST'


-- --SECOND do subquery/ROW SELECTION in branch table to find out which branchno/key is '163 Main Street'
-- SELECT branchno, street
-- FROM branch
-- WHERE street = '163 Main St'; --this query gives us branchno of '163 Main St'

--THIRD use the query used for branch table as subquery into the staff table
--to list staff working at '163 Main St'
SELECT * 
FROM staff
WHERE branchno = (  SELECT branchno 
                    FROM branch
                    WHERE street = '163 Main St');

                    
SELECT '';
--6.20 Using a subquery with an aggregate function 
--List all staff whose salary is greater than the average salary, 
--and show by houch their salary is greater than the average

SELECT staffno, fname, lname, position, salary - (SELECT AVG(salary) FROM staff) AS salDiff  
FROM staff 
WHERE salary > (SELECT AVG(salary) FROM Staff);

SELECT '';
--6.21 Nested subqueries: use of NI 
--List the properties that are handled by staff who work in the branch of '163 Main St.'

--FIRST list all propertyforrent to see all the columns - staffno, branchno - 2 columns 
--these columns are foreign keys, which mean we will need subquery 

SELECT propertyno, street, city, postcode, type, rooms rent 
FROM propertyforrent;

--SECOND list all columns of staff table
--branchno as foreign key - another subquery
SELECT * 
FROM staff;
--cannot do WHERE branch = '136 Main St' as this is foreign key

--THIRD list all columns of branch table
--you can street as column 
--query to find branchno which has street '136 Main St'
SELECT branchno from branch 
WHERE street = '163 Main St';

--FOUR go back to staff table (STEP TWO) and query using subquery we just created
SELECT staffno 
FROM staff 
WHERE branchno = (  SELECT branchno 
                    FROM branch 
                    WHERE street = '163 Main St');

--FIVE go back to staff table (STEP ONE) and query using this nested subquery we just created
SELECT propertyno, street, city, postcode, type, rooms rent 
FROM propertyforrent
WHERE staffno = (   SELECT staffno 
                    FROM staff 
                    WHERE branchno = (  SELECT branchno 
                                        FROM branch 
                                        WHERE street = '163 Main St'));

SELECT '';
--6.22 USE OF ANY/SOME **DOES NOT EXIST IN SQLITE
--List all the staff whose salary is larger than the salary of at least one member of staff at branch B003

--FIRST List all from staff table
SELECT staffno, fname, lname, position, salary 
FROM staff;

--SECOND salary of staff from branch B003
SELECT salary 
FROM staff 
WHERE branchno = 'B052';

--THIRD use this query into the FIRST step 
SELECT staffno, fname, lname, position, salary 
FROM staff 
WHERE salary > SOME (   SELECT salary 
                        FROM staff 
                        WHERE branchno = 'B052');

SELECT '';
--6.23 USE OF ALL **DOES NOT EXIST IN SQLITE
--List all staff whose salary is larger than the salary of every member of staff of branch B052
SELECT staffno, fname, lname, position, salary 
FROM staff 
WHERE salary > ALL (   SELECT salary 
                        FROM staff 
                        WHERE branchno = 'B053');