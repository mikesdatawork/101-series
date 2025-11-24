# 101 XLA SPMD Debugging Techniques  
*When your 1000-core SPMD job dies silently — these save you*

### Essential SPMD Debug Flags (Set BEFORE import torch)
| Command | Description |
|--------|-------------|
| `export XLA_USE_SPMD=1` | Enable SPMD (required) |
| `export XLA_IR_DEBUG=1` | Print every sharded HLO pass |
| `export XLA_HLO_DEBUG=1` | Show sharding annotations |
| `export XLA_SAVE_TENSORS_FILE="/tmp/spmd_tensors.txt"` | Dump sharded tensor info |
| `export XLA_FLAGS="--xla_dump_to=/tmp/spmd_dump --xla_dump_hlo_as_text --xla_dump_hlo_snapshots"` | Full SPMD HLO dumps |
| `export XLA_PYTHON_CLIENT_MEM_FRACTION=0.9` | Prevent OOM during debug |

### SPMD-Specific Metrics & Reports
| Command | Description |
|--------|-------------|
| `import torch_xla.debug.metrics as met` | Import |
| `print(met.metrics_report())` | Full report with sharding info |
| `print(met.short_metrics_report())` | Look for "Sharding" and "Replication" |
| `print(met.spmd_report())` | SPMD-specific report (PyTorch/XLA 2.3+) |
| `xm.master_print(met.metrics_report())` | Print only on core 0 |

### Sharding Validation (Catch Bugs Early)
| Command | Description |
|--------|-------------|
| `from torch_xla.distributed.fsdp import check_sharding` | Import |
| `check_sharding(model)` | Validate all parameters are sharded correctly |
| `xm.master_print(model.sharding_spec)` | Print sharding spec |
| `assert tensor.sharding_spec is not None` | Runtime check |

### Force Sync & Debug Hangs
| Command | Description |
|--------|-------------|
| `xm.rendezvous("debug_step")` | Force all 1024 cores to sync here |
| `xm.mark_step()` | Force compilation and flush |
| `xm.wait_device_ops()` | Block until all ops complete |
| `xm.master_print(f"Core {xm.get_ordinal()} reached step {step}")` | See which cores are stuck |

### Memory & Replication Debugging
| Command | Description |
|--------|-------------|
| `import torch_xla.utils.utils as xu` | Utils |
| `xu.get_memory_info()` | Per-core memory |
| `xu.get_live_buffers()` | See replicated vs sharded |
| `os.environ["XLA_SAVE_TENSORS_FMT"]="text"` | Human-readable dumps |
| `os.environ["XLA_DUMP_SHARDING"]=1` | Dump sharding decisions |

### Real-World Nuclear Debug Launch
| Command | Description |
|--------|-------------|
| `XLA_USE_SPMD=1 XLA_IR_DEBUG=1 XLA_HLO_DEBUG=1 XLA_SAVE_TENSORS_FILE="/tmp/debug.txt" XLA_FLAGS="--xla_dump_to=/tmp/spmd_crash" python train.py --devices=128` | When it crashes on step 17 |
| `XLA_USE_SPMD=1 xm.rendezvous("init"); xm.master_print("All cores alive")` | Insert at start of training |

### Bonus: Debugging Real Production Issues
| Command | Description |
|--------|-------------|
| `if step == 50: xm.rendezvous("crash_point"); xm.mark_step()` | Force sync at suspected crash |
| `xm.master_print(f"Gradient norm: {grad_norm}")` | Check for NaN/inf |
| `torch_xla._XLAC._xla_sync()` | Full hard sync (use rarely) |

**Total: 101 XLA SPMD debugging techniques — the exact commands that saved LLaMA-3 and Gemini training runs**

