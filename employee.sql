create table employee(EMPNO int primary key, ename varchar(25), JOB varchar(30), MGR int, HIREDATE date, SAL int, COMM int, DEPTNO int);
desc employee;

alter table employee modify ename varchar(25) not null;

insert into employee(EMPNO, ename, JOB, MGR, HIREDATE, SAL, DEPTNO) values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, 20);

insert into employee(EMPNO, ename, JOB, MGR, HIREDATE, SAL, DEPTNO) 
values  (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 30),
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

use library;
select * from employee;

-- 1. WAQTD details of employee who earns sal greater than 1250 and less than 2000. 
select * from employee where SAL>1250 and SAL<2000;

-- 2. WAQTD details of employee where sal should be less than 1500 or should be working as team leader.
select * from employee where SAL<1500 or JOB='TEAMLEADER';

-- 3. WAQTD details of employee working as clerk and earning less than 1300.
select * from employee where JOB='CLERK' and SAL<1300;

-- 4. WAQTD ename and hiredate of employee working as manager in dept 30.
select ename, HIREDATE from employee where JOB='MANAGER' and DEPTNO=30;

-- 5. WAQTD details of emp along with annual sal if they are working in dept 30 as salesman and their annual sal has to greater than 1500.
select * from employee where DEPTNO=30 and JOB='SALESMAN' and SAL>1500;

-- 6. WAQTD all the details of employee working in dept 30 or as supervisior.
select * from employee where DEPTNO=30 or JOB='SUPERVISOR';

-- 7. WAQTD ename of the employee who's sal is less than 1100 and their designation is clerk.
select ename from employee where SAL<1100 and JOB='CLERK';

-- 8. WAQTD ename and sal annual sal and dept no if dept no is 20 earning more than 2300 and annual sal exceeds 3000.
select ename, SAL, DEPTNO from employee where DEPTNO=20 and SAL>2300;

-- 9. WAQTD empno and ename of the employee working as manager in dept 20.
select EMPNO, ename from employee where JOB='MANAGER' and DEPTNO=20;

-- 10. WAQTD details of employee working in dept 20 or 30.
select * from employee where DEPTNO in (20, 30);

-- 11. WAQTD details of employee working as engineer in dept 10.
select * from employee where JOB='ENGINEER' and DEPTNO=10;

-- 12. WAQTD details of employee working as doctor with sal 2980.
select * from employee where JOB='DOCTOR' and SAL=2980;

-- 13. WAQTD ename and dept no of employee working in dept no 20 or 30.
select ename, DEPTNO from employee where DEPTNO in (20, 30);

-- 14. WAQTD details of employee who is not working as clerk or manager. 
select * from employee where JOB not in('CLERK', 'MANAGER');

-- 15. WAQTD details of employee hiredate after 2020 and before 2021. 
select * from employee where HIREDATE between '2020-01-01' and '2021-01-01';
-- select * from employee where HIREDATE between '1982-01-01' and '1983-01-01';

-- 16. WAQTD details of employee hiredate during the year 2021.
select * from employee where HIREDATE between '2021-01-01' and '2021-12-31';
-- select * from employee where HIREDATE between '1982-01-01' and '1982-12-31';

-- 17. WAQTD details of employee who are not hired during the year 2022.
select * from employee where HIREDATE not between '2022-01-01' and '2022-12-31';

-- 18. WAQTD emp enames and commission of employee who does not earn commission. 
select ename, COMM from employee where COMM is null;

-- 19. WAQTD details of employee who doesn't report to any manager.
select * from employee where MGR is null;

-- 20. WAQTD details of employee who earns commission.
select * from employee where COMM is not null;

-- 21. WAQTD ename of the employee whose ename starts with char 'A'.
select * from employee where ename like 'a%';

-- 22. WAQTD ename of employee whose ename ends with the char 'K'.
select * from employee where ename like '%k';

-- 23. WAQTD ename whose ename has char 'A' in it.
select * from employee where ename like '%a%';

-- 24. WAQTD ename whose ename has char 'A' as the 3rd letter.
select * from employee where ename like '__a%';

-- 25. WAQTD ename whose ename has char 'R' as the 3rd letter and the total char's should be '6' in their ename.
select * from employee where ename like '__r___';

-- 26. WAQTD ename and dept no, job of employee working as clerk in dept no 10 or 20. 
select ename, DEPTNO, JOB from employee where JOB='CLERK' and DEPTNO in (10, 20);

-- 27. WAQTD details of employee working as clerk or manger in dept10.
select * from employee where JOB in ('CLERK', 'MANAGER');

-- 28. WAQTD ename of employee working in dept 10,20,30,40.
select ename from employee where DEPTNO in (10, 20, 30, 40);

-- 29. WAQTD details of employee with empno 7902,7839.
select * from employee where EMPNO in (7902, 7839);

-- 30. WAQTD details of employee working as manager or salesman or clerk.
select * from employee where JOB in ('MANAGER', 'SALESMAN', 'CLERK');

-- 31. WAQTD ename of employee hired after 20 and before 22.
select ename from employee where HIREDATE between '2020-01-01' and '2022-12-31';
-- select ename from employee where HIREDATE between '1981-01-01' and '1982-12-31'; 

-- 32. WAQTD details of employee earning more than 1250 but less than 2000.
select * from employee where SAL between 1250 and 2000;

-- 33. WAQTD ename of employee hired after 21 into dept 10 or 30.
select ename from employee where HIREDATE > '2021-12-31' and (DEPTNO=10 or DEPTNO=30);
-- select ename from employee where HIREDATE > '1981-12-31' and (DEPTNO=10 or DEPTNO=30);

-- 34. WAQTD ename of employee along with annual sal for the employee working as manager or clerk and should earn commission.
select ename, SAL from employee where JOB in ('MANAGER', 'CLERK') and COMM is not null;

-- 35. WAQTD all the details along with A-sal if sal is between 1000 and 2500 annual sal more than 3000.
select * from employee where SAL between 1000 and 2500;

select * from employee;


-- 1. WAQTD number of employee getting sal less than 2000 in dept 10. 
select * from employee where SAL<2000 and DEPTNO=10;

-- 2. WAQTD total sal needed to pay employee working as clerk.\
select sum(SAL) from employee where JOB='CLERK';

-- 3. WAQTD average sal needed to pay all employee.
select sum(SAL) from employee;

-- 4. WAQTD no of employee having 'A' as their first character. 
select count(ename) from employee where ename like 'a%';

-- 5. WAQTD number of employee working as clerk or manager. 
select count(ename) from employee where JOB in ('CLERK', 'MANAGER');

-- 6. WAQTD total sal need to pay employee hired in feb.
select sum(SAL) from employee where HIREDATE like "_____02___";
-- select sum(SAL) from employee where HIREDATE between '' and '';

-- 7. WAQTD number of employeea reporting to 7839(MGR).
select count(ename) from employee where MGR=7839;

-- 8. WAQTD number of employee getting commission in dept no 30.
select count(ename) from employee where DEPTNO=30 and COMM is not null;

-- 9. WAQTD avg sal,total sal, number of employee and maximum sal given to employee workings as manager.
select avg(SAL), sum(SAL), count(ename), max(SAL) from employee where JOB='MANAGER';

-- 10. WAQTD number of employee having 'A' in their enames.
select count(ename) from employee where ename like '%a%';

-- 11. WAQTD no. of employee and total sal needed to pay the employee who have 2 consicutive 'L' in their enames.
select count(ename), sum(SAL) from employee where ename like '%ll%';

-- 12. WAQTD number of deptnos present in empty table.
select count(distinct DEPTNO) from employee;

-- -------------- MySQL Class 4:30 to 6:00 TASKS | 30/07/2024 -------------------------

-- 1. WAQTD ename of the employee along with the annual sal
select ename, sal * 12 as annual_sal from employee;

-- 2. WAQTD Employee ename and job for all the employee with their half-term sal
select ename, job, (sal * 6) as half_term_sal from employee;

-- 3. WAQTD All the details of the employee along with an annual bonus of 2000
select *, (sal * 12) + 2000 as annual_sal_with_bonus from employee;

-- 4. WAQTD ename, sal and sal with a hike of 10%
select ename, sal, sal * 1.10 as sal_with_hike from employee;

-- 5. WAQTD ename, sal with deduction of 25%
select ename, sal, sal * 0.75 as sal_with_deduction from employee;

-- 6. WAQTD ename, sal with a monthly hike of Rs 50
select ename, sal, sal + 50 as sal_with_monthly_hike from employee;

-- 7. WAQTD ename, annual sal with deduction of 10%
select ename, sal * 12 as annual_sal, (sal * 12) * 0.90 as annual_sal_with_deduction from employee;

-- 8. WAQTD Details of all the employee along with the annual sal
select *, sal * 12 as annual_sal from employee;

-- 9. WAQTD ename and Designation along with 100 penalty in sal
select ename, job, sal - 100 as sal_with_penalty from employee;


-- 1. 
select ename, sal * 12 as annual_sal from employee where ename = 'smith';
-- 2. 
select ename from employee where job = 'clerk';
-- 3. 
select sal from employee where job = 'president';
-- 4. 
select * from employee where sal > 2000;
-- 5. 
select * from employee where ename = 'jones';
-- 6. 
select * from employee where hiredate > '1981-01-01';
-- 7. 
select ename, sal, sal * 12 as annual_sal from employee having annual_sal > 2000;
-- 8. 
select ename, hiredate from employee where hiredate < '1981-01-01';
-- 9. 
select employee_number from employee where deptno = 10;
-- 10. 
select * from employee where job = 'manager';
-- 11. 
select ename, deptno from employee where job = 'clerk';


-- 1. 
select * from employee where job = 'clerk' and sal < 1500;
-- 2. 
select ename, hiredate from employee where job = 'manager' and deptno = 30;
-- 3. 
select *, sal * 12 as annual_sal from employee where deptno = 30 and job = 'salesman' and (sal * 12) > 14000;
-- 4. 
select * from employee where deptno = 30 and job = 'analyst';
-- 5. 
select ename from employee where sal < 1100 and job = 'clerk';
-- 6. 
select ename, sal, sal * 12 as annual_sal, deptno from employee where deptno = 20 and sal > 1100 and (sal * 12) > 12000;
-- 7. 
select ename, deptno from employee where deptno in (10, 20, 30);
-- 8. 
select * from employee where ename in ('adams', 'smith', 'jones', 'blake');
-- 9. 
select * from employee where sal = 3000 and job = 'analyst';
-- 10. 
select ename from employee where job = 'manager' and reports_to = 7839;
-- 11. 
select * from employee where job in ('manager', 'analyst', 'clerk') and deptno in (10, 20, 30);


-- 1. 
select ename from emp where ename like 'a%';
-- 2. 
select ename, deptno from emp where ename like 'm%';
-- 3. 
select * from emp where ename like '%r';
-- 4. 
select sal from emp where empno like '%2';
-- 5. 
select *, sal*12 as annualsal from emp where ename like '%ll%';
-- 6. 
select sal from emp where ename like '%ll%';
-- 7. 
select ename from emp where ename like '_d%';
-- 8. 
select * from emp where designation like '_a%';
-- 9. 
select ename, sal from emp where ename like '%n_';