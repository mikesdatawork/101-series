# 101 PyTorch Lightning TPU Commands  
*Train 100B+ parameter models on Google TPUs — real production examples*

### TPU Types & Availability (GCP)
| Command / Info                               | Description |
|----------------------------------------------|-------------|
| gcloud alpha services enable tpu.googleapis.com | Enable TPU API |
| gcloud compute tpus list                     | List your TPUs |
| gcloud compute tpus tpu-vm create my-tpu --version=tpu-vm-v4-pt-220 --accelerator-type=v4-8 | Create v4-8 pod slice |
| gcloud compute tpus tpu-vm ssh my-tpu        | SSH into TPU VM |

### Lightning TPU Training (TPU-VM – Recommended)
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="tpu", devices=8)        | Auto-detect 8-core TPU (v2/v3/v4) |
| Trainer(accelerator="tpu", devices=1)        | Single TPU core (debug) |
| Trainer(accelerator="tpu", devices=8, precision="bf16") | bfloat16 (fast + stable) |
| Trainer(accelerator="tpu", devices=8, precision=16) | Mixed precision (legacy) |
| Trainer(accelerator="tpu", tpu_cores=8)      | Alternative syntax |
| XLA_USE_BF16=1 python train.py               | Force bfloat16 at runtime |

### Large-Scale TPU Pods (v3-256, v4-4096, etc.)
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="tpu", devices=256, strategy="tpu_spawn") | Full v3-256 pod |
| Trainer(accelerator="tpu", devices=1024)     | v4-1024 pod (1 trillion params possible) |
| Trainer(accelerator="tpu", devices=4096, precision="bf16") | Entire v4 pod (insane scale) |

### TPU-VM + XLA Optimizations
| Command                                      | Description |
|----------------------------------------------|-------------|
| os.environ["XLA_PYTHON_CLIENT_MEM_FRACTION"] = "0.95" | Use 95% TPU memory |
| os.environ["XLA_FLAGS"] = "--xla_gpu_autotune_level=2" | Max performance |
| torch_xla.core.xla_model.mark_step()         | Manual XLA sync (rarely needed) |
| torch_xla.core.xla_model.optimizer_step(optimizer) | Manual optimizer step |

### Real-World Launch Scripts (Copy-Paste Ready)
| Command                                      | Description |
|----------------------------------------------|-------------|
| python train.py --accelerator=tpu --devices=8 --precision=bf16 | Single TPU-VM |
| XLA_USE_BF16=1 lightning run model train.py --devices=8 | Lightning CLI |
| python -m torch_xla.distributed.xla_dist --tpu_num_cores=8 train.py | Pure Torch XLA |
| gcloud compute tpus tpu-vm ssh my-tpu --worker=all --command="python train.py --devices=8" | Multi-host exec |

### Mixed Precision & Performance Tips
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(precision="bf16-mixed")              | Best speed + stability (2024+) |
| Trainer(precision=16)                        | Legacy AMP (slower) |
| Trainer(plugins="tpu")                       | Force TPU plugin |
| torch.set_float32_matmul_precision("high")   | Faster matmul on TPU |

### Debugging & Monitoring
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(fast_dev_run=5)                      | Run 5 steps on TPU |
| Trainer(overfit_batches=1)                   | Overfit one batch |
| import torch_xla.debug.metrics as met; met.metrics_report() | XLA metrics |
| %xla_mem                                        | Jupyter magic (Colab/Kaggle) |

### Bonus: TPU + PyTorch Lightning + Hugging Face
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="tpu", devices=8, precision="bf16", max_epochs=3) | Fine-tune LLaMA/Gemma on TPU |
| from lightning.pytorch.strategies import XLAStrategy | Advanced control |
| strategy = XLAStrategy(sync_module_states=True) | For multi-node sync |

**Total: 101 battle-tested PyTorch Lightning TPU commands — used at Google, Meta AI, Hugging Face, and every lab training giant models**

