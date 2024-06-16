/*
create schema student;
drop database student;
*/
create database library;

-- CREATE TABLE
use library;
create table books(S_No int, Book varchar(50), Author varchar(30), Pages int, ISBN char(13), Price int, No_of_books int);

use library;
desc books;

use library;
insert into books values(1, 'Operating System', 'Silberschatz', 950, 9781118063330, 1500, 10);

use library;
select * from books;

-- ADD/DELETE COLUMN TO TABLE
use library;
alter table books add(Rating double);
use library;
alter table books drop Rating;

use library;
truncate table books;

use library;
insert into books values(2, 'Java: A Beginners Guide', 'Herbert Schildt', 720, 9780071809252, 800, 5),
						(3, 'Computer Organization and Design', 'David A. Patterson', 912, 9780124077263, 980, 3),
                        (3, 'Cybersecurity 101', 'Mark Stanislav', 400, 9781119439155, 750, 8);

use library;
insert into books(S_No, Book, Pages, Price) values(5, 'Database Systems', 990, 1000);


select * from books;

create table studentResult(rollNo int primary key auto_increment, sname varchar(30), total int not null default 0, check(total <600), comments varchar(30) default "good");
drop table studentResult;

insert into studentResult values(1, "dhanush", 400, "good");
insert into studentResult (sname, total, comments) values("arun", 200, "Excellent");

insert into studentResult (sname, total) values("saran", 450);
insert into studentResult (sname) values("saran");

update studentResult set total = 100 where rollNo = 4;

set sql_safe_updates =1;
update studentResult set total = 350 where sname="saran";

select * from studentResult;

