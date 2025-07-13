
USE CSE_3A_108;

--1. Add two more columns City VARCHAR (20) and Pincode INT.
--2. Add column state VARCHAR(20).
--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
--4. Change the data type DECIMAL to INT in amount Column.
--5. Delete Column City from the DEPOSIT table.
--6. Rename Column ActNo to ANO.
--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.

SELECT * FROM DEPOSIT;



--1. Add two more columns City VARCHAR (20) and Pincode INT.

ALTER TABLE DEPOSIT
ADD CITY VARCHAR(20),
	PINCODE INT;

SELECT * FROM DEPOSIT;




--2. Add column state VARCHAR(20).

ALTER TABLE DEPOSIT
ADD STATE VARCHAR(20);

SELECT * FROM DEPOSIT;


--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).



ALTER TABLE DEPOSIT
ALTER COLUMN CNAME VARCHAR(50);

SELECT * FROM DEPOSIT;


--4. Change the data type DECIMAL to INT in amount Column.

ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT;

SELECT * FROM DEPOSIT;



--5. Delete Column City from the DEPOSIT table.

ALTER TABLE DEPOSIT
DROP COLUMN CITY;

SELECT * FROM DEPOSIT;


--6. Rename Column ActNo to ANO.

 EXEC SP_RENAME 'DEPOSIT.ACTNO' , 'ANO';

SELECT * FROM DEPOSIT;


--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.

EXEC SP_RENAME 'DEPOSIT' ,'DEPOSIT_DETAIL';

SELECT * FROM DEPOSIT_DETAIL;

EXEC SP_RENAME 'DEPOSIT_DETAIL' ,'DEPOSIT';

SELECT * FROM DEPOSIT;



--Part – B:
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
--3. Rename Column CNAME to CustomerName.
--4. Add Column country.


--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.

SELECT * FROM DEPOSIT;

EXEC SP_RENAME 'DEPOSIT. AOPENDATE' , 'AOPENDATE';

SELECT * FROM  DEPOSIT;



--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.

ALTER TABLE DEPOSIT
DROP COLUMN AOPENDATE;

SELECT * FROM DEPOSIT;


--3. Rename Column CNAME to CustomerName.

EXEC SP_RENAME 'DEPOSIT.CNAME', 'CustomerName';

SELECT * FROM DEPOSIT;


--4. Add Column country.

ALTER TABLE DEPOSIT
ADD COUNTRY VARCHAR(20);

SELECT * FROM DEPOSIT;


--Part – C:

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
--2. Add column department VARCHAR (20) Not Null.
--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
--4. Change the data type DECIMAL to INT in CPI Column.
--5. Delete Column City from the student_detail table.
--6. Rename Column Enrollment_No to ENO.
--7. Change name of table student_detail to STUDENT_MASTER

CREATE TABLE STUDENT_DETAIL (ENROLLMENT_NO VARCHAR(20),
							NAME VARCHAR(25),
							CPI DECIMAL(5,2),
							BIRTHDATE DATETIME);
	

SELECT * FROM STUDENT_DETAIL;


--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).

ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR(20) NOT NULL,
	BACKLOG INT NULL;

SELECT * FROM STUDENT_DETAIL;

--2. Add column department VARCHAR (20) Not Null.

ALTER TABLE STUDENT_DETAIL
ADD DEPARTMENT VARCHAR(20) NOT NULL;

SELECT * FROM STUDENT_DETAIL;


--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN NAME VARCHAR(35);

SELECT * FROM STUDENT_DETAIL;


--4. Change the data type DECIMAL to INT in CPI Column.

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN CPI INT;

SELECT * FROM STUDENT_DETAIL;


--5. Delete Column City from the student_detail table.

ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY;

SELECT * FROM STUDENT_DETAIL;


-- 6. Rename Column Enrollment_No to ENO.

EXEC sp_rename 'student_detail.Enrollment_No','ENO';

select * from student_detail;



-- 7. Change name of table student_detail to STUDENT_MASTER


EXEC sp_rename 'student_detail','STUDENT_MASTER';

select * from STUDENT_MASTER;




--DELETE, Truncate, Drop Operation:
-- Part – A:
--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.
--2. Delete all the accounts CHANDI BRANCH.
--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105.
--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’
--5. Delete all the accounts whose account number is NULL.
--6. Delete all the remaining records using Delete command.
--7. Delete all the records of Deposit_Detail table. (Use Truncate)
--8. Remove Deposit_Detail table. (Use Drop)

EXEC SP_RENAME 'DEPOSIT' ,'DEPOSIT_DETAIL';

SELECT * FROM DEPOSIT_DETAIL;


--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.

Delete from DEPOSIT_DETAIL 
where AMOUNT<=4000;

select * from DEPOSIT_DETAIL;





-- 2. Delete all the accounts CHANDI BRANCH.

Delete from DEPOSIT_DETAIL
where BNAME='CHANDI';

select * from DEPOSIT_DETAIL;




-- 3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105.

Delete from DEPOSIT_DETAIL
where ano>=102 AND ano<105;

select * from DEPOSIT_DETAIL;



-- 4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’

Delete from DEPOSIT_DETAIL
where bname in ('ajni','POWAI');

select * from DEPOSIT_DETAIL;



-- 5. Delete all the accounts whose account number is NULL.

Delete from DEPOSIT_DETAIL
where ANO is NULL;

select * from DEPOSIT_DETAIL;



-- 6. Delete all the remaining records using Delete command.

Delete from Deposit_Detail;

select * from DEPOSIT_DETAIL



-- 7. Delete all the records of Deposit_Detail table. (Use Truncate)

Truncate table Deposit_Detail;

select * from DEPOSIT_DETAIL;



-- 8. Remove Deposit_Detail table. (Use Drop)

Drop table Deposit_Detail;





--Part – B:
--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
--2. Delete all the Employees who belongs to ‘RAJKOT’ city.
--3. Delete all the Employees who joined after 1-1-2007.
--4. Delete the records of Employees whose joining date is null and Name is not null.
--5. Delete the records of Employees whose salary is 50% of 20000.
--6. Delete the records of Employees whose City Name is not empty.
--7. Delete all the records of Employee_MASTER table. (Use Truncate)
--8. Remove Employee_MASTER table. (Use Drop)

Create table EMPLOYEE_MASTER(EmpNo int,
                             EmpName VARCHAR(25),
                             JoiningDate DATETIME,
                             Salary DECIMAL(8,2),
                             City VARCHAR(20));


insert into EMPLOYEE_MASTER values (101 ,'Keyur','2002-1-5' ,12000.00 ,'Rajkot'),
                                   (102 ,'Hardik','2004-2-15',14000.00 ,'Ahmedabad'),
                                   (103 ,'Kajal','2006-3-14' ,15000.00 ,'Baroda'),
                                   (104 ,'Bhoomi','2005-6-23',12500.00 ,'Ahmedabad'),
                                   (105 ,'Harmit','2004-2-15',14000.00 ,'Rajkot'),
                                   (106 ,'mitesh','2001-9-25',14000.00,'jamnagar'),
                                   (107,'meera',NULL,7000.00,'morbi'),
                                   (108,'kishan','2003-2-6',10000.00,NULL);

select * from EMPLOYEE_MASTER;


--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.

DELETE FROM EMPLOYEE_MASTER
WHERE SALARY>= 14000;

SELECT * FROM EMPLOYEE_MASTER;



--2. Delete all the Employees who belongs to ‘RAJKOT’ city.

DELETE FROM EMPLOYEE_MASTER
WHERE CITY='RAJKOT';

SELECT * FROM EMPLOYEE_MASTER;



--3. Delete all the Employees who joined after 1-1-2007.

DELETE FROM EMPLOYEE_MASTER
WHERE JoiningDate>'2007-1-1';

SELECT * FROM EMPLOYEE_MASTER;




--4. Delete the records of Employees whose joining date is null and Name is not null.

DELETE FROM EMPLOYEE_MASTER
WHERE (JoiningDate IS NULL) AND (EmpNamE IS NOT NULL);

SELECT * FROM EMPLOYEE_MASTER;




--5. Delete the records of Employees whose salary is 50% of 20000.

DELETE FROM EMPLOYEE_MASTER
WHERE Salary = (0.5 * 20);

SELECT * FROM EMPLOYEE_MASTER;



--6. Delete the records of Employees whose City Name is not empty.

DELETE FROM EMPLOYEE_MASTER
WHERE CITY IS NOT NULL;

SELECT * FROM EMPLOYEE_MASTER;



--7. Delete all the records of Employee_MASTER table. (Use Truncate)

TRUNCATE TABLE EMPLOYEE_MASTER;

SELECT * FROM EMPLOYEE_MASTER;



--8. Remove Employee_MASTER table. (Use Drop)

DROP TABLE EMPLOYEE_MASTER;


