# 101 Linux Terminal Editor Helix Commands

## Overview
Helix is a modern, lightweight, modal text editor written in Rust with built-in LSP and Tree-sitter support, offering Vim-like keybindings with zero-configuration out of the box. This cheat sheet covers installation, modal operations, navigation, selection, editing, LSP features, configuration, and troubleshooting for Helix. Mastering Helix provides a fast, powerful alternative to Vim with modern features and minimal setup.

## Target Audience
- Vim users wanting modern features
- Developers needing LSP without config
- System administrators seeking lightweight editors
- Rust enthusiasts and performance users
- Anyone wanting a fresh modal editor

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install helix | Install on Debian/Ubuntu | Debian-based | sudo apt install helix |
| sudo dnf install helix | Install on Fedora | RPM-based | sudo dnf install helix |
| sudo pacman -S helix | Install on Arch/Manjaro | Arch-based | sudo pacman -S helix |
| brew install helix | Install on macOS | Homebrew | brew install helix |
| hx --version | Check version | Verify install | hx --version |
| hx --health | Check health | Diagnostics | hx --health |
| hx ~/.config/helix/config.toml | Edit config | Customization | hx ~/.config/helix/config.toml |
| hx --config | Open config dir | Quick access | hx --config |
| hx --grammar fetch | Download grammars | LSP setup | hx --grammar fetch |
| hx --grammar build | Build grammars | LSP setup | hx --grammar build |

### 2. Modes (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| i | Insert mode | Start typing | i |
| Esc | Normal mode | Default | Esc |
| v | Visual mode | Select text | v |
| V | Visual line mode | Select lines | V |
| Ctrl+v | Visual block mode | Column select | Ctrl+v |
| : | Command mode | Run commands | : |
| o | Insert line below | Add text | o |
| O | Insert line above | Add text | O |

### 3. Navigation (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| h | Left | Character | h |
| j | Down | Line | j |
| k | Up | Line | k |
| l | Right | Character | l |
| w | Next word | Word forward | w |
| b | Previous word | Word backward | b |
| 0 | Line start | Start | 0 |
| $ | Line end | End | $ |
| gg | File top | Start | gg |
| G | File bottom | End | G |
| :42 | Go to line 42 | Jump | :42 |
| Ctrl+u | Half page up | Scroll | Ctrl+u |

### 4. Editing Commands (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| x | Delete char | Remove | x |
| d | Delete | Cut | d |
| y | Yank (copy) | Copy | y |
| p | Paste after | Paste | p |
| P | Paste before | Paste | P |
| u | Undo | Revert | u |
| Ctrl+r | Redo | Restore | Ctrl+r |
| cw | Change word | Replace | cw |
| ciw | Change inner word | Replace | ciw |
| o | New line below | Insert | o |
| O | New line above | Insert | O |
| . | Repeat last | Repeat | . |

### 5. Selection and Multiple Selections (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| v | Start visual mode | Select | v |
| V | Visual line mode | Lines | V |
| Ctrl+v | Visual block mode | Columns | Ctrl+v |
| Alt+Enter | Add cursor | Multiple | Alt+Enter |
| s | Select all matches | Find all | s |
| S | Split selection | Regex split | S |
| C | Copy selection on new line | Duplicate | C |
| Alt+s | Select all occurrences | All matches | Alt+s |
| Alt+c | Change all selections | Edit all | Alt+c |
| ; | Collapse selections | Single | ; |

### 6. Search and Replace (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| / | Search forward | Find | / |
| ? | Search backward | Find back | ? |
| n | Next match | Next | n |
| N | Previous match | Prev | N |
| %s/old/new/g | Replace all | Global | %s/old/new/g |
| :s/old/new/g | Replace in selection | Local | :s/old/new/g |
| * | Search word under cursor | Exact | * |
| # | Backward word under cursor | Exact | # |

### 7. LSP and Diagnostics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| gd | Go to definition | Jump | gd |
| gr | Go to references | Find uses | gr |
| gi | Go to implementation | Jump | gi |
| gl | Show diagnostics | Errors | gl |
| gh | Hover info | Docs | gh |
| :signature-help | Show signature | Args | :signature-help |
| :code-action | Apply fix | Quickfix | :code-action |
| :rename | Rename symbol | Refactor | :rename |
| :format | Format document | Clean | :format |
| :lsp-restart | Restart server | Fix | :lsp-restart |

### 8. File and Buffer Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :w | Save | Write | :w |
| :q | Quit | Exit | :q |
| :q! | Quit without saving | Force | :q! |
| :wq | Save and quit | Safe | :wq |
| :b file | Open file | New buffer | :b file |
| :buffer-next | Next buffer | Switch | :buffer-next |
| :buffer-previous | Previous buffer | Switch | :buffer-previous |
| :buffer-close | Close buffer | Close | :buffer-close |

### 9. Configuration (config.toml) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| theme = "onedark" | Set theme | Visual | In config.toml |
| [editor] | Editor section | Global | In config.toml |
| line-number = "relative" | Relative numbers | Navigation | line-number = "relative" |
| auto-pairs = true | Auto close brackets | Typing | auto-pairs = true |
| indent = { tab-width = 4 } | Tab width | Indent | indent = { tab-width = 4 } |
| soft-wrap.enable = true | Soft wrap | Readable | soft-wrap.enable = true |
| cursor-shape = { insert = "bar" } | Cursor style | Visual | cursor-shape = { insert = "bar" } |
| mouse = true | Mouse support | Click | mouse = true |
| [keys.normal] | Custom keys | Bindings | In config.toml |
| [keys.insert] | Insert mode keys | Bindings | In config.toml |

### 10. Macros and Registers (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| q | Start/stop macro | Record | q |
| @ | Play macro | Execute | @ |
| @@ | Replay last macro | Repeat | @@ |
| "a | Named register | Yank to a | "ay |
| "ap | Paste from a | Named paste | "ap |
| :registers | View registers | Check | :registers |
| :let @a = "" | Clear register | Reset | :let @a = "" |
| :let @+ = "" | Clear system clipboard | Reset | :let @+ = "" |

### 11. Tree-sitter and Syntax (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :tree-sitter | Show tree | Debug | :tree-sitter |
| :tree-sitter parse | Parse file | Debug | :tree-sitter parse |
| :tree-sitter highlight | Highlight query | Debug | :tree-sitter highlight |
| :tree-sitter test | Run tests | Debug | :tree-sitter test |
| :grammar fetch | Download grammars | LSP | :grammar fetch |
| :grammar build | Build grammars | LSP | :grammar build |

### 12. Common Commands (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :w | Save | Essential | :w |
| :q | Quit | Essential | :q |
| :wq | Save and quit | Essential | :wq |
| :e file | Open file | Essential | :e file |
| :bnext | Next buffer | Switch | :bnext |
| :bprev | Previous buffer | Switch | :bprev |
| :bd | Close buffer | Close | :bd |
| :wqa | Save all and quit | Multi | :wqa |
| :qall | Quit all | Multi | :qall |
| :help | Show help | Docs | :help |

### 13. Visual and Multiple Selections (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| v | Start visual | Select | v |
| V | Visual line | Lines | V |
| Ctrl+v | Visual block | Columns | Ctrl+v |
| s | Select all matches | Find all | s |
| Alt+Enter | Add cursor | Multiple | Alt+Enter |
| C | Duplicate selection | Copy | C |
| Alt+s | Select all occurrences | All | Alt+s |
| ; | Collapse to single | Reset | ; |

### 14. Troubleshooting (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| hx --health | Check health | Diagnostics | hx --health |
| hx --log | Show logs | Debug | hx --log |
| :log-open | Open log | Debug | :log-open |
| :lsp-info | Show LSP status | Debug | :lsp-info |
| :lsp-restart | Restart server | Fix | :lsp-restart |
| :grammar fetch | Fix missing grammar | LSP | :grammar fetch |
| :grammar build | Build grammar | LSP | :grammar build |
| :config-open | Open config | Fix | :config-open |
| :q! | Force quit | Stuck | :q! |
| Esc | Exit mode | Reset | Esc |

### 15. Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :format | Format document | Clean | :format |
| :code-action | Apply LSP fix | Quickfix | :code-action |
| :rename | Rename symbol | Refactor | :rename |
| :signature-help | Show signature | Args | :signature-help |
| :hover | Show hover info | Docs | :hover |
| :definition | Go to definition | Jump | :definition |
| :references | Find references | Jump | :references |
| :implementation | Go to impl | Jump | :implementation |
| :document-symbols | Show symbols | Outline | :document-symbols |
| :workspace-symbols | Workspace symbols | Search | :workspace-symbols |

### 16. Common Use Cases (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| hx config.toml | Edit config | Setup | hx config.toml |
| hx script.rs | Edit Rust | Code | hx script.rs |
| hx /etc/hosts | Edit system | Root | sudo hx /etc/hosts |
| hx README.md | Edit markdown | Docs | hx README.md |
| hx log.txt | View log | Monitor | hx log.txt |
| :w !sudo tee % | Save as root | Root | :w !sudo tee % |
| :format | Format code | Clean | :format |
| gd | Go to definition | Navigate | gd |
| gr | Find references | Navigate | gr |
| :code-action | Quick fix | LSP | :code-action |
| :rename | Refactor | Rename | :rename |
| :hover | Show docs | Learn | :hover |

### 17. Advanced Combinations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| s pattern | Select all matches | Find | s error |
| Alt+Enter | Add cursor | Multiple | Alt+Enter |
| C | Duplicate line | Copy | C |
| :format | Format document | Clean | :format |
| gd | Go to definition | Jump | gd |
| gr | Find references | Jump | gr |
| :rename | Rename symbol | Refactor | :rename |
| :code-action | Apply fix | Quickfix | :code-action |
| :signature-help | Show signature | Args | :signature-help |
| :hover | Show hover | Docs | :hover |
| :document-symbols | Show outline | Navigate | :document-symbols |
| :workspace-symbols | Search symbols | Search | :workspace-symbols |

## Tips and Best Practices
* Helix is zero-config — just start typing after install.
* Use :health to verify LSP and Tree-sitter setup.
* Learn hjkl navigation — muscle memory is key.
* Use multiple selections (Alt+Enter, s) for powerful edits.
* Run :format to auto-format code with LSP.
* Use gd/gr for fast navigation with LSP.
* Customize with config.toml for themes and keybindings.
* Use :code-action for quick fixes.
* Run :grammar fetch to ensure Tree-sitter works.
* Use Esc liberally to return to normal mode.
* Use :w !sudo tee % for root-owned files.
* Combine with tmux for multi-pane editing.
* Use :rename for safe refactoring.
* Keep grammars updated with :grammar build.
* Use mouse support if enabled in config.
* Practice visual block mode (Ctrl+v) for columnar edits.
* Use s to select all occurrences of a pattern.
* Use C to duplicate lines quickly.
* Explore :document-symbols for outline navigation.

## Additional Resources
* [Helix Official Documentation](https://docs.helix-editor.com/)
* [Helix GitHub Repository](https://github.com/helix-editor/helix)
* [Helix Keymap Reference](https://docs.helix-editor.com/keymap.html)
* [Helix Configuration Guide](https://docs.helix-editor.com/configuration.html)
* [Helix Theme Gallery](https://docs.helix-editor.com/themes.html)
* [Helix LSP Guide](https://docs.helix-editor.com/languages.html)
* [Helix on Arch Wiki](https://wiki.archlinux.org/title/Helix)
* [Helix Tutorial](https://docs.helix-editor.com/tutorial.html)

## Mini-Glossary
This mini-glossary defines key terms related to Helix.

### 1. Modes
| Term/Concept | Description |
| --- | --- |
| Normal | Command mode |
| Insert | Typing mode |
| Visual | Selection mode |
| Visual line | Line selection |
| Visual block | Column selection |
| Command | : mode |
| Select mode | Multiple cursors |
| Operator-pending | After d/y/c |

### 2. Navigation
| Term/Concept | Description |
| --- | --- |
| hjkl | Arrow keys |
| w/b | Word forward/back |
| gg/G | File top/bottom |
| 0/$ | Line start/end |
| Ctrl+u | Half page up |
| Ctrl+d | Half page down |
| gd | Go to definition |
| gr | Go to references |

### 3. Editing
| Term/Concept | Description |
| --- | --- |
| d | Delete |
| y | Yank (copy) |
| p | Paste |
| u | Undo |
| . | Repeat last |
| cw | Change word |
| dd | Delete line |
| yy | Yank line |

### 4. Selection
| Term/Concept | Description |
| --- | --- |
| v | Visual mode |
| s | Select all matches |
| Alt+Enter | Add cursor |
| C | Duplicate selection |
| : | Collapse selections |
| Alt+s | Select all occurrences |
| Ctrl+v | Visual block |
| V | Visual line |

### 5. LSP
| Term/Concept | Description |
| --- | --- |
| gd | Go to definition |
| gr | References |
| gi | Implementation |
| gl | Diagnostics |
| gh | Hover |
| :code-action | Quick fix |
| :rename | Rename symbol |
| :format | Format code |

### 6. Configuration
| Term/Concept | Description |
| --- | --- |
| config.toml | Main config |
| theme | Color scheme |
| line-number | Number style |
| auto-pairs | Bracket closing |
| indent | Tab settings |
| soft-wrap | Line wrapping |
| mouse | Mouse support |
| cursor-shape | Cursor style |

### 7. Commands
| Term/Concept | Description |
| --- | --- |
| :w | Save |
| :q | Quit |
| :wq | Save and quit |
| :b | Open buffer |
| :format | Format |
| :health | Diagnostics |
| :grammar fetch | Download grammars |
| :lsp-restart | Restart LSP |

### 8. Advanced
| Term/Concept | Description |
| --- | --- |
| Tree-sitter | Parsing engine |
| LSP | Language server |
| Multiple selections | Multi-cursor |
| Macro | Recorded actions |
| Register | Named storage |
| :help | Documentation |
| :log-open | Debug log |
| :config-open | Edit config |

