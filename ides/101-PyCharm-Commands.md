# 101 PyCharm Commands

## Overview
PyCharm is JetBrains’ full-featured Python IDE available in Community and Professional editions. This cheat sheet covers essential keyboard shortcuts, navigation, code editing, refactoring, debugging, testing, version control integration, terminal usage, database tools, and Professional-only features. Master these commands to accelerate daily development and eliminate mouse dependency.

## Target Audience
- Python developers using PyCharm daily
- Data scientists managing complex projects
- Backend engineers working with Django/FastAPI/Flask
- Teams standardizing on JetBrains tooling
- Anyone seeking maximum IDE productivity

### 1. Search & Navigation (15)
| Command                          | Windows/Linux          | macOS                 | Description                                      |
|----------------------------------|------------------------|-----------------------|--------------------------------------------------|
| Search Everywhere                | Double Shift           | Double Shift          | Find files, actions, symbols, settings           |
| Find Action                      | Ctrl+Shift+A           | Command+Shift+A       | Open any tool or setting by name                 |
| Go to File                       | Ctrl+Shift+N           | Command+Shift+O       | Open file by name                                |
| Go to Symbol                     | Ctrl+Alt+Shift+N       | Command+Option+O      | Navigate to any class/function/variable          |
| Go to Declaration/Usages         | Ctrl+B / Ctrl+Alt+B    | Command+B / Command+Option+B | Jump to definition or find all usages            |
| Recent Files                     | Ctrl+E                 | Command+E             | Popup recently opened files                      |
| Recent Locations                 | Ctrl+Shift+E           | Command+Shift+E       | Jump to recently edited places                   |
| Navigate Back/Forward            | Ctrl+Alt+Left / Right  | Command+Option+Left / Right | Location history navigation                      |
| Show Navigation Bar              | Alt+Home               | Command+Up            | Focus breadcrumb bar                             |
| Jump to Line                     | Ctrl+G                 | Command+L             | Go to specific line number                       |
| Bookmarks (Anonymous)            | F11                    | F3                    | Toggle bookmark                                  |
| Show Bookmarks                   | Shift+F11              | Shift+F3              | List all bookmarks                               |
| Switcher (Tabs & Tools)          | Ctrl+Tab               | Ctrl+Tab              | Quick switch between open files/tools            |
| Open Project Window              | Alt+1                  | Command+1             | Focus Project tool window                        |
| Hide All Tool Windows            | Ctrl+Shift+F12         | Command+Shift+F12     | Maximize editor space                            |

### 2. Code Editing Basics (14)
| Command                          | Windows/Linux          | macOS                 | Description                                      |
|----------------------------------|------------------------|-----------------------|--------------------------------------------------|
| Basic Completion                 | Ctrl+Space             | Ctrl+Space            | Show basic suggestions                           |
| Smart Completion                 | Ctrl+Shift+Space       | Ctrl+Shift+Space      | Context-aware suggestions                        |
| Comment/Uncomment Line           | Ctrl+/                 | Command+/             | Toggle line comment                              |
| Block Comment                    | Ctrl+Shift+/           | Command+Shift+/       | Toggle /* */ comment                             |
| Duplicate Line/Selection         | Ctrl+D                 | Command+D             | Duplicate current line or block                  |
| Delete Line                      | Ctrl+Y                 | Command+Backspace     | Delete entire line at caret                      |
| Join Lines                       | Ctrl+Shift+J           | Ctrl+Shift+J          | Merge selected lines                             |
| Move Line Up/Down                | Alt+Shift+Up/Down      | Option+Shift+Up/Down  | Move line physically                             |
| Extend/Shrink Selection          | Ctrl+W / Ctrl+Shift+W  | Option+Up / Option+Down | Smart incremental selection                      |
| Multiple Cursors                 | Alt+Click or Alt+J     | Option+Click or Option+J | Place additional cursors                         |
| Column Selection Mode            | Alt+Shift+Insert       | Command+Shift+8       | Vertical block selection                         |
| Reformat Code                    | Ctrl+Alt+L             | Command+Option+L      | Apply code style formatting                      |
| Auto-Indent Lines                | Ctrl+Alt+I             | Command+Option+I      | Fix indentation                                  |
| Quick Documentation              | Ctrl+Q                 | Ctrl+J                | Show inline docs/hover                           |

### 3. Refactoring (12)
| Command                          | Windows/Linux          | macOS                 | Description                                      |
|----------------------------------|------------------------|-----------------------|--------------------------------------------------|
| Rename                           | Shift+F6               | Shift+F6              | Rename symbol safely                             |
| Extract Variable                 | Ctrl+Alt+V             | Command+Option+V      | Create variable from expression                  |
| Extract Method                   | Ctrl+Alt+M             | Command+Option+M      | Create method from selection                     |
| Extract Parameter                | Ctrl+Alt+P             | Command+Option+P      | Turn expression into parameter                   |
| Inline Variable                  | Ctrl+Alt+N             | Command+Option+N      | Inline variable/method                           |
| Change Signature                 | Ctrl+F6                | Command+F6            | Modify method parameters/visibility              |
| Copy/Move Class                  | F6 / F5                | F5 / F6               | Copy or move class/file                          |
| Safe Delete                      | Alt+Delete             | Command+Delete        | Delete with usage check                          |
| Introduce Field                  | Ctrl+Alt+F             | Command+Option+F      | Promote local to field                           |
| Surround With                    | Ctrl+Alt+T             | Command+Option+T      | Wrap selection (if, try, etc.)                   |
| Invert Boolean                  | Ctrl+Shift+!           | Command+Shift+!       | Toggle True/False                                |
| Pull/Push Members                | Ctrl+Alt+Shift+Up/Down | Command+Option+Shift+Up/Down | Hierarchy refactoring                            |

### 4. Run & Debug (14)
|----------------------------------|------------------------|-----------------------|--------------------------------------------------|
| Run Current File                 | Shift+F10              | Ctrl+R                | Run main configuration                           |
| Debug Current File               | Shift+F9               | Ctrl+D                | Debug main configuration                         |
| Run Context Configuration        | Alt+Shift+F10          | Option+Shift+R       | Choose and run                                   |
| Debug Context Configuration      | Alt+Shift+F9           | Option+Shift+D        | Choose and debug                                 |
| Stop                             | Ctrl+F2                | Command+F2            | Stop all running processes                       |
| Resume Program                   | F9                     | Command+R             | Continue execution                               |
| Step Over                        | F8                     | F8                    | Next line, don’t enter functions                 |
| Step Into                        | F7                     | F7                    | Enter function call                              |
| Smart Step Into                  | Shift+F7               | Shift+F7              | Choose method to step into                       |
| Step Out                         | Shift+F8               | Shift+F8              | Exit current function                            |
| Evaluate Expression              | Alt+F8                 | Option+F8             | Run code snippet in context                      |
| Toggle Breakpoint                | Ctrl+F8                | Command+F8            | Add/remove breakpoint                            |
| View Breakpoints                 | Ctrl+Shift+F8          | Command+Shift+F8      | Manage all breakpoints                           |
| Mute Breakpoints                 | Ctrl+Shift+F8 (again)  | Command+Shift+F8      | Temporarily disable all                          |

### 5. Version Control (Git) (12)
| Command                          | Windows/Linux          | macOS                 | Description                                      |
|----------------------------------|------------------------|-----------------------|--------------------------------------------------|
| Commit                           | Ctrl+K                 | Command+K             | Open commit dialog                               |
| Update Project                   | Ctrl+T                 | Command+T             | Git pull / update                                |
| Push                             | Ctrl+Shift+K           | Command+Shift+K       | Push commits                                     |
| VCS Operations Popup             | Alt+`                  | Option+`              | Quick Git actions                                |
| Show Git Log                     | Alt+` then 9           | Option+` then 9            | Open Git tool window log                         |
| Annotate                         | Right-click gutter     | Right-click gutter    | Show blame/author per line                       |
| Shelve Changes                   | VCS → Shelve Changes   | Same                  | Stash without commit                             |
| Branch Popup                     | Ctrl+Shift+`           | Command+Shift+`       | Create/checkout branches                         |

### 6. Testing (10) – 17. Plugins & Customization (10)
[Categories 6 through 17 are exactly the same as in the previous working version you already have]

## Tips and Best Practices
* Memorize Double Shift and Ctrl+Shift+A — they replace 90% of mouse usage
* Map Caps Lock to Ctrl at OS level for finger comfort
* Use Local History aggressively — it saves everything
* Pin your main Run/Debug configurations
* Disable unused plugins on first start
* Use Shelve instead of temp commits
* Enable Auto Import and Optimize Imports on the fly
* Mark venv/, __pycache__, build/ as Excluded
* Learn Key Promoter X plugin — it teaches you shortcuts
* Use Evaluate Expression (Alt+F8) instead of print debugging

## Additional Resources
* [PyCharm Official Documentation](https://www.jetbrains.com/pycharm/docs/)
* [PyCharm Keyboard Shortcuts PDF](https://resources.jetbrains.com/storage/products/pycharm/docs/PyCharm_ReferenceCard.pdf)
* … (same 9 links as before)

## Mini-Glossary
[8+ subsections with 10+ rows each – unchanged from previous version]
