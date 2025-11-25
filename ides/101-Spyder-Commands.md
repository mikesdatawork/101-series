# 101 Spyder IDE Commands

Spyder is the Scientific Python Development Environment shipped with Anaconda.  
Perfect for data science, numerical computing, and classic .py script work.

### 1. Global Navigation
| Action                        | Windows/Linux          | macOS                  | Notes                              |
|-------------------------------|------------------------|------------------------|------------------------------------|
| Run current file              | F5                     | F5                      |                                    |
| Run selection / line          | F9                     | F9                      |                                    |
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
| Go to line                    | Ctrl+L                            |                                    |

### 3. Panels & Layout
| Panel                         | Shortcut                          |
|-------------------------------|-----------------------------------|
| Variable Explorer             | Ctrl+Alt+V                        |
| IPython Console               | Ctrl+Alt+I                        |
| File Explorer                 | Ctrl+Alt+E                        |
| Outline                       | Ctrl+Alt+O                        |
| Maximize current panel        | Ctrl+Alt+Shift+M                  |

### 4. Variable Explorer – Pro Tips & Tricks
| Feature                       | How to Use                                            | Why It’s Awesome                              |
|-------------------------------|-------------------------------------------------------|-----------------------------------------------|
| Double-click any variable     | Instantly opens full viewer                           | No print() needed ever again                  |
| DataFrame → Table view        | Double-click pandas/np array                          | Excel-like grid with sorting & filtering      |
| Plot variable                 | Right-click → Plot                                    | Instant matplotlib plot                       |
| Histogram                     | Right-click → Histogram                               | One click distribution                        |
| Save variable                 | Right-click → Save as… → .npy/.csv/.mat               | Export any object directly                    |
| Search / filter variables     | Type in search box at top                             | Find that one array in 300 variables          |
| Refresh manually              | Right-click → Refresh                                 | When auto-refresh misses something           |
| Exclude huge variables        | Right-click → Exclude from view                       | Hide 10 GB arrays that freeze the pane        |
| Copy value to clipboard       | Right-click → Copy                                    | Paste shape, dtype, or actual value           |
| View as array/image           | Right-click → Show array/image                        | See images, tensors directly                  |
| Edit in-place (small arrays)  | Right-click → Edit variable                           | Change values live without re-running code    |
| Sort by name/size/type        | Click column headers                                  | Instantly see biggest memory hogs             |

### 5. IPython Console Magic
| Action                        | Shortcut                          |
|-------------------------------|-----------------------------------|
| New console                   | Ctrl+T                            |
| Restart kernel                | Ctrl+.                            |
| Clear console                 | Ctrl+L                            |

### 6. Run Configurations
| Feature                       | Setting Path                                          |
|-------------------------------|-------------------------------------------------------|
| Dedicated console per file   | Run → Configuration → Execute in dedicated console   |
| Remove all variables on run   | Run → Configuration → Remove all variables           |
| Custom working directory     | Run → Configuration → Working directory               |

### Pro Tips
- Press **F9** on any line → instant execution (no selection needed)
- **Never use print() again** — double-click in Variable Explorer instead
- Enable **"Remove all variables before execution"** → always start clean
- Sort Variable Explorer by **Size** to find memory leaks instantly
- Use **Exclude from view** on huge models/tensors to keep Spyder fast
- Right-click → **Plot** is faster than writing plt.show() every time

## Resources
- Spyder Docs: https://docs.spyder-ide.org
- Keyboard shortcuts PDF: https://docs.spyder-ide.org/current/_downloads/spyder-shortcuts.pdf

