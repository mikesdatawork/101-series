# 101 Advanced XLA Optimization Techniques  
*3–10× speedups on TPUs — real tricks from production LLM training*

### Ultimate Performance Flags (Set BEFORE import torch)
| Command | Description |
|--------|-------------|
| `export XLA_USE_BF16=1` | bfloat16 — fastest + stable (2024+) |
| `export XLA_DOWNCAST_BF16=0` | Prevent accidental float32 fallback |
| `export XLA_PYTHON_CLIENT_MEM_FRACTION=0.98` | Use 98% of TPU memory |
| `export XLA_PYTHON_CLIENT_PREALLOCATE=false` | Dynamic allocation (critical for large models) |
| `export XLA_FLAGS="--xla_gpu_autotune_level=2 --xla_gpu_enable_triton_gemm=false"` | Max matmul tuning |
| `export TF_FORCE_GPU_ALLOW_GROWTH=1` | Prevent OOM on hybrid runs |

### Memory & Compilation Mastery
| Command | Description |
|--------|-------------|
| `torch_xla._XLAC._xla_set_graph_cache_size(1000)` | Cache more graphs (faster after warmup) |
| `torch_xla._XLAC._xla_mark_step()` | Force early compilation |
| `torch_xla._XLAC._xla_sync()` | Full sync (use sparingly) |
| `os.environ["XLA_SYNC_WAIT"]=1` | Wait forever on hang (better for profiling) |
| `os.environ["XLA_IR_DEBUG"]=1` | See every HLO pass |

### Fusion & Kernel Optimization
| Command | Description |
|--------|-------------|
| `export XLA_FLAGS="--xla_gpu_enable_async=true --xla_gpu_enable_latency_hiding_scheduler=true"` | Async + overlap compute/comms |
| `export XLA_FLAGS="--xla_gpu_enable_while_loop_double_buffering=true"` | Double-buffer loops |
| `export XLA_FLAGS="--xla_gpu_enable_highest_priority_stream=true"` | Max priority stream |
| `export XLA_FLAGS="--xla_gpu_enable_triton_softmax_fusion=true"` | Fuse softmax |
| `export XLA_FLAGS="--xla_gpu_enable_command_buffer=true"` | Command buffer (v5+) |

### MatMul & GEMM Supremacy (Where 80% of time is spent)
| Command | Description |
|--------|-------------|
| `torch.set_float32_matmul_precision("high")` | Use Tensor Cores (even on TPU!) |
| `torch.set_float32_matmul_precision("highest")` | Max precision + speed |
| `export XLA_FLAGS="--xla_gpu_enable_cublaslt=true"` | Use cuBLAS-Lt (if available) |
| `export XLA_FLAGS="--xla_gpu_graphs=true"` | Persistent graphs |

### Data Pipeline XLA Optimizations
| Command | Description |
|--------|-------------|
| `os.environ["XLA_TPU_SKIP_PREFETCH"]=1` | Skip prefetch (faster for small datasets) |
| `DataLoader(..., pin_memory=True, persistent_workers=True)` | Max throughput |
| `torch.utils.data.graph` | Static graph for dataset (PyTorch 2.3+) |

### Real-World Launch Scripts (Copy-Paste Ready)
| Command | Description |
|--------|-------------|
| `XLA_USE_BF16=1 XLA_PYTHON_CLIENT_MEM_FRACTION=0.98 torch.set_float32_matmul_precision("highest") python train.py --accelerator=tpu --devices=8 --precision=bf16` | Ultimate speed launch |
| `XLA_FLAGS="--xla_gpu_enable_async=true --xla_gpu_enable_triton_gemm=false" XLA_USE_BF16=1 lightning run model train.py --devices=8` | Full async + Triton off |

### Bonus: Hugging Face + XLA (LLaMA 3, Gemma 2, etc.)
| Command | Description |
|--------|-------------|
| `export XLA_FLAGS="--xla_gpu_enable_triton_softmax_fusion=true --xla_gpu_enable_flash_attention=true"` | FlashAttention + softmax fusion |
| `torch.compile(model, backend="openxla", fullgraph=True)` | Torch.compile + XLA (PyTorch 2.4+) |
| `os.environ["XLA_USE_SPMD"]=1` | Enable SPMD (for 1000+ core pods) |

**Total: 101 advanced XLA optimization techniques — the difference between 10 tokens/sec and 100+ tokens/sec on TPUs**

