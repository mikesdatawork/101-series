# 101 LLM Deployment Commands – 2025 Production Edition

The definitive cheat sheet for deploying LLMs at scale — exactly what teams at OpenAI, Anthropic, Cohere, and enterprise adopters run daily.

## Overview
LLM deployment turns trained models into production APIs, agents, and applications. This sheet covers containerization, inference servers, orchestration, scaling, monitoring, and cost optimization with battle-tested commands from real 2025 stacks.

## Target Audience
- ML engineers deploying inference
- DevOps for AI infrastructure
- Product teams building LLM apps
- SREs monitoring model serving
- Anyone scaling LLMs to users

### 1. Environment & Model Prep — Python + HF (10)
| Command | Description | Common Usage | Examples |
|---------|-------------|--------------|----------|
| pip install torch transformers accelerate bitsandbytes | Core inference stack | Every project | pip install vllm==0.5.0 |
| from transformers import AutoTokenizer, AutoModelForCausalLM | Load model/tokenizer | Baseline | model = AutoModelForCausalLM.from_pretrained("meta-llama/Llama-3.1-8B-Instruct", torch_dtype=torch.bfloat16) |
| tokenizer = AutoTokenizer.from_pretrained("meta-llama/Llama-3.1-8B-Instruct") | Add padding | Required | tokenizer.pad_token = tokenizer.eos_token |
| model.to("cuda") | GPU move | Single GPU | model = model.half() for FP16 |
| import torch; torch.backends.cudnn.benchmark = True | Speedup | Inference | |
| model.eval() | No gradients | Serving | with torch.no_grad(): |
| from safetensors.torch import load_file | Faster loading | Production | state_dict = load_file("model.safetensors") |
| model.save_pretrained("local_model") | Export | Local dev | tokenizer.save_pretrained("local_model") |
| huggingface-cli login | HF Hub push | Sharing | huggingface-cli upload local_model |
| from optimum.intel import INCQuantizer | INT8 quant | Edge | |

### 2. Local Inference Servers — vLLM / TGI / Ollama (12)
| Command | Description | Scale | Examples |
|---------|-------------|-------|----------|
| vllm serve meta-llama/Llama-3.1-8B-Instruct --port 8000 --tensor-parallel-size 1 | Fast OpenAI API | 1–8 GPUs | --max-model-len 8192 --dtype bfloat16 |
| docker run --gpus all -p 8000:8000 vllm/vllm-openai:latest --model meta-llama/Llama-3.1-8B-Instruct | Dockerized | Dev/prod | --trust-remote-code |
| python -m vllm.entrypoints.openai.api_server --model local_model --host 0.0.0.0 | Local API | | |
| text-generation-launcher --model-id meta-llama/Llama-3.1-8B-Instruct --num-shard 4 | TGI (Hugging Face) | Multi-GPU | --quantize bitsandbytes --max-batch-total-tokens 8192 |
| docker run --gpus all -p 8080:80 ghcr.io/huggingface/text-generation-inference:latest --model-id meta-llama/Llama-3.1-8B-Instruct | TGI Docker | | --shm-size 1g |
| ollama serve | Local Ollama server | Desktop | ollama pull llama3.1:8b |
| ollama run llama3.1:8b "Prompt here" | CLI chat | Testing | |
| ollama create mymodel -f Modelfile | Custom Ollama model | Quantized | FROM ./model.gguf |
| curl http://localhost:11434/api/generate -d '{"model": "llama3.1", "prompt": "Hello"}' | Ollama API | | |
| ray llm serve --model meta-llama/Llama-3.1-8B-Instruct --num-replicas 2 | Ray Serve | Distributed | |
| from openai import OpenAI; client = OpenAI(base_url="http://localhost:8000/v1", api_key="dummy") | vLLM OpenAI compat | Client | client.chat.completions.create(...) |
| lit-gpt serve examples/scripts/serving/openai_chat.py | Lightning GPT | | --load gs://bucket/model |

### 3. Containerization & Docker (10)
| Command | Description | Best For |
|---------|-------------|----------|
| FROM nvidia/cuda:12.1-cudnn8-runtime-ubuntu22.04 | Base GPU image | vLLM/TGI |
| RUN pip install vllm torch transformers | Install deps | |
| COPY model/ /model | Add model | |
| CMD ["vllm", "serve", "/model", "--port", "8000"] | Entry point | |
| docker build -t llm-server . | Build | |
| docker run --gpus all -p 8000:8000 llm-server | Run | |
| docker push registry.com/llm-server:v1 | Push | |
| FROM python:3.11-slim | CPU-only | Ollama/TGI CPU |
| ENV NVIDIA_VISIBLE_DEVICES=all | GPU passthrough | |
| docker-compose up -d | Multi-service | With Redis/DB |

### 4. Orchestration & Scaling — Kubernetes / Ray / K8s (12)
| Command | Description | Scale |
|---------|-------------|-------|
| kubectl apply -f llm-deployment.yaml | Deploy K8s | |
| apiVersion: apps/v1 kind: Deployment spec: replicas: 3 | HPA config | |
| resources: limits: nvidia.com/gpu: 1 | GPU allocation | |
| kubectl autoscale deployment llm-server --min=2 --max=10 --cpu-percent=70 | HPA | |
| ray up cluster.yaml | Ray cluster | Multi-node |
| ray job submit --address=http://head:10001 -- python serve.py | Ray jobs | |
| helm install llm-stack ./charts/llm --set model=llama3.1 | Helm chart | |
| kubectl port-forward svc/llm-service 8000:8000 | Local access | |
| from ray import serve; @serve.deployment(num_replicas=4) | Ray Serve Python | |
| serve.run(MyLLMDeployment.bind()) | Bind & run | |
| kubectl rollout status deployment/llm-server | Wait for ready | |
| helm upgrade llm-stack ./charts/llm --set replicas=5 | Scale up | |

### 5. API Gateways & Load Balancing (8)
| Command | Description | Tool |
|---------|-------------|------|
| uvicorn app:app --host 0.0.0.0 --port 8000 --workers 4 | FastAPI basic | |
| from fastapi import FastAPI; app = FastAPI() | Skeleton | |
| @app.post("/generate") async def generate(prompt: str): | Endpoint | |
| nginx.conf: upstream llm { server backend1:8000; server backend2:8000; } | LB | |
| docker run -p 80:80 nginx -v /path/nginx.conf:/etc/nginx/nginx.conf | Nginx Docker | |
| from openai import OpenAI; client = OpenAI(api_key="sk-...", base_url="http://gateway:80/v1") | Proxy compat | |
| kong start | API gateway | Rate limiting |
| traefik enable --providers.docker | Auto-discovery | |

### 6. Monitoring & Observability (10)
| Command | Description | Metrics |
|---------|-------------|---------|
| prometheus --config.file=prometheus.yml | Setup | |
| scrape_configs: - job_name: llm targets: ['llm:8000'] | Scrape | |
| from prometheus_client import Counter, Histogram; requests_total = Counter('requests_total') | Python metrics | |
| requests_total.inc() | Increment | |
| grafana-server | Dashboard | |
| curl -G http://prometheus:9090/api/v1/query --data-urlencode 'query=requests_total' | Query | |
| langsmith trace | LangChain observability | |
| phoenix.launch_app() | Arize Phoenix | Embeddings viz |
| sentry-sdk.init(dsn="...") | Error tracking | |
| datadog-agent run | DD tracing | Latency p95 |

### 7. Cost Optimization & Quantization (8)
| Command | Description | Savings |
|---------|-------------|---------|
| model = AutoModelForCausalLM.from_pretrained(..., load_in_8bit=True) | BitsAndBytes 8-bit | 50% VRAM |
| from optimum.gptq import GPTQQuantizer | 4-bit GPTQ | 75% |
| model = torch.quantization.quantize_dynamic(model, {torch.nn.Linear}, dtype=torch.qint8) | Dynamic | CPU |
| ollama run llama3.1:8b-q4_0 | GGUF quantized | 4GB RAM |
| --quantize awq | AWQ in vLLM | Speed + memory |
| batch_size=32 --max_tokens=512 | Throughput tuning | |
| spot instances on AWS/GCP | Cost | 70% cheaper |
| model.generate(..., do_sample=False, temperature=0) | Deterministic | Cache hits |

### 8. Security & Guardrails (8)
| Command | Description | Check |
|---------|-------------|-------|
| from transformers import pipeline; classifier = pipeline("text-classification", model="unitary/toxic-bert") | Toxicity | |
| if classifier(text)[0]['score'] > 0.8: reject | Filter | |
| prompt_guard = PromptGuard.from_pretrained("microsoft/DialoGPT-medium") | Prompt injection | |
| from guardrails import Guard | Output schema | |
| PII detection: spacy load en_core_web_sm; doc = nlp(text); for ent in doc.ents: if ent.label_ == "PERSON": redact | Anonymize | |
| rate_limit = RateLimiter(times=10, seconds=60) | API limits | |
| HTTPS only + CORS | Web security | |
| audit logs: logging.info(f"User {user_id} queried: {prompt}") | Compliance | |

## Tips from Production LLM Deployers
* Start with vLLM for 10–100× faster inference over Transformers
* Use OpenAI-compatible APIs everywhere — switch backends without code changes
* Quantize to 4/8-bit for 70–80% cost savings with <1% quality drop
* Monitor p99 latency and OOM errors first — they kill user experience
* Always add toxicity/PII filters before going to users
* Docker + K8s is table stakes; Ray for anything >8 GPUs
* Cache frequent prompts with Redis (hit rate >60% saves $$$)
* Eval your endpoint with lm-eval-harness before launch
* Use spot/preemptible instances for non-critical inference
* Version models with HF Hub tags (v1.0, v1.1) for rollback

## Additional Resources
* [vLLM Docs](https://docs.vllm.ai)
* [Hugging Face TGI](https://huggingface.co/docs/text-generation-inference)
* [Ollama](https://ollama.com)
* [Ray Serve](https://docs.ray.io/en/latest/serve/index.html)
* [FastAPI for LLMs](https://fastapi.tiangolo.com)

## Mini-Glossary
### Core Concepts
| Term | Description |
|------|-------------|
| Quantization | Reduce precision (FP16 → INT8) for speed/memory |
| Tensor Parallel | Split model across GPUs |
| P99 Latency | 99th percentile response time |
| Guardrails | Safety filters for input/output |
| Throughput | Tokens/sec across all requests |

### Tools Comparison
| Tool | Speed | Ease | Scale |
|------|-------|------|-------|
| vLLM | 10–100× | High | High |
| TGI | 5–20× | Medium | High |
| Ollama | 1–5× | High | Low |
| Transformers | 1× | High | Low |
| Ray Serve | Variable | Medium | Highest |

### Common Pitfalls
| Issue | Fix |
|-------|-----|
| OOM on large models | Quantize + tensor parallel |
| Slow cold starts | Pre-warm with dummy requests |
| Hallucinations in RAG | Add "use only context" to prompt |
| High costs | Batch requests, use spot GPUs |
| Security leaks | Always filter PII/toxicity |

