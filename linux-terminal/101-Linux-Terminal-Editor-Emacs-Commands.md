# 101 Linux Terminal Editor Emacs Commands

## Overview
Emacs is a highly extensible, self-documenting terminal-based text editor with a vast ecosystem of packages and a powerful Lisp-based configuration. This cheat sheet covers installation, basic commands, navigation, editing, buffers/windows, search/replace, macros, configuration, packages, and troubleshooting for Emacs in terminal mode (-nw). Mastering Emacs enables deep customization and efficient editing in any terminal environment.

## Target Audience
- Developers who prefer extensibility
- System administrators scripting and configuring
- Power users needing a living editor
- Researchers writing LaTeX and Org-mode documents
- Anyone embracing Lisp-based workflows

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install emacs | Install Emacs on Debian/Ubuntu | Debian-based | sudo apt install emacs |
| sudo dnf install emacs | Install on Fedora | RPM-based | sudo dnf install emacs |
| sudo pacman -S emacs | Install on Arch/Manjaro | Arch-based | sudo pacman -S emacs |
| brew install --cask emacs | Install on macOS | Homebrew | brew install --cask emacs |
| emacs --version | Check version | Verify install | emacs --version |
| emacs -nw | Start in terminal mode | No GUI | emacs -nw |
| emacs -Q | Start without config | Debug | emacs -Q |
| emacs ~/.emacs.d/init.el | Edit config | Customization | emacs ~/.emacs.d/init.el |
| emacs -nw ~/.emacs.d/init.el | Edit in terminal | Safe | emacs -nw ~/.emacs.d/init.el |
| emacs --daemon | Start Emacs server | Background | emacs --daemon |

### 2. Basic Navigation (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-f | Move forward one char | Right | C-f |
| C-b | Move backward one char | Left | C-b |
| C-n | Next line | Down | C-n |
| C-p | Previous line | Up | C-p |
| C-a | Beginning of line | Home | C-a |
| C-e | End of line | End | C-e |
| M-f | Forward word | Word right | M-f |
| M-b | Backward word | Word left | M-b |
| M-< | Beginning of buffer | Top | M-< |
| M-> | End of buffer | Bottom | M-> |

### 3. Editing Commands (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-d | Delete forward char | Delete | C-d |
| C-k | Kill line | Delete line | C-k |
| C-y | Yank (paste) | Paste | C-y |
| M-d | Kill word | Delete word | M-d |
| C-@ | Set mark | Start selection | C-@ |
| C-w | Kill region | Cut | C-w |
| M-w | Copy region | Copy | M-w |
| C-_ | Undo | Revert | C-_ |
| C-g | Cancel operation | Escape | C-g |
| C-x C-s | Save buffer | Save | C-x C-s |
| C-x C-c | Exit Emacs | Quit | C-x C-c |
| C-x C-f | Find/open file | New buffer | C-x C-f |

### 4. Search and Replace (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-s | Incremental search forward | Find | C-s |
| C-r | Incremental search backward | Find back | C-r |
| M-% | Query replace | Replace with confirm | M-% |
| M-x replace-string | Replace all | Global | M-x replace-string |
| M-x replace-regexp | Regex replace | Advanced | M-x replace-regexp |
| C-s C-w | Search word at point | Exact | C-s C-w |
| M-x occur | Show occurrences | Grep-like | M-x occur |
| M-x isearch-forward-regexp | Regex search | Regex | M-x isearch-forward-regexp |
| M-x isearch-backward-regexp | Backward regex | Regex | M-x isearch-backward-regexp |
| C-s RET | Exit search | Done | C-s RET |

### 5. Buffers and Windows (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-x b | Switch buffer | Change | C-x b |
| C-x C-b | List buffers | View | C-x C-b |
| C-x k | Kill buffer | Close | C-x k |
| C-x C-f | Open file | New buffer | C-x C-f |
| C-x 2 | Split window horizontally | Multi | C-x 2 |
| C-x 3 | Split window vertically | Multi | C-x 3 |
| C-x o | Other window | Switch | C-x o |
| C-x 1 | Delete other windows | Focus | C-x 1 |
| C-x 0 | Close current window | Close | C-x 0 |
| C-x 4 f | Open file in other window | Split | C-x 4 f |

### 6. Modes and Major Modes (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| M-x org-mode | Org-mode | Notes | M-x org-mode |
| M-x python-mode | Python mode | Code | M-x python-mode |
| M-x text-mode | Plain text | Simple | M-x text-mode |
| M-x markdown-mode | Markdown | Docs | M-x markdown-mode |
| M-x latex-mode | LaTeX | Documents | M-x latex-mode |
| M-x shell-script-mode | Shell script | Scripts | M-x shell-script-mode |
| M-x fundamental-mode | Default mode | Reset | M-x fundamental-mode |
| M-x auto-fill-mode | Auto wrap lines | Writing | M-x auto-fill-mode |

### 7. Configuration (init.el) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| (global-set-key (kbd "C-c c") 'compile) | Custom keybinding | Shortcut | In init.el |
| (setq make-backup-files nil) | Disable backups | Clean | In init.el |
| (global-linum-mode 1) | Line numbers | Always show | In init.el |
| (setq tab-width 4) | Tab size | Indent | In init.el |
| (setq-default indent-tabs-mode nil) | Spaces not tabs | Clean code | In init.el |
| (electric-pair-mode 1) | Auto close parens | Typing | In init.el |
| (show-paren-mode 1) | Highlight matching | Code | In init.el |
| (setq visible-bell t) | Visual bell | No beep | In init.el |
| (tool-bar-mode -1) | Disable toolbar | Clean | In init.el |
| (scroll-bar-mode -1) | Disable scrollbar | Clean | In init.el |

### 8. Packages and Package Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| M-x package-list-packages | List packages | Browse | M-x package-list-packages |
| M-x package-install RET magit | Install magit | Git | M-x package-install RET magit |
| M-x package-refresh-contents | Update package list | Sync | M-x package-refresh-contents |
| M-x package-autoremove | Remove unused | Cleanup | M-x package-autoremove |
| (use-package magit) | Use-package macro | Modern config | In init.el |
| M-x package-update | Update packages | Update | M-x package-update |
| M-x package-initialize | Initialize packages | Startup | In init.el |
| M-x package-list-packages | Install from list | GUI | M-x package-list-packages |
| M-x straight-use-package | Straight.el | Alternative | Modern setup |
| M-x doom-reload | Doom Emacs reload | Doom | M-x doom-reload |

### 9. Macros (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-x ( | Start macro | Record | C-x ( |
| C-x ) | End macro | Stop | C-x ) |
| C-x e | Execute macro | Play | C-x e |
| C-u C-x e | Repeat macro | Multiple | C-u C-x e |
| M-x name-last-kbd-macro | Name macro | Save | M-x name-last-kbd-macro |
| M-x insert-kbd-macro | Insert macro | Config | M-x insert-kbd-macro |
| M-x edit-kbd-macro | Edit macro | Fix | M-x edit-kbd-macro |
| M-x kmacro-start-macro-or-insert-counter | Advanced | Counter | M-x kmacro-start-macro-or-insert-counter |

### 10. Org-mode Essentials (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| * Heading | Level 1 heading | Org | * Heading |
| ** Subheading | Level 2 | Org | ** Subheading |
| C-c C-t | Cycle todo state | Todo | C-c C-t |
| C-c C-c | Check item | Checkbox | C-c C-c |
| C-c C-s | Schedule | Date | C-c C-s |
| C-c C-d | Deadline | Date | C-c C-d |
| C-c C-x C-f | Insert file | Link | C-c C-x C-f |
| C-c C-o | Open link | Follow | C-c C-o |
| M-x org-agenda | Agenda | Tasks | M-x org-agenda |
| C-c a | Agenda menu | Quick | C-c a |

### 11. Advanced Editing (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| M-x align-regexp | Align on regex | Tables | M-x align-regexp |
| M-x sort-lines | Sort lines | Organize | M-x sort-lines |
| M-x delete-duplicate-lines | Remove duplicates | Clean | M-x delete-duplicate-lines |
| M-x delete-trailing-whitespace | Clean whitespace | Fix | M-x delete-trailing-whitespace |
| M-x whitespace-mode | Toggle whitespace | Visual | M-x whitespace-mode |
| M-x rectangle-mark-mode | Column edit | Block | M-x rectangle-mark-mode |
| C-x r k | Kill rectangle | Cut block | C-x r k |
| C-x r y | Yank rectangle | Paste | C-x r y |
| M-x set-rectangle-mark | Start rect | Block | M-x set-rectangle-mark |
| C-x r t | Insert text in rect | Fill | C-x r t |

### 12. Help and Documentation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-h ? | Help menu | Overview | C-h ? |
| C-h k | Describe key | What does it do? | C-h k |
| C-h f | Describe function | Function info | C-h f |
| C-h v | Describe variable | Variable info | C-h v |
| C-h i | Info browser | Manual | C-h i |
| C-h a | Apropos | Search | C-h a |
| M-x apropos | Search commands | Find | M-x apropos |
| C-h t | Emacs tutorial | Learn | C-h t |

### 13. Troubleshooting (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| M-x toggle-debug-on-error | Debug errors | Fix | M-x toggle-debug-on-error |
| emacs -Q | Start clean | Debug config | emacs -Q |
| emacs -nw | Terminal mode | Fix GUI | emacs -nw |
| C-g | Quit stuck command | Escape | C-g |
| M-x kill-emacs | Force quit | Stuck | M-x kill-emacs |
| M-x describe-bindings | List keys | Check | M-x describe-bindings |
| M-x list-packages | Check installed | Packages | M-x list-packages |
| M-x package-refresh-contents | Update | Fix | M-x package-refresh-contents |
| M-x emacs-version | Version info | Check | M-x emacs-version |
| C-h d | Describe symbol | Debug | C-h d |

### 14. Common Use Cases (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-x C-f ~/.emacs.d/init.el | Edit config | Setup | C-x C-f ~/.emacs.d/init.el |
| M-x magit-status | Git status | Version control | M-x magit-status |
| M-x org-capture | Quick capture | Notes | M-x org-capture |
| M-x shell | Run shell | Terminal | M-x shell |
| M-x eshell | Emacs shell | Lisp shell | M-x eshell |
| M-x compile | Run make | Build | M-x compile |
| M-x man | View man page | Help | M-x man |
| M-x tetris | Fun | Tetris | M-x tetris |
| M-x doctor | ELIZA | Fun | M-x doctor |
| M-x butterfly | Fun | Easter egg | M-x butterfly |
| M-x butterfly | Activate | Easter egg | M-x butterfly |
| C-x C-f /sudo::/etc/hosts | Edit as root | Sudo | C-x C-f /sudo::/etc/hosts |

### 15. Keybindings (Common) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| C-x C-s | Save | Essential | C-x C-s |
| C-x C-c | Quit | Essential | C-x C-c |
| C-x C-f | Open file | Essential | C-x C-f |
| C-x b | Switch buffer | Essential | C-x b |
| C-x k | Kill buffer | Essential | C-x k |
| C-x 2 | Split horiz | Windows | C-x 2 |
| C-x 3 | Split vert | Windows | C-x 3 |
| C-x o | Other window | Windows | C-x o |
| C-x 1 | Delete others | Windows | C-x 1 |
| C-x 0 | Close window | Windows | C-x 0 |

### 16. Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| M-x eww | Browse web | Text browser | M-x eww |
| M-x calc | Calculator | Math | M-x calc |
| M-x speedbar | File tree | Explorer | M-x speedbar |
| M-x gnus | Email/news | Client | M-x gnus |
| M-x rcirc | IRC | Chat | M-x rcirc |
| M-x proced | Process monitor | Top-like | M-x proced |
| M-x dired | Directory editor | File manager | M-x dired |
| M-x calendar | Calendar | Dates | M-x calendar |
| M-x diary | Diary | Agenda | M-x diary |
| M-x zone | Screensaver | Fun | M-x zone |

### 17. Emacs vs Vim (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| evil-mode | Vim emulation | Vim users | M-x evil-mode |
| viper-mode | Vim-like | Legacy | M-x viper-mode |
| M-x cua-mode | CUA keys | Windows-like | M-x cua-mode |
| M-x god-mode | Modal keys | Efficient | M-x god-mode |
| M-x hydra | Key menus | Guided | M-x hydra |
| M-x which-key | Show keys | Discover | M-x which-key |
| M-x helm | Fuzzy completion | Advanced | M-x helm |
| M-x ivy | Completion | Modern | M-x ivy |
| M-x vertico | Completion | Modern | M-x vertico |
| M-x consult | Completion | Modern | M-x consult |

## Tips and Best Practices
* Start with C-h t (Emacs tutorial) to learn the basics.
* Use C-g liberally to cancel stuck commands.
* Customize with init.el or use-package for clean config.
* Install packages with M-x package-install.
* Use M-x package-refresh-contents before installing.
* Learn C-x C-s (save) and C-x C-c (quit) first.
* Use C-x C-f to open files quickly.
* Master incremental search (C-s) for fast navigation.
* Use Org-mode for notes, tasks, and agendas.
* Enable line numbers and syntax highlighting.
* Use evil-mode if coming from Vim.
* Run emacs --daemon for fast startup.
* Use M-x butterfly for fun.
* Keep backups disabled or versioned.
* Use sudo:: prefix for root files.
* Practice with C-h k and C-h f to learn commands.
* Use M-x describe-bindings to see all shortcuts.
* Install magit for excellent Git integration.
* Use M-x compile for build workflows.

## Additional Resources
* [Emacs Manual](https://www.gnu.org/software/emacs/manual/html_node/emacs/)
* [Emacs Tutorial](https://www.gnu.org/software/emacs/tour/)
* [Emacs Wiki](https://www.emacswiki.org/emacs/)
* [Org-mode Guide](https://orgmode.org/worg/orgguide.html)
* [Mastering Emacs Book](https://www.masteringemacs.org/)
* [Emacs Cheat Sheet (PDF)](https://www.gnu.org/software/emacs/refcard/pdf/refcard.pdf)
* [Evil-mode for Vim Users](https://github.com/emacs-evil/evil)
* [Doom Emacs](https://github.com/doomemacs/doomemacs)
* [Spacemacs](https://www.spacemacs.org/)
* [Emacs on Arch Wiki](https://wiki.archlinux.org/title/Emacs)

## Mini-Glossary
This mini-glossary defines key terms related to Emacs.

### 1. Key Notation
| Term/Concept | Description |
| --- | --- |
| C- | Ctrl key |
| M- | Meta/Alt key |
| C-x | Ctrl+x prefix |
| C-c | Ctrl+c prefix |
| C-h | Help prefix |
| M-x | Alt+x command |
| RET | Enter key |
| SPC | Space key |

### 2. Buffers and Windows
| Term/Concept | Description |
| --- | --- |
| Buffer | Open file or document |
| Window | View of a buffer |
| Frame | Emacs window (GUI) |
| Kill | Cut/delete |
| Yank | Paste |
| Region | Selected text |
| Mark | Selection start |
| Point | Cursor position |

### 3. Commands
| Term/Concept | Description |
| --- | --- |
| M-x | Run command by name |
| C-x C-f | Open file |
| C-x C-s | Save buffer |
| C-x C-c | Quit Emacs |
| C-x b | Switch buffer |
| C-x k | Kill buffer |
| C-x 2 | Split window |
| C-x o | Other window |

### 4. Modes
| Term/Concept | Description |
| --- | --- |
| Major mode | Primary editing mode |
| Minor mode | Additional features |
| Org-mode | Notes and tasks |
| Fundamental-mode | Default plain mode |
| Text-mode | Simple text |
| Programming modes | Language-specific |
| Auto-fill-mode | Auto line wrap |
| Flyspell-mode | Spell check |

### 5. Configuration
| Term/Concept | Description |
| --- | --- |
| init.el | Main config file |
| .emacs.d | Emacs directory |
| use-package | Modern package setup |
| package.el | Built-in package manager |
| MELPA | Package archive |
| GNU ELPA | Official packages |
| straight.el | Git-based packages |
| doom-emacs | Preconfigured distro |

### 6. Advanced
| Term/Concept | Description |
| --- | --- |
| Macro | Recorded keystrokes |
| Kill ring | Clipboard history |
| Registers | Named storage |
| Rectangle | Column editing |
| Dired | Directory mode |
| TRAMP | Remote editing |
| EWW | Text web browser |
| Calc | Calculator |

### 7. Help
| Term/Concept | Description |
| --- | --- |
| C-h ? | Help menu |
| C-h k | Describe key |
| C-h f | Describe function |
| C-h v | Describe variable |
| C-h i | Info browser |
| C-h t | Tutorial |
| apropos | Search commands |
| describe-bindings | Key map |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| C-g | Cancel stuck command |
| emacs -Q | Debug config |
| M-x toggle-debug-on-error | Error debug |
| C-x C-c | Quit properly |
| M-x kill-emacs | Force quit |
| M-x package-refresh-contents | Update packages |
| M-x package-initialize | Fix package errors |
| M-x describe-bindings | Check key conflicts |

