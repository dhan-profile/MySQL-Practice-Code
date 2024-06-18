use library;
create table dept(empno int, 
				foreign key(empno) references employee(EMPNO), 
                deptno int, 
                dname varchar(20), 
                location varchar(20));
                
insert into dept (empno, deptno, dname, location) 
			values(7782, 10, 'ACCOUNTING', 'NEW YORK'),
				  (7566,20, 'RESEARCH','DALLAS'),
                  (7900,30,'SALES','CHICAGO'),
                  (7934,40,'OPERATIONS','BOSTON');
      
select * from dept;

drop table dept;
truncate table dept;

-- QUESTIONS ON HAVING CLAUSE
-- 1.WAQTD DNO AND NUMBER OF EMP WORKING IN EACH DEPT IF THERE ARE ATLEAST 2 CLERKS IN EACH DEPT
select DEPTNO, count(EMPNO) from employee where JOB='CLERK' group by DEPTNO having count(JOB='CLERK')>=2;

-- 2.WAQTD DNO AND TOTAL SAALARYNEEDED TO PAY ALL EMP IN EACH DEPT IF THERE ARE ATLEAST 4 EMP IN EACH DEPT
select DEPTNO, sum(SAL) from employee group by DEPTNO having count(DEPTNO)>=4;

-- 3.WAQTD NUMBER OF EMP EARNING SAL MORE THAN 1200 IN EACH JOB AND THE TOTAL SAL NEEDED TO PAY EMP OF EACH JOB MUST EXCEES 3800
select JOB, count(ENAME) from employee where SAL>1200 group by JOB having sum(SAL)>3800;

-- 4.WAQTD DEPTNO AND NUMBER OF EMP WORKING ONLY IF THERE ARE 2 EMP WORKING IN EACH DEPT AS MANAGER.
-- select DEPTNO, count(ENAME) from employee where JOB='MANAGER' group by DEPTNO having count(JOB)>=2;

-- 5.WAQTD JOB AND MAX SAL OF EMP IN EACH JOB IF THE MAX SAL EXCEEDS 2600
select JOB,max(SAL) from employee group by JOB having max(SAL)>2600;

-- 6.WAQTD THE SALARIES WHICH ARE REPEATED IN EMP TABLE
select SAL from employee group by SAL having count(SAL)>1;

-- 7.WAQTD THE HIREDATE WHICH ARE DUPLICATED IN EMP TABLE
select HIREDATE from employee group by HIREDATE having count(HIREDATE)>1;

-- 8.WAQTD AVG SALARY OF EACH DEPT IF AVG SAL IS LESS THAN 3000
select DEPTNO,avg(SAL) from employee group by DEPTNO having avg(SAL)<3000;

-- 9. WAQTD DEPTNO IF THERE ARE ATLEAST 3 EMP IN EACH DEPT WHOS NAME HAS CHAR 'A' OR 'S'.
-- select DEPTNO from employee where ENAME like '%a%' or ENAME like '%s%' group by ENAME having count(ENAME)>=3;

-- 10. WAQTD MIN AND MAX SALARIES OF EACH JOB IF MIN SAL IS MORE THAN 1000 AND MAX SAL IS LESS THAN 5000.
select JOB,min(SAL),max(SAL) from employee group by JOB having min(SAL)>1000 and max(SAL)<5000;

-- QUESTIONS ON GROUP BY
-- 1.WAQTD NUMBER OF EMPLOYEES WORKING IN EACH DEPARTEMENT EXCEPT PRESIDENT.
select DEPTNO,count(EMPNO) from employee where JOB!='PRESIDENT' group by DEPTNO;

-- 2.WAQTD TOTAL SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH JOB.
select JOB,sum(SAL) from employee group by JOB;

-- 3.WAQTD NUMBER OF EMPLOYEEES WORKING AS MANAGER IN EACH DEPARTMENT.
select DEPTNO,count(ENAME) from employee where JOB='MANAGER' group by DEPTNO;

-- 4.WAQTD AVG SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH DEPARTMENT EXCLUDING THE EMPLOYEES OF DEPTNO 20.
select DEPTNO,avg(SAL) from employee where DEPTNO!=20 group by DEPTNO ;

-- 5.WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER 'A' IN THEIR NAMES IN EACH JOB.
select JOB,count(ENAME) from employee where ENAME like '%a%' group by JOB;

-- 6.WAQTD NUMBER OF EMPLOYEES AND AVG SALARY NEEDED TO PAY THE EMPLOYEES WHO SALARY IN GREATER THAN 2000 IN EACH DEPT.
select count(ENAME),avg(SAL),DEPTNO from employee where SAL>2000 group by DEPTNO;

-- 7.WAQDTD TOTAL SALARY NEEDED TO PAY AND NUMBER OF SALESMANS IN EACH DEPT.
select DEPTNO,sum(SAL) as TotalSalary,count(ENAME) from employee where JOB='SALESMAN' group by DEPTNO;

-- 8.WAQTD NUMBER OF EMPLOYEES WITH THEIR MAXIMUM SALARIES IN EACH JOB.
select JOB,max(SAL) from employee group by JOB;

-- 9. WAQTD MAXIMUM SALARIES GIVEN TO AN EMPLOYEE WORKING IN EACH DEPT.
select DEPTNO, max(SAL) from employee group by DEPTNO;

-- 10. WAQTD NUMBER OF TIMES THE SALARIES PRESENT IN EMPLOYEE TABLE.
select count(SAL),SAL from employee group by SAL;