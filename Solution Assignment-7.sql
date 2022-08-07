use company;
select * from customers;
/* 1 Find Customer name and customer's city having same rating as 'Grass' using subqueries*/
SELECT Snum, cname,
       city
FROM customers
WHERE rating =
    (SELECT rating
     FROM customers
     WHERE cname='Grass');
/* 2. Find all orders for the customer named Cisneros. Assume you do not know his customer number (cnum).*/
SELECT onum "ALL ORDERS",
       cnum
FROM orders
WHERE cnum=
    (SELECT cnum
     FROM customers
     WHERE cname='cisneros');
/* 3. Find the names and ratings of all customers who have above-average
orders*/
SELECT cname, rating FROM customers
WHERE cnum IN (SELECT cnum FROM orders WHERE amt > (SELECT avg(amt) FROM orders));

/* 4. Find customers whose ratings are equal to or greater than
ANY of Serres’. */
SELECT *
FROM customers
WHERE rating >=ANY
    ( SELECT rating
     FROM customers
     WHERE snum IN
         ( SELECT snum
          FROM salespeople
          WHERE sname='serres' ) );
/* 5. Using ANY or ALL find all salespeople details who have no
customers located in their city.*/
SELECT *
FROM salespeople
WHERE (snum,
       city) NOT IN
    (SELECT snum,
            city
     FROM customers);
/* 6. FInd all orders for amounts greater than any for the
customers in London */
SELECT *
FROM orders
WHERE amt> ANY
    ( SELECT amt
     FROM orders
     WHERE cnum IN
         ( SELECT cnum
          FROM customers
          WHERE city='london' ) );
select * from salespeople;
/* 7 Find Sname and City name of the salespeople where commision is greater than 0.11 and less than 0.15 using subqueries */
select sname, city from salespeople where comm = (select comm from salespeople where Comm> '0.12' AND Comm < '0.14');
/* LAB 08 */
/* 1 Write a query to only the first 5 order details rearranged in descending order by order date. 
(Check the query execution times without or without indexing).*/
SELECT * FROM orders ORDER BY odate desc limit 5;

/* 2. Write a query that gives the names of both the salesperson and the customer for
each order along with the order number.(check the query execution times with and without indexing)*/
SELECT sname, cname, onum
FROM orders o, customers c, salespeople s
WHERE o.snum=c.snum AND o.snum=s.snum;
/*create Index onum */
create index onum_indx on orders(onum);

SELECT sname, cname, onum
FROM orders o, customers c, salespeople s
WHERE o.snum=c.snum AND o.snum=s.snum;
/*3. Find all customer details having rating greater than San Jose’s average. (check the query execution times with and without indexing)*/
select * from customers where rating>=(select avg(rating) from customers where city='san jose');
/* 4 Find rating, customer number and commission (in the given order sequence) obtained by common salesnumber 
creating multicolumn indexes (take any two suitable columns )*/
create index comb_indx on customers(cnum,snum);
select c.rating, c.cnum, s.comm from customers as c inner join
 salespeople as s on c.snum = s.snum;

/*5  Display all Order number, Order Amount, and Order Date commissions of the sales person of order amount greater than 1000*/
select  o.onum, O.amt, o.odate, s.comm from orders as o left join salespeople as s on o.snum=s.snum where amt>1000;
create index amtindx on orders (amt);
select  o.onum, O.amt, o.odate, s.comm from orders as o left join salespeople as s on o.snum=s.snum where amt>1000;

/* 6 Write a query that selects all orders for amounts greater than any for the
customers in Rome. (check the query execution times with and without indexing)*/
SELECT * FROM orders
WHERE amt> ANY ( SELECT amt FROM orders
     WHERE cnum IN ( SELECT cnum FROM customers
          WHERE city='Rome' ) );
/*7 Drop all indexes created in different tables till now */



 