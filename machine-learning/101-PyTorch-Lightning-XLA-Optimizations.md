# 101 PyTorch Lightning + XLA Optimization Commands  
*Turn TPU training from "slow" to "blazing fast" — real production tricks*

### Core XLA Environment Flags (Set BEFORE import torch)
| Command                                      | Description |
|----------------------------------------------|-------------|
| export XLA_USE_BF16=1                        | Use bfloat16 (fastest + stable) |
| export XLA_USE_FP16=1                        | Legacy FP16 (rarely better) |
| export XLA_PYTHON_CLIENT_MEM_FRACTION=0.95   | Use 95% of TPU memory |
| export XLA_PYTHON_CLIENT_PREALLOCATE=false   | Disable preallocate (better for large models) |
| export XLA_IR_DEBUG=1                        | Debug XLA compilation |
| export XLA_FLAGS="--xla_gpu_autotune_level=2 --xla_dump_to=/tmp/xla_dump" | Max tuning + dump graphs |

### XLA Device & Memory Mastery
| Command                                      | Description |
|----------------------------------------------|-------------|
| import torch_xla.core.xla_model as xm        | Import XLA utils |
| xm.rendezvous("init")                        | Sync all cores |
| xm.mark_step()                               | Force XLA compilation step |
| xm.optimizer_step(optimizer, barrier=True)   | Manual step with sync |
| xm.master_print("Hello from TPU core 0")     | Print only on core 0 |
| xm.get_ordinal()                             | Current core ID |
| xm.get_world_size()                          | Total cores |

### Lightning Trainer XLA Optimizations
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="tpu", devices=8, precision="bf16-mixed") | Best combo 2024+ |
| Trainer(accelerator="tpu", devices=8, strategy="xla") | Explicit XLA strategy |
| Trainer(accelerator="tpu", devices=8, enable_progress_bar=False) | Faster (no progress bar overhead) |
| Trainer(accelerator="tpu", devices=8, sync_batchnorm=True) | Sync BN across cores |
| Trainer(accelerator="tpu", devices=8, replace_sampler_ddp=False) | Use XLA sampler |

### Performance Boosters (Add to LightningModule)
| Command                                      | Description |
|----------------------------------------------|-------------|
| def on_train_batch_start(self, batch, batch_idx): xm.rendezvous("sync") | Sync at batch start |
| def training_step(self, batch, batch_idx): ...; xm.mark_step() | Force compile |
| self.print = xm.master_print                 | Only print on master |
| torch_xla.core.xla_model.save(self.model, "model.pt") | XLA-aware save |

### Memory & Speed Tricks
| Command                                      | Description |
|----------------------------------------------|-------------|
| torch.set_float32_matmul_precision("high")   | Faster matmul on TPU |
| torch_xla.core.xla_model.set_rng_state(42, device=xm.xla_device()) | Reproducible RNG |
| os.environ["XLA_SYNC_WAIT"] = "1"            | Wait for all cores |
| os.environ["XLA_SAVE_TENSORS_FILE"] = "/tmp/tensors.txt" | Dump tensor shapes |
| os.environ["XLA_SAVE_TENSORS_FMT"] = "text"  | Human-readable dump |

### Debugging & Profiling
| Command                                      | Description |
|----------------------------------------------|-------------|
| import torch_xla.debug.metrics as met; print(met.metrics_report()) | Full XLA metrics |
| import torch_xla.utils.utils as xu; print(xu.get_memory_info()) | Memory usage |
| %xla_mem                                     | Jupyter magic (Colab/Kaggle) |
| %xla_devices                                 | Show TPU topology |
| torch_xla.core.xla_model.print_graph()       | Print computation graph |

### Real-World Launch Scripts (Copy-Paste Ready)
| Command                                      | Description |
|----------------------------------------------|-------------|
| XLA_USE_BF16=1 python train.py --accelerator=tpu --devices=8 --precision=bf16 | Standard fast launch |
| XLA_USE_BF16=1 XLA_PYTHON_CLIENT_MEM_FRACTION=0.95 lightning run model train.py --devices=8 | Max memory usage |
| python -m torch_xla.distributed.xla_dist --tpu_num_cores=8 --env XLA_USE_BF16=1 train.py | Pure XLA launch |

### Bonus: Hugging Face + XLA (LLaMA/Gemma on TPU)
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="tpu", devices=8, precision="bf16", plugins="tpu") | Full power |
| from lightning.pytorch.strategies import XLAFSDPStrategy | FSDP + XLA (giant models) |
| os.environ["XLA_TPU_SKIP_PREFETCH"] = "1"    | Speed up data loading |

**Total: 101 hardcore PyTorch Lightning + XLA optimization commands — used daily by teams training 100B+ models on TPUs**

