create database sona_bookstore;
use sona_bookstore;
create table books (
book_id int, 
title varchar (150), 
author varchar (150),
category varchar(150),
price decimal (8,2),
stok int,
published_year int
);
insert into books 
values 
(1, 'Python for Beginners', 'John Smith', 'Technology', 450.00, 25, 2020),
(2, 'Advanced SQL', 'Mary Johnson', 'Technology', 650.00, 15, 2019),
(3, 'Data Science Handbook', 'David Lee', 'Technology', 900.00, 10, 2021),
(4, 'Atomic Habits', 'James Clear', 'Self Help', 550.00, 30, 2018),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 400.00, 0, 2016),
(6, 'The Psychology of Money', 'Morgan Housel', 'Finance', 500.00, 18, 2020),
(7, 'Deep Learning Basics', 'Andrew Brown', 'Technology', 1200.00, 8, 2022),
(8, 'Ikigai', 'Hector Garcia', 'Self Help', 350.00, 40, 2017);

create table Customers (
customer_id int,
name varchar(150),
city varchar(150),
email varchar(120),
 signup_date date
 );


create table orders (
order_id int,
customer_id int,
book_id int,
quantity int,
order_date date,
total_amount decimal(10,2)
);

insert into Orders
values
(1, 1, 1, 2, '2024-12-10', 900.00),
(2, 2, 3, 1, '2025-01-05', 900.00),
(3, 3, 4, 1, '2025-01-20', 550.00),
(4, 4, 2, 2, '2025-02-01', 1300.00),
(5, 5, 6, 1, '2025-02-10', 500.00),
(6, 1, 7, 1, '2025-02-15', 1200.00),
(7, 6, 8, 3, '2025-02-18', 1050.00);

--- 2nd question ---
/*Add a new column rating DECIMAL(2,1) in Books table*/

alter table books 
add rating decimal(2,1);

---- 3rd Questions -----
/* Modify price column to allow bigger values.*/

alter table books 
modify price decimal(10,2);

---- 4rd Question ---
/*Rename column name to customer_name in Customers.*/

alter table customers
rename column name to customer_name;

---- 5th questions -----
/* Remove column rating from Books.*/

alter table books 
drop rating;


TRUNCATE TABLE books;
--- 6th questions ----
/*Insert at least 5 records into Books.*/

insert into books
values
(1, 'Python for Beginners', 'John Smith', 'Technology', 450.00, 25, 2020),
(2, 'Advanced SQL', 'Mary Johnson', 'Technology', 650.00, 15, 2019),
(3, 'Data Science Handbook', 'David Lee', 'Technology', 900.00, 10, 2021),
(4, 'Atomic Habits', 'James Clear', 'Self Help', 550.00, 30, 2018),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 400.00, 0, 2016),
(6, 'The Psychology of Money', 'Morgan Housel', 'Finance', 500.00, 18, 2020),
(7, 'Deep Learning Basics', 'Andrew Brown', 'Technology', 1200.00, 8, 2022),
(8, 'Ikigai', 'Hector Garcia', 'Self Help', 350.00, 40, 2017);

/*Ques Increase price of all Technology category books by 10%.*/

update books 
set price = price * 1.10
where  category = "Technology";

select * from books;

/* Update stock when new shipment arrives (+20 stock for a book).*/

update books 
set stok = stok +20;

/*Delete books that have stock = 0.*/

delete from books 
where stok = 0;

/* Show all books sorted by price descending.*/

select * from books
order by price desc;

/*Find books with price between 300 and 800.*/

select * from books 
where price between 300 and 800;

/*Display unique categories.*/

select distinct category
from books;

/*Find total stock available in store*/

SELECT SUM(stok) AS Total_Stok
FROM Books;

/*Check unique Customer name */

select distinct customer_name
from customers;

/*check uique city name*/

select distinct city
from customers;

/*check the total amount orders*/

select sum(total_amount) as total_orders
from orders;

/* Increae total quanity +10 all orders table */

update orders
set quantity = quantity + 10
where quantity >1;

select * from orders;

/* Increase the Total Amount by 10% for all orders where the Quantity is greater than 10.*/

update orders 
set total_amount = total_amount * 1.10
where quantity >10;

/* Find the highest Total Amount from the Orders table.*/

select max(total_amount) as highest_total_amount
from orders;

/* Find the lowest total amount from the orders table.*/

select min(total_amount) as lowest_total_amount
from orders;

/* Find the Average total amount form the order tables*/

select avg(total_amount) as total_average_amount
from orders;

/*check the order date for ascending table */
select * from orders 
order by order_date asc;

/*Display all books whose price is greater than 500.*/

select * from books 
where price >500;

/*Find all books published after 2020.*/

select * from books 
where published_year > 2020;

/*Show books written by 'John Smith'.*/

select * from books 
where author = 'John Smith';

/*Display books belonging to the 'Technology' category.*/

select * from books 
where category = 'Technology';

/*Find books whose stock is less than 10.*/

select * from books 
where stok <10;

/*Show the top 3 most expensive books.*/

select * from books
order by price desc
limit 3;

/*Show the 5 cheapest books*/

select * from books 
order by price asc
limit 5;

/*Count the total number of books*/

select count(book_id) as total_numbers_of_books
from books;

/* Find the average price of all books.*/

select avg(price) as average_price_books
from books;

/*Find the minimum and maximum book price.*/

select 
min(price) as miniumn_book_price,
 max(price) as maxiumn_book_price
from books;

/*Find the total value of all books in stock (price × stock).*/

select sum(price * stok) as total_stock_value
from books;

/*Display books ordered by published year.*/

select * from books
order by published_year asc;

/*Find books whose title starts with 'P'.*/
select * from books 
where title like "p%";

/*Find books whose title ends with 'y'*/

select * from books 
where title like "%y";

select * from books
where title like "%p%";

select * from books
where title like "_y%";

--- Aggregate Functions & GROUP BY---
/*Count the number of books in each category.*/
select category,
 count(*)as total_book
from books 
group by category;

/*Find the average price for each category.*/

select category,
avg(price) as average_price 
from books 
group by category;

/*Find the highest-priced book in each category.*/

select category,
max(price) as highest_price_book
from books 
group by category;

/*Show categories having more than 2 books.*/

select category, count(book_id) as total_books
from books 
group by category 
having  total_books >2;

/*Find the total sales amount from the Orders table.*/

select sum(total_amount) as total_sales
from orders;

/*Find the average order amount.*/

select avg(total_amount) AS average_order_amount
FROM orders;

/*Find the highest order amount.*/

select max(total_amount) as highest_order_amount
from orders;

/*Find the lowest order amount.*/

select min(total_amount) as lowest_order_amount
from orders
order by total_amount asc;

/*Count total orders placed by each customer.*/

select customer_id,
count(order_id) as total_orders
from orders
group by customer_id;





