# 101 LLM-Specific Data Pipelines – 2025 Real-World Edition

The only cheat sheet that shows exactly how top LLM teams (Anthropic, Cohere, Mistral, xAI, startups) build production-grade data pipelines today.

### 1. Raw Text Ingestion at Scale (12)
| Command | Purpose | Real Teams Use This For |
|---------|--------|--------------------------|
| gsutil -m cp -r gs://source-bucket/*.txt gs://landing/ | Bulk landing | Common Crawl, arXiv, books |
| huggingface_hub.snapshot_download(repo_id="HuggingFaceFW/fineweb", repo_type="dataset") | HF Hub → GCS/S3 | FineWeb, RedPajama |
| datasets.load_dataset("c4", "en", streaming=True) | Streaming mode | No RAM explosion |
| pl.scan_ndjson("s3://bucket/*.jsonl").select(["text"]).sink_parquet("raw/") | JSONL → Parquet | 10× faster than pandas |
| find . -name "*.pdf" | xargs -P 32 -I{} python extract_pdf.py {} | Parallel extraction | |
| unstructured partition --strategy hi_res --pdf_infer_table_structure | PDF → clean markdown | Llama-2, Mistral reports |
| aws s3 sync s3://private-corpus/ s3://llm-raw/ --no-sign-request | Public dumps | The Pile, RedPajama-v2 |
| curl -H "Authorization: Bearer $HF_TOKEN" https://datasets-server.huggingface.co/parquet?... | Direct Parquet | |
| databricks-dolly-15k → dolly.jsonl → gs:// | Open datasets | |
| wikipedia dump → wikiextractor → Parquet | Wikipedia | |
| reddit dump → pushshift.io API → NDJSON | Reddit | |
| spark.read.text("s3a://common-crawl/crawl-data/CC-MAIN-2024-*/**").write.parquet(...) | Spark fallback | >10 TB |

### 2. Deduplication at Document & Line Level (14)
| Command | Purpose | Scale |
|---------|--------|-------|
| pl.scan_parquet("raw/**").with_columns(pl.col("text").n_unique().over("text").alias("dup")).filter(pl.col("dup")==1) | Exact line dedupe | 100B+ lines |
| datasketch MinHash + LSH (minhash-lsh PyPI) | Near-deduplication | FineWeb-Edu, RefRank |
| spark.datasketches HLL for cardinality | Estimate dupes first | |
| python -m dedup.cc_data_dedup --path gs://... --output gs://clean/ --column text | C4 dedupe tool | Google’s exact method |
| exact substring dedupe with suffix arrays (cc_net) | Boilerplate removal | |
| semantic dedupe via sentence-transformers + FAISS | High-quality filter | Llama-3, Claude |
| pl.col("url").str.extract(r"([^/]+)\.html$").alias("domain").n_unique() > threshold | Domain diversity | |
| filter by language: ftfy + fasttext langid | Non-English removal | |
| remove documents <200 or >100k chars | Length filter | Universal |
| remove documents with >5% special chars | Code/artifact filter | |
| Gopher repeat token filter (≥5 same tokens) | Repetition filter | |
| PPL (perplexity) filter with KenLM/GPT-2 | Quality scoring | FineWeb-Edu |
| classifier filter (toxic, PII, hate) via Detoxify | Content safety | |
| URL blocklist + regex (ads, trackers) | Privacy & noise | |

### 3. Tokenization & Chunking for Training (12)
| Command | Description | Used By |
|---------|-------------|---------|
| tiktoken.get_encoding("cl100k_base") | GPT-4o, o1 | OpenAI |
| tokenizer = AutoTokenizer.from_pretrained("meta-llama/Meta-Llama-3-8B") | Llama-3 | Meta |
| sentencepiece train --input=data.txt --model_prefix=spm --vocab_size=32000 | Custom BPE | Mistral, Gemma |
| tokenizer.encode("text") → len() for token count | Stats | |
| datasets.map(tokenizer, batched=True, num_proc=64) | Parallel | |
| chunk to 2048 tokens with 128 overlap | Sliding window | Long-context training |
| pl.scan_parquet().with_columns(pl.col("text").map_elements(tokenizer.encode).list.len()) | Token count in Polars | |
| pack sequences with EleutherAI/gpt-neox packing | No padding waste | |
| hf datasets interleave (FineWeb + StarCoder + ArXiv) | Mixture of sources | |
| weight datasets by quality score (FineWeb-Edu score ≥0.8) | Data mixing | |
| shuffle at document level, then chunk | True randomness | |
| save as .bin + .idx (nanoGPT format) or Hugging Face dataset | Final format | |

### 4. Continual Pretraining / Fine-tuning Pipelines (10)
| Command | Purpose |
|---------|--------|
| accelerate config → multi-GPU/DeepSpeed | Standard setup |
| torchrun --nproc_per_node=8 train.py --deepspeed ds_config.json | Launch |
| lit-gpt or nanoGPT for from-scratch | Small teams |
| axolotl --config axolotl_llama3.yaml | Full fine-tuning framework |
| unsloth for 2× faster fine-tuning | QLoRA on single GPU |
| neftune noise_alpha=5 | Activation noise |
| wandb.init(project="llm-pretrain") | Tracking |
| deepspeed --zero_stage=3 + offload | 70B on 8×A100 |
| fsdp + torch.compile (PyTorch 2.3+) | Native scaling |
| mosaicml/composer for streaming datasets | No disk bottleneck |

### 5. Alignment (DPO, PPO, Reward Modeling) Data Pipelines (8)
| Command | Purpose |
|---------|--------|
| generate preference pairs with LLM-as-a-judge | SFT → DPO |
| trl dpo train --dataset anthropic/hh-rlhf | Direct Preference Optimization |
| reward model: OpenAssistant/reward-model-deberta-v3-large-v2 | Ranking |
| rejection sampling with top-p=0.95 | Simple alignment |
| constitutional AI rules → self-critique | Anthropic method |
| red-teaming dataset (WildGuard, SafeRLHF) | Safety training |
| ppo with trl + accelerate | Classic RLHF |
| merge reward + SFT model with SLiMER | Modern recipe |

### 6. Evaluation & Red-Teaming Pipelines (8)
| Command | Benchmark |
|---------|---------|
| lm-evaluation-harness --model hf --tasks mmlu,hellaswag,arc | Standard eval |
| mt-bench + fastchat judge (gpt-4o) | Chat capability |
| arena-hard, livecodebench, gpqa | Frontier eval |
| wildguardtest, harmbench | Safety |
| multilingual: mgsm, xwinograd | Non-English |
| long-context: needle-in-haystack, infinite-bench | 128k+ |
| tool use: berkeley-function-calling-leaderboard | Agent eval |
| vision-language: mmmu, mathvista | Multimodal |

### 7. Production Serving & Monitoring (8)
| Command | Tool |
|---------|------|
| vllm --model meta-llama/Meta-Llama-3.1-70B-Instruct --tensor-parallel-size 8 | Fast inference |
| tgi --model-id ... --max-total-tokens 131072 | Text Generation Inference |
| openai compatible API wrapper | Drop-in replacement |
| prometheus + grafana (tokens/sec, latency) | Monitoring |
| langfuse or phoenix for tracing | Observability |
| continuous eval (daily MMLU drift) | Guardrails |
| canary deployment with Kubernetes | Zero-downtime |
| pii redaction + prompt injection detection | Safety |

### Final LLM Data Checklist (Used by Dedicated Teams)
- [ ] Exact + near deduplication done  
- [ ] Language, length, quality filters applied  
- [ ] PII / toxic / copyrighted content removed  
- [ ] Token count stats logged  
- [ ] Data mixture weights documented  
- [ ] Random seed fixed & shuffling verified  
- [ ] Final dataset versioned in DVC or Delta Lake  
- [ ] Evaluation suite run on every new version  

## Resources Actually Used in 2025
- FineWeb-Edu pipeline → https://huggingface.co/datasets/HuggingFaceFW/fineweb-edu
- Deduplication toolkit → https://github.com/google-research/deduplicate-text-datasets
- cc_net → https://github.com/facebookresearch/cc_net
- EleutherAI dataset tools → https://github.com/EleutherAI/gpt-neox/tree/main/tools
- Axolotl → https://github.com/OpenAccess-AI-Collective/axolotl
- vLLM → https://github.com/vllm-project/vllm

