# 101 Multimodal LLMs – 2025 Production Edition  
**GPT-4o • Claude-3 • LLaVA • Phi-3-Vision • Qwen-VL • CLIP**

The only cheat sheet used by teams building real multimodal agents, document AI, visual reasoning, and image+video understanding in 2025.

### 1. Environment & Model Access (12)
| Command | Model | Access Method |
|---------|-------|---------------|
| openai>=1.30.0 | GPT-4o, GPT-4o-mini | pip install openai |
| anthropic>=0.23.1 | Claude-3.5-Sonnet (vision) | pip install anthropic |
| pip install transformers torch torchvision | LLaVA, Phi-3-Vision, Qwen-VL | |
| from openai import OpenAI; client = OpenAI() | GPT-4o client | |
| from anthropic import Anthropic; client = Anthropic() | Claude client | |
| pip install replicate | Replicate (LLaVA, etc.) | replicate.run("yorickvp/llava-13b:...) |
| pip install ollama | Local LLaVA, llava:34b | ollama run llava:34b |
| docker run -v ollama:/root/.ollama -p 11434:11434 ollama/ollama | Ollama server | |
| curl http://localhost:11434/api/chat -d '{...}' | Ollama vision | |
| from transformers import AutoProcessor, AutoModelForCausalLM | HF vision models | |
| processor = AutoProcessor.from_pretrained("microsoft/Phi-3-vision-128k-instruct") | Phi-3-Vision | |
| model = AutoModelForCausalLM.from_pretrained(..., trust_remote_code=True, torch_dtype="auto", device_map="auto") | Load with device_map | |

### 2. Image Understanding – Real Production Calls (16)
| Task | Command (GPT-4o) | Command (Claude-3.5) | Command (LLaVA) |
|------|------------------|----------------------|-----------------|
| Describe image | client.chat.completions.create(model="gpt-4o", messages=[{"role": "user", "content": [{"type": "text", "text": "Describe this"}, {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64,..."}}]}]) | client.messages.create(model="claude-3-5-sonnet-20241022", max_tokens=1024, messages=[{"role": "user", "content": [{"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": base64}}], "text": "Describe"}]) | ollama run llava:34b "describe this image" (with image attached) |
| OCR / Extract text | Same as above + prompt "Extract all text exactly" | Same | Works surprisingly well |
| Table → Markdown | "Convert this table to markdown" | Same | LLaVA-34B excels |
| Chart → Data | "Read this chart and give me the data points" | Same | |
| Diagram → Explanation | "Explain this system architecture diagram" | Same | |
| Invoice parsing | Structured prompt + JSON mode | Same | |
| Count objects | "How many people are in this image?" | Same | |
| Caption generation | "Write an Instagram caption" | Same | |
| Visual question answering | "What is the person holding?" | Same | |
| Medical image (X-ray, MRI) | GPT-4o-med (private beta) or Claude | Same | Not reliable |
| Satellite / geospatial | GPT-4o strong | Same | |
| Meme understanding | GPT-4o best | Claude close | |
| Handwriting | GPT-4o > Claude > LLaVA | | |
| Math diagrams | "Solve this geometry problem" | Same | Phi-3-Vision strong |
| Code screenshots | "Convert this screenshot to Python" | Same | |
| UI mockup → HTML | "Generate clean HTML from this design" | Same | |

### 3. Local & Open-Source Vision Models (14)
| Model | Size | Command | Performance 2025 |
|-------|------|---------|------------------|
| LLaVA-1.6-34B | 34B | ollama run llava:34b | Near GPT-4o on OCR/tables |
| LLaVA-1.6-13B | 13B | ollama run llava:13b | Very strong |
| Phi-3-Vision-128k | 4.2B | HF + device_map="cuda" | Best small model |
| Qwen-VL-Chat | 7B | HF | Excellent multilingual |
| bakLlava-1 | 7B | Mistral-7B + LLaVA | Good |
| moondream2 | 1.8B | ollama run moondream | Fast edge |
| llava-llama3-8b | 8B | ollama run llava-llama3 | Fast + strong |
| cogvlm2-llama3-chat | 19B | Replicate or local | Top open vision |
| Fuyu-8B | 8B | Adept (no tokenizer) | Fast inference |
| PaliGemma-3B | 3B | Google | Strong VQA |
| Idefics2-8B | 8B | HuggingFace | Good instruction following |
| Florence-2-large | 0.77B | Microsoft | Excellent captioning/OCR |
| CLIP-ViT-L-336px | — | open_clip | Embedding only |
| OpenAI CLIP (ViT-B/32) | — | openai.clip | Classic |

### 4. Video Understanding (2025 Real Options)
| Model | Command | Status |
|------|--------|--------|
| GPT-4o (video) | messages with "video_url" (mp4) | Native up to 2 min |
| Claude-3.5-Sonnet | image frames only | Sample 8–16 frames |
| Video-LLaVA-34B | ollama run video-llava | Local, 2025 breakthrough |
| LLaMA-3.1-Video | Meta (research) | Not public yet |
| Gemini-1.5-Pro | Google (API) | 1 hour+ video |
| frame sampling → GPT-4o | Python script + every 5th frame | Most common workaround |

### 5. Multimodal RAG (Images + Text) (10)
| Command | Tool |
|--------|------|
| from langchain_community.vectorstores import Chroma | |
| from langchain_openai import OpenAIEmbeddings | Text only |
| from langchain_community.embeddings import HuggingFaceEmbeddings | |
| Use CLIP → embed images → store with text metadata | |
| from chromadb.utils.embedding_functions import OpenCLIPEmbeddingFunction | Chroma built-in |
| MultiVectorRetriever (image + text chunks) | LlamaIndex |
| ColPali (PDF → visual tokens) | 2025 SOTA for document RAG |
| Multimodal index in LlamaIndex | index = MultiModalVectorStoreIndex(nodes) |
| query with image + text | engine.query("What does this chart say?", image=image) |
| Weaviate + img2vec CLIP module | Graph + multimodal |

### 6. Evaluation & Benchmarks (8)
| Benchmark | Command |
|-----------|--------|
| MMMU (college-level multimodal) | lm-eval --model hf --tasks mmmu |
| MathVista | Same |
| ChartQA | Same |
| DocVQA | Same |
| AI2D (diagrams) | Same |
| VisualWebBench | Same |
| MMBench-CN (Chinese) | Same |
| Custom OCR accuracy test suite | Python + GPT-4o judge |

### 7. Production Deployment Patterns (8)
| Pattern | Stack |
|--------|-------|
| FastAPI + GPT-4o vision endpoint | Most common |
| LangServe + multimodal chain | |
| Docker + ollama + llava:34b | On-prem |
| vLLM + vision models (experimental) | Future |
| Replicate API wrapper | Easy scaling |
| Cloud Run GPU + Phi-3-Vision | Serverless |
| Kubernetes + GPU + persistent volume | Enterprise |
| Caching image embeddings in Redis | Speed |

### Final Multimodal Checklist (2025)
- [ ] For OCR/tables → GPT-4o or LLaVA-34B  
- [ ] For diagrams/math → GPT-4o or Phi-3-Vision  
- [ ] For memes/UI → GPT-4o  
- [ ] For speed/cost → GPT-4o-mini (vision-capable)  
- [ ] For on-prem → LLaVA-34B via Ollama  
- [ ] Always base64 encode images (not URLs) in production  
- [ ] Cap image resolution to 1024×1024 unless needed  
- [ ] Use structured output (JSON mode) for parsing  
- [ ] Log image hashes for auditing  
- [ ] Rate-limit vision calls (cost explodes fast)

## Resources Actually Used in 2025
- GPT-4o Vision → https://platform.openai.com/docs/guides/vision
- Claude Vision → https://docs.anthropic.com/en/docs/build-with-claude/vision
- LLaVA → https://llava-vl.github.io
- Ollama Vision Models → https://ollama.com/library (llava tags)
- Phi-3-Vision → https://huggingface.co/microsoft/Phi-3-vision-128k-instruct
- ColPali → https://huggingface.co/vidore/colpali

