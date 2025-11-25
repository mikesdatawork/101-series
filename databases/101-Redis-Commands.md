# 101 Redis Commands

## Overview

Redis is an open-source, in-memory data structure store used as a database, cache, message broker, and streaming engine. This cheat sheet covers essential Redis commands, data structures, persistence mechanisms, clustering, pub/sub messaging, security practices, and performance optimization techniques. Master these commands to build high-performance applications with fast data access and real-time processing.

## Target Audience

- Backend developers building scalable applications
- Data engineers working with real-time pipelines
- DevOps engineers managing caching layers
- System architects designing distributed systems
- Anyone working with in-memory databases

## Command Categories

### 1. Connection and Server Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PING | Test connection to Redis server | Health checks, connection validation | PING returns PONG if connected |
| AUTH | Authenticate to server with password | Secure connections, access control | AUTH mypassword |
| SELECT | Switch to different database | Multi-tenant apps, data isolation | SELECT 1 switches to database 1 |
| INFO | Get server information and statistics | Monitoring, troubleshooting, capacity planning | INFO memory shows memory stats |
| CLIENT LIST | List all connected clients | Connection monitoring, debugging | CLIENT LIST shows all active connections |
| CLIENT SETNAME | Set client connection name | Connection tracking, debugging | CLIENT SETNAME myapp-worker-1 |
| CONFIG GET | Get configuration parameter value | Configuration review, troubleshooting | CONFIG GET maxmemory |
| CONFIG SET | Set configuration parameter | Runtime configuration changes | CONFIG SET maxmemory 2gb |
| SHUTDOWN | Shut down Redis server | Maintenance, deployment | SHUTDOWN SAVE stops server after saving |
| DBSIZE | Return number of keys in database | Database monitoring, capacity planning | DBSIZE returns key count |

### 2. Key Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| SET | Set key to string value | Storing data, caching | SET user:1000 John |
| GET | Get value of key | Retrieving data, cache reads | GET user:1000 |
| DEL | Delete one or more keys | Data cleanup, cache invalidation | DEL user:1000 user:1001 |
| EXISTS | Check if key exists | Validation, conditional logic | EXISTS user:1000 returns 1 if exists |
| EXPIRE | Set key expiration in seconds | TTL management, auto-cleanup | EXPIRE session:abc123 3600 |
| TTL | Get remaining time to live | Monitoring expiration, debugging | TTL session:abc123 returns seconds left |
| PERSIST | Remove expiration from key | Making temporary data permanent | PERSIST user:1000 |
| KEYS | Find keys matching pattern | Development, debugging, auditing | KEYS user:* finds all user keys |
| SCAN | Iterate keys incrementally | Production key scanning, safe iteration | SCAN 0 MATCH user:* COUNT 100 |
| RENAME | Rename key | Data migration, refactoring | RENAME oldkey newkey |
| TYPE | Determine type of value stored | Debugging, validation | TYPE user:1000 returns string |
| DUMP | Serialize value of key | Data backup, migration | DUMP user:1000 returns serialized value |

### 3. String Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| APPEND | Append value to existing string | Log accumulation, string building | APPEND log:today new entry |
| GETRANGE | Get substring of string | Partial reads, data extraction | GETRANGE mykey 0 10 |
| SETRANGE | Overwrite part of string | Partial updates, efficient modifications | SETRANGE mykey 5 world |
| STRLEN | Get length of string | Validation, size checks | STRLEN mykey returns byte length |
| INCR | Increment integer value by 1 | Counters, statistics, rate limiting | INCR page:views |
| INCRBY | Increment by specific amount | Custom increments, batch updates | INCRBY counter 10 |
| DECR | Decrement integer value by 1 | Countdown timers, inventory | DECR stock:item123 |
| DECRBY | Decrement by specific amount | Batch decrements, adjustments | DECRBY balance 50 |
| MGET | Get values of multiple keys | Batch reads, performance optimization | MGET key1 key2 key3 |
| MSET | Set multiple keys at once | Batch writes, atomic operations | MSET key1 val1 key2 val2 |

### 4. List Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| LPUSH | Prepend values to list | Queue implementation, task lists | LPUSH tasks task1 task2 |
| RPUSH | Append values to list | Stack implementation, logs | RPUSH messages msg1 msg2 |
| LPOP | Remove and return first element | Queue processing, FIFO operations | LPOP tasks |
| RPOP | Remove and return last element | Stack processing, LIFO operations | RPOP messages |
| LLEN | Get length of list | Size monitoring, validation | LLEN tasks returns list length |
| LRANGE | Get range of elements | Pagination, batch retrieval | LRANGE tasks 0 9 gets first 10 |
| LINDEX | Get element by index | Random access, specific retrieval | LINDEX tasks 5 |
| LSET | Set element value by index | Element updates, modifications | LSET tasks 0 newtask |
| LREM | Remove elements from list | Cleanup, element deletion | LREM tasks 1 oldtask |
| LTRIM | Trim list to specified range | List size management, cleanup | LTRIM tasks 0 99 keeps first 100 |
| BLPOP | Blocking pop from list | Worker queues, event processing | BLPOP tasks 30 waits 30 seconds |
| BRPOP | Blocking pop from right | Task queues, job processing | BRPOP messages 0 waits forever |

### 5. Set Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| SADD | Add members to set | Unique collections, tagging | SADD tags:post1 redis database |
| SREM | Remove members from set | Tag removal, cleanup | SREM tags:post1 redis |
| SMEMBERS | Get all members of set | Full set retrieval, display | SMEMBERS tags:post1 |
| SISMEMBER | Check if member exists | Membership testing, validation | SISMEMBER tags:post1 redis |
| SCARD | Get number of members | Set size monitoring, statistics | SCARD tags:post1 returns count |
| SPOP | Remove and return random member | Random selection, sampling | SPOP lottery:tickets |
| SRANDMEMBER | Get random members | Random sampling, recommendations | SRANDMEMBER users:active 5 |
| SINTER | Intersection of sets | Common elements, filtering | SINTER set1 set2 |
| SUNION | Union of sets | Combining sets, aggregation | SUNION set1 set2 |
| SDIFF | Difference of sets | Finding unique elements | SDIFF set1 set2 |

### 6. Sorted Set Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| ZADD | Add members with scores | Leaderboards, rankings, priority queues | ZADD scores 100 player1 95 player2 |
| ZREM | Remove members from sorted set | Cleanup, element removal | ZREM scores player1 |
| ZRANGE | Get range by index | Leaderboard display, pagination | ZRANGE scores 0 9 WITHSCORES |
| ZREVRANGE | Get range in reverse order | Top scores, reverse rankings | ZREVRANGE scores 0 9 WITHSCORES |
| ZRANK | Get rank of member | Position lookup, rankings | ZRANK scores player1 |
| ZREVRANK | Get reverse rank | Descending position lookup | ZREVRANK scores player1 |
| ZSCORE | Get score of member | Score retrieval, validation | ZSCORE scores player1 |
| ZCARD | Get number of members | Set size monitoring | ZCARD scores returns count |
| ZCOUNT | Count members in score range | Range statistics, filtering | ZCOUNT scores 90 100 |
| ZINCRBY | Increment member score | Score updates, point systems | ZINCRBY scores 5 player1 |
| ZRANGEBYSCORE | Get members by score range | Score-based queries, filtering | ZRANGEBYSCORE scores 90 100 |
| ZREMRANGEBYSCORE | Remove members by score range | Batch cleanup, pruning | ZREMRANGEBYSCORE scores 0 50 |

### 7. Hash Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| HSET | Set field in hash | Object storage, structured data | HSET user:1000 name John age 30 |
| HGET | Get field value from hash | Field retrieval, object access | HGET user:1000 name |
| HMGET | Get multiple field values | Batch field retrieval | HMGET user:1000 name age email |
| HGETALL | Get all fields and values | Full object retrieval | HGETALL user:1000 |
| HDEL | Delete fields from hash | Field removal, cleanup | HDEL user:1000 temp_field |
| HEXISTS | Check if field exists | Field validation, conditional logic | HEXISTS user:1000 name |
| HKEYS | Get all field names | Field listing, schema discovery | HKEYS user:1000 |
| HVALS | Get all values | Value extraction, analysis | HVALS user:1000 |
| HLEN | Get number of fields | Size monitoring, validation | HLEN user:1000 returns field count |
| HINCRBY | Increment field value | Counters, statistics | HINCRBY user:1000 login_count 1 |

### 8. Pub/Sub Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PUBLISH | Publish message to channel | Event broadcasting, notifications | PUBLISH news:alerts Breaking news |
| SUBSCRIBE | Subscribe to channels | Event listening, real-time updates | SUBSCRIBE news:alerts weather:* |
| UNSUBSCRIBE | Unsubscribe from channels | Stop listening, cleanup | UNSUBSCRIBE news:alerts |
| PSUBSCRIBE | Subscribe to pattern | Wildcard subscriptions | PSUBSCRIBE news:* |
| PUNSUBSCRIBE | Unsubscribe from pattern | Pattern cleanup | PUNSUBSCRIBE news:* |
| PUBSUB CHANNELS | List active channels | Channel discovery, monitoring | PUBSUB CHANNELS |
| PUBSUB NUMSUB | Get subscriber count | Monitoring, analytics | PUBSUB NUMSUB news:alerts |
| PUBSUB NUMPAT | Get pattern subscription count | Pattern monitoring | PUBSUB NUMPAT |

### 9. Transaction Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| MULTI | Start transaction block | Atomic operations, consistency | MULTI begins transaction |
| EXEC | Execute transaction | Commit changes, finalization | EXEC runs all queued commands |
| DISCARD | Cancel transaction | Rollback, error handling | DISCARD cancels transaction |
| WATCH | Watch keys for changes | Optimistic locking, concurrency | WATCH balance:1000 |
| UNWATCH | Unwatch all keys | Cancel monitoring | UNWATCH stops watching |
| INCR | Atomic increment in transaction | Safe counters, race prevention | MULTI, INCR counter, EXEC |
| SET | Atomic set in transaction | Consistent updates | MULTI, SET key val, EXEC |
| DEL | Atomic delete in transaction | Safe cleanup | MULTI, DEL key, EXEC |

### 10. Persistence Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| SAVE | Synchronous save to disk | Manual backup, maintenance | SAVE blocks until complete |
| BGSAVE | Asynchronous save to disk | Non-blocking backup | BGSAVE saves in background |
| LASTSAVE | Get last save timestamp | Backup monitoring | LASTSAVE returns Unix timestamp |
| SHUTDOWN SAVE | Save and shut down | Graceful shutdown, deployment | SHUTDOWN SAVE |
| BGREWRITEAOF | Rewrite AOF file | AOF optimization, maintenance | BGREWRITEAOF compacts AOF |
| AOF | Append only file management | Durability configuration | CONFIG SET appendonly yes |
| RDB | Snapshot management | Point-in-time recovery | CONFIG GET save |
| FLUSHDB | Delete all keys in database | Database cleanup, testing | FLUSHDB removes all keys |

### 11. Cluster Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CLUSTER NODES | List cluster nodes | Cluster monitoring, topology | CLUSTER NODES shows all nodes |
| CLUSTER INFO | Get cluster information | Health checks, diagnostics | CLUSTER INFO shows cluster state |
| CLUSTER MEET | Add node to cluster | Cluster expansion, setup | CLUSTER MEET 127.0.0.1 7001 |
| CLUSTER ADDSLOTS | Assign slots to node | Slot distribution, configuration | CLUSTER ADDSLOTS 0 1 2 |
| CLUSTER REPLICATE | Make node replica | Replication setup, HA | CLUSTER REPLICATE node-id |
| CLUSTER FAILOVER | Trigger manual failover | Maintenance, testing | CLUSTER FAILOVER |
| CLUSTER RESET | Reset cluster configuration | Troubleshooting, rebuild | CLUSTER RESET SOFT |
| CLUSTER SLOTS | Get slot mappings | Slot monitoring, debugging | CLUSTER SLOTS |
| CLUSTER KEYSLOT | Get slot for key | Key routing, debugging | CLUSTER KEYSLOT mykey |
| CLUSTER COUNTKEYSINSLOT | Count keys in slot | Slot analysis, balancing | CLUSTER COUNTKEYSINSLOT 100 |

### 12. Stream Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| XADD | Add entry to stream | Event logging, message queuing | XADD mystream * field1 value1 |
| XREAD | Read entries from streams | Stream consumption, processing | XREAD STREAMS mystream 0 |
| XRANGE | Query stream by ID range | Historical data, range queries | XRANGE mystream - + |
| XLEN | Get stream length | Size monitoring, capacity planning | XLEN mystream returns entry count |
| XTRIM | Trim stream to size | Stream maintenance, cleanup | XTRIM mystream MAXLEN 1000 |
| XDEL | Delete entries from stream | Entry removal, cleanup | XDEL mystream 1234567890-0 |
| XGROUP CREATE | Create consumer group | Group management, partitioning | XGROUP CREATE mystream mygroup 0 |
| XREADGROUP | Read as consumer group | Group consumption, load balancing | XREADGROUP GROUP mygroup consumer1 |
| XACK | Acknowledge processed entries | Message acknowledgment, tracking | XACK mystream mygroup 1234567890-0 |
| XPENDING | Check pending entries | Monitoring, reprocessing | XPENDING mystream mygroup |

### 13. Geospatial Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| GEOADD | Add locations to geospatial index | Location storage, mapping | GEOADD locations 13.4 52.5 Berlin |
| GEORADIUS | Query by radius | Proximity search, location queries | GEORADIUS locations 15 37 200 km |
| GEORADIUSBYMEMBER | Query radius from member | Member-based proximity | GEORADIUSBYMEMBER locations Berlin 100 km |
| GEOPOS | Get coordinates of members | Location retrieval | GEOPOS locations Berlin |
| GEODIST | Get distance between members | Distance calculation | GEODIST locations Berlin Paris km |
| GEOHASH | Get geohash of locations | Geohash encoding, indexing | GEOHASH locations Berlin |
| GEOSEARCH | Search with complex criteria | Advanced location queries | GEOSEARCH locations FROMMEMBER Berlin |
| GEOSEARCHSTORE | Store search results | Result caching, processing | GEOSEARCHSTORE dest src FROMMEMBER Berlin |

### 14. HyperLogLog Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| PFADD | Add elements to HyperLogLog | Unique counting, cardinality | PFADD visitors user1 user2 user3 |
| PFCOUNT | Get cardinality estimate | Count unique items | PFCOUNT visitors returns estimate |
| PFMERGE | Merge multiple HyperLogLogs | Combining counts, aggregation | PFMERGE total visitors1 visitors2 |
| PFDEBUG | Debug HyperLogLog | Troubleshooting, analysis | PFDEBUG GETREG visitors |
| PFADD unique_views | Track unique page views | Analytics, metrics | PFADD unique_views user:123 |
| PFCOUNT daily_users | Count daily active users | User analytics | PFCOUNT daily_users |
| PFMERGE weekly_users | Merge daily counts | Weekly aggregation | PFMERGE weekly_users day1 day2 |
| HLL for memory-efficient counts | Approximate counting | Large-scale analytics | Uses ~12KB per HLL |

### 15. Bitmap Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| SETBIT | Set bit at offset | Bitmap creation, flags | SETBIT mykey 7 1 |
| GETBIT | Get bit value at offset | Bitmap reading, checks | GETBIT mykey 7 |
| BITCOUNT | Count set bits | Population count, statistics | BITCOUNT mykey |
| BITPOS | Find first bit set | Bit scanning, search | BITPOS mykey 1 |
| BITOP | Perform bitwise operations | Bitmap algebra, combining | BITOP AND dest key1 key2 |
| BITFIELD | Manipulate integer fields | Multi-bit operations | BITFIELD mykey SET u4 0 15 |
| Daily active users bitmap | Track user activity | User engagement metrics | SETBIT users:2024-01-01 user_id 1 |
| Feature flags with bitmaps | Store feature states | Configuration, A/B testing | Compact flag storage |

### 16. Scripting Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| EVAL | Execute Lua script | Custom logic, atomic operations | EVAL "return redis.call('GET', KEYS[1])" 1 mykey |
| EVALSHA | Execute script by SHA | Cached script execution | EVALSHA sha1 1 mykey |
| SCRIPT LOAD | Load script into cache | Script preparation | SCRIPT LOAD "return 'hello'" |
| SCRIPT EXISTS | Check if scripts exist | Script validation | SCRIPT EXISTS sha1 sha2 |
| SCRIPT FLUSH | Remove all scripts | Cache cleanup | SCRIPT FLUSH |
| SCRIPT KILL | Kill running script | Emergency stop, debugging | SCRIPT KILL |
| SCRIPT DEBUG | Debug Lua scripts | Development, troubleshooting | SCRIPT DEBUG YES |
| Lua for atomic operations | Complex atomic logic | Transaction alternatives | Combine multiple commands |
| Server-side logic | Reduce network round trips | Performance optimization | Execute logic near data |
| Custom commands via scripts | Extend Redis functionality | Specialized operations | Create domain-specific commands |

### 17. Security and ACL Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| ACL SETUSER | Create or modify user | User management, access control | ACL SETUSER alice on >password ~* +@all |
| ACL DELUSER | Delete user | User removal, cleanup | ACL DELUSER bob |
| ACL LIST | List all users | User auditing, review | ACL LIST shows all ACL rules |
| ACL GETUSER | Get user details | User inspection, debugging | ACL GETUSER alice |
| ACL CAT | List command categories | Category discovery, planning | ACL CAT shows all categories |
| ACL WHOAMI | Get current username | Identity verification | ACL WHOAMI returns username |
| ACL LOG | View ACL security events | Security monitoring, auditing | ACL LOG 10 shows last 10 events |
| REQUIREPASS | Set server password | Basic authentication | CONFIG SET requirepass secret |
| RENAME-COMMAND | Rename dangerous commands | Security hardening | RENAME-COMMAND FLUSHDB "" |
| Protected mode | Restrict external connections | Security enhancement | CONFIG SET protected-mode yes |

## Tips and Best Practices

* Use SCAN instead of KEYS in production to avoid blocking the server during key iteration
* Set appropriate TTLs on cache keys to prevent memory exhaustion and stale data
* Use pipelining to batch multiple commands and reduce network round trips
* Enable persistence with both RDB and AOF for balanced durability and performance
* Use Redis Cluster for horizontal scaling and automatic sharding across multiple nodes
* Monitor memory usage with INFO memory and set maxmemory policies to prevent OOM errors
* Use connection pooling in applications to reuse connections and reduce overhead
* Implement retry logic with exponential backoff for transient connection failures
* Use Redis Streams for reliable message queuing instead of lists when order and acknowledgment matter
* Set maxmemory-policy to allkeys-lru or volatile-lru for effective cache eviction
* Use MULTI/EXEC transactions for atomic operations instead of individual commands
* Avoid large keys; split big strings, hashes, or collections into smaller chunks
* Use Redis Sentinel for automatic failover and high availability in production
* Monitor slow queries with SLOWLOG to identify performance bottlenecks
* Use readonly replicas for read scaling and to offload traffic from the primary

## Additional Resources

* [Redis Official Documentation](https://redis.io/documentation)
* [Redis Commands Reference](https://redis.io/commands)
* [Redis University Free Courses](https://university.redis.com/)
* [Redis Best Practices Guide](https://redis.io/docs/management/optimization/)
* [Redis Persistence Documentation](https://redis.io/docs/management/persistence/)
* [Redis Cluster Tutorial](https://redis.io/docs/management/scaling/)
* [Redis Security Guide](https://redis.io/docs/management/security/)
* [Redis Pub/Sub Documentation](https://redis.io/docs/manual/pubsub/)

## Mini-Glossary

This glossary covers essential Redis terminology, concepts, and patterns to help you understand and work effectively with Redis.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| In-memory database | Database that stores data in RAM for fast access |
| Key-value store | Data structure that maps keys to values |
| Data structure server | Server supporting multiple data types beyond strings |
| Cache | Temporary storage layer for frequently accessed data |
| TTL | Time To Live, expiration time for keys |
| Persistence | Saving in-memory data to disk for durability |
| Replication | Copying data from primary to replica servers |
| Sharding | Distributing data across multiple Redis instances |
| Eviction | Removing keys when memory limit is reached |
| Pipeline | Sending multiple commands without waiting for responses |

### Data Structures

| Type | Description |
|------|-------------|
| String | Binary-safe strings up to 512MB |
| List | Ordered collection of strings |
| Set | Unordered collection of unique strings |
| Sorted Set | Set with scores for ordering |
| Hash | Map of field-value pairs |
| Bitmap | Bit array operations on strings |
| HyperLogLog | Probabilistic data structure for cardinality estimation |
| Stream | Append-only log data structure |
| Geospatial | Location-based data with coordinates |

### Persistence Mechanisms

| Mechanism | Description |
|-----------|-------------|
| RDB | Point-in-time snapshots saved to disk |
| AOF | Append-Only File logging every write operation |
| RDB+AOF | Combined approach for reliability and performance |
| SAVE | Blocking snapshot creation |
| BGSAVE | Background snapshot creation |
| AOF rewrite | Compacting AOF file to reduce size |
| fsync | Forcing write to disk for durability |

### Cluster and HA Concepts

| Concept | Description |
|---------|-------------|
| Redis Cluster | Native sharding and replication solution |
| Sentinel | High availability and monitoring solution |
| Primary | Main server accepting writes |
| Replica | Read-only copy of primary server |
| Hash slot | Unit of data distribution in cluster (16384 total) |
| Failover | Automatic promotion of replica to primary |
| Split-brain | Network partition causing multiple primaries |
| Quorum | Minimum number of nodes for consensus |

### Performance Concepts

| Concept | Description |
|---------|-------------|
| Pipeline | Batching commands to reduce network overhead |
| Blocking operations | Commands that wait for data (BLPOP, BRPOP) |
| Slow log | Log of commands exceeding execution time threshold |
| Eviction policy | Strategy for removing keys when memory full |
| Connection pool | Reusing connections instead of creating new ones |
| Latency | Time between command and response |
| Throughput | Number of operations per second |
| Memory fragmentation | Wasted memory from allocation patterns |

### Security Concepts

| Concept | Description |
|---------|-------------|
| ACL | Access Control List for fine-grained permissions |
| AUTH | Password-based authentication |
| Protected mode | Restricting connections to localhost only |
| TLS/SSL | Encrypted client-server communication |
| Command renaming | Disabling dangerous commands |
| Key pattern | Restricting user access to specific key patterns |
| Command category | Grouping commands by functionality for ACLs |

### Common Patterns

| Pattern | Description |
|---------|-------------|
| Cache-aside | Application checks cache before database |
| Write-through | Writing to cache and database simultaneously |
| Read-through | Cache fetches from database on miss |
| Session store | Storing user session data with expiration |
| Rate limiting | Using counters with TTL to limit requests |
| Leaderboard | Using sorted sets for rankings |
| Message queue | Using lists or streams for task queues |
| Distributed lock | Using SETNX for mutual exclusion |
| Pub/Sub | Real-time message broadcasting |
| Time series | Using sorted sets or streams for time-based data |
