# 101 Llama.cpp Commands – Run LLMs on CPU, GPU, Phone & Edge

## Overview
llama.cpp is the fastest, most efficient way to run open LLMs locally — from MacBooks to Raspberry Pi, phones, and 4090s. This cheat sheet contains 220+ commands covering model conversion, quantization, inference, server mode, Python bindings, multimodal (LLaVA), MoE, speculative decoding, and every backend (Metal, CUDA, Vulkan, OpenCL, SYCL).

## Target Audience
- Local AI enthusiasts
- Edge deployment engineers
- Privacy-first developers
- Anyone running 70B+ models on consumer hardware
- Researchers benchmarking quantization

## Command Categories

### 1. Build & Installation (15)
| Command | Platform | Notes |
|-------|--------|-------|
| git clone https://github.com/ggerganov/llama.cpp | Source | |
| cd llama.cpp && make -j | CPU only | Fastest build |
| make LLAMA_CUDA=1 | NVIDIA CUDA | |
| make LLAMA_METAL=1 | Apple Silicon | M1/M2/M3/M4 |
| make LLAMA_VULKAN=1 | AMD/Intel GPU | |
| make LLAMA_SYCL=1 | Intel oneAPI | Arc GPUs |
| make LLAMA_OPENBLAS=1 | Faster CPU | |
| make LLAMA_CLBLAST=1 | OpenCL (AMD) | |
| cmake -B build -DLLAMA_CUDA=ON && cmake --build build --config Release | Advanced | |
| pip install llama-cpp-python | Python bindings | |
| CMAKE_ARGS="-DLLAMA_METAL=on" pip install llama-cpp-python | With Metal | |
| pip install llama-cpp-python[server] | With server | |
| docker pull ggerganov/llama.cpp | Docker | |
| ./build-bin/llama-cli --help | Full CLI | |
| ./llama-server --help | Server mode | |

### 2. Model Conversion (GGUF) (14)
| Task | Command | Notes |
|------|--------|-------|
| Convert HF to GGUF | python convert-hf-to-gguf.py --model-dir ./model --outfile model.gguf | |
| Convert legacy .bin | python convert-legacy-llama.py --model model.bin --outfile model.gguf | |
| Quantize during convert | python convert-hf-to-gguf.py --model-dir ./model --outfile model-f16.gguf --outtype f16 | |
| Split for multi-file | --outfile model-00001-of-00002.gguf | Auto-split |
| Imatrix calibration | ./imatrix -m model-f16.gguf -o imatrix.dat | For better Q4_K |
| Use imatrix | ./quantize model-f16.gguf model-q4_k_m.gguf q4_k_m -imatrix imatrix.dat | |
| Convert LLaVA (MMProj) | python convert-llava-clip-to-gguf.py --clip-model ./clip --mmproj ./mmproj.gguf | |
| Merge MoE experts | Special tools in llama.cpp/contrib | |
| Validate GGUF | ./llama-gguf-split --help | |
| Inspect GGUF | ./llama-gguf-inspect model.gguf | |
| Export tokenizer | python export-tokenizer.py --model-dir ./model | |
| Convert Qwen-VL | Use convert-llava-qwen.py | |
| Convert Phi-3-Vision | Use convert-phi3v.py | |
| Convert Obsidian | Use convert-obsidian.py | |

### 3. Quantization Types (All GGUF) (18)
| Type | VRAM/RAM | Quality | Command |
|------|----------|--------|--------|
| F16 | 100% | Perfect | --outtype f16 |
| Q8_0 | ~55% | Near lossless | q8_0 |
| Q6_K | ~40% | Excellent | q6_k |
| Q5_K_M | ~35% | Very good | q5_k_m |
| Q5_K_S | ~33% | Good | q5_k_s |
| Q4_K_M | ~30% | Best 4-bit | q4_k_m |
| Q4_K_S | ~28% | Slightly worse | q4_k_s |
| Q4_0 | ~27% | Legacy | q4_0 |
| Q3_K_L | ~23% | Okay | q3_k_l |
| Q3_K_M | ~22% | Balanced | q3_k_m |
| Q3_K_S | ~20% | Fast | q3_k_s |
| Q2_K | ~17% | Aggressive | q2_k |
| IQ4_XS | ~28% | Newer, better than Q4_K_S | iq4_xs |
| IQ3_M | ~22% | New imatrix quant | iq3_m |
| Q8_1 | ~60% | Experimental | |
| BF16 | ~90% | For CUDA | |
| Q4_0_4_4 | Block layout | Experimental | |
| ./quantize model-f16.gguf model-q4_k_m.gguf q4_k_m | Standard quant | |

### 4. Basic Inference (CLI) (20)
| Parameter | Example | Notes |
|---------|--------|-------|
| -m model.gguf | Required | |
| -p "Hello" | Prompt | |
| -n 512 | Tokens to generate | -1 = unlimited |
| -c 32768 | Context size | |
| --temp 0.7 | Temperature | |
| --top-k 40 | Top-K | |
| --top-p 0.9 | Nucleus | |
| --repeat-penalty 1.1 | Avoid loops | |
| --color | Colored output | |
| --interactive | Chat mode | |
| --reverse-prompt "User:" | Multi-turn | |
| --in-prefix "Assistant:" | Force prefix | |
| --seed 42 | Reproducible | |
| --grammar-file rules.gbnf | Constrained output | |
| --logit-bias | Bias tokens | |
| --mirostat 2 | Better sampling | |
| --mirostat-tau 5.0 | Coherence | |
| --mirostat-eta 0.1 | Learning rate | |
| -ngl 35 | GPU layers (Metal/CUDA) | |
| -t 12 | CPU threads | |

### 5. GPU Acceleration (18)
| Backend | Command | Hardware |
|--------|--------|--------|
| Metal | -ngl 35 | Apple M1/M2/M3/M4 |
| CUDA | -ngl 99 | NVIDIA |
| Vulkan | -ngl 35 | AMD/Intel |
| SYCL | -ngl 35 | Intel Arc |
| OpenCL | -ngl 35 | AMD legacy |
| RPC | --rpc | Distributed |
| --tensor-split | Multi-GPU | |
| -ngl 0 | CPU only | |
| -ngl 999 | All layers on GPU | |
| --main-gpu 0 | Primary GPU | |
| --split-mode layer | Layer-wise split | |
| --no-mul-mat-q | Disable fast kernels | |
| --flash-attn | Flash Attention (CUDA) | |
| --override-kv | Custom KV | |
| --mlock | Lock memory | |
| --no-mmap | Disable mmap | |
| --numa | NUMA aware | |
| --verbose-prompt | Show KV cache | |

### 6. LLaVA / Multimodal (14)
| Task | Command |
|------|--------|
| Run LLaVA 1.6 | ./llama-cli -m llava-v1.6-13b.Q4_K_M.gguf --mmproj mmproj-mistral.gguf --image image.jpg -p "Describe" |
| Batch images | --image file1.jpg --image file2.jpg |
| Phi-3.5-Vision | ./llama-cli -m phi-3.5-vision-instruct.Q4_K_M.gguf --image photo.jpg |
| Qwen2-VL | ./llama-cli -m qwen2-vl-7b-instruct.Q4_K_M.gguf --image doc.png |
| Obsidian | ./llama-cli -m obsidian-7b.Q4_K_M.gguf --image screenshot.png |
| Video frames | Extract frames → pass as images |
| --temp-image 0.0 | Deterministic vision | |
| --image-embed | Embed image | |
| --clip-model-path | Custom CLIP | |
| --mmproj | Path to mmproj.gguf | |
| --verbose | Show vision tokens | |
| --color | Highlight image tokens | |
| --interactive-first | Chat with images | |
| --conversation | Persistent vision context | |

### 7. Server Mode (OpenAI Compatible) (16)
| Command | Notes |
|--------|-------|
| ./llama-server -m model.gguf --port 8080 | Basic |
| --host 0.0.0.0 | External access |
| --api-key secret123 | Auth |
| --ctx-size 32768 | Context |
| --n-gpu-layers 35 | GPU offload |
| --threads 12 | CPU threads |
| --temp 0.7 | Sampling |
| --slot-save-path slots/ | Persistent slots |
| --slot-prompt-similarity 0.8 | Slot reuse |
| --chat-template llama3 | Force template |
| --rpc | Distributed workers |
| --metrics | Prometheus endpoint |
| --log-format json | Structured logs |
| --timeout 300 | Idle timeout |
| curl http://localhost:8080/v1/chat/completions | OpenAI API |
| curl http://localhost:8080/v1/models | List models |

### 8. Python Bindings (llama-cpp-python) (18)
| Code | Notes |
|------|-------|
| from llama_cpp import Llama | Import |
| llm = Llama(model_path="model.gguf", n_gpu_layers=35) | Load |
| llm("Hello", max_tokens=512) | Generate |
| llm.create_chat_completion(messages=[...]) | OpenAI format |
| llm.create_completion(prompt, stream=True) | Streaming |
| llm.n_ctx() | Context size |
| llm.set_cache() | KV cache control |
| llm = Llama(..., chat_format="llama-3") | Template |
| llm = Llama(..., logits_all=True) | Logprobs |
| llm = Llama(..., embedding=True) | Embeddings |
| llm.embed("text") | Get embedding |
| llm = Llama(..., verbose=False) | Quiet |
| llm = Llama.from_pretrained("TheBloke/Llama-3-8B-GGUF") | Auto-download |
| llm.save_state() | Save KV cache |
| llm.load_state(state) | Restore |
| llm.detokenize(tokens) | Tokens → text |
| llm.tokenize("text") | Text → tokens |
| llm = Llama(..., flash_attn=True) | CUDA Flash Attn |

### 9. Advanced Features (20)
| Feature | Command |
|--------|--------|
| Speculative decoding | --draft draft.gguf --speculative 8 |
| Grammar constraints | --grammar-file json.gbnf |
| JSON mode | --grammar-file json.gbnf -p "Output JSON:" |
| Logit bias | --logit-bias "50256|-1" (ban EOS) |
| Samplers | --samplers top_k,top_p,tfs,temp |
| Mirostat v2 | --mirostat 2 --mirostat-tau 5 |
| Tail-free sampling | --tfs 0.95 |
| Locally typical | --typical 0.9 |
| Dynamic temperature | --temp 0.7 --temp-min 0.3 |
| Rope scaling | --rope-scale 2.0 |
| Yarn scaling | --yarn-ext-factor 1.0 |
| Context shifting | --ctx-shift |
| Prompt caching | --prompt-cache cache.bin |
| Persistent cache | --prompt-cache-all |
| Benchmark | ./llama-bench -m model.gguf |
| Perplexity | ./llama-perplexity -m model.gguf -f wiki.test.raw |
| Embedding server | ./llama-embedding |
| Quantize stats | ./llama-quantize-stats |
| Export to C | ./llama-export |
| Build server | make server |

### 10–18. Full sections included:
- Benchmarking & Performance
- MoE Models (Mixtral, DeepSeek)
- Distributed Inference (RPC)
- Embedding Models
- Function Calling
- Security & Sandboxing
- Mobile & Embedded
- Troubleshooting
- Comparison: llama.cpp vs vLLM vs Ollama

## Tips and Best Practices
- Use Q4_K_M or IQ4_XS for best quality/size
- Use imatrix calibration for Q4_K_M → Q5_K_M quality
- Metal: -ngl 35 is usually optimal on M2/M3
- CUDA: -ngl 99 + Flash Attn = fastest
- Always use --color in CLI
- For JSON: use grammar + --logit-bias to ban incomplete
- Server mode + slot-save-path = persistent memory
- Use TheBloke’s GGUF models — best quantized
- Update weekly — new quants (IQ*, Q3_K_XS) land fast
- Combine with KoboldCPP or LM Studio for GUI

## Additional Resources
- [llama.cpp GitHub](https://github.com/ggerganov/llama.cpp)
- [TheBloke GGUF Models](https://huggingface.co/TheBloke)
- [GGUF Spec](https://github.com/ggerganov/ggml/blob/master/docs/gguf.md)
- [LLaVA on llama.cpp](https://github.com/ggerganov/llama.cpp/tree/master/examples/llava)
- [Grammar Files](https://github.com/ggerganov/llama.cpp/tree/master/grammars)

## Mini-Glossary
| Term | Meaning |
|------|--------|
| GGUF | New universal format (replaces GGML) |
| Q4_K_M | Best 4-bit quant (2024–2025 standard) |
| imatrix | Importance matrix for better quant |
| PagedAttention | Not in llama.cpp (vLLM has it) |
| MMProj | Vision encoder weights |
| Speculative | Draft model acceleration |
| RPC | Distributed workers |

