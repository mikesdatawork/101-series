# 101 DuckDB Commands

## Overview

DuckDB is an embedded analytical database designed for fast analytical queries and data science workflows. This cheat sheet covers essential DuckDB commands, SQL operations, data import/export, performance optimization, analytical functions, and integration with data science tools. Master these commands to analyze large datasets efficiently, prototype data pipelines, and perform high-performance analytics.

## Target Audience

- Data scientists analyzing large datasets
- Data engineers building analytical pipelines
- Business analysts performing ad-hoc queries
- Researchers working with structured data
- Anyone needing fast analytical database operations

## Command Categories

### 1. Database Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| duckdb mydb.duckdb | Open or create database | Database access | duckdb analytics.duckdb |
| .open | Open database file | Switch database | .open mydata.duckdb |
| ATTACH | Attach external database | Multi-database operations | ATTACH 'other.duckdb' AS other; |
| DETACH | Detach database | Remove attached database | DETACH other; |
| .databases | List attached databases | Database inspection | .databases |
| USE | Switch to database | Set active database | USE other; |
| CREATE DATABASE | Create new database | Database initialization | Not needed, auto-created on file open |
| .quit | Exit DuckDB | Close session | .quit |
| .exit | Exit DuckDB (alternative) | Close session | .exit |
| PRAGMA database_list | List databases programmatically | Database discovery | PRAGMA database_list; |

### 2. Table Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE TABLE | Create new table | Table definition | CREATE TABLE users (id INTEGER, name VARCHAR); |
| CREATE TABLE AS | Create from query | Generate table from results | CREATE TABLE summary AS SELECT * FROM data; |
| DROP TABLE | Delete table | Table removal | DROP TABLE users; |
| SHOW TABLES | List all tables | Table discovery | SHOW TABLES; |
| DESCRIBE | Show table structure | Schema inspection | DESCRIBE users; |
| ALTER TABLE ADD COLUMN | Add column | Schema modification | ALTER TABLE users ADD COLUMN email VARCHAR; |
| ALTER TABLE DROP COLUMN | Remove column | Schema cleanup | ALTER TABLE users DROP COLUMN temp_col; |
| ALTER TABLE RENAME TO | Rename table | Table reorganization | ALTER TABLE old_name RENAME TO new_name; |
| CREATE TEMPORARY TABLE | Create temp table | Session-only table | CREATE TEMPORARY TABLE temp_data AS SELECT * FROM source; |
| DROP TABLE IF EXISTS | Conditional table drop | Safe deletion | DROP TABLE IF EXISTS users; |
| SUMMARIZE | Show table statistics | Quick data overview | SUMMARIZE users; |
| SHOW | Show table contents | Quick data preview | SHOW users; |

### 3. Data Import and Export (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| SELECT FROM CSV | Read CSV file | Direct CSV query | SELECT * FROM 'data.csv'; |
| SELECT FROM Parquet | Read Parquet file | Direct Parquet query | SELECT * FROM 'data.parquet'; |
| SELECT FROM JSON | Read JSON file | Direct JSON query | SELECT * FROM 'data.json'; |
| COPY TO CSV | Export to CSV | Data export | COPY users TO 'output.csv' (HEADER); |
| COPY TO Parquet | Export to Parquet | Compressed export | COPY users TO 'output.parquet'; |
| COPY FROM CSV | Import from CSV | Bulk import | COPY users FROM 'data.csv'; |
| read_csv function | Read CSV with options | Custom CSV reading | SELECT * FROM read_csv('data.csv', delim='|'); |
| read_parquet function | Read Parquet with options | Custom Parquet reading | SELECT * FROM read_parquet('data.parquet'); |
| read_json function | Read JSON with options | Custom JSON reading | SELECT * FROM read_json('data.json'); |
| SELECT FROM glob | Read multiple files | Pattern-based reading | SELECT * FROM 'data/*.parquet'; |
| EXPORT DATABASE | Export entire database | Full backup | EXPORT DATABASE 'backup_dir'; |
| IMPORT DATABASE | Import entire database | Full restore | IMPORT DATABASE 'backup_dir'; |

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
| SELECT with CTEs | Common table expressions | Complex queries | WITH cte AS (SELECT * FROM users) SELECT * FROM cte; |
| SELECT UNION | Combine result sets | Merge queries | SELECT name FROM users UNION SELECT name FROM customers; |
| SELECT INTERSECT | Find common rows | Set intersection | SELECT id FROM users INTERSECT SELECT id FROM active; |

### 5. Analytical Functions (12)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| ROW_NUMBER | Assign row numbers | Ranking, deduplication | SELECT ROW_NUMBER() OVER (ORDER BY name) FROM users; |
| RANK | Rank with gaps | Ranking with ties | SELECT RANK() OVER (ORDER BY score DESC) FROM scores; |
| DENSE_RANK | Rank without gaps | Continuous ranking | SELECT DENSE_RANK() OVER (ORDER BY score DESC) FROM scores; |
| LAG | Access previous row | Time series analysis | SELECT name, LAG(value) OVER (ORDER BY date) FROM metrics; |
| LEAD | Access next row | Forward looking | SELECT name, LEAD(value) OVER (ORDER BY date) FROM metrics; |
| FIRST_VALUE | Get first value in window | Window analysis | SELECT FIRST_VALUE(price) OVER (PARTITION BY product) FROM sales; |
| LAST_VALUE | Get last value in window | Window analysis | SELECT LAST_VALUE(price) OVER (PARTITION BY product) FROM sales; |
| NTILE | Divide into buckets | Quartiles, percentiles | SELECT NTILE(4) OVER (ORDER BY income) FROM customers; |
| PERCENT_RANK | Relative rank | Distribution analysis | SELECT PERCENT_RANK() OVER (ORDER BY score) FROM tests; |
| CUME_DIST | Cumulative distribution | Distribution analysis | SELECT CUME_DIST() OVER (ORDER BY value) FROM data; |
| WINDOW clause | Named window | Reusable window definitions | SELECT SUM(amount) OVER w FROM sales WINDOW w AS (PARTITION BY product); |
| PARTITION BY | Partition window | Group window operations | SELECT AVG(salary) OVER (PARTITION BY department) FROM employees; |

### 6. Aggregate Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| COUNT | Count rows | Row counting | SELECT COUNT(*) FROM users; |
| SUM | Sum values | Total calculation | SELECT SUM(price) FROM orders; |
| AVG | Average value | Mean calculation | SELECT AVG(age) FROM users; |
| MIN | Minimum value | Lowest value | SELECT MIN(price) FROM products; |
| MAX | Maximum value | Highest value | SELECT MAX(salary) FROM employees; |
| MEDIAN | Median value | Middle value | SELECT MEDIAN(income) FROM households; |
| MODE | Most common value | Frequency analysis | SELECT MODE(status) FROM orders; |
| STDDEV | Standard deviation | Variability measure | SELECT STDDEV(score) FROM tests; |
| APPROX_QUANTILE | Approximate quantile | Percentile calculation | SELECT APPROX_QUANTILE(value, 0.95) FROM data; |
| LIST | Aggregate to list | Array aggregation | SELECT LIST(product_name) FROM orders GROUP BY user_id; |

### 7. String Functions (12)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| CONCAT | Concatenate strings | String joining | SELECT CONCAT(first_name, ' ', last_name) FROM users; |
| || operator | String concatenation | Alternative syntax | SELECT first_name || ' ' || last_name FROM users; |
| SUBSTRING | Extract substring | String extraction | SELECT SUBSTRING(name, 1, 10) FROM users; |
| LENGTH | String length | Size calculation | SELECT LENGTH(name) FROM users; |
| UPPER | Convert to uppercase | Case conversion | SELECT UPPER(name) FROM users; |
| LOWER | Convert to lowercase | Case conversion | SELECT LOWER(email) FROM users; |
| TRIM | Remove whitespace | String cleaning | SELECT TRIM(name) FROM users; |
| REPLACE | Replace substring | String substitution | SELECT REPLACE(text, 'old', 'new') FROM articles; |
| SPLIT | Split string to array | String parsing | SELECT SPLIT(tags, ',') FROM posts; |
| REGEXP_MATCHES | Regex matching | Pattern matching | SELECT REGEXP_MATCHES(email, '.*@gmail\.com') FROM users; |
| STRING_AGG | Aggregate strings | String concatenation | SELECT STRING_AGG(name, ', ') FROM users GROUP BY department; |
| LIKE | Pattern matching | String filtering | SELECT * FROM users WHERE name LIKE 'J%'; |

### 8. Date and Time Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| CURRENT_DATE | Get current date | Date retrieval | SELECT CURRENT_DATE; |
| CURRENT_TIME | Get current time | Time retrieval | SELECT CURRENT_TIME; |
| CURRENT_TIMESTAMP | Get current timestamp | Timestamp retrieval | SELECT CURRENT_TIMESTAMP; |
| DATE_TRUNC | Truncate to time unit | Date grouping | SELECT DATE_TRUNC('month', created_at) FROM orders; |
| DATE_PART | Extract date component | Component extraction | SELECT DATE_PART('year', created_at) FROM events; |
| DATE_DIFF | Calculate date difference | Duration calculation | SELECT DATE_DIFF('day', start_date, end_date) FROM projects; |
| DATE_ADD | Add time interval | Date calculation | SELECT DATE_ADD(created_at, INTERVAL 7 DAY) FROM users; |
| DATE_SUB | Subtract time interval | Date calculation | SELECT DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH); |
| STRFTIME | Format datetime | Date display | SELECT STRFTIME(created_at, '%Y-%m-%d') FROM logs; |
| EPOCH | Convert to Unix timestamp | Timestamp conversion | SELECT EPOCH(created_at) FROM events; |

### 9. Array and List Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| LIST_VALUE | Create list | Array creation | SELECT LIST_VALUE(1, 2, 3); |
| LIST_CONCAT | Concatenate lists | Array joining | SELECT LIST_CONCAT([1,2], [3,4]); |
| LIST_CONTAINS | Check element existence | Membership test | SELECT LIST_CONTAINS(tags, 'urgent') FROM tasks; |
| LIST_EXTRACT | Get element by index | Array access | SELECT LIST_EXTRACT(items, 1) FROM orders; |
| UNNEST | Expand list to rows | Array flattening | SELECT UNNEST(tags) FROM posts; |
| LIST_AGG | Aggregate to list | Array aggregation | SELECT LIST_AGG(product) FROM orders GROUP BY user_id; |
| ARRAY_LENGTH | Get array length | Size calculation | SELECT ARRAY_LENGTH(items) FROM orders; |
| LIST_FILTER | Filter list elements | Conditional filtering | SELECT LIST_FILTER(numbers, x -> x > 10) FROM data; |
| LIST_TRANSFORM | Transform list elements | Element mapping | SELECT LIST_TRANSFORM(prices, x -> x * 1.1) FROM products; |
| FLATTEN | Flatten nested lists | List flattening | SELECT FLATTEN([[1,2],[3,4]]); |

### 10. Struct and Map Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| STRUCT_PACK | Create struct | Struct creation | SELECT STRUCT_PACK(name := 'John', age := 30); |
| STRUCT_EXTRACT | Extract struct field | Field access | SELECT STRUCT_EXTRACT(user, 'name') FROM data; |
| ROW | Create struct (alternative) | Struct creation | SELECT ROW(name, age) FROM users; |
| MAP | Create map | Key-value pairs | SELECT MAP(['key1', 'key2'], ['val1', 'val2']); |
| ELEMENT_AT | Access map element | Map lookup | SELECT ELEMENT_AT(settings, 'theme') FROM users; |
| CARDINALITY | Get map/list size | Size calculation | SELECT CARDINALITY(tags) FROM posts; |
| MAP_KEYS | Get map keys | Key extraction | SELECT MAP_KEYS(metadata) FROM files; |
| MAP_VALUES | Get map values | Value extraction | SELECT MAP_VALUES(metadata) FROM files; |
| MAP_ENTRIES | Get map as array | Map conversion | SELECT MAP_ENTRIES(settings) FROM config; |
| Nested field access | Access nested fields | Deep extraction | SELECT user.address.city FROM data; |

### 11. Join Operations (10)

| Join Type | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| INNER JOIN | Match rows from both tables | Related data retrieval | SELECT * FROM users INNER JOIN orders ON users.id = orders.user_id; |
| LEFT JOIN | All rows from left table | Include unmatched left rows | SELECT * FROM users LEFT JOIN orders ON users.id = orders.user_id; |
| RIGHT JOIN | All rows from right table | Include unmatched right rows | SELECT * FROM users RIGHT JOIN orders ON users.id = orders.user_id; |
| FULL OUTER JOIN | All rows from both tables | Complete join | SELECT * FROM users FULL OUTER JOIN orders ON users.id = orders.user_id; |
| CROSS JOIN | Cartesian product | All combinations | SELECT * FROM colors CROSS JOIN sizes; |
| SEMI JOIN | Rows with matches | Existence check | SELECT * FROM users WHERE EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id); |
| ANTI JOIN | Rows without matches | Non-existence check | SELECT * FROM users WHERE NOT EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id); |
| ASOF JOIN | Time-based join | Time series matching | SELECT * FROM trades ASOF JOIN quotes ON trades.symbol = quotes.symbol AND trades.time >= quotes.time; |
| POSITIONAL JOIN | Join by position | Combine by row number | SELECT * FROM t1 POSITIONAL JOIN t2; |
| LATERAL JOIN | Correlated subquery join | Complex correlations | SELECT * FROM users, LATERAL (SELECT * FROM orders WHERE orders.user_id = users.id) AS user_orders; |

### 12. Performance and Optimization (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| EXPLAIN | Show query plan | Query optimization | EXPLAIN SELECT * FROM users WHERE name = 'John'; |
| EXPLAIN ANALYZE | Execute and analyze | Performance measurement | EXPLAIN ANALYZE SELECT * FROM large_table; |
| CREATE INDEX | Create index | Query optimization | CREATE INDEX idx_name ON users(name); |
| DROP INDEX | Remove index | Index cleanup | DROP INDEX idx_name; |
| PRAGMA threads | Set thread count | Parallel processing | PRAGMA threads=4; |
| PRAGMA memory_limit | Set memory limit | Resource control | PRAGMA memory_limit='4GB'; |
| PRAGMA enable_profiling | Enable profiling | Performance tracking | PRAGMA enable_profiling; |
| PRAGMA profiling_output | Set profiling output | Profile configuration | PRAGMA profiling_output='profile.json'; |
| CHECKPOINT | Force checkpoint | Flush to disk | CHECKPOINT; |
| VACUUM | Reclaim space | Storage optimization | VACUUM; |
| ANALYZE | Update statistics | Query planner optimization | ANALYZE users; |
| SET preserve_insertion_order | Control row order | Preserve input order | SET preserve_insertion_order=false; |

### 13. Data Types and Casting (10)

| Type/Function | Description | Common Usage | Examples |
|---------------|-------------|--------------|----------|
| INTEGER | Integer type | Whole numbers | id INTEGER |
| BIGINT | Large integer | Large numbers | user_count BIGINT |
| DOUBLE | Floating point | Decimal numbers | price DOUBLE |
| VARCHAR | Variable string | Text storage | name VARCHAR |
| DATE | Date type | Date storage | birth_date DATE |
| TIMESTAMP | Timestamp type | Datetime storage | created_at TIMESTAMP |
| BOOLEAN | Boolean type | True/false | active BOOLEAN |
| DECIMAL | Fixed precision | Precise decimals | amount DECIMAL(10,2) |
| CAST | Type conversion | Convert types | SELECT CAST(price AS INTEGER) FROM products; |
| TRY_CAST | Safe casting | Convert with null on error | SELECT TRY_CAST(value AS INTEGER) FROM data; |

### 14. Transaction Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| BEGIN TRANSACTION | Start transaction | Transaction initiation | BEGIN TRANSACTION; |
| COMMIT | Commit transaction | Save changes | COMMIT; |
| ROLLBACK | Rollback transaction | Undo changes | ROLLBACK; |
| SAVEPOINT | Create savepoint | Partial rollback point | SAVEPOINT sp1; |
| ROLLBACK TO | Rollback to savepoint | Partial undo | ROLLBACK TO sp1; |
| RELEASE SAVEPOINT | Release savepoint | Remove savepoint | RELEASE sp1; |
| SET autocommit | Control autocommit | Transaction mode | SET autocommit=false; |
| CHECKPOINT | Persist changes | Force write to disk | CHECKPOINT; |

### 15. Configuration and Settings (12)

| Pragma/Setting | Description | Common Usage | Examples |
|----------------|-------------|--------------|----------|
| PRAGMA threads | Set parallel threads | Performance tuning | PRAGMA threads=8; |
| PRAGMA memory_limit | Set memory limit | Resource control | PRAGMA memory_limit='8GB'; |
| PRAGMA temp_directory | Set temp directory | Storage configuration | PRAGMA temp_directory='/tmp'; |
| SET default_null_order | NULL sort order | Query behavior | SET default_null_order='NULLS LAST'; |
| SET enable_progress_bar | Toggle progress bar | UI control | SET enable_progress_bar=true; |
| SET max_memory | Maximum memory usage | Resource limit | SET max_memory='16GB'; |
| SET threads | Thread count | Parallel processing | SET threads TO 4; |
| SET preserve_insertion_order | Row order preservation | Order control | SET preserve_insertion_order=true; |
| PRAGMA version | Show DuckDB version | Version check | PRAGMA version; |
| PRAGMA database_size | Show database size | Storage monitoring | PRAGMA database_size; |
| PRAGMA extensions | List loaded extensions | Extension management | PRAGMA extensions; |
| SET search_path | Set schema search path | Schema management | SET search_path='myschema,public'; |

### 16. Extension Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| INSTALL extension | Install extension | Add functionality | INSTALL httpfs; |
| LOAD extension | Load extension | Activate extension | LOAD httpfs; |
| httpfs extension | HTTP/S3 file access | Read remote files | INSTALL httpfs; LOAD httpfs; SELECT * FROM 's3://bucket/file.parquet'; |
| json extension | JSON functionality | JSON operations | LOAD json; |
| parquet extension | Parquet support | Parquet files | LOAD parquet; |
| postgres_scanner | Query PostgreSQL | External data access | INSTALL postgres_scanner; |
| sqlite_scanner | Query SQLite | External data access | INSTALL sqlite_scanner; |
| spatial extension | Geospatial operations | GIS functionality | INSTALL spatial; LOAD spatial; |
| fts extension | Full-text search | Text search | INSTALL fts; LOAD fts; |
| FORCE INSTALL | Force reinstall extension | Update extension | FORCE INSTALL httpfs; |

### 17. Advanced SQL Features (10)

| Feature | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| WITH RECURSIVE | Recursive CTE | Hierarchical queries | WITH RECURSIVE cte AS (SELECT 1 AS n UNION ALL SELECT n+1 FROM cte WHERE n < 10) SELECT * FROM cte; |
| PIVOT | Pivot table | Data transformation | PIVOT data ON column USING sum(value); |
| UNPIVOT | Unpivot table | Normalize data | UNPIVOT data ON (col1, col2) INTO NAME column VALUE value; |
| QUALIFY | Filter window results | Window function filtering | SELECT * FROM sales QUALIFY ROW_NUMBER() OVER (PARTITION BY product ORDER BY date DESC) = 1; |
| SAMPLE | Sample data | Random sampling | SELECT * FROM large_table USING SAMPLE 10%; |
| TABLESAMPLE | Table sampling | Reproducible sampling | SELECT * FROM data TABLESAMPLE 1000 ROWS; |
| MACRO | Create SQL macro | Reusable queries | CREATE MACRO my_macro(x) AS x * 2; |
| CREATE TYPE | Create custom type | Type definitions | CREATE TYPE mood AS ENUM ('happy', 'sad'); |
| COPY FROM QUERY | Export query results | Query-based export | COPY (SELECT * FROM users WHERE active=true) TO 'active_users.parquet'; |
| SET VARIABLE | Set query variable | Parameterization | SET VARIABLE user_id = 123; SELECT * FROM orders WHERE user_id = getvariable('user_id'); |

## Tips and Best Practices

* Use Parquet format for storage to get automatic compression and columnar benefits
* Leverage parallel processing by setting appropriate thread count with PRAGMA threads
* Use read_csv and read_parquet for direct file querying without importing
* Take advantage of automatic type inference for CSV and JSON files
* Use window functions instead of self-joins for analytical queries
* Utilize glob patterns to query multiple files at once
* Set memory_limit appropriately based on available system memory
* Use SUMMARIZE to quickly understand data distributions
* Leverage DuckDB's ability to query remote files via httpfs extension
* Use CTEs (WITH clauses) to make complex queries more readable
* Take advantage of DuckDB's integration with pandas DataFrames
* Use EXPLAIN ANALYZE to identify query bottlenecks
* Leverage columnar storage for analytical workloads
* Use appropriate data types to minimize memory usage
* Consider using views for frequently accessed query patterns

## Additional Resources

* [DuckDB Official Documentation](https://duckdb.org/docs/)
* [DuckDB SQL Introduction](https://duckdb.org/docs/sql/introduction)
* [DuckDB Data Import Guide](https://duckdb.org/docs/data/overview)
* [DuckDB Python API](https://duckdb.org/docs/api/python/overview)
* [DuckDB Extensions](https://duckdb.org/docs/extensions/overview)
* [DuckDB Performance Guide](https://duckdb.org/docs/guides/performance/overview)
* [DuckDB Blog](https://duckdb.org/news/)
* [DuckDB GitHub Repository](https://github.com/duckdb/duckdb)

## Mini-Glossary

This glossary covers essential DuckDB terminology, concepts, and patterns to help you understand and work effectively with DuckDB.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| Embedded database | Database engine integrated into application |
| Analytical database | Optimized for analytical queries |
| Columnar storage | Data stored by column for analytics |
| Zero-copy | Direct file reading without copying |
| OLAP | Online Analytical Processing |
| In-process | Runs in same process as application |
| Vectorized execution | Process data in batches for performance |
| Push-based execution | Query execution model |
| Morsel-driven parallelism | Parallel processing approach |
| File format agnostic | Reads many formats natively |

### File Formats

| Format | Description |
|--------|-------------|
| Parquet | Columnar format, best for analytics |
| CSV | Text format, widely compatible |
| JSON | Structured text format |
| Arrow | In-memory columnar format |
| Iceberg | Table format for data lakes |
| Delta | Transactional table format |

### Data Types

| Type | Description |
|------|-------------|
| INTEGER | 32-bit integer |
| BIGINT | 64-bit integer |
| DOUBLE | 64-bit floating point |
| VARCHAR | Variable length string |
| DATE | Calendar date |
| TIMESTAMP | Date and time |
| INTERVAL | Time duration |
| LIST | Array of values |
| STRUCT | Named fields |
| MAP | Key-value pairs |
| UNION | Tagged union type |

### Window Functions

| Function | Description |
|----------|-------------|
| ROW_NUMBER | Sequential numbering |
| RANK | Ranking with gaps |
| DENSE_RANK | Ranking without gaps |
| LAG | Previous row value |
| LEAD | Next row value |
| FIRST_VALUE | First value in window |
| LAST_VALUE | Last value in window |
| NTILE | Divide into buckets |

### Join Types

| Type | Description |
|------|-------------|
| INNER JOIN | Matching rows only |
| LEFT JOIN | All left rows |
| RIGHT JOIN | All right rows |
| FULL OUTER JOIN | All rows from both |
| CROSS JOIN | Cartesian product |
| ASOF JOIN | Time-based join |
| SEMI JOIN | Existence check |
| ANTI JOIN | Non-existence check |

### Extensions

| Extension | Description |
|-----------|-------------|
| httpfs | HTTP and S3 file access |
| parquet | Parquet file support |
| json | JSON functionality |
| postgres_scanner | Query PostgreSQL |
| sqlite_scanner | Query SQLite |
| spatial | Geospatial operations |
| fts | Full-text search |
| icu | International text support |

### Performance Features

| Feature | Description |
|---------|-------------|
| Parallel execution | Multi-threaded query processing |
| Vectorized operations | Batch processing |
| Columnar storage | Column-oriented data |
| Predicate pushdown | Filter early in query |
| Projection pushdown | Select only needed columns |
| Adaptive filtering | Dynamic optimization |
| Statistics | Query planner metadata |
| Cost-based optimization | Smart query planning |

### Advanced Features

| Feature | Description |
|---------|-------------|
| Common Table Expressions | WITH clauses |
| Window functions | Analytical operations |
| Recursive CTEs | Hierarchical queries |
| PIVOT/UNPIVOT | Data transformation |
| QUALIFY | Window function filtering |
| SAMPLE | Data sampling |
| Macros | SQL functions |
| Variables | Query parameters |

### Integration Points

| Integration | Description |
|-------------|-------------|
| Python | Native Python API |
| R | Native R package |
| pandas | DataFrame integration |
| Arrow | Zero-copy data sharing |
| Polars | DataFrame library |
| Jupyter | Notebook support |
| CLI | Command line interface |
