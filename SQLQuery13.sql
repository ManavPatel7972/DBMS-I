--Lab 13   Implement Advanced level Joins 
--Create following table (Using Design Mode)

USE CSE_3A_108;

select * from Author;
select * from publisher;
select * from Book;


--From the above given table perform the following queries:  
--Part – A: 

--1. List all books with their authors
select Title,authorName
from Book
Join Author
on Book.AuthorID = Author.AuthorID;

--2. List all books with their publishers.
select Title,PublisherName
from Book
Join Publisher
on Book.PublisherID = Publisher.PublisherID;


--3. List all books with their authors and publishers. 
select 
Title,AuthorName,PublisherName
from Book
Join Author
on Book.AuthorID = Author.AuthorID
Join Publisher
on Book.PublisherID = Publisher.PublisherId

--4. List all books published after 2010 with their authors and publisher and price. 
select
Title,AuthorName,PublisherName,Price,PublicationYear
from Book
Join Publisher
on Book.PublisherID = Publisher.PublisherID
Join Author
on Book.AuthorID = Author.AuthorID
where PublicationYear > '2010'


--5. List all authors and the number of books they have written.
select 
AuthorName,COUNT(BookID) as Count_Book
from Book
join Author
on Book.AuthorID = Author.AuthorID
group by AuthorName


--6. List all publishers and the total price of books they have published.
select 
PublisherName,SUM(Price) as Total_Price
from Publisher
join Book
on Publisher.PublisherID = Book.PublisherID
group by PublisherName

select * from Book;

--7. List authors who have not written any books.
select AuthorName 
from Author EXCEPT
(select 
AuthorName
from Book
join Author
on Book.AuthorID = Author.AuthorID
group by AuthorName)



