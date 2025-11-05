# 101 Pinecone Vector Database Commands

## Overview
Pinecone is a managed vector database designed for machine learning applications, particularly for similarity search and recommendation systems. This cheat sheet covers essential Pinecone commands for vector operations, indexing, querying, and managing vector embeddings at scale. These commands help developers, data scientists, and ML engineers leverage vector databases for applications like semantic search, recommendation engines, image similarity, and other AI-powered features.

## Target Audience
- Machine learning engineers
- Data scientists
- AI application developers
- MLOps engineers
- Search and recommendation system developers
- NLP specialists
- Computer vision engineers

## Command Categories

### 1. Connection and Authentication (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `pinecone.init()` | Initialize Pinecone client | Connecting to Pinecone | `pinecone.init(api_key="your-api-key", environment="us-west1-gcp")` |
| `pinecone.whoami()` | Show current user | Verifying authentication | `pinecone.whoami()` |
| `pinecone.list_indexes()` | List all indexes | Viewing available indexes | `pinecone.list_indexes()` |
| `pc = pinecone.Pinecone()` | Initialize client (new API) | Connecting with new API | `pc = pinecone.Pinecone(api_key="your-api-key")` |
| `pc.list_indexes()` | List indexes (new API) | Viewing indexes | `pc.list_indexes()` |
| `index = pc.Index()` | Connect to index | Accessing specific index | `index = pc.Index("my-index")` |
| `pinecone.create_index()` | Legacy API for index creation | Creating a new index | `pinecone.create_index(name="my-index", dimension=768)` |
| `pinecone.describe_index()` | Get index details | Checking index configuration | `pinecone.describe_index("my-index")` |

### 2. Index Operations (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `pc.create_index()` | Create new index | Setting up vector storage | `pc.create_index(name="my-index", dimension=768, metric="cosine")` |
| `pc.delete_index()` | Delete an index | Removing vector storage | `pc.delete_index("my-index")` |
| `pc.describe_index()` | Get index details | Viewing index configuration | `pc.describe_index("my-index")` |
| `index.describe_index_stats()` | Get index statistics | Understanding index metrics | `index.describe_index_stats()` |
| `pinecone.create_collection()` | Create collection | Grouping related indexes | `pinecone.create_collection(name="my-collection", source_index="my-index")` |
| `pinecone.list_collections()` | List collections | Viewing available collections | `pinecone.list_collections()` |
| `pinecone.describe_collection()` | Get collection details | Checking collection config | `pinecone.describe_collection("my-collection")` |
| `pinecone.delete_collection()` | Delete a collection | Removing collections | `pinecone.delete_collection("my-collection")` |
| `spec = pc.IndexSpec()` | Create index specification | Defining index properties | `spec = pc.IndexSpec(dimension=768, metric="cosine")` |
| `pod_spec = pc.PodSpec()` | Define pod specification | Setting pod properties | `pod_spec = pc.PodSpec(environment="us-east-1", replicas=2)` |
| `serverless_spec = pc.ServerlessSpec()` | Define serverless spec | Setting serverless properties | `serverless_spec = pc.ServerlessSpec(cloud="aws", region="us-east-1")` |
| `pc.create_index(spec, pod_spec)` | Create with detailed spec | Advanced index creation | `pc.create_index("my-index", spec, pod_spec)` |
| `pc.create_index(spec, serverless_spec)` | Create serverless index | Serverless deployment | `pc.create_index("my-index", spec, serverless_spec)` |
| `pc.configure_index()` | Update index config | Changing index settings | `pc.configure_index("my-index", replicas=3)` |
| `index.scale_replicas()` | Scale index replicas | Performance optimization | `index.scale_replicas(replicas=3)` |

### 3. Vector Operations - Upsert (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `index.upsert()` | Insert/update vectors | Adding data to index | `index.upsert(vectors=[{"id": "vec1", "values": [0.1, 0.2]}])` |
| `index.upsert_from_dataframe()` | Upsert from DataFrame | Bulk vector loading | `index.upsert_from_dataframe(df, "id_column", "vector_column")` |
| `index.upsert_from_files()` | Upsert from files | Loading from disk | `index.upsert_from_files(["vectors.json"])` |
| `batch_size` parameter | Control batch size | Performance tuning | `index.upsert(vectors=vectors, batch_size=100)` |
| `async_req` parameter | Asynchronous requests | Non-blocking operations | `index.upsert(vectors=vectors, async_req=True)` |
| `show_progress` parameter | Display progress bar | Monitoring upsert progress | `index.upsert(vectors=vectors, show_progress=True)` |
| `namespace` parameter | Use namespaces | Logical data partitioning | `index.upsert(vectors=vectors, namespace="products")` |
| `sparse_values` parameter | Include sparse vectors | Hybrid search support | `index.upsert(vectors=[{"id": "vec1", "values": [0.1, 0.2], "sparse_values": {"indices": [0, 2], "values": [0.5, 0.3]}}])` |
| `index.upsert_with_metadata()` | Legacy API for metadata | Including metadata with vectors | `index.upsert_with_metadata(id="vec1", vector=[0.1, 0.2], metadata={"category": "electronics"})` |
| `filter_metadata` parameter | Filter metadata | Applying metadata filters | `index.upsert(vectors=vectors, filter_metadata={"brand": "Apple"})` |
| `tuples_with_vectors` | Tuple style upsert | Alternative format | `index.upsert([("vec1", [0.1, 0.2], {"category": "electronics"})])` |
| `index._upsert_grpc()` | Low-level gRPC upsert | Advanced performance | `index._upsert_grpc(vectors=vectors)` |

### 4. Vector Operations - Fetch and Delete (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `index.fetch()` | Retrieve vectors by ID | Getting specific vectors | `index.fetch(ids=["vec1", "vec2"])` |
| `index.fetch_with_metadata()` | Legacy API for fetch | Getting vectors with metadata | `index.fetch_with_metadata(ids=["vec1"])` |
| `index.delete()` | Delete vectors by ID | Removing specific vectors | `index.delete(ids=["vec1", "vec2"])` |
| `index.delete(delete_all=True)` | Delete all vectors | Complete index clearing | `index.delete(delete_all=True)` |
| `index.delete(filter=filter_obj)` | Delete by filter | Selective deletion | `index.delete(filter={"category": "outdated"})` |
| `index.delete(namespace="products")` | Delete by namespace | Namespace-specific deletion | `index.delete(namespace="products")` |
| `index.update()` | Update vector values | Modifying existing vectors | `index.update(id="vec1", values=[0.3, 0.4])` |
| `index.update_with_metadata()` | Legacy API for update | Updating vectors with metadata | `index.update_with_metadata(id="vec1", values=[0.3, 0.4], metadata={"category": "updated"})` |
| `index.batch_delete()` | Legacy API for batch deletion | Removing multiple vectors | `index.batch_delete(ids=["vec1", "vec2"])` |
| `index.fetch_all()` | Get all vectors | Retrieving entire index | `vectors = index.fetch_all()` |

### 5. Vector Operations - Query and Search (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `index.query()` | Find similar vectors | Similarity search | `index.query(vector=[0.1, 0.2], top_k=10)` |
| `index.query_with_metadata()` | Legacy API for query | Search with metadata | `index.query_with_metadata(vector=[0.1, 0.2], top_k=10)` |
| `index.query_by_id()` | Query using vector ID | Finding similar to existing | `index.query_by_id(id="vec1", top_k=10)` |
| `index.query(include_values=True)` | Include vector values | Getting complete vectors | `index.query(vector=[0.1, 0.2], top_k=10, include_values=True)` |
| `index.query(include_metadata=True)` | Include metadata | Getting vector metadata | `index.query(vector=[0.1, 0.2], top_k=10, include_metadata=True)` |
| `index.query(filter=filter_obj)` | Query with filters | Constrained search | `index.query(vector=[0.1, 0.2], filter={"category": "electronics"})` |
| `index.query(namespace="products")` | Query in namespace | Namespace-specific search | `index.query(vector=[0.1, 0.2], namespace="products")` |
| `index.query(sparse_vector=sparse)` | Query with sparse vector | Hybrid search | `index.query(vector=[0.1, 0.2], sparse_vector={"indices": [0, 2], "values": [0.5, 0.3]})` |
| `alpha` parameter | Control sparse influence | Adjusting hybrid search | `index.query(vector=[0.1, 0.2], sparse_vector=sparse, alpha=0.5)` |
| `index._query_grpc()` | Low-level gRPC query | Advanced performance | `index._query_grpc(vector=[0.1, 0.2])` |
| `index.query_with_scores()` | Legacy API for scores | Returning similarity scores | `index.query_with_scores(vector=[0.1, 0.2], top_k=10)` |
| `nprobes` parameter | Adjust query precision | Query-time performance tuning | `index.query(vector=[0.1, 0.2], nprobes=20)` |
| `index.query_by_vector()` | Legacy API for query | Query by vector | `index.query_by_vector(vector=[0.1, 0.2], top_k=10)` |
| `index.query_in_batches()` | Custom batch querying | Processing large query sets | `results = index.query_in_batches(query_vectors, batch_size=100)` |
| `index.query_with_timeout()` | Set query timeout | Handling timeouts gracefully | `index.query_with_timeout(vector=[0.1, 0.2], timeout=5.0)` |

### 6. Metadata Filtering (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `{"field": value}` | Exact match filter | Finding exact matches | `index.query(vector=vec, filter={"category": "electronics"})` |
| `{"field": {"$eq": value}}` | Equality operator | Equivalent to exact match | `index.query(vector=vec, filter={"price": {"$eq": 299}})` |
| `{"field": {"$ne": value}}` | Not equal operator | Exclusion filtering | `index.query(vector=vec, filter={"category": {"$ne": "outdated"}})` |
| `{"field": {"$gt": value}}` | Greater than | Numerical range filtering | `index.query(vector=vec, filter={"price": {"$gt": 100}})` |
| `{"field": {"$gte": value}}` | Greater than or equal | Inclusive range filtering | `index.query(vector=vec, filter={"price": {"$gte": 100}})` |
| `{"field": {"$lt": value}}` | Less than | Numerical range filtering | `index.query(vector=vec, filter={"price": {"$lt": 500}})` |
| `{"field": {"$lte": value}}` | Less than or equal | Inclusive range filtering | `index.query(vector=vec, filter={"price": {"$lte": 500}})` |
| `{"field": {"$in": [values]}}` | In list operator | Multiple possible values | `index.query(vector=vec, filter={"category": {"$in": ["phones", "tablets"]}})` |
| `{"field": {"$nin": [values]}}` | Not in list operator | Multiple excluded values | `index.query(vector=vec, filter={"category": {"$nin": ["outdated", "discontinued"]}})` |
| `{"$and": [filters]}` | Logical AND | Combining multiple filters | `index.query(vector=vec, filter={"$and": [{"price": {"$gt": 100}}, {"category": "electronics"}]})` |

### 7. Advanced Metadata Filtering (6)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `{"$or": [filters]}` | Logical OR | Alternative criteria | `index.query(vector=vec, filter={"$or": [{"category": "phones"}, {"category": "tablets"}]})` |
| `{"field": {"$exists": true}}` | Field exists | Checking field presence | `index.query(vector=vec, filter={"description": {"$exists": true}})` |
| `{"field": {"$regex": pattern}}` | Regex match | Pattern matching (serverless only) | `index.query(vector=vec, filter={"name": {"$regex": "^iP"}})` |
| `{"field": {"$contains": substring}}` | Contains substring | Text searching (serverless only) | `index.query(vector=vec, filter={"description": {"$contains": "wireless"}})` |
| `{"field": {"$containsAny": [values]}}` | Contains any | Array overlap check | `index.query(vector=vec, filter={"tags": {"$containsAny": ["premium", "sale"]}})` |
| `{"field": {"$containsAll": [values]}}` | Contains all | Array subset check | `index.query(vector=vec, filter={"tags": {"$containsAll": ["smartphone", "5G"]}})` |

### 8. Python SDK Utilities (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `pinecone.create_model()` | Create embedding model | Vector generation | `model = pinecone.create_model("text-embedding-ada-002")` |
| `model.embed_documents()` | Create document embeddings | Text vectorization | `embeddings = model.embed_documents(["query text"])` |
| `model.embed_queries()` | Create query embeddings | Query vectorization | `query_vector = model.embed_queries(["search query"])` |
| `pinecone.Index.from_existing()` | Create index from existing | Using existing index | `index = pinecone.Index.from_existing("my-index")` |
| `pinecone.GRPCIndex()` | Create gRPC index | Performance optimization | `index = pinecone.GRPCIndex("my-index")` |
| `pinecone.control_plane_api` | Access control plane | Admin operations | `pinecone.control_plane_api.list_indexes()` |
| `pinecone.data_plane_api` | Access data plane | Data operations | `pinecone.data_plane_api.query(...)` |
| `pinecone.__version__` | Get SDK version | Version checking | `print(pinecone.__version__)` |

### 9. Administration and Management (7)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `pinecone.create_service_token()` | Create API token | Access management | `pinecone.create_service_token(name="read-only", expires_in=2592000)` |
| `pinecone.list_service_tokens()` | List all tokens | Token management | `pinecone.list_service_tokens()` |
| `pinecone.delete_service_token()` | Delete API token | Revoking access | `pinecone.delete_service_token(value="st-...")` |
| `pinecone.create_project()` | Create new project | Project management | `pinecone.create_project(name="my-project")` |
| `pinecone.list_projects()` | List all projects | Project overview | `pinecone.list_projects()` |
| `pinecone.delete_project()` | Delete project | Project cleanup | `pinecone.delete_project(project_id="p-...")` |
| `pinecone.configure_index_controller()` | Configure controller | Advanced administration | `pinecone.configure_index_controller(name="my-index", config={"max_replicas": 5})` |

### 10. Monitoring and Operations (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `index.describe_index_stats()` | Get detailed stats | Monitoring index size/usage | `stats = index.describe_index_stats()` |
| `"namespaces"` property | Access namespace stats | Namespace size monitoring | `namespace_stats = index.describe_index_stats()["namespaces"]` |
| `"dimension"` property | Check vector dimension | Configuration validation | `dimension = index.describe_index_stats()["dimension"]` |
| `"total_vector_count"` property | Count all vectors | Size monitoring | `count = index.describe_index_stats()["total_vector_count"]` |
| `"index_fullness"` property | Check index capacity | Capacity planning | `fullness = index.describe_index_stats()["index_fullness"]` |

### 11. Error Handling and Debugging (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `pinecone.exceptions.PineconeApiException` | API error handling | Catching API errors | `try: ... except pinecone.exceptions.PineconeApiException as e: print(e)` |
| `pinecone.exceptions.PineconeConfigurationError` | Config error handling | Catching config errors | `try: ... except pinecone.exceptions.PineconeConfigurationError as e: print(e)` |
| `pinecone.exceptions.PineconeConnectionError` | Connection error handling | Catching connection errors | `try: ... except pinecone.exceptions.PineconeConnectionError as e: print(e)` |
| `pinecone.debug_tool()` | Debug connectivity | Troubleshooting connection issues | `pinecone.debug_tool()` |
| `pinecone.logging.set_level()` | Set logging level | Adjusting debug information | `pinecone.logging.set_level("DEBUG")` |

## Tips and Best Practices
* Use batching for efficient vector upserts (100-1000 vectors per batch)
* Set appropriate dimensions for your embedding model (e.g., 768 for BERT, 1536 for OpenAI embeddings)
* Use namespaces to logically partition your data
* Create metadata indexes for frequently filtered fields
* Choose the right similarity metric for your use case (cosine, dotproduct, euclidean)
* Use serverless for variable or unpredictable workloads
* Use pod-based indexes for high-throughput applications
* Implement timeouts and error handling for production applications
* Prefer the new Pinecone API (starting with `pc = pinecone.Pinecone()`)
* Monitor index statistics regularly to prevent capacity issues

## Additional Resources
* [Pinecone Documentation](https://docs.pinecone.io/)
* [Pinecone Python Client Reference](https://docs.pinecone.io/reference/python_client)
* [Pinecone Examples Repository](https://github.com/pinecone-io/examples)
* [Pinecone Quickstart Guide](https://docs.pinecone.io/docs/quickstart)
* [Pinecone Serverless Documentation](https://docs.pinecone.io/docs/serverless)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Pinecone and vector databases.

### Common Terms

| Term | Description |
|------|-------------|
| `vector database` | Database optimized for storing and searching vector embeddings |
| `embedding` | Dense vector representation of data (text, images, etc.) |
| `vector` | Numerical representation (array) of data in a high-dimensional space |
| `similarity search` | Finding vectors most similar to a query vector |
| `index` | Main storage unit in Pinecone that contains vectors |
| `namespace` | Logical partition within an index to organize vectors |
| `upsert` | Operation to insert or update vectors in an index |
| `metadata` | Additional information stored with vectors for filtering |
| `top-k` | Number of most similar results to return from a query |
| `pod` | Computational unit in Pinecone's infrastructure |

### Common Flags/Options

| Flag/Option | Common Meaning | Example Usage |
|-------------|----------------|--------------|
| `dimension` | Vector size | `create_index(dimension=768)` |
| `metric` | Similarity measure | `create_index(metric="cosine")` |
| `top_k` | Results to return | `query(vector=vec, top_k=10)` |
| `namespace` | Data partition | `upsert(vectors=vecs, namespace="products")` |
| `include_metadata` | Return metadata | `query(vector=vec, include_metadata=True)` |
| `include_values` | Return vectors | `query(vector=vec, include_values=True)` |
| `filter` | Metadata filter | `query(vector=vec, filter={"category": "electronics"})` |
| `batch_size` | Batch processing size | `upsert(vectors=vecs, batch_size=100)` |
| `async_req` | Non-blocking operation | `upsert(vectors=vecs, async_req=True)` |
| `sparse_vector` | Sparse representation | `query(vector=vec, sparse_vector=sparse)` |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `ANN` | Approximate Nearest Neighbor | Similarity search algorithm type |
| `HNSW` | Hierarchical Navigable Small World | Graph-based indexing algorithm |
| `KNN` | K-Nearest Neighbors | Exact similarity search |
| `SPANN` | Space Partition and Approximate Nearest Neighbor | Hybrid indexing approach |
| `MIPS` | Maximum Inner Product Search | Dot product similarity search |
| `QPS` | Queries Per Second | Performance metric |
| `UPS` | Upserts Per Second | Write performance metric |
| `SLA` | Service Level Agreement | Performance guarantees |
| `GCP` | Google Cloud Platform | Cloud infrastructure option |
| `AWS` | Amazon Web Services | Cloud infrastructure option |

### Special Characters/Syntax

| Symbol/Syntax | Name | Usage |
|---------------|------|-------|
| `$eq` | Equality operator | Filter for exact matching |
| `$ne` | Not equal operator | Filter for exclusion |
| `$gt/$lt` | Greater/less than | Numerical range filters |
| `$in/$nin` | In/not in list | Multiple value filters |
| `$and/$or` | Logical operators | Combining multiple filters |
| `$exists` | Existence check | Field presence filters |
| `$regex` | Regular expression | Pattern matching (serverless only) |
| `$contains` | Contains substring | Text search (serverless only) |
| `$containsAny/$containsAll` | Array operations | Array content filters |
| `{ }` | Curly braces | JSON objects for filters and metadata |

### Command/Function Syntax

Basic syntax pattern for Pinecone operations:
```python
# New API pattern
pc = pinecone.Pinecone(api_key="YOUR_API_KEY")
index = pc.Index("index_name")
index.operation(required_params, optional_params=values)

# Legacy API pattern
pinecone.init(api_key="YOUR_API_KEY", environment="environment")
index = pinecone.Index("index_name")
index.operation(required_params, optional_params=values)
```

* **pc/pinecone**: The client object
* **index**: The index object
* **operation**: The command to perform (query, upsert, etc.)
* **required_params**: Mandatory parameters for the operation
* **optional_params**: Additional parameters to customize behavior

Example with breakdown:
```python
# Query example with filters
results = index.query(
    vector=[0.1, 0.2, 0.3],  # Query vector
    top_k=10,                # Return 10 results
    namespace="products",    # Search in products namespace
    filter={                 # Apply metadata filter
        "category": "electronics",
        "price": {"$lt": 500}
    },
    include_metadata=True    # Return metadata with results
)
```
* `index` is the index object
* `query` is the operation
* `vector` is the query vector
* `top_k`, `namespace`, `filter`, and `include_metadata` are optional parameters
