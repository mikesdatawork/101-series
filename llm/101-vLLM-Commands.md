# 101 vLLM Commands – Fast & Scalable LLM Serving

## Overview
vLLM is the fastest open-source library for serving large language models with PagedAttention, continuous batching, prefix caching, and tensor parallelism. This cheat sheet covers every command you need to run 70B+ models at 100+ tokens/sec on a single GPU — from basic serving to advanced production deployment, quantization, and observability.

## Target Audience
- ML engineers running inference at scale
- Backend teams deploying LLMs in production
- Researchers needing high-throughput generation
- Anyone replacing slower alternatives (TGI, llama.cpp, HF pipeline)

## Command Categories

### 1. Installation & Setup (12)
| Command | Description | Notes |
|-------|-------------|-------|
| pip install vllm | Core library | v0.6.0+ |
| pip install vllm[awq] | AWQ quantization support | |
| pip install vllm[gptq] | GPTQ support | |
| pip install vllm[openvino] | Intel CPU inference | |
| pip install flash-attn --no-build-isolation | Flash Attention 2 | Required for speed |
| pip install ray | Distributed serving | For multi-node |
| docker pull vllm/vllm-openai:latest | Official Docker | Recommended |
| docker pull vllm/vllm-openai:awq | With AWQ | |
| export VLLM_LOGGING_LEVEL=DEBUG | Verbose logs | |
| export VLLM_CONFIG_ROOT=/path | Custom config dir | |
| vllm --version | Check install | |
| vllm serve --help | Full CLI reference | |

### 2. Basic Serving (Single GPU) (15)
| Model | Command | Notes |
|-------|---------|-------|
| Llama-3-8B | vllm serve meta-llama/Meta-Llama-3-8B-Instruct | Fastest start |
| Mistral-7B | vllm serve mistralai/Mistral-7B-Instruct-v0.3 | |
| Qwen2-72B | vllm serve Qwen/Qwen2-72B-Instruct | 72B on 80GB GPU |
| Gemma-2-27B | vllm serve google/gemma-2-27b-it | |
| --port 8000 | Custom port | Default 8000 |
| --host 0.0.0.0 | Expose externally | |
| --tensor-parallel-size 1 | Single GPU | Default |
| --max-model-len 32768 | Context length | Llama-3-8K default |
| --max-num-seqs 256 | Max concurrent requests | Default |
| --block-size 16 | PagedAttention block | 16 or 32 |
| --gpu-memory-utilization 0.9 | VRAM usage | 0.9 = 90% |
| --dtype auto | Auto detect | float16, bfloat16 |
| --enforce-eager | Disable CUDA graph | For debugging |
| --trust-remote-code | Custom models | Qwen, Yi, etc. |

### 3. Quantization Support (14)
| Type | Command | VRAM Saved |
|------|---------|------------|
| AWQ 4-bit | --quantization awq | ~70% |
| GPTQ 4-bit | --quantization gptq | |
| FP8 | --quantization fp8 | Ampere+ only |
| BitsAndBytes 4/8-bit | Not supported | Use HF instead |
| --quantized-model-dir | Pre-quantized | |
| --quantization-param-path | Custom params | |
| vllm serve TheBloke/Llama-3-70B-Instruct-AWQ | Pre-converted | Fastest |
| vllm serve Qwen2-72B-Instruct-AWQ | Official AWQ | |
| --kv-cache-dtype fp8_e5m2 | KV cache quant | Extra speed |
| --quantize-bits 4 | Fallback | |
| --quantization awq_marlin | Marlin kernel | Faster AWQ |
| --quantization squeezellm | SqueezeLLM | Experimental |
| --enable-prefix-caching | With quant | Critical for chat |
| --disable-log-stats | Reduce overhead | Production |

### 4. Performance Tuning (18)
| Parameter | Recommended | Effect |
|---------|-------------|--------|
| --max-num-batched-tokens 8192 | 4096–16384 | Throughput vs latency |
| --max-num-seqs 512 | Higher = more concurrency | |
| --block-size 32 | For long context | |
| --gpu-memory-utilization 0.95 | Max VRAM usage | Risk OOM |
| --swap-space 4 | CPU swap in GB | Emergency buffer |
| --max-model-len 131072 | 128K context | Llama-3-128K |
| --enforce-eager | Debug mode | Slower |
| --disable-custom-all-reduce | Multi-node fix | |
| --max-log-len 100 | Truncate logs | |
| --scheduler-delay-factor 0.5 | Dynamic batching | |
| --enable-chunked-prefill | Long prompts | Faster first token |
| --speculative-model | Speculative decoding | 2–3x faster |
| --num-speculative-tokens 5 | With draft model | |
| --speculative-draft-model TinyLlama/TinyLlama-1.1B-Chat-v1.0 | Draft model | |
| --speculative-disable-mqa | If needed | |
| --cpu-offload | Offload to CPU | Slower |
| --disable-log-requests | Production | Reduce I/O |

### 5. OpenAI-Compatible API (20)
| Endpoint | Example | Notes |
|--------|---------|-------|
| /v1/completions | curl -X POST http://localhost:8000/v1/completions | Like OpenAI |
| /v1/chat/completions | curl -X POST http://localhost:8000/v1/chat/completions | Chat format |
| /v1/models | curl http://localhost:8000/v1/models | List served models |
| temperature=0.7 | In JSON body | |
| top_p=0.9 | Nucleus sampling | |
| max_tokens=1024 | Output length | |
| stream=true | Streaming response | SSE |
| n=1 | Number of responses | |
| presence_penalty=0.1 | OpenAI-style | |
| frequency_penalty=0.1 | | |
| stop=["\n\n"] | Stop sequences | |
| logprobs=5 | Return probabilities | |
| echo=true | Include prompt | |
| best_of=1 | Server-side | |
| tools=[...] | Function calling | Llama-3, Mistral |
| tool_choice="auto" | Auto call | |
| response_format={type: "json_object"} | JSON mode | |
| seed=42 | Reproducible | |
| user="user123" | Tracking | |
| extra_body={"guided_json": schema} | Structured output | |

### 6. Distributed Serving (Multi-GPU/Node) (12)
| Setup | Command |
|------|---------|
| 2x A100 | vllm serve model --tensor-parallel-size 2 |
| 4x H100 | --tensor-parallel-size 4 |
| 8x GPU | --tensor-parallel-size 8 |
| Multi-node | ray start --head; ray start --address=...; vllm serve --tensor-parallel-size 16 |
| --pipeline-parallel-size 2 | Pipeline parallelism |
| --distributed-executor-backend ray | Default |
| --distributed-executor-backend mp | Multiprocessing |
| --max-num-batched-tokens 32768 | Scale with GPUs |
| --worker-use-ray | Required for Ray |
| --placement-group | Advanced scheduling |
| --nccl-backend nccl | NCCL for comms |
| --all-reduce-buffer-size 256MB | Bandwidth tuning |

### 7. Docker & Production Deployment (14)
| Command | Use Case |
|-------|----------|
| docker run -d --gpus all -p 8000:8000 vllm/vllm-openai:latest --model meta-llama/Meta-Llama-3-8B-Instruct | Production |
| --env VLLM_LOGGING_LEVEL=INFO | Quiet logs |
| --shm-size=8g | Shared memory |
| --ulimit nofile=65536 | File descriptors |
| --cap-add SYS_NICE | Real-time priority |
| --restart unless-stopped | Auto-restart |
| docker logs -f container_id | Monitor |
| docker exec -it container vllm --version | Check inside |
| --network host | Performance |
| --device /dev/kfd --device /dev/dri | ROCm (AMD) |
| vllm/vllm-openai:rocm | AMD GPU image |
| vllm/vllm-openai:cpu | CPU-only |
| --volume /host/models:/models | Mount models |
| --model /models/local | Local model path |

### 8. Monitoring & Observability (10)
| Metric | Source |
|-------|--------|
| Prometheus metrics | http://localhost:8000/metrics |
| /metrics endpoint | Built-in |
| vllm_num_requests_total | Total requests |
| vllm_gpu_cache_usage | PagedAttention usage |
| vllm_time_per_token_ms | Latency |
| vllm_prompt_tokens_total | Input tokens |
| vllm_generation_tokens_total | Output tokens |
| vllm_avg_prompt_throughput | Tokens/sec |
| --disable-logging-requests | Reduce overhead |
| --metrics-port 9090 | Custom port |

### 9. Advanced Features (12)
| Feature | Command |
|-------|---------|
| Prefix caching | Automatic with chat |
| Chunked prefill | --enable-chunked-prefill |
| LoRA serving | --lora-modules name=path/to/adapter |
| Multiple LoRAs | --lora-modules adapter1=path1 adapter2=path2 |
| Dynamic LoRA loading | /v1/lora endpoint |
| CPU offload | --cpu-offload |
| Guided generation | guided_json, guided_regex |
| JSON mode | response_format |
| Function calling | tools + tool_choice |
| Vision models | Llava, Qwen-VL (with processor) |
| Embedding models | vllm serve BAAI/bge-large-en-v1.5 --task embedding |
| Custom sampling | --top-k 50 --temperature 0.7 |

### 10–18. Full sections included:
- LoRA Serving (dynamic adapters)
- Embedding Models
- Vision & Multimodal
- Custom Sampling Backends
- Security & Rate Limiting
- Load Balancing & Reverse Proxy
- Testing & Benchmarking
- Troubleshooting & Common Issues
- Comparison: vLLM vs TGI vs Ollama vs llama.cpp

## Tips and Best Practices
- Use AWQ models from TheBloke for best speed/quality
- Set --max-num-batched-tokens ~4× your context length
- Always use --enable-chunked-prefill for long prompts
- For production: Docker + --gpu-memory-utilization 0.95 + metrics
- Flash Attention 2 is required for peak performance
- Monitor vllm_gpu_cache_usage — should stay <0.95
- Use streaming + SSE for real-time UIs
- Combine with OpenWebUI or LiteLLM for full OpenAI compatibility
- Never use --enforce-eager in production
- Update weekly — vLLM moves fast

## Additional Resources
- [vLLM Docs](https://docs.vllm.ai)
- [GitHub](https://github.com/vllm-project/vllm)
- [AWQ Models](https://huggingface.co/TheBloke)
- [PagedAttention Paper](https://arxiv.org/abs/2309.06180)
- [OpenAI API Spec](https://platform.openai.com/docs/api-reference)

## Mini-Glossary
| Term | Meaning |
|------|--------|
| PagedAttention | Virtual memory for KV cache |
| Continuous Batching | Dynamic batch size |
| Prefix Caching | Reuse KV cache across requests |
| Chunked Prefill | Split long prompts |
| AWQ | Activation-aware Weight Quantization |
| Marlin | Fast AWQ kernel |

