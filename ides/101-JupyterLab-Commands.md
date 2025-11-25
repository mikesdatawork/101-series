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
| Delete Selected Cells      | D D                 | Command | Press D twice                            |
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
| Restart & Run All          | Toolbar restart to play   | Fresh run from top                       |
| Clear All Outputs          | Toolbar → Clear All Outputs | Clean notebook                         |

### 4. Command Palette & Search
| Action                     | Shortcut                  | Description                              |
|----------------------------|---------------------------|------------------------------------------|
| Open Command Palette       | Ctrl+Shift+C / Command+Shift+C | Access all commands                      |
| Search Files               | Ctrl+Shift+F / Command+Shift+F | Global search                            |
| Find in File               | Ctrl+F / Command+F        |                                          |
| Show All Shortcuts         | Ctrl+Shift+H / Command+Shift+H | Full list                                |

### 5. Terminal Integration
| Action                     | Shortcut            | Description                              |
|----------------------------|---------------------|------------------------------------------|
| Open New Terminal          | File → New → Terminal | Or + button                            |
| Interrupt Running Command  | Ctrl+C              | Inside terminal                          |
| Clear Terminal Screen      | Ctrl+L              |                                          |
| Exit Terminal Session      | exit or Ctrl+D      | Close shell                              |

### 6. Debugger
| Action                     | Shortcut            | Description                              |
|----------------------------|---------------------|------------------------------------------|
| Enable Debugger            | Bug icon (top right)| Turn on visual debugger                  |
| Continue                   | F5                  | Run to next breakpoint                   |
| Step Over                  | F10                 |                                          |
| Step Into                  | F11                 |                                          |
| Step Out                   | Shift+F11           |                                          |

### 7. Help & Documentation
| Action                     | Shortcut                        | Description                              |
|----------------------------|---------------------------------|------------------------------------------|
| Show Contextual Help       | Shift+Tab (inside function)     | One-line docstring                       |
| Full Docstring Popup       | Shift+Tab ×4                    | Expanded documentation                   |

### 8. JupyterLab Extension Shortcuts (Most Popular)
| Extension                  | Action                              | Shortcut (if any)               | How to Trigger                          |
|----------------------------|-------------------------------------|---------------------------------|-----------------------------------------|
| **jupyterlab-lsp**         | Go to Definition                    | F12 or Ctrl+Click               | Jump to function/class                  |
|                            | Find All References                 | Alt+F12                         |                                         |
|                            | Rename Symbol                       | F2                              | Safe rename across files                |
|                            | Show Hover Documentation            | Ctrl+K Ctrl+I                   |                                         |
| **jupyterlab-git**         | Open Git Panel                      | Ctrl+Shift+G / Command+Shift+G  | Sidebar → Git                           |
|                            | Stage/Unstage File                  | Click checkbox                  |                                         |
|                            | Commit                              | Ctrl+Enter in commit box        |                                         |
|                            | Push/Pull                           | Toolbar buttons                 |                                         |
| **jupyterlab-toc**         | Toggle Table of Contents            | Sidebar → TOC icon              | Auto-generates from headings            |
| **jupyterlab-variableinspector** | Open Variable Inspector       | Sidebar → Variables icon        | Pandas/DataFrame viewer                 |
| **jupyterlab-execute-time** | Show Cell Execution Time           | Automatically below cell        | Format: [ 12.4s ]                       |
| **jupyterlab-drawio**      | Create Diagram                      | File → New → Diagram            | Flowcharts, UML, etc.                   |
| **jupyterlab-cell-flash**  | Flash Cell on Execution             | Auto (visual cue)               | Helps track execution order             |
| **jupyterlab-shortcutui**  | Open Shortcut Editor                | Settings → Shortcut Editor      | Customize all shortcuts                 |

### 9. Tips and Best Practices
- Install these extensions immediately:
  ```bash
  pip install jupyterlab-lsp jupyterlab-git jupyterlab-toc jupyterlab-variableinspector
  jupyter labextension install @jupyterlab/toc

Master Shift+Enter + Ctrl+Shift+C — they replace 95% of mouse usage
Always enable the visual debugger (bug icon)
Use New View for Notebook to edit the same notebook side-by-side
Use %autoreload 2 in first cell for rapid prototyping
Restart kernel regularly during long sessions

Additional Resources

JupyterLab Documentation
Awesome JupyterLab Extensions
jupyterlab-lsp (IDE features)
jupyterlab-git

