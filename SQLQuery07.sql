--Lab 7 Perform SQL queries for Aggerate function and group by (without having) ;

USE  CSE_3A_108;

CREATE TABLE EMP(
	EID INT,
	ENAME VARCHAR(20),
	DEPARTMENT VARCHAR(20),
	SALARY INT,
	JOININGDATE DATETIME,
	CITY VARCHAR(20),
	GENDER VARCHAR(7)
	);

 INSERT INTO EMP VALUES(101,'Rahul','Admin',56000,'1990-Jan-1','Rajkot','Male'),
						(102,'Hardik','IT',18000,'1990-Sep-25','Ahmedabad','Male'),
						(103,'Bhavin','Hr',25000,'1991-May-14','Baroda','Male'),
						(104,'Bhomi','Admin',39000,'1991-Feb-8','Rajkot','Female'),
						(105,'Rohit','It',17000,'1990-Jul-23','Jamnagar','Male'),
						(106,'Priya','It',9000,'1990-Oct-18','Ahemedabad','Female'),
						(107,'Bhomi','Hr',34000,'1991-Dec-25','Rajkot','Female');


SELECT * FROM EMP;

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

SELECT MAX(SALARY) AS Maximum, MIN(SALARY) AS Minimum
FROM EMP ;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.

SELECT SUM(SALARY) AS Total_Sal,AVG(SALARY) AS Average_Sal
FROM EMP;

--3. Find total number of employees of EMPLOYEE table.
SELECT * FROM EMP;

SELECT COUNT(*) AS Total_emp
FROM EMP;

--4. Find highest salary from Rajkot city.

SELECT MAX(SALARY) AS Max_Salary
FROM EMP
WHERE CITY='Rajkot';

--5. Give maximum salary from IT department.
SELECT * FROM EMP;

SELECT MAX(SALARY) AS Max_Salary
FROM EMP
WHERE DEPARTMENT='IT';

--6. Count employee whose joining date is after 8-feb-91.
SELECT * FROM EMP;

SELECT COUNT(EID) AS DATE_JOINING
FROM EMP
WHERE JOININGDATE > '8-feb-91'; -- 1991-Feb-08


--7. Display average salary of Admin department.
SELECT * FROM EMP;

SELECT AVG(SALARY) AS Avg_Salary
FROM EMP
WHERE DEPARTMENT='ADMIN';

--8. Display total salary of HR department.

SELECT SUM(SALARY) AS Total_Salary
FROM EMP
WHERE DEPARTMENT='HR';

--9. Count total number of cities of employee without duplication.
SELECT * FROM EMP;

SELECT  COUNT(DISTINCT CITY)
FROM EMP;


--10. Count unique departments
SELECT * FROM EMP;

SELECT COUNT(DISTINCT DEPARTMENT)
FROM EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT * FROM EMP;

SELECT MIN(SALARY) AS MIN_SALART
FROM EMP
WHERE CITY='Ahmedabad';

--12. Find city wise highest salary.

SELECT CITY,MAX(SALARY) AS MAX_SALARY
FROM EMP
GROUP BY(CITY);

--13. Find department wise lowest salary
SELECT * FROM EMP;

SELECT DEPARTMENT,MIN(SALARY) AS MIN_SALARY
FROM EMP
GROUP BY(DEPARTMENT);

--14. Display city with the total number of employees belonging to each city.
SELECT * FROM EMP;

SELECT CITY,COUNT(EID) AS TOTAL_EMP_CITY
FROM EMP
GROUP BY(CITY);

--15. Give total salary of each department of EMP table
SELECT * FROM EMP;

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY(DEPARTMENT);

--16. Give average salary of each department of EMP table without displaying the respective department
--name.
SELECT * FROM EMP;

SELECT AVG(SALARY) AS SALARY
FROM EMP
GROUP BY(DEPARTMENT);

--17. Count the number of employees for each department in every city

SELECT DEPARTMENT,CITY,COUNT(EID) AS COUNT_EMP
FROM EMP
GROUP BY DEPARTMENT,CITY;

--18. Calculate the total salary distributed to male and female employees
SELECT * FROM EMP;

SELECT GENDER,SUM(SALARY) AS SLALRY
FROM EMP
GROUP BY GENDER;

--19. Give city wise maximum and minimum salary of female employees.

SELECT CITY, MAX(SALARY) AS MAX_SALARY ,MIN(SALARY) AS MIN_SALARY
FROM EMP
WHERE GENDER='FEMALE'
GROUP BY CITY;

--20. Calculate department, city, and gender wise average salary
SELECT * FROM EMP;

SELECT DEPARTMENT,CITY,GENDER,AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY DEPARTMENT,CITY,GENDER;


--Part – B:

--1. Count the number of employees living in Rajkot.

SELECT * FROM EMP;

SELECT COUNT(EID) AS EMP_COUNT
FROM EMP
WHERE CITY='RAJKOT';

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

SELECT MAX(SALARY) - MIN(SALARY) AS DIFFERENCE
FROM EMP;

--3. Display the total number of employees hired before 1st January, 1991.
SELECT * FROM EMP;

SELECT COUNT(EID) AS TOTAL_EMP
FROM EMP
WHERE JOININGDATE < '1-Jan-1991';

--Part – C:

--1. Count the number of employees living in Rajkot or Baroda

SELECT * FROM EMP;

SELECT COUNT(EID) AS COUNT_EMP
FROM EMP
WHERE CITY IN ('RAJKOT','BARODA');


--2. Display the total number of employees hired before 1st January, 1991 in IT department.

SELECT COUNT(EID) AS TOTAL_EMP
FROM EMP
WHERE JOININGDATE < '1-JAN-91' AND DEPARTMENT = 'IT';

--3. Find the Joining Date wise Total Salaries

SELECT * FROM EMP;

SELECT JOININGDATE, SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY JOININGDATE;


--4. Find the Maximum salary department & city wise in which city name starts with ‘R’
SELECT * FROM EMP;

SELECT DEPARTMENT,CITY,MAX(SALARY)
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY;
