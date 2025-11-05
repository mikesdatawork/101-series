# 101 PostgreSQL Commands

## Overview
PostgreSQL (often called "Postgres") is a powerful, open-source relational database management system known for its robustness, extensibility, and standards compliance. This cheat sheet covers essential PostgreSQL commands, functions, and operations for database creation, management, querying, optimization, and administration. From basic SQL operations to advanced PostgreSQL-specific features, these commands help database developers and administrators work effectively with PostgreSQL databases.

## Target Audience
- Database administrators
- Backend developers
- Data engineers
- Data scientists and analysts
- DevOps engineers
- Application developers using PostgreSQL

## Command Categories

### 1. Connection and Authentication (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `psql` | Connect to PostgreSQL | Interactive command line | `psql -U username -d database` |
| `psql -h` | Connect to remote host | Accessing remote servers | `psql -h localhost -U user -d db` |
| `psql -p` | Specify port | Non-standard port connections | `psql -p 5433 -d database` |
| `psql -f` | Execute commands from file | Running SQL scripts | `psql -f script.sql -d database` |
| `\c` | Connect to database | Switching databases | `\c database_name` |
| `\conninfo` | Display connection info | Checking current connection | `\conninfo` |
| `\password` | Change password | Updating user password | `\password username` |
| `pg_dump -h` | Specify host for backup | Remote backups | `pg_dump -h localhost db > backup.sql` |

### 2. Database and Schema Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE DATABASE` | Create new database | Setting up new project | `CREATE DATABASE mydb;` |
| `DROP DATABASE` | Delete database | Removing databases | `DROP DATABASE mydb;` |
| `ALTER DATABASE` | Modify database | Changing database properties | `ALTER DATABASE mydb RENAME TO newdb;` |
| `CREATE SCHEMA` | Create new schema | Organizing database objects | `CREATE SCHEMA myschema;` |
| `DROP SCHEMA` | Delete schema | Removing schemas | `DROP SCHEMA myschema;` |
| `ALTER SCHEMA` | Modify schema | Changing schema properties | `ALTER SCHEMA myschema RENAME TO newschema;` |
| `SHOW search_path` | Show schema search path | Checking active schemas | `SHOW search_path;` |
| `SET search_path` | Set schema search path | Changing active schemas | `SET search_path TO myschema, public;` |
| `\l` | List all databases | Database overview | `\l` |
| `\dn` | List all schemas | Schema overview | `\dn` |
| `\db` | List all tablespaces | Storage overview | `\db` |
| `\drds` | List role settings | Permission overview | `\drds` |

### 3. Table Management (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE TABLE` | Create new table | Defining data structure | `CREATE TABLE users (id SERIAL, name TEXT);` |
| `DROP TABLE` | Delete table | Removing tables | `DROP TABLE users;` |
| `ALTER TABLE` | Modify table | Changing table structure | `ALTER TABLE users ADD COLUMN email TEXT;` |
| `TRUNCATE TABLE` | Empty table quickly | Fast data removal | `TRUNCATE TABLE users;` |
| `CREATE TABLE AS` | Create table from query | Table generation | `CREATE TABLE user_copy AS SELECT * FROM users;` |
| `CREATE TEMP TABLE` | Create temporary table | Session-only tables | `CREATE TEMP TABLE temp_users (id INT);` |
| `ALTER TABLE ADD COLUMN` | Add new column | Extending tables | `ALTER TABLE users ADD COLUMN birth_date DATE;` |
| `ALTER TABLE DROP COLUMN` | Remove column | Simplifying tables | `ALTER TABLE users DROP COLUMN nickname;` |
| `ALTER TABLE ALTER COLUMN` | Modify column | Changing column properties | `ALTER TABLE users ALTER COLUMN name SET NOT NULL;` |
| `ALTER TABLE RENAME` | Rename table | Table reorganization | `ALTER TABLE users RENAME TO people;` |
| `ALTER TABLE RENAME COLUMN` | Rename column | Column reorganization | `ALTER TABLE users RENAME COLUMN name TO full_name;` |
| `ALTER TABLE ADD CONSTRAINT` | Add constraint | Enforcing rules | `ALTER TABLE users ADD CONSTRAINT pk_users PRIMARY KEY (id);` |
| `ALTER TABLE DROP CONSTRAINT` | Remove constraint | Removing restrictions | `ALTER TABLE users DROP CONSTRAINT pk_users;` |
| `\d` | List tables | Table overview | `\d` |
| `\d+` | Detailed table info | Table structure analysis | `\d+ table_name` |

### 4. Basic Querying (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `SELECT` | Query data | Retrieving information | `SELECT * FROM users;` |
| `INSERT INTO` | Add records | Creating new records | `INSERT INTO users (name) VALUES ('John');` |
| `UPDATE` | Modify records | Changing existing data | `UPDATE users SET name = 'John Doe' WHERE id = 1;` |
| `DELETE FROM` | Remove records | Deleting specific data | `DELETE FROM users WHERE id = 1;` |
| `SELECT DISTINCT` | Get unique values | Finding distinct entries | `SELECT DISTINCT category FROM products;` |
| `WHERE` | Filter results | Conditional queries | `SELECT * FROM users WHERE age > 21;` |
| `ORDER BY` | Sort results | Organized output | `SELECT * FROM users ORDER BY name ASC;` |
| `LIMIT` | Limit result count | Pagination | `SELECT * FROM users LIMIT 10;` |
| `OFFSET` | Skip initial results | Pagination | `SELECT * FROM users LIMIT 10 OFFSET 10;` |
| `IN` | Multiple value match | List-based filtering | `SELECT * FROM users WHERE country IN ('US', 'CA');` |
| `BETWEEN` | Range match | Range-based filtering | `SELECT * FROM users WHERE age BETWEEN 18 AND 65;` |
| `LIKE` | Pattern matching | Text search | `SELECT * FROM users WHERE name LIKE 'J%';` |

### 5. Joins and Relationships (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `INNER JOIN` | Match records in both tables | Related data retrieval | `SELECT * FROM orders INNER JOIN users ON orders.user_id = users.id;` |
| `LEFT JOIN` | Include all left table records | Optional relationships | `SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id;` |
| `RIGHT JOIN` | Include all right table records | Optional relationships | `SELECT * FROM orders RIGHT JOIN users ON orders.user_id = users.id;` |
| `FULL JOIN` | Include all records | Complete dataset | `SELECT * FROM users FULL JOIN orders ON users.id = orders.user_id;` |
| `CROSS JOIN` | Cartesian product | All combinations | `SELECT * FROM sizes CROSS JOIN colors;` |
| `SELF JOIN` | Join table to itself | Hierarchical data | `SELECT e1.name, e2.name AS manager FROM employees e1 JOIN employees e2 ON e1.manager_id = e2.id;` |
| `NATURAL JOIN` | Join on same column names | Simple relationships | `SELECT * FROM users NATURAL JOIN user_profiles;` |
| `JOIN USING` | Join on specific columns | Simplified join syntax | `SELECT * FROM orders JOIN order_items USING (order_id);` |
| `LATERAL JOIN` | Join with subqueries | Complex relationships | `SELECT * FROM users, LATERAL (SELECT * FROM orders WHERE orders.user_id = users.id LIMIT 3) o;` |
| `UNION` | Combine result sets | Merged datasets | `SELECT name FROM employees UNION SELECT name FROM customers;` |

### 6. Aggregation and Grouping (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `COUNT()` | Count records | Record counting | `SELECT COUNT(*) FROM users;` |
| `SUM()` | Sum values | Total calculation | `SELECT SUM(amount) FROM orders;` |
| `AVG()` | Average values | Mean calculation | `SELECT AVG(age) FROM users;` |
| `MIN()` | Minimum value | Finding smallest value | `SELECT MIN(price) FROM products;` |
| `MAX()` | Maximum value | Finding largest value | `SELECT MAX(price) FROM products;` |
| `GROUP BY` | Group records | Aggregation by category | `SELECT category, COUNT(*) FROM products GROUP BY category;` |
| `HAVING` | Filter groups | Aggregate filtering | `SELECT category, COUNT(*) FROM products GROUP BY category HAVING COUNT(*) > 5;` |
| `GROUPING SETS` | Multiple groupings | Multi-level analysis | `SELECT category, region, SUM(sales) FROM sales GROUP BY GROUPING SETS ((category), (region));` |

### 7. Indexes and Performance (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE INDEX` | Create index | Performance optimization | `CREATE INDEX idx_user_email ON users(email);` |
| `CREATE UNIQUE INDEX` | Create unique index | Enforcing uniqueness | `CREATE UNIQUE INDEX idx_unique_email ON users(email);` |
| `DROP INDEX` | Remove index | Cleanup unused indexes | `DROP INDEX idx_user_email;` |
| `EXPLAIN` | Show query plan | Query analysis | `EXPLAIN SELECT * FROM users WHERE email = 'user@example.com';` |
| `ANALYZE` | Update statistics | Statistics gathering | `ANALYZE users;` |
| `VACUUM` | Clean up storage | Maintenance | `VACUUM users;` |
| `CLUSTER` | Physically reorder table | Performance tuning | `CLUSTER users USING idx_user_name;` |
| `REINDEX` | Rebuild indexes | Index maintenance | `REINDEX INDEX idx_user_email;` |

### 8. Views and Materialized Views (6)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE VIEW` | Create virtual table | Query simplification | `CREATE VIEW active_users AS SELECT * FROM users WHERE status = 'active';` |
| `DROP VIEW` | Remove view | View cleanup | `DROP VIEW active_users;` |
| `CREATE MATERIALIZED VIEW` | Create cached view | Performance optimization | `CREATE MATERIALIZED VIEW user_stats AS SELECT count(*) FROM users;` |
| `REFRESH MATERIALIZED VIEW` | Update materialized view | Data refresh | `REFRESH MATERIALIZED VIEW user_stats;` |
| `ALTER VIEW` | Modify view | View maintenance | `ALTER VIEW active_users RENAME TO current_users;` |
| `\dv` | List views | View overview | `\dv` |

### 9. Functions and Procedures (7)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE FUNCTION` | Create function | Custom operations | `CREATE FUNCTION add(a INT, b INT) RETURNS INT AS 'SELECT a + b' LANGUAGE SQL;` |
| `DROP FUNCTION` | Remove function | Function cleanup | `DROP FUNCTION add(INT, INT);` |
| `CREATE PROCEDURE` | Create procedure | Transaction operations | `CREATE PROCEDURE transfer(sender INT, receiver INT, amount DECIMAL) AS $$ BEGIN /* logic */ END; $$ LANGUAGE plpgsql;` |
| `CALL` | Execute procedure | Running procedures | `CALL transfer(1, 2, 100.00);` |
| `DROP PROCEDURE` | Remove procedure | Procedure cleanup | `DROP PROCEDURE transfer;` |
| `SELECT function()` | Call function | Using functions | `SELECT add(5, 3);` |
| `\df` | List functions | Function overview | `\df` |

### 10. Triggers and Events (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE TRIGGER` | Create trigger | Automated actions | `CREATE TRIGGER update_timestamp BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_timestamp();` |
| `DROP TRIGGER` | Remove trigger | Trigger cleanup | `DROP TRIGGER update_timestamp ON users;` |
| `CREATE EVENT TRIGGER` | Create event trigger | Server-wide events | `CREATE EVENT TRIGGER on_ddl ON ddl_command_start EXECUTE FUNCTION log_ddl();` |
| `ALTER TRIGGER` | Modify trigger | Trigger maintenance | `ALTER TRIGGER update_timestamp ON users RENAME TO mod_timestamp;` |
| `\dy` | List triggers | Trigger overview | `\dy` |

### 11. Backup and Restore (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `pg_dump` | Backup database | Creating backups | `pg_dump dbname > backup.sql` |
| `pg_restore` | Restore database | Restoring backups | `pg_restore -d dbname backup.dump` |
| `pg_dumpall` | Backup all databases | Full system backup | `pg_dumpall > all_dbs_backup.sql` |
| `COPY TO` | Export table data | Data extraction | `COPY users TO '/tmp/users.csv' WITH CSV HEADER;` |
| `COPY FROM` | Import table data | Data loading | `COPY users FROM '/tmp/users.csv' WITH CSV HEADER;` |

### 12. Advanced Features (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `CREATE EXTENSION` | Enable extension | Adding functionality | `CREATE EXTENSION postgis;` |
| `CREATE TYPE` | Create custom type | Domain-specific types | `CREATE TYPE status AS ENUM ('active', 'inactive');` |
| `LISTEN/NOTIFY` | Asynchronous notifications | Inter-process communication | `NOTIFY channel, 'message';` |
| `WITH (CTE)` | Common Table Expression | Complex queries | `WITH ranked AS (SELECT *, RANK() OVER (PARTITION BY dept ORDER BY salary DESC) FROM employees) SELECT * FROM ranked WHERE rank = 1;` |
| `JSON functions` | Process JSON data | Working with JSON | `SELECT data->'user'->>'name' FROM documents;` |

## Tips and Best Practices
* Always use prepared statements in applications to prevent SQL injection
* Create indexes for columns frequently used in WHERE clauses and joins
* Regularly run VACUUM and ANALYZE for optimal performance
* Use transactions for operations that need to be atomic
* Keep long-running queries in separate transactions
* Use connection pooling in production environments
* Be careful with SELECT * in production code
* Add proper constraints to ensure data integrity
* Use EXPLAIN ANALYZE to understand and optimize query performance
* Implement a regular backup strategy

## Additional Resources
* [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)
* [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
* [PostgreSQL Exercises](https://pgexercises.com/)
* [PostgreSQL Performance Tips](https://wiki.postgresql.org/wiki/Performance_Optimization)
* [PostgreSQL Admin Cookbook](https://www.packtpub.com/product/postgresql-administration-cookbook/9781783989225)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to PostgreSQL.

### Common Terms

| Term | Description |
|------|-------------|
| `RDBMS` | Relational Database Management System - what PostgreSQL is |
| `SQL` | Structured Query Language - the language used to interact with PostgreSQL |
| `schema` | A namespace that contains named database objects like tables and functions |
| `transaction` | A unit of work that is either completed in full or not at all |
| `ACID` | Atomicity, Consistency, Isolation, Durability - properties of database transactions |
| `index` | Data structure improving the speed of data retrieval operations |
| `primary key` | Column(s) that uniquely identify each row in a table |
| `foreign key` | Column(s) that refer to a primary key in another table |
| `constraint` | Rule enforced on data columns in a table |
| `view` | Virtual table representing the result of a stored query |

### Common Flags/Options

| Flag/Option | Common Meaning | Example Usage |
|-------------|----------------|--------------|
| `-U` | Username | `psql -U postgres` |
| `-d` | Database name | `psql -d mydb` |
| `-h` | Host name | `psql -h localhost` |
| `-p` | Port number | `psql -p 5432` |
| `-f` | File to execute | `psql -f script.sql` |
| `-c` | Command to run | `psql -c "SELECT version();"` |
| `-o` | Output file | `psql -o output.txt` |
| `-t` | Tuples only | `psql -t -c "SELECT 1;"` |
| `-q` | Quiet mode | `psql -q` |
| `-v` | Set variable | `psql -v myvar=value` |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `PK` | Primary Key | Table constraints |
| `FK` | Foreign Key | Table relationships |
| `DDL` | Data Definition Language | CREATE, ALTER, DROP commands |
| `DML` | Data Manipulation Language | SELECT, INSERT, UPDATE, DELETE commands |
| `DCL` | Data Control Language | GRANT, REVOKE commands |
| `TCL` | Transaction Control Language | COMMIT, ROLLBACK commands |
| `CTE` | Common Table Expression | WITH queries |
| `MVCC` | Multi-Version Concurrency Control | PostgreSQL's approach to concurrency |
| `WAL` | Write-Ahead Logging | Transaction logging mechanism |
| `OID` | Object Identifier | Internal object identification |

### Special Characters/Syntax

| Symbol/Syntax | Name | Usage |
|---------------|------|-------|
| `;` | Semicolon | Statement terminator |
| `--` | Double dash | Single-line comment |
| `/*...*/` | Slash-star | Multi-line comment |
| `$$ ... $$` | Dollar quoting | Alternative string quoting |
| `"` | Double quote | Identifier (column/table) quoting |
| `'` | Single quote | String literal quoting |
| `::` | Cast operator | Type conversion |
| `->` | Arrow operator | JSON object access |
| `->>` | Double arrow | JSON text extraction |
| `@>` | Contains | Array/JSONB containment |

### Command/Function Syntax

Basic syntax pattern for PostgreSQL commands:
```sql
COMMAND [OPTIONS] [ARGUMENTS] [WHERE conditions] [OTHER_CLAUSES];
```

* **COMMAND**: The operation to perform (SELECT, INSERT, CREATE, etc.)
* **OPTIONS**: Modifiers that affect the command behavior
* **ARGUMENTS**: What the command acts on (tables, columns, etc.)
* **WHERE conditions**: Filtering criteria
* **OTHER_CLAUSES**: Additional specifications (GROUP BY, HAVING, etc.)

Example with breakdown:
```sql
SELECT first_name, last_name 
FROM users 
WHERE status = 'active' 
ORDER BY last_name ASC 
LIMIT 10;
```
* `SELECT` is the command
* `first_name, last_name` are the columns to retrieve
* `FROM users` specifies the table
* `WHERE status = 'active'` filters the results
* `ORDER BY last_name ASC` sorts the output
* `LIMIT 10` restricts to 10 rows
* `;` terminates the statement
