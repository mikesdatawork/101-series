# 101 Neo4j Commands

## Overview

Neo4j is a graph database management system designed to store and query highly connected data using nodes, relationships, and properties. This cheat sheet covers essential Cypher query language commands, graph modeling patterns, relationship traversals, indexing strategies, import/export operations, and performance optimization techniques. Master these commands to build knowledge graphs, recommendation engines, and network analysis applications.

## Target Audience

- Data scientists building knowledge graphs
- Backend developers creating recommendation systems
- Network analysts exploring connected data
- Machine learning engineers working with graph neural networks
- Anyone working with highly connected datasets

## Command Categories

### 1. Database and Connection Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| :help | Show help information | Command reference | :help MATCH |
| :server status | Check server status | Health monitoring | :server status |
| :use | Switch database | Multi-database operations | :use mydb |
| :dbs | List all databases | Database discovery | :dbs |
| CREATE DATABASE | Create new database | Database initialization | CREATE DATABASE mydb |
| DROP DATABASE | Delete database | Database removal | DROP DATABASE mydb |
| START DATABASE | Start database | Database activation | START DATABASE mydb |
| STOP DATABASE | Stop database | Database deactivation | STOP DATABASE mydb |
| SHOW DATABASES | Show all databases | Database listing | SHOW DATABASES |
| :connect | Connect to database | Establish connection | :connect neo4j://localhost:7687 |

### 2. Node Creation and Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE node | Create single node | Node creation | CREATE (n:Person {name: 'John'}) |
| CREATE multiple nodes | Create multiple nodes | Batch creation | CREATE (a:Person), (b:Person) |
| MERGE | Create or match node | Upsert operation | MERGE (n:Person {name: 'John'}) |
| MATCH | Find nodes | Node retrieval | MATCH (n:Person) RETURN n |
| MATCH WHERE | Filter nodes | Conditional retrieval | MATCH (n:Person) WHERE n.age > 18 RETURN n |
| DELETE | Delete nodes | Node removal | MATCH (n:Person {name: 'John'}) DELETE n |
| DETACH DELETE | Delete node with relationships | Cascade deletion | MATCH (n:Person) DETACH DELETE n |
| SET | Set node properties | Property updates | MATCH (n:Person {name: 'John'}) SET n.age = 30 |
| REMOVE | Remove node properties | Property deletion | MATCH (n:Person) REMOVE n.temp |
| SET labels | Add labels to node | Label management | MATCH (n:Person) SET n:Employee |
| REMOVE labels | Remove labels from node | Label cleanup | MATCH (n:Person) REMOVE n:Temp |
| CREATE node with multiple labels | Multi-label creation | Complex typing | CREATE (n:Person:Employee {name: 'John'}) |

### 3. Relationship Creation and Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE relationship | Create relationship | Connect nodes | MATCH (a:Person), (b:Person) CREATE (a)-[:KNOWS]->(b) |
| MERGE relationship | Create or match relationship | Relationship upsert | MATCH (a:Person), (b:Person) MERGE (a)-[:KNOWS]->(b) |
| CREATE with properties | Relationship with properties | Weighted edges | CREATE (a)-[:KNOWS {since: 2020}]->(b) |
| MATCH relationship | Find relationships | Relationship retrieval | MATCH (a)-[r:KNOWS]->(b) RETURN r |
| DELETE relationship | Delete relationships | Relationship removal | MATCH (a)-[r:KNOWS]->(b) DELETE r |
| SET relationship properties | Update relationship | Property modification | MATCH (a)-[r:KNOWS]->(b) SET r.weight = 5 |
| REMOVE relationship properties | Remove properties | Property cleanup | MATCH (a)-[r:KNOWS]->(b) REMOVE r.temp |
| Bidirectional relationship | Two-way connection | Mutual relationships | CREATE (a)-[:KNOWS]->(b), (b)-[:KNOWS]->(a) |
| Variable length patterns | Multi-hop relationships | Path finding | MATCH (a)-[:KNOWS*1..3]->(b) RETURN a, b |
| Multiple relationship types | Different edge types | Complex queries | MATCH (a)-[:KNOWS|WORKS_WITH]->(b) RETURN a, b |
| Optional relationships | Nullable relationships | Optional connections | MATCH (a:Person) OPTIONAL MATCH (a)-[r:KNOWS]->(b) RETURN a, b |
| Relationship direction | Directional patterns | Directed graphs | MATCH (a)-[:FOLLOWS]->(b) RETURN a, b |

### 4. Pattern Matching (12)

| Pattern | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| Simple pattern | Basic node-relationship | Direct connections | MATCH (a)-[:KNOWS]->(b) |
| Multi-hop pattern | Multiple relationships | Path traversal | MATCH (a)-[:KNOWS]->()-[:KNOWS]->(b) |
| Variable length | Flexible path length | Shortest paths | MATCH (a)-[:KNOWS*1..5]->(b) |
| Optional MATCH | Nullable patterns | Conditional matching | OPTIONAL MATCH (a)-[:KNOWS]->(b) |
| Named path | Store path as variable | Path operations | MATCH p = (a)-[:KNOWS*]->(b) |
| WHERE clause | Filter patterns | Conditional matching | MATCH (a)-[:KNOWS]->(b) WHERE b.age > 30 |
| Multiple patterns | Combined patterns | Complex queries | MATCH (a)-[:KNOWS]->(b), (b)-[:WORKS_AT]->(c) |
| Pattern comprehension | List patterns | Collect relationships | [(a)-[:KNOWS]->(b) WHERE b.age > 25 | b.name] |
| Shortest path | Find shortest path | Path optimization | MATCH p = shortestPath((a)-[:KNOWS*]-(b)) |
| All shortest paths | Find all shortest paths | Multiple routes | MATCH p = allShortestPaths((a)-[:KNOWS*]-(b)) |
| Relationship type filter | Filter by type | Type-specific queries | MATCH (a)-[r:KNOWS|LIKES]->(b) |
| Node label filter | Filter by label | Label-specific queries | MATCH (a:Person)-[:KNOWS]->(b:Person) |

### 5. Aggregation and Functions (12)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| count | Count results | Result counting | MATCH (n:Person) RETURN count(n) |
| sum | Sum values | Total calculation | MATCH (n:Product) RETURN sum(n.price) |
| avg | Average value | Mean calculation | MATCH (n:Person) RETURN avg(n.age) |
| min | Minimum value | Lowest value | MATCH (n:Product) RETURN min(n.price) |
| max | Maximum value | Highest value | MATCH (n:Employee) RETURN max(n.salary) |
| collect | Aggregate to list | Array creation | MATCH (n:Person) RETURN collect(n.name) |
| percentileCont | Percentile calculation | Distribution analysis | MATCH (n:Person) RETURN percentileCont(n.age, 0.95) |
| stDev | Standard deviation | Variability measure | MATCH (n:Score) RETURN stDev(n.value) |
| count DISTINCT | Count unique values | Unique counting | MATCH (n:Person)-[:KNOWS]->(m) RETURN count(DISTINCT m) |
| size | Collection size | Array length | MATCH (n:Person) RETURN size((n)-[:KNOWS]->()) |
| head | First element | Array access | MATCH (n:Person) RETURN head(collect(n.name)) |
| last | Last element | Array access | MATCH (n:Person) RETURN last(collect(n.name)) |

### 6. String Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| toLower | Convert to lowercase | Case normalization | MATCH (n:Person) RETURN toLower(n.name) |
| toUpper | Convert to uppercase | Case conversion | MATCH (n:Person) RETURN toUpper(n.name) |
| trim | Remove whitespace | String cleaning | MATCH (n:Person) RETURN trim(n.name) |
| replace | Replace substring | String substitution | MATCH (n) RETURN replace(n.email, '@old.com', '@new.com') |
| substring | Extract substring | String extraction | MATCH (n:Person) RETURN substring(n.name, 0, 5) |
| split | Split string to list | String parsing | MATCH (n:Person) RETURN split(n.fullname, ' ') |
| size string | String length | Length calculation | MATCH (n:Person) WHERE size(n.name) > 10 RETURN n |
| left | Leftmost characters | Prefix extraction | MATCH (n:Person) RETURN left(n.name, 3) |
| right | Rightmost characters | Suffix extraction | MATCH (n:Person) RETURN right(n.phone, 4) |
| reverse | Reverse string | String reversal | MATCH (n:Person) RETURN reverse(n.name) |

### 7. List Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| range | Generate number range | Create sequences | UNWIND range(1, 10) AS num RETURN num |
| head | First element | Array access | RETURN head([1, 2, 3]) |
| last | Last element | Array access | RETURN last([1, 2, 3]) |
| tail | All but first | Array slicing | RETURN tail([1, 2, 3]) |
| size | List length | Size calculation | RETURN size([1, 2, 3]) |
| reverse | Reverse list | List reversal | RETURN reverse([1, 2, 3]) |
| reduce | Aggregate list values | List reduction | RETURN reduce(sum = 0, x IN [1,2,3] | sum + x) |
| extract | Transform list elements | List mapping | RETURN [x IN [1,2,3] | x * 2] |
| filter | Filter list elements | List filtering | RETURN [x IN [1,2,3,4,5] WHERE x > 2] |
| any | Check if any match | Existence check | RETURN any(x IN [1,2,3] WHERE x > 2) |

### 8. Mathematical Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| abs | Absolute value | Value normalization | RETURN abs(-5) |
| ceil | Round up | Rounding | RETURN ceil(4.3) |
| floor | Round down | Rounding | RETURN floor(4.7) |
| round | Round to nearest | Rounding | RETURN round(4.5) |
| sign | Sign of number | Direction detection | RETURN sign(-5) |
| sqrt | Square root | Mathematical operations | RETURN sqrt(16) |
| exp | Exponential | Exponential calculations | RETURN exp(2) |
| log | Natural logarithm | Logarithmic calculations | RETURN log(10) |
| log10 | Base-10 logarithm | Log calculations | RETURN log10(100) |
| rand | Random number | Random generation | RETURN rand() |

### 9. Date and Time Functions (10)

| Function | Description | Common Usage | Examples |
|----------|-------------|--------------|----------|
| date | Current date | Date retrieval | RETURN date() |
| datetime | Current datetime | Timestamp retrieval | RETURN datetime() |
| time | Current time | Time retrieval | RETURN time() |
| duration | Create duration | Time intervals | RETURN duration({days: 7}) |
| date from string | Parse date | Date parsing | RETURN date('2024-01-01') |
| datetime from string | Parse datetime | Datetime parsing | RETURN datetime('2024-01-01T12:00:00') |
| date arithmetic | Date calculations | Date math | RETURN date() + duration({days: 7}) |
| date.year | Extract year | Component extraction | MATCH (n) RETURN date(n.created).year |
| date.month | Extract month | Component extraction | MATCH (n) RETURN date(n.created).month |
| date.day | Extract day | Component extraction | MATCH (n) RETURN date(n.created).day |

### 10. Index and Constraint Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE INDEX | Create index | Query optimization | CREATE INDEX FOR (n:Person) ON (n.name) |
| CREATE CONSTRAINT UNIQUE | Unique constraint | Enforce uniqueness | CREATE CONSTRAINT FOR (n:Person) REQUIRE n.email IS UNIQUE |
| CREATE CONSTRAINT EXISTS | Existence constraint | Require property | CREATE CONSTRAINT FOR (n:Person) REQUIRE n.name IS NOT NULL |
| CREATE CONSTRAINT NODE KEY | Node key constraint | Composite uniqueness | CREATE CONSTRAINT FOR (n:Person) REQUIRE (n.firstname, n.lastname) IS NODE KEY |
| DROP INDEX | Remove index | Index cleanup | DROP INDEX index_name |
| DROP CONSTRAINT | Remove constraint | Constraint removal | DROP CONSTRAINT constraint_name |
| SHOW INDEXES | List all indexes | Index discovery | SHOW INDEXES |
| SHOW CONSTRAINTS | List all constraints | Constraint discovery | SHOW CONSTRAINTS |
| CREATE FULLTEXT INDEX | Full-text search index | Text search | CREATE FULLTEXT INDEX node_index FOR (n:Person) ON EACH [n.name, n.bio] |
| CALL db.indexes | Query index info | Index inspection | CALL db.indexes() |
| CREATE LOOKUP INDEX | Create lookup index | Label/type indexing | CREATE LOOKUP INDEX FOR (n) ON EACH labels(n) |
| CALL db.constraints | Query constraints | Constraint inspection | CALL db.constraints() |

### 11. Import and Export (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| LOAD CSV | Import CSV data | Bulk data import | LOAD CSV WITH HEADERS FROM 'file:///data.csv' AS row CREATE (n:Person {name: row.name}) |
| LOAD CSV FIELDTERMINATOR | Custom delimiter | Non-comma files | LOAD CSV FROM 'file:///data.txt' AS row FIELDTERMINATOR '\t' |
| CALL apoc.load.json | Load JSON data | JSON import | CALL apoc.load.json('file:///data.json') YIELD value CREATE (n:Person {name: value.name}) |
| CALL apoc.export.csv | Export to CSV | Data export | CALL apoc.export.csv.all('export.csv', {}) |
| CALL apoc.export.json | Export to JSON | JSON export | CALL apoc.export.json.all('export.json', {}) |
| CALL apoc.load.jdbc | Load from database | External DB import | CALL apoc.load.jdbc('jdbc:mysql://localhost/db', 'SELECT * FROM users') |
| WITH row | Process loaded rows | Row transformation | LOAD CSV FROM 'file:///data.csv' AS row WITH row WHERE row.age > 18 CREATE (n:Person {name: row.name}) |
| PERIODIC COMMIT | Batch commits | Memory management | USING PERIODIC COMMIT 1000 LOAD CSV FROM 'file:///large.csv' AS row CREATE (n:Person {name: row.name}) |
| apoc.export.graphml | Export to GraphML | Graph export | CALL apoc.export.graphml.all('export.graphml', {}) |
| apoc.import.graphml | Import GraphML | Graph import | CALL apoc.import.graphml('import.graphml', {}) |

### 12. Graph Algorithms (10)

| Algorithm | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| Shortest Path | Find shortest path | Path optimization | MATCH p = shortestPath((a:Person)-[:KNOWS*]-(b:Person)) RETURN p |
| All Shortest Paths | All shortest paths | Multiple routes | MATCH p = allShortestPaths((a)-[:KNOWS*]-(b)) RETURN p |
| PageRank | Calculate PageRank | Influence scoring | CALL gds.pageRank.stream('myGraph') YIELD nodeId, score |
| Betweenness Centrality | Find bridge nodes | Network analysis | CALL gds.betweenness.stream('myGraph') YIELD nodeId, score |
| Closeness Centrality | Measure node closeness | Centrality analysis | CALL gds.closeness.stream('myGraph') YIELD nodeId, score |
| Community Detection | Detect communities | Clustering | CALL gds.louvain.stream('myGraph') YIELD nodeId, communityId |
| Triangle Count | Count triangles | Clustering coefficient | CALL gds.triangleCount.stream('myGraph') YIELD nodeId, triangleCount |
| Connected Components | Find components | Network segmentation | CALL gds.wcc.stream('myGraph') YIELD nodeId, componentId |
| Node Similarity | Calculate similarity | Recommendation | CALL gds.nodeSimilarity.stream('myGraph') YIELD node1, node2, similarity |
| Label Propagation | Propagate labels | Semi-supervised learning | CALL gds.labelPropagation.stream('myGraph') YIELD nodeId, communityId |

### 13. Performance and Optimization (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PROFILE | Profile query execution | Performance analysis | PROFILE MATCH (n:Person) RETURN n |
| EXPLAIN | Explain query plan | Query optimization | EXPLAIN MATCH (n:Person)-[:KNOWS]->(m) RETURN n, m |
| USING INDEX | Force index usage | Index hints | MATCH (n:Person) USING INDEX n:Person(name) WHERE n.name = 'John' RETURN n |
| USING SCAN | Force label scan | Scan hints | MATCH (n:Person) USING SCAN n:Person WHERE n.age > 18 RETURN n |
| CALL dbms.listQueries | List running queries | Query monitoring | CALL dbms.listQueries() |
| CALL dbms.killQuery | Kill query | Query management | CALL dbms.killQuery('query-123') |
| CALL db.stats | Database statistics | Performance metrics | CALL db.stats.retrieve('GRAPH COUNTS') |
| WITH for pipeline | Pipeline queries | Memory optimization | MATCH (n:Person) WITH n LIMIT 100 MATCH (n)-[:KNOWS]->(m) RETURN n, m |
| LIMIT early | Limit early in query | Performance improvement | MATCH (n:Person) WITH n LIMIT 10 MATCH (n)-[:KNOWS]->(m) RETURN n, m |
| CREATE INDEX before import | Pre-create indexes | Import optimization | CREATE INDEX before LOAD CSV |
| CALL db.clearQueryCaches | Clear query cache | Cache management | CALL db.clearQueryCaches() |
| USING PERIODIC COMMIT | Batch processing | Large imports | USING PERIODIC COMMIT 1000 LOAD CSV |

### 14. Transaction Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| BEGIN | Start transaction | Transaction initiation | :BEGIN |
| COMMIT | Commit transaction | Save changes | :COMMIT |
| ROLLBACK | Rollback transaction | Undo changes | :ROLLBACK |
| CALL dbms.listTransactions | List transactions | Transaction monitoring | CALL dbms.listTransactions() |
| CALL dbms.killTransaction | Kill transaction | Transaction management | CALL dbms.killTransaction('transaction-123') |
| Auto-commit | Automatic commit | Default behavior | Single queries auto-commit |
| SHOW TRANSACTIONS | Show running transactions | Transaction inspection | SHOW TRANSACTIONS |
| TERMINATE TRANSACTIONS | Terminate transactions | Batch termination | TERMINATE TRANSACTIONS 'id1', 'id2' |

### 15. User and Security Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CREATE USER | Create new user | User management | CREATE USER alice SET PASSWORD 'password123' |
| DROP USER | Delete user | User removal | DROP USER alice |
| ALTER USER | Modify user | User modification | ALTER USER alice SET PASSWORD 'newpass' |
| SHOW USERS | List all users | User discovery | SHOW USERS |
| CREATE ROLE | Create role | Role management | CREATE ROLE analyst |
| DROP ROLE | Delete role | Role removal | DROP ROLE analyst |
| GRANT ROLE | Assign role to user | Permission assignment | GRANT ROLE analyst TO alice |
| REVOKE ROLE | Remove role from user | Permission removal | REVOKE ROLE analyst FROM alice |
| GRANT privilege | Grant specific privilege | Fine-grained permissions | GRANT MATCH {*} ON GRAPH * TO analyst |
| SHOW PRIVILEGES | Show user privileges | Permission review | SHOW USER alice PRIVILEGES |

### 16. Administration Commands (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CALL dbms.components | Show components | System information | CALL dbms.components() |
| CALL dbms.listConfig | List configuration | Configuration review | CALL dbms.listConfig() |
| SHOW SETTINGS | Show settings | Settings review | SHOW SETTINGS |
| CALL db.info | Database information | Database metadata | CALL db.info() |
| CALL dbms.procedures | List procedures | Procedure discovery | CALL dbms.procedures() |
| CALL dbms.functions | List functions | Function discovery | CALL dbms.functions() |
| CALL db.labels | List node labels | Schema discovery | CALL db.labels() |
| CALL db.relationshipTypes | List relationship types | Schema discovery | CALL db.relationshipTypes() |
| CALL db.propertyKeys | List property keys | Schema discovery | CALL db.propertyKeys() |
| CALL db.schema.visualization | Visualize schema | Schema inspection | CALL db.schema.visualization() |
| :sysinfo | System information | Server details | :sysinfo |
| CALL dbms.queryJmx | Query JMX metrics | Monitoring | CALL dbms.queryJmx('org.neo4j:*') |

### 17. APOC Procedures (12)

| Procedure | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| apoc.periodic.iterate | Batch processing | Large operations | CALL apoc.periodic.iterate('MATCH (n) RETURN n', 'SET n.processed = true', {batchSize:1000}) |
| apoc.path.expand | Path expansion | Custom path finding | CALL apoc.path.expand(startNode, 'KNOWS>', '+Person', 1, 3) |
| apoc.algo.dijkstra | Dijkstra algorithm | Weighted shortest path | CALL apoc.algo.dijkstra(start, end, 'KNOWS', 'weight') |
| apoc.create.relationship | Dynamic relationships | Runtime relationship creation | CALL apoc.create.relationship(node1, 'KNOWS', {}, node2) |
| apoc.merge.node | Merge with dynamic labels | Dynamic node merging | CALL apoc.merge.node(['Person'], {name: 'John'}) |
| apoc.refactor.mergeNodes | Merge multiple nodes | Node consolidation | CALL apoc.refactor.mergeNodes([node1, node2]) |
| apoc.load.json | Load JSON | JSON import | CALL apoc.load.json('http://api.example.com/data') |
| apoc.convert.toJson | Convert to JSON | JSON export | RETURN apoc.convert.toJson(node) |
| apoc.coll.flatten | Flatten nested lists | List operations | RETURN apoc.coll.flatten([[1,2],[3,4]]) |
| apoc.text.distance | String similarity | Fuzzy matching | RETURN apoc.text.distance('hello', 'hallo') |
| apoc.meta.stats | Graph statistics | Metadata analysis | CALL apoc.meta.stats() |
| apoc.export.cypher.all | Export as Cypher | Backup to Cypher | CALL apoc.export.cypher.all('backup.cypher', {}) |

## Tips and Best Practices

* Use indexes on frequently queried properties to improve performance
* Create constraints to enforce data integrity and uniqueness
* Use PROFILE to understand query execution and identify bottlenecks
* Leverage relationship direction for semantic meaning and query optimization
* Use parameters instead of string concatenation to prevent injection attacks
* Start queries with specific node patterns to reduce search space
* Use WITH clause to control memory usage in long query chains
* Batch large imports using PERIODIC COMMIT to manage memory
* Model relationships as first-class citizens to capture domain semantics
* Use meaningful labels and relationship types for clarity
* Avoid cartesian products by ensuring proper pattern connections
* Use OPTIONAL MATCH when relationships might not exist
* Leverage graph algorithms library for complex network analysis
* Create compound indexes for multi-property queries
* Monitor slow queries and optimize based on execution plans

## Additional Resources

* [Neo4j Official Documentation](https://neo4j.com/docs/)
* [Cypher Query Language Reference](https://neo4j.com/docs/cypher-manual/current/)
* [Neo4j Graph Algorithms](https://neo4j.com/docs/graph-data-science/current/)
* [APOC Procedures Documentation](https://neo4j.com/docs/apoc/current/)
* [Neo4j Performance Tuning](https://neo4j.com/developer/guide-performance-tuning/)
* [Graph Data Modeling Guide](https://neo4j.com/developer/guide-data-modeling/)
* [Neo4j Best Practices](https://neo4j.com/developer/guide-best-practices/)
* [Neo4j Bloom Visualization](https://neo4j.com/product/bloom/)

## Mini-Glossary

This glossary covers essential Neo4j terminology, concepts, and patterns to help you understand and work effectively with Neo4j.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| Node | Entity in graph, represents objects |
| Relationship | Connection between nodes with direction |
| Property | Key-value pair on node or relationship |
| Label | Category or type assigned to nodes |
| Relationship Type | Category of relationship |
| Graph | Collection of nodes and relationships |
| Pattern | Description of graph structure |
| Cypher | Neo4j's query language |
| Path | Sequence of connected nodes and relationships |
| Traversal | Walking through graph along relationships |

### Graph Components

| Component | Description |
|-----------|-------------|
| Node | Vertex in graph |
| Relationship | Edge connecting nodes |
| Property | Attribute on node or relationship |
| Label | Node categorization |
| Type | Relationship categorization |
| Path | Connected sequence |
| Pattern | Graph structure template |
| Subgraph | Portion of larger graph |

### Cypher Clauses

| Clause | Description |
|--------|-------------|
| MATCH | Find patterns in graph |
| CREATE | Create nodes and relationships |
| MERGE | Match or create patterns |
| DELETE | Remove nodes and relationships |
| SET | Update properties |
| REMOVE | Remove properties or labels |
| RETURN | Specify output |
| WHERE | Filter results |
| WITH | Pipeline results |
| UNWIND | Expand lists to rows |
| ORDER BY | Sort results |
| LIMIT | Restrict result count |

### Pattern Elements

| Element | Description |
|---------|-------------|
| Node pattern | (n:Label) |
| Relationship pattern | -[:TYPE]-> |
| Property pattern | {key: value} |
| Variable binding | Named references |
| Variable length | *min..max |
| Optional pattern | OPTIONAL MATCH |
| Multiple patterns | Comma-separated |
| Named path | p = (...) |

### Index Types

| Type | Description |
|------|-------------|
| Single property index | Index on one property |
| Composite index | Index on multiple properties |
| Fulltext index | Text search optimization |
| Lookup index | Label/type indexing |
| Vector index | Similarity search |
| Range index | Ordered property index |

### Constraint Types

| Constraint | Description |
|------------|-------------|
| Unique constraint | Enforces uniqueness |
| Existence constraint | Requires property |
| Node key constraint | Composite uniqueness |
| Property type constraint | Type enforcement |

### Aggregation Functions

| Function | Description |
|----------|-------------|
| count | Count results |
| sum | Sum values |
| avg | Average value |
| min | Minimum value |
| max | Maximum value |
| collect | Aggregate to list |
| stDev | Standard deviation |
| percentile | Percentile value |

### Path Functions

| Function | Description |
|----------|-------------|
| shortestPath | Find shortest path |
| allShortestPaths | All shortest paths |
| length | Path length |
| nodes | Nodes in path |
| relationships | Relationships in path |
| extract | Extract from path |

### Graph Algorithms

| Algorithm | Description |
|-----------|-------------|
| PageRank | Node importance |
| Betweenness Centrality | Bridge nodes |
| Closeness Centrality | Node proximity |
| Community Detection | Graph clustering |
| Shortest Path | Path optimization |
| Connected Components | Graph segmentation |
| Triangle Count | Local clustering |
| Node Similarity | Similarity calculation |

### APOC Categories

| Category | Description |
|----------|-------------|
| Path expansion | Custom traversals |
| Data conversion | Format transformation |
| Refactoring | Graph restructuring |
| Import/Export | Data transfer |
| Algorithms | Extended algorithms |
| Meta | Schema inspection |
| Text processing | String operations |
| Periodic execution | Batch processing |

### Performance Concepts

| Concept | Description |
|---------|-------------|
| Query plan | Execution strategy |
| Index usage | Optimization technique |
| Cardinality | Result size estimate |
| Eager operation | Materializes results |
| Label scan | Full label iteration |
| Index seek | Direct index lookup |
| Expand | Relationship traversal |
| Filter | Result filtering |
