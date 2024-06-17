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