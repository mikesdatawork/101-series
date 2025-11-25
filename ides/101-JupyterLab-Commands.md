# 101 JupyterLab Commands

## Overview
JupyterLab is the modern web-based IDE for notebooks, code, and data. This cheat sheet covers core shortcuts plus the most useful extension shortcuts.

### 1. Command Mode vs Edit Mode
| Concept                    | Shortcut            | Description                          |
|----------------------------|---------------------|--------------------------------------|
| Command Mode               | Esc                 | Blue sidebar – cell actions          |
| Edit Mode                  | Enter               | Green sidebar – type inside cell     |
| Run & Select Next          | Shift+Enter         | Most used shortcut                   |
| Run & Stay                 | Ctrl+Enter          | Stay on current cell                 |
| Run & Insert Below         | Alt+Enter           | Run + new cell                       |
| Toggle Output              | O (Command mode)    | Hide/show output                     |

### 2. Cell Operations (Command Mode)
| Action                     | Shortcut            | Description                          |
|----------------------------|---------------------|--------------------------------------|
| Insert Above               | A                   |                                      |
| Insert Below               | B                   |                                      |
| Delete Cells               | D D (twice)         |                                      |
| Copy / Cut / Paste         | C / X / V           |                                      |
| Undo Delete                | Z                   |                                      |
| Merge Cells                | Shift+M             |                                      |
| Split Cell                 | Ctrl+Shift+-        | Edit mode                            |
| To Code / Markdown         | Y / M               |                                      |

### 3. Running & Kernel
| Action                     | Shortcut            | Description                          |
|----------------------------|---------------------|--------------------------------------|
| Interrupt                  | I I                 |                                      |
| Restart                    | 0 0                 |                                      |
| Restart & Run All          | Toolbar restart → play |                                   |
| Clear Outputs              | Toolbar → Clear All |                                   |

### 4. Command Palette & Search
| Action                     | Shortcut                        | Description                    |
|----------------------------|---------------------------------|--------------------------------|
| Command Palette            | Ctrl+Shift+C  /  ⌘+Shift+C      | Everything                     |
| Global Search              | Ctrl+Shift+F  /  ⌘+Shift+F      | Files & symbols                |
| Find in File               | Ctrl+F        /  ⌘+F            |                                |

### 5. Terminal
| Action                     | Shortcut            | Description                          |
|----------------------------|---------------------|--------------------------------------|
| New Terminal               | File → New → Terminal |                                 |
| Interrupt                  | Ctrl+C              | Inside terminal                      |
| Clear                      | Ctrl+L              |                                      |
| Exit                       | exit or Ctrl+D      |                                      |

### 6. Debugger
| Action                     | Shortcut            | Description                          |
|----------------------------|---------------------|--------------------------------------|
| Enable                     | Bug icon (top-right)|                                      |
| Continue / Step Over       | F5 / F10            |                                      |
| Step Into / Out            | F11 / Shift+F11     |                                      |

### 7. Help
| Action                     | Shortcut                  | Description                    |
|----------------------------|---------------------------|--------------------------------|
| Contextual Help            | Shift+Tab (in function)   | Docstring                      |
| Full Doc Popup             | Shift+Tab ×4              | Expanded docs                  |

### 8. Popular Extension Shortcuts
| Extension                  | Action                  | Shortcut               | Trigger                          |
|----------------------------|-------------------------|------------------------|----------------------------------|
| jupyterlab-lsp             | Go to Definition        | F12                    | Ctrl+Click also works            |
|                            | Rename Symbol           | F2                     |                                  |
|                            | Hover Docs              | Ctrl+K Ctrl+I          |                                  |
| jupyterlab-git             | Open Git Panel          | Ctrl+Shift+G           | Sidebar → Git                    |
| jupyterlab-toc             | Toggle TOC              | Sidebar TOC icon       | Auto-generates from headings     |
| Variable Inspector         | Open Inspector          | Sidebar Variables      | Pandas viewer                    |
| Execute Time               | Show cell time          | Auto below cell        | e.g. [ 1.2s ]                    |
| Drawio                     | New Diagram             | File → New → Diagram   | Flowcharts, UML                  |

### Tips
- Install essentials:  
  `pip install jupyterlab-lsp jupyterlab-git jupyterlab-toc`
- Use Shift+Enter + Ctrl+Shift+C → 95% of daily work
- Always enable the visual debugger (bug icon)

## Resources
- [JupyterLab Docs](https://jupyterlab.readthedocs.io/)
- [Awesome Extensions](https://github.com/markusschanta/awesome-jupyterlab)

