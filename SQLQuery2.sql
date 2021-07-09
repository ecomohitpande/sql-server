CREATE TABLE vrn(
e_id int not null, 
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar (20),
e_dept varchar (20),
primary key(e_id)
);


INSERT INTO vrn values(
1,'Sam', 95000, 45,'Male', 'operation'
);
INSERT INTO vrn values(
2,'Bob', 80000, 21, 'Male', 'Support');

INSERT INTO vrn values(3,'ram', 90000, 65,'Male', 'sales'
);
INSERT INTO vrn values(
4,'Bobi', 70000, 25, 'Male', 'analyst');

select *from vrn 
select e_name,e_salary  from vrn 

select * from vrn 

#### where commands 

select * from vrn where e_salary<90000;

### AND condition 
select * from vrn where e_dept= 'Support' AND e_salary> 70000;

#### OR 
 select * from vrn where e_dept= 'Suport' OR e_salary>70000;
 
 #### WHERE NOT 

 select * from vrn where e_GENDER= 'male';
 

 ##### wild card like  and between 

 select * from vrn where e_name LIKE 'B%';

 select * from vrn where e_age BETWEEN 21 AND 50;

### sum min max avg function 

 select sum(e_salary) from vrn; 
 select min(e_salary) from vrn; 
 select avg(e_salary) from vrn; 
 select max(e_salary) from vrn; 

### LTRIM fuction 
 select '       spartaaa'
 select LTRIM ('       spartaaa')

## lower case 
 select 'THIS IS SARTA' 
 select lower ('THIS IS SARTA')

### order case 
 select *from vrn order by e_salary
 select top 3* from vrn order by e_salary DESC 

 select avg(e_age), e_dept from  vrn GROUP BY e_dept ORDER BY avg(e_age);


 ### having clause 

 select e_dept, avg(e_salary) as avg_salary 
 from vrn 
 group by e_dept
 having avg(e_salary)>70000

 ###update statement 
update vrn set e_age = 48 where e_name ='Sam'

select * from vrn

update vrn set e_dept = 'sales' where e_gender='female' 

## delect key word 
delete from vrn where e_age = 48

### trucncated 
truncate table vrn
select from vrn 

##inner join 

CREATE TABLE depart1(
e_id int not null, 
e_name varchar(20),
e_location varchar(20),
e_age int,
primary key(e_id)
);
select * from depart

INSERT INTO depart1 values(
1, 'sales','newyork',25);
INSERT INTO depart1 values(
2, 'analyst', 'tehri',30);
INSERT INTO depart1 values(
3, 'operation', 'village',55);
INSERT INTO depart1 values(
4, 'main', 'jol', 80);

select vrn.e_name, vrn.e_dept, depart.e_name, depart.e_location 
from vrn 
inner join depart on vrn.e_dept= depart.e_name;

select vrn.e_name, vrn.e_dept, depart.e_name, depart.e_location 
from vrn 
full join depart on vrn.e_dept= depart.e_name;

##### update in join condition 

update vrn  set e_age =e_age+10
from vrn 
join depart on vrn.e_dept = depart.e_name
where e_location ='newyork'
select * from vrn 

delete vrn 
from vrn 
join depart on vrn.e_dept = depart.e_name
where e_location= 'newyork'

#### union operater 
select * from vrn 
union all
select * from depart

### intersect operator it retriet only common varible 
select * from vrn 
intersect 
select * from depart; 
select *from vrn

### create view 
create view female_employees1 AS
select * from vrn
where e_gender='male';
select * from female_employees

### alter table 
alter table vrn 
add e_dob date 

alter table vrn 
drop column e_dob

### megre 
merge mohit as m
using pandey as p
on m.e_id= p.e_id 
when matched 
		then update set m.e_name= p.e_name, m.e_age=p.e_age
when not matched by target
		then insert (e_id,e_name, e_salary, e_age, e_dept)
		values (p.e_id,p.e_name, e_dept, e_location, e_age) 
when not matched by source
		then delete;

###### scalar value function 
create function add_five(@num as int)
returns int 
as begin 
return( 
@num+5)
end
select dbo.add_five(10);

####end 
select * from vrn 
create function select_gender(@gender as varchar(20))
return table 
as
returns 
(select * from vrn where e_gender=@gender);

select *from dbo.select_gender ('male');

###########case function 

select *,grade=
case 
when e_salary >70000 then 'a'
when e_salary <=70000 then 'b'
else 'c'
end 
from mohit 
go

############# procedure 

create procedure age 
as
select e_age from mohit 
go 
exec age

select *from mohit 
#### transaction 
 begin try 
		begin transaction 
		update mohit set e_age=30 where e_gender= 'Male'
		update mohit set e_age=50 where e_gender= 'Male'
		commit transaction 
		print 'transaction com'
end try 
begin catch 
	rollback transaction 
	print 'transaction rollback'
end 

create database bi

select [bi].[dbo].[Stock].[Current Stock Quantity],[bi].[dbo].[Stock].[SKU ID],[bi].[dbo].[Stock].[Unit Price],
		[bi].[dbo].[Stock].[Average Lead Time (days)],[bi].[dbo].[Stock].[Maximum Lead Time (days)],
		[bi].[dbo].[Stock].[Units (Nos/Kg)],[bi].[dbo].[Past Orders].[Order Quantity],[dbo].[Past Orders].[Order Date]
	from [bi].[dbo].[Stock]
  inner join [bi].[dbo].[Past Orders] on [bi].[dbo].[Stock].[SKU ID]=[bi].[dbo].[Past Orders].[SKU ID] 