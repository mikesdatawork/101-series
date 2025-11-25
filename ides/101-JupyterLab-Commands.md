# 101 JupyterLab Commands

## Overview
Modern web-based IDE for notebooks, code, and data.

### 1. Command/Edit Mode
| Action              | Shortcut         | Note                     |
|---------------------|------------------|--------------------------|
| Command Mode        | Esc              | Blue sidebar             |
| Edit Mode           | Enter            | Green sidebar            |
| Run & Next          | Shift+Enter      | Most used                |
| Run & Stay          | Ctrl+Enter       |                          |
| Run & Insert        | Alt+Enter        |                          |

### 2. Cell Operations (Command Mode)
| Action              | Shortcut         |
|---------------------|------------------|
| Insert Above        | A                |
| Insert Below        | B                |
| Delete              | D D              |
| Copy/Cut/Paste      | C/X/V            |
| Merge               | Shift+M          |
| Split               | Ctrl+Shift+-     |

### 3. Kernel
| Action              | Shortcut         |
|---------------------|------------------|
| Interrupt           | I I              |
| Restart             | 0 0              |

### 4. Command Palette
| Action              | Shortcut                        |
|---------------------|---------------------------------|
| Open Palette        | Ctrl+Shift+C  /  ⌘+Shift+C      |
| Search Files        | Ctrl+Shift+F  /  ⌘+Shift+F      |

### 5. Terminal
| Action              | Shortcut         |
|---------------------|------------------|
| New Terminal        | File → New → Terminal |
| Interrupt           | Ctrl+C           |
| Clear               | Ctrl+L           |

### 6. Debugger
| Action              | Shortcut         |
|---------------------|------------------|
| Enable              | Bug icon         |
| Continue/Over       | F5 / F10         |
| Into/Out            | F11 / Shift+F11  |

### 7. Help
| Action              | Shortcut                |
|---------------------|-------------------------|
| Docstring           | Shift+Tab               |
| Full Docs           | Shift+Tab ×4            |

### 8. Advanced Extensions (Pro Setup)
| Extension                    | Killer Feature                  | Shortcut / Trigger           |
|------------------------------|---------------------------------|------------------------------|
| jupyterlab-lsp               | Full IDE (go-to-def, rename)    | F12, F2, Ctrl+K Ctrl+I       |
| jupyterlab-code-formatter    | Black + isort on demand         | Ctrl+Shift+I                 |
| jupyterlab-git               | Git inside Lab                  | Ctrl+Shift+G                 |
| jupyterlab-variableinspector | Live DataFrame viewer           | Sidebar → Variables          |
| jupyterlab-execute-time      | Cell runtime                    | Auto below cell              |
| jupyterlab-toc               | Auto TOC                        | Sidebar TOC icon             |
| jupyterlab-drawio            | Diagrams in notebooks           | File → New → Diagram         |
| jupyterlab-vim               | Vim bindings                    | Auto                         |
| elyra                        | Visual pipelines                | Sidebar → Pipeline           |
| jupyterlab-deck              | Presentation mode               | View → Presentation Mode    |

One-liner install:
pip install jupyterlab-lsp jupyterlab-code-formatter jupyterlab-git jupyterlab-variableinspector jupyterlab-execute-time jupyterlab-toc jupyterlab-drawio jupyterlab-vim elyra jupyterlab-deck && jupyter lab build

Pro tip: Ctrl+Shift+I → instant perfect formatting

## Resources
https://github.com/markusschanta/awesome-jupyterlab

