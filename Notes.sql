
-- =========================15-06-2024==========================
create database student;
use Student;
drop database Student;

create schema student;
drop schema student;

-- DDL - data definition language - create, alter, drop, truncate
--=================================================================
create table result(rollno int,
					sname varchar(30),
                    grade char(1));
                    
describe result;
desc result;

alter table result add (percentage double);
alter table result add (grade char(1));
alter table result drop grade;

drop table result;

truncate table result;

-- DML- data manipulation language - insert, update, delete
--===========================================================
insert into result values (101, 'jamuna', 'A', 75.3);
insert into result values (102, 'jack', 'B', 65.3),(104, 'madhi', 'A', 74.3),(105, 'Hari', 'C', 55.3);
insert into result(rollno,grade,percentage) values (108, 'A', 75.3);
insert into result(rollno,grade,percentage) values (102, 'A', 75.3);

set sql_safe_updates =0;-- multi row affected
set sql_safe_updates =1;-- single row affected

update result set sname ="Gayathri";-- where rollno = 102;
delete from result;-- where rollno =102;

-- DQL/DRL - Data retrival language/data query langugae - select
--================================================================
select * from result;
select rollno, sname from result;

--===================================================================================

create table studentResult(rollno int primary key auto_increment,
							sname varchar(30) not null default "person",
                            total int,
                            comments varchar(20) unique,
                            check(total >=200)
							);

drop table studentResult;
describe studentResult;

insert into studentResult values(200,"Priya",480,"goods");
insert into studentResult values(101,"Priyan",490,"Excellant"); -- duplicate value not allowed
insert into studentResult(sname,total,comments) values("Priyan",490,"Excellant");-- null value are not allowed

insert into studentResult(rollno,total,comments) values(108,490,"Excellant");
insert into studentResult(rollno,sname,total) values(108,"Priya",480);

-- primary -  null, duplicate  are not allowed
-- not null - null is not allowed, duplicates are alllowed
-- unique - duplicate are not allowed, null is allowed
-- default - its takes as a default values
-- check - whether condition is true or false
-- Auto increment - values incremented automatically

insert into studentResult(rollno,total,comments) values(108,490,"Excellant");
insert into studentResult(rollno,total,comments) values(107,490,"Excellant");

select * from studentResult;

--==================================17-06-2024=========================================

create table student (sid int,
					sname varchar(20),
                    age int);
drop table student;

desc student;

-- Alter table
-- ===========================================
alter table student add primary key(sid);
alter table student drop primary key;

alter table student add unique(sid);
alter table student drop index sid;

alter table student modify sname varchar(20) not null;

alter table student alter sname set default 'null';

alter table student add check (age>=18);
alter table student drop check age;

alter table student  auto_increment =50;

alter table student add foreign key (age) references crayons1 (cid);

-- where clause
-- =======================================================
select * from result where percentage =75.3 and grade ='A';
select * from result where percentage =75.3 or grade ='A';
select * from result where not percentage =75.3;
select * from result where percentage between 65 and 76;


select * from result where grade in('A','B','C');
select * from result where grade="A" or  grade="B" or grade="C";

select * from result where sname like "j%";
select * from result where sname like "%i";
select * from result where sname like "m%i";
select * from result where sname like "%a%";
select * from result where sname like "_a%";

-- Conditional operators - >, < ,>=, <=, =, != or <>
select sname, percentage from result where percentage > 65;
select sname, percentage from result where percentage >= 65;
select sname, percentage from result where percentage < 65;
select sname, percentage from result where percentage <= 65;
select sname, percentage from result where percentage = 75.3;
select sname, percentage from result where percentage != 75.3; -- <>

-- Arithmetic operators --> +,-,/,*,%
select percentage+5 from result;
select percentage-5 from result;

-- Aggregate functions- avg(), sum(), count(), max(), min()
select avg(percentage) from result;
select sum(percentage) from result;
select max(percentage) from result;
select min(percentage) from result;
select count(percentage) from result;

-- order by
select * from result order by sname asc;
select * from result order by sname desc;
select * from result order by 1 asc;
select * from result where percentage >65  order by sname asc;

-- limit 
select * from result sname limit 4 ;
select * from result sname limit 4 offset 3;

--========================18-06-2024===========================

-- distinct
select distinct(rollno) from result;

-- rename 
rename table result to details;
rename table details to result;

-- alias
select max(percentage) as MaximumValue from result;

-- view
create view NewTable as
select sname, grade, percentage from result 
where percentage > 65 order by sname;

select * from NewTable;
drop view NewTable;

create or replace view  NewTable as
select rollno, sname, grade, percentage from result 
where percentage > 50 order by sname;

select * from result;
-- group by

select count(rollno), grade from result group by grade;
select max(percentage), grade from result group by grade;

/*
select count(rollno), grade from result where grade ='A'; 
select count(rollno), grade from result where grade ='B'; 
select count(rollno), grade from result where grade ='C'; 
*/

select count(rollno), grade from result where percentage >65 group by grade;
select count(rollno), grade from result where percentage >65
					  group by grade having count(rollno)>=3;
					  

--============================================================

-- DCL - Data Control Language (Grant, Revoke)

GRANT SELECT ON emp TO 'root'@'localhost';
GRANT SELECT, INSERT, DELETE, UPDATE ON emp TO 'root'@'localhost';
GRANT ALL ON emp TO 'root'@'localhost';

revoke select on emp from 'root'@'localhost';
REVOKE SELECT, INSERT, DELETE, UPDATE ON emp FROM 'root'@'localhost';

--=====================================================================

create table books(
	bno int primary key auto_increment,
    bname varchar(20),
    author varchar(30) default "jack thomson",
    price double,
    check(price >=100)
    );

create table author(
	id int not null,
    author varchar(30) default "jack thomson",
	city varchar(20),
	country varchar(20),
    bno int,
    foreign key(bno) references books(bno) 
     );

select * from books, author where books.bno=author.bno;
 select bname,books.author,country from books, author where books.bno=author.bno;
 select bname, author.author, country, price from books, author where books.bno = author.bno;
 
 