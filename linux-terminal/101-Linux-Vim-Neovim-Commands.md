# 101 Linux Vim / Neovim Commands

## Overview
Vim (Vi Improved) and Neovim are powerful, highly configurable terminal-based text editors with extensive keyboard-driven commands and modes. This cheat sheet covers installation, basic and advanced modes, navigation, editing, searching, macros, plugins (Neovim focus), configuration, and troubleshooting for Vim and Neovim. Mastering Vim/Neovim enables lightning-fast text editing and automation in any terminal environment.

## Target Audience
- System administrators editing configs
- Developers writing and refactoring code
- DevOps engineers automating tasks
- Power users mastering modal editors
- Anyone needing efficient terminal editing

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install vim | Install Vim on Debian/Ubuntu | Basic Vim | sudo apt install vim |
| sudo apt install neovim | Install Neovim on Debian/Ubuntu | Modern fork | sudo apt install neovim |
| sudo dnf install vim | Install Vim on Fedora | RPM-based | sudo dnf install vim |
| sudo dnf install neovim | Install Neovim on Fedora | RPM-based | sudo dnf install neovim |
| sudo pacman -S vim | Install Vim on Arch | Arch-based | sudo pacman -S vim |
| sudo pacman -S neovim | Install Neovim on Arch | Arch-based | sudo pacman -S neovim |
| vim --version | Check Vim version | Verify install | vim --version |
| nvim --version | Check Neovim version | Verify install | nvim --version |
| vim ~/.vimrc | Edit Vim config | Customization | vim ~/.vimrc |
| nvim ~/.config/nvim/init.vim | Edit Neovim config | Neovim setup | nvim ~/.config/nvim/init.vim |

### 2. Modes (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| i | Insert mode | Start typing | i |
| Esc | Exit to Normal mode | From any mode | Esc |
| : | Command-line mode | Run commands | :w |
| v | Visual mode | Select text | v |
| V | Visual line mode | Select lines | V |
| Ctrl+v | Visual block mode | Column selection | Ctrl+v |
| R | Replace mode | Overwrite text | R |
| o | Insert new line below | Add text | o |

### 3. Navigation (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| h | Move left | Character left | h |
| j | Move down | Next line | j |
| k | Move up | Previous line | k |
| l | Move right | Character right | l |
| w | Jump to next word | Word forward | w |
| b | Jump to previous word | Word backward | b |
| 0 | Start of line | Line start | 0 |
| $ | End of line | Line end | $ |
| gg | Go to first line | File top | gg |
| G | Go to last line | File bottom | G |
| :42 | Go to line 42 | Jump to line | :42 |
| Ctrl+u | Half page up | Scroll up | Ctrl+u |

### 4. Editing Commands (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| x | Delete character | Remove char | x |
| dd | Delete current line | Remove line | dd |
| yy | Yank (copy) line | Copy line | yy |
| p | Paste after cursor | Paste | p |
| P | Paste before cursor | Paste above | P |
| u | Undo last change | Revert | u |
| Ctrl+r | Redo | Restore | Ctrl+r |
| cw | Change word | Replace word | cw |
| ciw | Change inner word | Replace word | ciw |
| o | New line below | Insert | o |
| O | New line above | Insert | O |
| . | Repeat last command | Repeat | . |

### 5. Search and Replace (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| /pattern | Search forward | Find next | /error |
| ?pattern | Search backward | Find previous | ?error |
| n | Next match | Find next | n |
| N | Previous match | Find previous | N |
| :%s/old/new/g | Replace all | Global replace | :%s/foo/bar/g |
| :s/old/new/g | Replace in line | Current line | :s/foo/bar/g |
| * | Search word under cursor | Exact match | * |
| # | Backward word under cursor | Exact match | # |
| :set hlsearch | Highlight matches | Visual search | :set hlsearch |
| :noh | Clear highlights | Clear search | :noh |

### 6. File Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :w | Save file | Write | :w |
| :q | Quit | Exit | :q |
| :q! | Quit without saving | Force quit | :q! |
| :wq | Save and quit | Safe exit | :wq |
| :e file | Open new file | Switch file | :e config.conf |
| :sp | Split window horizontally | Multi-file | :sp |
| :vsp | Split window vertically | Multi-file | :vsp |
| :tabnew | New tab | Tabbed editing | :tabnew |

### 7. Visual Mode Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| v | Start visual mode | Character select | v |
| V | Start visual line mode | Line select | V |
| Ctrl+v | Start visual block mode | Column select | Ctrl+v |
| d | Delete selection | Cut block | d |
| y | Yank selection | Copy block | y |
| > | Indent selection | Increase indent | > |
| < | Unindent selection | Decrease indent | < |
| ~ | Toggle case | Change case | ~ |

### 8. Registers and Copy/Paste (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| "ay | Yank to register a | Named yank | "ay |
| "ap | Paste from register a | Named paste | "ap |
| "+y | Yank to system clipboard | External copy | "+y |
| "+p | Paste from system clipboard | External paste | "+p |
| "*y | Yank to primary selection | Middle-click | "*y |
| :registers | Show registers | View yanks | :registers |
| :let @a = "" | Clear register a | Reset | :let @a = "" |
| :let @+ = "" | Clear system clipboard | Reset | :let @+ = "" |

### 9. Configuration (.vimrc / init.vim) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| set number | Show line numbers | Always show | set number |
| set relativenumber | Relative line numbers | Navigation | set relativenumber |
| set tabstop=4 | Tab width | Indentation | set tabstop=4 |
| set shiftwidth=4 | Indent width | Smart tabs | set shiftwidth=4 |
| set expandtab | Tabs to spaces | Clean code | set expandtab |
| set autoindent | Auto indent | Smart | set autoindent |
| set smartindent | Smarter indent | Better | set smartindent |
| set mouse=a | Enable mouse | Mouse support | set mouse=a |
| syntax on | Enable syntax | Highlighting | syntax on |
| filetype plugin indent on | Filetype detection | Plugins | filetype plugin indent on |

### 10. Macros (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| qa | Start recording macro a | Record | qa |
| q | Stop recording | End | q |
| @a | Play macro a | Execute | @a |
| @@ | Replay last macro | Repeat | @@ |
| 5@a | Play macro a 5 times | Multiple | 5@a |
| :registers | View macros | Check | :registers |
| qA | Append to macro a | Continue | qA |
| :let @a = "" | Clear macro a | Reset | :let @a = "" |

### 11. Plugins (Neovim/Vim) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :PlugInstall | Install plugins | Vim-plug | :PlugInstall |
| :PlugUpdate | Update plugins | Update | :PlugUpdate |
| :PlugClean | Remove unused | Cleanup | :PlugClean |
| :PackerInstall | Install Packer | Packer.nvim | :PackerInstall |
| :PackerSync | Sync plugins | Update | :PackerSync |
| :CocInstall coc-python | Install CoC plugin | LSP | :CocInstall coc-python |
| :Telescope find_files | Find files | Telescope | :Telescope find_files |
| :NERDTree | Open file tree | NERDTree | :NERDTree |
| :Git | Git status | Fugitive | :Git |
| :LspInfo | LSP status | Neovim LSP | :LspInfo |

### 12. Common Ex Commands (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :set nu | Show line numbers | Enable | :set nu |
| :set nonu | Hide line numbers | Disable | :set nonu |
| :set ic | Ignore case | Search | :set ic |
| :set noic | Case sensitive | Search | :set noic |
| :wqa | Save all and quit | Multi-file | :wqa |
| :qall | Quit all | Multi-file | :qall |
| :tabclose | Close tab | Tabbed | :tabclose |
| :split | Horizontal split | Multi | :split |
| :vsplit | Vertical split | Multi | :vsplit |
| :only | Close all but current | Focus | :only |

### 13. Text Objects (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| iw | Inner word | Word | ciw |
| aw | A word (with space) | Word | daw |
| i" | Inside quotes | String | ci" |
| a" | Around quotes | String | da" |
| i( | Inside parentheses | Code | ci( |
| ip | Inner paragraph | Block | dip |
| ap | A paragraph | Block | dap |
| i{ | Inside curly braces | Block | ci{ |

### 14. Advanced Navigation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Ctrl+o | Previous cursor position | Jump back | Ctrl+o |
| Ctrl+i | Next cursor position | Jump forward | Ctrl+i |
| % | Jump to matching bracket | Code | % |
| * | Search forward word | Exact | * |
| # | Search backward word | Exact | # |
| g; | Previous change | Change list | g; |
| g, | Next change | Change list | g, |
| `. | Last change position | Jump | `. |

### 15. Troubleshooting (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :help | Show help | In-editor | :help |
| :help vimtutor | Vim tutorial | Learn | :help vimtutor |
| :set paste | Paste mode | Clean paste | :set paste |
| :set nopaste | Disable paste | Normal | :set nopaste |
| :noh | Clear search highlights | Clear | :noh |
| :syntax on | Fix syntax | Highlight | :syntax on |
| :set mouse= | Disable mouse | Fix | :set mouse= |
| :w !sudo tee % | Save with sudo | Root file | :w !sudo tee % |
| :q! | Force quit | Stuck | :q! |
| vim -u NONE | Start without config | Debug | vim -u NONE |

### 16. Neovim-Specific (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :lua require('init') | Reload config | Lua init | :lua require('init') |
| :LspRestart | Restart LSP | Fix LSP | :LspRestart |
| :Telescope | Open Telescope | Fuzzy finder | :Telescope |
| :NvimTreeToggle | Toggle file tree | Explorer | :NvimTreeToggle |
| :lua vim.lsp.buf.format() | Format code | LSP format | :lua vim.lsp.buf.format() |
| :lua vim.diagnostic.goto_next() | Next diagnostic | Errors | :lua vim.diagnostic.goto_next() |
| :lua print(vim.fn.expand('%:p')) | Show full path | Debug | :lua print(vim.fn.expand('%:p')) |
| :checkhealth | Check Neovim health | Diagnostics | :checkhealth |
| :lua vim.api.nvim_command('q') | Quit via Lua | Advanced | :lua vim.api.nvim_command('q') |
| :lua require('plugins').setup() | Setup plugins | Lazy.nvim | :lua require('plugins').setup() |

### 17. Common Use Cases (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| :%s/foo/bar/gc | Replace with confirm | Safe replace | :%s/foo/bar/gc |
| :g/pattern/d | Delete lines matching | Clean | :g/error/d |
| :v/pattern/d | Delete non-matching | Keep | :v/error/d |
| :sort | Sort lines | Organize | :sort |
| :sort u | Unique lines | Dedupe | :sort u |
| :retab | Convert tabs to spaces | Clean | :retab |
| :set list | Show invisible chars | Debug | :set list |
| :set number relativenumber | Dual numbers | Navigation | :set number relativenumber |
| :set spell | Enable spell check | Writing | :set spell |
| :set spelllang=en_us | Set language | English | :set spelllang=en_us |
| :wqa | Save all and quit | Multi-file | :wqa |
| :tab ball | Open all buffers in tabs | Tabbed | :tab ball |

## Tips and Best Practices
* Practice with vimtutor (run vimtutor) to learn the basics.
* Use hjkl for navigation — muscle memory saves time.
* Master text objects (iw, i", i(), etc.) for efficient editing.
* Use registers ("a, "+) for multiple clipboards.
* Learn :%s///g for fast global replaces.
* Use :set number relativenumber for best navigation.
* Record macros for repetitive tasks (qa ... q).
* Use :q! to escape when stuck.
* Install plugins via vim-plug or packer.nvim for modern features.
* Use Neovim for better Lua configuration and LSP support.
* Combine with tmux for multi-pane editing.
* Use . for repeat — powerful for small changes.
* Learn visual block mode for columnar edits.
* Use :w !sudo tee % for root-owned files.
* Keep .vimrc / init.vim clean and versioned.
* Use :noh to clear search highlights.
* Practice Ctrl+r for redo and undo stack.
* Use * and # for quick word search.
* Enable mouse=a for occasional mouse use.
* Use :checkhealth in Neovim for setup issues.

## Additional Resources
* [Vim Official Documentation](https://www.vim.org/docs.php)
* [Vim Man Page](https://manpages.ubuntu.com/manpages/jammy/man1/vim.1.html)
* [Neovim Official Documentation](https://neovim.io/doc/)
* [Vim Cheat Sheet (PDF)](https://vim.rtorr.com/)
* [Neovim Cheat Sheet](https://cheat.neovim.io/)
* [Learn Vim the Smart Way](https://learnvimscriptthehardway.stevelosh.com/)
* [Practical Vim Book](https://pragprog.com/titles/dnvim/practical-vim-second-edition/)
* [Vim Adventures Game](https://vim-adventures.com/)
* [Neovim LSP Guide](https://github.com/neovim/nvim-lspconfig)
* [Vim Tips Wiki](https://vim.fandom.com/wiki/Vim_Tips_Wiki)

## Mini-Glossary
This mini-glossary defines key terms related to Vim/Neovim.

### 1. Modes
| Term/Concept | Description |
| --- | --- |
| Normal | Command mode (default) |
| Insert | Typing mode |
| Visual | Selection mode |
| Command-line | : / / ? commands |
| Replace | Overwrite mode |
| Visual block | Column selection |
| Visual line | Line selection |
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
| % | Matching bracket |
| * / # | Word search |

### 3. Editing
| Term/Concept | Description |
| --- | --- |
| d | Delete |
| y | Yank (copy) |
| p | Paste |
| u | Undo |
| . | Repeat last |
| ciw | Change word |
| dd | Delete line |
| yy | Yank line |

### 4. Registers
| Term/Concept | Description |
| --- | --- |
| "a | Named register a |
| "+ | System clipboard |
| "* | Primary selection |
| :registers | View registers |
| :let @a= | Clear register |
| @a | Play macro a |
| @@ | Repeat last macro |
| :registers | View macros |

### 5. Search
| Term/Concept | Description |
| --- | --- |
| / ? | Search forward/back |
| n N | Next/previous |
| :%s///g | Global replace |
| :noh | Clear highlights |
| hlsearch | Highlight matches |
| incsearch | Incremental search |
| smartcase | Case smart search |
| ignorecase | Ignore case |

### 6. Configuration
| Term/Concept | Description |
| --- | --- |
| .vimrc | Vim config |
| init.vim | Neovim config |
| set | Set option |
| :set nu | Line numbers |
| :syntax on | Highlighting |
| filetype | Filetype detection |
| plugin | Plugin manager |
| packer.nvim | Neovim plugin manager |

### 7. Plugins
| Term/Concept | Description |
| --- | --- |
| vim-plug | Plugin manager |
| packer.nvim | Neovim plugin manager |
| NERDTree | File explorer |
| Telescope | Fuzzy finder |
| coc.nvim | Completion engine |
| LSP | Language server |
| fugitive | Git integration |
| :PlugInstall | Install plugins |

### 8. Advanced
| Term/Concept | Description |
| --- | --- |
| Macro | Recorded commands |
| Text object | iw, i", i( |
| Operator | d, y, c |
| Motion | w, b, f, t |
| :w !sudo | Save as root |
| :checkhealth | Neovim diagnostics |
| :lua | Lua commands |
| :help | In-editor help |

