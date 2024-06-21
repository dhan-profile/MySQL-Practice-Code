SQL Practice Code Repository
===========================
This repository contains a collection of SQL files that I have created while learning the basics of SQL. The files in this repository are intended to help me practice and reinforce my understanding of SQL concepts, and may be useful to others who are also learning SQL. 👇

Learning Resources
-----------------

In addition to the code in this repository, I have found the following resources to be helpful in learning SQL:

* [SQL Documentation by MySQL](https://dev.mysql.com/doc/refman/8.0/en/)

Contributing
------------

If you have any suggestions for additional files or resources that would be helpful for learning SQL, please feel free to open an issue or submit a pull request.

License
-------

The code in this repository is licensed under the MIT License.
<hr>

<div align="center"><h1>Views in SQL</h1></div>

**View**

A view is a named query stored in the database. It's like a virtual table that doesn't store any data. A view can be reused whenever needed by calling the view name, allowing reusability of frequently used queries.

A view is a virtual table based on the result of a SQL query, presenting data in a more organized and simplified way without storing the data in a physical table.

**Example**
```sql
CREATE VIEW NewTable AS
SELECT sname, grade, percentage FROM result
WHERE percentage > 65 ORDER BY sname;

SELECT * FROM NewTable;

DROP VIEW NewTable;

CREATE OR REPLACE VIEW NewTable AS
SELECT rollno, sname, grade, percentage FROM result
WHERE percentage > 50 ORDER BY sname;

SELECT * FROM result;
```

<div align="center"><h1>Union in SQL</h1></div>

**Union**

The UNION operator is used to combine the result sets of two or more SELECT statements into a single result set.

**Rules**

* Every SELECT statement within UNION must have the same number of columns.
* The columns must also have similar data types.
* The columns in every SELECT statement must also be in the same order.

**Example**
```sql
SELECT city FROM employee
UNION ALL
SELECT city FROM customer
ORDER BY city;
```

<div align="center"><h1>Group by in SQL</h1></div>

**Group By**

The GROUP BY clause is used to group rows of a query result set by one or more columns. It's a way to categorize data into groups based on common values in one or more columns.

**Example**
```sql
SELECT MAX(salary) FROM employee
GROUP BY job
ORDER BY COUNT(cno);
```

<div align="center"><h1>Having in SQL</h1></div>

**Having**

The HAVING clause is used to filter groups of rows based on conditions specified in the GROUP BY clause. It's similar to the WHERE clause, but it's used to filter groups instead of individual rows.

**Example**
```sql
SELECT COUNT(rollno), grade FROM result
WHERE percentage > 65
GROUP BY grade
HAVING COUNT >= 3;
```

<div align="center"><h1>Index in SQL</h1></div>

**Indexes in MySQL**

Indexes are used to find rows with specific column values quickly, improving the speed of data retrieval operations on a database table. It is similar to GROUP BY. Indexes are used to retrieve data from the database more quickly.

**Automatic Indexing**

Indexing is automatically assigned/created when the following keywords are used:

* Primary Key
* Foreign Key
* Unique

**Manual Indexing**

We can also create indexing manually using the following syntax:

**Regular Index**
```sql
CREATE INDEX index_name ON table_name(column_name);
```
**Other Types of Indexes**

* Full Text Index
* Descending Index
* Spatial Index

**Points to Remember**

1. **Index limitations**: Index cannot be applied to all columns.
2. **Index data structures**: When an index is created, it will create a separate database and data structures to perform faster data retrieval operations.
3. **Performance impact**: Insert and update operations become slow when indexing is used. Only data retrieval is faster.
4. **Large database benefits**: Indexing is useful with large databases.


### 1. **What is an Index?**
An index is a data structure that improves the speed of data retrieval operations on a database table. It is analogous to an index in a book.

### 2. **Types of Indexes in MySQL**
- **Primary Key Index**: Automatically created when a primary key is defined. Ensures uniqueness and fast access by the primary key.
- **Unique Index**: Ensures all values in the indexed column are unique.
- **Regular Index** (Non-Unique Index): Speeds up queries on columns that are not unique.
- **Full-Text Index**: Used for full-text searches.
- **Spatial Index**: Used for spatial data types.

### 3. **Creating an Index**
You can create an index using the `CREATE INDEX` statement:
```sql
CREATE INDEX index_name ON table_name (column1, column2, ...);
```
Or for a unique index:
```sql
CREATE UNIQUE INDEX index_name ON table_name (column1, column2, ...);
```

### 4. **Using Indexes in Queries**
Indexes are automatically used by the MySQL query optimizer to speed up `SELECT` queries. For example:
```sql
SELECT * FROM table_name WHERE column1 = 'value';
```
If `column1` is indexed, this query will be much faster.

### 5. **Composite Indexes**
Indexes that cover multiple columns:
```sql
CREATE INDEX index_name ON table_name (column1, column2);
```
Useful when multiple columns are often queried together.

### 6. **Advantages of Indexes**
- **Speed Up Query Performance**: Especially for large tables.
- **Enforce Uniqueness**: Through unique indexes.
- **Efficient Sorting**: As indexes can be used to retrieve sorted data quickly.

### 7. **Disadvantages of Indexes**
- **Disk Space**: Indexes require additional storage.
- **Slower Writes**: Inserts, updates, and deletes can be slower because the index must be updated.

### 8. **Viewing Indexes**
You can view the indexes on a table with:
```sql
SHOW INDEX FROM table_name;
```

### 9. **Dropping an Index**
Indexes can be removed if they are no longer needed:
```sql
DROP INDEX index_name ON table_name;
```

### 10. **Index Selectivity**
Selectivity is the measure of how well an index can distinguish between rows. High selectivity means fewer rows are matched by the indexed value, which usually leads to better performance.

### 11. **Index Coverage**
An index is "covering" if the query can be satisfied just using the index without accessing the table data. This can happen if the `SELECT` clause only includes columns that are part of the index.

### 12. **Index Maintenance**
Regularly update statistics and consider rebuilding indexes to maintain performance. Use:
```sql
ANALYZE TABLE table_name;
```
for updating statistics.

### 13. **B-Tree Indexes**
The most common type of index in MySQL. Good for equality and range queries.

### 14. **Full-Text Indexes**
Used for searching text within large datasets. Created with:
```sql
CREATE FULLTEXT INDEX index_name ON table_name(column);
```

### 15. **Spatial Indexes**
Used with geographic data types. Created with:
```sql
CREATE SPATIAL INDEX index_name ON table_name(column);
```

### 16. **Performance Monitoring**
Use `EXPLAIN` to understand how MySQL executes a query and whether indexes are being used:
```sql
EXPLAIN SELECT * FROM table_name WHERE column = 'value';
```

### 17. **Clustered vs. Non-Clustered Indexes**
In MySQL, the primary key index is a clustered index, meaning the table data is stored in the order of the primary key. Non-clustered indexes store a separate structure.

### 18. **Temporary Tables and Indexes**
Indexes can be used on temporary tables for complex queries:
```sql
CREATE TEMPORARY TABLE temp_table ( ... );
CREATE INDEX index_name ON temp_table (column);
```

### 19. **Index Hints**
Force the use of a specific index using index hints:
```sql
SELECT * FROM table_name USE INDEX (index_name) WHERE column = 'value';
```

### 20. **Best Practices**
- Index columns used frequently in `WHERE`, `ORDER BY`, `JOIN`, and `GROUP BY` clauses.
- Avoid indexing columns with a low level of selectivity (e.g., boolean columns).
- Monitor and adjust indexes as the database evolves and query patterns change.

<hr>

<div align="center"><h1>Joins in SQL</h1></div>

### What Are Joins?

In SQL, a **join** is a way to fetch data from two or more tables based on a related column between them. Think of tables as different departments in a company, each with its own set of records. A join helps you pull together relevant information from these departments to form a complete picture.

### Types of Joins

1. **INNER JOIN**: Combines rows from both tables where there is a match in both tables.
2. **LEFT JOIN (or LEFT OUTER JOIN)**: Combines all rows from the left table and the matched rows from the right table. If there is no match, the result is NULL on the right side.
3. **RIGHT JOIN (or RIGHT OUTER JOIN)**: Combines all rows from the right table and the matched rows from the left table. If there is no match, the result is NULL on the left side.
4. **FULL JOIN (or FULL OUTER JOIN)**: Combines rows when there is a match in one of the tables. It returns NULL for unmatched rows in both tables.
5. **CROSS JOIN**: Returns the Cartesian product of the two tables, meaning every row in the first table is combined with every row in the second table.
6. **SELF JOIN**: A table is joined with itself.

Let's break down the most essential joins:

### 1. INNER JOIN

**Analogy**: Imagine you have two lists of friends from different schools. You want to find friends who are in both lists. An INNER JOIN is like making a new list that includes only those who appear in both original lists.

**Syntax**:
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
```

**Example**:
```sql
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;
```

### 2. LEFT JOIN

**Analogy**: Suppose you have a list of all students and another list of students who have paid their fees. A LEFT JOIN helps you get a list of all students along with their fee status, showing NULL for those who haven’t paid.

**Syntax**:
```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
```

**Example**:
```sql
SELECT students.name, payments.amount
FROM students
LEFT JOIN payments
ON students.id = payments.student_id;
```

### 3. RIGHT JOIN

**Analogy**: Similar to LEFT JOIN but reversed. Imagine the fee payment list is complete but some students may not exist in the main student list. A RIGHT JOIN ensures all fee records are shown, even if some students are missing from the main list.

**Syntax**:
```sql
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
```

**Example**:
```sql
SELECT orders.id, customers.name
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.id;
```

### 4. FULL JOIN

**Analogy**: This join is like merging two lists where you want to see all entries, including those that don’t match in both lists. Imagine merging two contact lists where some contacts might be unique to each list.

**Syntax**:
```sql
SELECT columns
FROM table1
FULL JOIN table2
ON table1.common_column = table2.common_column;
```

**Example**:
```sql
SELECT employees.name, projects.project_name
FROM employees
FULL JOIN projects
ON employees.project_id = projects.id;
```
(Note: MySQL does not support FULL JOIN directly; you often use UNION to achieve this.)

### 5. CROSS JOIN

**Analogy**: Think of this as a combination of every item on two different menus, creating a new list of all possible meal combinations.

**Syntax**:
```sql
SELECT columns
FROM table1
CROSS JOIN table2;
```

**Example**:
```sql
SELECT products.name, categories.name
FROM products
CROSS JOIN categories;
```

### 6. SELF JOIN

**Analogy**: Imagine a list of employees where each employee has a manager who is also an employee in the same list. A SELF JOIN helps you relate employees to their managers.

**Syntax**:
```sql
SELECT A.columns, B.columns
FROM table A, table B
WHERE condition;
```

**Example**:
```sql
SELECT A.employee_name AS Employee, B.employee_name AS Manager
FROM employees A, employees B
WHERE A.manager_id = B.employee_id;
```

### Summary of Key Concepts

- **INNER JOIN**: Fetches matching rows from both tables.
- **LEFT JOIN**: Fetches all rows from the left table and matching rows from the right table.
- **RIGHT JOIN**: Fetches all rows from the right table and matching rows from the left table.
- **FULL JOIN**: Fetches all rows when there is a match in one of the tables.
- **CROSS JOIN**: Fetches the Cartesian product of both tables.
- **SELF JOIN**: A table is joined with itself to create a relation within the same table.

### Gauging Your Understanding

To ensure you grasp the prerequisites, please rate your familiarity with the following:

1. Basic SQL queries (SELECT, FROM, WHERE)
2. Primary keys and foreign keys in database tables
3. The concept of relational databases
4. Basic understanding of NULL values in SQL

<hr>

<div align="center"><h1>SubQuery in SQL</h1></div>

### What is a Subquery?

A subquery is a query nested inside another query. It can be placed in various clauses such as SELECT, FROM, WHERE, and HAVING. Think of it as solving a smaller puzzle (the subquery) to find a piece that fits into the larger puzzle (the main query).

### Types of Subqueries

1. **Single-Row Subqueries**: Returns one row.
2. **Multi-Row Subqueries**: Returns multiple rows.
3. **Scalar Subqueries**: Returns a single value.
4. **Correlated Subqueries**: Subqueries that reference columns from the outer query.
5. **Nested Subqueries**: Subqueries within subqueries.

### Key Concepts and Examples

#### 1. Single-Row Subqueries

**Analogy**: Imagine asking for the age of the oldest student in a class. The answer is a single value that can be used to find other students of the same age.

**Syntax**:
```sql
SELECT column_name
FROM table_name
WHERE column_name = (SELECT column_name FROM table_name WHERE condition);
```

**Example**:
```sql
SELECT name
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
```

This query finds the name of the employee with the highest salary.

#### 2. Multi-Row Subqueries

**Analogy**: Suppose you want to know which products belong to the categories that have been recently updated. Here, multiple category IDs can be returned.

**Syntax**:
```sql
SELECT column_name
FROM table_name
WHERE column_name IN (SELECT column_name FROM table_name WHERE condition);
```

**Example**:
```sql
SELECT name
FROM products
WHERE category_id IN (SELECT id FROM categories WHERE updated_at > '2023-01-01');
```

This query finds products in categories updated after a certain date.

#### 3. Scalar Subqueries

**Analogy**: If you need the average score of a class to compare it with each student's score, a scalar subquery provides that single average value.

**Syntax**:
```sql
SELECT column_name, (SELECT single_value_column FROM table_name WHERE condition) AS alias_name
FROM table_name;
```

**Example**:
```sql
SELECT name, salary, (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
```

This query compares each employee's salary to the average salary.

#### 4. Correlated Subqueries

**Analogy**: This is like checking each student's score against the class average while calculating the class average excluding the student being checked. It's a subquery that depends on the outer query.

**Syntax**:
```sql
SELECT column_name
FROM table_name outer
WHERE column_name operator (SELECT column_name FROM table_name inner WHERE outer.column_name = inner.column_name);
```

**Example**:
```sql
SELECT e1.name, e1.salary
FROM employees e1
WHERE e1.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e1.department_id = e2.department_id);
```

This query finds employees whose salary is above the average salary in their department.

#### 5. Nested Subqueries

**Analogy**: Think of nested subqueries as solving multiple layers of a puzzle. Each layer must be solved to provide the answer for the next layer.

**Syntax**:
```sql
SELECT column_name
FROM table_name
WHERE column_name = (SELECT column_name FROM table_name WHERE column_name = (SELECT column_name FROM table_name WHERE condition));
```

**Example**:
```sql
SELECT name
FROM employees
WHERE department_id = (SELECT id FROM departments WHERE location_id = (SELECT id FROM locations WHERE city = 'San Francisco'));
```

This query finds employees who work in departments located in San Francisco.

### Key Takeaways

1. **Subqueries can be used in SELECT, FROM, WHERE, and HAVING clauses**.
2. **Single-row subqueries** return one row, used with operators like `=`.
3. **Multi-row subqueries** return multiple rows, used with operators like `IN`.
4. **Scalar subqueries** return a single value, useful for comparisons.
5. **Correlated subqueries** depend on the outer query for their values.
6. **Nested subqueries** are subqueries within other subqueries for complex queries.


<div align="center"><h1>String Functions and Operators</h1></div>

| **Name** | **Description** |
| --- | --- |
| ASCII() | Return numeric (ASCII) value of left-most character (1st char in string) |
| BIN() | Return a binary value of given number |
| BIT_LENGTH() | Return length of argument in bits (1 byte = 8 bits) |
| CHAR() | Return the character for each integer passed |
| CHAR_LENGTH() | Return number of characters in argument |
| CHARACTER_LENGTH() | Synonym for CHAR_LENGTH() |
| CONCAT() | Return concatenated string |
| CONCAT_WS() | Return concatenate with separator |
| ELT() | Return string at index number |
| EXPORT_SET() | Return a string such that for every bit set in the value bits, you get an on string and for every unset bit, you get an off string |
| FIELD() | Index (position) of first argument in subsequent arguments |
| FIND_IN_SET() | Index (position) of first argument within second argument |
| FORMAT() | Return a number formatted to specified number of decimal places |
| FROM_BASE64() | Decode base64 encoded string and return result |
| HEX() | Hexadecimal representation of decimal or string value |
| INSERT() | Insert substring at specified position up to specified number of characters |
| INSTR() | Return the index of the first occurrence of substring |
| LCASE() | Synonym for LOWER() |
| LEFT() | Return the leftmost number of characters as specified |
| LENGTH() | Return the length of a string in bytes |
| LIKE | Simple pattern matching |
| LOAD_FILE() | Load the named file |
| LOCATE() | Return the position of the first occurrence of substring |
| LOWER() | Return the argument in lowercase |
| LPAD() | Return the string argument, left-padded with the specified string |
| LTRIM() | Remove leading spaces on left |
| MAKE_SET() | Return a set of comma-separated strings that have the corresponding bit in bits set |
| MATCH() | Perform full-text search |
| MID() | Return a substring starting from the specified position |
| NOT LIKE | Negation of simple pattern matching |
| NOT REGEXP | Negation of REGEXP |
| OCT() | Return a string containing octal representation of a number |
| OCTET_LENGTH() | Synonym for LENGTH() |
| ORD() | Return character code for leftmost character of the argument |
| POSITION() | Synonym for LOCATE() |
| QUOTE() | Escape the argument for use in an SQL statement |
| REGEXP | Whether string matches regular expression |
| REGEXP_INSTR() | Starting index of substring matching regular expression |
| REGEXP_LIKE() | Whether string matches regular expression |
| REGEXP_REPLACE() | Replace substrings matching regular expression |
| REGEXP_SUBSTR() | Return substring matching regular expression |
| REPEAT() | Repeat a string the specified number of times |
| REPLACE() | Replace occurrences of a specified string |
| REVERSE() | Reverse the characters in a string |
| RIGHT() | Return the specified rightmost number of characters |
| RLIKE | Whether string matches regular expression |
| RPAD() | Append string the specified number of times |
| RTRIM() | Remove trailing spaces |
| SOUNDEX() | Return a soundex string |
| SOUNDS LIKE | Compare sounds |
| SPACE() | Return a string of the specified number of spaces |
| STRCMP() | Compare two strings |
| SUBSTR() | Return the substring as specified |
| SUBSTRING() | Return the substring as specified |
| SUBSTRING_INDEX() | Return a substring from a string before the specified number of occurrences of the delimiter |
| TO_BASE64() | Return the argument converted to a base-64 string |
| TRIM() | Remove leading and trailing spaces |
| UCASE() | Synonym for UPPER() |
| UNHEX() | Return a string containing hex representation of a number |
| UPPER() | Convert to uppercase |
| WEIGHT_STRING() | Return the weight string for a string |


