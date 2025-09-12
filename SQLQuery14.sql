use CSE_3A_108

--STUDENT_DATA 
-- Rno Name City DID 
--101 Raju Rajkot 10 
--102 Amit Ahmedabad 20 
--103 Sanjay Baroda 40 
--104 Neha Rajkot 20 
--105 Meera Ahmedabad 30 
--106 Mahesh Baroda 10 

CREATE TABLE student_data(
	rno int,
	name varchar(20),
	city varchar(20),
	did int
);

create table department(
	did int,
	dname varchar(20)
);

create table academic(
	rno int ,
	spi decimal(2,1),
	bklog int
);



insert into student_data values(101,'raju','rajkot',10),
								(102,'amit','ahmedabad',20),
								(103,'sanjay','baroda',40),
								(104,'neha','rajkot',20),
								(105,'meera','ahmedabad',30),
								(106,'mahesh','baroda',10);

select * from student_data;


insert into department values(10,'computer'),
								(20,'electrical'),
								(30,'mechanical'),
								(40,'civil');

select * from department;

insert into academic values(101,8.8,0),
							(102,9.2,2),
							(103,7.6,1),
							(104,8.2,4),
							(105,7.0,2),
							(106,8.9,3);
select * from academic;


--Part � A: 
--1. Display details of students who are from computer department. 
--2. Displays name of students whose SPI is more than 8. 
--3. Display details of students of computer department who belongs to Rajkot city.
--4. Find total number of students of electrical department. 
--5. Display name of student who is having maximum SPI. 
--6. Display details of students having more than 1 backlog.


--1. Display details of students who are from computer department. 
select student_data.* from
student_data join department
on student_data.did = department.did
where dname = 'computer';

--2. Displays name of students whose SPI is more than 8. 
select student_data.name  from
student_data join academic
on student_data.rno = academic.rno
where spi > 8;

--3. Display details of students of computer department who belongs to Rajkot city.
select student_data.* from 
student_data join department
on student_data.did = department.did
where dname = 'computer' and city = 'rajkot'

-- 4. Find total number of students of electrical department.
SELECT DEPARTMENT.DNAME,COUNT(*)
FROM DEPARTMENT
JOIN STUDENT_DATA
ON DEPARTMENT.DID = STUDENT_DATA.DID
where dname = 'electrical'
GROUP BY DEPARTMENT.DNAME

-- 5. Display name of student who is having maximum SPI.
SELECT STUDENT_DATA.NAME
FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO=ACADEMIC.RNO
WHERE ACADEMIC.SPI=(SELECT MAX(SPI) FROM ACADEMIC)

-- 6. Display details of students having more than 1 backlog
SELECT * 
FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO=ACADEMIC.RNO
where bklog in(select bklog from academic where bklog > 1);



--Part � B: 
--1. Display name of students who are either from computer department or from mechanical department. 
--2. Display name of students who are in same department as 102 studying in.


--1. Display name of students who are either from computer department or from mechanical department. 
select student_data.name 
from student_data join department
on student_data.did = department.did
where dname in(select dname from department where dname = 'computer' or dname = 'mechanical')

--2. Display name of students who are in same department as 102 studying in.
select student_data.name 
from student_data join department
on student_data.did = department.did
where dname in (select dname from
department join student_data
on department.did = student_data.did
where rno = 102);


--Part � C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
--2. Display name of student who is having second highest SPI. 
--3. Display city names whose students SPI is 9.2 
--4. Find the names of students who have more than the average number of backlogs across all students. 
--5. Display the names of students who are in the same department as the student with the highest SPI. 

--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
SELECT STUDENT_DATA.NAME 
FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO=ACADEMIC.RNO
JOIN DEPARTMENT
ON STUDENT_DATA.DID=DEPARTMENT.DID
WHERE SPI>9 AND DEPARTMENT.DNAME IN (SELECT DNAME FROM DEPARTMENT WHERE DNAME='ELECTRICAL')

-- 2. Display name of student who is having second highest SPI.
SELECT TOP 1 STUDENT_DATA.NAME,SPI
FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO=ACADEMIC.RNO
WHERE SPI != (SELECT MAX(SPI) FROM ACADEMIC)
ORDER BY SPI DESC

-- 3. Display city names whose students SPI is 9.2
SELECT STUDENT_DATA.CITY
FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO=ACADEMIC.RNO
WHERE SPI = (SELECT SPI FROM ACADEMIC WHERE SPI=9.2)

-- 4. Find the names of students who have more than the average number of backlogs across all students.
SELECT STUDENT_DATA.NAME
FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO=ACADEMIC.RNO
WHERE BKLOG > (SELECT AVG(BKLOG) FROM ACADEMIC)

--5. Display the names of students who are in the same department as the student with the highest SPI. 
select student_data.name 
from student_data
join department
on student_data.did = department.did
join academic
on student_data.rno = academic.rno
where department.dname in(select dname from 
							student_data
							join department
							on student_data.did = department.did
							join academic
							on student_data.rno = academic.rno
							where spi = (select MAX(spi) from academic)
							);


--SET Operators
 create table computer (
	rollno int,
	name varchar(20)
)

insert into computer values(101,'ajay'),
							(102,'haresh'),
							(115,'manish')
select * from computer

create table electrical(
	rollno int,
	name varchar(20)
)

insert into electrical values(105,'ajay'),
							(107,'mahesh'),
							(115,'manish')
select * from electrical;



--1. Display name of students who is either in Computer or in Electrical. 
--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
--3. Display name of students who is in both Computer and Electrical. 
--4. Display name of students who are in Computer but not in Electrical. 
--5. Display name of students who are in Electrical but not in Computer. 
--6. Display all the details of students who are either in Computer or in Electrical. 
--7. Display all the details of students who are in both Computer and Electrical. 


-- 1. Display name of students who is either in Computer or in Electrical.
SELECT NAME
FROM COMPUTER 
UNION 
SELECT NAME
FROM ELECTRICAL

-- 2. Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT COMPUTER.NAME
FROM COMPUTER
UNION ALL
SELECT ELECTRICAL.NAME
FROM ELECTRICAL

-- 3. Display name of students who is in both Computer and Electrical.
SELECT NAME
FROM COMPUTER
INTERSECT 
SELECT NAME
FROM ELECTRICAL

-- 4. Display name of students who are in Computer but not in Electrical.
SELECT computer.*
FROM COMPUTER 
EXCEPT
SELECT electrical.*
FROM ELECTRICAL

-- 5. Display name of students who are in Electrical but not in Computer.
SELECT electrical.*
FROM ELECTRICAL
EXCEPT
SELECT computer.*
FROM COMPUTER

-- 6. Display all the details of students who are either in Computer or in Electrical.
SELECT * 
FROM COMPUTER
UNION
SELECT * 
FROM ELECTRICAL

--7. Display all the details of students who are in both Computer and Electrical. 
select * 
from computer
intersect
select * 
from electrical;

