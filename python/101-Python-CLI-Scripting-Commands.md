# 101 Python CLI Scripting Commands

## Overview
Python is an excellent language for creating command-line interfaces and automation scripts. This cheat sheet covers essential tools and techniques for building CLI applications including argparse, click, subprocess management, file system operations with pathlib, environment variables, shell scripting patterns, and automation workflows. Master these commands to create powerful, user-friendly command-line tools.

## Target Audience
- DevOps engineers automating workflows
- System administrators writing scripts
- Software developers building CLI tools
- Data engineers creating data pipelines
- Anyone automating tasks with Python

## Command Categories

### 1. Argparse Basics (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import argparse | Import argparse | CLI argument parsing | import argparse |
| parser = argparse.ArgumentParser() | Create parser | Parser initialization | parser = argparse.ArgumentParser(description='My CLI tool') |
| parser.add_argument('name') | Positional argument | Required argument | parser.add_argument('filename') |
| parser.add_argument('--flag') | Optional argument | Optional flag | parser.add_argument('--verbose') |
| parser.add_argument('-v', '--verbose') | Short and long option | Dual options | parser.add_argument('-v', '--verbose') |
| parser.parse_args() | Parse arguments | Argument parsing | args = parser.parse_args() |
| args.argument | Access argument | Argument access | filename = args.filename |
| type=int | Argument type | Type conversion | parser.add_argument('count', type=int) |
| default=value | Default value | Optional defaults | parser.add_argument('--port', default=8080) |
| required=True | Required flag | Mandatory option | parser.add_argument('--config', required=True) |
| help='description' | Help text | Documentation | parser.add_argument('--verbose', help='Enable verbose output') |
| action='store_true' | Boolean flag | True if present | parser.add_argument('--debug', action='store_true') |

### 2. Argparse Advanced (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| nargs='?' | Optional argument | Zero or one | parser.add_argument('file', nargs='?') |
| nargs='+' | One or more | Multiple required | parser.add_argument('files', nargs='+') |
| nargs='*' | Zero or more | Multiple optional | parser.add_argument('files', nargs='*') |
| nargs=N | Exact count | Fixed count | parser.add_argument('coords', nargs=3, type=float) |
| choices=['a', 'b'] | Limit choices | Value restriction | parser.add_argument('--format', choices=['json', 'xml']) |
| action='count' | Count occurrences | Verbosity levels | parser.add_argument('-v', action='count', default=0) |
| action='append' | Append values | Multiple flags | parser.add_argument('--exclude', action='append') |
| action='store_const' | Store constant | Constant value | parser.add_argument('--quiet', action='store_const', const=0) |
| dest='variable_name' | Variable name | Custom naming | parser.add_argument('-f', dest='filename') |
| metavar='NAME' | Display name | Help formatting | parser.add_argument('--output', metavar='FILE') |
| parser.add_subparsers() | Subcommands | Command hierarchy | subparsers = parser.add_subparsers(dest='command') |
| subparser = subparsers.add_parser() | Add subcommand | Subcommand creation | init_parser = subparsers.add_parser('init') |

### 3. Click Basics (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import click | Import click | CLI framework | import click |
| @click.command() | Define command | Command creation | @click.command() def main(): ... |
| @click.argument('name') | Positional argument | Required argument | @click.argument('filename') def process(filename): ... |
| @click.option('--flag') | Optional flag | Optional option | @click.option('--verbose') def main(verbose): ... |
| @click.option('-v', '--verbose') | Short and long | Dual options | @click.option('-v', '--verbose') |
| click.echo() | Output text | Console output | click.echo('Hello, World!') |
| click.prompt() | Prompt input | User input | name = click.prompt('Your name') |
| click.confirm() | Yes/no prompt | Confirmation | if click.confirm('Continue?'): ... |
| type=click.INT | Integer type | Type conversion | @click.option('--count', type=click.INT) |
| type=click.Path() | File path | Path validation | @click.option('--input', type=click.Path(exists=True)) |
| default=value | Default value | Default setting | @click.option('--port', default=8080) |
| help='description' | Help text | Documentation | @click.option('--verbose', help='Enable verbose mode') |

### 4. Click Advanced (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| @click.group() | Command group | Multi-command CLI | @click.group() def cli(): ... |
| @cli.command() | Add subcommand | Subcommand creation | @cli.command() def init(): ... |
| is_flag=True | Boolean flag | True if present | @click.option('--debug', is_flag=True) |
| multiple=True | Multiple values | Repeated options | @click.option('--exclude', multiple=True) |
| count=True | Count flag | Verbosity levels | @click.option('-v', count=True) |
| required=True | Required option | Mandatory flag | @click.option('--config', required=True) |
| type=click.Choice(['a', 'b']) | Limited choices | Value restriction | @click.option('--format', type=click.Choice(['json', 'xml'])) |
| type=click.File('r') | File object | File handling | @click.option('--input', type=click.File('r')) |
| callback=function | Validation callback | Custom validation | @click.option('--port', callback=validate_port) |
| @click.pass_context | Pass context | Context access | @click.pass_context def cmd(ctx): ... |

### 5. Subprocess Basics (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import subprocess | Import subprocess | Process execution | import subprocess |
| subprocess.run() | Run command | Command execution | subprocess.run(['ls', '-l']) |
| subprocess.run(args, capture_output=True) | Capture output | Output capture | result = subprocess.run(['ls'], capture_output=True) |
| result.stdout | Standard output | Output access | output = result.stdout.decode() |
| result.stderr | Standard error | Error output | errors = result.stderr.decode() |
| result.returncode | Exit code | Status checking | if result.returncode == 0: ... |
| subprocess.run(args, check=True) | Check for errors | Error handling | subprocess.run(['ls'], check=True) |
| subprocess.run(args, shell=True) | Shell execution | Shell commands | subprocess.run('ls -l', shell=True) |
| subprocess.run(args, cwd='path') | Working directory | Directory context | subprocess.run(['ls'], cwd='/tmp') |
| subprocess.run(args, env=dict) | Environment variables | Custom environment | subprocess.run(['cmd'], env={'VAR': 'value'}) |
| subprocess.run(args, timeout=10) | Timeout | Time limiting | subprocess.run(['sleep', '5'], timeout=10) |
| subprocess.run(args, text=True) | Text mode | String output | result = subprocess.run(['ls'], text=True, capture_output=True) |

### 6. Subprocess Advanced (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| subprocess.Popen() | Start process | Process control | proc = subprocess.Popen(['cmd']) |
| proc.communicate() | Interact with process | Input/output | stdout, stderr = proc.communicate(input='data') |
| proc.poll() | Check if running | Status check | if proc.poll() is None: ... |
| proc.wait() | Wait for completion | Process waiting | proc.wait() |
| proc.terminate() | Terminate process | Graceful stop | proc.terminate() |
| proc.kill() | Kill process | Force stop | proc.kill() |
| proc.pid | Process ID | PID access | pid = proc.pid |
| stdin=subprocess.PIPE | Pipe stdin | Input piping | proc = Popen(['cmd'], stdin=subprocess.PIPE) |
| stdout=subprocess.PIPE | Pipe stdout | Output piping | proc = Popen(['cmd'], stdout=subprocess.PIPE) |
| stderr=subprocess.PIPE | Pipe stderr | Error piping | proc = Popen(['cmd'], stderr=subprocess.PIPE) |

### 7. Pathlib Basics (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| from pathlib import Path | Import Path | Path operations | from pathlib import Path |
| Path('path') | Create path object | Path creation | path = Path('/home/user') |
| Path.cwd() | Current directory | Working directory | current = Path.cwd() |
| Path.home() | Home directory | User home | home = Path.home() |
| path.exists() | Check existence | Existence check | if path.exists(): ... |
| path.is_file() | Check if file | File check | if path.is_file(): ... |
| path.is_dir() | Check if directory | Directory check | if path.is_dir(): ... |
| path.mkdir() | Create directory | Directory creation | path.mkdir(parents=True, exist_ok=True) |
| path.rmdir() | Remove directory | Directory deletion | path.rmdir() |
| path.unlink() | Remove file | File deletion | path.unlink() |
| path.rename(new) | Rename path | Renaming | path.rename('newname.txt') |
| path.resolve() | Absolute path | Path resolution | absolute = path.resolve() |

### 8. Pathlib Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| path / 'subdir' | Join paths | Path joining | new_path = path / 'subdir' / 'file.txt' |
| path.name | File name | Name extraction | filename = path.name |
| path.stem | File name without extension | Name without ext | name = path.stem |
| path.suffix | File extension | Extension extraction | ext = path.suffix |
| path.parent | Parent directory | Parent access | parent = path.parent |
| path.parents | All parents | Ancestor access | for p in path.parents: ... |
| path.iterdir() | List directory | Directory listing | for item in path.iterdir(): ... |
| path.glob('*.txt') | Pattern matching | File searching | for file in path.glob('*.txt'): ... |
| path.rglob('*.py') | Recursive glob | Recursive search | for file in path.rglob('*.py'): ... |
| path.read_text() | Read file | Text reading | content = path.read_text() |
| path.write_text() | Write file | Text writing | path.write_text('content') |
| path.read_bytes() | Read binary | Binary reading | data = path.read_bytes() |

### 9. File System Operations (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import os | Import os | OS operations | import os |
| os.getcwd() | Get current directory | Working directory | cwd = os.getcwd() |
| os.chdir(path) | Change directory | Directory navigation | os.chdir('/tmp') |
| os.listdir(path) | List directory | Directory listing | files = os.listdir('.') |
| os.mkdir(path) | Create directory | Directory creation | os.mkdir('newdir') |
| os.makedirs(path) | Create nested directories | Recursive creation | os.makedirs('dir/subdir/deep') |
| os.remove(file) | Remove file | File deletion | os.remove('file.txt') |
| os.rmdir(dir) | Remove directory | Directory deletion | os.rmdir('emptydir') |
| os.rename(old, new) | Rename file | Renaming | os.rename('old.txt', 'new.txt') |
| os.path.exists(path) | Check existence | Existence check | if os.path.exists('file.txt'): ... |
| os.path.isfile(path) | Check if file | File check | if os.path.isfile('file.txt'): ... |
| os.path.isdir(path) | Check if directory | Directory check | if os.path.isdir('mydir'): ... |

### 10. File Path Operations (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| os.path.join() | Join paths | Path construction | path = os.path.join('dir', 'file.txt') |
| os.path.basename() | Get file name | Name extraction | name = os.path.basename('/path/to/file.txt') |
| os.path.dirname() | Get directory | Directory extraction | dir = os.path.dirname('/path/to/file.txt') |
| os.path.split() | Split path | Path splitting | dir, file = os.path.split('/path/to/file.txt') |
| os.path.splitext() | Split extension | Extension splitting | name, ext = os.path.splitext('file.txt') |
| os.path.abspath() | Absolute path | Path resolution | absolute = os.path.abspath('relative/path') |
| os.path.realpath() | Resolve symlinks | Real path | real = os.path.realpath('symlink') |
| os.path.expanduser() | Expand tilde | Home directory | path = os.path.expanduser('~/file.txt') |
| os.path.getsize() | Get file size | Size checking | size = os.path.getsize('file.txt') |
| os.path.getmtime() | Get modification time | Time checking | mtime = os.path.getmtime('file.txt') |

### 11. Environment Variables (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import os | Import os | Environment access | import os |
| os.environ | Environment dict | Env access | env = os.environ |
| os.environ['VAR'] | Get variable | Variable access | value = os.environ['PATH'] |
| os.environ.get('VAR') | Get with default | Safe access | value = os.environ.get('API_KEY', 'default') |
| os.environ['VAR'] = value | Set variable | Variable setting | os.environ['DEBUG'] = 'true' |
| os.getenv('VAR') | Get variable | Alternative access | value = os.getenv('HOME') |
| os.getenv('VAR', default) | Get with default | Safe retrieval | port = os.getenv('PORT', '8080') |
| os.putenv('VAR', value) | Set variable | Variable setting | os.putenv('PATH', '/usr/bin') |
| os.unsetenv('VAR') | Unset variable | Variable removal | os.unsetenv('TEMP_VAR') |
| 'VAR' in os.environ | Check existence | Existence check | if 'API_KEY' in os.environ: ... |

### 12. System Information (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import sys | Import sys | System access | import sys |
| sys.argv | Command arguments | Argument access | script_name = sys.argv[0] |
| sys.exit() | Exit program | Program termination | sys.exit(0) |
| sys.exit(code) | Exit with code | Error exit | sys.exit(1) |
| sys.stdin | Standard input | Input stream | data = sys.stdin.read() |
| sys.stdout | Standard output | Output stream | sys.stdout.write('text') |
| sys.stderr | Standard error | Error stream | sys.stderr.write('error') |
| sys.platform | Platform name | OS detection | if sys.platform == 'linux': ... |
| sys.version | Python version | Version info | version = sys.version |
| sys.executable | Python executable | Interpreter path | python_path = sys.executable |

### 13. File I/O (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| open('file', 'r') | Open for reading | File reading | f = open('file.txt', 'r') |
| open('file', 'w') | Open for writing | File writing | f = open('file.txt', 'w') |
| open('file', 'a') | Open for appending | File appending | f = open('file.txt', 'a') |
| open('file', 'rb') | Open binary read | Binary reading | f = open('file.bin', 'rb') |
| with open('file') as f | Context manager | Safe file handling | with open('file.txt') as f: content = f.read() |
| file.read() | Read entire file | Full read | content = f.read() |
| file.readline() | Read single line | Line reading | line = f.readline() |
| file.readlines() | Read all lines | Line list | lines = f.readlines() |
| file.write() | Write text | Text writing | f.write('Hello, World!') |
| file.writelines() | Write lines | Multiple lines | f.writelines(['line1\n', 'line2\n']) |
| file.close() | Close file | Resource cleanup | f.close() |
| file.flush() | Flush buffer | Force write | f.flush() |

### 14. JSON Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import json | Import json | JSON operations | import json |
| json.loads() | Parse JSON string | String to object | data = json.loads('{"key": "value"}') |
| json.dumps() | Serialize to JSON | Object to string | json_str = json.dumps({'key': 'value'}) |
| json.load() | Read JSON file | File reading | with open('data.json') as f: data = json.load(f) |
| json.dump() | Write JSON file | File writing | with open('data.json', 'w') as f: json.dump(data, f) |
| json.dumps(obj, indent=2) | Pretty print | Formatted output | json.dumps(data, indent=2) |
| json.dumps(obj, sort_keys=True) | Sort keys | Sorted output | json.dumps(data, sort_keys=True) |
| json.loads(str, parse_float=Decimal) | Custom parsing | Decimal precision | json.loads(text, parse_float=Decimal) |

### 15. YAML Operations (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import yaml | Import yaml | YAML operations | import yaml |
| yaml.safe_load() | Parse YAML | String to object | data = yaml.safe_load('key: value') |
| yaml.load() | Load YAML | File loading | data = yaml.load(f, Loader=yaml.FullLoader) |
| yaml.dump() | Serialize YAML | Object to string | yaml_str = yaml.dump(data) |
| yaml.safe_dump() | Safe serialize | Safe serialization | yaml_str = yaml.safe_dump(data) |
| yaml.dump(obj, file) | Write YAML file | File writing | yaml.dump(data, open('config.yaml', 'w')) |
| yaml.dump(obj, default_flow_style=False) | Block style | Readable format | yaml.dump(data, default_flow_style=False) |
| yaml.dump(obj, sort_keys=False) | Preserve order | Key ordering | yaml.dump(data, sort_keys=False) |

### 16. Logging (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import logging | Import logging | Logging setup | import logging |
| logging.basicConfig() | Configure logging | Basic setup | logging.basicConfig(level=logging.INFO) |
| logging.debug() | Debug message | Debug info | logging.debug('Debug message') |
| logging.info() | Info message | General info | logging.info('Process started') |
| logging.warning() | Warning message | Warnings | logging.warning('Low disk space') |
| logging.error() | Error message | Errors | logging.error('Failed to connect') |
| logging.critical() | Critical message | Critical issues | logging.critical('System failure') |
| logger = logging.getLogger() | Get logger | Custom logger | logger = logging.getLogger(__name__) |
| logging.basicConfig(format='...') | Set format | Log formatting | logging.basicConfig(format='%(levelname)s: %(message)s') |
| logging.basicConfig(filename='log.txt') | Log to file | File logging | logging.basicConfig(filename='app.log') |

### 17. Script Utilities (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| import shutil | Import shutil | File operations | import shutil |
| shutil.copy(src, dst) | Copy file | File copying | shutil.copy('source.txt', 'dest.txt') |
| shutil.copytree(src, dst) | Copy directory | Directory copying | shutil.copytree('sourcedir', 'destdir') |
| shutil.move(src, dst) | Move file/directory | Moving | shutil.move('source', 'destination') |
| shutil.rmtree(path) | Remove directory tree | Recursive deletion | shutil.rmtree('directory') |
| shutil.which(cmd) | Find command | Command lookup | git_path = shutil.which('git') |
| shutil.disk_usage(path) | Disk usage | Space checking | total, used, free = shutil.disk_usage('/') |
| import time | Import time | Time operations | import time |
| time.time() | Current timestamp | Unix timestamp | timestamp = time.time() |
| time.sleep(seconds) | Sleep | Delay execution | time.sleep(1) |
| import datetime | Import datetime | Date/time | import datetime |
| datetime.datetime.now() | Current datetime | Current time | now = datetime.datetime.now() |

## Tips and Best Practices
* Use argparse or click for professional CLI tools
* Always validate user input
* Provide helpful error messages
* Use pathlib for modern path handling
* Implement proper logging instead of print statements
* Handle exceptions gracefully
* Use context managers for file operations
* Set appropriate exit codes
* Provide --help documentation
* Use environment variables for configuration
* Implement dry-run modes for destructive operations
* Use subprocess safely, avoid shell=True when possible
* Add progress indicators for long operations
* Make scripts idempotent when possible
* Document script requirements and dependencies

## Additional Resources
* [Argparse Documentation](https://docs.python.org/3/library/argparse.html)
* [Click Documentation](https://click.palletsprojects.com/)
* [Pathlib Documentation](https://docs.python.org/3/library/pathlib.html)
* [Subprocess Documentation](https://docs.python.org/3/library/subprocess.html)
* [Python Command Line Applications](https://realpython.com/python-command-line-arguments/)
* [Building Command Line Tools with Click](https://click.palletsprojects.com/en/8.1.x/quickstart/)
* [The Hitchhiker's Guide to Python - CLI](https://docs.python-guide.org/scenarios/cli/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Python CLI scripting.

### Common Terms

| Term | Description |
|------|-------------|
| CLI | Command-Line Interface |
| argument | Value passed to command |
| option | Named parameter with flag |
| flag | Boolean option |
| positional argument | Required argument by position |
| subcommand | Secondary command |
| exit code | Numeric status returned |
| stdin | Standard input stream |
| stdout | Standard output stream |
| stderr | Standard error stream |

### Argparse Concepts

| Concept | Description | Example |
|---------|-------------|---------|
| Positional argument | Required by position | parser.add_argument('filename') |
| Optional argument | Flag-based | parser.add_argument('--verbose') |
| Action | What to do with arg | action='store_true' |
| Nargs | Number of arguments | nargs='+' |
| Type | Argument type | type=int |
| Default | Default value | default=10 |
| Choices | Limited options | choices=['json', 'xml'] |
| Dest | Variable name | dest='output_file' |

### Click Decorators

| Decorator | Purpose | Usage |
|-----------|---------|-------|
| @click.command() | Define command | Basic command |
| @click.group() | Command group | Multi-command CLI |
| @click.argument() | Positional arg | Required argument |
| @click.option() | Optional flag | Optional argument |
| @click.pass_context | Pass context | Context access |
| @click.pass_obj | Pass object | Object sharing |

### Subprocess Return Codes

| Code | Meaning | Convention |
|------|---------|------------|
| 0 | Success | No errors |
| 1 | General error | Generic failure |
| 2 | Misuse | Invalid usage |
| 126 | Cannot execute | Permission issue |
| 127 | Command not found | Missing command |
| 128+N | Fatal signal | Signal number |
| 130 | Ctrl+C | User interrupt |

### File Modes

| Mode | Description | Usage |
|------|-------------|-------|
| r | Read | Read existing file |
| w | Write | Create/overwrite file |
| a | Append | Add to existing file |
| r+ | Read/write | Read and write |
| rb | Read binary | Binary reading |
| wb | Write binary | Binary writing |
| ab | Append binary | Binary appending |

### Path Operations

| Operation | Purpose | Method |
|-----------|---------|--------|
| Join | Combine paths | path / 'subdir' |
| Exists | Check existence | path.exists() |
| Is file | Check if file | path.is_file() |
| Is directory | Check if dir | path.is_dir() |
| Create | Make directory | path.mkdir() |
| Delete | Remove path | path.unlink() |
| List | Directory listing | path.iterdir() |
| Glob | Pattern match | path.glob('*.txt') |

### Environment Variables

| Variable | Purpose | Common Usage |
|----------|---------|--------------|
| PATH | Executable search | Command lookup |
| HOME | User home directory | Home path |
| USER | Current username | User identification |
| PWD | Working directory | Current location |
| SHELL | Default shell | Shell type |
| LANG | Language setting | Locale |
| PYTHONPATH | Python module path | Import paths |
| VIRTUAL_ENV | Virtual environment | Venv detection |

### Common Exit Codes

| Code | Meaning | When to Use |
|------|---------|-------------|
| 0 | Success | Successful completion |
| 1 | Error | General errors |
| 2 | Misuse | Wrong arguments |
| 64 | Usage error | Command syntax |
| 65 | Data error | Input problem |
| 66 | No input | Missing input |
| 69 | Service unavailable | Service down |
| 70 | Internal error | Software error |

### Subprocess Patterns

| Pattern | Purpose | Example |
|---------|---------|---------|
| Run and wait | Execute command | subprocess.run(['ls']) |
| Capture output | Get output | run(['ls'], capture_output=True) |
| Pipe commands | Chain commands | Popen with PIPE |
| Background process | Async execution | Popen without wait |
| Timeout | Limit execution | run(['cmd'], timeout=10) |
| Shell command | Shell syntax | run('ls \| grep txt', shell=True) |

### Logging Levels

| Level | Numeric | Purpose |
|-------|---------|---------|
| DEBUG | 10 | Detailed info |
| INFO | 20 | General info |
| WARNING | 30 | Warnings |
| ERROR | 40 | Errors |
| CRITICAL | 50 | Critical issues |

### Click Types

| Type | Purpose | Example |
|------|---------|---------|
| click.INT | Integer | type=click.INT |
| click.FLOAT | Float | type=click.FLOAT |
| click.STRING | String | type=click.STRING |
| click.BOOL | Boolean | type=click.BOOL |
| click.Path() | File path | type=click.Path(exists=True) |
| click.File() | File object | type=click.File('r') |
| click.Choice() | Limited options | type=click.Choice(['a', 'b']) |

### Common Packages

| Package | Purpose | Installation |
|---------|---------|--------------|
| argparse | CLI parsing | Built-in |
| click | CLI framework | pip install click |
| pathlib | Path handling | Built-in |
| subprocess | Process execution | Built-in |
| shutil | File operations | Built-in |
| json | JSON handling | Built-in |
| yaml | YAML handling | pip install pyyaml |
| rich | Rich output | pip install rich |
| tqdm | Progress bars | pip install tqdm |

### Script Patterns

| Pattern | Purpose | Implementation |
|---------|---------|----------------|
| Main guard | Script entry | if __name__ == '__main__': |
| Argument parsing | User input | argparse/click |
| Error handling | Graceful failures | try/except |
| Logging | Debug info | logging module |
| Configuration | Settings | Config files |
| Dry run | Safe testing | --dry-run flag |
| Verbose mode | Debug output | -v flag |
| Exit codes | Status reporting | sys.exit(code) |

### File Handling Best Practices

| Practice | Purpose | Implementation |
|----------|---------|----------------|
| Context managers | Auto-cleanup | with open() as f: |
| Exception handling | Error recovery | try/except IOError |
| Path validation | Safety | Path.exists() |
| Atomic writes | Data integrity | Write temp, rename |
| Backups | Data safety | Copy before modify |
| Permissions | Access control | os.chmod() |
