# 101 Linux Terminal Editor Micro Commands

## Overview
Micro is a modern, intuitive terminal-based text editor written in Go, designed to be easy to use with Nano-like keybindings but with advanced features like mouse support, true color, and plugin capabilities. This cheat sheet covers installation, basic editing, navigation, selection, search/replace, macros, configuration, plugins, and troubleshooting for Micro. Mastering Micro provides a fast, modern alternative to Nano with better usability in the terminal.

## Target Audience
- Developers seeking Nano-like simplicity
- System administrators needing quick edits
- Power users wanting mouse support
- Beginners transitioning from GUI editors
- Anyone preferring modern keybindings

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install micro | Install on Debian/Ubuntu | Debian-based | sudo apt install micro |
| sudo dnf install micro | Install on Fedora | RPM-based | sudo dnf install micro |
| sudo pacman -S micro | Install on Arch/Manjaro | Arch-based | sudo pacman -S micro |
| brew install micro | Install on macOS | Homebrew | brew install micro |
| micro --version | Check version | Verify install | micro --version |
| micro -version | Alternative check | Version info | micro -version |
| micro ~/.config/micro/settings.json | Edit config | Customization | micro ~/.config/micro/settings.json |
| micro -config | Open config dir | Quick access | micro -config |
| micro -plugin install | Install plugin | Plugin manager | micro -plugin install |
| curl https://getmic.ro | bash | Download binary | curl https://getmic.ro | bash |

### 2. Basic Navigation (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Arrow keys | Move cursor | Basic navigation | Up/Down/Left/Right |
| Ctrl+Left | Previous word | Word left | Ctrl+Left |
| Ctrl+Right | Next word | Word right | Ctrl+Right |
| Home | Start of line | Line start | Home |
| End | End of line | Line end | End |
| Page Up | Previous page | Scroll up | Page Up |
| Page Down | Next page | Scroll down | Page Down |
| Ctrl+Home | Start of file | Top | Ctrl+Home |
| Ctrl+End | End of file | Bottom | Ctrl+End |
| Ctrl+G | Go to line | Jump | Ctrl+G |

### 3. Editing Commands (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+X | Cut | Delete selection | Ctrl+X |
| Ctrl+C | Copy | Copy selection | Ctrl+C |
| Ctrl+V | Paste | Insert | Ctrl+V |
| Ctrl+Z | Undo | Revert | Ctrl+Z |
| Ctrl+Y | Redo | Restore | Ctrl+Y |
| Backspace | Delete backward | Remove char | Backspace |
| Delete | Delete forward | Remove char | Delete |
| Ctrl+Backspace | Delete word backward | Clean | Ctrl+Backspace |
| Ctrl+Delete | Delete word forward | Clean | Ctrl+Delete |
| Ctrl+D | Delete line | Remove line | Ctrl+D |
| Ctrl+U | Delete to start of line | Clear | Ctrl+U |
| Ctrl+K | Delete to end of line | Clear | Ctrl+K |

### 4. Selection and Clipboard (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Shift+Arrow | Select text | Basic selection | Shift+Right |
| Ctrl+A | Select all | Full file | Ctrl+A |
| Ctrl+X | Cut selection | Cut | Ctrl+X |
| Ctrl+C | Copy selection | Copy | Ctrl+C |
| Ctrl+V | Paste | Insert | Ctrl+V |
| Ctrl+Shift+C | Copy to system clipboard | External | Ctrl+Shift+C |
| Ctrl+Shift+V | Paste from system clipboard | External | Ctrl+Shift+V |
| Alt+A | Select all | Alternative | Alt+A |

### 5. Search and Replace (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+F | Find | Search | Ctrl+F |
| Ctrl+G | Find next | Next match | Ctrl+G |
| Ctrl+Shift+F | Find previous | Previous | Ctrl+Shift+F |
| Ctrl+H | Replace | Replace | Ctrl+H |
| Ctrl+Alt+F | Find with regex | Advanced | Ctrl+Alt+F |
| Ctrl+Alt+H | Replace with regex | Advanced | Ctrl+Alt+H |
| Ctrl+Shift+H | Replace all | Global | Ctrl+Shift+H |
| Ctrl+F then Enter | Exit search | Done | Ctrl+F Enter |

### 6. File Operations (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+S | Save | Write | Ctrl+S |
| Ctrl+Q | Quit | Exit | Ctrl+Q |
| Ctrl+O | Open file | New file | Ctrl+O |
| Ctrl+Shift+S | Save as | Rename | Ctrl+Shift+S |
| Ctrl+Shift+T | New tab | Multi-file | Ctrl+Shift+T |
| Ctrl+Tab | Next tab | Switch | Ctrl+Tab |
| Ctrl+Shift+Tab | Previous tab | Switch | Ctrl+Shift+Tab |
| Ctrl+W | Close tab | Close | Ctrl+W |
| Ctrl+N | New file | Empty | Ctrl+N |
| Ctrl+R | Reload file | Refresh | Ctrl+R |

### 7. Configuration (settings.json) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| "tabsize": 4 | Tab width | Indent | In settings.json |
| "tabstospaces": true | Tabs to spaces | Clean | In settings.json |
| "autoindent": true | Auto indent | Smart | In settings.json |
| "rmtrailing": true | Trim trailing spaces | Clean | In settings.json |
| "savehistory": true | Remember history | UX | In settings.json |
| "colorscheme": "monokai" | Theme | Visual | In settings.json |
| "cursorline": true | Highlight cursor line | Visual | In settings.json |
| "statusline": true | Show status | Info | In settings.json |
| "softwrap": true | Soft wrap lines | Readable | In settings.json |
| "mouse": true | Enable mouse | Click | In settings.json |

### 8. Plugins (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| micro -plugin install | Install plugin | Add features | micro -plugin install |
| micro -plugin list | List installed | View | micro -plugin list |
| micro -plugin update | Update plugins | Sync | micro -plugin update |
| micro -plugin remove | Remove plugin | Cleanup | micro -plugin remove |
| Ctrl+E | Open command bar | Run plugin | Ctrl+E |
| micro -plugin install comment | Comment plugin | Code | micro -plugin install comment |
| micro -plugin install filemanager | File explorer | Navigation | micro -plugin install filemanager |
| micro -plugin install autoclose | Auto close brackets | Typing | micro -plugin install autoclose |

### 9. Macros (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+E | Open command bar | Start macro | Ctrl+E |
| recordmacro <name> | Start recording | Macro | recordmacro mymacro |
| stopmacro | Stop recording | End | stopmacro |
| playmacro <name> | Play macro | Execute | playmacro mymacro |
| Ctrl+E then recordmacro | Record | Advanced | Ctrl+E recordmacro |
| Ctrl+E then playmacro | Play | Advanced | Ctrl+E playmacro |
| Ctrl+E then listmacros | List | View | Ctrl+E listmacros |
| Ctrl+E then deletemacro | Delete | Cleanup | Ctrl+E deletemacro |

### 10. Common Keybindings (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+S | Save | Essential | Ctrl+S |
| Ctrl+Q | Quit | Essential | Ctrl+Q |
| Ctrl+O | Open | Essential | Ctrl+O |
| Ctrl+F | Find | Essential | Ctrl+F |
| Ctrl+H | Replace | Essential | Ctrl+H |
| Ctrl+Z | Undo | Essential | Ctrl+Z |
| Ctrl+Y | Redo | Essential | Ctrl+Y |
| Ctrl+A | Select all | Essential | Ctrl+A |
| Ctrl+X | Cut | Essential | Ctrl+X |
| Ctrl+C | Copy | Essential | Ctrl+C |

### 11. Terminal Integration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+E then terminal | Open terminal | Shell | Ctrl+E terminal |
| Ctrl+E then pwd | Copy path | Clipboard | Ctrl+E pwd |
| Ctrl+E then date | Copy date | Clipboard | Ctrl+E date |
| Ctrl+E then uptime | Copy uptime | Clipboard | Ctrl+E uptime |
| Ctrl+E then exec | Run command | Advanced | Ctrl+E exec |
| Ctrl+E then plugin | Manage plugins | Quick | Ctrl+E plugin |
| Ctrl+E then config | Edit config | Quick | Ctrl+E config |
| Ctrl+E then help | Show help | Quick | Ctrl+E help |

### 12. Troubleshooting (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| micro -version | Check version | Verify | micro -version |
| micro -debug | Debug mode | Fix | micro -debug |
| micro -safe | Safe mode | No config | micro -safe |
| micro -config | Open config | Fix | micro -config |
| micro -plugin update | Update plugins | Fix | micro -plugin update |
| micro -plugin remove | Remove bad plugin | Fix | micro -plugin remove |
| Ctrl+Q | Force quit | Stuck | Ctrl+Q |
| Ctrl+G | Go to line | Navigation | Ctrl+G |
| micro -help | Show help | Options | micro -help |
| micro -plugin list | Check plugins | Debug | micro -plugin list |

### 13. Advanced Editing (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Alt+Up/Down | Move line up/down | Reorder | Alt+Up |
| Ctrl+Shift+Up/Down | Duplicate line | Copy | Ctrl+Shift+Up |
| Ctrl+Shift+D | Duplicate selection | Copy | Ctrl+Shift+D |
| Ctrl+E then comment | Toggle comment | Code | Ctrl+E comment |
| Ctrl+E then indent | Indent selection | Code | Ctrl+E indent |
| Ctrl+E then outdent | Outdent selection | Code | Ctrl+E outdent |
| Ctrl+E then format | Format code | Clean | Ctrl+E format |
| Ctrl+E then sort | Sort lines | Organize | Ctrl+E sort |

### 14. Mouse Support (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Click | Move cursor | Navigation | Click |
| Double-click | Select word | Quick | Double-click |
| Triple-click | Select line | Quick | Triple-click |
| Drag | Select text | Selection | Drag mouse |
| Middle-click | Paste | Quick paste | Middle-click |
| Scroll wheel | Scroll | Navigation | Scroll |

### 15. Colors and Themes (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| "colorscheme": "monokai" | Set theme | Visual | In settings.json |
| "colorscheme": "solarized" | Solarized theme | Visual | In settings.json |
| "colorscheme": "gruvbox" | Gruvbox theme | Visual | In settings.json |
| micro -colorscheme list | List themes | View | micro -colorscheme list |
| micro -colorscheme default | Reset | Default | micro -colorscheme default |
| micro -colorscheme random | Random theme | Fun | micro -colorscheme random |

### 16. Common Use Cases (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| micro config.json | Edit config | Setup | micro config.json |
| micro script.sh | Edit script | Code | micro script.sh |
| micro /etc/hosts | Edit system | Root | sudo micro /etc/hosts |
| micro README.md | Edit markdown | Docs | micro README.md |
| micro log.txt | View log | Monitor | micro log.txt |
| micro -diff file1 file2 | Diff files | Compare | micro -diff file1 file2 |
| micro - | Read from stdin | Pipe | echo "Text" | micro - |
| micro . | Open current dir | Explorer | micro . |
| micro ~/notes.txt | Quick notes | Daily | micro ~/notes.txt |
| micro -plugin install | Add features | Extend | micro -plugin install |
| Ctrl+S Ctrl+Q | Save and quit | Fast | Ctrl+S then Ctrl+Q |
| Ctrl+F "error" | Find errors | Debug | Ctrl+F "error" |

### 17. Advanced Combinations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+E then comment | Toggle comment | Code | Ctrl+E comment |
| Ctrl+E then indent | Indent block | Code | Ctrl+E indent |
| Ctrl+E then format | Format code | Clean | Ctrl+E format |
| Ctrl+E then sort | Sort lines | Organize | Ctrl+E sort |
| Ctrl+E then terminal | Open shell | Run | Ctrl+E terminal |
| Ctrl+E then pwd | Copy path | Clipboard | Ctrl+E pwd |
| Ctrl+E then exec | Run command | Advanced | Ctrl+E exec |
| Ctrl+E then plugin | Manage | Quick | Ctrl+E plugin |
| Ctrl+E then config | Edit settings | Quick | Ctrl+E config |
| Ctrl+E then help | Show help | Quick | Ctrl+E help |
| Ctrl+E then listmacros | View macros | Debug | Ctrl+E listmacros |
| Ctrl+E then deletemacro | Remove macro | Cleanup | Ctrl+E deletemacro |

## Tips and Best Practices
* Use Ctrl+S to save frequently — Micro auto-saves on exit.
* Enable mouse support in settings for GUI-like editing.
* Use Ctrl+G to quickly jump to line numbers.
* Install plugins like comment or filemanager for power features.
* Use Ctrl+Shift+C/V for system clipboard integration.
* Customize themes with "colorscheme" in settings.json.
* Use Ctrl+E for the command bar — it’s Micro’s power tool.
* Enable "rmtrailing": true to keep files clean.
* Use "tabstospaces": true for consistent indentation.
* Practice Ctrl+Z / Ctrl+Y for undo/redo — very intuitive.
* Use Ctrl+Q to quit without saving if needed.
* Combine with tmux for multi-pane editing.
* Use Ctrl+E then terminal for a shell inside Micro.
* Keep plugins minimal for fast startup.
* Use "softwrap": true for long lines.
* Enable "savehistory": true for command history.
* Use double-click to select words quickly.
* Test plugins with micro -plugin install first.
* Use Ctrl+E then config to edit settings live.

## Additional Resources
* [Micro Official Documentation](https://micro-editor.github.io/)
* [Micro GitHub Repository](https://github.com/zyedidia/micro)
* [Micro Cheat Sheet](https://github.com/zyedidia/micro/blob/master/runtime/help/keybindings.md)
* [Micro Configuration Guide](https://github.com/zyedidia/micro/blob/master/runtime/help/settings.md)
* [Micro Plugin List](https://github.com/micro-editor/plugin-channel)
* [Micro Tutorial](https://micro-editor.github.io/tutorials/)
* [Micro vs Nano Comparison](https://www.baeldung.com/linux/micro-text-editor)
* [Micro on Arch Wiki](https://wiki.archlinux.org/title/Micro)

## Mini-Glossary
This mini-glossary defines key terms related to Micro.

### 1. Keybindings
| Term/Concept | Description |
| --- | --- |
| Ctrl+S | Save file |
| Ctrl+Q | Quit |
| Ctrl+O | Open file |
| Ctrl+F | Find |
| Ctrl+H | Replace |
| Ctrl+Z | Undo |
| Ctrl+Y | Redo |
| Ctrl+X | Cut |

### 2. Editing
| Term/Concept | Description |
| --- | --- |
| Selection | Highlighted text |
| Clipboard | Internal copy buffer |
| System clipboard | External (Ctrl+Shift+C/V) |
| Macro | Recorded actions |
| Plugin | Extension |
| Command bar | Ctrl+E menu |
| Softwrap | Visual line wrap |
| Autoindent | Smart indentation |

### 3. Configuration
| Term/Concept | Description |
| --- | --- |
| settings.json | Main config file |
| colorscheme | Theme setting |
| tabsize | Tab width |
| tabstospaces | Tabs to spaces |
| rmtrailing | Remove trailing spaces |
| mouse | Mouse support |
| savehistory | Command history |
| cursorline | Highlight current line |

### 4. Plugins
| Term/Concept | Description |
| --- | --- |
| -plugin install | Add plugin |
| -plugin list | View installed |
| -plugin update | Update all |
| comment | Toggle comments |
| filemanager | File explorer |
| autoclose | Auto close brackets |
| statusline | Info bar |
| syntax | Highlighting |

### 5. Navigation
| Term/Concept | Description |
| --- | --- |
| Ctrl+Left/Right | Word navigation |
| Home/End | Line start/end |
| Ctrl+Home/End | File top/bottom |
| Ctrl+G | Go to line |
| Page Up/Down | Scroll |
| Ctrl+Shift+Up/Down | Duplicate line |
| Alt+Up/Down | Move line |
| Double-click | Select word |

### 6. Commands
| Term/Concept | Description |
| --- | --- |
| Ctrl+E | Command bar |
| recordmacro | Start macro |
| playmacro | Execute macro |
| terminal | Open shell |
| pwd | Copy path |
| exec | Run command |
| config | Edit settings |
| help | Show help |

### 7. Advanced
| Term/Concept | Description |
| --- | --- |
| -debug | Debug mode |
| -safe | No config mode |
| -config | Open config dir |
| -diff | Compare files |
| -plugin remove | Uninstall plugin |
| -colorscheme list | List themes |
| -colorscheme random | Random theme |
| -help | Show help |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| Ctrl+Q | Force quit |
| -safe | Debug config |
| -debug | See errors |
| -plugin update | Fix plugins |
| Ctrl+Shift+C/V | System clipboard |
| mouse: true | Enable mouse |
| rmtrailing: true | Clean files |
| colorscheme | Fix theme |

