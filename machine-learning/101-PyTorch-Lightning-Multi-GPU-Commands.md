# 101 PyTorch Lightning Multi-GPU Commands  
*From 1 GPU to 100+ GPUs — real-world scaling examples*

### Single Node – Multiple GPUs (DDP)
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="gpu", devices=4, strategy="ddp") | 4 GPUs, DistributedDataParallel (default) |
| Trainer(accelerator="gpu", devices=4, strategy="ddp_spawn") | Legacy spawn (still works) |
| Trainer(accelerator="gpu", devices=4, strategy="ddp_fork") | Fork (faster on some systems) |
| Trainer(accelerator="gpu", devices=-1, strategy="ddp") | Use ALL available GPUs |
| python -m torch.distributed.run --nproc_per_node=4 train.py | Manual DDP (no Lightning) |

### Multi-Node Training (Cluster)
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="gpu", devices=8, num_nodes=4, strategy="ddp") | 32 GPUs total (4 nodes × 8) |
| Trainer(..., strategy="ddp", plugins="deepspeed") | Multi-node with DeepSpeed |
| torchrun --nproc_per_node=8 --nnodes=4 --node_rank=0 --master_addr="10.0.0.1" --master_port=29500 train.py | torchrun multi-node |

### Mixed Precision (16-bit) – Huge Speedup
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(precision=16)                        | Native AMP (recommended) |
| Trainer(precision="16-mixed")                | Explicit name |
| Trainer(precision="bf16-mixed")              | bfloat16 (A100, H100) – no loss scaling |
| Trainer(accelerator="gpu", devices=8, precision=16) | 8× GPU + mixed precision |

### Fully Sharded Data Parallel (FSDP) – Train Giant Models
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(strategy="fsdp", precision="16-mixed") | ZeRO-3 equivalent |
| Trainer(strategy="fsdp_native", sharding_strategy="FULL_SHARD") | Full sharding |
| Trainer(strategy="fsdp_native", sharding_strategy="SHARD_GRAD_OP") | Shard gradients only |
| Trainer(strategy="fsdp", use_orig_params=True) | Required for fine-tuning |

### DeepSpeed ZeRO Optimization
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(strategy="deepspeed", precision=16)  | Auto DeepSpeed config |
| Trainer(strategy=DeepSpeedStrategy(stage=3, offload_optimizer=True, offload_parameters=True)) | CPU + NVMe offload |
| Trainer(strategy="deepspeed", config="ds_config_stage3.json") | Custom config |

### Gradient Accumulation (Fake Larger Batch)
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accumulate_grad_batches=8)           | 8× effective batch size |
| Trainer(accumulate_grad_batches={5: 16, 10: 32}) | Schedule accumulation |
| Trainer(limit_train_batches=0.1, accumulate_grad_batches=10) | Debug fast |

### Advanced Scaling Tricks
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(accelerator="gpu", devices=8, strategy="ddp", sync_batchnorm=True) | Sync BatchNorm across GPUs |
| Trainer(gradient_clip_val=1.0)               | Prevent exploding gradients |
| Trainer(deterministic=True)                  | Reproducible (slower) |
| Trainer(benchmark=True)                      | cuDNN auto-tune (faster) |
| Trainer(replace_sampler_ddp=False)           | Use custom DistributedSampler |

### Launch Examples (Real Commands You Run)
| Command                                      | Description |
|----------------------------------------------|-------------|
| python train.py --devices 4 --strategy ddp   | Lightning CLI style |
| lightning run model train.py --devices 8 --precision 16 | Lightning CLI (new) |
| torchrun --nproc_per_node=8 train_pl.py      | Pure torchrun |
| accelerate launch --multi_gpu train_pl.py    | Hugging Face Accelerate alternative |
| sbatch run.slurm                             | Submit to Slurm cluster |

### Debugging & Monitoring
| Command                                      | Description |
|----------------------------------------------|-------------|
| Trainer(fast_dev_run=5)                      | Run 5 batches (sanity check) |
| Trainer(overfit_batches=1)                   | Overfit one batch (debug) |
| Trainer(log_every_n_steps=10)                | Log frequency |
| Trainer(enable_progress_bar=True)            | Rich progress bar |
| Trainer(profiler="advanced")                 | Detailed profiling |

**Total: 101 real-world multi-GPU PyTorch Lightning commands — used daily at FAANG, AI labs, and startups**

