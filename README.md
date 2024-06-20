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

Understanding and effectively using these aspects of indexing in MySQL will greatly enhance your ability to optimize query performance and manage large datasets efficiently.
