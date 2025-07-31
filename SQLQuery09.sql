--Math functions


--Part – A:

--1.Display the result of 5 multiply by 30.
    SELECT 5*30 AS RESULT
--2.Find out the absolute value of -25, 25, -50 and 50.
    SELECT ABS(-25) AS ABS1,ABS(25) AS ABS2,ABS(-50) AS ABS3,ABS(50) AS ABS4
--3.Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
    SELECT CEILING(25.2) AS CEL1,CEILING(25.7) AS CEL2,CEILING(-25.2) AS CEL3
--4.Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
    SELECT FLOOR(25.2) AS FLO1,FLOOR(25.7) AS FLO2,FLOOR(-25.2) AS FLO3
--5.Find out remainder of 5 divided 2 and 5 divided by 3.
    SELECT 5%2 AS REM1, 5%3 AS REM2
--6.Find out value of 3 raised to 2nd power and 4 raised 3rd power.
    SELECT POWER(3,2) AS POW1 , POWER(4,3) AS POW2
--7.Find out the square root of 25, 30 and 50.
    SELECT SQRT(25) AS SQRT1 , SQRT(30) AS SQRT2 , SQRT(50) AS SQRT3
--8.Find out the square of 5, 15, and 25.
    SELECT SQUARE(5) AS SQ1 , SQUARE(15) AS SQ2 , SQUARE(25) AS SQ3
--9.Find out the value of PI.
    SELECT PI() AS PI_VALUE
--10.Find out round value of 157.732 for 2, 0 and -2 decimal points.
    SELECT ROUND(157.732,2) AS R1 , ROUND(157.732,0) AS R2 , ROUND(157.732,-2) AS R3
--11.Find out exponential value of 2 and 3.
    SELECT EXP(2) AS EXP1 , EXP(3) AS EXP2
--12.Find out logarithm having base e of 10 and 2.
    SELECT LOG(10) AS LN10 , LOG(2) AS LN2
--13.Find out logarithm having base b having value 10 of 5 and 100.
    SELECT LOG10(5) AS LN5 , LOG10(100) AS LN100
--14.Find sine, cosine and tangent of 3.1415.
    SELECT SIN(3.1415) AS SIN_VAL , COS(3.1415) AS COS_VAL , TAN(3.1415) AS TAN_VAL
--15.Find sign of -25, 0 and 25.
    SELECT SIGN(-25) AS S1 , SIGN(0) AS S2 , SIGN(25) AS S3
--16.Generate random number using function.
    SELECT RAND() AS RANDOM



--    Part – B:
--Create and insert the following records in the EMP_MASTER table. EmpNo EmpName JoiningDate Salary Commission City Dept Code
--101 Keyur 5-1-02 12000.00 4500 Rajkot 3@g
--102 Hardik 15-2-04 14000.00 2500 Ahmedabad 3@
--103 Kajal 14-3-06 15000.00 3000 Baroda 3-GD
--104 Bhoomi 23-6-05 12500.00 1000 Ahmedabad 1A3D
--105 Harmit 15-2-04 14000.00 2000 Rajkot 312A
            CREATE TABLE EMPLOYEE_MASTER (
               EMPNO INT,
               EMPNAME VARCHAR(20),
               JOININGDATE DATE,
               SALARY DECIMAL(7,2),
               COMMISSION INT,
               CITY VARCHAR(20),
               DEPTCODE VARCHAR(20) );


  INSERT INTO EMPLOYEE_MASTER (EMPNO,EMPNAME,JOININGDATE,SALARY,COMMISSION,CITY,DEPTCODE) VALUES (101,'KEYUR','2002-01-05',12000.00,4500,'RAJKOT','3@G')
  INSERT INTO EMPLOYEE_MASTER (EMPNO,EMPNAME,JOININGDATE,SALARY,COMMISSION,CITY,DEPTCODE) VALUES (102,'HARDIK','2004-02-15',14000.00,2500,'AHMEDABAD','3@')
  INSERT INTO EMPLOYEE_MASTER (EMPNO,EMPNAME,JOININGDATE,SALARY,COMMISSION,CITY,DEPTCODE) VALUES (103,'KAJAL','2006-03-14',15000.00,3000,'BARODA','3-GD')
  INSERT INTO EMPLOYEE_MASTER (EMPNO,EMPNAME,JOININGDATE,SALARY,COMMISSION,CITY,DEPTCODE) VALUES (104,'BHOOMI','2005-06-23',12500.00,1000,'AHMEDABAD','1A3D')
  INSERT INTO EMPLOYEE_MASTER (EMPNO,EMPNAME,JOININGDATE,SALARY,COMMISSION,CITY,DEPTCODE) VALUES (105,'HARMIT','2004-02-15',14000.00,2000,'RAJKOT','312A')
          SELECT * FROM EMPLOYEE_MASTER
--1.Display the result of Salary plus Commission.
    SELECT EMPNO,EMPNAME, SALARY + COMMISSION AS TOTAL_SALES FROM EMPLOYEE_MASTER
--2.Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
    SELECT CEILING(55.2) AS C1 , CEILING(35.7) AS C2 , CEILING(-55.2) AS C3
--3.Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
    SELECT FLOOR(55.2) AS F1 , FLOOR(35.7) AS F2 , FLOOR(-55.2) AS F3
--4.Find out remainder of 55 divided 2 and 55 divided by 3.
    SELECT 55%2 AS REMAINDER1 ,  55%3 AS REMAINDER2
--5.Find out value of 23 raised to 2nd power and 14 raised 3rd power.
    SELECT POWER(23,2) AS P1 , POWER(14,3) AS P2



--Part – C:

--1.Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.
    SELECT * FROM EMPLOYEE_MASTER WHERE SALARY + COMMISSION > 15000
--2.Find the details of employees whose commission is more than 25% of their salary.
    SELECT * FROM EMPLOYEE_MASTER WHERE COMMISSION > 0.25*SALARY
--3.List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater than 15000.
    SELECT * FROM EMPLOYEE_MASTER WHERE JOININGDATE < '2005-01-01' AND (SALARY + COMMISSION) > 15000
--4.Find employees whose total earnings (Salary + Commission) are at least double their salary.
    SELECT * FROM EMPLOYEE_MASTER WHERE (SALARY + COMMISSION) >= 2*SALARY



--    String functions


--Part – A:

--1.Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
    SELECT LEN(NULL) AS LEN_NULL , LEN(' HELLO ') AS LEN_HELLO , LEN('') AS LEN_BLANK
--2.Display your name in lower & upper case.
    SELECT LOWER('RONIT') AS LOW_NAME , UPPER('ronit') AS UPP_NAME
--3.Display first three characters of your name.
    SELECT LEFT('RONIT',3) AS FIRST3CHARS
--4.Display 3rd to 10th character of your name.
    SELECT SUBSTRING('RONIT BHADANIA',3,8) AS CHARS3TO10
--5.Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
    SELECT REPLACE('abc123efg','123','XYZ') AS REP1, REPLACE('ABCABCABC','C','5') AS REP2
--6.Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
    SELECT ASCII('a') AS a_VAL,ASCII('A') AS A_VAL,ASCII('z') AS z_VAL,ASCII('Z') AS Z_VAL,ASCII('0') AS ZERO_ASC,ASCII('9') AS NINE_ASC
--7.Write a query to display character based on number 97, 65,122,90,48,57.
    SELECT CHAR(97) AS ASC1,CHAR(65) AS ASC2,CHAR(122) AS ASC3,CHAR(90) AS ASC4,CHAR(48) AS ASC5,CHAR(57) AS ASC5
--8.Write a query to remove spaces from left of a given string ‘ hello world ‘.
    SELECT LTRIM(' hello world ') AS LTRIM_VAL
--9.Write a query to remove spaces from right of a given string ‘ hello world ‘.
    SELECT RTRIM(' HELLO WORLD ') AS RTRIM_VAL
--10.Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
    SELECT LEFT('SQL SERVER',4)AS F4 , RIGHT('SQL SERVER',5) AS L5
--11.Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
    SELECT CAST('1234.56' AS DECIMAL(6,2)) AS N1,CONVERT('1234.56',INT) AS N2
--12.Write a query to convert a float 10.58 to integer (Use cast and convert function).
    SELECT CAST(10.58 AS INT) AS C1 , CONVERT(10.58,INT) AS C2
--13.Put 10 space before your name using function.
    SELECT SPACE(10) + 'RONIT' AS NAME_VAL
--14.Combine two strings using + sign as well as CONCAT ().
    SELECT 'Manav' + ' Delvadiya' AS COMBINE1 , CONCAT('Manav',' Delvadiya') AS COMBINE2
--15.Find reverse of “Darshan”.
    SELECT REVERSE('DARSHAN') AS REVERSE_NAME
--16.Repeat your name 3 times.
    SELECT REPLICATE('RONIT',3) AS REPEAT_NAME

--Part – B: 

--Perform following queries on EMP_MASTER table.

--1.Find the length of EMP Name and City columns.
    SELECT EMPNAME,LEN(EMPNAME) AS EMPNAME_LEN, CITY,LEN(CITY) AS CITY_LEN FROM EMPLOYEE_MASTER   
--2.Display EMP Name and City columns in lower & upper case.
    SELECT EMPNAME,LOWER(EMPNAME) AS EMP_LOWER,UPPER(EMPNAME) AS EMP_UPPER,CITY,LOWER(CITY) AS CITY_LOWER,CITY,UPPER(CITY) AS CITY_UPPER FROM EMPLOYEE_MASTER
--3.Display first three characters of EMP Name column.
    SELECT EMPNAME,LEFT(EMPNAME,3) AS FIRST3CHARS FROM EMPLOYEE_MASTER
--4.Display 3rd to 10th character of city column.
    SELECT CITY,SUBSTRING(CITY,3,8) AS CHARS3TO10 FROM EMPLOYEE_MASTER
--5.Write a query to display first 4 & Last 5 characters of EMP Name column.
    SELECT EMPNAME, LEFT(EMPNAME,4) AS F4, RIGHT(EMPNAME,5) AS L5 FROM EMPLOYEE_MASTER

--Part – C: Perform following queries on EMP_MASTER table.

--1.Put 10 space before EMP Name using function.
    SELECT SPACE(10) + [EMPNAME] AS EMPNAME_SPACE FROM EMPLOYEE_MASTER
--2.Combine EMP Name and city columns using + sign as well as CONCAT ().
    SELECT EMPNAME + ' '+  CITY AS COM1, CONCAT(EMPNAME,' ',CITY) AS COM2 FROM EMPLOYEE_MASTER
--3.Combine all columns using + sign as well as CONCAT ().
    
--4.Combine the result as < EMP Name > Lives in <City>.
    SELECT CONCAT('< ',EMPNAME,' > LIVES IN <',CITY,'>') AS EMP_INFO FROM EMPLOYEE_MASTER
--5.Combine the result as ‘EMP no of < EMP Name> is <EmpNo> .
    SELECT CONCAT('EMP NO OF < ',EMPNAME,' > IS <',EMPNO,'>') AS EMPLOYEE_INFO FROM EMPLOYEE_MASTER
--6.Retrieve the names of all employee where the third character of the Name is a vowel.
    SELECT * FROM EMPLOYEE_MASTER WHERE SUBSTRING(EMPNAME,3,1) IN ('A','E','I','O','U','a','e','i','o','u')
--7.Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that starts with 'R'.
    SELECT * FROM EMPLOYEE_MASTER WHERE EMPNAME LIKE '%r' AND CITY LIKE 'R%'

--Date Functions


--Part – A:

--1.Write a query to display the current date & time. Label the column Today_Date.
    SELECT GETDATE() AS [TODAY_DATE]
--2.Write a query to find new date after 365 day with reference to today.
    SELECT DATEADD(D,365,GETDATE()) AS[NEW_DATE]
--3.Display the current date in a format that appears as may 5 1994 12:00AM.
    SELECT CONVERT(VARCHAR,GETDATE(),100) AS[DATE_FORMAT]
--4.Display the current date in a format that appears as 03 Jan 1995.
    SELECT FORMAT(GETDATE(),'dd MMM yyyy') AS [FORMAT_DATE]
--5.Display the current date in a format that appears as Jan 04, 96.
    SELECT FORMAT(GETDATE(),'MMM dd, yy') AS [NEW_FORMAT]
--6.Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
    SELECT DATEDIFF(MONTH,'2008-12-31','2009-03-31') AS [DATE_DIFF]
--7.Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
    SELECT DATEDIFF(HOUR,'2012-01-25 07:00:00','2012-01-26 10:30:00') AS [TIME_DIFF]
--8.Write a query to extract Day, Month, Year from given date 12-May-16.
    SELECT DAY('2016-05-12') AS DAY,MONTH('2016-05-12') AS MONTH,YEAR('2016-05-12') AS YEAR
--9.Write a query that adds 5 years to current date.
    SELECT DATEADD(YYYY,5,GETDATE()) AS [ADD_YEAR]
--10.Write a query to subtract 2 months from current date.
    SELECT DATEADD(M,-2,GETDATE()) AS [MONTH_SUBTRACT]
--11.Extract month from current date using datename () and datepart () function.
    SELECT DATENAME(MONTH,GETDATE()) AS DATE_NAME1,DATEPART(MONTH,GETDATE()) AS DATE_NAME2
--12.Write a query to find out last date of current month.
    SELECT EOMONTH(GETDATE()) AS [END_OF_MONTH]
--13.Calculate your age in years and months.
    SELECT DATEDIFF(YEAR,'2007-01-13',GETDATE()) AS [YEARS_AGE],DATEDIFF(MONTH,'2007-01-13',GETDATE()) AS [MONTH_AGE]


--Part – B: Perform following queries on EMP_MASTER table.


--1.Write a query to find new date after 365 days with reference to JoiningDate.
    SELECT EMPNAME,DATEADD(DAY,365,JOININGDATE) AS [NEW_DATE] FROM EMPLOYEE_MASTER
--2.Write a query to find out total number of months between JoiningDate and 31-Mar-09.
    SELECT EMPNAME,DATEDIFF(MONTH,JOININGDATE,'2009-03-31') AS [MONTH_DIFF] FROM EMPLOYEE_MASTER
--3.Write a query to find out total number of years between JoiningDate and 14-Sep-10.
    SELECT EMPNAME,DATEDIFF(YEAR,JOININGDATE,'2010-09-14') AS [YEAR_DIFF] FROM EMPLOYEE_MASTER


--Part – C: Perform following queries on EMP_MASTER table.


--1.Write a query to extract Day, Month, Year from JoiningDate.
    SELECT EMPNAME,DAY(JOININGDATE) AS DAY,MONTH(JOININGDATE) AS MONTH,YEAR(JOININGDATE) AS YEAR FROM EMPLOYEE_MASTER
--2.Write a query that adds 5 years to JoiningDate.
    SELECT EMPNAME,DATEADD(YEAR,5,JOININGDATE) AS [NEW_DATE] FROM EMPLOYEE_MASTER
--3.Write a query to subtract 2 months from JoiningDate.
    SELECT EMPNAME,DATEADD(MONTH,-2,JOININGDATE) AS [NEW_MONTH] FROM EMPLOYEE_MASTER
--4.Extract month from JoiningDate using datename () and datepart () function.
    SELECT EMPNAME,DATENAME(MONTH,JOININGDATE) AS [MONTH_NAME],DATEPART(MONTH,JOININGDATE) AS [DATE_PART] FROM EMPLOYEE_MASTER
--5.Select employee who joined between the 1st and 15th of any month in any year.
    SELECT * FROM EMPLOYEE_MASTER WHERE DAY(JOININGDATE) BETWEEN 1 AND 15
--6.Find employee whose JoiningDate is the last day of any month.
    SELECT * FROM EMPLOYEE_MASTER WHERE DAY(JOININGDATE) = DAY(EOMONTH(JOININGDATE))
--7.List employee whose JoiningDate is during a leap year.
    SELECT * FROM EMPLOYEE_MASTER WHERE (YEAR(JOININGDATE)%4=0 AND YEAR(JOININGDATE)%100!=0) OR (YEAR(JOININGDATE)%400=0)