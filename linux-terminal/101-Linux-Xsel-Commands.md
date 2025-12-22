# 101 Linux Xsel Commands

## Overview
xsel is a command-line utility for manipulating the X11 clipboard and selection buffers, similar to xclip but with a different syntax and additional features. This cheat sheet covers installation, basic copy/paste operations, working with primary/clipboard/secondary selections, piping, clipboard clearing, scripting integrations, and troubleshooting for xsel. Mastering xsel enhances terminal workflows by enabling fast clipboard access without a mouse, especially useful in X11 environments.

## Target Audience
- System administrators automating clipboard tasks
- Developers copying code and logs
- DevOps engineers sharing terminal output
- Power users optimizing shell workflows
- Anyone using Linux with X11 clipboard

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install xsel | Install on Debian/Ubuntu | Debian-based setup | sudo apt install xsel |
| sudo dnf install xsel | Install on Fedora | RPM-based setup | sudo dnf install xsel |
| sudo pacman -S xsel | Install on Arch/Manjaro | Arch-based setup | sudo pacman -S xsel |
| brew install xsel | Install on macOS (with XQuartz) | macOS X11 users | brew install xsel |
| xsel --version | Check installed version | Verify installation | xsel --version |
| xsel --help | Display help | Quick option reference | xsel --help |
| man xsel | View manual page | Full documentation | man xsel |
| which xsel | Confirm command location | Path check | which xsel |
| xsel --clipboard --output | Test paste | Verify working | xsel --clipboard --output |
| sudo apt-get install xsel | Alternative Debian install | Older systems | sudo apt-get install xsel |

### 2. Basic Copy to Clipboard (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --clipboard --input | Copy stdin to clipboard | Default copy | echo "Hello" | xsel --clipboard --input |
| xsel --clipboard | Copy to clipboard (default) | Short form | echo "Text" | xsel --clipboard |
| xsel --input | Copy to clipboard (implicit) | Same as default | echo "Data" | xsel --input |
| xsel --clipboard --input | Copy explicitly | Clear option | echo "Test" | xsel --clipboard --input |
| xsel --output | Paste clipboard contents | Default paste | xsel --output |
| echo "Content" | xsel --clipboard | Copy shorthand | echo "Content" | xsel --clipboard |
| xsel --clipboard --input -i | Copy input (explicit) | Verbose | echo "Quick" | xsel --clipboard --input -i |
| xsel --primary | Copy to primary selection | Middle-click paste | echo "Primary" | xsel --primary |

### 3. Pasting from Clipboard (7)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --output | Output clipboard contents | Default paste | xsel --output |
| xsel --clipboard --output | Explicit clipboard paste | Clear | xsel --clipboard --output |
| xsel --primary --output | Paste primary selection | Middle-click | xsel --primary --output |
| xsel --secondary --output | Paste secondary selection | Rarely used | xsel --secondary --output |
| xsel --output > file.txt | Save clipboard to file | Export | xsel --output > notes.txt |
| xsel --clipboard --output | grep pattern | Filter pasted | xsel --clipboard --output | grep error |
| xsel --output | xsel --primary --input | Copy clipboard to primary | xsel --output | xsel --primary --input |

### 4. Working with Files (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --input < file.txt | Copy file contents | Read from file | xsel --input < config.conf |
| xsel --output > output.txt | Paste to file | Export clipboard | xsel --output > backup.txt |
| cat file.txt | xsel --clipboard --input | Copy file to clipboard | cat README.md | xsel --clipboard --input |
| xsel --clipboard --input file.txt | Copy file explicitly | Same as above | xsel --clipboard --input file.txt |
| xsel --output | xsel --primary --input | Sync clipboards | xsel --output | xsel --primary --input |
| xsel --clipboard --output > backup.log | Save log | Backup clipboard | xsel --clipboard --output > backup.log |

### 5. Selection Types (5)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| --clipboard | Target clipboard (Ctrl+C/V) | Standard copy-paste | xsel --clipboard |
| --primary | Target primary selection | Middle-click paste | xsel --primary |
| --secondary | Target secondary selection | Rarely used | xsel --secondary |
| -c | Short for --clipboard | Quick clipboard | xsel -c |
| -p | Short for --primary | Quick primary | xsel -p |

### 6. Piping and Integration (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ls -la | xsel | Copy ls output | ls -la | xsel |
| pwd | xsel -c | Copy current path | pwd | xsel -c |
| date | xsel --clipboard | Copy date/time | date | xsel --clipboard |
| whoami | xsel -p | Copy username to primary | whoami | xsel -p |
| ip addr | xsel -c | Copy network info | ip addr | xsel -c |
| git status | xsel | Copy git status | git status | xsel |
| xsel --output | sort | Sort clipboard | xsel --output | sort |
| xsel --output | tee file.txt | Display and save | xsel --output | tee output.txt |
| xsel --clipboard --output | wc -l | Count lines | xsel --clipboard --output | wc -l |
| curl url | xsel -c | Copy URL content | curl example.com | xsel -c |
| echo $PATH | xsel | Copy environment var | echo $PATH | xsel |
| xsel -c | xsel -p | Sync clipboard to primary | xsel -c | xsel -p |

### 7. Clear Clipboard (4)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --clipboard --input /dev/null | Clear clipboard | Empty clipboard | xsel --clipboard --input /dev/null |
| echo -n | xsel --clipboard | Clear with empty input | echo -n | xsel --clipboard |
| xsel --clipboard --clear | Explicit clear | Alternative | xsel --clipboard --clear |
| xsel --primary --input /dev/null | Clear primary | Reset middle-click | xsel --primary --input /dev/null |

### 8. Copy from Command Output (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| uptime | xsel | Copy system uptime | uptime | xsel |
| df -h | xsel -c | Copy disk usage | df -h | xsel -c |
| free -h | xsel | Copy memory usage | free -h | xsel |
| ps aux | xsel | Copy process list | ps aux | xsel |
| xsel --clipboard --input <(lsblk) | Copy block devices | Advanced | xsel --clipboard --input <(lsblk) |
| git log --oneline | xsel | Copy commit history | git log --oneline | xsel |
| journalctl -n 50 | xsel | Copy recent logs | journalctl -n 50 | xsel |
| uname -a | xsel | Copy kernel info | uname -a | xsel |
| lsb_release -a | xsel | Copy distro info | lsb_release -a | xsel |
| xsel -c <(env) | Copy environment | Full env export | xsel -c <(env) |

### 9. Advanced Flags and Options (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| --nodetach | Stay in foreground | Debugging | xsel --nodetach --output |
| --loop n | Loop n times | Repeated paste | xsel --loop 5 --output |
| --delete | Delete selection | Clear contents | xsel --clipboard --delete |
| --display :0 | Specify display | X server | xsel --display :0 |
| --verbose | Verbose output | Debugging | xsel --verbose |
| --append | Append to selection | Add to existing | echo "More" | xsel --append |
| --logfile file | Log operations | Debug | xsel --logfile debug.log |
| --primary --output | Short form | Quick primary | xsel -p -o |

### 10. Aliases and Shortcuts (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| alias c='xsel --clipboard --input' | Alias copy | Quick copy | echo "Text" | c |
| alias p='xsel --clipboard --output' | Alias paste | Quick paste | p |
| alias pp='xsel --primary --output' | Primary paste alias | Middle-click | pp |
| alias cc='xsel --primary --input' | Primary copy alias | Middle-click copy | echo "Primary" | cc |
| alias clip='xsel --clipboard' | Descriptive alias | Clear name | echo "Clip" | clip |
| alias clipclear='echo -n | xsel --clipboard --input' | Clear alias | clipclear |

### 11. Troubleshooting (9)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --output | Check contents | Verify clipboard | xsel --output |
| xsel --clipboard --output | Explicit check | Debug | xsel --clipboard --output |
| xsel --verbose | Debug output | See errors | xsel --verbose |
| ps aux | grep xsel | Check running | ps aux | grep xsel |
| DISPLAY=:0 xsel --output | Fix display | Wrong X server | DISPLAY=:0 xsel --output |
| xsel --display :0 --output | Same fix | Alternative | xsel --display :0 --output |
| xsel --clipboard --input /dev/null | Clear test | Reset | xsel --clipboard --input /dev/null |
| xsel --help | Check version/options | Version mismatch | xsel --help |
| sudo apt reinstall xsel | Fix broken install | Package issue | sudo apt reinstall xsel |

### 12. Scripting and Automation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --clipboard --output | bash script | Read clipboard | In scripts |
| echo "Error" | xsel --clipboard | Notify clipboard | Error handling |
| xsel --clipboard --input <(command) | Process substitution | Advanced | xsel --clipboard --input <(git diff) |
| if [ -n "$(xsel --clipboard --output)" ]; then ... | Check non-empty | Conditional | In bash |
| xsel --clipboard --output | notify-send "Clipboard" | Desktop notify | notify-send "Copied" |
| cron: date | xsel --clipboard | Scheduled copy | Crontab entry |
| xsel --clipboard --output | tee /dev/tty | Display in script | Debug |
| xsel --clipboard --output | jq . | Parse JSON | Clipboard JSON |

### 13. Common Use Cases (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git diff | xsel | Copy changes | git diff | xsel |
| curl api | jq . | xsel | Copy formatted JSON | curl api | jq . | xsel |
| docker ps | xsel | Copy container list | docker ps | xsel |
| kubectl get pods | xsel | Copy k8s output | kubectl get pods | xsel |
| cat ~/.ssh/id_rsa.pub | xsel | Copy public key | cat ~/.ssh/id_rsa.pub | xsel |
| hostname -I | xsel | Copy IP address | hostname -I | xsel |
| lsblk | xsel | Copy disk layout | lsblk | xsel |
| journalctl -xe | xsel | Copy recent errors | journalctl -xe | xsel |
| env | xsel | Copy environment | env | xsel |
| xsel --output | pbcopy | macOS compatibility | For dual use |

### 14. Security and Best Practices (7)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --clipboard --input /dev/null | Clear sensitive data | Security | xsel --clipboard --input /dev/null |
| echo "Sensitive" | xsel --clipboard | Avoid plain text | Never copy passwords |
| xsel --primary | Use primary for temp | Avoid clipboard history | Temporary copies |
| xsel --loop 1 | Limit paste loops | Prevent spam | xsel --loop 1 --output |
| xsel --nodetach | Debugging | Scripts | xsel --nodetach |
| xsel --display :0 | Specify display | Multi-monitor | xsel --display :0 |
| alias c='xsel --clipboard --input' | Safe alias | No output | echo "Safe" | c |

### 15. Alternatives and Comparisons (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip | Similar X11 tool | xclip -sel clip | xclip vs xsel |
| wl-copy | Wayland equivalent | Wayland systems | wl-copy "Text" |
| pbcopy | macOS equivalent | macOS | echo "Text" | pbcopy |
| clip.exe | WSL Windows clipboard | WSL | echo "Text" | clip.exe |
| gpaste | GNOME clipboard manager | GUI integration | gpaste-client |
| clipmenu | Clipboard manager | dmenu/rofi | clipmenu |
| copyq | GUI clipboard manager | Advanced | copyq |
| wl-paste | Wayland paste | Wayland | wl-paste |

### 16. Display and Environment (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xsel --display :0 | Force display | Remote X11 | xsel --display :0 |
| export DISPLAY=:0 | Set env | Fix no display | export DISPLAY=:0 |
| xsel --display :0 --clipboard --output | Explicit display | SSH X11 | xsel --display :0 --clipboard --output |
| xsel --display :0.0 | Multi-display | Specific screen | xsel --display :0.0 |
| xsel --display unix:0 | Unix socket | Local X | xsel --display unix:0 |
| xsel --display :0 --output | Test connection | Verify X server | xsel --display :0 --output |

### 17. Advanced Combinations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git rev-parse HEAD | xsel | Copy current commit | git rev-parse HEAD | xsel |
| docker logs container | xsel --clipboard | Copy container logs | docker logs container | xsel --clipboard |
| kubectl describe pod | xsel | Copy pod details | kubectl describe pod | xsel |
| xsel --output | tr -d '\n' | Remove newlines | xsel --output | tr -d '\n' |
| xsel --clipboard | xsel --primary --input | Sync clipboards | xsel --clipboard | xsel --primary --input |
| curl -s url | jq . | xsel --clipboard | Copy API response | curl -s api | jq . | xsel --clipboard |
| xsel --clipboard | notify-send -t 3000 "Copied" | Notify copy | echo "Done" | xsel && notify-send "Copied" |
| xsel --clipboard --input <(ls -l | tail -n +2) | Copy without header | ls -l | xsel |
| xsel --loop 3 --output | Repeat paste | Testing | xsel --loop 3 --output |
| xsel --output | sort -u | Unique lines | xsel --output | sort -u |
| xsel --clipboard --input <(find . -name "*.txt") | Copy file list | Search results | find . -name "*.txt" | xsel |
| xsel --clipboard --output | tee >(xargs -I {} echo "Pasted: {}") | Log paste | xsel --clipboard --output | tee log |

## Tips and Best Practices
* Use --clipboard for Ctrl+C/V compatibility (most common use).
* Prefer --primary for temporary middle-click pastes.
* Clear clipboard after sensitive operations with --clear.
* Create aliases for faster copy/paste (c, p, cc, pp).
* Always test with --output before pasting to verify.
* Use --nodetach when debugging scripts.
* Combine with notify-send for visual feedback on copy.
* Avoid copying passwords or secrets directly.
* Specify --display :0 when running via SSH with X11 forwarding.
* Pipe output directly for clean workflows.
* Use --append to add to existing clipboard contents.
* Check DISPLAY variable when xsel fails silently.
* Use --delete to fully remove a selection.
* Integrate with jq, grep, and sort for powerful pipelines.
* Keep clipboard history disabled for security.
* Use --primary for quick, non-persistent copies.
* Regularly clear clipboard with a script or alias.
* Test on your display server (X11 only).
* Prefer wl-copy on Wayland systems.

## Additional Resources
* [Xsel Man Page](https://manpages.ubuntu.com/manpages/jammy/man1/xsel.1.html)
* [Xsel GitHub Repository](https://github.com/ConradP/xsel)
* [Xsel Tutorial and Examples](https://linux.die.net/man/1/xsel)
* [Using Xsel in Bash Scripts](https://www.baeldung.com/linux/xsel-clipboard)
* [Xsel vs Xclip Comparison](https://unix.stackexchange.com/questions/258512/what-is-the-difference-between-xclip-and-xsel)
* [Wayland Clipboard Alternatives](https://wiki.archlinux.org/title/Clipboard)
* [X11 Selection Basics](https://tronche.com/gui/x/xlib/events/client-communication/)
* [Advanced Clipboard Tools](https://www.tecmint.com/xclip-copy-paste-linux-command-line/)

## Mini-Glossary
This mini-glossary defines key terms related to xsel and the Linux X11 clipboard system.

### 1. Clipboard Basics
| Term/Concept | Description |
| --- | --- |
| Clipboard | Ctrl+C/V data buffer |
| Primary Selection | Middle-click paste buffer |
| Secondary Selection | Rarely used third buffer |
| X11 | Window system clipboard relies on |
| Wayland | Modern compositor without X11 clipboard |
| Selection | X11 term for clipboard type |
| Append | Add to existing selection |
| Delete | Remove selection contents |

### 2. Xsel Flags
| Term/Concept | Description |
| --- | --- |
| --clipboard | Target clipboard |
| --primary | Target primary selection |
| --secondary | Target secondary selection |
| --input | Copy mode |
| --output | Paste mode |
| --clear | Clear selection |
| --nodetach | Stay in foreground |
| --loop | Repeat paste count |

### 3. Clipboard Operations
| Term/Concept | Description |
| --- | --- |
| Copy | Send data to selection |
| Paste | Retrieve data from selection |
| Clear | Empty selection contents |
| Append | Add to existing data |
| Delete | Remove selection |
| Pipe | Send data through xsel |
| Stdin | Input from previous command |
| Stdout | Output to next command |

### 4. Common Integrations
| Term/Concept | Description |
| --- | --- |
| notify-send | Desktop notification |
| jq | JSON processor |
| grep | Pattern search |
| sort | Line sorting |
| tee | Duplicate output |
| xargs | Build command lines |
| alias | Shell shortcut |
| cron | Scheduled tasks |

### 5. Error Types
| Term/Concept | Description |
| --- | --- |
| No X server | DISPLAY unset |
| Permission denied | Wrong display |
| Empty selection | Nothing copied |
| Format mismatch | Wrong target type |
| Wayland system | xsel not compatible |
| Loop overflow | Too many loops |
| Verbose output | Debug info |
| Unknown option | Version mismatch |

### 6. Alternatives
| Term/Concept | Description |
| --- | --- |
| xclip | Similar X11 tool |
| wl-copy | Wayland copy |
| wl-paste | Wayland paste |
| gpaste | GNOME clipboard |
| clip.exe | WSL Windows |
| pbcopy | macOS clipboard |
| clipmenu | dmenu clipboard |
| copyq | GUI clipboard manager |

### 7. Best Practices
| Term/Concept | Description |
| --- | --- |
| Clear sensitive | Remove passwords |
| Use primary | Temporary copies |
| Alias shortcuts | Faster workflow |
| Verbose mode | Debugging |
| Test paste | Verify contents |
| Display var | SSH X11 |
| Append mode | Incremental copy |
| Notification | Visual feedback |

### 8. X11 vs Wayland
| Term/Concept | Description |
| --- | --- |
| X11 | Traditional clipboard |
| Wayland | Modern, secure |
| wl-clipboard | Wayland tools |
| xsel | X11 only |
| Compatibility | XWayland bridge |
| Primary | X11 middle-click |
| Clipboard | Ctrl+C/V |
| Security | Wayland better |

