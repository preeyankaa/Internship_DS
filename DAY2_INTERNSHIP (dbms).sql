create database vcet;
use vcet;
create table student(
stud_name varchar(50),
roll_no int,
stud_id int primary key,
email varchar(20),
Address varchar(50),
DOB int
);

rename table student to students;

insert into students(stud_name,roll_no,stud_id)
values("prii",4,33456),
	  ("shrii",5,98745),
      ("grii",6,75938);

insert into students(stud_name,roll_no,stud_id, email,Address)
values("seri",15,54389,null,"301 seoul korea"),
	  ("rinku",21,47975,"rinku@gmail.com","301 seoul korea"),
	  ("da bing",18,43799,"dabing@gmail.com","426 shenzen china"),
      ("xu kai",29,57899,"xukai@gmail.com","426 shenzen china");
      
select *from students;

select stud_name, roll_no from students 
where roll_no <5; 

create table stud as 
select *from students;
select *from stud;

create temporary table studs (stud_name varchar(10),roll_no int);
insert into studs values("prii",4),("grii",6);
select *from studs;

select count(roll_no) from students;
select sum(roll_no) from students;
select avg(roll_no) from students;
select min(roll_no) from students;
select max(roll_no) from students;

select *from students where roll_no between 2 and 5;

select *from students where stud_name like '%ii%';

select *from students 
where stud_id between 20000 and 70000
and roll_no between 2 and 5;

select *from students 
where stud_id between 40000 and 70000
or roll_no between 2 and 5;

select *from students where not stud_name='shrii';

select *from students where stud_name <> "prii";

select *from students order by roll_no desc;

select address,count(stud_name) from students group by address;

create table payment(id int primary key,amount int,modee varchar(10),payment_date date);

insert into payme nt
values(1,60,'cash','2024-04-02'),
(2,30,'cc','2024-04-05'),
(3,90,'cc','2024-04-10'),
(4,40,'db','2024-04-20'),
(5,70,'mp','2024-04-29'),
(6,20,'cash','2024-05-05');
select *from payment;

select modee, sum(amount) as total
from payment
group by modee
having sum(amount)>=80
order by modee desc;

create table emp1( ID int primary key, Namee varchar(20),Gender varchar(2),Dept varchar(20),Education varchar(20),Month_of_Joining varchar(10),Salary int);

INSERT INTO emp1(ID, Namee, Gender, Dept, Education, Month_Of_Joining, Salary) VALUES
(1001, 'Ajay', 'M', 'Engineering', 'Doctoral', 'January', 25),
(1002, 'Babloo', 'M', 'Engineering', 'UG', 'February', 23),
(1003, 'Chhavi', 'F', 'HR', 'PG', 'March', 15),
(1004, 'Dheeraj', 'M', 'HR', 'UG', 'January', 12),
(1005, 'Evina', 'F', 'Marketing', 'UG', 'March', 16),
(1006, 'Fredy', 'M', 'Sales', 'UG', 'December', 10),
(1007, 'Garima', 'F', 'Sales', 'PG', 'March', 10),
(1008, 'Hans', 'M', 'Admin', 'PG', 'November', 8),
(1009, 'Nanika', 'F', 'Admin', 'Intermediate', 'April', 7),
(1010, 'Jai', 'M', 'Peon', 'High School', 'December', 4);

select *from emp1;

select Dept , sum(Salary) as Total 
from emp1
where Education <> 'UG' 
Group by Dept 
having sum( Salary )>=20 ;

select Dept ,sum(Salary) as Total
from emp1 
group by Dept 
having sum(Salary)>=15
order by sum(Salary) desc;

select Namee, Salary + 5 from emp1;

