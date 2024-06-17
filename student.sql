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
alter table books add(Date_of_publish date);
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

update books set Date_of_publish='1990-05-01' where S_No=5;

select * from books;

-- ================================================================================================

create table studentResult(rollNo int primary key auto_increment,
							sname varchar(30), 
                            total int not null default 0, check(total <600), 
                            comments varchar(30) default "good");
drop table studentResult;

insert into studentResult values(1, "dhanush", 400, "good");
insert into studentResult (sname, total, comments) values("arun", 200, "Excellent");

insert into studentResult (sname, total) values("saran", 450);
insert into studentResult (sname) values("saran");

update studentResult set total = 100 where rollNo = 4;

set sql_safe_updates =1;
update studentResult set total = 350 where sname="saran";

use library;
select * from studentResult;

select sname,comments from studentResult where total between 250 and 400;
select sname from studentResult where sname like '%n';
select * from studentResult where total=250 or comments='Excellent';

create table employee(EMPNO int primary key, ENAME varchar(25), JOB varchar(30), MGR int, HIREDATE date, SAL int, COMM int, DEPTNO int);
desc employee;

alter table employee modify ENAME varchar(25) not null;

insert into employee(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, 20);

INSERT INTO employee(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) 
VALUES	(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 30),
		(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 30),
		(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, 20),
		(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 30),
		(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, 30),
		(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, 10),
		(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, 20),
		(7839, 'KING', 'PRESIDENT', null, '1981-11-17', 5000, 10),
		(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 30),
		(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, 20),
		(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, 30),
		(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, 20),
		(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, 10);

update employee set COMM=300 where EMPNO=7499;
update employee set COMM=500 where EMPNO=7521;
update employee set COMM=1400 where EMPNO=7654;

-- 1. WAQTD details of employee who earns salary greater than 1250 and less than 2000. 
select * from employee where SAL>1250 and SAL<2000;

-- 2. WAQTD details of employee where salary should be less than 1500 or should be working as team leader.
select * from employee where SAL<1500 or JOB='TEAMLEADER';

-- 3. WAQTD details of employee working as clerk and earning less than 1300.
select * from employee where JOB='CLERK' and SAL<1300;

-- 4. WAQTD name and hiredate of employee working as manager in dept 30.
select ENAME, HIREDATE from employee where JOB='MANAGER' and DEPTNO=30;

-- 5. WAQTD details of emp along with annual salary if they are working in dept 30 as salesman and their annual salary has to greater than 1500.
select * from employee where DEPTNO=30 and JOB='SALESMAN' and SAL>1500;

-- 6. WAQTD all the details of employee working in dept 30 or as supervisior.
select * from employee where DEPTNO=30 or JOB='SUPERVISOR';

-- 7. WAQTD name of the employee who's salary is less than 1100 and their designation is clerk.
select ENAME from employee where SAL<1100 and JOB='CLERK';

-- 8. WAQTD name and salary annual salary and dept no if dept no is 20 earning more than 2300 and annual salary exceeds 3000.
select ENAME, SAL, DEPTNO from employee where DEPTNO=20 and SAL>2300;

-- 9. WAQTD empno and name of the employee working as manager in dept 20.
select EMPNO, ENAME from employee where JOB='MANAGER' and DEPTNO=20;

-- 10. WAQTD details of employee working in dept 20 or 30.
select * from employee where DEPTNO in (20, 30);

-- 11. WAQTD details of employee working as engineer in dept 10.
select * from employee where JOB='ENGINEER' and DEPTNO=10;

-- 12. WAQTD details of employee working as doctor with salary 2980.
select * from employee where JOB='DOCTOR' and SAL=2980;

-- 13. WAQTD name and dept no of employee working in dept no 20 or 30.
select ENAME, DEPTNO from employee where DEPTNO in (20, 30);

-- 14. WAQTD details of employee who is not working as clerk or manager. 
select * from employee where JOB not in('CLERK', 'MANAGER');

-- 15. WAQTD details of employee hiredate after 2020 and before 2021. 
select * from employee where HIREDATE between '2020-01-01' and '2021-01-01';
select * from employee where HIREDATE between '1982-01-01' and '1983-01-01';

-- 16. WAQTD details of employee hiredate during the year 2021.
select * from employee where HIREDATE between '2021-01-01' and '2021-12-31';
select * from employee where HIREDATE between '1982-01-01' and '1982-12-31';

-- 17. WAQTD details of employee who are not hired during the year 2022.
select * from employee where HIREDATE not between '2022-01-01' and '2022-12-31';

-- 18. WAQTD emp names and commission of employee who does not earn commission. 
select ENAME, COMM from employee where COMM is null;

-- 19. WAQTD details of employee who doesn't report to any manager.
select * from employee where MGR is null;

-- 20. WAQTD details of employee who earns commission.
select * from employee where COMM is not null;

-- 21. WAQTD name of the employee whose name starts with char 'A'.
select * from employee where ENAME like 'a%';

-- 22. WAQTD name of employee whose name ends with the char 'K'.
select * from employee where ENAME like '%k';

-- 23. WAQTD ename whose name has char 'A' in it.
select * from employee where ENAME like '%a%';

-- 24. WAQTD ename whose name has char 'A' as the 3rd letter.
select * from employee where ENAME like '__a%';

-- 25. WAQTD ename whose name has char 'R' as the 3rd letter and the total char's should be '6' in their name.
select * from employee where ENAME like '__r___';

-- 26. WAQTD name and dept no, job of employee working as clerk in dept no 10 or 20. 
select ENAME, DEPTNO, JOB from employee where JOB='CLERK' and DEPTNO in (10, 20);

-- 27. WAQTD details of employee working as clerk or manger in dept10.
select * from employee where JOB in ('CLERK', 'MANAGER');

-- 28. WAQTD name of employee working in dept 10,20,30,40.
select ENAME from employee where DEPTNO in (10, 20, 30, 40);

-- 29. WAQTD details of employee with empno 7902,7839.
select * from employee where EMPNO in (7902, 7839);

-- 30. WAQTD details of employee working as manager or salesman or clerk.
select * from employee where JOB in ('MANAGER', 'SALESMAN', 'CLERK');

-- 31. WAQTD name of employee hired after 20 and before 22.
select ENAME from employee where HIREDATE between '2020-01-01' and '2022-12-31';
select ENAME from employee where HIREDATE between '1981-01-01' and '1982-12-31';

-- 32. WAQTD details of employee earning more than 1250 but less than 2000.
select * from employee where SAL between 1250 and 2000;

-- 33. WAQTD name of employee hired after 21 into dept 10 or 30.
select ENAME from employee where HIREDATE > '2021-12-31' and (DEPTNO=10 or DEPTNO=30);
select ENAME from employee where HIREDATE > '1981-12-31' and (DEPTNO=10 or DEPTNO=30);

-- 34. WAQTD name of employee along with annual salary for the employee working as manager or clerk and should earn commission.
select ENAME, SAL from employee where JOB in ('MANAGER', 'CLERK') and COMM is not null;

-- 35. WAQTD all the details along with A-salary if salary is between 1000 and 2500 annual salary more than 3000.
select * from employee where SAL between 1000 and 2500;

select * from employee;


-- 1. WAQTD number of employee getting salary less than 2000 in dept 10. 
select * from employee where SAL<2000 and DEPTNO=10;

-- 2. WAQTD total salary needed to pay employee working as clerk.\
select sum(SAL) from employee where JOB='CLERK';

-- 3. WAQTD average salary needed to pay all employees.
select sum(SAL) from employee;

-- 4. WAQTD no of employee having 'A' as their first character. 
select count(ENAME) from employee where ENAME like 'a%';

-- 5. WAQTD number of employees working as clerk or manager. 
select count(ENAME) from employee where JOB in ('CLERK', 'MANAGER');

-- 6. WAQTD total salary need to pay employee hired in feb.
select sum(SAL) from employee where HIREDATE like "_____02___";

-- 7. WAQTD number of employeea reporting to 7839(MGR).
select count(ENAME) from employee where MGR=7839;

-- 8. WAQTD number of employee getting commission in dept no 30.
select count(ENAME) from employee where DEPTNO=30 and COMM is not null;

-- 9. WAQTD avg salary,total salary, number of employees and maximum salary given to employees workings as manager.
select avg(SAL), sum(SAL), count(ENAME), max(SAL) from employee where JOB='MANAGER';

-- 10. WAQTD number of employee having 'A' in their names.
select count(ENAME) from employee where ENAME like '%a%';

-- 11. WAQTD no. of employee and total salary needed to pay the employee who have 2 consicutive 'L' in their names.
select count(ENAME), sum(SAL) from employee where ENAME like '%ll%';

-- 12. WAQTD number of departments present in empty table.
select count(distinct DEPTNO) from employee;
