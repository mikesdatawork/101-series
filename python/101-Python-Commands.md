# 101 Python Commands

## Overview
Python is a versatile, high-level programming language known for its readability and simplicity. This cheat sheet covers essential Python commands, functions, methods, and patterns that programmers use regularly. From basic syntax to advanced features, these commands help with data manipulation, file operations, control flow, object-oriented programming, and leveraging Python's rich standard library.

## Target Audience
- Beginner and intermediate Python programmers
- Data scientists and analysts
- Web developers using Python frameworks
- Automation and DevOps engineers
- Students learning programming

## Command Categories

### 1. Basic Syntax and Variables (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `variable = value` | Variable assignment | Creating variables | `x = 42`, `name = "Python"` |
| `print()` | Display output | Showing results or debugging | `print("Hello, World!")` |
| `input()` | Get user input | Interactive programs | `name = input("Enter your name: ")` |
| `type()` | Check data type | Determining variable types | `type(42)` returns `<class 'int'>` |
| `id()` | Get object identity | Finding memory address | `id(variable)` |
| `int()` | Convert to integer | Type conversion | `int("42")` returns `42` |
| `str()` | Convert to string | Type conversion | `str(42)` returns `"42"` |
| `float()` | Convert to float | Type conversion | `float(42)` returns `42.0` |
| `bool()` | Convert to boolean | Type conversion | `bool(1)` returns `True` |
| `help()` | Get documentation | Learning about objects | `help(str)` |

### 2. Data Types and Operations (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `len()` | Get length | Finding size of sequences | `len([1, 2, 3])` returns `3` |
| `range()` | Generate sequence | Creating number ranges | `list(range(5))` returns `[0, 1, 2, 3, 4]` |
| `list()` | Create list | Converting to list type | `list("abc")` returns `['a', 'b', 'c']` |
| `dict()` | Create dictionary | Converting to dictionary | `dict([('a', 1), ('b', 2)])` |
| `set()` | Create set | Creating unique collections | `set([1, 1, 2, 3])` returns `{1, 2, 3}` |
| `tuple()` | Create tuple | Converting to tuple | `tuple([1, 2, 3])` returns `(1, 2, 3)` |
| `sum()` | Calculate sum | Adding numbers | `sum([1, 2, 3])` returns `6` |
| `max()` | Find maximum | Getting largest value | `max(5, 10, 3)` returns `10` |
| `min()` | Find minimum | Getting smallest value | `min([5, 10, 3])` returns `3` |
| `sorted()` | Sort iterable | Ordering collections | `sorted([3, 1, 2])` returns `[1, 2, 3]` |
| `reversed()` | Reverse iterable | Reversing sequences | `list(reversed([1, 2, 3]))` returns `[3, 2, 1]` |
| `enumerate()` | Enumerate items | Getting indices with values | `list(enumerate(['a', 'b']))` returns `[(0, 'a'), (1, 'b')]` |
| `zip()` | Combine iterables | Pairing elements | `list(zip([1, 2], ['a', 'b']))` returns `[(1, 'a'), (2, 'b')]` |
| `any()` | Check if any true | Testing conditions | `any([False, True, False])` returns `True` |
| `all()` | Check if all true | Testing conditions | `all([True, True, False])` returns `False` |

### 3. String Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `str.split()` | Split string | Breaking strings | `"a,b,c".split(",")` returns `['a', 'b', 'c']` |
| `str.join()` | Join strings | Combining strings | `"-".join(["a", "b", "c"])` returns `"a-b-c"` |
| `str.strip()` | Remove whitespace | Cleaning strings | `" hello ".strip()` returns `"hello"` |
| `str.replace()` | Replace substring | Substituting text | `"hello".replace("e", "a")` returns `"hallo"` |
| `str.upper()` | Convert to uppercase | Transforming text | `"hello".upper()` returns `"HELLO"` |
| `str.lower()` | Convert to lowercase | Transforming text | `"HELLO".lower()` returns `"hello"` |
| `str.format()` | Format string | Creating text templates | `"{} is {}".format("Pi", 3.14)` |
| `f"{variable}"` | f-string (3.6+) | String interpolation | `name="Python"; f"{name} rocks!"` |
| `str.find()` | Find substring | Locating text | `"hello".find("e")` returns `1` |
| `str.count()` | Count occurrences | Counting substrings | `"hello".count("l")` returns `2` |
| `str.startswith()` | Check prefix | Testing string start | `"hello".startswith("he")` returns `True` |
| `str.endswith()` | Check suffix | Testing string end | `"hello".endswith("lo")` returns `True` |

### 4. List Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `list.append()` | Add element | Adding to list | `nums = [1, 2]; nums.append(3)` |
| `list.extend()` | Add iterable | Combining lists | `[1, 2].extend([3, 4])` returns `[1, 2, 3, 4]` |
| `list.insert()` | Insert element | Adding at specific position | `[1, 3].insert(1, 2)` returns `[1, 2, 3]` |
| `list.remove()` | Remove element | Removing by value | `[1, 2, 3].remove(2)` returns `[1, 3]` |
| `list.pop()` | Remove and return | Removing by index | `[1, 2, 3].pop(1)` returns `2` |
| `list.clear()` | Remove all elements | Emptying a list | `nums = [1, 2, 3]; nums.clear()` |
| `list.index()` | Find element index | Locating an item | `[1, 2, 3].index(2)` returns `1` |
| `list.count()` | Count occurrences | Counting items | `[1, 2, 2, 3].count(2)` returns `2` |
| `list.sort()` | Sort in-place | Ordering lists | `nums = [3, 1, 2]; nums.sort()` |
| `list.reverse()` | Reverse in-place | Flipping order | `nums = [1, 2, 3]; nums.reverse()` |
| `list.copy()` | Create shallow copy | Duplicating lists | `[1, 2, 3].copy()` returns `[1, 2, 3]` |
| `list[start:end]` | Slice list | Extracting portions | `[1, 2, 3, 4][1:3]` returns `[2, 3]` |

### 5. Dictionary Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `dict[key] = value` | Set value | Adding/updating items | `d = {}; d['key'] = 'value'` |
| `dict.get()` | Get value safely | Accessing with default | `{'a': 1}.get('b', 0)` returns `0` |
| `dict.keys()` | Get all keys | Accessing keys | `{'a': 1, 'b': 2}.keys()` |
| `dict.values()` | Get all values | Accessing values | `{'a': 1, 'b': 2}.values()` |
| `dict.items()` | Get key-value pairs | Iterating key-values | `{'a': 1}.items()` returns `dict_items([('a', 1)])` |
| `dict.pop()` | Remove and return | Removing by key | `{'a': 1, 'b': 2}.pop('a')` returns `1` |
| `dict.update()` | Merge dictionaries | Combining dicts | `{'a': 1}.update({'b': 2})` |
| `dict.clear()` | Remove all items | Emptying a dict | `d = {'a': 1}; d.clear()` |
| `dict.copy()` | Create shallow copy | Duplicating dicts | `{'a': 1}.copy()` returns `{'a': 1}` |
| `key in dict` | Check key existence | Testing membership | `'a' in {'a': 1}` returns `True` |

### 6. Control Flow (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `if/elif/else` | Conditional execution | Decision making | `if x > 0: print("Positive")` |
| `for loop` | Iterate over sequence | Processing items | `for i in range(3): print(i)` |
| `while loop` | Execute while condition is true | Repeated execution | `while x < 5: x += 1` |
| `break` | Exit loop | Early termination | `for i in range(10): if i > 5: break` |
| `continue` | Skip iteration | Skipping items | `for i in range(10): if i % 2: continue` |
| `pass` | Do nothing | Placeholder | `if x > 0: pass  # TODO: implement` |
| `match/case` (3.10+) | Pattern matching | Structural matching | `match x: case 1: print("One")` |
| `ternary operator` | Inline condition | Compact conditionals | `"Even" if x % 2 == 0 else "Odd"` |

### 7. Functions (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `def function():` | Define function | Creating reusable code | `def greet(): print("Hello")` |
| `return` | Return value | Sending back results | `def add(a, b): return a + b` |
| `*args` | Variable positional args | Accepting multiple args | `def sum_all(*nums): return sum(nums)` |
| `**kwargs` | Variable keyword args | Accepting named args | `def config(**options): print(options)` |
| `lambda` | Anonymous function | Creating small functions | `square = lambda x: x**2` |
| `map()` | Apply function to iterable | Transforming collections | `list(map(len, ["a", "ab", "abc"]))` |
| `filter()` | Filter by function | Selecting items | `list(filter(lambda x: x > 0, [-1, 0, 1]))` |
| `functools.reduce()` | Reduce by function | Aggregating values | `functools.reduce(lambda a, b: a+b, [1, 2, 3])` |
| `decorators` | Enhance functions | Adding functionality | `@timer def slow_func(): ...` |
| `global/nonlocal` | Access outer scopes | Modifying outer variables | `global x; x = 10` |

### 8. Modules and Packages (6)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `import module` | Import module | Using external code | `import math` |
| `from module import x` | Import specific item | Selective imports | `from math import sqrt` |
| `import module as alias` | Import with alias | Shortening names | `import numpy as np` |
| `from module import * ` | Import all | Getting everything (not recommended) | `from math import *` |
| `__name__ == "__main__"` | Script vs import check | Entry point control | `if __name__ == "__main__": main()` |
| `pip install package` | Install package | Getting external libraries | `pip install requests` |

### 9. File Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `open()` | Open file | Reading/writing files | `with open("file.txt", "r") as f: ...` |
| `file.read()` | Read entire file | Getting all contents | `content = f.read()` |
| `file.readline()` | Read single line | Processing line by line | `line = f.readline()` |
| `file.readlines()` | Read all lines | Getting lines list | `lines = f.readlines()` |
| `file.write()` | Write to file | Saving data | `f.write("Hello, World!")` |
| `file.close()` | Close file | Releasing resources | `f.close()` |
| `with` statement | Context manager | Auto-resource handling | `with open("file.txt") as f: ...` |
| `os.path` functions | Path manipulation | Working with file paths | `os.path.join("dir", "file.txt")` |

### 10. Exception Handling (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `try/except` | Catch exceptions | Error handling | `try: x = 1/0 except ZeroDivisionError: ...` |
| `try/except/else` | Try with else | Actions when no exceptions | `try: ... except: ... else: ...` |
| `try/except/finally` | Ensure execution | Cleanup actions | `try: ... except: ... finally: ...` |
| `raise` | Trigger exception | Signaling errors | `raise ValueError("Invalid input")` |
| `assert` | Verify condition | Debugging & validation | `assert x > 0, "x must be positive"` |

### 11. Classes and OOP (5)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `class ClassName:` | Define class | Creating object types | `class Person: def __init__(self, name): ...` |
| `__init__` method | Constructor | Initializing objects | `def __init__(self, name): self.name = name` |
| `self` parameter | Instance reference | Accessing instance data | `self.attribute = value` |
| `inheritance` | Class inheritance | Code reuse | `class Student(Person): ...` |
| `super()` | Call parent class | Using parent methods | `super().__init__(name)` |

### 12. Standard Library Utilities (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| `datetime.now()` | Get current time | Time-based operations | `datetime.datetime.now()` |
| `time.sleep()` | Pause execution | Delays and timing | `time.sleep(1)  # wait 1 second` |
| `random.randint()` | Generate random integer | Random selections | `random.randint(1, 6)  # dice roll` |
| `json.dumps()` | Serialize to JSON | API interactions | `json.dumps({"name": "John"})` |
| `json.loads()` | Parse JSON string | Processing JSON data | `json.loads('{"name": "John"}')` |
| `re.match()` | Regex match | Pattern matching | `re.match(r'\d+', '123abc')` |
| `re.sub()` | Regex substitution | Text replacement | `re.sub(r'\d+', '#', '123abc')` |
| `os.listdir()` | List directory contents | File operations | `os.listdir('.')` |
| `sys.argv` | Command line args | CLI tools | `script_name = sys.argv[0]` |
| `collections.Counter` | Count hashable objects | Frequency counting | `collections.Counter("hello")` |

## Tips and Best Practices
* Use meaningful variable names
* Follow PEP 8 style guidelines
* Write docstrings for functions and classes
* Use list comprehensions for readable, concise code
* Leverage built-in functions when possible
* Handle exceptions appropriately
* Use context managers (with statement) for resource management
* Prefer explicit over implicit code
* Write modular, reusable functions
* Use virtual environments for project dependencies

## Additional Resources
* [Official Python Documentation](https://docs.python.org/)
* [Python Package Index (PyPI)](https://pypi.org/)
* [The Zen of Python (import this)](https://www.python.org/dev/peps/pep-0020/)
* [PEP 8 Style Guide](https://www.python.org/dev/peps/pep-0008/)
* [Python Cookbook](https://www.oreilly.com/library/view/python-cookbook-3rd/9781449357337/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Python.

### Common Terms

| Term | Description |
|------|-------------|
| `interpreter` | The program that reads and executes Python code |
| `REPL` | Read-Eval-Print-Loop, the interactive Python shell |
| `PEP` | Python Enhancement Proposal, design documents for Python |
| `duck typing` | Type checking based on methods/properties, not inheritance |
| `iterable` | Object capable of returning its members one at a time |
| `generator` | Function that yields values one at a time, lazily |
| `comprehension` | Compact syntax for creating lists, dicts, or sets |
| `slice` | Syntax for getting a subset of sequence elements |
| `mutable` | Object that can be changed after creation |
| `immutable` | Object that cannot be changed after creation |

### Common Flags/Options

| Flag/Option | Common Meaning | Example Usage |
|-------------|----------------|--------------|
| `-m` | Run library module as script | `python -m pip install package` |
| `-c` | Execute command | `python -c "print('Hello')"` |
| `-i` | Interactive mode after running script | `python -i script.py` |
| `-v` | Verbose output | `python -v script.py` |
| `-O` | Optimize bytecode | `python -O script.py` |
| `-B` | Don't write bytecode files | `python -B script.py` |
| `-E` | Ignore environment variables | `python -E script.py` |
| `-s` | Don't add user site directory to path | `python -s script.py` |
| `-u` | Unbuffered stdout and stderr | `python -u script.py` |
| `-h` | Show help message | `python -h` |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `BDFL` | Benevolent Dictator For Life | Guido van Rossum, Python's creator |
| `GIL` | Global Interpreter Lock | Thread execution limitation |
| `PEP` | Python Enhancement Proposal | Python design documents |
| `PyPI` | Python Package Index | Repository of Python packages |
| `venv` | Virtual Environment | Isolated Python environments |
| `OOP` | Object-Oriented Programming | Class-based programming style |
| `IDE` | Integrated Development Environment | Development tools (PyCharm, VS Code) |
| `API` | Application Programming Interface | Interfaces for interacting with code |
| `JSON` | JavaScript Object Notation | Data interchange format |
| `WSGI` | Web Server Gateway Interface | Web server and app communication spec |

### Special Characters/Syntax

| Symbol/Syntax | Name | Usage |
|---------------|------|-------|
| `#` | Hash/pound | Comment indicator |
| `"""..."""` | Triple quotes | Multiline strings/docstrings |
| `:` | Colon | Block indicator (if, for, def, etc.) |
| `_` | Underscore | Private variables, unused variables |
| `__` | Double underscore | Name mangling in classes |
| `@` | Decorator | Function modification |
| `$` | f-string expression | Expressions in formatted strings |
| `\` | Backslash | Line continuation, escape character |
| `*` | Asterisk | Unpacking iterables, variable args |
| `**` | Double asterisk | Dictionary unpacking, keyword args |

### Command/Function Syntax

Basic syntax pattern for Python commands:
```python
def function_name(parameter1, parameter2=default_value, *args, **kwargs):
    """Docstring explaining what the function does."""
    # Function body
    return result
```

* **function_name**: The name of the function (lowercase with underscores)
* **parameters**: Input values, some with default values
* **args/kwargs**: Variable number of positional/keyword arguments
* **Docstring**: Documentation string describing the function
* **return**: Value returned to the caller

Example with breakdown:
```python
def greet(name, greeting="Hello", *titles, **custom_info):
    """Return a greeting message for a person."""
    message = f"{greeting}, {' '.join(titles)} {name}!"
    for key, value in custom_info.items():
        message += f" Your {key} is {value}."
    return message

# Usage
greet("Alice", "Hi", "Dr.", "Professor", age=30, role="Developer")
```
* `greet` is the function name
* `name` is a required parameter
* `greeting` is an optional parameter with default value "Hello"
* `*titles` collects additional positional arguments into a tuple
* `**custom_info` collects keyword arguments into a dictionary
* The function returns a formatted greeting string
