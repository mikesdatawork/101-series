# 101 Hugging Face Transformers Commands

## Overview
Hugging Face Transformers is the de-facto library for state-of-the-art NLP, vision, audio, and multimodal models with 500k+ on the Hub. This expanded cheat sheet covers 250+ commands across 20 categories: installation, loading, tokenization, pipelines, generation, fine-tuning, PEFT/LoRA/QLoRA, quantization, datasets, evaluation, multimodal, custom models, optimization, deployment, safety, and more. From zero-code prototyping to production-scale training.

## Target Audience
- ML engineers deploying LLMs
- Researchers fine-tuning open models
- Developers integrating Hub models into apps
- Data scientists prototyping multimodal AI
- Anyone building with Transformers v4.45+

## Command Categories

### 1. Installation & Dependencies (15)
| Command | Description | Notes |
|---------|-------------|-------|
| pip install transformers | Core library (PyTorch/TF/JAX) | Latest: 4.45.1 |
| pip install transformers[torch] | PyTorch integration | Default backend |
| pip install transformers[tf] | TensorFlow/Keras | Less common |
| pip install transformers[flax] | JAX/Flax for TPUs | Google Cloud |
| pip install transformers[accelerate] | Multi-GPU, DeepSpeed | Essential for large models |
| pip install transformers[sentencepiece] | Tokenizers for T5/mT5 | Required for seq2seq |
| pip install datasets | Hugging Face Datasets | For training data |
| pip install peft | Parameter-Efficient Fine-Tuning | LoRA, Adapters |
| pip install bitsandbytes | 4/8-bit quantization | QLoRA, memory savings |
| pip install auto-gptq | GPTQ post-training quant | 4-bit inference |
| pip install autoawq | AWQ quantization | Better than GPTQ |
| pip install vllm | Fast batch inference engine | Production serving |
| pip install trl | Training with RLHF/DPO/ORPO | Alignment methods |
| pip install evaluate | Metrics library | BLEU, ROUGE, etc. |
| pip install gradio | Quick demos/UI | Spaces integration |

### 2. Model & Tokenizer Loading (20)
| Command | Description | Example |
|---------|-------------|---------|
| from transformers import AutoTokenizer | Load any tokenizer | tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased") |
| from transformers import AutoModel | Base model (no head) | model = AutoModel.from_pretrained("gpt2") |
| AutoModelForCausalLM.from_pretrained() | For text generation LLMs | model = AutoModelForCausalLM.from_pretrained("meta-llama/Llama-3-8b") |
| AutoModelForSequenceClassification | Classification tasks | model = AutoModelForSequenceClassification.from_pretrained("distilbert-base-uncased-finetuned-sst-2-english", num_labels=2) |
| AutoModelForTokenClassification | NER/POS tagging | model = AutoModelForTokenClassification.from_pretrained("dbmdz/bert-large-cased-finetuned-conll03-english") |
| AutoModelForQuestionAnswering | Extractive QA | model = AutoModelForQuestionAnswering.from_pretrained("distilbert-base-cased-distilled-squad") |
| AutoModelForSeq2SeqLM | Translation/Summarization | model = AutoModelForSeq2SeqLM.from_pretrained("t5-small") |
| trust_remote_code=True | For custom architectures | Required for Qwen, Yi, etc. |
| device_map="auto" | Split across devices | Uses Accelerate |
| torch_dtype=torch.bfloat16 | Mixed precision | Best for Ampere+ GPUs |
| low_cpu_mem_usage=True | Stream loading | For 100B+ models |
| resume_download=True | From checkpoint | Robust downloads |
| local_files_only=True | Offline mode | No Hub access |
| cache_dir="./hf_cache" | Custom cache | Save bandwidth |
| revision="main" | Specific branch/tag | Stable versions |
| from_pretrained(..., subfolder="adapter") | Load PEFT adapter | After base model |
| model.resize_token_embeddings(len(tokenizer)) | After vocab resize | For new tokens |
| tokenizer.pad_token = tokenizer.eos_token | Fix missing pad | Common for GPT-2 |
| tokenizer.add_tokens(["<custom>"]) | Extend vocab | model.resize_token_embeddings afterward |
| tokenizer.save_pretrained("./my_tokenizer") | Save locally | For custom |

### 3. Tokenization & Preprocessing (18)
| Operation | Command | Notes |
|-----------|---------|-------|
| tokenizer("Hello world") | Basic tokenize | Returns dict with input_ids, attention_mask |
| tokenizer.encode("text") | To token IDs | List of ints |
| tokenizer.decode(token_ids) | IDs to text | skip_special_tokens=True |
| tokenizer.batch_encode_plus(texts, padding=True, truncation=True) | Batch with padding | return_tensors="pt" |
| tokenizer("text", max_length=512, truncation=True) | Single with trunc | padding="max_length" |
| tokenizer.truncation_side="left" | For generation prompts | Important for LLMs |
| tokenizer.model_max_length = 8192 | Override max | For longer contexts |
| tokenizer.convert_tokens_to_ids(["hello"]) | Token to ID | |
| tokenizer.get_vocab() | Full vocabulary | Dict |
| tokenizer.add_special_tokens({"bos_token": "<bos>"}) | Add BOS/EOS | Resize embeddings after |
| tokenizer.save_vocabulary("./vocab") | Export files | For deployment |
| tokenizer.train_new_from_iterator(texts, vocab_size=30000) | Train from scratch | BPE/WordPiece |
| from tokenizers import Tokenizer | Low-level tokenizer | Faster, customizable |
| tokenizer.post_process() | Add special tokens | For chat templates |
| tokenizer.apply_chat_template(messages, tokenize=True) | Format conversations | Llama-3, Mistral, etc. |
| tokenizer.chat_template | View template | Customize if needed |
| tokenizer.encode_plus(text, add_special_tokens=True) | With specials | return_offsets_mapping=True for NER |
| tokenizer.prepare_for_model(text_ids, return_tensors="pt") | Final prep | |

### 4. Pipeline API (Zero-Code Inference) (16)
| Task | Command | Example |
|------|---------|---------|
| Sentiment Analysis | pipeline("sentiment-analysis") | classifier("I love this!") |
| Named Entity Recognition | pipeline("ner", aggregation_strategy="simple") | ner("Bill Gates is CEO") |
| Question Answering | pipeline("question-answering") | qa(question="Who?", context="text") |
| Summarization | pipeline("summarization") | summarizer("Long text...") |
| Translation | pipeline("translation_en_to_fr") | translator("Hello") |
| Text Generation | pipeline("text-generation") | generator("Once upon a time") |
| Fill-Mask | pipeline("fill-mask") | fill("The capital of France is [MASK]") |
| Zero-Shot Classification | pipeline("zero-shot-classification") | classifier("Text", candidate_labels=["pos", "neg"]) |
| Conversational | pipeline("conversational") | chat.add_user_input("Hi") |
| Text2Text Generation | pipeline("text2text-generation") | t2t("Translate to French: Hello") |
| Image Classification | pipeline("image-classification") | classifier(Image.open("img.jpg")) |
| Object Detection | pipeline("object-detection") | detector(Image.open("img.jpg")) |
| Automatic Speech Recognition | pipeline("automatic-speech-recognition") | asr("audio.wav") |
| Text-to-Speech | pipeline("text-to-speech") | tts("Hello world") |
| Document Question Answering | pipeline("document-question-answering") | dq a(Image.open("doc.png"), "What is?") |
| pipeline(..., model=your_model, tokenizer=your_tok) | Custom model | Full control |

### 5. Text Generation & Sampling (22)
| Parameter | Value | Description |
|-----------|-------|-------------|
| model.generate(inputs_embeds) | — | From embeddings |
| do_sample=False | — | Greedy decoding |
| num_beams=4 | — | Beam search |
| do_sample=True, top_k=50 | — | Top-K sampling |
| top_p=0.9 | — | Nucleus sampling |
| temperature=0.8 | — | Diversity control |
| repetition_penalty=1.1 | — | Avoid repeats |
| max_new_tokens=256 | — | Output length (preferred) |
| max_length=512 | — | Total length (legacy) |
| early_stopping=True | — | Stop at EOS |
| pad_token_id=tokenizer.eos_token_id | — | Fix padding |
| eos_token_id=tokenizer.eos_token_id | — | Force stop |
| stopping_criteria=StoppingCriteriaList([custom]) | — | Custom stops |
| return_dict_in_generate=True | — | Structured output |
| output_scores=True | — | Log probs |
| output_attentions=True | — | Attention weights |
| use_cache=True | — | KV cache for speed |
| bad_words_ids=[[1,2]] | — | Banned tokens |
| num_return_sequences=3 | — | Multiple outputs |
| TextIteratorStreamer | Streaming generation | Real-time output |
| model.generate(..., streamer=streamer) | — | With streamer |
| guidance_scale=2.0 | — | For guided gen (w/ guidance lib) |

### 6. Fine-Tuning with Trainer API (20)
| Component | Command | Notes |
|-----------|---------|-------|
| from transformers import Trainer | Core class | |
| TrainingArguments(output_dir="./results") | Config | learning_rate=2e-5 |
| TrainingArguments(per_device_train_batch_size=8) | Batch size | gradient_accumulation_steps=4 |
| TrainingArguments(num_train_epochs=3) | Epochs | |
| TrainingArguments(eval_strategy="epoch") | Evaluation | save_strategy="steps" |
| TrainingArguments(load_best_model_at_end=True) | Best checkpoint | metric_for_best_model="eval_loss" |
| trainer = Trainer(model=model, args=args, train_dataset=dataset) | Init | eval_dataset=val_dataset |
| trainer.train() | Run training | |
| trainer.evaluate() | Eval metrics | |
| trainer.predict(test_dataset) | Inference on test | |
| trainer.save_model() | Save checkpoint | |
| trainer.push_to_hub("my-model") | Upload to Hub | |
| fp16=True | Mixed precision | bf16=True for Ampere+ |
| dataloader_pin_memory=False | VRAM tuning | |
| remove_unused_columns=False | Custom features | |
| from accelerate import Accelerator | Low-level control | accelerator.prepare(model, optimizer) |
| SFTTrainer | Supervised fine-tuning | From trl library |
| RewardTrainer | Reward modeling | RLHF step |
| PPOTrainer | PPO alignment | Advanced |
| DPOTrainer | Direct Preference Opt | Latest, efficient |

### 7. PEFT Methods (LoRA, Adapters, etc.) (18)
| Method | Config | Application |
|--------|--------|-------------|
| from peft import LoraConfig | LoRA config | r=16, lora_alpha=32 |
| LoraConfig(task_type="CAUSAL_LM") | Task type | |
| LoraConfig(inference_mode=False) | Train vs infer | |
| LoraConfig(target_modules=["q_proj", "v_proj"]) | Layers to adapt | For Llama |
| from peft import get_peft_model | Apply to model | model = get_peft_model(base_model, config) |
| model.print_trainable_parameters() | Check % trainable | Should be <1% |
| peft_model = PeftModel.from_pretrained(base_model, "my-lora") | Load adapter | |
| peft_model.merge_and_unload() | Merge to base | For inference |
| peft_model.push_to_hub("my-adapter") | Upload adapter only | Smaller files |
| AdaLoraConfig | Adaptive LoRA | Dynamic rank |
| from peft import AdaLoraConfig | — | target_r=8 |
| IA3Config | Infused Adapter | Multi-vector |
| PrefixTuningConfig | Prefix tuning | For GPT-style |
| PromptTuningConfig | Prompt tuning | Soft prompts |
| from peft import TaskType | SEQ_CLS, CAUSAL_LM | Match task |
| peft_model.active_adapters() | List adapters | |
| add_adapter("name", config) | Stack adapters | Advanced |
| set_adapter("name") | Switch adapters | |

### 8. Quantization & Optimization (16)
| Type | Command | Savings |
|------|---------|---------|
| load_in_8bit=True | 8-bit Adam | ~50% VRAM |
| BitsAndBytesConfig(load_in_4bit=True) | 4-bit base | ~75% VRAM |
| quantization_config = BitsAndBytesConfig(llm_int8_enable_fp32_cpu_offload=True) | CPU offload | |
| nf4=True | Normalized Float4 | QLoRA default |
| double_quant=True | Nested quant | Extra 0.4 bits |
| from optimum.intel.openvino import OVModelForCausalLM | OpenVINO | CPU fast |
| from optimum.onnxruntime import ORTModelForCausalLM | ONNX Runtime | CPU/GPU |
| from auto_gptq import AutoGPTQForCausalLM | GPTQ model | Post-train 4-bit |
| model.quantize() | GPTQ quantize | From unquant model |
| from awq import AutoAWQForCausalLM | AWQ model | Better perplexity |
| torch.backends.cuda.enable_flash_sdp(True) | Flash Attention 1 | Legacy |
| attn_implementation="flash_attention_2" | Flash Attn 2 | In from_pretrained |
| model = torch.compile(model) | Dynamo (PyTorch 2+) | 20-50% speedup |
| from better_transformer import BetterTransformer | Legacy opt | Use Flash Attn instead |
| optimum-cli export onnx --model gpt2 onnx_model/ | Export to ONNX | |
| from transformers import pipeline(..., accelerator="ort") | ONNX pipeline | |

### 9. Datasets & Data Processing (15)
| Operation | Command | Notes |
|-----------|---------|-------|
| from datasets import load_dataset | Load from Hub | load_dataset("squad") |
| load_dataset("csv", data_files="train.csv") | Local files | |
| dataset = load_dataset("text", data_files={"train": "texts.txt"}) | Text corpus | |
| dataset.train_test_split(test_size=0.1) | Split | |
| dataset.map(tokenize_function, batched=True) | Apply function | num_proc=4 for speed |
| dataset.set_format("torch", columns=["input_ids", "labels"]) | Tensor format | |
| dataset.filter(lambda x: len(x["text"]) > 10) | Filter | |
| dataset.shuffle(seed=42) | Shuffle | |
| dataset.with_format("tensorflow") | TF tensors | |
| dataset.push_to_hub("my-dataset") | Upload | |
| from datasets import Dataset | From dict/list | Dataset.from_dict({"text": texts}) |
| dataset.remove_columns(["unneeded"]) | Clean columns | |
| dataset.cast_column("labels", features.ClassLabel(names=["neg", "pos"])) | Type cast | |
| dataset.train_test_split(shuffle=True) | Stratified split | stratify_by_column="label" |
| load_dataset_builder("glue", "mrpc").as_dataset() | Builder API | |

### 10. Evaluation & Metrics (12)
| Metric | Command | Task |
|--------|---------|------|
| import evaluate | Load metric | metric = evaluate.load("accuracy") |
| metric.compute(predictions=preds, references=labels) | Compute | |
| evaluate.combine(["accuracy", "f1"]) | Multiple metrics | |
| from evaluate import load | — | rouge = load("rouge") |
| bleu = load("bleu") | Translation | |
| squad = load("squad") | QA | |
| exact_match = load("exact_match") | — | |
| perpexity = evaluate.load("perplexity") | Generation | |
| bertscore = load("bertscore") | Semantic similarity | |
| metric.add_batch(predictions=preds) | Batch compute | metric.compute() |
| from transformers import EvalPrediction | Trainer integration | |
| trainer.compute_metrics(EvalPrediction) | Custom func | |

### 11. Multimodal Models (14)
| Model/Type | Command | Task |
|------------|---------|------|
| from transformers import BlipProcessor, BlipForConditionalGeneration | BLIP | Image captioning |
| processor(image, text) | Process | |
| outputs = model.generate(**inputs) | Generate | |
| from transformers import LlavaNextProcessor, LlavaNextForConditionalGeneration | LLaVA | Vision-LLM |
| processor(text=prompt, images=image, return_tensors="pt") | Multi-image | |
| from transformers import AutoProcessor | General | For CLIP, etc. |
| CLIPModel.from_pretrained("openai/clip-vit-base-patch32") | Embeddings | |
| from transformers import DetrImageProcessor, DetrForObjectDetection | DETR | Detection |
| from transformers import WhisperProcessor, WhisperForConditionalGeneration | Whisper | ASR |
| processor(audios=load_audio("file.wav")) | Audio | |
| from transformers import SpeechT5Processor, SpeechT5ForTextToSpeech | TTS | |
| from transformers import AutoModelForVision2Seq | Image-to-text | GIT, etc. |
| pipeline("visual-question-answering") | VQA | |
| pipeline("document-question-answering") | Doc QA | LayoutLM |

### 12. Custom Models & Architectures (12)
| Step | Command | Notes |
|------|---------|-------|
| from transformers import PreTrainedModel, PretrainedConfig | Base classes | |
| class MyModel(PreTrainedModel): | Inherit | |
| config = MyConfig(vocab_size=30522, hidden_size=768) | Config | |
| def __init__(self, config): super().__init__(config) | Init | |
| def forward(self, input_ids, attention_mask=None): | Forward pass | |
| model = MyModel(config) | Instantiate | |
| model.save_pretrained("./my_model") | Save | |
| from transformers import AutoConfig | Load config | |
| config.to_json_file("config.json") | Export | |
| model.generate() | Override generate | |
| from transformers import modeling_utils | Utils | |
| register_for_auto_class() | AutoModel integration | |

### 13. Optimization & Speedups (14)
| Technique | Command | Benefit |
|-----------|---------|---------|
| model.gradient_checkpointing_enable() | Checkpointing | Save 50% VRAM |
| model.gradient_checkpointing_disable() | Disable | |
| torch.backends.cudnn.benchmark = True | CUDNN opt | |
| with torch.no_grad(): | Inference mode | |
| model.eval() | Eval mode | |
| torch.inference_mode() | Strict no-grad | PyTorch 1.9+ |
| from torch.utils.data import DataLoader | Batched loading | pin_memory=True |
| model.half() | FP16 | |
| model.to("cuda") | Device move | |
| torch.cuda.empty_cache() | Clear VRAM | |
| os.environ["TOKENIZERS_PARALLELISM"] = "false" | Fix warnings | |
| from accelerate import dispatch_model | Multi-device | |
| model = torch.compile(model, mode="reduce-overhead") | Dynamo | PyTorch 2.0+ |
| optimum-cli export onnx --model gpt2/ onnx/ --optimize O2 | ONNX opt | |

### 14. Deployment & Serving (12)
| Tool | Command | Use Case |
|------|---------|----------|
| from transformers import pipeline | Local inference | |
| vllm serve meta-llama/Llama-3-8b --port 8000 | Fast serving | Batch + PagedAttention |
| docker run --gpus all ghcr.io/huggingface/text-generation-inference:latest --model-id gpt2 | TGI | Production |
| from fastapi import FastAPI; from transformers import pipeline | API endpoint | app.post("/generate") |
| pipeline(..., device=0) | GPU pipeline | |
| model.to("cpu") | CPU fallback | |
| torch.jit.script(model).save("traced.pt") | TorchScript | |
| torch.onnx.export(model, dummy_input, "model.onnx") | ONNX export | |
| from optimum.onnxruntime import ORTModelForCausalLM | ORT serving | |
| huggingface_hub.snapshot_download(repo_id="gpt2") | Download all | |
| model.save_pretrained("s3://bucket/model") | S3 save | With s3fs |
| pipeline(..., trust_remote_code=True) | Custom code | |

### 15. Safety, Alignment & RLHF (10)
| Method | Command | Notes |
|--------|---------|-------|
| from trl import DPOTrainer | Direct Preference Optimization | Efficient alignment |
| DPOTrainer(model, ref_model, train_dataset=prefs) | Init | beta=0.1 |
| trainer.train() | Run | |
| from trl import PPOTrainer | Proximal Policy Optimization | RLHF classic |
| PPOTrainer(model, ref_model, tokenizer) | — | |
| ppo_trainer.step(queries, responses, scores) | Step | |
| from transformers import AutoModelForCausalLMWithValueHead | Value head | For PPO |
| ORPOTrainer | Odds Ratio Preference Opt | Latest from trl |
| safety_checker = pipeline("text-classification", model="unitary/toxic-bert") | Toxicity filter | |
| model.generate(..., bad_words_ids=ids) | Banned tokens | |

### 16. Hub Management (10)
| Action | Command | Notes |
|--------|---------|-------|
| from huggingface_hub import login | Auth | login(token="hf_...") |
| model.push_to_hub("my-org/my-model") | Upload model | |
| model.push_to_hub("my-model", organization="org") | Org repo | |
| snapshot_download(repo_id="gpt2", local_dir="./local") | Download | |
| from_pretrained("user/repo", revision="v1.0") | Specific version | |
| create_repo("my-model", exist_ok=True) | Create repo | |
| upload_folder(folder_path="./model", path_in_repo="") | Upload dir | |
| delete_repo("my-model") | Delete | |
| repo_info("gpt2") | Get info | |
| list_models(filter="causal-lm") | Search Hub | |

### 17. Advanced: Custom Training Loops (12)
| Step | Command | Notes |
|------|---------|-------|
| from torch.optim import AdamW | Optimizer | optimizer = AdamW(model.parameters(), lr=5e-5) |
| from torch.utils.data import DataLoader | Loader | dataloader = DataLoader(dataset, batch_size=8) |
| for batch in dataloader: | Loop | outputs = model(**batch) |
| loss = outputs.loss | Compute loss | loss.backward() |
| scaler = torch.cuda.amp.GradScaler() | AMP | scaler.scale(loss).backward() |
| scaler.step(optimizer) | Step | scaler.update() |
| torch.save({"model": model.state_dict()}, "checkpoint.pt") | Save | |
| model.load_state_dict(torch.load("checkpoint.pt")["model"]) | Load | |
| from accelerate import Accelerator | Accelerate | accelerator = Accelerator(); model, optimizer = accelerator.prepare(model, optimizer) |
| with accelerator.accumulate(model): | Grad accum | |
| accelerator.save_state("run") | Checkpoint | |
| accelerator.load_state("run") | Resume | |

### 18. Datasets Integration (12)
| Feature | Command | Notes |
|---------|---------|-------|
| dataset.map(lambda x: {"labels": x["input_ids"]}, batched=False) | Shift for causal LM | |
| dataset.remove_columns(dataset.column_names) | Clean | Keep only input_ids, labels |
| from datasets import concatenate_datasets | Merge | train + val |
| dataset.select(range(1000)) | Subset | |
| dataset.sort("length") | Sort by len | |
| dataset.flatten() | Nested to flat | |
| from torch.utils.data import IterableDataset | Streaming | For large data |
| dataset = IterableDataset.from_generator(gen) | Generator | |
| dataset.skip(1000).take(5000) | Streaming ops | |
| dataset.cast(features) | Schema enforce | |
| dataset.to_parquet("data.parquet") | Export | |
| load_dataset("parquet", data_files="data.parquet") | Import | |

### 19. Model Merging & Ensembling (8)
| Technique | Command | Notes |
|-----------|---------|-------|
| from mergekit.moe import MoE | Mixture of Experts | mergekit-yaml config |
| from peft import PeftModel | Merge adapters | PeftModel.from_pretrained(base, adapter) |
| model.merge_and_unload() | LoRA merge | |
| from transformers import AutoModelForCausalLM | Load multiple | |
| ensemble_preds = (pred1 + pred2) / 2 | Simple average | |
| from optimum.intel import INCModelForSequenceClassification | Intel ensemble | |
| model.save_pretrained_merged("merged") | Save merged | |
| from mergekit import merge | CLI merge | mergekit --model1 gpt2 --model2 gpt2 |

### 20. Troubleshooting & Best Practices (10)
| Issue | Solution | Command |
|-------|----------|---------|
| OOM Error | Reduce batch/quantize | load_in_4bit=True |
| NaN Loss | Clip grads | torch.nn.utils.clip_grad_norm_(model.parameters(), 1.0) |
| Slow Tokenization | Batched | batched=True, num_proc=4 |
| VRAM Leak | Clear cache | torch.cuda.empty_cache() |
| Warning: Padding | Set pad_token | tokenizer.pad_token = tokenizer.eos_token |
| Slow Generation | Use KV cache | use_cache=True |
| Distributed Training | Accelerate | launch.py script |
| Custom Head | model.classifier = nn.Linear(hidden, num_labels) | Resize if needed |
| Version Mismatch | Pin versions | pip install transformers==4.45.1 |
| Hub Rate Limit | Login | huggingface-cli login |

## Tips and Best Practices
* Use Auto* classes always — model-agnostic
* device_map="auto" + Accelerate for any model >7B
* apply_chat_template for all chat models (Llama-3, Mistral, Phi-3)
* QLoRA for fine-tuning: 4-bit base + LoRA on top
* Flash Attention 2: attn_implementation="flash_attention_2" (2x speed, less VRAM)
* Streaming: TextIteratorStreamer for real-time UI
* Datasets.map(batched=True, num_proc=8) for fast preprocessing
* Trainer with fp16/bf16 + gradient_checkpointing for efficiency
* Push adapters only to Hub (peft_model.push_to_hub) — smaller uploads
* vLLM or TGI for production serving, not raw generate()
* Monitor with wandb: TrainingArguments(report_to="wandb")
* Custom metrics: trainer.compute_metrics = your_func
* For vision: Always use processor, not just tokenizer
* Offline: local_files_only=True + pre-download
* Debug: model.config.to_dict() for inspection
* Merge LoRA before inference: peft_model.merge_and_unload()
* Use DPO/ORPO over PPO for modern alignment — more efficient
* Export to ONNX/TensorRT for non-PyTorch deployment
* Pin transformers version in prod to avoid breaking changes
* Test on CPU first: model.to("cpu"); with torch.no_grad():

## Additional Resources
* [Transformers Docs](https://huggingface.co/docs/transformers/index)
* [PEFT Guide](https://huggingface.co/docs/peft)
* [TRL Library (Alignment)](https://huggingface.co/docs/trl)
* [Datasets Docs](https://huggingface.co/docs/datasets)
* [Accelerate (Distributed)](https://huggingface.co/docs/accelerate)
* [vLLM Fast Inference](https://docs.vllm.ai)
* [Text Generation Inference](https://github.com/huggingface/text-generation-inference)
* [Model Hub Search](https://huggingface.co/models?pipeline_tag=text-generation)
* [Flash Attention 2](https://github.com/Dao-AILab/flash-attention)
* [QLoRA Paper](https://arxiv.org/abs/2305.14314)

## Mini-Glossary

### Core APIs
| Term | Description |
|------|-------------|
| AutoTokenizer | Model-agnostic tokenizer loader |
| AutoModelForCausalLM | Decoder-only for generation |
| Trainer | High-level training loop |
| Pipeline | Task-specific zero-code inference |

### PEFT Methods
| Term | Description |
|------|-------------|
| LoRA | Low-Rank Adaptation (fine-tune 0.1% params) |
| QLoRA | Quantized LoRA (4-bit training) |
| Adapter | Inserted modules for tasks |
| Prefix Tuning | Learn input prefixes |

### Optimization
| Term | Description |
|------|-------------|
| Flash Attention 2 | IO-aware attention (faster, less mem) |
| BitsAndBytes | 4/8-bit optimizers & loading |
| KV Cache | Key-value reuse for autoregressive gen |
| Gradient Checkpointing | Trade compute for memory |

### Alignment
| Term | Description |
|------|-------------|
| SFT | Supervised Fine-Tuning |
| RLHF | Reinforcement Learning from Human Feedback |
| DPO | Direct Preference Optimization (PPO alternative) |
| ORPO | Odds Ratio Preference Optimization |

### Formats
| Term | Description |
|------|-------------|
| GGUF | llama.cpp format (quantized) |
| ONNX | Open Neural Network Exchange (interop) |
| GPTQ | Post-training 4-bit quant |
| AWQ | Activation-aware Weight Quantization |

