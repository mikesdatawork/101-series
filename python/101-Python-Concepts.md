# 101 Python Concepts

## Overview
Python is a versatile, high-level programming language prized for its readability and broad applicability. This cheat sheet explores core concepts with emphasis on best practices, maintainability, performance, real-world applicability, and tips to write clean, efficient code. Mastering these supports building robust, scalable applications.

## Target Audience
- Software developers writing production code
- Data engineers building pipelines
- Backend developers creating services
- Machine learning practitioners scripting models
- Anyone advancing Python skills

### 1. Core Language Fundamentals (12)

| Mutable vs Immutable Objects |
| Usage: Mutable objects change in place (list, dict, set); immutable cannot (int, str, tuple, frozenset). Use immutable for dictionary keys or function defaults.
Tips: Prefer immutable for thread safety, hashability, and predictability. Avoid mutable default arguments to prevent shared state bugs. |

| Duck Typing |
| Usage: Focus on object interface rather than type; if it implements needed methods, treat it accordingly.
Tips: Enables flexible polymorphism. Use isinstance sparingly; check capabilities with hasattr when necessary. |

| First-Class Functions |
| Usage: Functions are objects; assign to variables, pass as arguments, return from functions.
Tips: Supports callbacks and higher-order functions. Improves code reuse and modularity. |

| Closures |
| Usage: Inner function captures and retains outer scope variables after outer function returns.
Tips: Use for factories or private state without globals. Inspect captured variables with func.__closure__. |

| Decorators |
| Usage: Modify or enhance functions/classes without changing source (@wrapper syntax).
Tips: Always use functools.wraps to preserve metadata. Apply for logging, caching, authorization. |

| Descriptors |
| Usage: Objects defining __get__, __set__, __delete__ control attribute access.
Tips: Power properties, methods, and validation. Use for reusable attribute logic in frameworks. |

| Metaclasses |
| Usage: Classes of classes; customize class creation (type is default metaclass).
Tips: Use sparingly for registration or validation. Prefer class decorators for simpler cases. |

| Context Managers |
| Usage: Define __enter__/__exit__ for resource setup/teardown (with statement).
Tips: Ensure safe cleanup. Use contextlib.contextmanager for function-based managers. |

| Generators |
| Usage: Yield values lazily; pause and resume execution.
Tips: Memory-efficient for large or infinite sequences. Support send, throw, close protocols. |

| Coroutines (async def) |
| Usage: Asynchronous functions with await for concurrent I/O operations.
Tips: Combine with asyncio event loop. Avoid blocking calls inside coroutines. |

| Type Hints |
| Usage: Annotations specifying expected types (PEP 484).
Tips: Enable static checking with mypy. Improves readability and IDE support without runtime cost. |

| Data Classes |
| Usage: @dataclass generates __init__, __repr__, __eq__, etc automatically.
Tips: Use frozen=True for immutability. Add __post_init__ for custom validation. |

### 2. Object-Oriented Design (10)

| Composition over Inheritance |
| Usage: Build functionality by containing objects rather than subclassing.
Tips: Reduces coupling and fragile hierarchies. Follow "has-a" over "is-a" when possible. |

| SOLID Principles |
| Usage: Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion.
Tips: Apply for long-term maintainability. Especially critical in large team projects. |

| Multiple Inheritance & MRO |
| Usage: Inherit from multiple bases; Method Resolution Order controls lookup.
Tips: Use cooperative super calls. Prefer composition or mixins to avoid diamond problems. |

| Abstract Base Classes |
| Usage: Enforce interface contracts via abc module.
Tips: Better than duck typing for explicit requirements. Register virtual subclasses. |

| Magic Methods |
| Usage: Special __dunder__ methods customize object behavior.
Tips: Implement consistently (e.g., __eq__ and __hash__). Make objects feel native. |

| Properties |
| Usage: @property decorator for managed attribute access.
Tips: Encapsulate logic or validation. Avoid heavy computation in getters. |

| __slots__ |
| Usage: Restrict instance attributes to fixed set for memory savings.
Tips: Ideal for millions of instances. Incompatible with multiple inheritance. |

| Protocols (Structural Subtyping) |
| Usage: typing.Protocol defines required methods for static duck typing.
Tips: Modern, explicit alternative to ABCs. Enables better type checker support. |

| Dependency Injection |
| Usage: Pass dependencies explicitly rather than creating internally.
Tips: Enhances testability and flexibility. Manual or use lightweight injectors. |

| Factory Pattern |
| Usage: Separate object creation logic from usage.
Tips: Hide complex initialization. Useful for configuration-based instantiation. |

### 3. Functional Programming Techniques (10)

| Immutability Patterns |
| Usage: Treat data as immutable; create new objects for changes.
Tips: Use frozen dataclasses or copy. Safer for concurrency and reasoning. |

| Higher-Order Functions |
| Usage: Functions accepting or returning other functions (map, filter, sorted key=).
Tips: Concise data transformation. Prefer comprehensions for simple cases. |

| Partial Application |
| Usage: functools.partial pre-fills arguments to create specialized function.
Tips: Simplify callbacks or configuration. Alternative to lambdas. |

| Lazy Evaluation |
| Usage: Delay computation until needed (generators, itertools).
Tips: Efficient pipelines for large datasets. Avoid materializing full sequences. |

| Recursion |
| Usage: Function calls itself; elegant for tree structures.
Tips: Watch default limit (~1000). Prefer iteration or increase limit cautiously. |

| Memoization |
| Usage: Cache results of expensive pure functions.
Tips: Use @functools.cache or lru_cache. Set maxsize=None for unlimited. |

| Operator Module |
| Usage: Functional versions of operators (add, itemgetter, attrgetter).
Tips: Clean with sorted, map, reduce. Avoid lambdas for simple operations. |

| Itertools Library |
| Usage: Efficient iterators for combinations, permutations, chaining.
Tips: Building blocks for complex loops. Often faster than pure Python. |

| Lambda Expressions |
| Usage: Anonymous single-expression functions.
Tips: Keep simple and readable. Use def for anything complex. |

| Pure Functions |
| Usage: Same input always produces same output; no side effects.
Tips: Easier to test, debug, cache, and parallelize. |

### 4. Memory & Performance Concepts (11)

| Reference Counting & GC |
| Usage: Primary deallocation via refcount; gc handles cycles.
Tips: Avoid circular references. Use weakref for caches or observers. |

| String Interning |
| Usage: Reuse identical immutable strings to save memory.
Tips: Automatic for small strings; use sys.intern() for manual control. |

| Buffer Protocol |
| Usage: Access object memory directly without copying.
Tips: Used by bytes, bytearray, numpy. Improves zero-copy performance. |

| GIL (Global Interpreter Lock) |
| Usage: Allows only one thread to execute Python bytecode at once.
Tips: Use multiprocessing for CPU-bound tasks. Threading fine for I/O. |

| Profiling Tools |
| Usage: cProfile, profile, line_profiler identify bottlenecks.
Tips: Profile before optimizing. Focus on hot paths. |

| Big-O Complexity |
| Usage: Analyze algorithm time/space growth.
Tips: Choose appropriate data structures (dict O(1) lookup vs list O(n)). |

| List vs Generator |
| Usage: Lists materialize all values; generators yield lazily.
Tips: Use generators for large sequences to reduce memory footprint. |

| Copy Shallow vs Deep |
| Usage: copy.copy creates shallow; copy.deepcopy recurses.
Tips: Shallow sufficient for simple containers; deep for nested mutables. |

| C Extensions & Cython |
| Usage: Write performance-critical code in C-compatible Python.
Tips: Speed up numerical or loop-heavy sections. |

| Numba JIT |
| Usage: Just-in-time compilation for numerical functions.
Tips: Decorate with @njit for massive speedups on arrays/loops. |

| Vectorization |
| Usage: Apply operations to entire arrays instead of loops.
Tips: Use NumPy broadcasting. Often 10-100x faster than Python loops. |

### 5. Error Handling & Robustness (8)

| Exception Hierarchy |
| Usage: BaseException → Exception → specific errors.
Tips: Catch specific exceptions first. Never bare except. |

| Custom Exceptions |
| Usage: Define subclasses of Exception for domain errors.
Tips: Add context attributes. Raise with meaningful messages. |

| Finally & Else Clauses |
| Usage: finally always runs; else runs if no exception.
Tips: Use finally for cleanup. Else avoids unnecessary try nesting. |

| Context Manager for Errors |
| Usage: Suppress or convert exceptions with contextlib.suppress.
Tips: Clean resource handling even on failure. |

| Logging vs Print |
| Usage: logging module for configurable output.
Tips: Use levels (DEBUG, INFO, WARNING, ERROR). Never print in production. |

| Assertions |
| Usage: assert for debugging assumptions (disabled with -O).
Tips: Include messages. Not for data validation. |

| Defensive Programming |
| Usage: Validate inputs early; fail fast.
Tips: Use type hints + runtime checks when critical. |

| Retry Patterns |
| Usage: Retry transient failures (network, API).
Tips: Exponential backoff. Libraries like tenacity simplify. |

### 6. Code Organization & Maintainability (10)

| Modules & Packages |
| Usage: Organize code into .py files and __init__.py directories.
Tips: Keep modules focused. Use relative imports carefully. |

| __name__ == "__main__" Guard |
| Usage: Separate script execution from import behavior.
Tips: Enables reusable modules and testing entry points. |

| Docstrings (PEP 257) |
| Usage: Triple-quoted strings documenting modules, classes, functions.
Tips: Use Google or NumPy style consistently. Generate docs with Sphinx. |

| Virtual Environments |
| Usage: Isolate project dependencies (venv, pipenv, poetry).
Tips: Always use one per project. Include requirements.txt or pyproject.toml. |

| Packaging (setup.py / pyproject.toml) |
| Usage: Define distributable packages.
Tips: Use poetry or hatch for modern workflows. |

| Linting & Formatting |
| Usage: Tools like black, isort, flake8, ruff enforce style.
Tips: Automate in pre-commit hooks. Consistent style > personal preference. |

| Static Type Checking |
| Usage: mypy, pyright analyze type hints.
Tips: Gradual typing; start with --strict for new code. |

| Refactoring Principles |
| Usage: Improve code without changing behavior.
Tips: Small steps, run tests frequently. Extract functions/classes. |

| Design Patterns |
| Usage: Reusable solutions like Singleton, Observer, Strategy.
Tips: Apply when problem matches; avoid over-engineering. |

| Version Control Best Practices |
| Usage: Commit atomic changes, meaningful messages.
Tips: Branch per feature. Use .gitignore properly. |

### 7. Testing Concepts (8)

| Unit vs Integration vs End-to-End |
| Usage: Unit isolates functions; integration components; E2E full flow.
Tips: Pyramid: many unit, fewer integration, few E2E. |

| Test Frameworks |
| Usage: pytest preferred; unittest built-in.
Tips: pytest fixtures for setup. Use parametrization for data-driven tests. |

| Mocking |
| Usage: unittest.mock replaces dependencies.
Tips: Patch where used, not imported. Verify interactions when needed. |

| Coverage |
| Usage: Measure executed code percentage.
Tips: Aim 80-90%; 100% not always valuable. |

| Property-Based Testing |
| Usage: hypothesis generates inputs to falsify assumptions.
Tips: Catch edge cases manual tests miss. |

| Test-Driven Development (TDD) |
| Usage: Write failing tests first, then code.
Tips: Red-Green-Refactor cycle. Leads to better design. |

| Fixtures & Setup |
| Usage: Prepare test state (tmp_path, databases).
Tips: Scope appropriately (function, module, session). |

| BDD (Behavior-Driven Development) |
| Usage: Describe features in natural language (behave, pytest-bdd).
Tips: Bridge developers and stakeholders. |

## Tips and Best Practices
* Write readable code first; optimize only when necessary
* Follow PEP 8 style guide consistently
* Use meaningful variable and function names
* Keep functions short and single-purpose
* Document public APIs with clear docstrings
* Prefer list comprehensions over map/filter for readability
* Use context managers for resource handling
* Validate external inputs; trust internal data
* Log appropriately instead of using print statements
* Write tests early and run them often
* Use virtual environments to manage dependencies
* Avoid global state when possible
* Prefer composition over deep inheritance
* Type hint new code; gradually add to legacy
* Refactor ruthlessly but safely with tests
* Profile before optimizing performance
* Handle exceptions specifically, not with bare except
* Use dataclasses for simple data containers
* Keep third-party dependencies minimal and reviewed
* Commit early, commit often with atomic changes

## Additional Resources
* [Official Python Documentation](https://docs.python.org/3/)
* [Python PEP Index](https://peps.python.org/)
* [Effective Python - 2nd Edition](https://effectivepython.com/)
* [Fluent Python - 2nd Edition](https://www.oreilly.com/library/view/fluent-python-2nd/9781492056348/)
* [Python Cookbook](https://www.oreilly.com/library/view/python-cookbook-3rd/9781449357337/)
* [Real Python Tutorials](https://realpython.com/)
* [Python Tricks by Dan Bader](https://dabeaz-course.github.io/practical-python/)
* [Clean Code in Python](https://www.packtpub.com/product/clean-code-in-python-second-edition/9781800560215)

## Mini-Glossary

### 1. Common Terms
| Term | Description |
|------|-------------|
| Bytecode | Compiled Python code executed by interpreter |
| CPython | Reference Python implementation in C |
| PyPy | Alternative implementation with JIT compiler |
| Virtual Machine | Executes Python bytecode |
| REPL | Read-Eval-Print Loop interactive shell |
| PVM | Python Virtual Machine |
| Interpreter | Executes Python code line by line |
| GIL | Global Interpreter Lock limiting threads |

### 2. Acronyms
| Acronym | Full Form |
|---------|-----------|
| PEP | Python Enhancement Proposal |
| OOP | Object-Oriented Programming |
| FP | Functional Programming |
| JIT | Just-In-Time compilation |
| AST | Abstract Syntax Tree |
| IDE | Integrated Development Environment |
| TDD | Test-Driven Development |
| BDD | Behavior-Driven Development |

### 3. Key Concepts
| Concept | Description |
|---------|-------------|
| Zen of Python | PEP 20 principles (import this) |
| EAFP | Easier to Ask Forgiveness than Permission |
| LBYL | Look Before You Leap |
| Idempotence | Operation repeatable without side effects |
| Orthogonality | Features work independently |
| DRY | Don't Repeat Yourself principle |
| YAGNI | You Ain't Gonna Need It |

### 4. Data Model
| Term | Description |
|------|-------------|
| Iterable | Object supporting __iter__ or __getitem__ |
| Iterator | Object with __next__ for sequential access |
| Sequence | Ordered collection supporting indexing |
| Mapping | Key-value storage (dict-like) |
| Callable | Object implementing __call__ |
| Container | Supports membership testing with in |

### 5. Best Practices
| Practice | Description |
|----------|-------------|
| Explicit over implicit | Clear code preferred |
| Simple over complex | Choose straightforward solutions |
| Flat over nested | Avoid deep nesting |
| Sparse over dense | Readability counts |
| Errors never pass silently | Handle or propagate |
| Namespaces | Good idea to group related code |

### 6. Performance Patterns
| Pattern | Description |
|---------|-------------|
| Vectorization | Array operations over loops |
| Memoization | Cache expensive function results |
| Lazy loading | Defer object creation |
| Pooling | Reuse expensive objects |
| Batching | Process items in groups |

### 7. Configuration Options
| Option | Description |
|--------|-------------|
| -O | Optimize bytecode, remove asserts |
| -OO | More optimization, remove docstrings |
| PYTHONPATH | Extend module search path |
| PYTHONVERBOSE | Verbose import information |
| PYTHONOPTIMIZE | Equivalent to -O flag |

### 8. Tool Ecosystem
| Tool | Purpose |
|------|---------|
| pip | Package installer |
| venv | Virtual environment creator |
| black | Code formatter |
| ruff | Fast linter |
| mypy | Static type checker |
| pytest | Testing framework |
| poetry | Dependency and packaging manager |
| pre-commit | Git hook manager |

### 9. Common Patterns
| Pattern | Description |
|---------|-------------|
| Singleton | Ensure single instance |
| Factory | Encapsulate object creation |
| Observer | Notify dependents of changes |
| Strategy | Interchangeable algorithms |
| Decorator | Add responsibilities dynamically |
| Adapter | Interface compatibility bridge |

### 10. Troubleshooting
| Issue | Common Fix |
|-------|------------|
| IndentationError | Consistent spaces/tabs |
| NameError | Check variable spelling/scope |
| TypeError | Verify object types/operations |
| ImportError | Check module path/installation |
| MemoryError | Use generators/chunking |
| RecursionError | Increase limit or iterate |
| UnicodeError | Proper encoding handling |
| PermissionError | Check file/system permissions |
| ConnectionError | Retry with backoff |
| KeyError | Use .get() or default dict |

