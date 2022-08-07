Create database university;
use university;
create table student(
Sname varchar(100),
percentage decimal (2,2),
dob date,
age int,
gender char,
 city varchar(20),
 courses varchar(30));
 desc student;
 insert into student values('ABC', '56','1995-11-03',23,'M','DL','CSE'),('ADC', '60','1998-08-23',25,'F','KL','CSE'),
 ('PQR', '80','1997-04-15',21,'M','AP','ECE'),('TRD', '67','2000-07-02',22,'M','TN','ME'),('TQR', '58','2002-07-10',20,'F','KL','AE'),('TYU', '78','2001-10-15',21,'M','KA','CSE'),
 ('HIG', '89','1996-05-22',25,'M','KL','ECE');
ALTER TABLE student MODIFY percentage int;
desc student;
select * from student;
select * from student where age>22;
/* Creating Index on single column */
create index stdage on student(age);
/* display index */
show indexes from student;
/* check Query Run Time */
select * from student where age>22;
/* Create multiple column indexes */
create index comb_indx on student(age,percentage);
select * from student where age>22 AND percentage>60;
/*drop indexes */
ALTER TABLE student DROP INDEX comb_indx;