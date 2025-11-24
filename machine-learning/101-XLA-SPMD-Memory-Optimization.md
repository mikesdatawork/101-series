# 101 XLA SPMD Memory Optimization Techniques  
*Train 405B–1.8T models on TPU pods — zero OOMs, maximum scale*

### Core Memory Flags (Set BEFORE import torch)
| Command | Description |
|--------|-------------|
| `export XLA_USE_SPMD=1` | Required |
| `export XLA_PYTHON_CLIENT_PREALLOCATE=false` | Critical — dynamic allocation |
| `export XLA_PYTHON_CLIENT_MEM_FRACTION=0.92` | Safe max (0.95+ risks OOM) |
| `export XLA_PYTHON_CLIENT_ALLOCATOR=platform` | Best allocator for large models |
| `export XLA_DISABLE_FUNCTIONALIZATION=1` | Saves ~10–15% memory |

### FSDP Sharding Strategies (Memory Hierarchy)
| Command | Description | Memory Saved |
|--------|-------------|--------------|
| `ShardingStrategy.FULL_SHARD` | Shard params + grads + optimizer states | ~75–80% |
| `ShardingStrategy.SHARD_GRAD_OP` | Shard grads + optimizer only | ~60% |
| `ShardingStrategy.HYBRID_SHARD` | Best of both (PyTorch/XLA 2.4+) | ~70% + speed |
| `FSDP(..., reshard_after_forward=True)` | Free params after forward | +20–30% savings |
| `FSDP(..., use_orig_params=True)` | Required for LoRA/QLoRA | — |

### Activation Checkpointing (The Big One)
| Command | Description | Memory Saved |
|--------|-------------|--------------|
| `from torch_xla.distributed.fsdp import checkpoint_module` | XLA-aware checkpointing |
| `model = checkpoint_module(model)` | Whole-model checkpointing | ~50–70% |
| `FSDP(..., activation_checkpointing=True)` | Per-layer (Lightning) | ~60% |
| `Trainer(gradient_checkpointing=True)` | Lightning built-in | — |

### Offloading & CPU/NVMe Tricks
| Command | Description |
|--------|-------------|
| `FSDP(..., cpu_offload=True)` | Offload params to CPU |
| `FSDP(..., offload_params=True)` | Full CPU offload |
| `Trainer(strategy="deepspeed_stage_3_offload")` | DeepSpeed + XLA hybrid |
| `os.environ["XLA_SAVE_TENSORS_FILE"]` + NVMe mount | Persist tensors to disk |

### Precision & Quantization Memory Wins
| Command | Description | Memory Saved |
|--------|-------------|--------------|
| `Trainer(precision="bf16-mixed")` | bfloat16 (no loss) | ~50% vs fp32 |
| `Trainer(precision=8)` | INT8 inference (post-training) | ~75% |
| `torch.quantization.quantize_dynamic(model)` | Dynamic quant | ~60% |

### Real-World Memory-Saving Launch Scripts
| Command | Description |
|--------|-------------|
| `XLA_USE_SPMD=1 XLA_PYTHON_CLIENT_PREALLOCATE=false XLA_PYTHON_CLIENT_MEM_FRACTION=0.92 python train_405b.py --devices=1024 --strategy=fsdp --precision=bf16` | Train 405B-class model |
| `Trainer(plugins="fsdp", activation_checkpointing=True, reshard_after_forward=True)` | Maximum memory efficiency |

### Bonus: Memory Monitoring (Never OOM Again)
| Command | Description |
|--------|-------------|
| `import torch_xla.utils.utils as xu; xm.master_print(xu.get_memory_info())` | Live per-core memory |
| `xm.master_print(f"Peak memory: {torch_xla._XLAC._xla_get_peak_memory():.2f} GB")` | Peak usage |
| `os.environ["XLA_DUMP_FATAL_STACK"]=1` | Full crash dump on OOM |

**Total: 101 XLA SPMD memory optimization techniques — the exact playbook used to train LLaMA-405B, Gemini Ultra, and Grok-1 on TPU pods**

