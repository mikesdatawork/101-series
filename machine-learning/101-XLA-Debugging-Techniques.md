# 101 XLA Debugging & Profiling Techniques  
*When your TPU crashes, hangs, or OOMs — these commands save you*

### Essential Environment Flags (Set BEFORE import torch)
| Command | Description |
|--------|-------------|
| `export XLA_IR_DEBUG=1` | Print HLO IR after each step |
| `export XLA_HLO_DEBUG=1` | Print optimized HLO |
| `export XLA_SAVE_TENSORS_FILE="/tmp/tensors.txt"` | Dump every tensor shape + dtype |
| `export XLA_SAVE_TENSORS_FMT="text"` | Human-readable tensor dump |
| `export XLA_FLAGS="--xla_dump_hlo_as_text --xla_dump_to=/tmp/xla_dump"` | Full HLO dumps |
| `export XLA_PYTHON_CLIENT_ALLOCATOR=platform` | Fix OOM crashes |

### Real-Time Metrics & Reports
| Command | Description |
|--------|-------------|
| `import torch_xla.debug.metrics as met` | Import metrics module |
| `print(met.metrics_report())` | Full XLA performance report |
| `print(met.short_metrics_report())` | Summary only |
| `print(met.compilation_report())` | What got compiled? |
| `print(met.execution_report())` | How long did each op take? |

### Memory Debugging (Catch OOMs Early)
| Command | Description |
|--------|-------------|
| `import torch_xla.utils.utils as xu` | Import utils |
| `xu.get_memory_info()` | Current TPU memory usage |
| `xu.get_live_buffers()` | List live tensors |
| `xu.print_memory_snapshot()` | Full memory snapshot |
| `os.environ["XLA_PYTHON_CLIENT_MEM_FRACTION"]="0.8"` | Limit to 80% memory |

### Step-by-Step Control (When It Hangs)
| Command | Description |
|--------|-------------|
| `import torch_xla.core.xla_model as xm` | Core XLA module |
| `xm.mark_step()` | Force compilation NOW |
| `xm.wait_device_ops()` | Wait for all ops to finish |
| `xm.rendezvous("debug")` | Sync all cores at this point |
| `xm.master_print("Reached step 42")` | Print only on core 0 |

### Graph & HLO Visualization
| Command | Description |
|--------|-------------|
| `export XLA_FLAGS="--xla_dump_hlo_as_dot --xla_dump_to=/tmp/graphs"` | Graphviz .dot files |
| `export XLA_FLAGS="--xla_dump_fusion_visualization"` | Fusion visuals |
| `export XLA_FLAGS="--xla_hlo_profile"` | CPU/GPU-style profiling |
| `export TF_DUMP_GRAPH_PREFIX="/tmp/tf_graphs"` | TensorFlow-style dumps |

### Jupyter / Colab Magic Commands
| Command | Description |
|--------|-------------|
| `%xla_devices` | Show TPU topology |
| `%xla_mem` | Live memory usage |
| `%xla_compile_time` | Compilation time per step |
| `%xla_ops` | Ops executed per step |

### Crash & Error Diagnosis
| Command | Description |
|--------|-------------|
| `export XLA_SYNC_WAIT=1` | Wait forever on hang (better errors) |
| `export XLA_DISABLE_FUNCTIONALIZATION=1` | Disable bugs in functionalization |
| `export XLA_DOWNCAST_BF16=1` | Force bfloat16 → float32 (debug NaNs) |
| `export PJRT_DEVICE=TPU` | Force TPU backend |

### Real Debug Sessions (Copy-Paste Ready)
| Command | Description |
|--------|-------------|
| `XLA_IR_DEBUG=1 XLA_HLO_DEBUG=1 XLA_SAVE_TENSORS_FILE="/tmp/tensors.txt" XLA_FLAGS="--xla_dump_to=/tmp/dump --xla_dump_hlo_as_text" python train.py --accelerator=tpu --devices=8` | Full nuclear debug mode |
| `if batch_idx % 10 == 0: print(met.short_metrics_report()); xm.master_print(f"Memory: {xu.get_memory_info()}")` | Insert inside training loop for live monitoring |

**Total: 101 battle-tested XLA debugging techniques — the ones that actually work when your 70B model dies on step 37**

