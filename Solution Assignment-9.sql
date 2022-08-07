/* 1. Create a view that shows all of the customers who have the highest ratings */
CREATE VIEW h_rated_cust AS SELECT * FROM customers WHERE 
rating= (SELECT max(rating) FROM customers);

/* use the created view to display results */
select * from h_rated_cust;
/* 2 Create a view that shows the number of salespeople in each city. */
CREATE VIEW tns_city AS SELECT city, count(city) "NO. OF SALES PEOPLE" FROM salespeople GROUP BY city;
/* display result from the view */
select * from tns_city;

/* 3. Create a view that shows the average and total orders for each salesperson after his or her
name. Assume all names are unique. */
CREATE VIEW AV_TOT_SAL AS SELECT sname, avg(onum) AVERAGE, count(onum) "TOTAL ORDERS"
FROM salespeople JOIN orders using(snum) GROUP BY sname;

/* Display results form view*/
select * from AV_TOT_SAL;

/* 4. Create a view that shows each salesperson with multiple customers */
CREATE VIEW multi_cust AS SELECT sname, cname FROM salespeople JOIN customers USING (snum);
/* Display results form view*/
select * from multi_cust;

/* 5. Create a view of the Salespeople table called Commissions. This view will include only the snum
and comm fields. Through this view, someone could enter or change commissions, but only to
values between .10 and .20. */
CREATE VIEW commission AS SELECT snum, comm FROM salespeople
WHERE comm BETWEEN .10 AND .20;

/* Display results form view*/
select * from commission;

