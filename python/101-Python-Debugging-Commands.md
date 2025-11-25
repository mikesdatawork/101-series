# 101 Python Debugging Commands

## Overview
Debugging is a critical skill for Python developers. This cheat sheet covers essential debugging tools and techniques including the Python debugger (pdb), logging, profiling, memory analysis, tracing, and performance optimization. Master these commands to efficiently identify and fix bugs, optimize performance, and understand program behavior.

## Target Audience
- Python developers troubleshooting issues
- Software engineers optimizing performance
- Data scientists debugging data pipelines
- DevOps engineers investigating production issues
- Anyone seeking to write more reliable code

## Command Categories

### 1. PDB Basic Commands (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| python -m pdb script.py | Start debugger | Debugging scripts | python -m pdb myapp.py |
| import pdb; pdb.set_trace() | Set breakpoint | Inline debugging | pdb.set_trace() |
| breakpoint() | Set breakpoint (3.7+) | Modern breakpoint | breakpoint() |
| l (list) | List source code | Viewing context | l |
| ll (longlist) | List full function | Complete view | ll |
| n (next) | Execute next line | Step over | n |
| s (step) | Step into function | Step debugging | s |
| c (continue) | Continue execution | Resume running | c |
| r (return) | Continue until return | Exit function | r |
| p expression | Print expression | Inspect variables | p variable_name |
| pp expression | Pretty print | Formatted output | pp complex_dict |
| q (quit) | Exit debugger | Stop debugging | q |

### 2. PDB Navigation (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| w (where) | Show stack trace | Context understanding | w |
| u (up) | Move up stack frame | Navigate stack | u |
| d (down) | Move down stack frame | Navigate stack | d |
| a (args) | Show function arguments | Inspect inputs | a |
| j lineno (jump) | Jump to line number | Skip code | j 42 |
| until | Continue until line | Conditional continue | until 50 |
| unt (until) | Continue until greater line | Forward execution | unt |
| cl (clear) | Clear breakpoints | Remove breakpoints | cl |
| cl bpnumber | Clear specific breakpoint | Targeted removal | cl 1 |
| commands | Set breakpoint commands | Conditional actions | commands 1 |

### 3. PDB Breakpoints (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| b (break) | Set breakpoint at line | Line breakpoints | b 42 |
| b function | Set breakpoint at function | Function breakpoints | b my_function |
| b file.py:lineno | Set breakpoint in file | Cross-file breakpoints | b module.py:10 |
| b lineno, condition | Conditional breakpoint | Selective breaking | b 42, x > 10 |
| tbreak | Temporary breakpoint | One-time breakpoint | tbreak 42 |
| disable bpnumber | Disable breakpoint | Temporary disable | disable 1 |
| enable bpnumber | Enable breakpoint | Re-enable breakpoint | enable 1 |
| ignore bpnumber count | Ignore breakpoint N times | Skip iterations | ignore 1 10 |
| condition bpnumber | Set breakpoint condition | Conditional breaking | condition 1 x > 5 |
| b | List all breakpoints | Breakpoint overview | b |

### 4. PDB Expression Evaluation (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| ! statement | Execute Python statement | Running code | !x = 42 |
| p expression | Print expression value | Quick inspection | p len(items) |
| pp expression | Pretty print expression | Complex structures | pp nested_dict |
| display expression | Auto-display on step | Watch variables | display variable |
| undisplay | Remove display | Stop watching | undisplay |
| interact | Start interactive mode | Python shell | interact |
| alias | Create command alias | Custom shortcuts | alias ps p sorted(%1) |
| unalias | Remove alias | Delete shortcuts | unalias ps |

### 5. Logging Basics (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import logging | Import logging module | Logging setup | import logging |
| logging.debug() | Debug level message | Detailed information | logging.debug("Debug info") |
| logging.info() | Info level message | General information | logging.info("Process started") |
| logging.warning() | Warning level message | Warning messages | logging.warning("Low memory") |
| logging.error() | Error level message | Error reporting | logging.error("Failed to connect") |
| logging.critical() | Critical level message | Critical issues | logging.critical("System failure") |
| logging.exception() | Log exception with traceback | Exception logging | logging.exception("Error occurred") |
| logging.log(level, msg) | Log with custom level | Custom logging | logging.log(25, "Custom") |
| logging.basicConfig() | Configure logging | Basic setup | logging.basicConfig(level=logging.DEBUG) |
| logger = logging.getLogger() | Get logger instance | Module logging | logger = logging.getLogger(__name__) |
| logger.setLevel() | Set logger level | Level configuration | logger.setLevel(logging.INFO) |
| logging.disable() | Disable logging levels | Suppress logs | logging.disable(logging.WARNING) |

### 6. Logging Configuration (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| logging.basicConfig(format=...) | Set log format | Format configuration | logging.basicConfig(format='%(levelname)s:%(message)s') |
| logging.basicConfig(filename=...) | Log to file | File logging | logging.basicConfig(filename='app.log') |
| logging.basicConfig(filemode=...) | Set file mode | Append/overwrite | logging.basicConfig(filemode='w') |
| logging.FileHandler() | Create file handler | File output | handler = logging.FileHandler('app.log') |
| logging.StreamHandler() | Create stream handler | Console output | handler = logging.StreamHandler() |
| logging.Formatter() | Create formatter | Custom formatting | formatter = logging.Formatter('%(asctime)s - %(message)s') |
| handler.setFormatter() | Set handler formatter | Apply formatting | handler.setFormatter(formatter) |
| logger.addHandler() | Add handler to logger | Handler attachment | logger.addHandler(handler) |
| logger.removeHandler() | Remove handler | Handler removal | logger.removeHandler(handler) |
| logging.config.dictConfig() | Configure from dict | Advanced setup | logging.config.dictConfig(config_dict) |

### 7. Profiling with cProfile (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| python -m cProfile script.py | Profile entire script | Script profiling | python -m cProfile app.py |
| python -m cProfile -s time | Sort by time | Time analysis | python -m cProfile -s time app.py |
| python -m cProfile -s cumulative | Sort by cumulative time | Function analysis | python -m cProfile -s cumulative app.py |
| python -m cProfile -o output.prof | Save profile to file | Profile storage | python -m cProfile -o profile.prof app.py |
| import cProfile | Import profiler | Code profiling | import cProfile |
| cProfile.run('function()') | Profile function | Function profiling | cProfile.run('slow_function()') |
| cProfile.runctx() | Profile with context | Contextual profiling | cProfile.runctx('func()', globals(), locals()) |
| pstats.Stats() | Analyze profile data | Profile analysis | stats = pstats.Stats('profile.prof') |
| stats.sort_stats() | Sort profile results | Result ordering | stats.sort_stats('cumulative') |
| stats.print_stats() | Print profile results | View results | stats.print_stats() |

### 8. Line Profiling (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @profile decorator | Mark function for profiling | Line-by-line profiling | @profile def func(): ... |
| kernprof -l script.py | Run line profiler | Execute profiling | kernprof -l script.py |
| python -m line_profiler output.lprof | View line profile | Profile viewing | python -m line_profiler script.py.lprof |
| kernprof -l -v script.py | Profile with output | Direct viewing | kernprof -l -v script.py |
| LineProfiler() | Create profiler object | Manual profiling | profiler = LineProfiler() |
| profiler.add_function() | Add function to profile | Function selection | profiler.add_function(my_func) |
| profiler.enable() | Enable profiler | Start profiling | profiler.enable() |
| profiler.print_stats() | Print line profile | View results | profiler.print_stats() |

### 9. Memory Profiling (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @profile decorator (memory) | Mark for memory profiling | Memory analysis | @profile def func(): ... |
| python -m memory_profiler script.py | Run memory profiler | Memory tracking | python -m memory_profiler app.py |
| mprof run script.py | Profile memory over time | Time-based memory | mprof run app.py |
| mprof plot | Plot memory usage | Visualization | mprof plot |
| tracemalloc.start() | Start memory tracking | Built-in tracking | tracemalloc.start() |
| tracemalloc.take_snapshot() | Take memory snapshot | Snapshot capture | snapshot = tracemalloc.take_snapshot() |
| snapshot.compare_to() | Compare snapshots | Memory diff | diff = snapshot1.compare_to(snapshot2) |
| tracemalloc.get_traced_memory() | Get current memory | Memory monitoring | current, peak = tracemalloc.get_traced_memory() |
| sys.getsizeof() | Get object size | Size checking | sys.getsizeof(object) |
| objgraph.show_most_common_types() | Show common types | Type analysis | objgraph.show_most_common_types() |

### 10. Tracing and Inspection (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| sys.settrace() | Set trace function | Custom tracing | sys.settrace(trace_func) |
| sys.gettrace() | Get trace function | Trace inspection | current_trace = sys.gettrace() |
| trace.Trace() | Create trace object | Execution tracing | tracer = trace.Trace() |
| trace.run() | Run with tracing | Traced execution | tracer.run('function()') |
| python -m trace --trace script.py | Trace script execution | Line-by-line trace | python -m trace --trace app.py |
| python -m trace --count script.py | Count line executions | Coverage tracing | python -m trace --count app.py |
| inspect.stack() | Get current stack | Stack inspection | stack = inspect.stack() |
| inspect.currentframe() | Get current frame | Frame access | frame = inspect.currentframe() |
| inspect.getframeinfo() | Get frame info | Frame details | info = inspect.getframeinfo(frame) |
| inspect.trace() | Get stack trace | Traceback info | trace = inspect.trace() |

### 11. IPython/IPdb Enhanced Debugging (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| %debug | Start debugger after error | Post-mortem debugging | %debug |
| %pdb | Toggle automatic debugger | Auto debugging | %pdb on |
| %run -d script.py | Run with debugger | Script debugging | %run -d myapp.py |
| %timeit | Time code execution | Performance testing | %timeit sum(range(100)) |
| %time | Time single execution | One-time timing | %time slow_function() |
| %prun | Profile code | IPython profiling | %prun slow_function() |
| %lprun | Line-by-line profiling | Detailed profiling | %lprun -f func slow_function() |
| %memit | Memory usage of statement | Memory testing | %memit [x**2 for x in range(10000)] |
| %mprun | Line memory profiling | Memory profiling | %mprun -f func slow_function() |
| from IPython.core.debugger import set_trace | IPdb breakpoint | Enhanced debugging | set_trace() |

### 12. Performance Optimization Tools (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| timeit.timeit() | Time small code snippets | Micro-benchmarking | timeit.timeit('sum(range(100))', number=1000) |
| timeit.repeat() | Repeat timing | Statistical timing | timeit.repeat('func()', number=100, repeat=5) |
| time.perf_counter() | High-resolution timer | Accurate timing | start = time.perf_counter() |
| time.process_time() | Process CPU time | CPU usage | cpu_time = time.process_time() |
| dis.dis() | Disassemble bytecode | Low-level analysis | dis.dis(function) |
| sys.getsizeof() | Get object memory size | Size analysis | size = sys.getsizeof(obj) |
| gc.get_count() | Get garbage collection counts | GC monitoring | gc.get_count() |
| gc.collect() | Force garbage collection | Memory cleanup | gc.collect() |

### 13. Exception and Error Handling (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| sys.exc_info() | Get exception info | Exception details | exc_type, exc_value, exc_tb = sys.exc_info() |
| traceback.print_exc() | Print exception traceback | Error logging | traceback.print_exc() |
| traceback.format_exc() | Format exception | String formatting | error_str = traceback.format_exc() |
| traceback.extract_tb() | Extract traceback | Traceback parsing | tb_list = traceback.extract_tb(tb) |
| traceback.print_tb() | Print traceback | Traceback output | traceback.print_tb(tb) |
| sys.excepthook | Custom exception handler | Global error handling | sys.excepthook = custom_handler |
| warnings.warn() | Issue warning | Warning emission | warnings.warn("Deprecated") |
| warnings.filterwarnings() | Filter warnings | Warning control | warnings.filterwarnings('ignore') |
| logging.exception() | Log exception | Exception logging | logging.exception("Error occurred") |
| pdb.post_mortem() | Debug after crash | Post-mortem analysis | pdb.post_mortem(tb) |

### 14. Code Introspection (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| dir(object) | List object attributes | Attribute discovery | dir(my_object) |
| type(object) | Get object type | Type checking | type(variable) |
| isinstance(obj, type) | Check instance type | Type validation | isinstance(x, int) |
| hasattr(obj, name) | Check attribute existence | Attribute checking | hasattr(obj, 'method') |
| getattr(obj, name) | Get attribute value | Dynamic access | getattr(obj, 'attr', default) |
| vars(object) | Get object's __dict__ | Attribute inspection | vars(my_object) |
| id(object) | Get object identity | Memory location | id(variable) |
| help(object) | Get object help | Documentation access | help(function) |
| inspect.signature() | Get function signature | Parameter inspection | sig = inspect.signature(func) |
| inspect.getsource() | Get source code | Code inspection | source = inspect.getsource(function) |

### 15. Debugging Decorators and Context Managers (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @functools.wraps | Preserve function metadata | Decorator creation | @functools.wraps(func) |
| contextlib.contextmanager | Create context manager | Resource management | @contextlib.contextmanager def manager(): ... |
| with suppress() | Suppress exceptions | Exception ignoring | with suppress(FileNotFoundError): ... |
| with redirect_stdout() | Redirect stdout | Output capture | with redirect_stdout(f): ... |
| with redirect_stderr() | Redirect stderr | Error capture | with redirect_stderr(f): ... |
| @contextlib.closing | Auto-close resources | Resource cleanup | with closing(resource): ... |
| warnings.catch_warnings() | Catch warnings | Warning testing | with warnings.catch_warnings(): ... |
| mock.patch() | Patch for testing | Test isolation | with mock.patch('module.func'): ... |

## Tips and Best Practices
* Use logging instead of print for debugging production code
* Set logging level appropriately for each environment
* Use breakpoint() instead of import pdb; pdb.set_trace()
* Profile before optimizing - measure first
* Use line profiling for hotspot identification
* Monitor memory usage for long-running processes
* Add debug logging at key decision points
* Use exception logging with traceback
* Create custom debug logging levels for specific needs
* Use IPython for interactive debugging
* Keep debug code in version control but disabled
* Use conditional breakpoints for loops
* Profile with representative data
* Document performance requirements
* Use static analysis tools alongside debugging

## Additional Resources
* [Python pdb Documentation](https://docs.python.org/3/library/pdb.html)
* [Python Logging Documentation](https://docs.python.org/3/library/logging.html)
* [cProfile Documentation](https://docs.python.org/3/library/profile.html)
* [Real Python Debugging Guide](https://realpython.com/python-debugging-pdb/)
* [Python Profiling Guide](https://docs.python.org/3/library/profile.html)
* [IPython Documentation](https://ipython.readthedocs.io/)
* [memory_profiler](https://pypi.org/project/memory-profiler/)
* [py-spy Profiler](https://github.com/benfred/py-spy)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Python debugging and profiling.

### Common Terms

| Term | Description |
|------|-------------|
| breakpoint | Location where debugger pauses execution |
| watchpoint | Conditional pause when expression changes |
| step over | Execute current line and pause at next |
| step into | Enter function being called |
| step out | Execute until current function returns |
| stack frame | Single function call context in call stack |
| call stack | Sequence of active function calls |
| traceback | Error stack trace showing call sequence |
| post-mortem | Debugging after program crash |
| introspection | Examining object properties at runtime |

### Debugging Techniques

| Technique | Description |
|-----------|-------------|
| print debugging | Using print statements to debug |
| interactive debugging | Using debugger interactively |
| logging debugging | Using logging for debug information |
| rubber duck debugging | Explaining code to find issues |
| binary search debugging | Isolating bugs by halving search space |
| delta debugging | Finding minimal failing input |
| time-travel debugging | Replaying execution forward/backward |
| remote debugging | Debugging code on remote system |
| attach debugging | Attaching debugger to running process |

### Profiling Terms

| Term | Description |
|------|-------------|
| profiling | Measuring program performance |
| hotspot | Code section consuming most time |
| bottleneck | Performance-limiting code section |
| sampling profiler | Profiler using periodic sampling |
| deterministic profiler | Profiler tracking all function calls |
| call graph | Visual representation of function calls |
| cumulative time | Time including called functions |
| primitive calls | Non-recursive function calls |
| memory leak | Unreleased memory causing growth |
| garbage collection | Automatic memory management |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| PDB | Python Debugger | Built-in debugger |
| GDB | GNU Debugger | System-level debugger |
| REPL | Read-Eval-Print Loop | Interactive shell |
| CPU | Central Processing Unit | Processing time |
| RAM | Random Access Memory | Memory usage |
| I/O | Input/Output | File/network operations |
| GC | Garbage Collection | Memory management |
| TB | Traceback | Error trace |
| CLI | Command Line Interface | Terminal commands |
| API | Application Programming Interface | Function interfaces |

### Logging Levels

| Level | Numeric Value | Usage |
|-------|--------------|-------|
| CRITICAL | 50 | Critical system failures |
| ERROR | 40 | Error events |
| WARNING | 30 | Warning messages |
| INFO | 20 | Informational messages |
| DEBUG | 10 | Detailed debug information |
| NOTSET | 0 | All messages |

### PDB Command Categories

| Category | Commands | Purpose |
|----------|----------|---------|
| Navigation | n, s, c, r, u, d | Moving through code |
| Inspection | p, pp, a, w, l | Examining state |
| Breakpoints | b, tbreak, cl, disable | Managing breakpoints |
| Execution | j, until, commands | Controlling flow |
| Information | help, where, args | Getting context |

### Profiling Metrics

| Metric | Description | Tool |
|--------|-------------|------|
| Total time | Total execution time | cProfile |
| Per-call time | Time per function call | cProfile |
| Call count | Number of function calls | cProfile |
| Cumulative time | Time including subcalls | cProfile |
| Line time | Time per line | line_profiler |
| Memory increment | Memory added per line | memory_profiler |
| Peak memory | Maximum memory used | tracemalloc |
| Memory allocated | Total memory allocation | tracemalloc |

### Performance Optimization Strategies

| Strategy | When to Use | Tool |
|----------|------------|------|
| Algorithm improvement | High time complexity | cProfile |
| Caching/memoization | Repeated calculations | functools.lru_cache |
| Lazy evaluation | Unnecessary computation | generators |
| Vectorization | Loop-heavy numeric code | NumPy |
| Parallel processing | Independent operations | multiprocessing |
| Async I/O | I/O-bound operations | asyncio |
| C extensions | CPU-intensive bottlenecks | Cython, C API |
| Memory pooling | Frequent allocations | object pools |

### Common Debug Scenarios

| Scenario | Tool | Approach |
|----------|------|----------|
| Infinite loop | pdb with breakpoint() | Set breakpoint before loop |
| Memory leak | memory_profiler, tracemalloc | Profile memory over time |
| Slow function | cProfile, line_profiler | Profile execution time |
| Exception debugging | pdb.post_mortem(), logging | Examine crash state |
| Intermittent bug | Conditional breakpoint | b line, condition |
| Production issue | Logging with levels | Add detailed logging |
| Performance regression | cProfile comparison | Compare profiles |
| Thread issues | threading debug, logging | Thread-specific logging |

### Debugging Anti-Patterns

| Anti-Pattern | Problem | Better Approach |
|--------------|---------|-----------------|
| Excessive print statements | Cluttered output | Use logging with levels |
| No error handling | Silent failures | Proper exception handling |
| Ignoring warnings | Hidden issues | Fix or suppress explicitly |
| Over-optimization | Wasted effort | Profile first, optimize hotspots |
| No logging in production | No debugging info | Strategic logging |
| Debug code in production | Performance impact | Conditional debug mode |
| Testing in production | Risk | Use staging environment |
| No version control | Can't revert | Always use git |
