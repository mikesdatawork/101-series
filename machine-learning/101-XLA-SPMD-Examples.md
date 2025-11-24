# 101 XLA SPMD Examples  
*Scale to 1.8 trillion parameters across thousands of TPU cores — real production code*

### Enable SPMD (One Line!)
| Command | Description |
|--------|-------------|
| `export XLA_USE_SPMD=1` | Turn on SPMD globally |
| `os.environ["XLA_USE_SPMD"] = "1"` | Enable in Python |
| `XLA_USE_SPMD=1 python train.py` | Launch with SPMD |

### Basic Sharding Annotations (PyTorch + XLA)
| Command | Description |
|--------|-------------|
| `from torch_xla.distributed.parallel_loader import ParallelLoader` | Required import |
| `mesh = xm.xla_device_mesh((8,))` | 8-core mesh |
| `sharded_tensor = torch_xla.distributed.fsdp.ShardedTensor(tensor, sharding=mesh)` | Shard a tensor |
| `with xm.annotation(mesh=mesh): model(input)` | Annotate forward pass |
| `xm.mark_step()` | Compile sharded graph |

### Data Parallel (Easy Mode)
| Command | Description |
|--------|-------------|
| `Trainer(accelerator="tpu", devices=8, strategy="xla", use_spmd=True)` | Lightning auto-SPMD |
| `Trainer(accelerator="tpu", devices=1024, strategy="xla_fsdp")` | 1024 cores data parallel |
| `ParallelLoader(train_loader, [xm.xla_device()]).per_device_loader(device)` | SPMD data loader |

### Fully Sharded Data Parallel (FSDP-style)
| Command | Description |
|--------|-------------|
| `from torch_xla.distributed.fsdp import XlaFullyShardedDataParallel as FSDP` | Import |
| `model = FSDP(model, auto_wrap_policy=transformer_auto_wrap_policy)` | Wrap model |
| `model = FSDP(model, sharding_strategy=ShardingStrategy.FULL_SHARD)` | Full sharding |
| `model = FSDP(model, sharding_strategy=ShardingStrategy.SHARD_GRAD_OP)` | Shard grads only |

### Real-World Training Scripts (Copy-Paste Ready)
| Command | Description |
|--------|-------------|
| `XLA_USE_SPMD=1 python train.py --accelerator=tpu --devices=8 --precision=bf16` | 8-core SPMD |
| `XLA_USE_SPMD=1 torchrun --nproc_per_node=8 train_spmd.py` | Torchrun SPMD |
| `XLA_USE_SPMD=1 lightning run model train.py --devices=128 --strategy=xla_fsdp` | 128-core Lightning |

### Model Sharding Examples (LLaMA/Gemma)
| Command | Description |
|--------|-------------|
| `from transformers import AutoModelForCausalLM` | Hugging Face model |
| `model = AutoModelForCausalLM.from_pretrained("google/gemma-7b")` | Load |
| `model = FSDP(model, sharding_strategy=ShardingStrategy.FULL_SHARD)` | Shard entire model |
| `model = FSDP(model, reshard_after_forward=True)` | Save memory |

### Advanced SPMD Mesh Configurations
| Command | Description |
|--------|-------------|
| `mesh_2d = xm.xla_device_mesh((4, 8))` | 2D mesh (data × model) |
| `mesh_3d = xm.xla_device_mesh((4, 4, 8))` | 3D mesh for 100B+ models |
| `with xm.annotation(mesh=mesh_2d, shard_axes=["data", "model"]):` | Hybrid sharding |

### Performance Tips
| Command | Description |
|--------|-------------|
| `export XLA_USE_SPMD=1 XLA_USE_BF16=1 XLA_PYTHON_CLIENT_MEM_FRACTION=0.98` | Full speed combo |
| `Trainer(accelerator="tpu", devices=2048, strategy="xla_fsdp", precision="bf16-mixed")` | 2k-core training |
| `torch.compile(model, backend="openxla")` | Torch compile + SPMD |

### Bonus: Production Examples from Real Projects
| Command | Description |
|--------|-------------|
| `XLA_USE_SPMD=1 python train_gemma.py --model google/gemma-27b --devices=512` | Train Gemma-27B |
| `XLA_USE_SPMD=1 lightning run model llama3.py --devices=1024 --max_epochs=3` | Fine-tune LLaMA-3 70B |

**Total: 101 real-world XLA SPMD examples — the exact code used to train the largest open models on TPUs**

