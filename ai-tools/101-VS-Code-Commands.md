# 101 VS Code Commands

## Overview
Visual Studio Code is a powerful, lightweight code editor with extensive customization and extension support. This cheat sheet covers essential keyboard shortcuts, commands, settings, extensions, debugging features, Git integration, and productivity tips. Master these commands to dramatically improve your development workflow across all programming languages.

## Target Audience
- Software developers and engineers
- Web developers building applications
- Data scientists writing code
- DevOps engineers managing infrastructure
- Anyone writing code professionally

## Command Categories

### 1. General Commands (12)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Command Palette | Ctrl+Shift+P | Cmd+Shift+P | Access all commands |
| Quick Open | Ctrl+P | Cmd+P | Quick file navigation |
| New Window | Ctrl+Shift+N | Cmd+Shift+N | Open new window |
| Close Window | Ctrl+W | Cmd+W | Close current window |
| Settings | Ctrl+, | Cmd+, | Open settings |
| Keyboard Shortcuts | Ctrl+K Ctrl+S | Cmd+K Cmd+S | View shortcuts |
| Toggle Sidebar | Ctrl+B | Cmd+B | Show/hide sidebar |
| Toggle Terminal | Ctrl+` | Ctrl+` | Show/hide terminal |
| Zen Mode | Ctrl+K Z | Cmd+K Z | Distraction-free mode |
| Toggle Full Screen | F11 | Ctrl+Cmd+F | Full screen mode |
| Show Extensions | Ctrl+Shift+X | Cmd+Shift+X | Extensions view |
| Show Output | Ctrl+Shift+U | Cmd+Shift+U | Output panel |

### 2. File Operations (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| New File | Ctrl+N | Cmd+N | Create new file |
| Open File | Ctrl+O | Cmd+O | Open file dialog |
| Save | Ctrl+S | Cmd+S | Save current file |
| Save As | Ctrl+Shift+S | Cmd+Shift+S | Save with new name |
| Save All | Ctrl+K S | Cmd+Alt+S | Save all files |
| Close Editor | Ctrl+W | Cmd+W | Close current editor |
| Close All | Ctrl+K Ctrl+W | Cmd+K Cmd+W | Close all editors |
| Reopen Closed | Ctrl+Shift+T | Cmd+Shift+T | Reopen last closed |
| Open Folder | Ctrl+K Ctrl+O | Cmd+K Cmd+O | Open folder |
| Copy Path | Ctrl+K P | Cmd+K P | Copy file path |

### 3. Navigation (12)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Go to Line | Ctrl+G | Cmd+G | Jump to line number |
| Go to Symbol | Ctrl+Shift+O | Cmd+Shift+O | Navigate symbols |
| Go to Definition | F12 | F12 | Jump to definition |
| Peek Definition | Alt+F12 | Alt+F12 | Inline definition |
| Go to References | Shift+F12 | Shift+F12 | Find references |
| Go Back | Alt+Left | Ctrl+- | Navigate backward |
| Go Forward | Alt+Right | Ctrl+Shift+- | Navigate forward |
| Next Error | F8 | F8 | Jump to next error |
| Previous Error | Shift+F8 | Shift+F8 | Jump to previous error |
| Breadcrumb Navigation | Ctrl+Shift+. | Cmd+Shift+. | Navigate breadcrumbs |
| Go to Bracket | Ctrl+Shift+\ | Cmd+Shift+\ | Jump to bracket |
| Navigate Editor Groups | Ctrl+1/2/3 | Cmd+1/2/3 | Switch editor groups |

### 4. Editing (12)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Cut Line | Ctrl+X | Cmd+X | Cut entire line |
| Copy Line | Ctrl+C | Cmd+C | Copy entire line |
| Delete Line | Ctrl+Shift+K | Cmd+Shift+K | Delete line |
| Move Line Up | Alt+Up | Alt+Up | Move line up |
| Move Line Down | Alt+Down | Alt+Down | Move line down |
| Copy Line Up | Shift+Alt+Up | Shift+Alt+Up | Duplicate line up |
| Copy Line Down | Shift+Alt+Down | Shift+Alt+Down | Duplicate line down |
| Indent Line | Ctrl+] | Cmd+] | Increase indent |
| Outdent Line | Ctrl+[ | Cmd+[ | Decrease indent |
| Insert Line Below | Ctrl+Enter | Cmd+Enter | New line below |
| Insert Line Above | Ctrl+Shift+Enter | Cmd+Shift+Enter | New line above |
| Join Lines | Ctrl+J | Ctrl+J | Join lines |

### 5. Multi-Cursor and Selection (12)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Add Cursor Above | Ctrl+Alt+Up | Cmd+Alt+Up | Multiple cursors |
| Add Cursor Below | Ctrl+Alt+Down | Cmd+Alt+Down | Multiple cursors |
| Add Cursor to Line Ends | Shift+Alt+I | Shift+Alt+I | Cursor at each line end |
| Select All Occurrences | Ctrl+Shift+L | Cmd+Shift+L | Select all matches |
| Select Next Occurrence | Ctrl+D | Cmd+D | Select next match |
| Column Selection | Shift+Alt+Drag | Shift+Alt+Drag | Column select |
| Expand Selection | Shift+Alt+Right | Ctrl+Shift+Right | Expand selection |
| Shrink Selection | Shift+Alt+Left | Ctrl+Shift+Left | Shrink selection |
| Select All | Ctrl+A | Cmd+A | Select all text |
| Select Current Line | Ctrl+L | Cmd+L | Select line |
| Add Selection to Next Find | Ctrl+Shift+D | Cmd+Shift+D | Add next to selection |
| Undo Last Cursor | Ctrl+U | Cmd+U | Remove last cursor |

### 6. Search and Replace (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Find | Ctrl+F | Cmd+F | Find in file |
| Replace | Ctrl+H | Cmd+Alt+F | Find and replace |
| Find in Files | Ctrl+Shift+F | Cmd+Shift+F | Search workspace |
| Replace in Files | Ctrl+Shift+H | Cmd+Shift+H | Replace in workspace |
| Next Match | F3 | Cmd+G | Next find result |
| Previous Match | Shift+F3 | Cmd+Shift+G | Previous result |
| Toggle Case Sensitive | Alt+C | Cmd+Alt+C | Case sensitive search |
| Toggle Regex | Alt+R | Cmd+Alt+R | Regex search |
| Toggle Whole Word | Alt+W | Cmd+Alt+W | Whole word search |
| Find with Selection | Ctrl+F3 | Cmd+F3 | Find selected text |

### 7. Code Formatting (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Format Document | Shift+Alt+F | Shift+Alt+F | Format entire file |
| Format Selection | Ctrl+K Ctrl+F | Cmd+K Cmd+F | Format selection |
| Trigger Suggest | Ctrl+Space | Ctrl+Space | Show IntelliSense |
| Trigger Parameter Hints | Ctrl+Shift+Space | Cmd+Shift+Space | Show parameters |
| Toggle Comment | Ctrl+/ | Cmd+/ | Line comment |
| Toggle Block Comment | Shift+Alt+A | Shift+Alt+A | Block comment |
| Fold | Ctrl+Shift+[ | Cmd+Alt+[ | Fold region |
| Unfold | Ctrl+Shift+] | Cmd+Alt+] | Unfold region |
| Fold All | Ctrl+K Ctrl+0 | Cmd+K Cmd+0 | Fold all regions |
| Unfold All | Ctrl+K Ctrl+J | Cmd+K Cmd+J | Unfold all regions |

### 8. Refactoring (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Rename Symbol | F2 | F2 | Rename all occurrences |
| Quick Fix | Ctrl+. | Cmd+. | Show quick fixes |
| Extract Variable | Ctrl+Shift+R | Ctrl+Shift+R | Extract to variable |
| Extract Method | Ctrl+Shift+R | Ctrl+Shift+R | Extract to method |
| Organize Imports | Shift+Alt+O | Shift+Alt+O | Sort imports |
| Remove Unused Imports | Ctrl+Shift+O | Cmd+Shift+O | Clean imports |
| Change All Occurrences | Ctrl+F2 | Cmd+F2 | Change all matches |
| Add Import | Ctrl+Space | Ctrl+Space | Import suggestion |
| Show Definition Preview | Ctrl+Shift+F10 | Cmd+Shift+F10 | Preview definition |
| Show Hover | Ctrl+K Ctrl+I | Cmd+K Cmd+I | Show hover info |

### 9. Debugging (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Start Debugging | F5 | F5 | Start/continue debug |
| Stop Debugging | Shift+F5 | Shift+F5 | Stop debugging |
| Restart Debugging | Ctrl+Shift+F5 | Cmd+Shift+F5 | Restart session |
| Step Over | F10 | F10 | Execute next line |
| Step Into | F11 | F11 | Enter function |
| Step Out | Shift+F11 | Shift+F11 | Exit function |
| Toggle Breakpoint | F9 | F9 | Add/remove breakpoint |
| Toggle Inline Breakpoint | Shift+F9 | Shift+F9 | Inline breakpoint |
| Show Debug Console | Ctrl+Shift+Y | Cmd+Shift+Y | Debug console |
| Debug: Run Without Debugging | Ctrl+F5 | Ctrl+F5 | Run without debug |

### 10. Terminal (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Toggle Terminal | Ctrl+` | Ctrl+` | Show/hide terminal |
| New Terminal | Ctrl+Shift+` | Ctrl+Shift+` | Create new terminal |
| Split Terminal | Ctrl+Shift+5 | Cmd+\ | Split terminal |
| Kill Terminal | Delete | Cmd+Backspace | Close terminal |
| Focus Terminal | Ctrl+` | Ctrl+` | Focus terminal |
| Focus Next Terminal | Ctrl+PageDown | Cmd+] | Next terminal |
| Focus Previous Terminal | Ctrl+PageUp | Cmd+[ | Previous terminal |
| Scroll Up | Ctrl+Alt+PageUp | Cmd+Alt+PageUp | Scroll terminal up |
| Scroll Down | Ctrl+Alt+PageDown | Cmd+Alt+PageDown | Scroll terminal down |
| Clear Terminal | Ctrl+K | Cmd+K | Clear terminal |

### 11. Git Integration (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Show Source Control | Ctrl+Shift+G | Ctrl+Shift+G | Source control view |
| Git: Commit | Ctrl+Enter | Cmd+Enter | Commit changes |
| Git: Push | - | - | Push to remote |
| Git: Pull | - | - | Pull from remote |
| Git: Checkout | - | - | Switch branch |
| Git: Stage File | - | - | Stage current file |
| Git: Unstage File | - | - | Unstage current file |
| Git: View Changes | - | - | View file diff |
| Open Changes | Ctrl+Shift+G | Ctrl+Shift+G | View all changes |
| Show Git Output | - | - | Git command output |

### 12. Extensions and Customization (10)

| Command | Action | Description |
|---------|--------|-------------|
| code --install-extension | Install extension | Install from CLI |
| code --list-extensions | List extensions | Show installed |
| code --disable-extension | Disable extension | Temporarily disable |
| code --uninstall-extension | Remove extension | Uninstall extension |
| Extensions: Show Recommended | Show suggestions | Workspace recommendations |
| Preferences: Open Settings (JSON) | Edit JSON | Direct settings edit |
| Preferences: Configure Language Settings | Language config | Per-language settings |
| Keybindings: Open Keyboard Shortcuts (JSON) | Custom keybindings | Advanced customization |
| Snippets: Configure User Snippets | Create snippets | Custom code snippets |
| Color Theme | Choose theme | Editor appearance |

### 13. Workspace Management (8)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Add Folder to Workspace | - | - | Multi-root workspace |
| Remove Folder | - | - | Remove from workspace |
| Save Workspace As | - | - | Save workspace config |
| Duplicate Workspace | - | - | Copy workspace |
| Close Workspace | Ctrl+K F | Cmd+K F | Close workspace |
| Switch Window | Ctrl+R | Cmd+R | Recent workspaces |
| Open Recent | Ctrl+R | Cmd+R | Recent files/folders |
| Trust Workspace | - | - | Enable features |

### 14. Editor Groups and Layout (10)

| Command | Windows/Linux | macOS | Description |
|---------|---------------|-------|-------------|
| Split Editor | Ctrl+\ | Cmd+\ | Split into groups |
| Split Editor Down | Ctrl+K Ctrl+\ | - | Split vertically |
| Focus Left Group | Ctrl+1 | Cmd+1 | Switch to left |
| Focus Right Group | Ctrl+2 | Cmd+2 | Switch to right |
| Move Editor to Left | Ctrl+Alt+Left | Cmd+Alt+Left | Move editor left |
| Move Editor to Right | Ctrl+Alt+Right | Cmd+Alt+Right | Move editor right |
| Close Editor Group | Ctrl+W | Cmd+W | Close group |
| Toggle Editor Layout | Shift+Alt+0 | Shift+Alt+0 | Horizontal/vertical |
| Maximize Editor Group | Ctrl+K Ctrl+Shift+\ | - | Maximize group |
| Even Editor Group Sizes | - | - | Equal sizes |

### 15. Popular Extensions (12)

| Extension | Purpose | Key Features |
|-----------|---------|--------------|
| Python | Python development | IntelliSense, debugging, linting |
| Pylance | Python language server | Fast IntelliSense, type checking |
| ESLint | JavaScript linting | Code quality, style enforcement |
| Prettier | Code formatting | Auto-format on save |
| GitLens | Git supercharged | Blame, history, comparisons |
| Live Share | Real-time collaboration | Pair programming |
| Docker | Container management | Dockerfile support, compose |
| Remote - SSH | Remote development | Edit files on remote servers |
| REST Client | API testing | HTTP requests in editor |
| Markdown All in One | Markdown editing | Preview, shortcuts, TOC |
| VS Code Icons | File icons | Better file visibility |
| Bracket Pair Colorizer | Bracket matching | Color-coded brackets |

### 16. Settings and Preferences (10)

| Setting | Purpose | Example Value |
|---------|---------|---------------|
| editor.fontSize | Font size | 14 |
| editor.fontFamily | Font family | 'Fira Code', 'Consolas' |
| editor.tabSize | Tab width | 4 |
| editor.wordWrap | Word wrapping | "on" |
| editor.formatOnSave | Auto-format | true |
| files.autoSave | Auto-save files | "afterDelay" |
| editor.minimap.enabled | Show minimap | true |
| workbench.colorTheme | Color theme | "Dark+ (default dark)" |
| terminal.integrated.fontSize | Terminal font size | 12 |
| editor.suggestSelection | IntelliSense behavior | "first" |

### 17. Productivity Tips (10)

| Tip | Description | Command/Setting |
|-----|-------------|-----------------|
| Emmet | HTML/CSS shortcuts | Built-in, type ! then Tab |
| Snippets | Code templates | Ctrl+Space to trigger |
| IntelliSense | Auto-completion | Ctrl+Space |
| Multiple selections | Edit multiple places | Ctrl+D for next occurrence |
| Zen Mode | Focus on code | Ctrl+K Z |
| Breadcrumb navigation | File structure | Ctrl+Shift+. |
| Peek definition | Inline preview | Alt+F12 |
| Timeline view | File history | Git timeline |
| Problems panel | Error overview | Ctrl+Shift+M |
| Task runner | Automated tasks | Tasks: Run Task |

## Tips and Best Practices
* Customize keyboard shortcuts for frequent commands
* Use workspaces for multi-project development
* Enable auto-save to prevent data loss
* Install extensions for your tech stack
* Use Git integration for version control
* Configure language-specific settings
* Master multi-cursor editing
* Use snippets for repetitive code
* Enable format on save for consistency
* Leverage IntelliSense for faster coding
* Use integrated terminal for workflow
* Customize color theme for eye comfort
* Use Zen Mode for focused work
* Learn command palette shortcuts
* Configure user and workspace settings separately

## Additional Resources
* [VS Code Documentation](https://code.visualstudio.com/docs)
* [VS Code Keyboard Shortcuts PDF](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)
* [VS Code Tips and Tricks](https://code.visualstudio.com/docs/getstarted/tips-and-tricks)
* [VS Code Extensions Marketplace](https://marketplace.visualstudio.com/vscode)
* [VS Code Can Do That](https://vscodecandothat.com/)
* [VS Code YouTube Channel](https://www.youtube.com/c/Code)
* [Awesome VS Code](https://github.com/viatsko/awesome-vscode)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to Visual Studio Code.

### Common Terms

| Term | Description |
|------|-------------|
| Command Palette | Quick access to all commands |
| IntelliSense | Code completion and suggestions |
| Extension | Add-on functionality |
| Workspace | Project configuration |
| Editor Group | Split editor panes |
| Breadcrumb | File path navigation |
| Minimap | Code overview panel |
| Zen Mode | Distraction-free editing |
| Peek | Inline view of code |
| Snippet | Code template |

### File Types

| Extension | Language/Type | Purpose |
|-----------|---------------|---------|
| .vscode | Config folder | Workspace settings |
| settings.json | Settings file | User/workspace config |
| keybindings.json | Keybindings | Custom shortcuts |
| tasks.json | Task config | Build/run tasks |
| launch.json | Debug config | Debugging setup |
| extensions.json | Extensions | Recommended extensions |
| *.code-workspace | Workspace file | Multi-root workspace |

### Settings Scopes

| Scope | Location | Priority |
|-------|----------|----------|
| User | Global settings | Low |
| Workspace | .vscode/settings.json | Medium |
| Folder | Multi-root specific | High |
| Language | Per language | Highest |

### Extension Categories

| Category | Purpose | Examples |
|----------|---------|----------|
| Language Support | Programming languages | Python, JavaScript, Go |
| Linters | Code quality | ESLint, Pylint |
| Formatters | Code formatting | Prettier, Black |
| Themes | Visual appearance | One Dark Pro, Dracula |
| Debuggers | Debugging tools | Chrome Debugger |
| Version Control | Git integration | GitLens, Git Graph |
| Productivity | Workflow enhancement | Live Share, Bookmarks |
| Remote Development | Remote editing | Remote - SSH, Containers |

### Keyboard Shortcut Patterns

| Pattern | Meaning | Example |
|---------|---------|---------|
| Ctrl/Cmd + Key | Primary action | Ctrl+S (Save) |
| Ctrl+Shift + Key | Secondary action | Ctrl+Shift+P (Command Palette) |
| Ctrl+K [Key] | Chord shortcut | Ctrl+K Ctrl+S (Shortcuts) |
| Alt + Key | Alternative action | Alt+Up (Move line) |
| F-Key | Special function | F5 (Debug) |

### Editor Modes

| Mode | Purpose | Activation |
|------|---------|-----------|
| Normal | Regular editing | Default |
| Insert | Text insertion | Any key |
| Selection | Text selection | Mouse/keyboard |
| Multi-cursor | Multiple cursors | Ctrl+Alt+Down |
| Column | Column selection | Shift+Alt+Drag |
| Zen | Focused editing | Ctrl+K Z |

### Debugging Terms

| Term | Description |
|------|-------------|
| Breakpoint | Pause execution point |
| Step Over | Execute next line |
| Step Into | Enter function |
| Step Out | Exit function |
| Continue | Resume execution |
| Watch | Monitor variable |
| Call Stack | Execution history |
| Variables | Scope variables |
| Debug Console | Interactive debugging |

### Git Integration

| Feature | Purpose | Access |
|---------|---------|--------|
| Source Control | Git operations | Ctrl+Shift+G |
| Diff View | Compare changes | Click changed file |
| Blame | Author info | GitLens extension |
| Timeline | File history | Timeline view |
| Merge Conflicts | Resolve conflicts | Interactive resolution |
| Git Graph | Visual history | Git Graph extension |

### IntelliSense Features

| Feature | Purpose | Trigger |
|---------|---------|---------|
| Auto-completion | Suggest code | Ctrl+Space |
| Parameter hints | Function parameters | Ctrl+Shift+Space |
| Quick info | Type information | Hover |
| Member list | Object members | Type . (dot) |
| Signature help | Function signature | Type ( |

### Terminal Types

| Type | Purpose | Shell |
|------|---------|-------|
| Integrated | Built-in terminal | Default shell |
| External | System terminal | Configured externally |
| Task | Task runner | Task execution |
| Debug Console | Debugging | Debug session |

### Workspace Features

| Feature | Purpose | Use Case |
|---------|---------|----------|
| Single-folder | One project | Simple projects |
| Multi-root | Multiple folders | Monorepos |
| Untitled | No folder | Quick edits |
| Remote | SSH/Container | Remote development |

### Common File Operations

| Operation | Purpose | Shortcut |
|-----------|---------|----------|
| New File | Create file | Ctrl+N |
| Open File | Browse files | Ctrl+O |
| Quick Open | Fast navigation | Ctrl+P |
| Save | Save changes | Ctrl+S |
| Save All | Save all files | Ctrl+K S |
| Close | Close editor | Ctrl+W |
| Reopen | Reopen closed | Ctrl+Shift+T |

### Customization Levels

| Level | Scope | Purpose |
|-------|-------|---------|
| Default | Built-in | Base configuration |
| User | Global | Personal preferences |
| Workspace | Project | Project-specific |
| Language | Per language | Language settings |
| Extension | Per extension | Extension config |

### Popular Themes

| Theme | Style | Popularity |
|-------|-------|------------|
| Dark+ | Dark | Default dark |
| Light+ | Light | Default light |
| One Dark Pro | Dark | Very popular |
| Dracula | Dark | Popular |
| Monokai | Dark | Classic |
| Solarized | Light/Dark | Classic |
| Night Owl | Dark | Popular |
| Material Theme | Various | Customizable |

### Performance Tips

| Tip | Benefit | Implementation |
|-----|---------|----------------|
| Disable unused extensions | Faster startup | Disable in extensions view |
| Exclude files | Faster search | files.exclude setting |
| Limit extensions | Less overhead | Only install needed |
| Use workspaces | Better organization | Multi-root workspace |
| Disable minimap | Less rendering | editor.minimap.enabled: false |
| Reduce file watchers | Less CPU | files.watcherExclude |
