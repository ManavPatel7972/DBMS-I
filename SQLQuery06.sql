--Part – A: 
--Create following table using query according to the definition. 
--STUDENT 
--Column_Name DataType 
--StuID INT 
--FirstName VARCHAR(25) 
--LastName VARCHAR(25) 
--Website VARCHAR(50) 
--City VARCHAR(25) 
--Address VARCHAR(100) 

--Insert the following records in the STUDENT table.  
--StuID FirstName LastName Website City Address 
--1011 Keyur Patel techonthenet.com Rajkot A-303 ‘Vasant Kunj’, Rajkot 
--1022 Hardik Shah digminecraft.com Ahmedabad “Ram Krupa”, Raiya Road 
--1033 Kajal Trivedi bigactivities.com Baroda Raj bhavan plot, near garden 
--1044 Bhoomi Gajera checkyourmath.com Ahmedabad “Jig’s Home”, Narol  
--1055 Harmit Mitel @me.darshan.com Rajkot B-55, Raj Residency 
--1066 Ashok Jani NULL Baroda A502, Club House Building 

create table student(
	studentID int,
	firstname varchar(25),
	lastname varchar(25),
	website varchar(50),
	city varchar(25),
	address varchar(100)
);

insert into student values	(1011,'keyur','patel','techonthenet.com','Rajkot','A-303 ‘Vasant Kunj’, Rajkot'),
							(1022,'Hardik','Shah','digminecraft.com','Ahmedabad','“Ram Krupa”, Raiya Road'),
							(1033,'Kajal','Trivedi','bigactivities.com','Baroda','Raj bhavan plot, near garden'),
							(1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad','“Jig’s Home”, Narol'),
							(1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55, Raj Residency'),
							(1066,'Ashok','Jani',NULL,'Baroda','A502, Club House Building');

select *
from student;
--From the above given tables perform the following queries (LIKE Operation): 
--1. Display the name of students whose name starts with ‘k’. 

select firstname
from student
where firstname like 'k%';

--2. Display the name of students whose name consists of five characters. 

select firstname
from student
where firstname like '_';

select firstname
from student
where len(firstname) = 5;

--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters. 

select firstname,lastname
from student 
where city like '_a';

select firstname,lastname
from student
where city like '%a' and len(city)=6;

--4. Display all the students whose last name ends with ‘tel’. 

select *
from student
where lastname like '%tel';

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’. 

select *
from student
where firstname like 'ha%' and firstname like '%t';

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’. 
  
select *
from student
where firstname like 'k%_y%';

--7. Display the name of students having no website and name consists of five characters. 

select firstname
from student
where website is null and firstname like '_';

--8. Display all the students whose last name consist of ‘jer’.  

select *
from student
where lastname like '%jer%';

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.

select *
from student
where city like 'r%' or city like 'b%';

--10. Display all the name students having websites. 

select *
from student
where not website is null;

select *
from student
where website is not null;


--11. Display all the students whose name starts from alphabet A to H. 

select *
from student
where firstname like '[A-H]%';

--12. Display all the students whose name’s second character is vowel. 

select *
from student
where firstname like '_[a,e,i,o,u]%';

--13. Display the name of students having no website and name consists of minimum five characters.

select firstname 
from student
where website is null and firstname like '_%';

select firstname 
from student
where website is null and LEN(firstname)>=5;

--14. Display all the students whose last name starts with ‘Pat’. 

select *
from student 
where lastname like 'pat%';

--15. Display all the students whose city name does not starts with ‘b’. 

select *
from student
where not city like 'b%';

--16. Display all the students whose student ID ends with digit. 

select *
from student
where studentID like '%[0-9]';

--17. Display all the students whose address does not contain any digit. 

select *
from student
where not address like '%[0-9]%';

--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 
--'math' or 'science'. Ensure that their city does not start with 'B'. 

select *
from student
where firstname LIKE 'B%'
  AND lastname LIKE '%a'
  AND (website LIKE '%math%' OR website LIKE '%science%')
  AND city NOT LIKE 'B%'; 

--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their 
--website should be either null or contain 'com'. 

select *
from student 
where lastname like 'shah' and city like '%d' and (website is null or website like '%.com%');

--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must 
--have a website containing '.com'. 

SELECT *
FROM student
WHERE firstname LIKE '[AEIOUaeiou][AEIOUaeiou]%'
  AND city LIKE 'R%'
  AND website LIKE '%.com%';

--Part – B: 
--1. Display all the students whose name’s second character is vowel and of and start with H. 

select *
from student
where firstname like 'H[AEIOUaeiou]%';

--2. Display all the students whose last name does not ends with ‘a’.

select *
from student
where lastname not like '%a';

--3. Display all the students whose first name starts with consonant. 

select *
from student
where firstname not like '[AEIOUaeiou]%';

--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their 
--website contains 'tech' or they live in a city starting with 'R'. 

select *
from student
where firstname like 'k%'
	and lastname like '%tel'
	and (website like '%tech%' or city like 'R%');

--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They 
--must have a website that ends with '.com' and their first name should not start with 'A'. 

select *
from student
where address like '%-%'
	and (city like 'R%' or city like 'B%')
	and website like '%.com'
	and firstname not like 'A%';

--Part – C: 
--1. Display all the students whose address contains single quote or double quote. 

SELECT *
FROM student
WHERE address LIKE '%''%' 
   OR address LIKE '%"%';

--2. Find students whose city does not contain the letter 'S' and their address contains either single or double 
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'. 

select *
from student
where city not like '%S%'
	and (address LIKE '%''%' 
   OR address LIKE '%"%')
   and lastname like 'P%'
   and website like '%on%';