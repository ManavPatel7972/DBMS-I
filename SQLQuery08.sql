--Part – A: 
--1. Display Total Sales Amount by Region. 
--2. Display Average Sales Amount by Product 
--3. Display Maximum Sales Amount by Year 
--4. Display Minimum Sales Amount by Region and Year 
--5. Count of Products Sold by Region 
--6. Display Sales Amount by Year and Product 
--7. Display Regions with Total Sales Greater Than 5000 
--8. Display Products with Average Sales Less Than 10000 
--9. Display Years with Maximum Sales Exceeding 500 
--10. Display Regions with at Least 3 Distinct Products Sold. 
--11. Display Years with Minimum Sales Less Than 1000 
--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount 
--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years. 
--14. Find the Product with the Highest Sales Across All Regions in 2023. 
--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.

USE CSE_3A_108;	

create table sales_data(
	region varchar(30),
	product varchar(25),
	salary int,
	year int);

insert into sales_data values	('north america','watch',1500,2023),
								('europe','mobile',1200,2023),
								('asia','watch',1800,2023),
								('north america','tv',900,2024),
								('europe','watch',2000,2024),
								('asia','mobile',1000,2024),
								('north america','mobile',1600,2023),
								('europe','tv',1500,2023),
								('asia','tv',1100,2024),
								('north america','watch',1700,2024);

select *
from sales_data;


--1. Display Total Sales Amount by Region. 
select sum(salary) as Tatal_Salary
from sales_data
group by region;

--2. Display Average Sales Amount by Product
select AVG(salary) as Avg_Salary
from sales_data
group by product;

--3. Display Maximum Sales Amount by Year
select MAX(salary) as Max_Salary
from sales_data
group by year;

--4. Display Minimum Sales Amount by Region and Year 
select MAX(salary) as Max_Salary
from sales_data
group by year,region;

--5. Count of Products Sold by Region 
select COUNT(product) as Count_Product
from sales_data
group by region;

--6. Display Sales Amount by Year and Product 
select Sum(salary) as Amount
from sales_data
group by year,product;

--7. Display Regions with Total Sales Greater Than 5000 
select region,SUM(salary) As total
from sales_data
group by region
HAVING SUM(salary) > 5000;

--8. Display Products with Average Sales Less Than 10000
select product,AVG(salary) As total
from sales_data
group by product
HAVING AVG(salary) < 10000;

--9. Display Years with Maximum Sales Exceeding 500 
select year,MAX(salary) As total
from sales_data
group by year
HAVING MAX(salary) > 500;

--10. Display Regions with at Least 3 Distinct Products Sold.
select region,COUNT(DISTINCT product) As total
from sales_data
group by region
HAVING COUNT(DISTINCT product) > 3;

--11. Display Years with Minimum Sales Less Than 1000 
select year,MIN(salary) As MIN_Salary
from sales_data
group by year
HAVING MIN(salary) < 1000;

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount 
select SUM(salary) As Total_Salary
from sales_data
where year = '2023'
group by region
order by SUM(salary);

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
select TOP 1 region,SUM(salary) As MIN_Salary
from sales_data
where product = 'Mobile'
group by region

--14. Find the Product with the Highest Sales Across All Regions in 2023.
select TOP 1 product,SUM(salary) As MAX_Salary
from sales_data
where year = '2023'
group by product
order by SUM(salary) desc;

--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000. 
select TOP 1 region,SUM(salary) As MAX_Salary
from sales_data
where product = 'TV' AND year = '2023'
group by region
having SUM(salary) > 1000;



--Part – B: 
--1. Display Count of Orders by Year and Region, Sorted by Year and Region 
--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 
--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending 
--4. Display Top 3 Regions by Total Sales Amount in Year 2024 
--5. Find the Year with the Lowest Total Sales Across All Regions. 


--1. Display Count of Orders by Year and Region, Sorted by Year and Region 
select year,region,COUNT(*) As Count_Product
from sales_data
group by year,region
order by year,region;

select * from sales_data; 

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 
select region,SUM(salary) As MAXSUM_Product
from sales_data
group by region
HAVING SUM(salary) > 1000
order by region;

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending 
select year,SUM(salary) As MAXSUM_Product
from sales_data
group by year
HAVING SUM(salary) < 10000
order by year DESC;

--4. Display Top 3 Regions by Total Sales Amount in Year 2024 
select top 3 region,SUM(salary) As MAXSUM_Product
from sales_data
where year = '2024'
group by region;

--5. Find the Year with the Lowest Total Sales Across All Regions. 
select top 1 year,SUM(salary) As MAXSUM_Product
from sales_data
group by year
order by SUM(salary) ASC;


--Part – C: 
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 
--2. Display Years with More Than 1 Orders from Each Region 
--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending. 
--4. Find out region wise duplicate product. 
--5. Find out year wise duplicate product. 

--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 
select product,AVG(salary) As AVG_Product
from sales_data 
group by product
having avg(salary) >1000 and avg(salary) < 2000
order by product;

--2. Display Years with More Than 1 Orders from Each Region 
select year,COUNT(*) As Count_Pro
from sales_data 
group by year,region
HAVING COUNT(*) > 1;
select * from sales_data;

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
select region,AVG(salary) AS Avg
from sales_data
where year = '2023'
group by region
having AVG(salary) > 1500
order by AVG(salary) desc;

--4. Find out region wise duplicate product. 
select region,count(product) 
from sales_data
group by region,product
HAVING count(product) > 1;
 

--5. Find out year wise duplicate product.
select year,count(product) 
from sales_data
group by year,product
HAVING count(product) > 1;

