# 101 ChromaDB Commands

## Overview
ChromaDB is an open-source vector database designed for storing, retrieving, and managing embeddings (vector representations of data). It provides a simple interface for AI applications that need semantic search, retrieval augmented generation (RAG), and memory capabilities. ChromaDB is particularly useful for large language model (LLM) applications, recommendation systems, and semantic search engines.

## Target Audience
- AI/ML engineers developing applications with vector embeddings
- Full-stack developers working with LLMs
- Data scientists implementing semantic search
- Backend developers building RAG systems
- Anyone looking to integrate vector search into their applications

## Command Categories

### 1. Installation and Setup (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `pip install chromadb` | Install Chroma Python client | Adding Chroma to Python projects | `pip install chromadb -U` (update to latest) |
| `npm install chromadb` | Install Chroma JavaScript client | Adding Chroma to JavaScript projects | `npm install chromadb --save` |
| `docker run chromadb/chroma` | Run Chroma in Docker | Running server instance | `docker run -p 8000:8000 chromadb/chroma` |
| `docker run chromadb/chroma` | Run with data persistence | Maintaining data between restarts | `docker run -p 8000:8000 -v /path/data:/chroma/chroma chromadb/chroma` |
| `chroma run` | Run Chroma CLI server | Local development server | `chroma run --path /chroma_db_path` |

### 2. Client Connection (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `import chromadb` | Import Chroma library | Required in all Python scripts | `import chromadb` |
| `client = chromadb.Client()` | Create in-memory client | Quick prototyping | `client = chromadb.Client()` |
| `client = chromadb.PersistentClient()` | Create persistent client | Local persistence | `client = chromadb.PersistentClient(path="db_path")` |
| `client = chromadb.HttpClient()` | Connect to server | Production deployment | `client = chromadb.HttpClient(host="localhost", port=8000)` |
| `from chromadb.config import Settings` | Import Settings class | Client configuration | `Settings(chroma_db_impl="duckdb+parquet", persist_directory="path")` |

### 3. Collection Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `collection = client.create_collection()` | Create a collection | Starting a new collection | `client.create_collection(name="documents")` |
| `collection = client.get_collection()` | Get existing collection | Accessing a collection | `client.get_collection(name="documents")` |
| `collection = client.get_or_create_collection()` | Get or create collection | Ensuring collection exists | `client.get_or_create_collection(name="documents")` |
| `collections = client.list_collections()` | List all collections | Managing collections | `collections = client.list_collections()` |
| `client.delete_collection()` | Delete a collection | Removing unused data | `client.delete_collection(name="documents")` |
| `collection.count()` | Count items in collection | Measuring collection size | `document_count = collection.count()` |
| `collection.modify()` | Modify collection settings | Updating metadata | `collection.modify(name="new_name")` |
| `collection.peek()` | Preview collection data | Quick inspection | `collection.peek(limit=5)` |
| `collection_with_ef = client.create_collection()` | Create with embedding function | Custom embedding model | `client.create_collection(name="docs", embedding_function=ef)` |
| `collection_with_metadata = client.create_collection()` | Create with custom metadata | Specialized distance metrics | `client.create_collection(name="docs", metadata={"hnsw:space": "cosine"})` |

### 4. Adding and Updating Data (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `collection.add()` | Add documents to collection | Store new items | `collection.add(documents=["doc1", "doc2"], ids=["id1", "id2"])` |
| `collection.add()` | Add with metadata | Filtering capability | `collection.add(documents=["doc"], metadatas=[{"source": "web"}], ids=["id1"])` |
| `collection.add()` | Add with custom embeddings | Pre-computed vectors | `collection.add(embeddings=[[0.1, 0.2]], ids=["id1"])` |
| `collection.add()` | Add with documents and embeddings | Override default embedding | `collection.add(documents=["doc"], embeddings=[[0.1, 0.2]], ids=["id1"])` |
| `collection.add()` | Batch add | Efficient bulk insertion | `collection.add(documents=["d1", "d2", "d3"], ids=["1", "2", "3"])` |
| `collection.update()` | Update documents | Change document content | `collection.update(ids=["id1"], documents=["new text"])` |
| `collection.update()` | Update embeddings | Change vector representation | `collection.update(ids=["id1"], embeddings=[[0.3, 0.4]])` |
| `collection.update()` | Update metadata | Change filtering attributes | `collection.update(ids=["id1"], metadatas=[{"source": "book"}])` |
| `collection.update()` | Update document and metadata | Multiple property update | `collection.update(ids=["id1"], documents=["new"], metadatas=[{"key": "val"}])` |
| `collection.upsert()` | Insert or update | Add if new, update if exists | `collection.upsert(documents=["doc"], ids=["id1"])` |
| `collection.delete()` | Delete by IDs | Remove specific items | `collection.delete(ids=["id1", "id2"])` |
| `collection.delete()` | Delete by metadata filter | Batch deletion by criteria | `collection.delete(where={"source": "web"})` |
| `collection.delete()` | Delete by content filter | Remove based on content | `collection.delete(where_document={"$contains": "outdated"})` |
| `client.reset()` | Reset entire database | Complete data cleanup | `client.reset()` (use with caution!) |
| `collection = client.create_collection(name="name", metadata={"hnsw:space": "l2"})` | Create with distance type | Change similarity metric | `metadata={"hnsw:space": "cosine"}` or `"ip"` (inner product) |

### 5. Querying Data (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `collection.query()` | Query by text | Find similar documents | `collection.query(query_texts=["search query"], n_results=5)` |
| `collection.query()` | Query by embeddings | Find similar vectors | `collection.query(query_embeddings=[[0.1, 0.2]], n_results=5)` |
| `collection.query()` | Query with metadata filter | Filtered similarity search | `collection.query(query_texts=["query"], where={"source": "web"})` |
| `collection.query()` | Query with document filter | Content-based filtering | `collection.query(query_texts=["q"], where_document={"$contains": "term"})` |
| `collection.query()` | Query with multiple filters | Complex filtering | `collection.query(query_texts=["q"], where={"source": "web"}, where_document={"$contains": "term"})` |
| `collection.query()` | Limit results | Control result count | `collection.query(query_texts=["q"], n_results=10)` |
| `collection.query()` | Include embeddings | Get vector data | `collection.query(query_texts=["q"], include=["embeddings"])` |
| `collection.query()` | Include documents | Get document text | `collection.query(query_texts=["q"], include=["documents"])` |
| `collection.query()` | Include metadata | Get metadata fields | `collection.query(query_texts=["q"], include=["metadatas"])` |
| `collection.query()` | Include distances | Get similarity scores | `collection.query(query_texts=["q"], include=["distances"])` |
| `collection.get()` | Get all items | Retrieve entire collection | `collection.get()` |
| `collection.get()` | Get by IDs | Retrieve specific items | `collection.get(ids=["id1", "id2"])` |
| `collection.get()` | Get with metadata filter | Filtered retrieval | `collection.get(where={"source": "web"})` |
| `collection.get()` | Get with document filter | Content-based retrieval | `collection.get(where_document={"$contains": "term"})` |
| `collection.get()` | Selective field retrieval | Control returned fields | `collection.get(include=["documents", "metadatas"])` |

### 6. Metadata Filtering (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `where={"key": "value"}` | Exact match filter | Equal comparison | `where={"category": "finance"}` |
| `where={"key": {"$eq": "value"}}` | Equality operator | Explicit equal comparison | `where={"category": {"$eq": "finance"}}` |
| `where={"key": {"$ne": "value"}}` | Not equal operator | Excluding specific values | `where={"category": {"$ne": "politics"}}` |
| `where={"key": {"$gt": value}}` | Greater than | Numeric comparison | `where={"year": {"$gt": 2020}}` |
| `where={"key": {"$gte": value}}` | Greater than or equal | Inclusive numeric comparison | `where={"year": {"$gte": 2020}}` |
| `where={"key": {"$lt": value}}` | Less than | Numeric comparison | `where={"year": {"$lt": 2020}}` |
| `where={"key": {"$lte": value}}` | Less than or equal | Inclusive numeric comparison | `where={"year": {"$lte": 2020}}` |
| `where={"key": {"$in": [values]}}` | In list operator | Multiple allowed values | `where={"category": {"$in": ["finance", "economics"]}}` |
| `where={"key": {"$nin": [values]}}` | Not in list operator | Multiple excluded values | `where={"category": {"$nin": ["politics", "sports"]}}` |
| `where={"$and": [conditions]}` | Logical AND | Multiple condition matching | `where={"$and": [{"year": {"$gte": 2020}}, {"category": "finance"}]}` |
| `where={"$or": [conditions]}` | Logical OR | Any condition matching | `where={"$or": [{"category": "finance"}, {"category": "economics"}]}` |
| `where_document={"$contains": "text"}` | Document contains | Text content filtering | `where_document={"$contains": "bitcoin"}` |
| `where_document={"$contains_any": ["texts"]}` | Contains any | Any text matching | `where_document={"$contains_any": ["bitcoin", "ethereum"]}` |
| `where_document={"$contains_all": ["texts"]}` | Contains all | All text matching | `where_document={"$contains_all": ["bitcoin", "investment"]}` |
| `where_document={"$not_contains": "text"}` | Not contains | Text exclusion | `where_document={"$not_contains": "outdated"}` |

### 7. Embedding Functions (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `from chromadb.utils.embedding_functions import SentenceTransformerEmbeddingFunction` | Import sentence transformer | Default embedding function | `from chromadb.utils.embedding_functions import SentenceTransformerEmbeddingFunction` |
| `ef = SentenceTransformerEmbeddingFunction()` | Create default embedding function | Standard text embeddings | `ef = SentenceTransformerEmbeddingFunction()` |
| `ef = SentenceTransformerEmbeddingFunction(model_name="all-MiniLM-L6-v2")` | Specify model | Custom embedding model | `ef = SentenceTransformerEmbeddingFunction(model_name="all-mpnet-base-v2")` |
| `from chromadb.utils.embedding_functions import OpenAIEmbeddingFunction` | Import OpenAI function | Using OpenAI embeddings | `from chromadb.utils.embedding_functions import OpenAIEmbeddingFunction` |
| `ef = OpenAIEmbeddingFunction(api_key, model_name)` | Create OpenAI function | Production-quality embeddings | `ef = OpenAIEmbeddingFunction(api_key="key", model_name="text-embedding-ada-002")` |
| `from chromadb.utils.embedding_functions import CohereEmbeddingFunction` | Import Cohere function | Using Cohere embeddings | `from chromadb.utils.embedding_functions import CohereEmbeddingFunction` |
| `ef = CohereEmbeddingFunction(api_key)` | Create Cohere function | Alternative embedding provider | `ef = CohereEmbeddingFunction(api_key="key")` |
| `class CustomEmbeddingFunction(EmbeddingFunction):` | Create custom function | Special embedding needs | `class CustomEF(EmbeddingFunction): def __call__(self, texts): ...` |
| `collection = client.create_collection(name="docs", embedding_function=ef)` | Assign embedding function | Specialized embeddings | `collection = client.create_collection(name="docs", embedding_function=ef)` |
| `collection = client.get_collection(name="name", embedding_function=ef)` | Set function on retrieval | Consistent embeddings | `collection = client.get_collection(name="docs", embedding_function=ef)` |

### 8. Integration with Libraries (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `from langchain.vectorstores import Chroma` | Import LangChain integration | Using with LangChain | `from langchain.vectorstores import Chroma` |
| `from langchain.embeddings import HuggingFaceEmbeddings` | Import HF embeddings | Embedding with LangChain | `from langchain.embeddings import HuggingFaceEmbeddings` |
| `embeddings = HuggingFaceEmbeddings()` | Create embedding model | Text to vector conversion | `embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")` |
| `db = Chroma.from_documents(docs, embeddings)` | Create from documents | Populating vector store | `db = Chroma.from_documents(documents, embeddings)` |
| `db = Chroma(embedding_function=embeddings, persist_directory="path")` | Create with persistence | Stored vector database | `db = Chroma(embedding_function=emb, persist_directory="./chroma_db")` |
| `docs = db.similarity_search("query")` | Similarity search | Finding similar docs | `docs = db.similarity_search("bitcoin investing", k=5)` |
| `retriever = db.as_retriever()` | Create retriever | For LLM context | `retriever = db.as_retriever(search_kwargs={"k": 5})` |
| `from langchain.chains import RetrievalQA` | Import RetrievalQA | RAG implementation | `from langchain.chains import RetrievalQA` |
| `from langchain.llms import OpenAI` | Import OpenAI LLM | LLM integration | `from langchain.llms import OpenAI` |
| `qa = RetrievalQA.from_chain_type(llm=OpenAI(), retriever=retriever)` | Create QA chain | Complete RAG pipeline | `result = qa.run("How do I invest in bitcoin?")` |

### 9. Performance Tuning (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `collection = client.create_collection(name="docs", metadata={"hnsw:space": "l2"})` | L2 distance metric | Euclidean distance | `metadata={"hnsw:space": "l2"}` |
| `collection = client.create_collection(name="docs", metadata={"hnsw:space": "ip"})` | Inner product metric | Dot product similarity | `metadata={"hnsw:space": "ip"}` |
| `collection = client.create_collection(name="docs", metadata={"hnsw:space": "cosine"})` | Cosine similarity metric | Angular distance | `metadata={"hnsw:space": "cosine"}` |
| `collection = client.create_collection(name="docs", metadata={"hnsw:construction_ef": 100})` | HNSW construction EF | Build quality tuning | `metadata={"hnsw:construction_ef": 100}` |
| `collection = client.create_collection(name="docs", metadata={"hnsw:search_ef": 50})` | HNSW search EF | Query quality tuning | `metadata={"hnsw:search_ef": 50}` |
| `collection = client.create_collection(name="docs", metadata={"hnsw:M": 16})` | HNSW M parameter | Graph connectivity | `metadata={"hnsw:M": 16}` |
| `collection = client.create_collection(name="docs", metadata={"anonymized_telemetry": False})` | Disable telemetry | Privacy enhancement | `metadata={"anonymized_telemetry": False}` |
| `client = chromadb.Client(Settings(anonymized_telemetry=False))` | Client telemetry | Global telemetry setting | `client = chromadb.Client(Settings(anonymized_telemetry=False))` |

### 10. Administration and Security (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| `client = chromadb.HttpClient(host="localhost", port=8000, ssl=True)` | SSL connection | Secure connection | `client = chromadb.HttpClient(host="localhost", port=8000, ssl=True)` |
| `client = chromadb.HttpClient(host="localhost", port=8000, headers={"Authorization": "Bearer token"})` | Authentication headers | Secure API access | `client = chromadb.HttpClient(headers={"Authorization": "Bearer xyz"})` |
| `docker run -e CHROMA_SERVER_AUTH_CREDENTIALS_FILE=/path/to/auth.json chromadb/chroma` | Docker auth file | Server authentication | `docker run -e CHROMA_SERVER_AUTH_CREDENTIALS_FILE=/auth.json ...` |
| `docker run -e CHROMA_SERVER_AUTH_CREDENTIALS="admin:password" chromadb/chroma` | Docker basic auth | Simple authentication | `docker run -e CHROMA_SERVER_AUTH_CREDENTIALS="user:pass" ...` |
| `docker run -e CHROMA_SERVER_AUTH_PROVIDER="token" -e CHROMA_SERVER_AUTH_TOKEN_TRANSPORT_HEADER="Authorization" chromadb/chroma` | Token-based auth | JWT authentication | `CHROMA_SERVER_AUTH_TOKEN_TRANSPORT_HEADER="Authorization"` |
| `client.heartbeat()` | Server heartbeat | Check server status | `status = client.heartbeat()` |
| `client.get_version()` | Get Chroma version | Version checking | `version = client.get_version()` |
| `import chromadb; print(chromadb.__version__)` | Get client version | Client version checking | `print(chromadb.__version__)` |

## Best Practices

* Always specify IDs when adding documents for better control
* Use metadata for filtering to improve query performance
* Choose the appropriate similarity metric for your use case
* Batch operations when possible for better performance
* Set up persistence for production deployments
* Properly handle embeddings larger than 1536 dimensions
* Implement error handling around API calls
* Consider resource requirements for large collections

## Additional Resources
* [ChromaDB Official Documentation](https://docs.trychroma.com/)
* [ChromaDB GitHub Repository](https://github.com/chroma-core/chroma)
* [ChromaDB API Reference](https://docs.trychroma.com/reference/Client)
* [LangChain + ChromaDB Integration](https://python.langchain.com/docs/integrations/vectorstores/chroma)
* [ChromaDB Discord Community](https://discord.gg/MMeYNTmh3x)

## ChromaDB Mini-Glossary

This glossary explains common terms, acronyms, and concepts you'll encounter when using ChromaDB.

### Common Terms

| Term | Description |
|------|-------------|
| `embedding` | A numerical vector representation of text, images, or other data |
| `vector database` | A database optimized for storing and querying vector embeddings |
| `collection` | A container for storing embeddings, similar to a table in SQL |
| `similarity search` | Finding vectors that are closest to a query vector |
| `RAG` | Retrieval Augmented Generation - using retrieved documents to enhance LLM responses |
| `cosine similarity` | Similarity measure based on the cosine of the angle between vectors |
| `Euclidean distance` | Similarity measure based on the straight-line distance between vectors |
| `inner product` | Similarity measure based on the dot product of vectors |
| `HNSW` | Hierarchical Navigable Small World - an algorithm for approximate nearest neighbor search |
| `ANN` | Approximate Nearest Neighbor - algorithms that find similar vectors efficiently |
| `persistence` | Storing data between application restarts |
| `metadata` | Additional information attached to embeddings for filtering |
| `embedding function` | A function that converts raw data into vector embeddings |
| `embedding model` | A machine learning model that creates embeddings from text or other data |

### Parameter Terminology

| Parameter | Description | Common Values |
|-----------|-------------|--------------|
| `n_results` | Number of similar results to return | 5, 10, 20 |
| `include` | Fields to include in results | ["documents", "embeddings", "metadatas", "distances"] |
| `where` | Metadata filter conditions | {"key": "value"}, {"key": {"$gt": value}} |
| `where_document` | Document content filter conditions | {"$contains": "text"}, {"$contains_all": ["text1", "text2"]} |
| `hnsw:space` | Distance metric for similarity | "cosine", "l2", "ip" |
| `hnsw:construction_ef` | HNSW build-time search depth | 100, 200 |
| `hnsw:search_ef` | HNSW query-time search depth | 50, 100 |
| `hnsw:M` | HNSW max connections per node | 16, 32, 64 |

### Understanding ChromaDB Architecture

ChromaDB has a multi-layered architecture:
```
Client Layer      → Python/JS API that applications interact with
Embedding Layer   → Converts raw data to vector representations
Index Layer       → Manages vector storage and retrieval
Persistence Layer → Handles data storage (in-memory, disk, database)
```

The client connects to these layers either directly (in-memory/persistent client) or via HTTP (client-server model), allowing flexible deployment options from local development to production systems.
