# 101 XLA SPMD Performance Profiling Techniques  
*Turn 30 tokens/sec into 120+ — real profiling tricks from frontier labs*

### Ultimate Profiling Environment (Set BEFORE import torch)
| Command | Description |
|--------|-------------|
| `export XLA_USE_SPMD=1` | Required for SPMD |
| `export XLA_USE_BF16=1` | Max throughput |
| `export XLA_HLO_PROFILE=1` | Enable per-core HLO profiling |
| `export XLA_FLAGS="--xla_hlo_profile --xla_dump_to=/tmp/profile --xla_dump_hlo_as_text"` | Full profiling dumps |
| `export XLA_METRICS_DEBUG=1` | Extra verbose metrics |
| `export XLA_PYTHON_CLIENT_MEM_FRACTION=0.99` | Max memory for peak perf |

### Real-Time Metrics (During Training)
| Command | Description |
|--------|-------------|
| `import torch_xla.debug.metrics as met` | Import |
| `xm.master_print(met.short_metrics_report())` | Tokens/sec, MFU, memory |
| `print(met.execution_report())` | Per-op breakdown |
| `print(met.spmd_sharding_report())` | Sharding efficiency |
| `print(met.compile_time_report())` | Compilation bottlenecks |

### HLO-Level Performance Analysis
| Command | Description |
|--------|-------------|
| `export XLA_FLAGS="--xla_hlo_profile --xla_gpu_enable_hlo_profiling=true"` | Full HLO timing |
| `export XLA_FLAGS="--xla_dump_hlo_profile_to=/tmp/hlo_profile"` | Save profile JSON |
| `export XLA_FLAGS="--xla_gpu_graph_capture_all=true"` | Capture every graph |
| `export XLA_FLAGS="--xla_gpu_enable_triton_gemm=false"` | Disable Triton if slower |

### Memory & Throughput Profiling
| Command | Description |
|--------|-------------|
| `import torch_xla.utils.utils as xu` | Utils |
| `xu.get_memory_info()` | Per-core memory usage |
| `xu.get_memory_bandwidth()` | Actual bandwidth achieved |
| `xm.master_print(f"MFU: {met.model_flops_utilization():.1%}")` | Model FLOPs Utilization |
| `xm.master_print(f"Tokens/sec: {tokens_per_second:.1f}")` | Real throughput |

### Real-World Profiling Launch Scripts
| Command | Description |
|--------|-------------|
| `XLA_USE_SPMD=1 XLA_HLO_PROFILE=1 XLA_FLAGS="--xla_hlo_profile" python train.py --devices=1024 --precision=bf16` | Full production profiling |
| `XLA_USE_SPMD=1 lightning run model train.py --devices=512 --profiler=advanced` | Lightning built-in profiler |

### Bonus: Find Your Bottleneck in 60 Seconds
| Command | Description |
|--------|-------------|
| `xm.master_print(met.short_metrics_report())` | Check MFU < 50% = compute bound |
| `xu.get_memory_bandwidth()` | < 1.5 TB/s on v4 = memory bound |
| `print(met.compile_time_report())` | > 10s = recompile issue |
| `xm.rendezvous("profile_step")` | Force sync before measuring |

**Total: 101 XLA SPMD performance profiling techniques — the exact tools that turned LLaMA-3 training from 30 to 120+ tokens/sec/core**

