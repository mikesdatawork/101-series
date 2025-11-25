# 101 JupyterLab Commands

## Overview
JupyterLab is the next-generation web-based interactive development environment for Jupyter notebooks, code, and data. This cheat sheet covers essential keyboard shortcuts, notebook/cell operations, command palette, file management, terminal, debugger, extensions, and multi-view workflows used daily by data scientists, researchers, and ML engineers.

## Target Audience
- Data scientists working with notebooks
- Machine learning engineers prototyping models
- Researchers doing exploratory analysis
- Python educators teaching with notebooks
- Anyone using JupyterLab instead of classic Jupyter Notebook

### 1. Command Mode vs Edit Mode (8)
| Concept                          | Shortcut (both OS)     | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Enter Command Mode               | Esc                    | Switch from editing to command mode              |
| Enter Edit Mode                  | Enter                  | Edit selected cell                               |
| Command Mode (blue sidebar)      | —                      | Allows cell-level actions                        |
| Edit Mode (green sidebar)        | —                      | Allows typing inside cell                        |
| Run Cell & Select Next           | Shift+Enter            | Execute and move down                            |
| Run Cell & Stay                  | Ctrl+Enter             | Execute and stay on cell                         |
| Run Cell & Insert Below          | Alt+Enter              | Execute and insert new cell below                |
| Toggle Cell Output               | O (Command mode)       | Hide/show output                                 |

### 2. Cell Operations (14)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Insert Cell Above                | A                      | Command mode                                     |
| Insert Cell Below                | B                      | Command mode                                     |
| Delete Selected Cells            | D,D (press D twice)    | Command mode                                     |
| Copy Cells                       | C                      | Command mode                                     |
| Cut Cells                        | X                      | Command mode                                     |
| Paste Cells Below                | V                      | Command mode                                     |
| Paste Cells Above                | Shift+V                | Command mode                                     |
| Undo Cell Operation              | Z                      | Command mode                                     |
| Merge Selected Cells             | Shift+M                | Command mode                                     |
| Split Cell at Cursor             | Ctrl+Shift+-           | Edit mode                                        |
| Change Cell to Code              | Y                      | Command mode                                     |
| Change Cell to Markdown          | M                      | Command mode                                     |
| Change Cell to Raw               | R                      | Command mode                                     |
| Toggle Line Numbers              | L                      | Command mode                                     |

### 3. Running & Execution (10)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Interrupt Kernel                 | I,I                    | Command mode                                     |
| Restart Kernel                   | 0,0                    | Command mode                                     |
| Restart Kernel & Run All         | Double-click restart   | Toolbar                                          |
| Run All Above                    | Ctrl+Shift+↑           | Menu                                             |
| Run All Below                    | Ctrl+Shift+↓           | Menu                                             |
| Clear All Outputs                | Esc → O → O            | Or toolbar                                       |
| Restart & Clear Output           | Toolbar button         | Common before sharing                            |

### 4. Command Palette & Search (10)
| Action                           | Shortcut (both OS)     | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Open Command Palette             | Ctrl+Shift+C / ⌘+Shift+C | All actions & commands                         |
| Search Files                     | Ctrl+Shift+F / ⌘+Shift+F | Global file search                             |
| Search in File                   | Ctrl+F / ⌘+F           | Find in current notebook/file                    |
| Replace in File                  | Ctrl+H / ⌘+Option+F    | Find & replace                                   |
| Show Keyboard Shortcuts          | Ctrl+Shift+H / ⌘+Shift+H | Full shortcut list                             |
| Activate Next Tab                | Ctrl+Shift+]           | Move right                                       |
| Activate Previous Tab            | Ctrl+Shift+[           | Move left                                        |

### 5. File & Notebook Management (12)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| New Notebook                     | File → New → Notebook | Or toolbar +                                      |
| New Python File                  | File → New → Python File | .py file                                      |
| New Terminal                     | File → New → Terminal  | Integrated shell                                 |
| Save Notebook                    | Ctrl+S / ⌘+S           | Save                                             |
| Save All                         | Ctrl+Shift+S           | Save everything                                  |
| Close Tab                        | Ctrl+W / ⌘+W           | Close current tab                                |
| Close All Other Tabs             | Right-click → Close Others | Clean workspace                              |
| Download Notebook as .ipynb      | File → Download        | Export                                           |
| Trust Notebook                   | Trust button (top)     | Enable output/rendering                          |

### 6. Markdown & Rich Output (9)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Toggle Header Level 1–6          | 1–6 (Command mode)     | #, ##, ### etc.                                  |
| Bold                             | Ctrl+B                 | Edit mode                                        |
| Italic                           | Ctrl+I                 | Edit mode                                        |
| Insert Link                      | Ctrl+K                 | Edit mode                                        |
| Insert Code (inline)             | Ctrl+`                | Edit mode                                        |
| Render All Markdown Cells        | Run all or Shift+Enter | Preview headings, tables, LaTeX                  |

### 7. Terminal Integration (8)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|----------------------------------|------------------------|--------------------------------------------------|
| Open New Terminal                | File → New → Terminal  | Or + button                                      |
| Ctrl+C in Terminal               | Ctrl+C                 | Interrupt running command                        |
| Clear Terminal                   | Ctrl+L                 | Clear screen                                     |
| Exit Terminal Session            | exit or Ctrl+D       | Close shell                                      |

### 8. Debugger (Visual Debugger) (10)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Enable Debugger                  | Bug icon (top-right)   | Turn on debugger                                 |
| Set Breakpoint                   | Click gutter           | Or F9                                            |
| Continue                         | F5                     | Run until next breakpoint                        |
| Step Over                        | F10                    | Next line                                        |
| Step Into                        | F11                    | Enter function                                   |
| Step Out                         | Shift+F11              | Exit function                                    |

### 9. Notebook Navigation (10)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Scroll Notebook Up/Down          | Page Up / Page Down    | Fast scrolling                                   |
| Go to Cell Top/Bottom            | Ctrl+Home / Ctrl+End   | Jump                                             |
| Select All Cells                 | Ctrl+A (Command mode)  | Then move/delete                                 |

### 10. Tabs & Layout (10)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| New View for Notebook            | Right-click → New View | Side-by-side same file                           |
| Drag Tab to Split                | Drag tab              | Horizontal/vertical split                        |
| Single Document Mode             | View → Single Document | Classic notebook feel                            |
| Presentation Mode                | View → Presentation    | Full-screen cells                                |

### 11. Extensions & Settings (8)
| Action                           | Method                 | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Open Extension Manager           | Sidebar gear icon      | Install/uninstall                                |
| Open Settings Editor             | Settings → Settings Editor | JSON or GUI settings                           |
| Toggle Dark Theme                | Settings → JupyterLab Theme → Dark | Switch theme                                 |

### 12. Variables & Data Viewer (9)
| Action                           | Method                 | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Open Variable Inspector          | Right-click → Open Variable Inspector | Pandas/DataFrame viewer                       |
| Open Data Explorer               | Sidebar → Table icon | Browse CSV/Parquet                                    |

### 13. Kernel Management (8)
| Action                           | Menu                   | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Change Kernel                   | Kernel → Change Kernel | Pick different Python/R/etc                      |
| Shutdown Kernel                  | Kernel → Shutdown     | Free memory                                     |
| Reconnect to Kernel              | Kernel → Reconnect     | After disconnect                                 |

### 14. Export & Sharing (8)
| Action                           | Menu                   | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Export as Python Script          | File → Export Notebook As → Python | .py file                                      |
| Export as HTML/PDF               | File → Export Notebook As → HTML/PDF | Requires nbconvert                            |

### 15. Multi-Cursor & Selection (8)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Multi-cursor                    | Ctrl+Click (Win/Linux) / ⌘+Click (macOS) | Multiple edits                               |
| Select Line                     | Ctrl+L (Edit mode)     | Select entire line                               |

### 16. Help & Documentation (8)
| Action                           | Shortcut               | Description                                      |
|----------------------------------|----------------------------------|------------------------|--------------------------------------------------|
| Show Contextual Help             | Shift+Tab (inside function) | Docstring popup                             |
| Full Docstring Popup             | Shift+Tab ×4          | Full documentation                               |

### 17. Miscellaneous Power Tools (9)
| Action                           | Shortcut / Method      | Description                                      |
|----------------------------------|------------------------|--------------------------------------------------|
| Toggle Sidebar                   | Ctrl+B / ⌘+B           | Hide/show left sidebar                           |
| Collapse All Headings            | Ctrl+Shift+[          | Clean view                                       |
| Expand All Headings              | Ctrl+Shift+]          | Show everything                                 |
| Restart Kernel & Run All         | Toolbar ↻ → ▶          | Fresh start                                     |

## Tips and Best Practices
* Always use Shift+Enter — never click the Run button
* Use Ctrl+Shift+C command palette for everything — it’s faster than menus
* Enable the visual debugger once per session — it’s extremely powerful
* Use “New View for Notebook” to compare code side-by-side
* Trust notebooks from others before running (security!)
* Install jupyterlab-lsp + pylsp for full IDE-like autocomplete
* Use @jupyter-widgets and ipywidgets for interactive controls
* Install jupyterlab-git extension for Git inside JupyterLab
* Use %load_ext autoreload and %autoreload 2 for rapid prototyping
* Restart kernel regularly during long sessions to avoid memory leaks
* Use Ctrl+Shift+- to split a cell when logic gets too long
* Export to HTML before sharing notebooks with non-technical people

## Additional Resources
* [JupyterLab Official Documentation](https://jupyterlab.readthedocs.io/)
* [JupyterLab Keyboard Shortcuts PDF](https://jupyterlab.readthedocs.io/en/stable/_static/lab-shortcuts.pdf)
* [JupyterLab GitHub Repository](https://github.com/jupyterlab/jupyterlab)
* [Awesome JupyterLab Extensions](https://github.com/markusschanta/awesome-jupyterlab)
* [JupyterLab LSP (Autocomplete & Linting)](https://github.com/jupyter-lsp/jupyterlab-lsp)
* [JupyterLab Git Extension](https://github.com/jupyterlab/jupyterlab-git)
* [Real Python – Mastering JupyterLab](https://realpython.com/jupyter-notebook-introduction/)

## Mini-Glossary

### Core Concepts
| Term                  | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| Cell                  | Executable block (code or markdown)                                         |
| Kernel                | Python/R/Julia process that runs your code                                      |
| Command Mode         | Blue sidebar — cell-level actions                                               |
| Edit Mode             | Green sidebar — typing inside cell                                              |

### Keyboard Modes
| Mode                  | How to Enter          | Color Indicator |
|-----------------------|-----------------------|-----------------|
| Command Mode        | Esc                   | Blue sidebar    |
| Edit Mode             | Enter                 | Green sidebar   |

### Common Extensions
| Extension             | Purpose                                      |
|-----------------------|----------------------------------------------|
| jupyterlab-lsp        | Full IDE autocomplete & hover               |
| jupyterlab-git       | Git integration inside JupyterLab                   |
| jupyterlab-variableinspector | Pandas/DataFrame viewer                  |
| jupyterlab-toc        | Auto table of contents                      |
| jupyterlab-execute-time | Show cell execution time                   |

