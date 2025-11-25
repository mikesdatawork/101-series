# 101 Elasticsearch Commands

## Overview

Elasticsearch is a distributed, RESTful search and analytics engine built on Apache Lucene. This cheat sheet covers essential Elasticsearch operations, index management, search queries, aggregations, cluster administration, security configurations, and performance optimization techniques. Master these commands to build powerful search applications, analyze large datasets, and maintain high-performance search infrastructure.

## Target Audience

- Backend developers building search features
- Data engineers processing log data
- DevOps engineers managing ELK stack
- Data analysts performing complex queries
- Anyone working with search and analytics

## Command Categories

### 1. Cluster and Node Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| GET _cluster/health | Check cluster health status | Monitoring, health checks, diagnostics | Returns green, yellow, or red status |
| GET _cluster/state | View cluster state information | Debugging, configuration review | Shows indices, nodes, metadata |
| GET _cluster/stats | Get cluster statistics | Capacity planning, monitoring | Aggregate stats across cluster |
| GET _nodes | List all nodes in cluster | Node discovery, topology review | Shows node information |
| GET _nodes/stats | Get node statistics | Performance monitoring, resource usage | CPU, memory, disk stats |
| GET _cat/nodes | Human-readable node list | Quick cluster overview | Compact node information |
| GET _cat/health | Human-readable health status | Quick health check | Simple health output |
| POST _cluster/reroute | Manually reroute shards | Shard rebalancing, maintenance | Move shards between nodes |
| PUT _cluster/settings | Update cluster settings | Configuration changes | Modify cluster behavior |
| GET _cluster/allocation/explain | Explain shard allocation | Troubleshooting shard issues | Why shards are unassigned |

### 2. Index Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT /index_name | Create new index | Index creation, setup | Creates index with default settings |
| DELETE /index_name | Delete index | Cleanup, maintenance | Permanently removes index |
| GET /index_name | Get index information | Index inspection, verification | Shows mappings and settings |
| GET _cat/indices | List all indices | Index discovery, monitoring | Human-readable index list |
| POST /index_name/_close | Close index | Resource conservation, maintenance | Makes index read-only |
| POST /index_name/_open | Open closed index | Restore index access | Makes index writable again |
| POST _reindex | Copy data between indices | Data migration, reindexing | Source to destination copy |
| POST /index_name/_refresh | Refresh index | Make recent changes searchable | Updates search visibility |
| POST /index_name/_flush | Flush index to disk | Ensure durability, maintenance | Commits translog to disk |
| POST /index_name/_forcemerge | Force merge segments | Optimize storage, performance | Reduces segment count |
| PUT /index_name/_alias/alias_name | Create index alias | Abstraction, zero-downtime updates | Points alias to index |
| GET _aliases | List all aliases | Alias discovery, management | Shows all alias mappings |

### 3. Document Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| POST /index/_doc | Index document with auto ID | Document creation, ingestion | Elasticsearch generates ID |
| PUT /index/_doc/id | Index document with specific ID | Document creation with known ID | User-specified ID |
| GET /index/_doc/id | Retrieve document by ID | Document lookup, retrieval | Returns document source |
| DELETE /index/_doc/id | Delete document by ID | Document removal | Removes single document |
| POST /index/_update/id | Update document | Partial updates, modifications | Updates specific fields |
| POST /index/_bulk | Bulk operations | Batch processing, performance | Multiple operations at once |
| GET /index/_mget | Get multiple documents | Batch retrieval | Fetch multiple docs by ID |
| POST /index/_delete_by_query | Delete documents by query | Bulk deletion, cleanup | Delete matching documents |
| POST /index/_update_by_query | Update documents by query | Bulk updates | Update matching documents |
| GET /index/_source/id | Get document source only | Retrieve document data | Returns only _source field |

### 4. Search Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| GET /index/_search | Basic search | Document retrieval, queries | Search across index |
| POST /index/_search | Search with request body | Complex queries, filtering | Full query DSL support |
| GET _search | Search across all indices | Global search | Query entire cluster |
| GET /index/_count | Count matching documents | Result size estimation | Count without retrieving docs |
| POST /index/_search with match | Match query search | Text search, relevance | Full-text search |
| POST /index/_search with term | Exact term match | Precise matching | Keyword field queries |
| POST /index/_search with bool | Boolean query combination | Complex logic, filtering | Combine must, should, must_not |
| POST /index/_search with range | Range query | Date ranges, numeric ranges | Between values |
| POST /index/_search with wildcard | Wildcard pattern matching | Partial matching | Pattern-based search |
| POST /index/_search with fuzzy | Fuzzy matching | Typo tolerance, approximate search | Handles misspellings |
| GET /index/_search with size | Limit result count | Pagination, result limiting | Control returned docs |
| GET /index/_search with from | Result offset | Pagination | Skip first N results |

### 5. Aggregation Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| POST /index/_search with terms agg | Terms aggregation | Faceting, grouping | Group by field values |
| POST /index/_search with date_histogram | Date histogram aggregation | Time-based analysis | Group by time intervals |
| POST /index/_search with sum | Sum aggregation | Calculate totals | Sum numeric field |
| POST /index/_search with avg | Average aggregation | Calculate means | Average numeric field |
| POST /index/_search with min | Minimum aggregation | Find minimum values | Lowest value in field |
| POST /index/_search with max | Maximum aggregation | Find maximum values | Highest value in field |
| POST /index/_search with cardinality | Unique count aggregation | Count distinct values | Approximate unique count |
| POST /index/_search with stats | Statistics aggregation | Multiple metrics at once | Min, max, avg, sum, count |
| POST /index/_search with nested | Nested aggregation | Sub-aggregations | Aggregations within aggregations |
| POST /index/_search with filter | Filter aggregation | Conditional aggregations | Aggregate filtered subset |

### 6. Mapping and Schema (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT /index/_mapping | Create or update mapping | Schema definition | Define field types |
| GET /index/_mapping | Get index mapping | Schema inspection | View field definitions |
| GET /index/_mapping/field/field_name | Get specific field mapping | Field inspection | View single field definition |
| PUT /index with mappings | Create index with mapping | Index initialization | Define schema at creation |
| POST _analyze | Test text analysis | Debugging analyzers | See how text is processed |
| GET /index/_settings | Get index settings | Configuration review | View index configuration |
| PUT /index/_settings | Update index settings | Configuration changes | Modify index behavior |
| GET _template | List index templates | Template discovery | View all templates |
| PUT _template/template_name | Create index template | Standardize index creation | Apply settings automatically |
| DELETE _template/template_name | Delete index template | Template cleanup | Remove template |

### 7. Query DSL - Match Queries (10)

| Query Type | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| match | Full-text search | General text search | Search analyzed text fields |
| match_phrase | Phrase matching | Exact phrase search | Match word order |
| match_phrase_prefix | Prefix phrase matching | Autocomplete, suggestions | Match phrase prefix |
| multi_match | Search multiple fields | Cross-field search | Query several fields at once |
| query_string | Advanced query syntax | Power user queries | Supports operators like AND, OR |
| simple_query_string | Simplified query syntax | User-friendly queries | Simpler than query_string |
| match_all | Match all documents | Retrieve everything, testing | Returns all docs |
| match_bool_prefix | Boolean prefix matching | Search-as-you-type | Combines match and prefix |
| exists | Check field existence | Filter by field presence | Documents with field |
| ids | Match document IDs | Retrieve specific docs | Query by document IDs |

### 8. Query DSL - Term Queries (10)

| Query Type | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| term | Exact value match | Keyword search, filtering | Precise matching |
| terms | Match multiple values | Filter by multiple values | OR logic for values |
| range | Value range matching | Date ranges, numeric filters | Between values |
| wildcard | Pattern matching | Partial matching | Use * and ? wildcards |
| prefix | Prefix matching | Starts-with search | Match beginning of term |
| regexp | Regular expression matching | Complex pattern matching | Use regex patterns |
| fuzzy | Fuzzy matching | Handle typos, variations | Levenshtein distance |
| exists | Field exists check | Filter by field presence | Non-null fields |
| terms_set | Minimum should match | Flexible term matching | Match N of M terms |
| type | Match document type | Legacy type filtering | Filter by _type |

### 9. Query DSL - Boolean Queries (8)

| Query Component | Description | Common Usage | Examples |
|----------------|-------------|--------------|----------|
| bool must | All conditions required | AND logic | All clauses must match |
| bool should | At least one should match | OR logic | Boosts score if matches |
| bool must_not | Exclusion filter | NOT logic | Must not match |
| bool filter | Non-scoring filter | Performance optimization | Filter without scoring |
| bool minimum_should_match | Minimum clause requirement | Flexible matching | At least N should clauses |
| bool with nested | Nested boolean logic | Complex queries | Combine multiple bools |
| bool with boost | Score boosting | Relevance tuning | Increase clause importance |
| constant_score | Constant score filter | Skip scoring | Filter with fixed score |

### 10. Index Settings and Configuration (10)

| Setting | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| number_of_shards | Primary shard count | Horizontal scaling, distribution | Set at index creation |
| number_of_replicas | Replica shard count | Availability, read performance | Can change dynamically |
| refresh_interval | Index refresh frequency | Real-time vs throughput | Control search visibility delay |
| max_result_window | Maximum result window | Deep pagination limit | Prevent resource exhaustion |
| translog settings | Transaction log config | Durability tuning | Balance safety vs performance |
| analysis settings | Text analysis configuration | Custom analyzers, tokenizers | Control text processing |
| index.codec | Compression codec | Storage optimization | Best compression vs default |
| routing | Document routing | Control shard placement | Custom routing values |
| index.max_docvalue_fields_search | Max doc value fields | Query performance limit | Prevent expensive queries |
| index.mapping.total_fields.limit | Maximum field count | Schema size limit | Prevent mapping explosion |

### 11. Snapshot and Restore (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT _snapshot/repo_name | Create snapshot repository | Backup configuration | Configure backup location |
| GET _snapshot/repo_name | Get repository info | Verify repository | Check repository status |
| PUT _snapshot/repo/snapshot_name | Create snapshot | Backup indices | Take point-in-time backup |
| GET _snapshot/repo/snapshot_name | Get snapshot info | Verify snapshot | Check snapshot details |
| DELETE _snapshot/repo/snapshot_name | Delete snapshot | Cleanup old backups | Remove snapshot |
| POST _snapshot/repo/snapshot_name/_restore | Restore snapshot | Disaster recovery, migration | Restore from backup |
| GET _snapshot/repo/_all | List all snapshots | Backup management | View all backups |
| GET _snapshot/_status | Get snapshot status | Monitor backup progress | Check ongoing snapshots |
| POST _snapshot/repo/_verify | Verify repository | Test backup configuration | Ensure repository accessible |
| POST _snapshot/repo/_cleanup | Cleanup repository | Remove stale data | Clean repository files |

### 12. Monitoring and Stats (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| GET _cat/indices?v | Verbose indices list | Quick index overview | Show index stats |
| GET _cat/shards | List all shards | Shard distribution review | View shard placement |
| GET _cat/allocation | Show disk allocation | Disk usage monitoring | Check space per node |
| GET _stats | Index statistics | Performance monitoring | Index-level metrics |
| GET _nodes/stats | Node statistics | Resource monitoring | Node-level metrics |
| GET _cluster/pending_tasks | View pending tasks | Task queue monitoring | Check backlog |
| GET _tasks | List running tasks | Active operations | See current tasks |
| GET _cat/thread_pool | Thread pool stats | Thread monitoring | Check thread usage |
| GET _cat/fielddata | Fielddata usage | Memory monitoring | Check fielddata cache |
| GET _cat/segments | Segment information | Storage analysis | View segment details |

### 13. Security and Access Control (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT _security/user/username | Create user | User management | Add new user |
| DELETE _security/user/username | Delete user | User cleanup | Remove user |
| GET _security/user | List all users | User auditing | View all users |
| PUT _security/role/rolename | Create role | Role management | Define permissions |
| GET _security/role | List all roles | Role auditing | View all roles |
| PUT _security/role_mapping/name | Create role mapping | Map roles to users | LDAP, AD integration |
| POST _security/privilege/_has_privileges | Check privileges | Permission verification | Test user permissions |
| GET _security/api_key | List API keys | API key management | View active keys |
| POST _security/api_key | Create API key | Application authentication | Generate API key |
| DELETE _security/api_key | Revoke API key | Key rotation, security | Remove API key |

### 14. Index Lifecycle Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT _ilm/policy/policy_name | Create ILM policy | Define lifecycle stages | Hot, warm, cold, delete |
| GET _ilm/policy | List all policies | Policy management | View all ILM policies |
| POST /index/_ilm/retry | Retry failed ILM action | Error recovery | Retry lifecycle step |
| PUT /index/_settings | Apply ILM policy | Attach policy to index | Link index to policy |
| GET /index/_ilm/explain | Explain ILM status | Troubleshooting | Check lifecycle state |
| POST _ilm/start | Start ILM | Enable lifecycle management | Activate ILM |
| POST _ilm/stop | Stop ILM | Pause lifecycle management | Disable ILM |
| DELETE _ilm/policy/policy_name | Delete ILM policy | Policy cleanup | Remove policy |

### 15. Ingest Pipelines (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT _ingest/pipeline/pipeline_name | Create pipeline | Data transformation setup | Define processors |
| GET _ingest/pipeline | List all pipelines | Pipeline discovery | View all pipelines |
| GET _ingest/pipeline/pipeline_name | Get pipeline details | Pipeline inspection | View processor configuration |
| DELETE _ingest/pipeline/pipeline_name | Delete pipeline | Pipeline cleanup | Remove pipeline |
| POST _ingest/pipeline/pipeline_name/_simulate | Simulate pipeline | Testing, debugging | Test pipeline with sample data |
| PUT /index/_doc/id with pipeline | Index with pipeline | Apply transformations | Process doc through pipeline |
| Grok processor | Parse unstructured text | Log parsing | Extract fields from logs |
| Date processor | Parse date fields | Date normalization | Convert date formats |
| GeoIP processor | Enrich with geo data | Location enrichment | Add location from IP |
| Script processor | Custom transformations | Complex logic | Use Painless scripts |

### 16. Cross-Cluster Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUT _cluster/settings with remote | Configure remote cluster | Cross-cluster setup | Connect to remote cluster |
| GET /remote_cluster:index/_search | Search remote cluster | Distributed search | Query across clusters |
| GET _remote/info | List remote clusters | Remote cluster discovery | View configured remotes |
| POST _ccr/auto_follow/pattern_name | Create auto-follow pattern | Cross-cluster replication | Auto-replicate indices |
| PUT /index/_ccr/follow | Follow remote index | Index replication | Replicate specific index |
| POST /index/_ccr/pause_follow | Pause following | Temporarily stop replication | Pause CCR |
| POST /index/_ccr/resume_follow | Resume following | Restart replication | Resume CCR |
| POST /index/_ccr/unfollow | Stop following | End replication | Stop CCR permanently |

### 17. Performance and Optimization (10)

| Technique | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| Bulk API | Batch operations | High throughput ingestion | Multiple docs per request |
| Scroll API | Deep pagination | Export large datasets | Iterate through all results |
| Search After | Efficient pagination | Better than from/size | Use sort values |
| Request cache | Cache query results | Repeated queries | Speeds up frequent searches |
| Fielddata cache | Cache field values | Aggregations, sorting | Memory for field access |
| Doc values | Column-oriented storage | Aggregations, sorting | Disk-based field access |
| Index sorting | Pre-sort documents | Range query optimization | Sort at index time |
| Force merge | Reduce segments | Read performance | Merge to single segment |
| Routing | Control shard placement | Co-locate related docs | Custom routing values |
| Prefer local shards | Reduce network traffic | Search optimization | Use local data copies |

## Tips and Best Practices

* Use index templates to ensure consistent settings across indices
* Set appropriate shard counts based on data size and growth projections
* Use aliases for zero-downtime reindexing and version management
* Enable slow log monitoring to identify performance bottlenecks
* Use bulk API for indexing multiple documents to improve throughput
* Implement index lifecycle management to automate data retention policies
* Use doc values instead of fielddata for aggregations and sorting
* Set refresh_interval higher for write-heavy workloads to improve indexing performance
* Use filters in boolean queries for better caching and performance
* Monitor JVM heap usage and adjust based on workload requirements
* Use dedicated master nodes in production clusters for stability
* Implement cross-cluster replication for disaster recovery
* Use search templates to standardize and reuse complex queries
* Monitor cluster health and address yellow/red status immediately
* Use index sorting to optimize range queries on time-series data

## Additional Resources

* [Elasticsearch Official Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
* [Elasticsearch Query DSL Guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html)
* [Elasticsearch Aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations.html)
* [Elasticsearch Performance Tuning](https://www.elastic.co/guide/en/elasticsearch/reference/current/tune-for-search-speed.html)
* [Elastic Stack Documentation](https://www.elastic.co/guide/index.html)
* [Elasticsearch Best Practices](https://www.elastic.co/blog/found-elasticsearch-in-production)
* [Index Lifecycle Management](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-lifecycle-management.html)
* [Elasticsearch Security Guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/secure-cluster.html)

## Mini-Glossary

This glossary covers essential Elasticsearch terminology, concepts, and patterns to help you understand and work effectively with Elasticsearch.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| Index | Collection of documents with similar characteristics |
| Document | Basic unit of information that can be indexed |
| Shard | Subdivision of an index for horizontal scaling |
| Replica | Copy of a shard for redundancy and read scaling |
| Node | Single server in Elasticsearch cluster |
| Cluster | Collection of nodes working together |
| Mapping | Schema definition for index fields |
| Analyzer | Text processing pipeline for indexing and search |
| Query | Request to search or retrieve documents |
| Aggregation | Analytics and summary operations on data |

### Node Types

| Type | Description |
|------|-------------|
| Master node | Manages cluster state and coordinates operations |
| Data node | Stores data and executes queries |
| Ingest node | Preprocesses documents before indexing |
| Coordinating node | Routes requests and merges results |
| ML node | Runs machine learning jobs |
| Transform node | Processes continuous transforms |
| Remote-eligible node | Connects to remote clusters |

### Document Operations

| Operation | Description |
|-----------|-------------|
| Index | Add or update document |
| Get | Retrieve document by ID |
| Update | Modify existing document |
| Delete | Remove document |
| Bulk | Batch multiple operations |
| Reindex | Copy documents between indices |
| Update by query | Update multiple documents |
| Delete by query | Delete multiple documents |

### Query Types

| Type | Description |
|------|-------------|
| Full-text queries | Analyzed text search queries |
| Term-level queries | Exact value matching |
| Boolean queries | Combine multiple query clauses |
| Range queries | Match values in range |
| Geo queries | Location-based queries |
| Joining queries | Parent-child relationships |
| Specialized queries | Distance, percolate, script queries |

### Aggregation Types

| Type | Description |
|------|-------------|
| Bucket aggregations | Group documents into buckets |
| Metric aggregations | Calculate metrics on documents |
| Pipeline aggregations | Aggregate aggregation results |
| Matrix aggregations | Operate on multiple fields |
| Terms aggregation | Group by field values |
| Date histogram | Group by time intervals |
| Nested aggregation | Aggregate nested objects |

### Index Management

| Concept | Description |
|---------|-------------|
| Alias | Alternative name for indices |
| Template | Blueprint for index creation |
| ILM | Index Lifecycle Management for automation |
| Rollover | Create new index when conditions met |
| Shrink | Reduce shard count |
| Split | Increase shard count |
| Close | Make index read-only |
| Freeze | Minimize memory footprint |

### Performance Concepts

| Concept | Description |
|---------|-------------|
| Refresh | Make indexed documents searchable |
| Flush | Commit translog to disk |
| Merge | Combine index segments |
| Force merge | Explicitly merge segments |
| Routing | Control document shard placement |
| Scroll | Efficiently paginate large result sets |
| Search after | Efficient deep pagination |
| Request cache | Cache search results |
| Fielddata cache | Cache field values in memory |

### Search Features

| Feature | Description |
|---------|-------------|
| Relevance scoring | Calculate document match quality |
| Highlighting | Mark matching terms in results |
| Suggestions | Provide query suggestions |
| Percolation | Reverse search matching |
| More like this | Find similar documents |
| Rescoring | Adjust relevance scores |
| Function score | Custom scoring functions |
| Boosting | Increase field or query importance |

### Cluster Management

| Concept | Description |
|---------|-------------|
| Cluster state | Metadata about cluster configuration |
| Shard allocation | Distribution of shards across nodes |
| Rebalancing | Move shards to balance load |
| Recovery | Rebuild shards from replicas |
| Snapshot | Point-in-time backup |
| Repository | Storage location for snapshots |
| Cross-cluster search | Query multiple clusters |
| Cross-cluster replication | Replicate indices across clusters |

### Security Features

| Feature | Description |
|---------|-------------|
| Authentication | Verify user identity |
| Authorization | Control user permissions |
| RBAC | Role-Based Access Control |
| Field-level security | Restrict field access |
| Document-level security | Filter documents by user |
| API keys | Authenticate applications |
| TLS/SSL | Encrypt network traffic |
| Audit logging | Track security events |
