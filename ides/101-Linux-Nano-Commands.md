# 101 Linux Nano Commands

## Overview
Nano is a simple, user-friendly text editor for the Linux terminal, ideal for quick edits to configuration files and scripts. This cheat sheet covers installation, basic editing commands, navigation, search and replace, cut/copy/paste operations, file handling, customization, shortcuts, and troubleshooting for nano. Mastering nano enables fast, mouse-free text editing in any terminal environment.

## Target Audience
- System administrators editing configs
- Developers tweaking scripts
- DevOps engineers managing servers
- Beginners learning terminal editors
- Anyone needing a simple text editor

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install nano | Install on Debian/Ubuntu | Debian-based setup | sudo apt install nano |
| sudo dnf install nano | Install on Fedora | RPM-based setup | sudo dnf install nano |
| sudo pacman -S nano | Install on Arch/Manjaro | Arch-based setup | sudo pacman -S nano |
| brew install nano | Install on macOS | Homebrew users | brew install nano |
| nano --version | Check installed version | Verify installation | nano --version |
| nano --help | Display help | Quick option reference | nano --help |
| man nano | View manual page | Full documentation | man nano |
| which nano | Confirm command location | Path check | which nano |
| nano ~/.nanorc | Create config file | Customization | nano ~/.nanorc |
| nano -v | Version info | Quick check | nano -v |

### 2. Basic File Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nano filename | Open or create file | Basic edit | nano config.conf |
| nano -w filename | Open without word wrap | Long lines | nano -w longfile.txt |
| nano -c filename | Show column numbers | Alignment | nano -c script.sh |
| nano -B filename | Backup original file | Safe editing | nano -B important.conf |
| nano -r filename | Read-only mode | View only | nano -r logs.txt |
| nano -i filename | Show cursor position | Navigation | nano -i status.conf |
| nano -l filename | Show line numbers | Debugging | nano -l code.py |
| nano -h | Help menu | In-editor help | Ctrl+G inside nano |

### 3. Navigation Shortcuts (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+V | Page down | Move down | Ctrl+V |
| Ctrl+Y | Page up | Move up | Ctrl+Y |
| Ctrl+F | Move forward one character | Right | Ctrl+F |
| Ctrl+B | Move backward one character | Left | Ctrl+B |
| Ctrl+N | Next line | Down | Ctrl+N |
| Ctrl+P | Previous line | Up | Ctrl+P |
| Ctrl+A | Go to beginning of line | Home | Ctrl+A |
| Ctrl+E | Go to end of line | End | Ctrl+E |
| Ctrl+/ | Go to line number | Jump | Ctrl+/ then 42 |
| Alt+/ | Go to first line | Top of file | Alt+/ |

### 4. Editing and Text Manipulation (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+K | Cut current line | Delete line | Ctrl+K |
| Ctrl+U | Paste cut text | Undo cut | Ctrl+U |
| Ctrl+6 | Set mark | Start selection | Ctrl+6 then arrow keys |
| Ctrl+K | Cut marked text | Copy/cut block | After marking |
| Alt+A | Select block | Alternative mark | Alt+A |
| Ctrl+X | Exit nano | Quit editor | Ctrl+X |
| Ctrl+O | Save file | Write out | Ctrl+O |
| Ctrl+G | Show help | In-editor help | Ctrl+G |
| Ctrl+W | Search forward | Find text | Ctrl+W then "error" |
| Ctrl+\ | Search and replace | Replace all | Ctrl+\ |
| Alt+U | Undo last action | Revert change | Alt+U |
| Alt+E | Redo last action | Restore change | Alt+E |

### 5. Search and Replace (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+W | Search forward | Find next | Ctrl+W |
| Ctrl+\ | Search and replace | Replace text | Ctrl+\ |
| Alt+W | Search backward | Find previous | Alt+W |
| Alt+R | Repeat last search | Find next | Alt+R |
| Ctrl+Alt+W | Search with regex | Advanced search | Ctrl+Alt+W |
| Ctrl+^ | Search for regex | Case sensitive | Ctrl+^ |
| Alt+C | Toggle case sensitive | Case toggle | Alt+C |
| Alt+X | Exit search | Cancel search | Alt+X |

### 6. Cut, Copy, Paste (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+K | Cut line | Delete line | Ctrl+K |
| Ctrl+U | Paste cut text | Insert | Ctrl+U |
| Ctrl+6 | Mark start | Select block | Ctrl+6 |
| Ctrl+K | Cut marked text | Copy block | After marking |
| Alt+6 | Copy marked text | Copy without cut | Alt+6 |
| Ctrl+U | Paste copied text | Insert copy | Ctrl+U |

### 7. File and Buffer Management (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+R | Read file into buffer | Insert file | Ctrl+R |
| Ctrl+O | Write out (save) | Save changes | Ctrl+O |
| Ctrl+X | Exit nano | Quit | Ctrl+X |
| Ctrl+S | Save without prompt | Quick save | Ctrl+S |
| Ctrl+T | Spell check | Check spelling | Ctrl+T |
| Alt+D | Run external command | Execute | Alt+D |
| Ctrl+_ | Go to line/column | Jump | Ctrl+_ then 10,5 |
| Ctrl+D | Delete character | Remove char | Ctrl+D |

### 8. Configuration (.nanorc) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nano ~/.nanorc | Edit config file | Customization | nano ~/.nanorc |
| set linenumbers | Enable line numbers | Always show | set linenumbers |
| set tabsize 4 | Set tab width | Indentation | set tabsize 4 |
| set autoindent | Auto indent | Smart tabs | set autoindent |
| set constantscroll | Smooth scrolling | Better UX | set constantscroll |
| set mouse | Enable mouse support | Mouse clicks | set mouse |
| set tabstospaces | Convert tabs to spaces | Clean code | set tabstospaces |
| set smoothscroll | Smooth scrolling | Visual | set smoothscroll |
| include /etc/nanorc | System config | Default | include /etc/nanorc |
| bind ^Q exit main | Custom keybinding | Remap | bind ^Q exit main |

### 9. Syntax Highlighting (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| set syntax "sh" | Force shell syntax | Bash scripts | set syntax "sh" |
| nano -Y sh filename | Syntax from command line | Quick | nano -Y sh script.sh |
| nano -Y conf filename | Config file syntax | .conf files | nano -Y conf nginx.conf |
| set syntax "python" | Python highlighting | Python files | set syntax "python" |
| set syntax "yaml" | YAML syntax | Config files | set syntax "yaml" |
| set syntax "markdown" | Markdown highlighting | .md files | set syntax "markdown" |

### 10. Common Command Line Options (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nano -l | Show line numbers | Debugging | nano -l file.txt |
| nano -w | No word wrap | Long lines | nano -w log.txt |
| nano -B | Make backup | Safe edit | nano -B config |
| nano -c | Show cursor position | Navigation | nano -c |
| nano -i | Show cursor position | Detailed | nano -i |
| nano -r | Read-only | View only | nano -r |
| nano -v | Version info | Check | nano -v |
| nano -h | Help | Options | nano -h |
| nano -Y sh | Force syntax | Highlight | nano -Y sh script.sh |
| nano -p | Preserve selection | Block edit | nano -p |
| nano -S | Softwrap | Wrap lines | nano -S |
| nano -m | Mouse support | Mouse clicks | nano -m |

### 11. Undo and Redo (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Alt+U | Undo last action | Revert change | Alt+U |
| Alt+E | Redo last action | Restore change | Alt+E |
| Ctrl+U | Paste cut text | Undo cut | Ctrl+U |
| Ctrl+K | Cut line | Delete | Ctrl+K |
| Alt+U | Multiple undos | Step back | Alt+U several times |
| Alt+E | Multiple redos | Step forward | Alt+E several times |

### 12. Multiple Files and Buffers (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nano file1 file2 | Open multiple files | Edit several | nano conf1 conf2 |
| Alt+, | Switch to previous file | Cycle buffers | Alt+, |
| Alt+. | Switch to next file | Cycle buffers | Alt+. |
| Ctrl+X | Exit current buffer | Close file | Ctrl+X |
| Ctrl+R | Insert another file | Merge | Ctrl+R |
| Ctrl+O | Save current buffer | Save | Ctrl+O |
| Ctrl+G | Help for buffers | Buffer help | Ctrl+G |
| nano -F | Follow file | Tail-like | nano -F log.txt |

### 13. Spell Checking and Formatting (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+T | Run spell checker | Check spelling | Ctrl+T |
| Alt+^ | Justify paragraph | Format text | Alt+^ |
| Ctrl+^ | Justify entire file | Format all | Ctrl+^ |
| Ctrl+J | Justify current paragraph | Align | Ctrl+J |
| Alt+Q | Justify left | Align left | Alt+Q |
| Ctrl+T | Check spelling | English only | Ctrl+T |

### 14. Macros and Recording (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+6 | Start/stop recording | Macro begin | Ctrl+6 |
| Alt+6 | Play last macro | Repeat action | Alt+6 |
| Ctrl+6 | Record macro | Automate | Ctrl+6 then actions |
| Alt+^ | Play macro | Repeat | Alt+^ |
| Ctrl+6 | Stop recording | End macro | Ctrl+6 |
| Alt+6 | Replay last macro | Multiple times | Alt+6 |
| Ctrl+6 | Clear macro | Reset | Ctrl+6 |
| nano -M | Macro mode | Advanced | nano -M |

### 15. Troubleshooting and Tips (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+G | Show help | In-editor help | Ctrl+G |
| Ctrl+X | Quit without saving | Exit | Ctrl+X then N |
| Ctrl+O | Save and continue | Save | Ctrl+O |
| nano -r | Read-only mode | View | nano -r file |
| set backup | Backup files | Safety | In .nanorc |
| set historylog | Log history | Undo | set historylog |
| nano -l | Line numbers | Debugging | nano -l |
| Ctrl+Alt+W | Regex search | Advanced | Ctrl+Alt+W |
| Alt+U | Undo | Recover | Alt+U |
| Ctrl+L | Refresh screen | Fix display | Ctrl+L |

### 16. Custom Keybindings (.nanorc) (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| bind ^Q exit main | Remap quit | Custom quit | bind ^Q exit main |
| bind ^S save main | Remap save | Quick save | bind ^S save main |
| bind M-U undo main | Remap undo | Easier undo | bind M-U undo main |
| bind ^Z suspend main | Suspend nano | Background | bind ^Z suspend main |
| bind ^F search main | Remap search | Custom | bind ^F search main |
| bind ^G help main | Remap help | Quick | bind ^G help main |
| bind ^O writeout main | Remap save | Custom | bind ^O writeout main |
| bind ^X exit main | Remap exit | Custom | bind ^X exit main |

### 17. Advanced Combinations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nano -w -l -c config.conf | No wrap + line/col | Long config | nano -w -l -c |
| nano -B -l script.sh | Backup + lines | Safe edit | nano -B -l |
| nano -Y python main.py | Python syntax | Code | nano -Y python main.py |
| nano -r /etc/hosts | Read-only | View | nano -r /etc/hosts |
| nano -F /var/log/syslog | Follow log | Tail-like | nano -F /var/log/syslog |
| nano -i -c status.conf | Position + columns | Detailed | nano -i -c |
| nano -m -l mouse.conf | Mouse + lines | GUI-like | nano -m -l |
| nano -S -l longfile.txt | Softwrap + lines | Readable | nano -S -l |
| nano -B -Y sh backup.sh | Backup + syntax | Scripts | nano -B -Y sh |
| nano -v | Version check | Verify | nano -v |
| nano -h | Full help | Options | nano -h |
| nano -r -l logs.txt | Read-only + lines | Audit | nano -r -l |

## Tips and Best Practices
* Use Ctrl+G for instant help — nano's help is excellent.
* Enable line numbers in ~/.nanorc with set linenumbers.
* Always use -B for backup when editing important files.
* Use Ctrl+K and Ctrl+U for fast line deletion and recovery.
* Set autoindent for consistent code formatting.
* Use -w for editing log files or long lines.
* Learn Ctrl+W and Ctrl+\ for fast search/replace.
* Use mouse support (set mouse) for easier navigation.
* Create backups with -B before major changes.
* Use Ctrl+/ to jump to specific lines quickly.
* Customize keybindings in ~/.nanorc for efficiency.
* Use -r for read-only viewing of system files.
* Combine with sudo nano for root-owned files.
* Use spell check (Ctrl+T) for documentation.
* Enable softwrap for better readability.
* Use undo (Alt+U) liberally — nano has good undo stack.
* Test changes in a copy first.
* Use nano -F to monitor log files.
* Keep .nanorc simple to avoid conflicts.
* Use syntax highlighting for better readability.

## Additional Resources
* [Nano Official Documentation](https://www.nano-editor.org/dist/latest/nano.html)
* [Nano Man Page](https://manpages.ubuntu.com/manpages/jammy/man1/nano.1.html)
* [Nano Cheat Sheet (PDF)](https://www.nano-editor.org/dist/latest/cheatsheet.html)
* [Customizing Nano with .nanorc](https://www.nano-editor.org/dist/latest/nanorc.5.html)
* [Nano Tutorial for Beginners](https://linuxize.com/post/how-to-use-nano-text-editor/)
* [Nano vs Vim Comparison](https://www.geeksforgeeks.org/nano-vs-vim/)
* [Nano Syntax Highlighting Guide](https://www.nano-editor.org/dist/latest/syntax.html)
* [Advanced Nano Usage](https://www.baeldung.com/linux/nano-editor)
* [Nano on Arch Wiki](https://wiki.archlinux.org/title/Nano)

## Mini-Glossary
This mini-glossary defines key terms related to nano and terminal text editing.

### 1. Basic Nano Terms
| Term/Concept | Description |
| --- | --- |
| Buffer | Current file in memory |
| Cutbuffer | Temporary storage for cut text |
| Mark | Start of text selection |
| Syntax | Highlighting rules |
| Nanorc | Configuration file |
| Word wrap | Line breaking |
| Softwrap | Visual wrapping |
| Hard wrap | Actual line breaks |

### 2. Navigation Shortcuts
| Term/Concept | Description |
| --- | --- |
| Ctrl+A | Line start |
| Ctrl+E | Line end |
| Ctrl+N | Next line |
| Ctrl+P | Previous line |
| Ctrl+F | Forward char |
| Ctrl+B | Backward char |
| Ctrl+V | Page down |
| Ctrl+Y | Page up |

### 3. Editing Commands
| Term/Concept | Description |
| --- | --- |
| Ctrl+K | Cut line/block |
| Ctrl+U | Paste cut text |
| Ctrl+O | Save file |
| Ctrl+X | Exit nano |
| Ctrl+G | Help menu |
| Ctrl+W | Search |
| Ctrl+\ | Replace |
| Alt+U | Undo |

### 4. File Options
| Term/Concept | Description |
| --- | --- |
| -w | No word wrap |
| -l | Line numbers |
| -B | Backup file |
| -r | Read-only |
| -c | Cursor position |
| -i | Cursor info |
| -Y | Syntax type |
| -m | Mouse support |

### 5. Search and Replace
| Term/Concept | Description |
| --- | --- |
| Ctrl+W | Find forward |
| Alt+W | Find backward |
| Ctrl+\ | Replace |
| Alt+R | Repeat search |
| Ctrl+^ | Regex search |
| Alt+C | Case sensitive |
| Alt+X | Cancel search |
| Alt+Q | Justify left |

### 6. Configuration
| Term/Concept | Description |
| --- | --- |
| .nanorc | User config |
| set linenumbers | Show line numbers |
| set tabsize | Tab width |
| set autoindent | Auto indent |
| set mouse | Mouse support |
| bind | Keybinding |
| include | Load system config |
| set backup | Auto backup |

### 7. Advanced Features
| Term/Concept | Description |
| --- | --- |
| Macro | Recorded actions |
| Spell check | Ctrl+T |
| Syntax highlighting | Color coding |
| Read-only mode | View only |
| Backup file | .filename~ |
| Softwrap | Visual wrap |
| Constantscroll | Smooth scrolling |
| Historylog | Undo history |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| No undo | Old nano versions |
| Mouse not working | Need set mouse |
| Syntax missing | Need .nanorc |
| Backup disabled | Use -B |
| Word wrap issues | Use -w |
| Slow scrolling | Use constantscroll |
| Key conflicts | Check binds |
| No help | Ctrl+G |

