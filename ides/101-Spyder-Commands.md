# 101 Spyder IDE Commands

Spyder is the Scientific Python Development Environment shipped with Anaconda.  
Perfect for data science, numerical computing, and classic .py script work.

### 1. Global Navigation
| Action                        | Windows/Linux          | macOS                  | Notes                              |
|-------------------------------|------------------------|------------------------|------------------------------------|
| Run current file              | F5                     | F5                      |                                    |
| Run selection / line          | F9                     | F9                     |                                    |
| Debug file                    | Ctrl+F5                | ⌘+F5                   |                                    |
| Step into / over / out        | F11 / F10 / F12        | Same                   |                                    |
| Continue                      | F5 (in debug)          | F5                     |                                    |
| Stop debugging                | Shift+F5               | Shift+F5               |                                    |
| Toggle breakpoint             | F12                    | F12                    | Click gutter also works            |

### 2. Editor Basics
| Action                        | Shortcut                          | Notes                              |
|-------------------------------|-----------------------------------|------------------------------------|
| Comment / uncomment           | Ctrl+1                            |                                    |
| Block comment                 | Ctrl+4 / Ctrl+5                   |                                    |
| Duplicate line               | Ctrl+Alt+↑ / ↓                    |                                    |
| Delete line                   | Ctrl+D                            |                                    |
| Find / Replace                | Ctrl+F / Ctrl+H                   |                                    |
| Find in files                 | Ctrl+Shift+F                      |                                    |
| Go to line                    | Ctrl+L                            |                                    |
| Code folding (collapse)       | Ctrl+-  (num pad)                 |                                    |

### 3. Panels & Layout
| Panel                         | Shortcut                          |
|-------------------------------|-----------------------------------|
| Variable Explorer             | Ctrl+Alt+V                        |
| IPython Console               | Ctrl+Alt+I                        |
| File Explorer                 | Ctrl+Alt+E                        |
| Outline (functions/classes)   | Ctrl+Alt+O                        |
| History log                   | Ctrl+Alt+H                        |
| Reset layout to default       | Ctrl+Shift+L                      |
| Maximize current panel        | Ctrl+Alt+Shift+M                  |

### 4. Variable Explorer Power
| Action                        | How                               |
|-------------------------------|-----------------------------------|
| View DataFrame as table       | Double-click variable             |
| Plot variable                 | Right-click → Plot                |
| Histogram                     | Right-click → Histogram           |
| Save variable to file         | Right-click → Save as…            |
| Filter / search variables     | Search box at top                 |

### 5. IPython Console Magic
| Action                        | Shortcut                          |
|-------------------------------|-----------------------------------|
| New console                   | Ctrl+T                            |
| Restart kernel                | Ctrl+. (period)                   |
| Clear console                 | Ctrl+L                            |
| Interrupt execution           | Ctrl+C (in console)               |

### 6. Find & Refactor
| Action                        | Shortcut                          |
|-------------------------------|-----------------------------------|
| Find in files                 | Ctrl+Shift+F                      |
| Replace in files              | Ctrl+Shift+H                      |
| Go to definition              | Ctrl+Click or F12                 |
| Find symbol in project        | Ctrl+Alt+Shift+F                  |

### 7. Run Configurations
| Action                        | How                               |
|-------------------------------|-----------------------------------|
| Run with custom parameters    | Run → Configuration per file → Arguments |
| Dedicated console per file    | Run → Configuration → Execute in dedicated console |

### Pro Tips
- Press F9 on a line → instant execution (no need to select)
- Use Variable Explorer + double-click instead of print() debugging
- Enable “Remove all variables before execution” in Run settings for clean state
- Install spyder-kernels in every venv → seamless switching
- Turn on “Code introspection/completion” and “Automatic code formatting” (black)

## Resources
- Spyder Docs: https://docs.spyder-ide.org
- Keyboard shortcuts PDF: https://docs.spyder-ide.org/current/_downloads/spyder-shortcuts.pdf

