-- =============================FOREIGN KEY===============================
use library;
create table dept2(empno int,
                deptno int primary key, 
                dname varchar(20), 
                location varchar(20));
create table employee2(EMPNO int, 
					ENAME varchar(25), 
                    JOB varchar(30), 
                    MGR int, 
                    HIREDATE date, 
                    SAL int, 
                    COMM int, 
                    DEPTNO int, 
                    foreign key(DEPTNO) references dept2(deptno));
-- ====================================TABLE2====================================================
rename table dept2 to department2;
rename table department2 to dept2;
insert into employee2(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, 20);
insert into employee2(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) 
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
update employee2 set COMM=300 where EMPNO=7499;
update employee2 set COMM=500 where EMPNO=7521;
update employee2 set COMM=1400 where EMPNO=7654;

select * from employee2;

set sql_safe_updates=1;
-- ======================TABLE1================================
insert into dept2 (deptno, dname, location) 
			values(10, 'ACCOUNTING', 'NEW YORK'),
				  (20, 'RESEARCH','DALLAS'),
                  (30,'SALES','CHICAGO'),
                  (40,'OPERATIONS','BOSTON');
alter table dept2 modify dname varchar(30);
select * from dept2;
-- =========== ADD COLUMN ===============
ALTER TABLE dept2 ADD (date_added DATE);
-- =========== DELETE COLUMN ===============
ALTER TABLE dept2 DROP date_added;

drop table employee2;
drop table dept2;

-- ============================TABLE1 & TABLE2==================================
select * from employee2,dept2 where dept2.deptno = employee2.DEPTNO;

-- =========================VIEW===============================
create view DEPTNO20 as select * from employee2 where DEPTNO=20;

-- =========================UNION==============================
select DEPTNO from employee2 union all select deptno from dept2 order by deptno;

select JOB from employee2 union all select dname from dept2;

select * from DEPTNO20;
drop view DEPT20;

select length(dname) from dept2;

-- ======================JOIN============================

SELECT * FROM employee2 INNER JOIN dept2 ON employee2.DEPTNO = dept2.deptno;
SELECT e2.DEPTNO, e2.ENAME, e2.JOB, d2.dname, d2.location FROM employee2 AS e2 INNER JOIN dept2 as d2 ON e2.DEPTNO = d2.deptno;
