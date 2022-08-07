use company;
/* insert into order table onum=3006, Amt= 254.15, odate=1990-10-10, cnum = 2010, Snum =1008*/
/*1.  Find customers name, rating given and commission obtained by common salesnumber */
select c.cname, c.rating, s.comm from customers as c inner join
 salespeople as s on c.snum = s.snum;
/* 2. Display  amt of order, order date and name of the salesperson who made the sale left join */
select  o.amt, o.odate, s.sname from orders as o left join salespeople as s on o.snum=s.snum;
/* 3. Display all Order number, Order Amount, and Order Date commissions of the sales person */
select  o.onum, O.amt, o.odate, s.comm from orders as o left join salespeople as s on o.snum=s.snum;
/*4. Display all salespeople details and rating of purchase by the customers */
select c.rating, s.snum, s.sname, s.city, s.comm from customers as c right join salespeople as s on c.snum=s.snum;
/* Display all customers and order details using full join */
select * from customers as c left join orders as o on c.snum= o.snum 
union 
select * from customers as c right join orders as o on c.snum= o.snum;