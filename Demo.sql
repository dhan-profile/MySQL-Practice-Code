USE demo;
CREATE TABLE marks (Rollno INT PRIMARY KEY, StudentName VARCHAR(30), SubjectName VARCHAR(30), Grade CHAR(1), Marks INT, Result VARCHAR(20));
INSERT INTO marks (Rollno, StudentName, SubjectName, Grade, Marks, Result)
VALUES
  (1, 'Rahul Sharma', 'Mathematics', 'A', 85, 'Pass'),
  (2, 'Priya Patel', 'Science', 'B', 78, 'Pass'),
  (3, 'Kunal registerJain', 'English', 'A', 92, 'Pass'),
  (4, 'Sonia Gupta', 'History', 'C', 68, 'Pass'),
  (5, 'Amit Kumar', 'Computer Science', 'A', 95, 'Pass'),
  (6, 'Neha Singh', 'Mathematics', 'B', 82, 'Pass'),
  (7, 'Rohan Mehta', 'Science', 'A', 90, 'Pass'),
  (8, 'Isha Patel', 'English', 'B', 80, 'Pass'),
  (9, 'Vikram Sharma', 'History', 'A', 88, 'Pass'),
  (10, 'Sneha Jain', 'Computer Science', 'B', 85, 'Pass'),
  (11, 'Rajesh Kumar', 'Mathematics', 'C', 70, 'Pass'),
  (12, 'Pooja Gupta', 'Science', 'A', 98, 'Pass'),
  (13, 'Aisha Singh', 'English', 'A', 96, 'Pass'),
  (14, 'Siddharth Mehta', 'History', 'B', 84, 'Pass'),
  (15, 'Tanvi Patel', 'Computer Science', 'A', 99, 'Pass');

SELECT * FROM marks;
DELETE FROM marks WHERE Rollno = 10;


CREATE TABLE student_info (
  Rollno INT,
  Address VARCHAR(50),
  Phone VARCHAR(15),
  DOB DATE
);

INSERT INTO student_info (Rollno, Address, Phone, DOB)
VALUES
  (1, '123 Main St', '999-123-4567', '2002-01-01'),
  (2, '456 Elm St', '555-789-0123', '2001-06-15'),
  (3, '789 Oak St', '777-555-1234', '2000-03-20'),
  (4, '321 Pine St', '666-999-8765', '2003-09-10'),
  (5, '901 Maple St', '444-222-3333', '2002-05-25'),
  (6, '234 Cedar St', '888-777-6666', '2001-11-05'),
  (7, '567 Spruce St', '333-444-5555', '2000-08-15'),
  (8, '890 Fir St', '222-333-4444', '2003-02-20'),
  (9, '111 Beech St', '666-555-4444', '2002-07-10'),
  (10, '678 Cherry St', '999-888-7777', '2001-04-25'),
  (11, '345 Cypress St', '555-666-7777', '2000-10-15'),
  (12, '901 Pine St', '777-888-9999', '2003-01-01'),
  (13, '456 Oak St', '333-555-6666', '2002-03-20'),
  (14, '789 Maple St', '444-666-7777', '2001-09-10'),
  (15, '123 Cedar St', '222-777-8888', '2000-05-25');

ALTER TABLE student_info ADD CONSTRAINT fk_Rollno FOREIGN KEY (Rollno) REFERENCES marks(Rollno);

SELECT * FROM student_info;
drop table student_info;

DELETE FROM student_info WHERE Rollno = 13;

select Rollno, Address from student_info union all select Rollno, StudentName from marks order by Rollno desc;

select ASCII(SubjectName) as FirstAscii from marks;

-- =============================== STRING FUNCTIONS ====================================

select ASCII('');
select ASCII('Dhanush');
select BIN(null);
select BIN("hello");
select BIT_LENGTH(5000);
select BIT_LENGTH('hi');
select CHAR_LENGTH('Hello');
select CHARACTER_LENGTH('Hello');
select concat('Hello','java','programming');
SELECT CONCAT_WS(',','First name','Second name','Last Name');
SELECT ELT(2, 'Aa', 'Bb', 'Cc', 'Dd');
select EXPORT_SET(7,'ON','OFF',',',16);	-- EXPORT_SET(bits,on,off[,separator[,number_of_bits]])
SELECT FIELD('Dd', 'Aa', 'Bb', 'Cc', 'Dd', 'Ff');
SELECT FIND_IN_SET('d','a,b,c,d');
SELECT FORMAT(12332.123456, 4); 
select FORMAT(12.35445, 2);		-- Number formatted to specified number of decimal places(using comma and no of valus after decimal is specified)
SELECT TO_BASE64('abc'), FROM_BASE64(TO_BASE64('abc'));
select LENGTH('dhanush');
SELECT INSERT('Quadratic', 3, 4, 'DHAN');	-- Insert SUBSTRING at specified index
SELECT INSTR('foobarbar', 'bar');	-- index of first occurence of substring (here 'bar' is substring, b is 1st occurence)
select LCASE('DHANUSH');
SELECT LEFT('foobarbar', 5);	-- leftmost number of characters as specified 
SELECT 'David!' LIKE 'David_';
SELECT LOCATE('bar', 'foobarbar');		-- location for first occurence of substring
SELECT LPAD('hi',5,'??');	-- Pad(Append) the string on right to leftside for specified no of index
SELECT RPAD('hi',5,'??');	-- Pad(Append) the string on right to rightside for specified no of index
SELECT LTRIM('  barbar');
SELECT RTRIM('  barbar   ');
SELECT TRIM('  Hello   ');
SELECT SUBSTRING('Quadratically',5);
SELECT REPEAT('MySQL', 3);
SELECT REPLACE('www.mysql.com', 'w', 'E');		-- REPLACE(actual_str, from_str, to_str)
SELECT REVERSE('Hello');
SELECT SPACE(6);
SELECT STRCMP('text', 'text');
SELECT STRCMP('text', 'text1');
SELECT STRCMP('text1', 'text');

-- ==================================== INDEX ======================================

CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100)
);

INSERT INTO customers (id, name, email) VALUES
  (1,'John Doe', 'john@example.com'),
  (2,'Jane Doe', 'jane@example.com'),
  (3,'Bob Smith', 'bob@example.com');
   
CREATE INDEX idx_name ON customers (name);
SELECT * FROM customers WHERE name = 'John Doe';
SHOW INDEX FROM customers;


-- ===========================JOIN=================================

SELECT m1.Rollno, m1.StudentName, m1.Marks, s1.Phone, s1.DOB 
FROM marks AS m1
INNER JOIN student_info AS s1
ON m1.Rollno = s1.Rollno;

SELECT m1.Rollno, m1.StudentName, m1.Marks, s1.Phone, s1.DOB 
FROM marks AS m1
LEFT JOIN student_info AS s1
ON m1.Rollno = s1.Rollno;

SELECT m1.Rollno, m1.StudentName, m1.Marks, s1.Phone, s1.DOB 
FROM marks AS m1
RIGHT JOIN student_info AS s1
ON m1.Rollno = s1.Rollno;

SELECT m1.Rollno, m1.StudentName, m1.Marks, s1.Phone, s1.DOB 
FROM marks AS m1
CROSS JOIN student_info AS s1
ON m1.Rollno = s1.Rollno;

-- ======================== SUBQUERY =============================

-- Find the addresses of students who have scored 'A' grade in Mathematics.
select address from student_info 
where rollno in (
select rollno from marks 
where grade='A' 
and subjectname='Mathematics');





-- ==================== Twitter DB ==========================

select * from demodb1;
-- ======== DELETE/REMOVE COLUMN ===============
alter table demodb1 drop `email tweet`;
-- ============ CHANGE COLUMN FORMAT/VALUES ==============
UPDATE demodb1 SET `engagement rate` = FORMAT(`engagement rate`, 3);
-- ============== RENAME COLUMN NAME ===================
ALTER TABLE demodb1 RENAME COLUMN `engagement rate` TO eng_rate;

-- ======== Average value of the third column between 2 dates ================
select avg(engagements) from (SELECT * FROM demodb1 WHERE Date_val BETWEEN '2024-04-01' AND '2024-04-15') AS subquery;

-- =============== Nth HIGHEST VALUE ======================
select impressions from demodb1 order by impressions desc limit 2,1;


set sql_safe_updates = 0;

