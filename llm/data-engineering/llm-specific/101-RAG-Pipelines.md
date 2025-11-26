# 101 RAG Pipelines – 2025 Production Edition

The exact cheat sheet used daily by every serious RAG team (OpenAI plugins, LlamaIndex enterprise, LangChain agents, private GPT deployments, etc.).

### 1. Document Ingestion & Chunking (16)
| Command | Purpose | Production Note |
|---------|--------|-----------------|
| from llama_index.core import SimpleDirectoryReader | Load PDFs, docs, CSVs | Most common |
| documents = reader.load_data() | → List[Document] | |
| from langchain.document_loaders import PyPDFLoader, UnstructuredHTMLLoader | Per-format loaders | |
| from unstructured.partition.auto import partition | Best for mixed PDFs | Hi-res + OCR |
| TextSplitter(chunk_size=1024, chunk_overlap=128) | Fixed-size | |
| RecursiveCharacterTextSplitter(separators=["\n\n", "\n", " "]) | Semantic-aware | Default choice |
| from langchain.text_splitter import TokenTextSplitter | Token-exact (tiktoken) | o1, GPT-4o |
| parent-child splitter (chunk_size=400, parent_size=2000) | Retrieve small, synthesize big | Advanced RAG |
| metadata_tagger.add_metadata(doc) | Preserve source, page, date | Critical for citations |
| from llama_index.node_parser import SentenceWindowNodeParser | Sentence ±3 context | Best accuracy 2025 |
| HierarchicalNodeParser(levels=[2048,512,128]) | Multi-scale | LlamaIndex 0.10+ |
| MarkdownHeaderTextSplitter(headers_to_split_on=[("#", "Header 1")]) | Markdown docs | Obsidian, Notion |
| doc.page_content = clean_text(doc.page_content) | Strip boilerplate | |
| doc.metadata["file_hash"] = hashlib.sha256(text.encode()).hexdigest() | Dedupe | |
| nodes = parser.get_nodes_from_documents(documents) | Final output | |
| len(nodes) → should be ~1.3× number of chunks | Rule of thumb | |

### 2. Embedding Models & Storage (14)
| Command | Model | Speed / Quality |
|---------|-------|-----------------|
| sentence-transformers/all-MiniLM-L6-v2 | 384 dim, fastest | Baseline |
| BAAI/bge-large-en-v1.5 | 1024 dim, top-3 public | Most popular 2025 |
| text-embedding-3-large (OpenAI) | 3072 → 1024 optional | Best proprietary |
| voyage-lite-02-instruct | 1024 dim, Voyage AI | Rising star |
| e5-large-v2 (intfloat) | 1024 dim, strong zero-shot | |
| cohere/embed-english-v3 | 1024 dim | |
| from chromadb.utils.embedding_functions import SentenceTransformerEmbeddingFunction | Chroma | |
| from langchain.embeddings import HuggingFaceBgeEmbeddings | LangChain | |
| pgvector extension → CREATE EXTENSION vector; | PostgreSQL | Production default |
| vector_db = Chroma(persist_directory="./chroma", embedding_function=ef) | Local dev | |
| Pinecone(index_name="rag-prod", dimension=1024) | Cloud | |
| Weaviate(url="http://localhost:8080") | Graph + vector | |
| Qdrant(path="./qdrant") | Fast filtering | |
| Milvus(URI="http://milvus:19530") | Highest scale | |

### 3. Indexing Strategies (12)
| Strategy | Command | When to Use |
|----------|--------|-------------|
| Naive RAG | vector_index = VectorStoreIndex.from_documents(docs) | Prototyping |
| Summary Index | SummaryIndex.from_documents(docs) | List-of-things queries |
| Knowledge Graph | KnowledgeGraphIndex(nodes, kg_triple_extract_fn=...) | Relationships |
| Multi-Modal | MultiModalVectorStoreIndex(images + text) | PDFs with figures |
| Hypothetical Questions (HyDE) | generate hypothetical answer → embed that | Poor retrieval queries |
| Query Rewriting | rewriter = CohereRerank() or LLMChain rewrite | Long questions |
| Metadata Filtering | vector_store.query(..., filter={"source": "internal"}) | Multi-tenant |
| Parent-Document Retriever | ParentDocumentRetriever(child_splitter, parent_splitter, vectorstore) | Retrieve full doc |
| Self-Query Retriever | uses LLM to turn query → structured filter | Natural language filters |
| Ensemble Retriever (BM25 + Vector) | EnsembleRetriever(retrievers=[bm25, vector], weights=[0.5, 0.5]) | Best of both |
| Recursive Retrieval (multi-level) | RecursiveRetriever over hierarchical index | Books, codebases |
| Auto-Merging Retriever | merges small chunks at query time | LlamaIndex 0.10+ |

### 4. Advanced Retrieval & Reranking (12)
| Technique | Command | Accuracy Gain |
|-----------|--------|---------------|
| MMR (Maximal Marginal Relevance) | fetch_k=50, lambda_mult=0.5 | +3–5% |
| Contextual Compression | ContextualCompressionRetriever(base_retriever, compressor=LLMChainExtractor) | Removes noise |
| Cohere Rerank v3 | CohereRerank(top_n=5) | +8–12% |
| bge-reranker-large | CrossEncoder("BAAI/bge-reranker-large") | Open-source best |
| FlashRank (nano) | rerank = FlashRankRerank(model="ms-marco-MiniLM-L-12-v2") | 1000× faster |
| Lost in the Middle fix | reorder results by position bias | |
| Query Expansion (HyDE + multi-query) | generate 5 variations → average embeddings | |
| Step-back Prompting | "What is needed to answer X?" → retrieve → answer | Reasoning |
| Reciprocal Rank Fusion (RRF) | for multiple retrievers | |
| LongLLMLingua compression | compress context before LLM | Saves tokens |
| RankGPT (LLM-as-reranker) | sliding window rerank with GPT-4o | SOTA but slow |
| ColBERT late interaction | colbertv2 = ColBERTRetriever() | Future-proof |

### 5. Response Generation & Synthesis (10)
| Command | Model | Use Case |
|---------|-------|---------|
| OpenAI(model="gpt-4o", temperature=0.1) | Best quality | |
| Claude-3.5-Sonnet | Longest context (200k) | |
| Llama-3.1-70B-Instruct (via vLLM/TGI) | Open weights | |
| prompt = rag_template.format(context=..., question=...) | Custom prompt | |
| system: "You are a helpful assistant. Use only provided context." | Prevent hallucination | |
| response = chain.invoke({"question": query}) | LangChain | |
| response = engine.query(query) | LlamaIndex | |
| stream=True | Real-time UI | |
| citations = response.source_nodes | Show sources | |
| guardrails: nemo-guardrails, guidance | Output constraints | |

### 6. Evaluation & Monitoring (12)
| Command | Metric |
|---------|--------|
| ragas eval --dataset testset | Faithfulness, Answer Relevance, Context Precision |
| trulens-eval | Comprehensive framework |
| deepEval | G-Eval, Summarization, etc. |
| ARES (Automated RAG Evaluation) | LLM-as-judge pipeline |
| RAGAS + GPT-4o judge | Current SOTA |
| Uptrain | Open-source alternative |
| Prometheus: rag_retrieval_latency_seconds | |
| Grafana dashboard: retrieval score, latency, token usage | |
| LangSmith tracing | End-to-end |
| Phoenix (Arize) | Open-source observability |
| daily eval cron → alert if MMLU-style drops >2% | |
| canary queries (golden set) every hour | |

### 7. Production Deployment Patterns (10)
| Pattern | Tools |
|---------|-------|
| FastAPI + vLLM backend | Most common 2025 |
| LangServe (LangChain) | Zero-code deploy |
| LlamaIndex + FastAPI | |
| Docker + Kubernetes (Helm chart) | |
| Ray Serve or KServe | Scaling |
| Redis cache for embeddings | |
| pgvector + Postgres + pgml | Full stack in DB |
| Cloud Run / Lambda (with chunk warming) | Serverless |
| Auth via OAuth2 + row-level metadata filtering | Multi-tenant |
| Rate limiting + abuse detection | |

### Final RAG Checklist (Every Production Team Uses This)
- [ ] Chunks < 1024 tokens (or model limit)
- [ ] Overlap ≥ 100 tokens
- [ ] Metadata contains source + page/date
- [ ] Top-k ≥ 20 before reranking
- [ ] Reranker in production (Cohere or bge)
- [ ] Prompt forbids making up facts
- [ ] Citations returned to user
- [ ] Evaluation suite runs daily
- [ ] Latency < 2s end-to-end
- [ ] Fallback to general LLM if no context

## Resources Actually Used in 2025
- LlamaIndex docs → https://docs.llamaindex.ai
- LangChain RAG → https://python.langchain.com/docs/use_cases/question_answering/
- RAGAS → https://docs.ragas.io
- Cohere Rerank → https://cohere.com/rerank
- bge-reranker → https://huggingface.co/BAAI/bge-reranker-large

