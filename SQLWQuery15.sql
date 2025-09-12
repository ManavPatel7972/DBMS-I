--Lab 15 Perform SQL queries to implement constraints


--Part � A: 
--Create below table with following constraints 

--1. Do not allow SPI more than 10 
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as �General� in branch to all new records IF no other value is specified. 
--4. Try to update SPI of Raju from 8.80 to 12. 
--5. Try to update Bklog of Neha from 0 to -1

CREATE TABLE STU_MASTER (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Branch VARCHAR(10) DEFAULT 'General',
    SPI DECIMAL(4,2) CHECK (SPI <= 10),    
    Bklog INT CHECK (Bklog >= 0) 
);


INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh','', 4.50, 3);

SELECT * FROM STU_MASTER

--4. Try to update SPI of Raju from 8.80 to 12. 
UPDATE STU_MASTER
SET SPI = 12
WHERE Name = 'Raju';

--5. Try to update Bklog of Neha from 0 to -1
UPDATE STU_MASTER
SET Bklog = -1
WHERE Name = 'Neha';

--Part � B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_details(Did, Dname) 
--City_details(Cid, Cname)

CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_details(Did),
    FOREIGN KEY (Cid) REFERENCES City_details(Cid)
);

--Dept_details(Did, Dname) 
CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);


--City_details(Cid, Cname)
CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);


-- Part � C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 

--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 

--2. Insert 5 records in each table. 
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 

-- Country
--Country(Cid, Cname) 
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- State
--State(Sid, Sname, Cid) 
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

-- District
--District(Did, Dname, Sid) 
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

-- Dept_info
--Dept_info(Did, Dname) 
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

-- City_info
--City_info(Cid, Cname, Did)) 
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

-- Emp_info
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);

INSERT INTO Country VALUES (1, 'India');
INSERT INTO Country VALUES (2, 'USA');
INSERT INTO Country VALUES (3, 'UK');
INSERT INTO Country VALUES (4, 'Canada');
INSERT INTO Country VALUES (5, 'Australia');


INSERT INTO State VALUES (11, 'Gujarat', 1);
INSERT INTO State VALUES (12, 'Maharashtra', 1);
INSERT INTO State VALUES (13, 'California', 2);
INSERT INTO State VALUES (14, 'Ontario', 4);
INSERT INTO State VALUES (15, 'Sydney', 5);


INSERT INTO District VALUES (101, 'Rajkot', 11);
INSERT INTO District VALUES (102, 'Ahmedabad', 11);
INSERT INTO District VALUES (103, 'Mumbai', 12);
INSERT INTO District VALUES (104, 'Los Angeles', 13);
INSERT INTO District VALUES (105, 'Toronto', 14);


INSERT INTO Dept_info VALUES (201, 'HR');
INSERT INTO Dept_info VALUES (202, 'IT');
INSERT INTO Dept_info VALUES (203, 'Finance');
INSERT INTO Dept_info VALUES (204, 'Marketing');
INSERT INTO Dept_info VALUES (205, 'Sales');


INSERT INTO City_info VALUES (301, 'Rajkot City', 101);
INSERT INTO City_info VALUES (302, 'Ahmedabad City', 102);
INSERT INTO City_info VALUES (303, 'Mumbai City', 103);
INSERT INTO City_info VALUES (304, 'LA City', 104);
INSERT INTO City_info VALUES (305, 'Toronto City', 105);


INSERT INTO Emp_info VALUES (401, 'Ajay', 201, 301, 35000, 5);
INSERT INTO Emp_info VALUES (402, 'Meera', 202, 302, 45000, 3);
INSERT INTO Emp_info VALUES (403, 'Ravi', 203, 303, 60000, 7);
INSERT INTO Emp_info VALUES (404, 'Pooja', 204, 304, 50000, 4);
INSERT INTO Emp_info VALUES (405, 'Karan', 205, 305, 55000, 6);



--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 

SELECT e.Ename AS EmployeeName,
       dpt.Dname AS DepartmentName,
       e.Salary,
       e.Experience,
       c.Cname AS City,
       dist.Dname AS District,
       st.Sname AS State,
       ctr.Cname AS Country
FROM Emp_info e
JOIN Dept_info dpt ON e.Did = dpt.Did
JOIN City_info c ON e.Cid = c.Cid
JOIN District dist ON c.Did = dist.Did
JOIN State st ON dist.Sid = st.Sid
JOIN Country ctr ON st.Cid = ctr.Cid;
