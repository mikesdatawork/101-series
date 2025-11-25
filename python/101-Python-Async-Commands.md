# 101 Python Async Commands

## Overview
Python's asynchronous programming capabilities enable efficient handling of I/O-bound operations, concurrent task execution, and scalable application development. This cheat sheet covers essential async/await patterns, event loop management, concurrent execution, threading, multiprocessing, and related tools that enable high-performance Python applications.

## Target Audience
- Backend developers building scalable APIs
- Data engineers handling concurrent data pipelines
- Web scraping and automation developers
- Systems programmers optimizing I/O operations
- Anyone building high-performance Python applications

## Command Categories

### 1. Basic Async/Await (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| async def function() | Define coroutine function | Creating async functions | async def fetch_data(): return data |
| await expression | Wait for coroutine | Executing async operations | result = await fetch_data() |
| asyncio.run() | Run async main function | Entry point for async programs | asyncio.run(main()) |
| asyncio.create_task() | Create task from coroutine | Running coroutines concurrently | task = asyncio.create_task(fetch()) |
| asyncio.gather() | Run multiple coroutines | Concurrent execution | results = await asyncio.gather(task1, task2) |
| asyncio.sleep() | Async sleep | Non-blocking delays | await asyncio.sleep(1) |
| asyncio.wait_for() | Timeout for coroutine | Adding time limits | await asyncio.wait_for(coro, timeout=5) |
| asyncio.shield() | Protect from cancellation | Preventing task cancellation | await asyncio.shield(important_task) |
| asyncio.timeout() | Context manager timeout | Time-limited operations | async with asyncio.timeout(10): ... |
| asyncio.current_task() | Get current task | Task introspection | task = asyncio.current_task() |

### 2. Event Loop Management (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.get_event_loop() | Get current event loop | Loop access | loop = asyncio.get_event_loop() |
| asyncio.new_event_loop() | Create new event loop | Custom loop creation | loop = asyncio.new_event_loop() |
| asyncio.set_event_loop() | Set event loop | Configuring loop | asyncio.set_event_loop(loop) |
| loop.run_until_complete() | Run coroutine to completion | Executing single coroutine | loop.run_until_complete(coro) |
| loop.run_forever() | Run loop indefinitely | Server applications | loop.run_forever() |
| loop.stop() | Stop running loop | Graceful shutdown | loop.stop() |
| loop.close() | Close event loop | Cleanup | loop.close() |
| loop.is_running() | Check if loop running | Loop state checking | if loop.is_running(): ... |
| loop.is_closed() | Check if loop closed | Validation | if loop.is_closed(): ... |
| loop.call_soon() | Schedule callback | Immediate execution | loop.call_soon(callback, *args) |
| loop.call_later() | Schedule delayed callback | Timed execution | loop.call_later(5, callback) |
| loop.call_at() | Schedule at specific time | Absolute timing | loop.call_at(when, callback) |

### 3. Task Management (11)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.Task() | Task constructor | Manual task creation | task = asyncio.Task(coro) |
| task.cancel() | Cancel task | Stopping tasks | task.cancel() |
| task.cancelled() | Check if cancelled | Task status | if task.cancelled(): ... |
| task.done() | Check if completed | Completion checking | if task.done(): ... |
| task.result() | Get task result | Retrieving values | result = task.result() |
| task.exception() | Get task exception | Error handling | exc = task.exception() |
| task.add_done_callback() | Add completion callback | Post-processing | task.add_done_callback(callback) |
| task.remove_done_callback() | Remove callback | Callback management | task.remove_done_callback(callback) |
| task.get_name() | Get task name | Debugging | name = task.get_name() |
| task.set_name() | Set task name | Task identification | task.set_name("fetcher") |
| asyncio.all_tasks() | Get all tasks | Task monitoring | tasks = asyncio.all_tasks() |

### 4. Futures (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.Future() | Create future object | Low-level async primitives | future = asyncio.Future() |
| future.set_result() | Set future result | Resolving futures | future.set_result(value) |
| future.set_exception() | Set future exception | Error signaling | future.set_exception(exc) |
| future.result() | Get future result | Retrieving values | result = future.result() |
| future.exception() | Get future exception | Error checking | exc = future.exception() |
| future.done() | Check if completed | Status checking | if future.done(): ... |
| future.cancelled() | Check if cancelled | Cancellation checking | if future.cancelled(): ... |
| future.add_done_callback() | Add callback | Completion handling | future.add_done_callback(fn) |

### 5. Concurrent Execution (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.wait() | Wait for multiple tasks | Complex task coordination | done, pending = await asyncio.wait(tasks) |
| asyncio.as_completed() | Iterate over completing tasks | Processing as ready | for coro in asyncio.as_completed(tasks): ... |
| asyncio.gather() with exceptions | Gather with error handling | Collecting results | results = await asyncio.gather(*tasks, return_exceptions=True) |
| asyncio.TaskGroup() | Structured concurrency | Managing task groups | async with asyncio.TaskGroup() as tg: ... |
| tg.create_task() | Create task in group | Group task creation | tg.create_task(coro) |
| asyncio.wait() with FIRST_COMPLETED | Wait for first completion | Racing tasks | done, pending = await asyncio.wait(tasks, return_when=FIRST_COMPLETED) |
| asyncio.wait() with FIRST_EXCEPTION | Wait for first exception | Error detection | done, pending = await asyncio.wait(tasks, return_when=FIRST_EXCEPTION) |
| asyncio.wait() with ALL_COMPLETED | Wait for all completions | Full completion | done, pending = await asyncio.wait(tasks, return_when=ALL_COMPLETED) |
| loop.run_in_executor() | Run blocking code | CPU-bound operations | result = await loop.run_in_executor(None, blocking_func) |
| asyncio.to_thread() | Run in thread pool | Threading bridge | result = await asyncio.to_thread(blocking_func) |

### 6. Asyncio Streams (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.open_connection() | Open TCP connection | Client connections | reader, writer = await asyncio.open_connection(host, port) |
| asyncio.start_server() | Start TCP server | Server creation | server = await asyncio.start_server(handler, host, port) |
| reader.read() | Read bytes | Reading data | data = await reader.read(1024) |
| reader.readline() | Read line | Line-based protocols | line = await reader.readline() |
| reader.readexactly() | Read exact bytes | Fixed-size reads | data = await reader.readexactly(100) |
| reader.readuntil() | Read until separator | Delimiter-based reads | data = await reader.readuntil(b'\n') |
| writer.write() | Write bytes | Sending data | writer.write(data) |
| writer.drain() | Flush write buffer | Ensuring delivery | await writer.drain() |

### 7. Asyncio Queues (9)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.Queue() | Create async queue | Producer-consumer patterns | queue = asyncio.Queue() |
| queue.put() | Add item to queue | Producing items | await queue.put(item) |
| queue.get() | Get item from queue | Consuming items | item = await queue.get() |
| queue.task_done() | Mark task complete | Task tracking | queue.task_done() |
| queue.join() | Wait for queue empty | Completion synchronization | await queue.join() |
| queue.qsize() | Get queue size | Monitoring | size = queue.qsize() |
| queue.empty() | Check if empty | Status checking | if queue.empty(): ... |
| queue.full() | Check if full | Capacity checking | if queue.full(): ... |
| asyncio.PriorityQueue() | Priority-based queue | Ordered processing | pq = asyncio.PriorityQueue() |

### 8. Asyncio Synchronization (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| asyncio.Lock() | Create async lock | Resource protection | lock = asyncio.Lock() |
| async with lock | Acquire lock | Critical sections | async with lock: ... |
| lock.acquire() | Acquire lock manually | Manual locking | await lock.acquire() |
| lock.release() | Release lock | Manual unlocking | lock.release() |
| lock.locked() | Check lock status | Status checking | if lock.locked(): ... |
| asyncio.Event() | Create event | Signaling between tasks | event = asyncio.Event() |
| event.set() | Set event | Triggering waiters | event.set() |
| event.clear() | Clear event | Resetting event | event.clear() |
| event.wait() | Wait for event | Blocking on event | await event.wait() |
| asyncio.Semaphore() | Create semaphore | Limited concurrency | sem = asyncio.Semaphore(5) |

### 9. Threading (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| threading.Thread() | Create thread | Thread creation | thread = threading.Thread(target=func) |
| thread.start() | Start thread | Thread execution | thread.start() |
| thread.join() | Wait for thread | Thread synchronization | thread.join() |
| thread.is_alive() | Check thread status | Status checking | if thread.is_alive(): ... |
| threading.Lock() | Create thread lock | Thread safety | lock = threading.Lock() |
| with lock | Acquire thread lock | Critical sections | with lock: ... |
| threading.RLock() | Reentrant lock | Recursive locking | rlock = threading.RLock() |
| threading.Event() | Thread event | Thread signaling | event = threading.Event() |
| threading.Semaphore() | Thread semaphore | Limited access | sem = threading.Semaphore(3) |
| threading.Condition() | Condition variable | Complex synchronization | cond = threading.Condition() |
| threading.Barrier() | Synchronization barrier | Multi-thread sync | barrier = threading.Barrier(5) |
| threading.Timer() | Delayed execution | Scheduled tasks | timer = threading.Timer(5, func) |

### 10. Multiprocessing (11)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| multiprocessing.Process() | Create process | Process creation | proc = multiprocessing.Process(target=func) |
| process.start() | Start process | Process execution | proc.start() |
| process.join() | Wait for process | Process synchronization | proc.join() |
| process.is_alive() | Check process status | Status checking | if proc.is_alive(): ... |
| process.terminate() | Force terminate | Process stopping | proc.terminate() |
| multiprocessing.Pool() | Process pool | Parallel processing | pool = multiprocessing.Pool(4) |
| pool.map() | Map function to data | Parallel mapping | results = pool.map(func, data) |
| pool.apply_async() | Async apply | Non-blocking execution | result = pool.apply_async(func, args) |
| multiprocessing.Queue() | Process-safe queue | Inter-process communication | queue = multiprocessing.Queue() |
| multiprocessing.Pipe() | Create pipe | Process communication | parent_conn, child_conn = multiprocessing.Pipe() |
| multiprocessing.Manager() | Shared state manager | Shared objects | manager = multiprocessing.Manager() |

### 11. Concurrent.futures (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| ThreadPoolExecutor() | Thread pool executor | Thread-based concurrency | executor = ThreadPoolExecutor(max_workers=5) |
| ProcessPoolExecutor() | Process pool executor | Process-based concurrency | executor = ProcessPoolExecutor(max_workers=4) |
| executor.submit() | Submit task | Task submission | future = executor.submit(func, args) |
| executor.map() | Map function | Parallel mapping | results = executor.map(func, data) |
| executor.shutdown() | Shutdown executor | Cleanup | executor.shutdown(wait=True) |
| as_completed() | Iterate completing futures | Processing as ready | for future in as_completed(futures): ... |
| wait() | Wait for futures | Future synchronization | done, pending = wait(futures) |
| future.result() | Get future result | Retrieving values | result = future.result() |
| future.exception() | Get future exception | Error handling | exc = future.exception() |
| future.add_done_callback() | Add callback | Completion handling | future.add_done_callback(callback) |

### 12. Error Handling and Debugging (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| try/except with await | Async exception handling | Error catching | try: await coro except Exception: ... |
| asyncio.CancelledError | Catch cancellation | Cancellation handling | except asyncio.CancelledError: ... |
| asyncio.TimeoutError | Catch timeout | Timeout handling | except asyncio.TimeoutError: ... |
| task.print_stack() | Print task stack | Debugging | task.print_stack() |
| asyncio.get_running_loop() | Get running loop | Loop inspection | loop = asyncio.get_running_loop() |
| loop.set_debug() | Enable debug mode | Debugging | loop.set_debug(True) |
| warnings.simplefilter() | Configure warnings | Development mode | warnings.simplefilter('always', ResourceWarning) |
| asyncio.set_event_loop_policy() | Set loop policy | Platform configuration | asyncio.set_event_loop_policy(policy) |
| loop.set_exception_handler() | Custom exception handler | Global error handling | loop.set_exception_handler(handler) |
| loop.call_exception_handler() | Invoke handler | Error reporting | loop.call_exception_handler(context) |

## Tips and Best Practices
* Always use async with for async context managers
* Avoid blocking operations in async functions
* Use asyncio.gather() for concurrent execution of independent tasks
* Implement proper cancellation handling with try/except CancelledError
* Use asyncio.wait_for() to add timeouts to operations
* Prefer asyncio.TaskGroup() for structured concurrency
* Use asyncio.to_thread() for blocking I/O operations
* Close connections and cleanup resources in finally blocks
* Use semaphores to limit concurrent operations
* Enable debug mode during development
* Avoid mixing async and sync code inappropriately
* Use queues for producer-consumer patterns
* Test async code with pytest-asyncio
* Profile async applications with asyncio debug tools

## Additional Resources
* [Python Asyncio Documentation](https://docs.python.org/3/library/asyncio.html)
* [Real Python Async IO Tutorial](https://realpython.com/async-io-python/)
* [AIOHTTP Documentation](https://docs.aiohttp.org/)
* [Trio Framework](https://trio.readthedocs.io/)
* [AsyncIO Cheatsheet](https://cheat.readthedocs.io/en/latest/python/asyncio.html)
* [Understanding Async Python](https://www.blog.pythonlibrary.org/2016/07/26/python-3-an-intro-to-asyncio/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to asynchronous Python programming.

### Common Terms

| Term | Description |
|------|-------------|
| coroutine | Function defined with async def that can be paused and resumed |
| event loop | Core execution mechanism that manages and runs async tasks |
| task | Wrapper around a coroutine that schedules it for execution |
| future | Low-level awaitable object representing eventual result |
| awaitable | Object that can be used with await keyword |
| concurrency | Multiple tasks making progress without necessarily running simultaneously |
| parallelism | Multiple tasks running simultaneously on different processors |
| blocking | Operation that prevents other code from running |
| non-blocking | Operation that allows other code to run while waiting |
| callback | Function executed when async operation completes |

### Common Patterns

| Pattern | Description |
|---------|-------------|
| producer-consumer | Pattern using queues for task distribution |
| fan-out/fan-in | Distribute work to many tasks then gather results |
| rate limiting | Using semaphores to control concurrency |
| circuit breaker | Preventing cascading failures in async systems |
| retry with backoff | Retrying failed async operations with delays |
| timeout pattern | Adding time limits to async operations |
| graceful shutdown | Properly cleaning up async resources |
| task groups | Structured concurrency using context managers |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| GIL | Global Interpreter Lock | Python threading limitation |
| I/O | Input/Output | File, network, database operations |
| CPU | Central Processing Unit | Computation-heavy operations |
| API | Application Programming Interface | Web service interfaces |
| TCP | Transmission Control Protocol | Network connections |
| HTTP | Hypertext Transfer Protocol | Web requests |
| WSGI | Web Server Gateway Interface | Sync web applications |
| ASGI | Asynchronous Server Gateway Interface | Async web applications |

### Async vs Sync Comparison

| Concept | Synchronous | Asynchronous |
|---------|-------------|--------------|
| Function definition | def func() | async def func() |
| Waiting | time.sleep(1) | await asyncio.sleep(1) |
| Execution | func() | await func() |
| Multiple tasks | Sequential execution | Concurrent with gather/create_task |
| File I/O | open() | aiofiles.open() |
| HTTP requests | requests.get() | aiohttp.ClientSession().get() |
| Database | psycopg2 | asyncpg |

### Performance Considerations

| Scenario | Best Approach | Reason |
|----------|--------------|--------|
| I/O-bound tasks | asyncio | Efficient waiting with event loop |
| CPU-bound tasks | multiprocessing | True parallelism across cores |
| Mixed workload | asyncio + run_in_executor | Combine approaches |
| Many connections | asyncio | Low memory overhead per connection |
| Heavy computation | ProcessPoolExecutor | Bypass GIL limitation |
| Database queries | asyncio with async drivers | Non-blocking I/O |
| File operations | asyncio with aiofiles | Concurrent file handling |

### Common Async Libraries

| Library | Purpose | Usage |
|---------|---------|-------|
| aiohttp | Async HTTP client/server | Web requests and APIs |
| asyncpg | Async PostgreSQL driver | Database operations |
| aiofiles | Async file operations | File I/O |
| aioredis | Async Redis client | Caching and messaging |
| motor | Async MongoDB driver | NoSQL operations |
| httpx | Modern async HTTP client | Alternative to aiohttp |
| trio | Alternative async framework | Structured concurrency |
| anyio | Compatibility layer | Framework-agnostic code |
