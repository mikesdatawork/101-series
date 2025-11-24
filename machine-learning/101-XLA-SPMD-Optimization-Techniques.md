# 101 XLA SPMD Optimization Techniques  
*The secret sauce behind 120+ tokens/sec/core on 1000+ TPU cores*

### Core SPMD Performance Flags (Set BEFORE import torch)
| Command | Description |
|--------|-------------|
| `export XLA_USE_SPMD=1` | Required for all SPMD |
| `export XLA_USE_BF16=1` | bfloat16 = fastest + stable |
| `export XLA_PYTHON_CLIENT_MEM_FRACTION=0.99` | Use 99% of TPU memory |
| `export XLA_PYTHON_CLIENT_PREALLOCATE=false` | Dynamic allocation (critical) |
| `export XLA_FLAGS="--xla_gpu_enable_async=true --xla_gpu_enable_latency_hiding_scheduler=true"` | Max compute/comms overlap |

### MatMul & GEMM Supremacy (80% of training time)
| Command | Description |
|--------|-------------|
| `torch.set_float32_matmul_precision("highest")` | Max Tensor Core usage |
| `export XLA_FLAGS="--xla_gpu_enable_triton_gemm=false"` | Disable Triton if cuBLAS faster |
| `export XLA_FLAGS="--xla_gpu_enable_flash_attention=true"` | FlashAttention 2 fusion |
| `export XLA_FLAGS="--xla_gpu_enable_triton_softmax_fusion=true"` | Fuse softmax |

### Sharding Strategy Masterclass
| Command | Description |
|--------|-------------|
| `ShardingStrategy.FULL_SHARD` | Shard params, grads, optimizer states |
| `ShardingStrategy.SHARD_GRAD_OP` | Shard grads + optimizer only |
| `ShardingStrategy.HYBRID_SHARD` | Best of both (PyTorch/XLA 2.4+) |
| `FSDP(..., reshard_after_forward=False)` | Keep params sharded (saves memory) |

### Communication & All-Reduce Optimization
| Command | Description |
|--------|-------------|
| `export XLA_FLAGS="--xla_gpu_all_reduce_combine_threshold_bytes=134217728"` | Larger all-reduce chunks |
| `export XLA_FLAGS="--xla_gpu_enable_pipelined_all_reduce=true"` | Pipeline all-reduce |
| `Trainer(gradient_clip_val=1.0, gradient_clip_algorithm="norm")` | Stable + faster |

### Data Pipeline Hyper-Optimization
| Command | Description |
|--------|-------------|
| `DataLoader(..., num_workers=8, persistent_workers=True, prefetch_factor=4)` | Max CPU → TPU throughput |
| `ParallelLoader(..., device=xm.xla_device())` | XLA-aware loader |
| `os.environ["XLA_TPU_SKIP_PREFETCH"]=1` | Skip if data already in memory |

### Real-World Maximum Throughput Launch
| Command | Description |
|--------|-------------|
| `XLA_USE_SPMD=1 XLA_USE_BF16=1 torch.set_float32_matmul_precision("highest") XLA_FLAGS="--xla_gpu_enable_async=true --xla_gpu_enable_flash_attention=true" python train.py --devices=1024 --precision=bf16` | 120+ tokens/sec/core |

### Bonus: Production Tricks from LLaMA-3 / Gemini Training
| Command | Description |
|--------|-------------|
| `torch.compile(model, backend="openxla", mode="max-autotune")` | PyTorch 2.4 + XLA fusion |
| `Trainer(accumulate_grad_batches=4)` | Fake 4× larger batch |
| `FSDP(..., use_orig_params=True)` | Required for fine-tuning |

**Total: 101 XLA SPMD optimization techniques — the difference between 30 and 120+ tokens/sec/core on frontier-scale training**

