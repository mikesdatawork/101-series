# LLM & Generative AI Cheat Sheets

The most comprehensive local & production LLM reference on GitHub.

| Tool                  | Best For                                      | Speed       | GPU Layers | Quantization | OpenAI API | Multimodal | Difficulty |
|-----------------------|-----------------------------------------------|-------------|------------|--------------|------------|------------|------------|
| **Hugging Face Transformers** | Fine-tuning, training, research, prototyping  | Medium      | Full       | 4/8-bit, QLoRA | No         | Yes        | Advanced   |
| **vLLM**              | Production serving, 100+ t/s, 70B on 1 GPU    | Ultra-fast  | Full       | AWQ, GPTQ, FP8 | Yes        | Limited    | Medium     |
| **llama.cpp**         | CPU/GPU/edge, phones, max efficiency         | Fast        | Full       | GGUF (Q4_K_M best) | Yes (server) | Yes (LLaVA) | Medium     |
| **Ollama**            | Easiest local use, instant OpenAI API, WebUI  | Fast        | Full       | Q4_K_M default | Yes        | Yes (Qwen2-VL) | Beginner   |

## Available Cheat Sheets (200+ entries each)

- [101-HuggingFace-Transformers-Commands](101-HuggingFace-Transformers-Commands.md) – 250+ commands: fine-tuning, PEFT, QLoRA, multimodal, deployment
- [101-vLLM-Commands](101-vLLM-Commands.md) – Fastest serving: PagedAttention, AWQ, LoRA, OpenAI API, 70B at 100+ t/s
- [101-Llama.cpp-Commands](101-Llama.cpp-Commands.md) – Edge & CPU king: GGUF, LLaVA, Metal/CUDA, speculative, 70B on laptop
- [101-Ollama-Commands](101-Ollama-Commands.md) – Easiest local LLM: `ollama run llama3.2`, vision, Modelfile, OpenWebUI

## Quick Start Recommendations

| Use Case                                | Recommended Tool       | Command |
|----------------------------------------|-------------------------|--------|
| Train or fine-tune a model             | Transformers + PEFT     | See sheet |
| Serve 70B at 100+ tokens/sec           | vLLM                    | `vllm serve llama3.1:70b` |
| Run 70B on a MacBook or gaming laptop  | llama.cpp               | `-ngl 99` |
| Just want ChatGPT locally in 10 sec    | Ollama + OpenWebUI      | `ollama run llama3.2` |
| Vision / image understanding           | Ollama (qwen2-vl)       | `ollama run qwen2-vl` |
| Offline/air-gapped deployment          | llama.cpp or Ollama     | Copy ~/.ollama |

Your LLM stack is now complete.
