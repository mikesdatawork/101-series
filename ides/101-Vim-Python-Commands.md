# 101 Vim / Neovim – Python Power User (2025)

The terminal warrior's Python IDE.

### Core LSP Shortcuts (pyright / pylsp)
| Action                  | Normal Mode        | Requires                  |
|-------------------------|--------------------|---------------------------|
| Go to definition        | gd                 | LSP                       |
| Peek definition         | gD                 | LSP                       |
| Find references         | gr                 | LSP                       |
| Hover documentation     | K                  | LSP                       |
| Rename symbol           | <leader>rn         | LSP rename                |
| Code actions / fixes    | <leader>ca         | LSP                       |
| Format document         | <leader>f   or   ggVG= | black / null-ls        |

### Running & Testing
| Task                    | Command                       |
|-------------------------|-------------------------------|
| Run current file        | :w !python %                  |
| Run selection           | :'<,'>w !python               |
| Open Python REPL        | :terminal python            |
| Send line to REPL       | yy then p in terminal         |

### Must-Have Plugins (2025)
- nvim-lspconfig + pyright/pylsp
- black (or vim-black)
- vim-python-pep8-indent
- vim-floaterm or built-in :terminal
- telescope.nvim (fuzzy find everything)

### Pro Tip
With LSP + pyright, (Neo)vim now beats most GUI IDEs in speed and precision — zero mouse, zero lag, full power.

