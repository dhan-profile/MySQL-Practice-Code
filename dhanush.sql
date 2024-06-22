use library;
create table Scholarship_Table(STUDENT_REF_ID int, SCHOLARSHIP_AMOUNT int, SCHOLARSHIP_DATE datetime);
create table Student_Table(STUDENT_ID int, FIRST_NAME varchar(30), LAST_NAME varchar(30), GPA double, ENROLLMENT_DATE datetime, MAJOR varchar(30));
-- create table Student_Table(STUDENT_ID int, foreign key(STUDENT_ID) references Scholarship_Table(STUDENT_REF_ID), FIRST_NAME varchar(30), LAST_NAME varchar(30), GPA double, ENROLLMENT_DATE datetime, MAJOR varchar(30));
create table Program_Table(STUDENT_REF_ID int, PROGRAM_NAME varchar(30), PROGRAM_START_DATE datetime);

insert into Scholarship_Table(STUDENT_REF_ID, SCHOLARSHIP_AMOUNT, SCHOLARSHIP_DATE) 
values (201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(201, 4000, '2021-10-15 00:00:00');

insert into Student_Table()
values (201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:00', 'Computer_Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:00', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.60, '2021-09-01 10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.20, '2021-09-01 12:45:00', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');

insert into Program_Table () 
values(201, 'Computer_Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');

select * from Scholarship_Table;
select * from Student_Table;
select * from Program_Table;

-- 1. Write a SQL query to fetch "FIRST_NAME" from the Student table in upper case and use ALIAS name as STUDENT_NAME.
select UCASE(FIRST_NAME) as 'STUDENT_NAME' from Student_Table;
-- 2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.
select distinct(MAJOR) from Student_Table;
-- 3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.
select SUBSTR(FIRST_NAME, 1, 3) from Student_Table;
-- 4. Write a SQL query to find the position of alphabet ('a') int the first name column 'Shivansh' from Student table. 
select LOCATE('a', FIRST_NAME) from Student_Table;
-- 5. Write a SQL query to print FIRST_NAME from the Student table after replacing 'a' with 'A'.
select REPLACE(FIRST_NAME, 'a','A') from Student_Table;
-- 6. Write a SQL query to print details of the Students excluding FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
select * from Student_Table where FIRST_NAME not in ('Prem', 'Shivansh');
-- 7. Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a'.
select * from Student_Table where SUBSTR(FIRST_NAME, LENGTH(FIRST_NAME), 1) = 'a';
-- 8. Write an SQL query to fetch the count of Students having Major Subject 'Computer Science'.
select count(STUDENT_ID) from Student_Table where MAJOR='Computer_Science';
-- 9. Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
select Student_Table.FIRST_NAME, Student_Table.LAST_NAME, Scholarship_Table.SCHOLARSHIP_AMOUNT, Scholarship_Table.SCHOLARSHIP_DATE 
from Student_Table inner join Scholarship_Table on Student_Table.STUDENT_ID = Scholarship_Table.STUDENT_REF_ID;
-- 10.Write an SQL query to show only odd rows from Student table.
select * from Student_Table where STUDENT_ID%2!=0;
-- 11. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
select * from Student_Table order by GPA desc limit 0,5;
-- 12. Write an SQL query to show the second highest GPA from a Student table using sub-query.
-- select GPA from Student_Table where GPA < (select max(GPA) from Student_Table);
select max(GPA) from Student_Table where GPA < (select max(GPA) from Student_Table);
-- 13. Write an SQL query to list STUDENT_ID who does not get scholarship.
-- select Student_Table.STUDENT_ID from Student_Table left join Scholarship_Table on Student_Table.STUDENT_ID = Scholarship_Table.STUDENT_REF_ID group by Student_Table.STUDENT_ID having Scholarship_Table.STUDENT_REF_ID=null;
select Student_Table.STUDENT_ID from Student_Table where Student_Table.STUDENT_ID not in (select Scholarship_Table.STUDENT_REF_ID from Scholarship_Table) group by Student_Table.STUDENT_ID;
-- 14. Write an SQL query to show the last record from a table.
select * from Student_Table order by STUDENT_ID desc limit 0, 1;
-- 15. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.
select MAJOR, max(GPA) from Student_Table group by MAJOR order by max(GPA) desc;
-- 16. Write a query to create a new table which consists of data and structure copied from the other table (say Student) or clone the table named Student.
create table Student(STUDENT_ID int, FIRST_NAME varchar(30), LAST_NAME varchar(30), GPA double, ENROLLMENT_DATE datetime, MAJOR varchar(30));
insert into Student(select * from Student_Table);
select * from Student;

drop table Scholarship_Table;
drop table Student_Table;
drop table Program_Table;
drop table Student;