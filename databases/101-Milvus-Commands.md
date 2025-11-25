# 101 Milvus Commands

## Overview

Milvus is an open-source vector database built for scalable similarity search and AI applications. This cheat sheet covers essential Milvus operations, collection management, vector indexing, similarity search, data insertion and querying, performance tuning, and integration with machine learning workflows. Master these commands to build recommendation systems, semantic search engines, and AI-powered applications with efficient vector operations.

## Target Audience

- Machine learning engineers building AI applications
- Data scientists working with embeddings
- Backend developers implementing semantic search
- AI researchers developing vector-based systems
- Anyone working with high-dimensional data

## Command Categories

### 1. Connection and Client Setup (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| connections.connect | Connect to Milvus server | Establish connection | connections.connect(host='localhost', port='19530') |
| connections.disconnect | Disconnect from server | Close connection | connections.disconnect(alias='default') |
| connections.list_connections | List active connections | Connection management | connections.list_connections() |
| utility.get_server_version | Get server version | Version check | utility.get_server_version() |
| MilvusClient | Create client instance | Alternative connection | client = MilvusClient(uri='http://localhost:19530') |
| has_connection | Check connection status | Verify connectivity | has_connection() |
| get_connection | Get connection object | Access connection | get_connection(alias='default') |
| connections.add_connection | Add named connection | Multi-server setup | connections.add_connection(default={'host':'localhost','port':'19530'}) |
| utility.loading_progress | Check loading progress | Monitor operations | utility.loading_progress(collection_name) |
| utility.get_query_segment_info | Get segment information | Cluster inspection | utility.get_query_segment_info(collection_name) |

### 2. Collection Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| Collection | Create collection | Initialize collection | collection = Collection(name='my_collection', schema=schema) |
| utility.has_collection | Check collection exists | Existence validation | utility.has_collection('my_collection') |
| utility.list_collections | List all collections | Collection discovery | utility.list_collections() |
| collection.drop | Delete collection | Cleanup | collection.drop() |
| utility.drop_collection | Drop collection by name | Deletion | utility.drop_collection('my_collection') |
| collection.load | Load collection to memory | Prepare for search | collection.load() |
| collection.release | Release collection from memory | Free resources | collection.release() |
| collection.num_entities | Count entities | Size monitoring | collection.num_entities |
| collection.describe | Get collection info | Schema inspection | collection.describe() |
| utility.rename_collection | Rename collection | Collection reorganization | utility.rename_collection('old', 'new') |
| collection.compact | Compact collection | Space optimization | collection.compact() |
| utility.get_bulk_insert_state | Check bulk insert status | Monitor imports | utility.get_bulk_insert_state(task_id) |

### 3. Schema Definition (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| CollectionSchema | Define schema | Schema creation | schema = CollectionSchema(fields, description='My collection') |
| FieldSchema | Define field | Field specification | field = FieldSchema(name='id', dtype=DataType.INT64, is_primary=True) |
| DataType.FLOAT_VECTOR | Float vector type | Vector field definition | dtype=DataType.FLOAT_VECTOR |
| DataType.BINARY_VECTOR | Binary vector type | Binary embeddings | dtype=DataType.BINARY_VECTOR |
| DataType.INT64 | 64-bit integer | Scalar field | dtype=DataType.INT64 |
| DataType.VARCHAR | Variable string | Text field | dtype=DataType.VARCHAR |
| DataType.BOOL | Boolean type | Flag field | dtype=DataType.BOOL |
| DataType.FLOAT | Float type | Numeric field | dtype=DataType.FLOAT |
| dim parameter | Set vector dimension | Embedding size | FieldSchema(name='embedding', dtype=DataType.FLOAT_VECTOR, dim=768) |
| is_primary | Mark primary key | Unique identifier | is_primary=True |
| auto_id | Enable auto ID | Automatic ID generation | auto_id=True |
| max_length | Set max string length | String constraint | max_length=65535 |

### 4. Data Insertion (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.insert | Insert data | Add vectors | collection.insert([[1, 2], [3, 4], ...]) |
| insert with dict | Insert using dictionary | Structured insertion | collection.insert([{'id': 1, 'vector': [0.1, 0.2]}]) |
| insert with list | Insert using lists | Batch insertion | collection.insert([ids, vectors, metadata]) |
| collection.upsert | Update or insert | Upsert operation | collection.upsert(data) |
| collection.flush | Persist data | Force write to disk | collection.flush() |
| batch insertion | Insert in batches | Memory management | Split data into chunks |
| insert with partition | Insert to partition | Partitioned data | collection.insert(data, partition_name='partition1') |
| MilvusClient.insert | Client insert method | Alternative syntax | client.insert(collection_name='my_col', data=data) |
| collection.num_entities | Verify insertion | Count check | collection.num_entities |
| utility.do_bulk_insert | Bulk import | Large-scale import | utility.do_bulk_insert(collection_name, files) |

### 5. Vector Search (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.search | Perform vector search | Similarity search | collection.search(data=[[0.1, 0.2]], anns_field='vector', param={}, limit=10) |
| search with expr | Search with filter | Filtered search | collection.search(vectors, anns_field='vector', expr='age > 18', limit=10) |
| search with partition | Search specific partition | Partition query | collection.search(vectors, partition_names=['partition1'], limit=10) |
| search parameters | Set search params | Index-specific tuning | param={'metric_type':'L2', 'params':{'nprobe':16}} |
| limit parameter | Set result count | Control results | limit=10 |
| offset parameter | Skip results | Pagination | offset=20 |
| output_fields | Specify return fields | Field selection | output_fields=['id', 'age'] |
| consistency_level | Set consistency | Read consistency | consistency_level='Strong' |
| metric_type L2 | Euclidean distance | Distance metric | metric_type='L2' |
| metric_type IP | Inner product | Dot product metric | metric_type='IP' |
| metric_type COSINE | Cosine similarity | Angle-based similarity | metric_type='COSINE' |
| round_decimal | Round results | Precision control | round_decimal=2 |

### 6. Hybrid Search and Filtering (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| expr parameter | Boolean expression | Scalar filtering | expr='age > 18 and city == "NYC"' |
| in operator | List membership | Value matching | expr='id in [1, 2, 3]' |
| and operator | Logical AND | Combine conditions | expr='age > 18 and status == "active"' |
| or operator | Logical OR | Alternative conditions | expr='city == "NYC" or city == "LA"' |
| not operator | Logical NOT | Negation | expr='not (age < 18)' |
| comparison operators | Compare values | Numeric filtering | expr='price >= 100' |
| like operator | String pattern | Pattern matching | expr='name like "John%"' |
| range expression | Range filtering | Bounded queries | expr='age >= 18 and age <= 65' |
| json_contains | JSON field filter | Nested data query | expr='json_contains(tags, "urgent")' |
| array_contains | Array membership | List filtering | expr='array_contains(categories, "tech")' |

### 7. Index Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.create_index | Create index | Index creation | collection.create_index(field_name='vector', index_params=params) |
| FLAT index | Brute force index | Exact search | index_type='FLAT' |
| IVF_FLAT index | Inverted file index | Balanced performance | index_type='IVF_FLAT' |
| IVF_SQ8 index | Scalar quantized IVF | Memory efficient | index_type='IVF_SQ8' |
| IVF_PQ index | Product quantization | Compressed index | index_type='IVF_PQ' |
| HNSW index | Hierarchical NSW | High performance | index_type='HNSW' |
| ANNOY index | Approximate NN | Memory efficient | index_type='ANNOY' |
| nlist parameter | Number of clusters | IVF tuning | params={'nlist': 128} |
| M parameter | Graph connections | HNSW tuning | params={'M': 16} |
| efConstruction | Build quality | HNSW build param | params={'efConstruction': 200} |
| collection.has_index | Check index exists | Index validation | collection.has_index() |
| collection.drop_index | Remove index | Index cleanup | collection.drop_index() |

### 8. Query Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.query | Scalar query | Metadata query | collection.query(expr='id in [1, 2, 3]', output_fields=['*']) |
| query with expr | Filtered query | Conditional retrieval | collection.query(expr='age > 18') |
| query with partition | Query partition | Partition query | collection.query(expr='id > 0', partition_names=['partition1']) |
| output_fields | Specify fields | Field selection | output_fields=['id', 'name', 'age'] |
| query with limit | Limit results | Result count | limit=100 |
| query with offset | Paginate results | Skip records | offset=50 |
| query all fields | Return all fields | Complete retrieval | output_fields=['*'] |
| consistency_level | Query consistency | Read control | consistency_level='Bounded' |
| get by ID | Retrieve by primary key | Direct lookup | collection.query(expr='id == 1') |
| range query | Query numeric range | Range filtering | collection.query(expr='price >= 100 and price <= 500') |

### 9. Partition Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.create_partition | Create partition | Data segmentation | collection.create_partition('partition1') |
| collection.has_partition | Check partition exists | Existence check | collection.has_partition('partition1') |
| collection.list_partitions | List partitions | Partition discovery | collection.list_partitions() |
| collection.drop_partition | Delete partition | Partition removal | collection.drop_partition('partition1') |
| Partition object | Get partition | Partition access | partition = Partition(collection, 'partition1') |
| partition.load | Load partition | Prepare partition | partition.load() |
| partition.release | Release partition | Free memory | partition.release() |
| partition.num_entities | Count in partition | Size monitoring | partition.num_entities |
| partition.insert | Insert to partition | Partitioned insertion | partition.insert(data) |
| search with partitions | Search partitions | Partition query | collection.search(vectors, partition_names=['p1', 'p2']) |

### 10. Data Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.delete | Delete entities | Data removal | collection.delete(expr='id in [1, 2, 3]') |
| delete with expr | Conditional deletion | Filtered removal | collection.delete(expr='age < 18') |
| collection.flush | Flush data | Persist changes | collection.flush() |
| collection.compact | Compact collection | Defragmentation | collection.compact() |
| utility.get_compaction_state | Check compaction | Monitor compaction | utility.get_compaction_state(compaction_id) |
| utility.get_compaction_plans | Get compaction plans | Plan inspection | utility.get_compaction_plans(collection_name) |
| utility.wait_for_compaction_completed | Wait for compaction | Sync operation | utility.wait_for_compaction_completed(compaction_id) |
| collection.load_state | Check load state | State verification | collection.load_state |
| utility.loading_progress | Monitor loading | Progress tracking | utility.loading_progress(collection_name) |
| utility.wait_for_loading_complete | Wait for load | Sync loading | utility.wait_for_loading_complete(collection_name) |

### 11. Alias Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| utility.create_alias | Create alias | Name mapping | utility.create_alias(collection_name='col1', alias='production') |
| utility.drop_alias | Remove alias | Alias cleanup | utility.drop_alias(alias='production') |
| utility.alter_alias | Change alias target | Update mapping | utility.alter_alias(collection_name='col2', alias='production') |
| utility.list_aliases | List all aliases | Alias discovery | utility.list_aliases(collection_name='col1') |
| Collection with alias | Use alias | Alias access | collection = Collection(name='production') |
| Zero-downtime switch | Atomic alias change | Deployment pattern | utility.alter_alias for seamless updates |
| Alias versioning | Version management | Release management | Use aliases like v1, v2, production |
| utility.has_collection alias | Check via alias | Alias validation | utility.has_collection('production') |

### 12. Resource Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| collection.load | Load to memory | Memory allocation | collection.load() |
| collection.release | Release memory | Free resources | collection.release() |
| utility.load_balance | Balance query nodes | Load distribution | utility.load_balance(src_node_id, dst_node_ids, sealed_segment_ids) |
| utility.get_query_segment_info | Query segment info | Resource inspection | utility.get_query_segment_info(collection_name) |
| collection.load with replica | Load with replicas | High availability | collection.load(replica_number=2) |
| utility.get_replica_info | Get replica information | Replica inspection | utility.get_replica_info(collection_name) |
| utility.loading_progress | Check load progress | Monitor loading | utility.loading_progress(collection_name) |
| utility.wait_for_loading_complete | Wait for load | Synchronous loading | utility.wait_for_loading_complete(collection_name) |
| load_state property | Check load status | State verification | collection.load_state |
| utility.get_loading_progress | Progress percentage | Progress tracking | utility.get_loading_progress(collection_name) |

### 13. User and RBAC Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| utility.create_user | Create user | User management | utility.create_user(user='alice', password='pass123') |
| utility.delete_user | Delete user | User removal | utility.delete_user(user='alice') |
| utility.update_password | Change password | Security management | utility.update_password(user='alice', old_password='old', new_password='new') |
| utility.list_users | List all users | User discovery | utility.list_users() |
| utility.create_role | Create role | Role management | utility.create_role(role_name='analyst') |
| utility.drop_role | Delete role | Role removal | utility.drop_role(role_name='analyst') |
| utility.add_user_to_role | Grant role | Permission assignment | utility.add_user_to_role(username='alice', role_name='analyst') |
| utility.remove_user_from_role | Revoke role | Permission removal | utility.remove_user_from_role(username='alice', role_name='analyst') |
| utility.grant_privilege | Grant permission | Fine-grained access | utility.grant_privilege(role_name='analyst', object='Collection', object_name='col1', privilege='Search') |
| utility.revoke_privilege | Revoke permission | Access removal | utility.revoke_privilege(role_name='analyst', object='Collection', object_name='col1', privilege='Search') |

### 14. Performance Tuning (12)

| Parameter | Description | Common Usage | Examples |
|-----------|-------------|--------------|----------|
| nprobe | IVF search clusters | Search accuracy | search_params={'nprobe': 16} |
| ef | HNSW search quality | HNSW tuning | search_params={'ef': 200} |
| search_k | ANNOY search param | ANNOY tuning | search_params={'search_k': 100} |
| consistency_level | Read consistency | Performance tradeoff | consistency_level='Eventually' |
| guarantee_timestamp | Consistency guarantee | Exact consistency | guarantee_timestamp=timestamp |
| graceful_time | Consistency wait time | Bounded consistency | graceful_time=5 |
| replica_number | Query replicas | Load distribution | collection.load(replica_number=2) |
| nlist | IVF clusters | Index tuning | index_params={'nlist': 128} |
| M | HNSW connections | Graph density | index_params={'M': 16} |
| efConstruction | HNSW build quality | Build performance | index_params={'efConstruction': 200} |
| batch size | Insert batch size | Memory management | Insert in chunks of 1000-10000 |
| segment size | Collection segment size | Storage tuning | Configure via server settings |

### 15. Monitoring and Statistics (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| utility.get_query_segment_info | Query segment details | Performance analysis | utility.get_query_segment_info(collection_name) |
| collection.num_entities | Entity count | Size monitoring | collection.num_entities |
| utility.loading_progress | Loading status | Progress tracking | utility.loading_progress(collection_name) |
| utility.get_compaction_state | Compaction status | Maintenance tracking | utility.get_compaction_state(compaction_id) |
| utility.get_replica_info | Replica information | HA monitoring | utility.get_replica_info(collection_name) |
| utility.get_bulk_insert_state | Bulk insert status | Import monitoring | utility.get_bulk_insert_state(task_id) |
| collection.describe | Collection metadata | Schema inspection | collection.describe() |
| utility.list_collections | Collection inventory | System overview | utility.list_collections() |
| partition.num_entities | Partition size | Partition monitoring | partition.num_entities |
| utility.calc_distance | Calculate distances | Similarity verification | utility.calc_distance(vectors_left, vectors_right) |

### 16. Integration with ML Frameworks (10)

| Integration | Description | Common Usage | Examples |
|-------------|-------------|--------------|----------|
| pymilvus | Python SDK | Primary interface | from pymilvus import connections, Collection |
| Insert embeddings | Store vectors | Model outputs | collection.insert([ids, embeddings, metadata]) |
| Search embeddings | Query vectors | Similarity search | collection.search(query_vectors, limit=10) |
| Batch processing | Process in batches | Memory efficiency | Process data in chunks |
| numpy arrays | Array support | Vector format | Accept numpy arrays directly |
| Sentence transformers | Text embeddings | NLP integration | Use with sentence-transformers library |
| OpenAI embeddings | API embeddings | External embeddings | Store OpenAI ada-002 vectors |
| Hugging Face models | Model integration | Transformer embeddings | Integrate with transformers library |
| PyTorch tensors | Tensor support | Deep learning | Convert tensors to lists |
| TensorFlow integration | TF compatibility | TF model outputs | Convert to numpy then list |

### 17. Advanced Features (10)

| Feature | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| Dynamic schema | Add fields dynamically | Schema evolution | Enable dynamic fields in schema |
| JSON field support | Store JSON data | Flexible metadata | Use JSON fields for nested data |
| Array field support | Store arrays | List data | Use array fields for multi-value attributes |
| Time travel | Query historical data | Point-in-time queries | Query with specific timestamp |
| String matching | Full-text search | Text filtering | Use like operator in expressions |
| Scalar index | Index scalar fields | Filter optimization | Create index on scalar fields |
| Hybrid search | Vector plus scalar | Combined queries | Search with vector + metadata filters |
| Multi-vector search | Multiple vector fields | Complex similarity | Search across different embeddings |
| Sparse vectors | Sparse embeddings | Efficient storage | Use for sparse representations |
| Distance calculation | Compute distances | Metric evaluation | utility.calc_distance for verification |

## Tips and Best Practices

* Use appropriate index types based on data size and accuracy requirements
* Batch insert operations for better throughput and memory efficiency
* Create indexes before loading collections for optimal search performance
* Use partitions to organize data by logical groups or time periods
* Set consistency level based on application requirements for performance tuning
* Monitor collection size and compact regularly to reclaim space
* Use replicas for high availability and improved query throughput
* Choose metric type based on embedding characteristics and use case
* Leverage scalar filtering to reduce search space and improve performance
* Use aliases for zero-downtime collection updates and deployments
* Configure nprobe and ef parameters based on accuracy requirements
* Implement proper error handling for connection and operation failures
* Use output_fields to retrieve only necessary data and reduce bandwidth
* Test different index parameters to find optimal balance for your workload
* Monitor query latency and adjust index parameters accordingly

## Additional Resources

* [Milvus Official Documentation](https://milvus.io/docs)
* [Milvus Python SDK Guide](https://milvus.io/docs/install-pymilvus.md)
* [Milvus Architecture Overview](https://milvus.io/docs/architecture_overview.md)
* [Vector Index Selection Guide](https://milvus.io/docs/index.md)
* [Milvus Performance Tuning](https://milvus.io/docs/performance_tuning.md)
* [Milvus Best Practices](https://milvus.io/docs/performance_faq.md)
* [Milvus GitHub Repository](https://github.com/milvus-io/milvus)
* [Milvus Community Forum](https://discuss.milvus.io/)

## Mini-Glossary

This glossary covers essential Milvus terminology, concepts, and patterns to help you understand and work effectively with Milvus.

### Common Terms

| Term/Concept | Description |
|--------------|-------------|
| Vector database | Database optimized for vector similarity search |
| Embedding | Numeric representation of data in vector space |
| Similarity search | Find vectors similar to query vector |
| Collection | Table-like container for vectors and metadata |
| Field | Column in collection schema |
| Entity | Row in collection, contains vector and metadata |
| Partition | Logical subdivision of collection |
| Index | Data structure for efficient search |
| Metric | Distance measure for similarity |
| Segment | Storage unit in Milvus |

### Vector Types

| Type | Description |
|------|-------------|
| FLOAT_VECTOR | 32-bit floating point vectors |
| BINARY_VECTOR | Binary vectors |
| SPARSE_FLOAT_VECTOR | Sparse vectors |
| Dense vectors | Standard embeddings |
| Normalized vectors | Unit length vectors |
| Multi-vector | Multiple vector fields |

### Index Types

| Index | Description |
|-------|-------------|
| FLAT | Brute force exact search |
| IVF_FLAT | Inverted file index |
| IVF_SQ8 | Scalar quantized IVF |
| IVF_PQ | Product quantized IVF |
| HNSW | Hierarchical navigable small world |
| ANNOY | Approximate nearest neighbors |
| DISKANN | Disk-based ANN index |

### Metric Types

| Metric | Description |
|--------|-------------|
| L2 | Euclidean distance |
| IP | Inner product |
| COSINE | Cosine similarity |
| HAMMING | Hamming distance |
| JACCARD | Jaccard similarity |
| TANIMOTO | Tanimoto coefficient |

### Search Parameters

| Parameter | Description |
|-----------|-------------|
| nprobe | IVF search clusters |
| ef | HNSW search quality |
| search_k | ANNOY parameter |
| limit | Result count |
| offset | Result skip |
| round_decimal | Precision control |
| consistency_level | Read consistency |

### Consistency Levels

| Level | Description |
|-------|-------------|
| Strong | Read latest data |
| Bounded | Bounded staleness |
| Session | Session consistency |
| Eventually | Eventual consistency |

### Data Operations

| Operation | Description |
|-----------|-------------|
| Insert | Add entities |
| Upsert | Update or insert |
| Delete | Remove entities |
| Search | Vector similarity |
| Query | Scalar filtering |
| Flush | Persist data |
| Compact | Space reclaim |
| Load | Load to memory |
| Release | Free memory |

### Collection States

| State | Description |
|-------|-------------|
| NotExist | Collection not created |
| NotLoaded | Created but not loaded |
| Loading | Currently loading |
| Loaded | Ready for search |
| InMemory | Loaded state |

### Schema Components

| Component | Description |
|-----------|-------------|
| FieldSchema | Field definition |
| CollectionSchema | Collection structure |
| DataType | Field data type |
| Primary key | Unique identifier |
| Auto ID | Automatic ID generation |
| Dynamic field | Schema flexibility |

### Partition Concepts

| Concept | Description |
|---------|-------------|
| Partition key | Partitioning field |
| Partition name | Partition identifier |
| Partition count | Number of partitions |
| Default partition | Unnamed partition |

### Performance Features

| Feature | Description |
|---------|-------------|
| Replica | Query redundancy |
| Load balance | Query distribution |
| Index cache | Memory caching |
| Query node | Search processing |
| Data node | Storage management |
| Segment | Storage unit |
| Sealed segment | Immutable segment |
| Growing segment | Active segment |
