 -- ======================20-06-2024============================
 select * from books, author where books.bno=author.bno; 
 -- Subquery -- nested queries
 
select bname, price from books where price = max(price);
select max(price) from books;
select bname, price from books where price in (select max(price) from books);

select deptno, ename, salary from emp where job ="mgr" and salary in(select max(salary) from emp where job="mgr");

SELECT *
FROM books
WHERE price In  (SELECT price
FROM books WHERE  price >= 1000);

SELECT *
FROM books
WHERE price  Not In  (SELECT price
FROM books WHERE  price >= 1000);



SELECT *
FROM books WHERE  price >= 1000;

 SELECT author, city, country
FROM author
WHERE EXISTS (SELECT price
FROM books WHERE books.bno = author.bno AND price >= 1000);

SELECT author, city, country
FROM author
WHERE NOT EXISTS (SELECT price
FROM books WHERE books.bno = author.bno AND price >= 1000);



select * from author 
where bno =( select bno from books 
where bname ="c language"); 

select * from books
where price = (select min(price) from books);

select min(price) from books;



/*SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY/ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);*/

select * from books where bno = Any(
select bno from books where price >=1000 
);

select * from books where bno = All(
select bno from books where price >=1000 
);

-- ======================JOINs===========================

-- select column_names from table1
-- join table2 on foreign = primary;

-- The INNER JOIN keyword selects records that have matching values in both tables.
SELECT CustomerName, OrderID, Country
FROM customer_details
INNER JOIN Orders 
ON customer_details.CustomerID = Orders.CustomerID;
-- ORDER BY customer_details.CustomerName;

-- The LEFT JOIN keyword returns all records from the left table (table1), 
-- and the matching records (if any) from the right table (table2).
SELECT CustomerName, OrderID, Country
FROM customer_details
LEFT JOIN Orders ON customer_details.CustomerID = Orders.CustomerID;

-- The RIGHT JOIN keyword returns all records from the right table (table2),
--  and the matching records (if any) from the left table (table1).
SELECT CustomerName, OrderID, Country
FROM customer_details
RIGHT JOIN Orders ON customer_details.CustomerID = Orders.CustomerID;

-- The CROSS JOIN, FULL JOIN keyword returns all records from both tables (table1 and table2).
SELECT Orders.CustomerId, CustomerName, OrderDate
FROM customer_details
CROSS JOIN Orders ON customer_details.CustomerID = Orders.CustomerID ;

-- self join, NATURAL JOIN - A self join is a regular join, but the table is joined with itself.
SELECT *
FROM customer_details
JOIN Orders 
ON customer_details.CustomerID = Orders.CustomerID ;

select * from customer_details,Orders 
where customer_details.CustomerID = Orders.CustomerID ;


SELECT * FROM Orders;
SELECT * FROM customer_details;

-- ====================INDEX==================================
-- Indexes are used to retrieve data from the database more quickly than otherwise. 
-- The users cannot see the indexes, they are just used to speed up searches/queries.
-- CREATE INDEX index_name
-- ON table_name (column1, column2, ...);

CREATE INDEX idx_city
ON Patient (city);

show indexes from patient;

select * from patient;

alter table patient drop index idx_city;

rename table hello to Welcome;

select * from welcome;

-- ======================================================

-- ------------STRING FUNCTIONS ----------------
select cname from customer;

SELECT ASCII(cname) AS NumCodeOfFirstChar FROM Customer; -- return first character ascii
SELECT ASCII("java");

SELECT CHAR_LENGTH("SQL Database") AS LengthOfString;
SELECT CHAR_LENGTH(cname) AS LengthOfName FROM Customer;
SELECT CHARACTER_LENGTH(cname) AS LengthOfName FROM Customer;

-- CONCAT(expression1, expression2, expression3,...)
SELECT CONCAT("SQL ", "Database ", "is ", "fun!") AS ConcatenatedString;
SELECT CONCAT(cname, " ",country, " ", City) AS Address FROM Customer;
SELECT CONCAT_WS(" ", cname, country, City) AS Address FROM Customer;
SELECT CONCAT_WS("/", 30,11,2020);

-- FIELD(value, val1, val2, val3, ...)
SELECT FIELD("q", "s", "q", "l", "q", "q");
SELECT FIELD("q", "s", "h", "l");
SELECT FIELD("raju", cname) from customer; 

-- FIND_IN_SET(string, string_list)
SELECT FIND_IN_SET("q", "s,q,l"); -- return index value
SELECT FIND_IN_SET("a", "s,q,l"); -- if not exists, return 0
SELECT FIND_IN_SET("a", null); 
SELECT FIND_IN_SET("raju", cname) from customer; 

-- INSERT(string, start_position, count, string2)
SELECT INSERT("googleChrome", 1, 9, "Example");
SELECT INSERT("googleChrome", 3, 4, "Example");
SELECT INSERT(cname, 1, 3, "Example") from customer;

-- INSTR(string1, string2)
SELECT INSTR("google.com", "COM") AS Position; -- find position of value
SELECT INSTR(cname, "a") FROM Customer;

-- LCASE(text), UCASE
SELECT LCASE(cname) FROM Customer;
SELECT LOWER(cname) FROM Customer;

SELECT UPPER(cname) FROM Customer;
SELECT UCASE(cname) FROM Customer;

-- LEFT(string, number_of_chars)
SELECT LEFT(CName, 3) AS ExtractString FROM Customer;
SELECT RIGHT(CName, 3) AS ExtractString FROM Customer;

SELECT LENGTH(CName) AS ExtractString FROM Customer;
select * from customer;
-- LOCATE(substring, string, start_pos)
SELECT LOCATE("a", CName) FROM Customer;
SELECT LOCATE("a", CName, 2) FROM Customer;
SELECT POSITION("a" IN CName) FROM Customer;

-- LPAD(string, length, lpad_string)
SELECT LPAD(CName, 10, "ABC") AS LeftPadCustomerName FROM Customer;
SELECT RPAD(CName, 10, "ABC") AS LeftPadCustomerName FROM Customer;

SELECT LTRIM("     SQL DATABASE           ") AS LeftTrimmedString;
SELECT RTRIM("    SQL DATABASE          ") AS LeftTrimmedString;
SELECT TRIM("    SQL DATABASE          ") AS LeftTrimmedString;

-- MID(string, start, length)
SELECT MID(CName, 2, 4) AS ExtractString FROM Customer;

-- SUBSTR(string, start, length) //substrinG
-- SUBSTR(string FROM start FOR length)
SELECT SUBSTR(CName, 2, 5) AS ExtractString FROM Customer;
SELECT SUBSTRING(CName, 2, 5) AS ExtractString FROM Customer;

-- REPEAT(string, count)
SELECT REPEAT(CName, 3) FROM Customer;

-- REPLACE(string, substring, new_string)
SELECT REPLACE(CNAME, "a", "m") from customer;

SELECT REVERSE(CName) FROM Customer;

-- SPACE(number)
SELECT SPACE(10);

-- STRCMP(string1, string2) // LIKE COMPARETO
SELECT STRCMP(ENAAME, CNAME) FROM customer,employee WHERE CNO=ENO;
select enaame from employee;
select cname from customer;

-- p>b --- positive values ---> +
-- p<r --- negative -- > -3
-- p = p --- zero --> 0