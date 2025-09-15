USE CSE_3A_108;


CREATE TABLE stu_info (Rno INT primary key,
						Name VARCHAR(20),
						Branch VARCHAR(5));

INSERT INTO stu_info VALUES (101,'raju','ce'),
							(102,'amit','ce'),
							(103,'sanjay','me'),
							(104,'neha','ec'),
							(105,'meera','ee'),
							(106,'mahesh','me');
						
select * from stu_info;


create table result(
	rno int,
	spi decimal(2,1)
	Foreign Key(rno) References stu_info(rno)
	);

select * from stu_info;

insert into result values		(101,8.80),
								(102,9.20),
								(103,7.60),
								(104,8.20),
								(105,7.00);
			

select *
from result;

create table employee_master(
	empNo varchar(30),
	name varchar(30),
	managerNo varchar(30)
);

insert into employee_master values	('E01','tarun',NULL),
									('E02','rohan','E02'),
									('E03','priya','E01'),
									('E04','milan','E03'),
									('E05','jay','E01'),
									('E06','anjana','E04');

select *
from employee_master;


--Part – A: 
--1. Combine information from student and result table using cross join or Cartesian product. 
--2. Perform inner join on Student and Result tables. 
--3. Perform the left outer join on Student and Result tables. 
--4. Perform the right outer join on Student and Result tables. 
--5. Perform the full outer join on Student and Result tables.  
--6. Display Rno, Name, Branch and SPI of all students. 
--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 
--9. Display average result of each branch. 
--10. Display average result of CE and ME branch. 
--11. Display Maximum and Minimum SPI of each branch. 
--12. Display branch wise student’s count in descending order.



--1. Combine information from student and result table using cross join or Cartesian product. 

select * from
stu_info cross join result;

--2. Perform inner join on Student and Result tables. 

select * from 
stu_info s inner join result r
on s.Rno = r.rno;

--3. Perform the left outer join on Student and Result tables. 

select * 
from stu_info s left join result r
on s.Rno = r.rno;

--4. Perform the right outer join on Student and Result tables. 

select *
from stu_info s right join result r
on s.Rno = r.rno;


--5. Perform the full outer join on Student and Result tables.  

select *
from stu_info s full outer join result r
on s.Rno = r.rno;


--6. Display Rno, Name, Branch and SPI of all students. 
select s.Rno,s.Name,s.Branch,r.spi
from stu_info s join result r
on s.Rno = r.rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
select s.Rno,s.Name,s.Branch,r.spi
from stu_info s join result r
on s.Rno = r.rno
where s.Branch = 'ce';

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 
select s.Rno,s.Name,s.Branch,r.spi
from stu_info s join result r
on s.Rno = r.rno
where s.Branch != 'ec';

--9. Display average result of each branch. 
select s.Branch,AVG(r.spi)
from stu_info s join result  r
on s.Rno = r.rno
group by s.Branch;

--10. Display average result of CE and ME branch. 
select s.Branch,AVG(r.spi)
from stu_info s join result  r
on s.Rno = r.rno
where s.Branch = 'ce' or s.Branch = 'me'
group by s.Branch;


--11. Display Maximum and Minimum SPI of each branch. 
select s.Branch,MAX(r.spi) as max,MIN(r.spi) as min
from stu_info s join result  r
on s.Rno = r.rno
group by s.Branch;


--12. Display branch wise student’s count in descending order.
select s.Branch,count(s.Name) as Count_Branch_Stu
from stu_info s join result  r
on s.Rno = r.rno
group by s.Branch
order by Count_Branch_Stu desc;


--Part – B: 
--1. Display average result of each branch and sort them in ascending order by SPI. 
--2. Display highest SPI from each branch and sort them in descending order.

--1. Display average result of each branch and sort them in ascending order by SPI. 
select s.Branch,AVG(r.spi) as Avrage
from stu_info s join result  r
on s.Rno = r.rno
group by s.Branch
order by Avrage asc;

--2. Display highest SPI from each branch and sort them in descending order.
select s.Branch,MAX(r.spi) as max
from stu_info s join result  r
on s.Rno = r.rno
group by s.Branch
order by max desc;

select * from employee_master;
--Part – C: 
--1. Retrieve the names of employee along with their manager’s name from the Employee table. 
select copy_e.name,ori_e.Name
from employee_master ori_e join employee_master copy_e
on ori_e.empNo = copy_e.managerNo;


