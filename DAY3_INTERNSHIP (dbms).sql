create database vcet1;
use vcet1;

create table Customer(
Cust_Id int primary key,
Cust_Name varchar(30));
Insert into Customer values(1,'John'),(2,'Jane'),(3,'Bob');
insert into Customer Values(4,'helly'),(6,'Gigi');
select *from Customer;

delete from Customer Where Cust_Id =3;

create table Orderr(OrderId int primary key, OrderNo int , Cust_Id int,foreign key(Cust_Id) references Customer(Cust_Id));
Insert into Orderr values(1,101,1),(2,102,2),(3,103,3);
Insert into Orderr values(4,104,4);
Select *from Orderr;

select *
from Customer As C 
inner join Orderr As O
on C.Cust_Id = O.Cust_Id;

select *
from Customer As C 
right join Orderr As O
on C.Cust_Id = O.Cust_Id;

select *
from Customer As C 
left join Orderr As O
on C.Cust_Id = O.Cust_Id;

select *
from Customer As C 
join Orderr As O
on C.Cust_Id = O.Cust_Id;

create table Emp1(EmpId int primary key,Nmae varchar(20),Country varchar(20));
insert into Emp1 values(1,'Shubham','India'),(2,'Aman','Austrailia'),(3,'Naveen','Sri lanka'),(4,'Aditya','Austria'),(5,'Nishant','Spain');

create table Emp2(EmpId int Primary key,ame varchar(20),Country varchar(20));
insert into Emp2 values(1,'Tommy','England'),(2,'Allen','France'),(3,'Nancy','India'),(4,'Adi','Ireland'),(5,'Sandy','Spain');

Select Country From Emp1 
union all
Select Country From  Emp2
Order by Country;   

Select Country From Emp1 
intersect
Select Country From Emp2
Order by Country;   

Select Country From Emp1 
except
Select Country From Emp2
Order by Country;   


CREATE table test_dataa(new_id int , new_cat varchar(20));
insert into test_dataa values(100,'Agni'),(200,'Agni'),(500,'Dharti'),(700,'Dharti'),(200,'Vayu'),(300,'Vayu'),(500,'Vayu');

select new_id,new_cat,
sum(new_id) over(PARTITION BY new_cat order by new_id) as "Total",
avg(new_id) over(PARTITION BY new_cat order by new_id) as "Average",
count(new_id) over(PARTITION BY new_cat order by new_id) as "Count",
min(new_id) over(PARTITION BY new_cat order by new_id) as "Min",
max(new_id) over(PARTITION BY new_cat order by new_id) as "Max"
from test_dataa;

select new_id,new_cat,
sum(new_id) over(order by new_id rows between unbounded preceding and unbounded following) as "Total",
avg(new_id) over(order by new_id rows between unbounded preceding and unbounded following) as "Average",
count(new_id) over(order by new_id rows between unbounded preceding and unbounded following) as "Count",
min(new_id) over(order by new_id rows between unbounded preceding and unbounded following) as "Min",
max(new_id) over(order by new_id rows between unbounded preceding and unbounded following) as "Max"
from test_dataa;

select new_id,
row_number() over(order by new_id)as "row_no",
rank() over(order by new_id) as "rank",
dense_rank() over(order by new_id)as "dense_rank",
percent_rank() over(order by new_id) as "percent_rank"
from test_dataa;