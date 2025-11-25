# 101 JupyterLab Commands

## Overview
JupyterLab is the modern web-based IDE for Jupyter notebooks, code, and data. This cheat sheet covers every essential keyboard shortcut, cell workflow, command palette usage, terminal, debugger, and extension feature used daily by data scientists, researchers, and ML engineers.

## Target Audience
- Data scientists working with notebooks
- Machine learning engineers prototyping models
- Researchers doing exploratory analysis
- Python educators teaching with notebooks
- Anyone using JupyterLab instead of classic Jupyter Notebook

### 1. Command Mode vs Edit Mode
| Concept                    | Shortcut            | Description                              |
|----------------------------|---------------------|------------------------------------------|
| Enter Command Mode         | Esc                 | Blue sidebar – cell-level actions        |
| Enter Edit Mode            | Enter               | Green sidebar – type inside cell         |
| Run Cell & Select Next     | Shift+Enter         | Most common action                       |
| Run Cell & Stay            | Ctrl+Enter          | Stay on current cell                     |
| Run Cell & Insert Below    | Alt+Enter           | Run + insert new cell                    |
| Toggle Output              | O (Command mode)    | Hide/show output                         |

### 2. Cell Operations
| Action                     | Shortcut            | Mode    | Description                              |
|----------------------------|---------------------|---------|------------------------------------------|
| Insert Cell Above          | A                   | Command |                                          |
| Insert Cell Below          | B                   | Command |                                          |
| Delete Selected Cells      | D D (press D twice) | Command |                                          |
| Copy Cells                 | C                   | Command |                                          |
| Cut Cells                  | X                   | Command |                                          |
| Paste Below                | V                   | Command |                                          |
| Paste Above                | Shift+V             | Command |                                          |
| Undo Cell Operation        | Z                   | Command |                                          |
| Merge Selected Cells       | Shift+M             | Command |                                          |
| Split Cell at Cursor       | Ctrl+Shift+-        | Edit    |                                          |
| Change to Code             | Y                   | Command |                                          |
| Change to Markdown         | M                   | Command |                                          |
| Toggle Line Numbers        | L                   | Command |                                          |

### 3. Running & Execution
| Action                     | Shortcut / Method         | Description                              |
|----------------------------|---------------------------|------------------------------------------|
| Interrupt Kernel           | I I                       | Stop current execution                   |
| Restart Kernel             | 0 0                       | Full restart                             |
| Restart & Run All          | Toolbar ↻ → ▶             | Fresh run from top                       |
| Clear All Outputs          | Toolbar → Clear All Outputs | Clean notebook                         |

### 4. Command Palette & Search
| Action                     | Shortcut (Win/Linux/macOS) | Description                              |
|----------------------------|----------------------------|------------------------------------------|
| Open Command Palette       | Ctrl+Shift+C / ⌘+Shift+C   | Access all commands                      |
| Search Files               | Ctrl+Shift+F / ⌘+Shift+F   | Global file search                       |
| Find in File               | Ctrl+F / ⌘+F               |                                          |
| Show All Shortcuts         | Ctrl+Shift+H / ⌘+Shift+H   | Full shortcut list                       |

### 5. File & Notebook Management
| Action                     | Shortcut            | Description                              |
|----------------------------|---------------------|------------------------------------------|
| Save Notebook              | Ctrl+S / ⌘+S        |                                          |
| Save All                   | Ctrl+Shift+S        |                                          |
| Close Tab                  | Ctrl+W / ⌘+W        |                                          |

### 6. Markdown Formatting
| Action                     | Shortcut            | Mode | Description                              |
|----------------------------|---------------------|------|------------------------------------------|
| Header 1–6                 | 1–6                 | Command | # to ######                           |
| Bold                       | Ctrl+B / ⌘+B        | Edit | **text**                                 |
| Italic                     | Ctrl+I / ⌘+I        | Edit | *text*                                   |

### 7. Terminal Integration
| Action                     | Shortcut            | Description                              |
|----------------------------|---------------------|------------------------------------------|
| Open New Terminal          | File → New → Terminal | Or + button                          |
| Interrupt Running Command  | Ctrl+C              | Inside terminal                          |
| Clear Terminal Screen      | Ctrl+L              |                                          |
| Exit Terminal Session      | exit or Ctrl+D      | Close shell                              |

### 8. Debugger
| Action                     | Shortcut            | Description                              |
|----------------------------|---------------------|------------------------------------------|
| Enable Debugger            | Bug icon (top right)| Turn on visual debugger                  |
| Continue                   | F5                  | Run to next breakpoint                   |
| Step Over                  | F10                 |                                          |
| Step Into                  | F11                 |                                          |
| Step Out                   | Shift+F11           |                                          |

### 9. Help & Documentation
| Action                     | Shortcut                        | Description                              |
|----------------------------|---------------------------------|------------------------------------------|
| Show Contextual Help       | Shift+Tab (inside function)     | One-line docstring                       |
| Full Docstring Popup       | Shift+Tab ×4                    | Expanded documentation                   |

### 10. Tips and Best Practices
- Master **Shift+Enter** and **Ctrl+Shift+C** — they replace 95% of mouse usage
- Always enable the visual debugger (bug icon) — it's game-changing
- Use “New View for Notebook” to edit the same notebook side-by-side
- Install `jupyterlab-lsp` + `python-lsp-server` for full IDE experience
- Use `%autoreload 2` in first cell for rapid prototyping
- Restart kernel regularly during long sessions
- Export to HTML before sharing with non-technical people

## Additional Resources
- [JupyterLab Documentation](https://jupyterlab.readthedocs.io/)
- [Official Keyboard Shortcuts PDF](https://jupyterlab.readthedocs.io/en/stable/_static/lab-shortcuts.pdf)
- [Awesome JupyterLab Extensions](https://github.com/markusschanta/awesome-jupyterlab)

