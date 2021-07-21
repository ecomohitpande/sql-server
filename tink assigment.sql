assigment is about finding that returns top 3 authors who sold the most books in tota && that returns authors who has written more than 3 books
### creating first table (tink)

create database tink

create table tink(
id int not null,
author_name varchar(18),
book_name varchar(18));

insert into tink values(1, 'author_1', 'book_1');
insert into tink values(2, 'author_1', 'book_2');
insert into tink values(3, 'author_2', 'book_3');
insert into tink values(4, 'author_2', 'book_4');
insert into tink values(5, 'author_2', 'book_5');
insert into tink values(6, 'author_3', 'book_6');
select *from tink

##### creating table 2 (tink2)

create table tink2(
id int not null,
book_name varchar(18),
sold_copies int );

insert into tink2 values(1,'book_1', 1000);
insert into tink2 values(2,'book_2', 1500);
insert into tink2 values(3,'book_3', 34000);
insert into tink2 values(4,'book_4', 29000);
insert into tink2 values(5,'book_5', 4000);
insert into tink2 values(6,'book_6', 4400);

update tink2 set sold_copies = 40000 where book_name='book_5';

select* from tink
select* from tink2

##### 1.Question (Write a SQL query that returns top 3 authors who sold the most books in total) (time took 7 to 8 min)

select a.[author_name], sum(b.[sold_copies]) as [total sold copy]
from tink a inner join tink2 b
on a.[book_name]= b.book_name
group by a.[author_name]
order by [total sold copy] desc

### or 

select tink.author_name, sum(tink2.sold_copies) as total_sold_copies 
from tink inner join tink2
on tink.book_name= tink2.book_name
group by tink.author_name 
order by total_sold_copies desc  

##top three authors sold max books

#####   2. Question (Write a SQL query that returns authors who has written more than 3 books)(time took 4 to 5 min)

select* from tink
select  count(book_name), author_name
from tink 
group by author_name
having count(book_name)> 3   

#### there is no author who has written more than 3 book 
