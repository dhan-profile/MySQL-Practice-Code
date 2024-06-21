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

<div align="center"><h1>Index in SQL</h1></div>

Indexes in SQL, particularly in MySQL, are critical for optimizing the performance of database queries. Here are the key points (the 20% of learnings) that will help you understand 80% of how indexes work and why they are important:

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



