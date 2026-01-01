# 101 SQL Commands

## Overview
SQL (Structured Query Language) is the standard language for managing and manipulating relational databases. This cheat sheet covers universal SQL commands and concepts applicable to most RDBMS including MySQL, PostgreSQL, SQL Server, Oracle, and SQLite. Master these to efficiently query, modify, and manage data across platforms.

## Target Audience
- Database administrators managing systems
- Data analysts querying datasets
- Backend developers building applications
- Data engineers designing pipelines
- Anyone working with relational databases

### 1. Database Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| CREATE DATABASE | Create new database | Initialize database | CREATE DATABASE company; |
| DROP DATABASE | Delete database | Remove database | DROP DATABASE company; |
| USE | Select database | Switch context | USE company; |
| SHOW DATABASES | List databases | View available | SHOW DATABASES; |
| CREATE SCHEMA | Create schema | Organize objects | CREATE SCHEMA sales; |
| DROP SCHEMA | Delete schema | Remove schema | DROP SCHEMA sales; |
| ALTER DATABASE | Modify database | Change properties | ALTER DATABASE company CHARACTER SET utf8; |
| SHOW SCHEMAS | List schemas | View schemas | SHOW SCHEMAS; |
| BACKUP DATABASE | Backup database | Data protection | BACKUP DATABASE company TO DISK = 'path'; |
| RESTORE DATABASE | Restore database | Data recovery | RESTORE DATABASE company FROM DISK = 'path'; |

### 2. Table Creation & Modification (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| CREATE TABLE | Create new table | Define structure | CREATE TABLE employees (id INT, name VARCHAR(100)); |
| DROP TABLE | Delete table | Remove table | DROP TABLE employees; |
| ALTER TABLE | Modify table | Add/remove columns | ALTER TABLE employees ADD COLUMN salary DECIMAL; |
| TRUNCATE TABLE | Empty table | Remove all rows | TRUNCATE TABLE employees; |
| RENAME TABLE | Rename table | Change name | ALTER TABLE employees RENAME TO staff; |
| ADD COLUMN | Add column | Extend schema | ALTER TABLE employees ADD COLUMN email VARCHAR(255); |
| DROP COLUMN | Remove column | Simplify schema | ALTER TABLE employees DROP COLUMN email; |
| MODIFY COLUMN | Change column type | Adjust definition | ALTER TABLE employees MODIFY COLUMN salary DECIMAL(10,2); |
| ADD CONSTRAINT | Add constraint | Enforce rules | ALTER TABLE employees ADD CONSTRAINT pk_id PRIMARY KEY (id); |
| DROP CONSTRAINT | Remove constraint | Relax rules | ALTER TABLE employees DROP CONSTRAINT pk_id; |
| CREATE INDEX | Create index | Speed queries | CREATE INDEX idx_name ON employees(name); |
| DROP INDEX | Delete index | Remove index | DROP INDEX idx_name ON employees; |

### 3. Data Types (12)
| Type | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| INT / INTEGER | Whole number | IDs, counts | INT |
| BIGINT | Large whole number | Large IDs | BIGINT |
| DECIMAL / NUMERIC | Fixed-precision decimal | Currency, measurements | DECIMAL(10,2) |
| FLOAT / DOUBLE | Floating-point number | Scientific data | DOUBLE |
| VARCHAR | Variable-length string | Names, descriptions | VARCHAR(255) |
| CHAR | Fixed-length string | Codes, flags | CHAR(10) |
| TEXT | Large text | Long descriptions | TEXT |
| DATE | Date value | Birthdates | DATE |
| TIME | Time value | Timestamps | TIME |
| DATETIME / TIMESTAMP | Date and time | Event times | DATETIME |
| BOOLEAN | True/false | Flags | BOOLEAN |
| BLOB | Binary data | Images, files | BLOB |

### 4. INSERT Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| INSERT INTO | Add new rows | Insert data | INSERT INTO employees (id, name) VALUES (1, 'John'); |
| INSERT MULTIPLE | Insert multiple rows | Bulk insert | INSERT INTO employees VALUES (2, 'Jane'), (3, 'Bob'); |
| INSERT SELECT | Insert from query | Copy data | INSERT INTO archive SELECT * FROM employees WHERE active = 0; |
| INSERT IGNORE | Skip errors | Safe insert | INSERT IGNORE INTO employees VALUES (1, 'Duplicate'); |
| INSERT ON DUPLICATE | Update on conflict | Upsert | INSERT INTO employees VALUES (1, 'John') ON DUPLICATE KEY UPDATE name = 'John'; |
| REPLACE INTO | Replace on conflict | Overwrite | REPLACE INTO employees VALUES (1, 'New Name'); |
| INSERT DEFAULT | Use defaults | Minimal insert | INSERT INTO employees DEFAULT VALUES; |
| INSERT RETURNING | Return inserted | Get new IDs | INSERT INTO employees (name) VALUES ('Alice') RETURNING id; |

### 5. SELECT Basics (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| SELECT | Retrieve columns | Query data | SELECT name, salary FROM employees; |
| SELECT * | All columns | Quick view | SELECT * FROM employees; |
| SELECT DISTINCT | Unique values | Remove duplicates | SELECT DISTINCT department FROM employees; |
| FROM | Specify table | Source table | FROM employees |
| WHERE | Filter rows | Conditions | WHERE salary > 50000 |
| AND / OR | Combine conditions | Multiple filters | WHERE department = 'IT' AND salary > 60000 |
| IN | Match list | List values | WHERE department IN ('IT', 'HR') |
| BETWEEN | Range check | Inclusive range | WHERE salary BETWEEN 50000 AND 100000 |
| LIKE | Pattern match | Text search | WHERE name LIKE 'J%' |
| IS NULL | Check null | Missing values | WHERE email IS NULL |
| AS | Alias | Rename column | SELECT name AS employee_name FROM employees |
| LIMIT / TOP | Row limit | Pagination | LIMIT 10 or TOP 10 |

### 6. Sorting & Grouping (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ORDER BY | Sort results | Ordering | ORDER BY salary DESC |
| ASC / DESC | Sort direction | Ascending/descending | ORDER BY name ASC |
| GROUP BY | Group rows | Aggregation | GROUP BY department |
| HAVING | Filter groups | Post-aggregate | HAVING COUNT(*) > 5 |
| COUNT | Count rows | Totals | COUNT(*) |
| SUM | Sum values | Totals | SUM(salary) |
| AVG | Average | Mean | AVG(salary) |
| MIN / MAX | Extremes | Bounds | MIN(salary), MAX(salary) |
| GROUP_CONCAT | Concatenate | List values | GROUP_CONCAT(name SEPARATOR ', ') |
| ROLLUP | Subtotal | Hierarchy | GROUP BY department WITH ROLLUP |

### 7. Joins (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| INNER JOIN | Matching rows | Common data | INNER JOIN departments ON employees.dept_id = departments.id |
| LEFT JOIN | All left + matches | Include all left | LEFT JOIN departments ON ... |
| RIGHT JOIN | All right + matches | Include all right | RIGHT JOIN departments ON ... |
| FULL OUTER JOIN | All rows | Complete set | FULL OUTER JOIN departments ON ... |
| CROSS JOIN | Cartesian product | Combinations | CROSS JOIN products |
| SELF JOIN | Join table to itself | Hierarchy | FROM employees e1 JOIN employees e2 ON e1.manager_id = e2.id |
| NATURAL JOIN | Auto-match columns | Simple joins | NATURAL JOIN departments |
| JOIN ON | Specify condition | Explicit | JOIN departments ON employees.dept_id = departments.id |
| JOIN USING | Common column | Shorter syntax | JOIN departments USING (dept_id) |
| MULTIPLE JOINS | Chain joins | Complex queries | FROM employees JOIN departments JOIN locations |
| OUTER APPLY | Row-by-row join | Advanced | OUTER APPLY (SELECT TOP 1 * FROM orders WHERE ...) |
| LATERAL JOIN | Subquery join | Correlated | LATERAL (SELECT * FROM related WHERE ...) |

### 8. Subqueries (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Scalar Subquery | Single value | In SELECT/WHERE | WHERE salary > (SELECT AVG(salary) FROM employees) |
| Row Subquery | Single row | Comparison | WHERE (id, dept) = (SELECT ...) |
| Column Subquery | Single column | IN list | WHERE dept_id IN (SELECT id FROM departments) |
| Table Subquery | Multiple rows/columns | FROM clause | FROM (SELECT * FROM employees WHERE active = 1) AS active |
| EXISTS | Check existence | Correlated | WHERE EXISTS (SELECT 1 FROM orders WHERE orders.emp_id = employees.id) |
| NOT EXISTS | Check absence | Anti-join | WHERE NOT EXISTS (...) |
| ALL | Compare all | Conditions | WHERE salary > ALL (SELECT salary FROM employees WHERE dept = 'IT') |
| ANY / SOME | Compare any | Conditions | WHERE salary > ANY (SELECT salary FROM employees WHERE dept = 'IT') |
| Correlated Subquery | References outer | Row filtering | WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e2.dept = e1.dept) |
| Derived Table | Subquery in FROM | Complex source | FROM (SELECT dept, AVG(salary) FROM employees GROUP BY dept) AS dept_avg |

### 9. Set Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| UNION | Combine results | Merge sets | SELECT name FROM employees UNION SELECT name FROM contractors |
| UNION ALL | Combine with duplicates | Full merge | UNION ALL |
| INTERSECT | Common rows | Overlap | SELECT dept FROM employees INTERSECT SELECT dept FROM managers |
| EXCEPT / MINUS | Left minus right | Difference | SELECT name FROM employees EXCEPT SELECT name FROM terminated |
| COMBINE MULTIPLE | Chain operations | Complex sets | (SELECT ... UNION SELECT ...) INTERSECT SELECT ... |
| DISTINCT IN SET | Remove duplicates | Clean results | UNION DISTINCT |
| ORDER SET | Sort final | Final ordering | (SELECT ...) UNION (SELECT ...) ORDER BY name |
| LIMIT SET | Limit final | Pagination | (SELECT ...) UNION ALL (SELECT ...) LIMIT 100 |

### 10. UPDATE Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| UPDATE | Modify rows | Change data | UPDATE employees SET salary = salary * 1.1 |
| SET | Specify changes | Column updates | SET name = 'John Doe', active = 1 |
| WHERE | Filter rows | Targeted update | WHERE id = 5 |
| UPDATE JOIN | Update with join | Complex logic | UPDATE employees e JOIN departments d ON e.dept_id = d.id SET e.salary = ... |
| UPDATE FROM | Update from source | Bulk update | UPDATE employees FROM temp_table SET ... |
| MULTI-TABLE UPDATE | Update multiple | Complex | UPDATE t1, t2 SET t1.val = t2.val WHERE ... |
| UPDATE RETURNING | Return updated | Get changes | UPDATE employees SET salary = 60000 WHERE id = 1 RETURNING * |
| SAFE UPDATE MODE | Prevent full update | Safety | Requires WHERE with key |

### 11. DELETE Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| DELETE | Remove rows | Delete data | DELETE FROM employees |
| WHERE | Filter deletion | Targeted | WHERE active = 0 |
| DELETE JOIN | Delete with join | Complex | DELETE e FROM employees e JOIN terminated t ON e.id = t.id |
| DELETE USING | Delete with source | Multiple tables | DELETE FROM employees USING terminated WHERE employees.id = terminated.id |
| TRUNCATE vs DELETE | Empty vs remove | Speed vs triggers | TRUNCATE faster, no triggers |
| DELETE RETURNING | Return deleted | Audit | DELETE FROM employees WHERE id = 1 RETURNING * |
| CASCADE DELETE | Referential | Auto cleanup | FOREIGN KEY ... ON DELETE CASCADE |
| LIMIT DELETE | Partial delete | Safety | DELETE FROM logs LIMIT 1000 |

### 12. Constraints & Keys (12)
| Constraint | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| PRIMARY KEY | Unique identifier | Table identity | PRIMARY KEY (id) |
| FOREIGN KEY | Referential integrity | Relationships | FOREIGN KEY (dept_id) REFERENCES departments(id) |
| UNIQUE | Unique values | Alternate keys | UNIQUE (email) |
| NOT NULL | Required value | Mandatory fields | NOT NULL |
| CHECK | Value constraint | Validation | CHECK (salary > 0) |
| DEFAULT | Default value | Auto-fill | DEFAULT CURRENT_TIMESTAMP |
| ON DELETE CASCADE | Auto delete children | Cleanup | ON DELETE CASCADE |
| ON UPDATE CASCADE | Update children | Sync | ON UPDATE CASCADE |
| ON DELETE SET NULL | Null on delete | Optional link | ON DELETE SET NULL |
| DISABLE CONSTRAINT | Temporarily off | Bulk load | ALTER TABLE ... DISABLE CONSTRAINT ... |
| ENABLE CONSTRAINT | Turn on | Validation | ALTER TABLE ... ENABLE CONSTRAINT ... |
| COMPOSITE KEY | Multi-column key | Combined unique | PRIMARY KEY (order_id, product_id) |

### 13. Views (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| CREATE VIEW | Virtual table | Simplified query | CREATE VIEW active_employees AS SELECT * FROM employees WHERE active = 1 |
| CREATE OR REPLACE VIEW | Update view | Modify | CREATE OR REPLACE VIEW ... |
| DROP VIEW | Delete view | Remove | DROP VIEW active_employees |
| ALTER VIEW | Modify view | Change definition | ALTER VIEW active_employees AS ... |
| MATERIALIZED VIEW | Stored result | Performance | CREATE MATERIALIZED VIEW ... |
| REFRESH MATERIALIZED | Update stored | Sync data | REFRESH MATERIALIZED VIEW ... |
| VIEW WITH CHECK | Enforce updates | Data integrity | CREATE VIEW ... WITH CHECK OPTION |
| INDEXED VIEW | Performance boost | Query speed | CREATE UNIQUE CLUSTERED INDEX ... ON view |

### 14. Indexes (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| CREATE INDEX | Speed queries | Performance | CREATE INDEX idx_salary ON employees(salary) |
| UNIQUE INDEX | Enforce unique | Alternate key | CREATE UNIQUE INDEX idx_email ON employees(email) |
| COMPOSITE INDEX | Multi-column | Combined filters | CREATE INDEX idx_dept_salary ON employees(dept_id, salary) |
| DROP INDEX | Remove index | Maintenance | DROP INDEX idx_salary ON employees |
| CLUSTERED INDEX | Physical order | Primary access | CREATE CLUSTERED INDEX ... |
| NON-CLUSTERED | Separate structure | Multiple | CREATE NONCLUSTERED INDEX ... |
| FULLTEXT INDEX | Text search | Search | CREATE FULLTEXT INDEX ON employees(description) |
| SPATIAL INDEX | Geographic | Location queries | CREATE SPATIAL INDEX ... |
| PARTIAL INDEX | Conditional | Filtered | CREATE INDEX ... WHERE active = 1 |
| REBUILD INDEX | Maintenance | Fragmentation | ALTER INDEX ... REBUILD |

### 15. Transactions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| BEGIN TRANSACTION | Start transaction | Atomic operations | BEGIN TRANSACTION |
| COMMIT | Save changes | Finalize | COMMIT |
| ROLLBACK | Undo changes | Cancel | ROLLBACK |
| SAVEPOINT | Partial rollback | Checkpoint | SAVEPOINT sp1 |
| ROLLBACK TO | Undo to point | Partial | ROLLBACK TO sp1 |
| SET TRANSACTION | Properties | Isolation level | SET TRANSACTION ISOLATION LEVEL SERIALIZABLE |
| READ UNCOMMITTED | Dirty reads | Performance | Lowest isolation |
| READ COMMITTED | No dirty | Default | Standard |
| REPEATABLE READ | Consistent reads | Phantom protection | Higher |
| SERIALIZABLE | Full isolation | Strict | Highest |

### 16. Functions & Expressions (12)
| Function | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| CONCAT | Combine strings | Full name | CONCAT(first_name, ' ', last_name) |
| UPPER / LOWER | Case change | Normalization | UPPER(name) |
| TRIM | Remove spaces | Clean | TRIM(email) |
| SUBSTRING | Extract part | Parsing | SUBSTRING(phone, 1, 3) |
| REPLACE | Replace text | Cleanup | REPLACE(name, 'Jr.', '') |
| COALESCE | First non-null | Default | COALESCE(email, 'no@email.com') |
| NULLIF | Null on match | Avoid division zero | NULLIF(denominator, 0) |
| CASE | Conditional | Logic | CASE WHEN salary > 100000 THEN 'High' ELSE 'Standard' END |
| CAST | Type conversion | Format | CAST(salary AS VARCHAR) |
| CURRENT_DATE | Today | Date | CURRENT_DATE |
| CURRENT_TIMESTAMP | Now | Timestamp | CURRENT_TIMESTAMP |
| DATEADD / DATE_PART | Date math | Calculations | DATEADD(month, 1, hire_date) |

### 17. Window Functions (10)
| Function | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ROW_NUMBER | Unique row number | Ranking | ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) |
| RANK | Rank with ties | Competition | RANK() OVER (ORDER BY salary DESC) |
| DENSE_RANK | Rank no gaps | Dense ranking | DENSE_RANK() OVER (...) |
| NTILE | Buckets | Quartiles | NTILE(4) OVER (ORDER BY salary) |
| LAG / LEAD | Previous/next | Trends | LAG(salary) OVER (PARTITION BY emp ORDER BY year) |
| FIRST_VALUE | First in window | Baseline | FIRST_VALUE(salary) OVER (...) |
| LAST_VALUE | Last in window | Latest | LAST_VALUE(salary) OVER (...) |
| SUM OVER | Running total | Cumulative | SUM(salary) OVER (PARTITION BY dept ORDER BY hire_date) |
| AVG OVER | Moving average | Smoothing | AVG(salary) OVER (PARTITION BY dept ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) |
| PARTITION BY | Group windows | Per group | PARTITION BY department |

## Tips and Best Practices
* Always use WHERE with UPDATE and DELETE to avoid affecting all rows
* Use parameterized queries to prevent SQL injection attacks
* Index columns used in WHERE, JOIN, and ORDER BY clauses
* Use EXPLAIN or execution plans to optimize slow queries
* Normalize databases to reduce redundancy and improve integrity
* Use transactions for multi-statement atomic operations
* Prefer explicit column lists over SELECT *
* Use meaningful aliases for readability in complex queries
* Limit results during development to avoid large datasets
* Use COUNT(*) for existence checks instead of fetching rows
* Avoid functions on indexed columns in WHERE clauses
* Use JOIN instead of subqueries when performance matters
* Backup regularly and test restore procedures
* Use consistent naming conventions for tables and columns
* Document complex views and stored procedures
* Monitor query performance and index usage regularly
* Use appropriate data types to save space and improve speed
* Handle NULL values carefully in comparisons and aggregates
* Use pagination for large result sets in applications
* Validate and sanitize input data before querying

## Additional Resources
* [SQL Standard Documentation](https://www.iso.org/standard/76585.html)
* [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
* [SQLBolt Interactive Lessons](https://sqlbolt.com/)
* [Use The Index, Luke - SQL Indexing Guide](https://use-the-index-luke.com/)
* [PostgreSQL Documentation](https://www.postgresql.org/docs/)
* [MySQL Reference Manual](https://dev.mysql.com/doc/)
* [Microsoft SQL Server Docs](https://docs.microsoft.com/en-us/sql/)
* [Oracle Database SQL Reference](https://docs.oracle.com/en-us/iaas/mysql-database/doc/mysql-shell-user-guide.html)

## Mini-Glossary

### 1. Common Terms
| Term | Description |
|------|-------------|
| RDBMS | Relational Database Management System |
| Schema | Structure of database objects |
| Table | Collection of related data rows |
| Row | Single record in table |
| Column | Attribute of table |
| Tuple | Technical term for row |
| Attribute | Technical term for column |
| Query | Request for data |
| DML | Data Manipulation Language |
| DDL | Data Definition Language |
| DCL | Data Control Language |
| TCL | Transaction Control Language |

### 2. Acronyms
| Acronym | Full Form |
|---------|-----------|
| SQL | Structured Query Language |
| ACID | Atomicity, Consistency, Isolation, Durability |
| CRUD | Create, Read, Update, Delete |
| PK | Primary Key |
| FK | Foreign Key |
| OLTP | Online Transaction Processing |
| OLAP | Online Analytical Processing |
| ETL | Extract, Transform, Load |
| DBA | Database Administrator |
| ORM | Object-Relational Mapping |
| CTE | Common Table Expression |
| JSON | JavaScript Object Notation |

### 3. Key Constraints
| Constraint | Description |
|------------|-------------|
| Primary Key | Uniquely identifies row |
| Foreign Key | Links to primary key in another table |
| Unique | Ensures unique values |
| Not Null | Requires value |
| Check | Validates value range/format |
| Default | Provides default value |
| Index | Speeds data retrieval |
| Cascade | Propagates changes |
| Trigger | Automatic action on event |
| View | Virtual table from query |

### 4. Join Types
| Type | Description |
|------|-------------|
| Inner Join | Matching rows only |
| Left Join | All left + matching right |
| Right Join | All right + matching left |
| Full Join | All rows from both |
| Cross Join | Every combination |
| Self Join | Table joined to itself |
| Natural Join | Auto-join on same names |
| Equi-Join | Join on equality |

### 5. Isolation Levels
| Level | Description |
|-------|-------------|
| Read Uncommitted | Allows dirty reads |
| Read Committed | No dirty reads |
| Repeatable Read | No non-repeatable reads |
| Serializable | Full isolation |
| Snapshot | Consistent view |

### 6. Execution Concepts
| Concept | Description |
|---------|-------------|
| Execution Plan | Query optimization path |
| Index Scan | Read via index |
| Table Scan | Read entire table |
| Seek | Direct index access |
| Bookmark Lookup | Row fetch after index |
| Predicate | WHERE condition |
| Sargable | Index-friendly condition |
| Statistics | Data distribution info |

### 7. Vendor Differences
| Feature | MySQL | PostgreSQL | SQL Server | Oracle | SQLite |
|---------|-------|------------|------------|--------|--------|
| LIMIT | LIMIT | LIMIT | TOP | ROWNUM/FETCH | LIMIT |
| Auto Increment | AUTO_INCREMENT | SERIAL | IDENTITY | SEQUENCE | AUTOINCREMENT |
| String Concat | CONCAT or || | || | + | || or CONCAT | || |
| Case Insensitive | Depends on collation | ILIKE | COLLATE | NLSSORT | PRAGMA case_sensitive_like |
| Boolean Type | TINYINT | BOOLEAN | BIT | NUMBER(1) | INTEGER |
| Date Functions | DATE_ADD | + INTERVAL | DATEADD | + INTERVAL | date modifiers |

### 8. Tool Ecosystem
| Tool | Purpose |
|------|---------|
| MySQL Workbench | GUI for MySQL |
| pgAdmin | GUI for PostgreSQL |
| SSMS | SQL Server Management Studio |
| SQL Developer | Oracle tool |
| DBeaver | Universal database tool |
| phpMyAdmin | Web MySQL admin |
| HeidiSQL | Lightweight client |
| Navicat | Multi-database GUI |

### 9. Common Patterns
| Pattern | Description |
|---------|-------------|
| Pagination | LIMIT/OFFSET for pages |
| Upsert | INSERT ON CONFLICT or MERGE |
| Recursive CTE | Hierarchical queries |
| Pivot | Rows to columns |
| Unpivot | Columns to rows |
| Gap/Island | Sequence analysis |
| Running Total | Window SUM |
| Median | Complex with percentiles |

### 10. Troubleshooting
| Issue | Common Fix |
|-------|------------|
| Deadlock | Retry transaction |
| Slow Query | Add index or rewrite |
| Lock Wait | Check blocking sessions |
| Out of Memory | Limit results |
| Syntax Error | Check vendor docs |
| Permission Denied | Grant privileges |
| Connection Limit | Pool connections |
| Data Truncation | Check column size |
| Duplicate Key | Handle conflicts |
| Foreign Key Violation | Correct references |

