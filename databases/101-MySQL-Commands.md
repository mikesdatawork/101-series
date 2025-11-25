# 101 MySQL Commands

## Overview

MySQL is an open-source relational database management system widely used for web applications, data warehousing, and enterprise systems. This cheat sheet covers essential MySQL commands, database operations, table management, query optimization, user administration, backup procedures, and performance tuning techniques. Master these commands to build robust data-driven applications and maintain high-performance database systems.

## Target Audience

- Backend developers building database applications
- Database administrators managing MySQL servers
- Data engineers designing data pipelines
- Web developers working with dynamic content
- Anyone working with relational databases

## Command Categories

### 1. Database Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE DATABASE | Create new database | Database initialization | CREATE DATABASE mydb; |
| DROP DATABASE | Delete database | Database removal, cleanup | DROP DATABASE mydb; |
| SHOW DATABASES | List all databases | Database discovery | SHOW DATABASES; |
| USE | Switch to database | Set active database | USE mydb; |
| SELECT DATABASE() | Show current database | Verify active database | SELECT DATABASE(); |
| ALTER DATABASE | Modify database properties | Character set changes | ALTER DATABASE mydb CHARACTER SET utf8mb4; |
| CREATE SCHEMA | Create schema (synonym) | Alternative to CREATE DATABASE | CREATE SCHEMA myschema; |
| SHOW CREATE DATABASE | Show database creation statement | Review database definition | SHOW CREATE DATABASE mydb; |
| RENAME DATABASE | Rename database | Database reorganization | Use mysqldump and restore |
| DROP DATABASE IF EXISTS | Safely drop database | Prevent errors if not exists | DROP DATABASE IF EXISTS mydb; |

### 2. Table Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE TABLE | Create new table | Table definition | CREATE TABLE users (id INT, name VARCHAR(100)); |
| DROP TABLE | Delete table | Table removal | DROP TABLE users; |
| SHOW TABLES | List tables in database | Table discovery | SHOW TABLES; |
| DESCRIBE | Show table structure | Schema inspection | DESCRIBE users; |
| SHOW COLUMNS | Display column information | Column details | SHOW COLUMNS FROM users; |
| ALTER TABLE ADD | Add column to table | Schema modification | ALTER TABLE users ADD email VARCHAR(100); |
| ALTER TABLE DROP | Remove column from table | Schema cleanup | ALTER TABLE users DROP COLUMN email; |
| ALTER TABLE MODIFY | Change column definition | Column modification | ALTER TABLE users MODIFY name VARCHAR(200); |
| RENAME TABLE | Rename table | Table reorganization | RENAME TABLE old_name TO new_name; |
| TRUNCATE TABLE | Delete all rows | Fast table clearing | TRUNCATE TABLE users; |
| SHOW CREATE TABLE | Show table creation statement | Review table definition | SHOW CREATE TABLE users; |
| CREATE TABLE LIKE | Copy table structure | Template creation | CREATE TABLE new_users LIKE users; |

### 3. Data Manipulation - INSERT (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| INSERT INTO | Insert single row | Add data | INSERT INTO users (name) VALUES ('John'); |
| INSERT INTO multiple | Insert multiple rows | Batch insertion | INSERT INTO users VALUES (1,'John'), (2,'Jane'); |
| INSERT INTO SELECT | Insert from query | Data copying | INSERT INTO archive SELECT * FROM users; |
| INSERT IGNORE | Insert ignoring duplicates | Skip existing records | INSERT IGNORE INTO users VALUES (1,'John'); |
| REPLACE INTO | Insert or replace | Upsert operation | REPLACE INTO users VALUES (1,'John'); |
| INSERT ON DUPLICATE KEY | Update on duplicate | Conditional upsert | INSERT INTO users VALUES (1,'John') ON DUPLICATE KEY UPDATE name='John'; |
| INSERT DELAYED | Queue insert for later | Async insertion | INSERT DELAYED INTO logs VALUES ('entry'); |
| INSERT INTO with DEFAULT | Use default values | Partial insertion | INSERT INTO users (id) VALUES (DEFAULT); |
| INSERT with subquery | Insert from subquery | Complex data insertion | INSERT INTO summary SELECT COUNT(*) FROM users; |
| LOAD DATA INFILE | Bulk load from file | Fast bulk import | LOAD DATA INFILE '/path/file.csv' INTO TABLE users; |

### 4. Data Manipulation - SELECT (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| SELECT * | Select all columns | Retrieve all data | SELECT * FROM users; |
| SELECT columns | Select specific columns | Column filtering | SELECT name, email FROM users; |
| SELECT DISTINCT | Select unique values | Remove duplicates | SELECT DISTINCT country FROM users; |
| SELECT WHERE | Filter rows | Conditional retrieval | SELECT * FROM users WHERE age > 18; |
| SELECT ORDER BY | Sort results | Result ordering | SELECT * FROM users ORDER BY name ASC; |
| SELECT LIMIT | Limit result count | Pagination, sampling | SELECT * FROM users LIMIT 10; |
| SELECT OFFSET | Skip rows | Pagination | SELECT * FROM users LIMIT 10 OFFSET 20; |
| SELECT GROUP BY | Group rows | Aggregation | SELECT country, COUNT(*) FROM users GROUP BY country; |
| SELECT HAVING | Filter grouped results | Group filtering | SELECT country, COUNT(*) FROM users GROUP BY country HAVING COUNT(*) > 5; |
| SELECT JOIN | Combine tables | Related data retrieval | SELECT * FROM users JOIN orders ON users.id = orders.user_id; |
| SELECT subquery | Nested query | Complex filtering | SELECT * FROM users WHERE id IN (SELECT user_id FROM orders); |
| SELECT AS | Column aliasing | Rename output columns | SELECT name AS full_name FROM users; |

### 5. Data Manipulation - UPDATE (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| UPDATE SET | Update rows | Data modification | UPDATE users SET email = 'new@email.com' WHERE id = 1; |
| UPDATE multiple columns | Update multiple fields | Batch updates | UPDATE users SET name='John', age=30 WHERE id=1; |
| UPDATE with JOIN | Update using join | Related table updates | UPDATE users JOIN orders ON users.id = orders.user_id SET users.status='active'; |
| UPDATE with subquery | Update using subquery | Complex conditional updates | UPDATE users SET status='vip' WHERE id IN (SELECT user_id FROM orders GROUP BY user_id HAVING SUM(total) > 1000); |
| UPDATE with CASE | Conditional updates | Multiple conditions | UPDATE users SET status = CASE WHEN age < 18 THEN 'minor' ELSE 'adult' END; |
| UPDATE IGNORE | Update ignoring errors | Skip problematic updates | UPDATE IGNORE users SET email='test@test.com'; |
| UPDATE with ORDER BY LIMIT | Update limited rows | Controlled updates | UPDATE users SET status='reviewed' ORDER BY created_at LIMIT 100; |
| UPDATE all rows | Update without WHERE | Global updates | UPDATE users SET active=1; |

### 6. Data Manipulation - DELETE (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| DELETE FROM | Delete rows | Data removal | DELETE FROM users WHERE id = 1; |
| DELETE with JOIN | Delete using join | Complex deletion | DELETE users FROM users JOIN orders ON users.id = orders.user_id WHERE orders.status='cancelled'; |
| DELETE with subquery | Delete using subquery | Conditional deletion | DELETE FROM users WHERE id IN (SELECT user_id FROM inactive_list); |
| DELETE all rows | Delete all data | Clear table | DELETE FROM users; |
| DELETE with LIMIT | Delete limited rows | Controlled deletion | DELETE FROM logs ORDER BY created_at LIMIT 1000; |
| DELETE IGNORE | Delete ignoring errors | Skip problematic deletes | DELETE IGNORE FROM users WHERE id = 1; |
| DELETE with ORDER BY | Delete ordered rows | Priority deletion | DELETE FROM queue ORDER BY priority DESC LIMIT 10; |
| DELETE LOW_PRIORITY | Delay deletion | Minimize lock time | DELETE LOW_PRIORITY FROM logs WHERE old=1; |

### 7. Indexes and Keys (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE INDEX | Create index | Query optimization | CREATE INDEX idx_name ON users(name); |
| DROP INDEX | Remove index | Index cleanup | DROP INDEX idx_name ON users; |
| SHOW INDEX | Display table indexes | Index inspection | SHOW INDEX FROM users; |
| CREATE UNIQUE INDEX | Create unique index | Enforce uniqueness | CREATE UNIQUE INDEX idx_email ON users(email); |
| ALTER TABLE ADD INDEX | Add index to table | Index addition | ALTER TABLE users ADD INDEX idx_name (name); |
| ALTER TABLE ADD PRIMARY KEY | Add primary key | Define primary key | ALTER TABLE users ADD PRIMARY KEY (id); |
| ALTER TABLE DROP PRIMARY KEY | Remove primary key | Key removal | ALTER TABLE users DROP PRIMARY KEY; |
| ALTER TABLE ADD FOREIGN KEY | Add foreign key | Referential integrity | ALTER TABLE orders ADD FOREIGN KEY (user_id) REFERENCES users(id); |
| CREATE FULLTEXT INDEX | Create full-text index | Text search optimization | CREATE FULLTEXT INDEX idx_content ON articles(content); |
| ALTER TABLE ADD UNIQUE | Add unique constraint | Uniqueness enforcement | ALTER TABLE users ADD UNIQUE (email); |
| SHOW CREATE TABLE indexes | View index definitions | Index review | SHOW CREATE TABLE users; |
| ALTER TABLE ADD INDEX USING BTREE | Specify index type | Index type selection | ALTER TABLE users ADD INDEX idx_name (name) USING BTREE; |

### 8. Joins and Relationships (10)

| Join Type | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| INNER JOIN | Match rows from both tables | Related data retrieval | SELECT * FROM users INNER JOIN orders ON users.id = orders.user_id; |
| LEFT JOIN | All rows from left table | Include unmatched left rows | SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id; |
| RIGHT JOIN | All rows from right table | Include unmatched right rows | SELECT * FROM users RIGHT JOIN orders ON users.id = orders.user_id; |
| CROSS JOIN | Cartesian product | All combinations | SELECT * FROM colors CROSS JOIN sizes; |
| SELF JOIN | Join table to itself | Hierarchical data | SELECT e.name, m.name AS manager FROM employees e JOIN employees m ON e.manager_id = m.id; |
| NATURAL JOIN | Join on matching columns | Automatic join condition | SELECT * FROM users NATURAL JOIN profiles; |
| JOIN with USING | Simplified join syntax | Join on named columns | SELECT * FROM users JOIN orders USING (user_id); |
| Multiple JOINs | Join multiple tables | Complex relationships | SELECT * FROM users JOIN orders ON users.id = orders.user_id JOIN products ON orders.product_id = products.id; |
| LEFT JOIN with WHERE NULL | Find unmatched rows | Missing relationship detection | SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id WHERE orders.id IS NULL; |
| JOIN with aggregation | Aggregate joined data | Summary with relationships | SELECT users.name, COUNT(orders.id) FROM users LEFT JOIN orders ON users.id = orders.user_id GROUP BY users.id; |

### 9. Aggregate Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| COUNT | Count rows | Row counting | SELECT COUNT(*) FROM users; |
| SUM | Sum values | Total calculation | SELECT SUM(price) FROM orders; |
| AVG | Average value | Mean calculation | SELECT AVG(age) FROM users; |
| MIN | Minimum value | Lowest value | SELECT MIN(price) FROM products; |
| MAX | Maximum value | Highest value | SELECT MAX(salary) FROM employees; |
| GROUP_CONCAT | Concatenate grouped values | String aggregation | SELECT user_id, GROUP_CONCAT(product_name) FROM orders GROUP BY user_id; |
| COUNT DISTINCT | Count unique values | Unique counting | SELECT COUNT(DISTINCT country) FROM users; |
| STD | Standard deviation | Statistical analysis | SELECT STD(score) FROM tests; |
| VARIANCE | Variance calculation | Statistical analysis | SELECT VARIANCE(price) FROM products; |
| BIT_AND, BIT_OR, BIT_XOR | Bitwise aggregation | Bitwise operations | SELECT BIT_AND(flags) FROM settings; |

### 10. String Functions (12)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| CONCAT | Concatenate strings | String joining | SELECT CONCAT(first_name, ' ', last_name) FROM users; |
| SUBSTRING | Extract substring | String extraction | SELECT SUBSTRING(name, 1, 10) FROM users; |
| LENGTH | String length | Size calculation | SELECT LENGTH(name) FROM users; |
| UPPER | Convert to uppercase | Case conversion | SELECT UPPER(name) FROM users; |
| LOWER | Convert to lowercase | Case conversion | SELECT LOWER(email) FROM users; |
| TRIM | Remove whitespace | String cleaning | SELECT TRIM(name) FROM users; |
| REPLACE | Replace substring | String substitution | SELECT REPLACE(text, 'old', 'new') FROM articles; |
| LEFT | Get leftmost characters | Prefix extraction | SELECT LEFT(name, 5) FROM users; |
| RIGHT | Get rightmost characters | Suffix extraction | SELECT RIGHT(phone, 4) FROM users; |
| LOCATE | Find substring position | String searching | SELECT LOCATE('@', email) FROM users; |
| LPAD | Left pad string | String formatting | SELECT LPAD(id, 5, '0') FROM users; |
| RPAD | Right pad string | String formatting | SELECT RPAD(name, 20, '.') FROM users; |

### 11. Date and Time Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| NOW | Current datetime | Timestamp retrieval | SELECT NOW(); |
| CURDATE | Current date | Date retrieval | SELECT CURDATE(); |
| CURTIME | Current time | Time retrieval | SELECT CURTIME(); |
| DATE | Extract date | Date extraction | SELECT DATE(created_at) FROM orders; |
| TIME | Extract time | Time extraction | SELECT TIME(created_at) FROM logs; |
| YEAR, MONTH, DAY | Extract date parts | Date component extraction | SELECT YEAR(created_at) FROM users; |
| DATE_ADD | Add time interval | Date calculation | SELECT DATE_ADD(NOW(), INTERVAL 7 DAY); |
| DATE_SUB | Subtract time interval | Date calculation | SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH); |
| DATEDIFF | Difference between dates | Duration calculation | SELECT DATEDIFF(NOW(), created_at) FROM users; |
| DATE_FORMAT | Format date | Date display | SELECT DATE_FORMAT(created_at, '%Y-%m-%d') FROM users; |

### 12. User and Privilege Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE USER | Create new user | User management | CREATE USER 'username'@'localhost' IDENTIFIED BY 'password'; |
| DROP USER | Delete user | User removal | DROP USER 'username'@'localhost'; |
| GRANT | Grant privileges | Permission assignment | GRANT ALL PRIVILEGES ON mydb.* TO 'username'@'localhost'; |
| REVOKE | Revoke privileges | Permission removal | REVOKE INSERT ON mydb.* FROM 'username'@'localhost'; |
| SHOW GRANTS | Show user privileges | Permission review | SHOW GRANTS FOR 'username'@'localhost'; |
| SET PASSWORD | Change password | Password update | SET PASSWORD FOR 'username'@'localhost' = PASSWORD('newpass'); |
| ALTER USER | Modify user | User modification | ALTER USER 'username'@'localhost' IDENTIFIED BY 'newpass'; |
| RENAME USER | Rename user | User renaming | RENAME USER 'old'@'localhost' TO 'new'@'localhost'; |
| FLUSH PRIVILEGES | Reload privileges | Apply permission changes | FLUSH PRIVILEGES; |
| SELECT USER() | Show current user | Identity verification | SELECT USER(); |
| SHOW PROCESSLIST | Show active connections | Connection monitoring | SHOW PROCESSLIST; |
| KILL | Terminate connection | Connection management | KILL 123; |

### 13. Transactions (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| START TRANSACTION | Begin transaction | Transaction initiation | START TRANSACTION; |
| COMMIT | Commit transaction | Save changes | COMMIT; |
| ROLLBACK | Rollback transaction | Undo changes | ROLLBACK; |
| SAVEPOINT | Create savepoint | Partial rollback point | SAVEPOINT sp1; |
| ROLLBACK TO SAVEPOINT | Rollback to savepoint | Partial undo | ROLLBACK TO SAVEPOINT sp1; |
| SET AUTOCOMMIT | Control autocommit | Transaction mode control | SET AUTOCOMMIT = 0; |
| LOCK TABLES | Lock tables | Prevent concurrent access | LOCK TABLES users WRITE; |
| UNLOCK TABLES | Unlock tables | Release locks | UNLOCK TABLES; |
| SELECT FOR UPDATE | Lock rows for update | Pessimistic locking | SELECT * FROM users WHERE id = 1 FOR UPDATE; |
| SET TRANSACTION ISOLATION LEVEL | Set isolation level | Concurrency control | SET TRANSACTION ISOLATION LEVEL READ COMMITTED; |

### 14. Backup and Recovery (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| mysqldump database | Backup database | Database export | mysqldump -u root -p mydb > backup.sql |
| mysqldump table | Backup specific table | Table export | mysqldump -u root -p mydb users > users.sql |
| mysqldump all databases | Backup all databases | Full server backup | mysqldump -u root -p --all-databases > all.sql |
| mysql import | Restore from backup | Database import | mysql -u root -p mydb < backup.sql |
| mysqldump with compression | Compressed backup | Space-efficient backup | mysqldump -u root -p mydb | gzip > backup.sql.gz |
| SELECT INTO OUTFILE | Export query results | Data extraction | SELECT * FROM users INTO OUTFILE '/tmp/users.csv'; |
| LOAD DATA INFILE | Import data file | Bulk import | LOAD DATA INFILE '/tmp/users.csv' INTO TABLE users; |
| mysqlhotcopy | Hot backup | Quick backup | mysqlhotcopy mydb /backup/path/ |

### 15. Performance and Optimization (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| EXPLAIN | Show query execution plan | Query optimization | EXPLAIN SELECT * FROM users WHERE name = 'John'; |
| EXPLAIN ANALYZE | Execute and analyze query | Performance analysis | EXPLAIN ANALYZE SELECT * FROM users; |
| SHOW STATUS | Show server status | Performance monitoring | SHOW STATUS LIKE 'Threads_connected'; |
| SHOW VARIABLES | Show configuration | Configuration review | SHOW VARIABLES LIKE 'max_connections'; |
| SET GLOBAL | Set global variable | Configuration change | SET GLOBAL max_connections = 200; |
| OPTIMIZE TABLE | Defragment table | Storage optimization | OPTIMIZE TABLE users; |
| ANALYZE TABLE | Update statistics | Query planner optimization | ANALYZE TABLE users; |
| SHOW TABLE STATUS | Show table information | Table statistics | SHOW TABLE STATUS LIKE 'users'; |
| SHOW ENGINE INNODB STATUS | InnoDB diagnostics | Engine monitoring | SHOW ENGINE INNODB STATUS; |
| SHOW PROFILES | Show query profiles | Query performance | SHOW PROFILES; |
| SET profiling | Enable profiling | Performance tracking | SET profiling = 1; |
| CHECK TABLE | Check table integrity | Table verification | CHECK TABLE users; |

### 16. Views and Stored Procedures (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE VIEW | Create view | Virtual table creation | CREATE VIEW active_users AS SELECT * FROM users WHERE active=1; |
| DROP VIEW | Delete view | View removal | DROP VIEW active_users; |
| SHOW FULL TABLES | List tables and views | Object discovery | SHOW FULL TABLES WHERE Table_type = 'VIEW'; |
| CREATE PROCEDURE | Create stored procedure | Reusable logic | CREATE PROCEDURE GetUser(IN id INT) BEGIN SELECT * FROM users WHERE users.id = id; END; |
| DROP PROCEDURE | Delete procedure | Procedure removal | DROP PROCEDURE GetUser; |
| CALL | Execute procedure | Procedure invocation | CALL GetUser(1); |
| SHOW PROCEDURE STATUS | List procedures | Procedure discovery | SHOW PROCEDURE STATUS; |
| CREATE FUNCTION | Create function | Custom function | CREATE FUNCTION GetTotal() RETURNS INT BEGIN RETURN (SELECT COUNT(*) FROM users); END; |
| DROP FUNCTION | Delete function | Function removal | DROP FUNCTION GetTotal; |
| SHOW FUNCTION STATUS | List functions | Function discovery | SHOW FUNCTION STATUS; |

### 17. Data Types and Constraints (12)

| Type/Constraint | Description | Common Usage | Examples |
|-----------------|-------------|--------------|----------|
| INT | Integer type | Numeric storage | id INT |
| VARCHAR | Variable length string | Text storage | name VARCHAR(100) |
| TEXT | Long text | Large text storage | description TEXT |
| DATE | Date type | Date storage | birth_date DATE |
| DATETIME | Date and time | Timestamp storage | created_at DATETIME |
| DECIMAL | Fixed-point number | Precise numeric | price DECIMAL(10,2) |
| BOOLEAN | Boolean type | True/false storage | active BOOLEAN |
| ENUM | Enumeration | Fixed value set | status ENUM('active','inactive') |
| PRIMARY KEY | Primary key constraint | Unique identifier | id INT PRIMARY KEY |
| FOREIGN KEY | Foreign key constraint | Referential integrity | FOREIGN KEY (user_id) REFERENCES users(id) |
| NOT NULL | Not null constraint | Required field | name VARCHAR(100) NOT NULL |
| DEFAULT | Default value | Automatic value | created_at DATETIME DEFAULT NOW() |

## Tips and Best Practices

* Always use prepared statements to prevent SQL injection attacks
* Create indexes on columns used frequently in WHERE, JOIN, and ORDER BY clauses
* Use EXPLAIN to analyze query performance before optimizing
* Normalize database design to reduce data redundancy and improve consistency
* Use appropriate data types to minimize storage and improve performance
* Implement regular backup schedules using mysqldump or similar tools
* Monitor slow query log to identify performance bottlenecks
* Use transactions for operations that require atomicity
* Set appropriate connection pool sizes based on application workload
* Use InnoDB engine for transactions and foreign key support
* Implement proper indexing strategy but avoid over-indexing
* Use LIMIT clauses to prevent accidentally retrieving huge result sets
* Regularly analyze and optimize tables to maintain performance
* Use connection pooling to reduce connection overhead
* Monitor database size and implement archiving strategies for historical data

## Additional Resources

* [MySQL Official Documentation](https://dev.mysql.com/doc/)
* [MySQL Performance Tuning Guide](https://dev.mysql.com/doc/refman/8.0/en/optimization.html)
* [MySQL Workbench Documentation](https://dev.mysql.com/doc/workbench/en/)
* [MySQL Tutorial](https://www.mysqltutorial.org/)
* [MySQL Best Practices](https://dev.mysql.com/doc/mysql-tutorial-excerpt/8.0/en/)
* [MySQL High Availability](https://dev.mysql.com/doc/mysql-ha-scalability/en/)
* [MySQL Security Guide](https://dev.mysql.com/doc/refman/8.0/en/security.html)
* [MySQL Replication](https://dev.mysql.com/doc/refman/8.0/en/replication.html)

## Mini-Glossary

This glossary covers essential MySQL terminology, concepts, and patterns to help you understand and work effectively with MySQL.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| Database | Collection of organized tables |
| Table | Structured collection of rows and columns |
| Row | Single record in table |
| Column | Field in table with specific data type |
| Primary Key | Unique identifier for rows |
| Foreign Key | Reference to primary key in another table |
| Index | Data structure for fast lookups |
| Query | Request for data from database |
| Schema | Database structure definition |
| Normalization | Organizing data to reduce redundancy |

### Storage Engines

| Engine | Description |
|--------|-------------|
| InnoDB | Default transactional engine |
| MyISAM | Non-transactional engine, fast reads |
| Memory | In-memory storage engine |
| Archive | Compressed storage for historical data |
| CSV | Stores data in CSV files |
| Blackhole | Accepts data but doesn't store it |
| NDB | Clustered storage engine |

### Index Types

| Type | Description |
|------|-------------|
| Primary | Unique identifier index |
| Unique | Ensures column uniqueness |
| Index | Standard non-unique index |
| Fulltext | Text search optimization |
| Spatial | Geographic data indexing |
| Composite | Index on multiple columns |
| BTREE | Balanced tree index (default) |
| HASH | Hash table index |

### Join Types

| Type | Description |
|------|-------------|
| INNER JOIN | Matching rows from both tables |
| LEFT JOIN | All left rows, matched right rows |
| RIGHT JOIN | All right rows, matched left rows |
| CROSS JOIN | Cartesian product of tables |
| SELF JOIN | Join table to itself |
| NATURAL JOIN | Join on matching column names |

### Transaction Isolation Levels

| Level | Description |
|-------|-------------|
| READ UNCOMMITTED | Allows dirty reads |
| READ COMMITTED | Prevents dirty reads |
| REPEATABLE READ | Consistent reads in transaction |
| SERIALIZABLE | Full isolation, no concurrency |

### Data Types

| Category | Types |
|----------|-------|
| Numeric | INT, BIGINT, DECIMAL, FLOAT, DOUBLE |
| String | CHAR, VARCHAR, TEXT, BLOB |
| Date/Time | DATE, TIME, DATETIME, TIMESTAMP, YEAR |
| JSON | JSON data type |
| Spatial | GEOMETRY, POINT, LINESTRING, POLYGON |
| Boolean | BOOLEAN (TINYINT(1)) |

### Constraints

| Constraint | Description |
|------------|-------------|
| PRIMARY KEY | Unique identifier |
| FOREIGN KEY | Referential integrity |
| UNIQUE | Unique values |
| NOT NULL | Required value |
| DEFAULT | Default value |
| CHECK | Value validation |
| AUTO_INCREMENT | Automatic numbering |

### Replication Concepts

| Concept | Description |
|---------|-------------|
| Master | Primary server for writes |
| Slave | Replica server for reads |
| Binary log | Log of data changes |
| Relay log | Slave's copy of binary log |
| Replication lag | Delay between master and slave |
| GTID | Global Transaction Identifier |
| Semi-synchronous | Wait for one slave confirmation |

### Performance Features

| Feature | Description |
|---------|-------------|
| Query cache | Cache query results |
| Buffer pool | InnoDB memory cache |
| Table cache | Cache table metadata |
| Connection pool | Reuse connections |
| Partitioning | Split tables into partitions |
| Query optimization | Improve query execution |
| Slow query log | Track slow queries |

### Security Features

| Feature | Description |
|---------|-------------|
| User authentication | Verify user identity |
| Privilege system | Control user permissions |
| SSL/TLS | Encrypt connections |
| Password policies | Enforce password rules |
| Audit logging | Track database activity |
| Encryption at rest | Encrypt stored data |
| Role-based access | Group permissions |
