create database company;
use company;
CREATE TABLE SALESPEOPLE(
Snum int,
Sname varchar(10),
City varchar(10),
Comm decimal(3,2));
desc SALESPEOPLE;
CREATE TABLE CUSTOMERS(
Cnum int,
Cname varchar(10),
City varchar(10),
Rating int,
Snum int);
CREATE TABLE ORDERS(
Onum int,
Amt decimal(7,2),
Odate date,
Cnum int,
Snum int);
INSERT INTO ORDERS
VALUES(3001,18.69,'1990-10-03',2008, 1007);
INSERT INTO ORDERS
VALUES(3003,767.19,'1990-10-03',2001,1001),(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002), (3006,1098.16,'1990-10-03',2008,1007),(3009,1713.23, '1990-10-04',2002,1003),
(3007,75.75, '1990-10-04',2004,1002),(3008,4723.00, '1990-10-05',2006,1001),(3010,309.95, '1990-10-06',2004,1002),
(3011,9891.88, '1990-10-06',2006,1001);
select * from ORDERS;
INSERT INTO customers
VALUES(2001,'Hoffman','London',100,1001);
INSERT INTO customers
VALUES(2002,'Giovanni','Rome',200,1003);
INSERT INTO customers
VALUES(2003,'Liu','San Jose',200,1002);
INSERT INTO customers
VALUES(2004,'Grass','Berlin',300,1002);
INSERT INTO customers
VALUES(2006,'Clemens','London',100,1001);
INSERT INTO customers
VALUES(2008,'Cisneros','San Jose',300,1007);
INSERT INTO customers
VALUES(2007,'Pereira','Rome',100,1004);
INSERT INTO SALESPEOPLE
VALUES(1001,'Peel','London',.12);
INSERT INTO SALESPEOPLE
VALUES(1002,'Serres','San Jose',.13);
INSERT INTO SALESPEOPLE
VALUES(1004,'Motika','London',.11);
INSERT INTO SALESPEOPLE
VALUES(1007,'Rifkin','Barcelona',.15);
INSERT INTO SALESPEOPLE
VALUES(1003,'Axelrod','New York',.10);
select * from customers;
select * from SALESPEOPLE;
/* Q.1 Write a select command that produces the order number, amount, and date for all rows in the
Orders table.*/
select Onum, Amt, Odate from orders;
/*2) Write a query that produces all rows from the Customers table for which the salesperson’s
number is 1001.*/
select * from customers where Snum = 1001;
/*3) Write a query that displays the Salespeople table with the columns in the following order: city,
Sname, Snum, Comm.*/
select city, Sname, Snum, Comm from salespeople;
/*4) Write a select command that produces the rating followed by the name of each customer in San
Jose.*/
select rating, cname from customers where city ="San Jose";
/*5) Write a query that will produce the snum values of all salespeople (suppress the duplicates) with
orders in the Orders table.*/
select distinct snum from orders;
/* 6) Write a query that will give you all orders for more than Rs. 1,000.*/
select * from orders where amt>1000;
/*7) Write a query that will give you the names and cities of all salespeople in London with a
commission above .10.*/
select sname, city from salespeople where city = "London" and comm>0.10;
/*8) Write a query on the Customers table whose output will exclude all customers with a rating <=
100, unless they are located in Rome.*/
select * from customers where rating>100 or city ="Rome";
/*9) What will be the output from the following query?
Select * from Orders
where (amt < 1000 OR
NOT (odate = "1990-10-03"
AND cnum > 2003));*/
Select * from Orders
where (amt < 1000 OR
NOT (odate = "1990-10-03"
AND cnum > 2003));
/*10)find all records in the customer table with null values in city column.*/
select * from customers where city='null';
/* 11)Arrange the Orders table by descending customer number.*/
select * from orders order by cnum desc;
/*12) List names of all customers matched with the salespeople serving them.*/
select a.sname,a.city,b.cname from salespeople a,customers b where a.snum=b.snum;
/* USE SPECIAL OPERATORS IN SQL QUERIES*/
/*13)Write two different queries that would produce all orders taken on October 3rd or 4th, 1990.*/
select * from orders where Odate="1990-10-03" or Odate="1990-10-04";
select * from orders where Odate in ("1990-10-03", "1990-10-04");
/*14) Write a query that selects all of the customers serviced by Peel or Motika.
(Hint: the snum field relates the two tables to one another).*/
select * from customers where snum in (select snum from salespeople where sname ="Peel" or sname ="Motika");
/* 15) Write a query that will produce all the customers whose names begin with a letter from ‘A’ to
‘G’.*/
select * from customers where cname regexp '^[A-G]';
/* 16) Write a query that selects all customers whose names begin with the letter ‘C’.*/
select * from customers where cname regexp '^C';
/*Write a query that selects all orders except those with zeroes or NULLs in the amt field.*/
select * from orders where not (amt =0 or amt is NULL);
