# 101 SQLite Commands

## Overview

SQLite is a self-contained, serverless, zero-configuration, transactional SQL database engine embedded in applications. This cheat sheet covers essential SQLite commands, database operations, query optimization, data manipulation, schema management, and performance tuning techniques. Master these commands to build lightweight data-driven applications, prototypes, and embedded database solutions.

## Target Audience

- Mobile app developers using local storage
- Data scientists prototyping analysis workflows
- Embedded systems developers
- Desktop application developers
- Anyone needing lightweight database solutions

## Command Categories

### 1. Database Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| sqlite3 database.db | Open or create database | Database access | sqlite3 mydata.db |
| .open | Open database file | Switch database | .open mydata.db |
| .databases | List attached databases | Database inspection | .databases |
| .quit | Exit SQLite | Close session | .quit |
| .exit | Exit SQLite (alternative) | Close session | .exit |
| ATTACH DATABASE | Attach additional database | Multi-database operations | ATTACH DATABASE 'other.db' AS other; |
| DETACH DATABASE | Detach database | Remove database | DETACH DATABASE other; |
| .backup | Backup database | Create backup | .backup backup.db |
| .restore | Restore database | Recovery | .restore backup.db |
| VACUUM | Rebuild database file | Reclaim space, defragment | VACUUM; |

### 2. Table Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE TABLE | Create new table | Table definition | CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT); |
| DROP TABLE | Delete table | Table removal | DROP TABLE users; |
| .tables | List all tables | Table discovery | .tables |
| .schema | Show table schema | Structure inspection | .schema users |
| ALTER TABLE ADD COLUMN | Add column | Schema modification | ALTER TABLE users ADD COLUMN email TEXT; |
| ALTER TABLE RENAME TO | Rename table | Table reorganization | ALTER TABLE old_name RENAME TO new_name; |
| ALTER TABLE RENAME COLUMN | Rename column | Column reorganization | ALTER TABLE users RENAME COLUMN name TO full_name; |
| ALTER TABLE DROP COLUMN | Remove column | Schema cleanup | ALTER TABLE users DROP COLUMN temp_col; |
| CREATE TABLE IF NOT EXISTS | Conditional table creation | Safe creation | CREATE TABLE IF NOT EXISTS users (id INTEGER); |
| DROP TABLE IF EXISTS | Conditional table drop | Safe deletion | DROP TABLE IF EXISTS users; |
| CREATE TEMPORARY TABLE | Create temp table | Session-only table | CREATE TEMPORARY TABLE temp_data (id INTEGER); |
| .dump | Export table structure and data | Backup, migration | .dump users |

### 3. Data Manipulation - INSERT (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| INSERT INTO | Insert single row | Add data | INSERT INTO users (name) VALUES ('John'); |
| INSERT INTO multiple | Insert multiple rows | Batch insertion | INSERT INTO users VALUES (1, 'John'), (2, 'Jane'); |
| INSERT OR REPLACE | Insert or replace row | Upsert operation | INSERT OR REPLACE INTO users VALUES (1, 'John'); |
| INSERT OR IGNORE | Insert ignoring conflicts | Skip duplicates | INSERT OR IGNORE INTO users VALUES (1, 'John'); |
| INSERT OR ABORT | Insert with abort on error | Strict insertion | INSERT OR ABORT INTO users VALUES (1, 'John'); |
| INSERT OR FAIL | Insert with failure on error | Transaction control | INSERT OR FAIL INTO users VALUES (1, 'John'); |
| INSERT OR ROLLBACK | Insert with rollback on error | Transaction safety | INSERT OR ROLLBACK INTO users VALUES (1, 'John'); |
| INSERT INTO SELECT | Insert from query | Data copying | INSERT INTO archive SELECT * FROM users WHERE old=1; |
| INSERT with DEFAULT | Use default values | Partial insertion | INSERT INTO users (id) VALUES (NULL); |
| REPLACE INTO | Replace existing row | Upsert shorthand | REPLACE INTO users VALUES (1, 'John'); |

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
| SELECT AS | Column aliasing | Rename output | SELECT name AS full_name FROM users; |

### 5. Data Manipulation - UPDATE (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| UPDATE SET | Update rows | Data modification | UPDATE users SET email = 'new@email.com' WHERE id = 1; |
| UPDATE multiple columns | Update multiple fields | Batch updates | UPDATE users SET name='John', age=30 WHERE id=1; |
| UPDATE with subquery | Update using subquery | Conditional updates | UPDATE users SET status='vip' WHERE id IN (SELECT user_id FROM orders); |
| UPDATE with CASE | Conditional updates | Multiple conditions | UPDATE users SET status = CASE WHEN age < 18 THEN 'minor' ELSE 'adult' END; |
| UPDATE all rows | Update without WHERE | Global updates | UPDATE users SET active=1; |
| UPDATE OR REPLACE | Update or replace on conflict | Conflict resolution | UPDATE OR REPLACE users SET email='test@test.com' WHERE id=1; |
| UPDATE OR IGNORE | Update ignoring conflicts | Skip errors | UPDATE OR IGNORE users SET email='test@test.com' WHERE id=1; |
| UPDATE with LIMIT | Update limited rows | Controlled updates | UPDATE users SET status='reviewed' WHERE id > 0 LIMIT 100; |

### 6. Data Manipulation - DELETE (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| DELETE FROM | Delete rows | Data removal | DELETE FROM users WHERE id = 1; |
| DELETE with subquery | Delete using subquery | Conditional deletion | DELETE FROM users WHERE id IN (SELECT user_id FROM inactive); |
| DELETE all rows | Delete all data | Clear table | DELETE FROM users; |
| DELETE with LIMIT | Delete limited rows | Controlled deletion | DELETE FROM logs WHERE old=1 LIMIT 1000; |
| DELETE with ORDER BY | Delete ordered rows | Priority deletion | DELETE FROM queue WHERE processed=1 ORDER BY created_at LIMIT 10; |
| DELETE with JOIN (workaround) | Delete using join condition | Complex deletion | DELETE FROM users WHERE id IN (SELECT user_id FROM banned); |
| TRUNCATE simulation | Fast delete all | Performance optimization | DELETE FROM users; VACUUM; |
| Conditional DELETE | Delete with conditions | Filtered deletion | DELETE FROM users WHERE active=0 AND created_at < date('now', '-1 year'); |

### 7. Indexes and Constraints (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE INDEX | Create index | Query optimization | CREATE INDEX idx_name ON users(name); |
| DROP INDEX | Remove index | Index cleanup | DROP INDEX idx_name; |
| .indexes | List table indexes | Index discovery | .indexes users |
| CREATE UNIQUE INDEX | Create unique index | Enforce uniqueness | CREATE UNIQUE INDEX idx_email ON users(email); |
| CREATE INDEX IF NOT EXISTS | Conditional index creation | Safe creation | CREATE INDEX IF NOT EXISTS idx_name ON users(name); |
| PRIMARY KEY | Define primary key | Unique identifier | id INTEGER PRIMARY KEY |
| AUTOINCREMENT | Auto-incrementing key | Automatic ID generation | id INTEGER PRIMARY KEY AUTOINCREMENT |
| FOREIGN KEY | Define foreign key | Referential integrity | FOREIGN KEY (user_id) REFERENCES users(id) |
| UNIQUE constraint | Uniqueness constraint | Prevent duplicates | email TEXT UNIQUE |
| NOT NULL constraint | Not null constraint | Required field | name TEXT NOT NULL |
| CHECK constraint | Value validation | Data integrity | age INTEGER CHECK(age >= 0) |
| DEFAULT constraint | Default value | Automatic value | created_at DATETIME DEFAULT CURRENT_TIMESTAMP |

### 8. Joins and Relationships (10)

| Join Type | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| INNER JOIN | Match rows from both tables | Related data retrieval | SELECT * FROM users INNER JOIN orders ON users.id = orders.user_id; |
| LEFT JOIN | All rows from left table | Include unmatched left rows | SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id; |
| CROSS JOIN | Cartesian product | All combinations | SELECT * FROM colors CROSS JOIN sizes; |
| NATURAL JOIN | Join on matching columns | Automatic join | SELECT * FROM users NATURAL JOIN profiles; |
| SELF JOIN | Join table to itself | Hierarchical data | SELECT e.name, m.name AS manager FROM employees e JOIN employees m ON e.manager_id = m.id; |
| Multiple JOINs | Join multiple tables | Complex relationships | SELECT * FROM users JOIN orders ON users.id = orders.user_id JOIN products ON orders.product_id = products.id; |
| LEFT JOIN with WHERE NULL | Find unmatched rows | Missing relationships | SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id WHERE orders.id IS NULL; |
| JOIN with USING | Simplified join syntax | Join on named columns | SELECT * FROM users JOIN orders USING (user_id); |
| Compound JOIN conditions | Multiple join conditions | Complex matching | SELECT * FROM t1 JOIN t2 ON t1.a = t2.a AND t1.b = t2.b; |
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
| TOTAL | Sum with null handling | Null-safe sum | SELECT TOTAL(amount) FROM transactions; |
| ROUND | Round numeric value | Precision control | SELECT ROUND(AVG(price), 2) FROM products; |
| LENGTH | String length | Size calculation | SELECT name, LENGTH(name) FROM users; |

### 10. String Functions (12)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| || (concat) | Concatenate strings | String joining | SELECT first_name || ' ' || last_name FROM users; |
| SUBSTR | Extract substring | String extraction | SELECT SUBSTR(name, 1, 10) FROM users; |
| LENGTH | String length | Size calculation | SELECT LENGTH(name) FROM users; |
| UPPER | Convert to uppercase | Case conversion | SELECT UPPER(name) FROM users; |
| LOWER | Convert to lowercase | Case conversion | SELECT LOWER(email) FROM users; |
| TRIM | Remove whitespace | String cleaning | SELECT TRIM(name) FROM users; |
| LTRIM | Trim left whitespace | Left cleaning | SELECT LTRIM(text) FROM data; |
| RTRIM | Trim right whitespace | Right cleaning | SELECT RTRIM(text) FROM data; |
| REPLACE | Replace substring | String substitution | SELECT REPLACE(text, 'old', 'new') FROM articles; |
| INSTR | Find substring position | String searching | SELECT INSTR(email, '@') FROM users; |
| LIKE | Pattern matching | String filtering | SELECT * FROM users WHERE name LIKE 'J%'; |
| GLOB | Unix-style pattern matching | Case-sensitive patterns | SELECT * FROM files WHERE name GLOB '*.txt'; |

### 11. Date and Time Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| date() | Get current date | Date retrieval | SELECT date('now'); |
| time() | Get current time | Time retrieval | SELECT time('now'); |
| datetime() | Get current datetime | Timestamp retrieval | SELECT datetime('now'); |
| strftime() | Format datetime | Date formatting | SELECT strftime('%Y-%m-%d', 'now'); |
| julianday() | Convert to Julian day | Date math | SELECT julianday('now'); |
| date() with modifier | Date calculation | Date arithmetic | SELECT date('now', '+7 days'); |
| datetime() with modifier | Datetime calculation | Timestamp arithmetic | SELECT datetime('now', '-1 month'); |
| strftime for extraction | Extract date parts | Component extraction | SELECT strftime('%Y', created_at) FROM users; |
| date comparison | Compare dates | Date filtering | SELECT * FROM events WHERE date(event_date) = date('now'); |
| CURRENT_TIMESTAMP | Current timestamp | Default timestamp | created_at DATETIME DEFAULT CURRENT_TIMESTAMP |

### 12. Transactions (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| BEGIN TRANSACTION | Start transaction | Transaction initiation | BEGIN TRANSACTION; |
| COMMIT | Commit transaction | Save changes | COMMIT; |
| ROLLBACK | Rollback transaction | Undo changes | ROLLBACK; |
| SAVEPOINT | Create savepoint | Partial rollback point | SAVEPOINT sp1; |
| RELEASE SAVEPOINT | Release savepoint | Remove savepoint | RELEASE SAVEPOINT sp1; |
| ROLLBACK TO | Rollback to savepoint | Partial undo | ROLLBACK TO sp1; |
| BEGIN DEFERRED | Deferred transaction | Lazy locking | BEGIN DEFERRED; |
| BEGIN IMMEDIATE | Immediate transaction | Write lock | BEGIN IMMEDIATE; |
| BEGIN EXCLUSIVE | Exclusive transaction | Exclusive lock | BEGIN EXCLUSIVE; |
| END TRANSACTION | End transaction (synonym) | Alternative to COMMIT | END TRANSACTION; |

### 13. SQLite Dot Commands (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| .help | Show help | Command reference | .help |
| .mode | Set output mode | Format output | .mode column |
| .headers | Toggle column headers | Display control | .headers on |
| .width | Set column widths | Format control | .width 10 20 30 |
| .output | Redirect output | Export to file | .output results.txt |
| .import | Import data from file | Bulk data import | .import data.csv users |
| .read | Execute SQL from file | Script execution | .read script.sql |
| .timer | Toggle timing | Performance measurement | .timer on |
| .echo | Toggle command echo | Debug output | .echo on |
| .stats | Toggle statistics | Performance stats | .stats on |
| .changes | Show affected rows | Change tracking | .changes on |
| .separator | Set field separator | CSV export control | .separator ',' |

### 14. Views and Triggers (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE VIEW | Create view | Virtual table | CREATE VIEW active_users AS SELECT * FROM users WHERE active=1; |
| DROP VIEW | Delete view | View removal | DROP VIEW active_users; |
| CREATE TRIGGER | Create trigger | Automatic actions | CREATE TRIGGER update_timestamp AFTER UPDATE ON users BEGIN UPDATE users SET updated_at = datetime('now'); END; |
| DROP TRIGGER | Delete trigger | Trigger removal | DROP TRIGGER update_timestamp; |
| BEFORE INSERT trigger | Pre-insert action | Validation, defaults | CREATE TRIGGER validate_email BEFORE INSERT ON users BEGIN SELECT CASE WHEN NEW.email NOT LIKE '%@%' THEN RAISE(ABORT, 'Invalid email') END; END; |
| AFTER INSERT trigger | Post-insert action | Logging, notifications | CREATE TRIGGER log_insert AFTER INSERT ON users BEGIN INSERT INTO audit_log VALUES (NEW.id, 'inserted'); END; |
| BEFORE UPDATE trigger | Pre-update action | Validation | CREATE TRIGGER check_update BEFORE UPDATE ON users BEGIN ... END; |
| AFTER DELETE trigger | Post-delete action | Cascade operations | CREATE TRIGGER cleanup AFTER DELETE ON users BEGIN DELETE FROM sessions WHERE user_id = OLD.id; END; |
| .tables pattern | Filter table list | Selective display | .tables 'user%' |
| .schema table | Show specific schema | Table structure | .schema users |

### 15. Data Import and Export (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| .import file table | Import CSV data | Bulk import | .import data.csv users |
| .mode csv | Set CSV output mode | CSV export | .mode csv |
| .output file | Redirect to file | Export results | .output export.csv |
| .dump table | Export with schema | Complete backup | .dump users > users.sql |
| .read file | Execute SQL script | Import SQL | .read backup.sql |
| .mode insert | SQL INSERT format | Generate inserts | .mode insert |
| .separator | Set CSV separator | Custom delimiter | .separator '|' |
| .nullvalue | Set NULL display | Control NULL output | .nullvalue 'NULL' |

### 16. Performance and Optimization (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| EXPLAIN QUERY PLAN | Show query plan | Query optimization | EXPLAIN QUERY PLAN SELECT * FROM users WHERE name = 'John'; |
| ANALYZE | Update statistics | Optimize query planner | ANALYZE; |
| PRAGMA cache_size | Set cache size | Memory tuning | PRAGMA cache_size = 10000; |
| PRAGMA page_size | Set page size | Storage optimization | PRAGMA page_size = 4096; |
| PRAGMA temp_store | Set temp storage | Performance tuning | PRAGMA temp_store = MEMORY; |
| PRAGMA synchronous | Set sync mode | Durability vs speed | PRAGMA synchronous = NORMAL; |
| PRAGMA journal_mode | Set journal mode | Transaction performance | PRAGMA journal_mode = WAL; |
| PRAGMA locking_mode | Set locking mode | Concurrency control | PRAGMA locking_mode = EXCLUSIVE; |
| PRAGMA optimize | Optimize database | Maintenance | PRAGMA optimize; |
| CREATE INDEX for optimization | Speed up queries | Query performance | CREATE INDEX idx_email ON users(email); |
| VACUUM | Reclaim space | Storage optimization | VACUUM; |
| PRAGMA integrity_check | Check database integrity | Verification | PRAGMA integrity_check; |

### 17. SQLite Configuration (10)

| Pragma | Description | Common Usage | Examples |
|--------|-------------|--------------|----------|
| PRAGMA foreign_keys | Enable foreign keys | Referential integrity | PRAGMA foreign_keys = ON; |
| PRAGMA auto_vacuum | Set auto-vacuum mode | Automatic space reclaim | PRAGMA auto_vacuum = FULL; |
| PRAGMA encoding | Set text encoding | Character set control | PRAGMA encoding = 'UTF-8'; |
| PRAGMA user_version | User version number | Schema versioning | PRAGMA user_version = 1; |
| PRAGMA application_id | Application identifier | Database identification | PRAGMA application_id = 12345; |
| PRAGMA busy_timeout | Set lock timeout | Concurrency handling | PRAGMA busy_timeout = 5000; |
| PRAGMA case_sensitive_like | LIKE case sensitivity | Pattern matching control | PRAGMA case_sensitive_like = ON; |
| PRAGMA read_uncommitted | Isolation level | Transaction control | PRAGMA read_uncommitted = ON; |
| PRAGMA secure_delete | Secure data deletion | Security | PRAGMA secure_delete = ON; |
| PRAGMA compile_options | Show compile options | Configuration review | PRAGMA compile_options; |

## Tips and Best Practices

* Use WAL mode for better concurrency in multi-threaded applications
* Always use parameterized queries to prevent SQL injection
* Create indexes on frequently queried columns for better performance
* Use transactions for batch operations to improve write performance
* Keep database size under 140TB (theoretical limit) for optimal performance
* Use PRAGMA statements to tune performance based on use case
* Enable foreign keys explicitly as they are disabled by default
* Use ANALYZE periodically to update query planner statistics
* Implement proper error handling for SQLITE_BUSY errors
* Use VACUUM regularly to reclaim unused space after deletions
* Consider using in-memory databases for temporary data and testing
* Use PRAGMA integrity_check to verify database consistency
* Implement proper backup strategies using .backup or file copies
* Use appropriate journal modes based on reliability requirements
* Avoid large transactions that can cause memory issues

## Additional Resources

* [SQLite Official Documentation](https://www.sqlite.org/docs.html)
* [SQLite Tutorial](https://www.sqlitetutorial.net/)
* [SQLite Command Line Shell](https://www.sqlite.org/cli.html)
* [SQLite Performance Tuning](https://www.sqlite.org/queryplanner.html)
* [SQLite WAL Mode](https://www.sqlite.org/wal.html)
* [SQLite Pragma Statements](https://www.sqlite.org/pragma.html)
* [SQLite Foreign Keys](https://www.sqlite.org/foreignkeys.html)
* [SQLite Best Practices](https://www.sqlite.org/bestpractice.html)

## Mini-Glossary

This glossary covers essential SQLite terminology, concepts, and patterns to help you understand and work effectively with SQLite.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| Embedded database | Database engine integrated into application |
| Serverless | No separate server process required |
| Zero-configuration | No setup or administration needed |
| Self-contained | Single library file, no dependencies |
| ACID compliant | Atomic, Consistent, Isolated, Durable transactions |
| Cross-platform | Works on all major operating systems |
| Public domain | Free for any use without restrictions |
| Single-file database | Entire database in one disk file |
| Type affinity | Flexible typing system |
| Virtual table | Extension mechanism for custom data sources |

### Database Files

| File Type | Description |
|-----------|-------------|
| .db file | Main database file |
| .db-wal | Write-Ahead Log file |
| .db-shm | Shared memory file |
| .db-journal | Rollback journal file |
| :memory: | In-memory database |
| Temporary database | Session-only database |

### Transaction Modes

| Mode | Description |
|------|-------------|
| DEFERRED | Start transaction without locks |
| IMMEDIATE | Acquire write lock immediately |
| EXCLUSIVE | Acquire exclusive lock |
| Autocommit | Automatic transaction per statement |

### Journal Modes

| Mode | Description |
|------|-------------|
| DELETE | Traditional rollback journal |
| TRUNCATE | Faster than DELETE |
| PERSIST | Keep journal file |
| MEMORY | In-memory journal |
| WAL | Write-Ahead Logging |
| OFF | No journal (dangerous) |

### Locking States

| State | Description |
|-------|-------------|
| UNLOCKED | No locks held |
| SHARED | Read access |
| RESERVED | Planning to write |
| PENDING | Waiting for readers to finish |
| EXCLUSIVE | Writing to database |

### Data Types

| Type | Description |
|------|-------------|
| NULL | Null value |
| INTEGER | Signed integer |
| REAL | Floating point number |
| TEXT | Text string |
| BLOB | Binary data |
| Type affinity | Recommended type for column |

### Storage Classes

| Class | Description |
|-------|-------------|
| NULL | NULL value stored |
| INTEGER | Integer value stored |
| REAL | Float value stored |
| TEXT | Text value stored |
| BLOB | Binary value stored |

### Index Types

| Type | Description |
|------|-------------|
| B-tree index | Standard index type |
| Unique index | Enforces uniqueness |
| Partial index | Index with WHERE clause |
| Expression index | Index on expression |
| Covering index | Index contains all needed columns |

### Constraint Types

| Constraint | Description |
|------------|-------------|
| PRIMARY KEY | Unique identifier |
| UNIQUE | Unique values |
| NOT NULL | Required value |
| CHECK | Value validation |
| DEFAULT | Default value |
| FOREIGN KEY | Referential integrity |
| AUTOINCREMENT | Auto-incrementing integer |

### Special Features

| Feature | Description |
|---------|-------------|
| FTS5 | Full-text search extension |
| R-Tree | Spatial indexing |
| JSON1 | JSON functions |
| Geopoly | Geographic indexing |
| Virtual tables | Custom table implementations |
| Common Table Expressions | WITH clause support |
| Window functions | Analytics functions |
| Generated columns | Computed column values |

### Performance Concepts

| Concept | Description |
|---------|-------------|
| Page cache | Memory cache for database pages |
| Query planner | Determines optimal query execution |
| EXPLAIN | Show query execution plan |
| ANALYZE | Update query planner statistics |
| VACUUM | Rebuild database file |
| Covering index | Index satisfies query without table access |
| Index merge | Combine multiple indexes |
