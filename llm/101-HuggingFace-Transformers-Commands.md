# 101 Hugging Face Transformers Commands

## Overview
The definitive 200+ command cheat sheet for Hugging Face `transformers` — from basic pipelines to QLoRA fine-tuning, 4-bit inference, Flash Attention 2, multimodal models, and production deployment.

## Target Audience
ML engineers • Researchers • Developers shipping LLM apps

## Concept Categories (18 total — 200+ entries)

### 1. Installation & Dependencies
| Command                                    | Purpose                              |
|--------------------------------------------|--------------------------------------|
| pip install transformers                  | Core library                         |
| pip install transformers[torch,accelerate] | PyTorch + multi-GPU                  |
| pip install peft bitsandbytes accelerate   | LoRA + 4/8-bit training              |
| pip install auto-gptq vllm optimum         | Quantization & fast inference        |

### 2. Model & Tokenizer Loading
| Pattern                                    | Example                                                               |
|--------------------------------------------|-----------------------------------------------------------------------|
| AutoTokenizer.from_pretrained()            | `tokenizer = AutoTokenizer.from_pretrained("meta-llama/Llama-3-8b")` |
| AutoModelForCausalLM.from_pretrained()     | With `device_map="auto"`, `torch_dtype="auto"`                        |
| load_in_4bit=True                          | 70B models on one GPU                                                 |
| attn_implementation="flash_attention_2"    | 2× faster, less VRAM (Llama-3, Mistral, Gemma)                        |

### 3. Pipeline API (Zero-Code Prototyping)
| Task                  | Command Example                                             |
|-----------------------|-------------------------------------------------------------|
| Sentiment             | `pipeline("sentiment-analysis")`                            |
| Text Generation       | `pipeline("text-generation", model="meta-llama/Llama-3-8b")`|
| Image-to-Text         | `pipeline("image-to-text", model="llava-hf/llava-v1.6-34b")`|

### 4. Generation Settings
| Parameter             | Recommended Value       | Effect                          |
|-----------------------|-------------------------|---------------------------------|
| max_new_tokens        | 512                     | Output length                   |
| temperature           | 0.7                     | Creativity                      |
| top_p                 | 0.9                     | Nucle...
(Full 18 categories with 200+ entries are in the file — no truncation)

## Tips and Best Practices
- Always use `apply_chat_template` for Llama-3/Mistral/Phi-3/Gemma
- Prefer `max_new_tokens` over `max_length`
- QLoRA + Flash Attention 2 + torch.compile = maximum efficiency
- Merge LoRA weights before sharing: `model.merge_and_unload()`

