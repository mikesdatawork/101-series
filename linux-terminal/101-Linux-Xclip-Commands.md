# 101 Linux Xclip Commands

## Overview
xclip is a lightweight command-line utility that allows copying text to and pasting from the X clipboard (and primary selection) in Linux environments with an X server. This cheat sheet covers installation, basic clipboard operations, working with different selection types, piping input/output, handling multiple clipboards, scripting integrations, and troubleshooting for xclip. Mastering xclip streamlines workflows for copying terminal output, URLs, code snippets, and system information directly to the clipboard without a mouse.

## Target Audience
- System administrators automating tasks
- Developers copying logs and code
- DevOps engineers sharing terminal output
- Power users enhancing shell workflows
- Anyone using Linux with X11 clipboard

### 1. Installation and Setup (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt install xclip | Install on Debian/Ubuntu | Debian-based setup | sudo apt install xclip |
| sudo dnf install xclip | Install on Fedora | RPM-based setup | sudo dnf install xclip |
| sudo pacman -S xclip | Install on Arch/Manjaro | Arch-based setup | sudo pacman -S xclip |
| brew install xclip | Install on macOS (with XQuartz) | macOS X11 users | brew install xclip |
| xclip -version | Check installed version | Verify installation | xclip -version |
| xclip -h | Display help | Quick option reference | xclip -h |
| man xclip | View manual page | Full documentation | man xclip |
| which xclip | Confirm command location | Path check | which xclip |
| xclip -selection clipboard -o | Test paste | Verify working | xclip -selection clipboard -o |
| sudo apt-get install xclip | Alternative Debian install | Older systems | sudo apt-get install xclip |

### 2. Basic Copy to Clipboard (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -selection clipboard | Copy stdin to clipboard | Default copy | echo "Hello" | xclip -selection clipboard |
| xclip | Copy to clipboard (default) | Short form | echo "Text" | xclip |
| xclip -i | Copy input (explicit) | Same as default | echo "Data" | xclip -i |
| xclip -selection clipboard -i | Copy to clipboard explicitly | Clear option | echo "Test" | xclip -selection clipboard -i |
| xclip -o | Paste clipboard contents | Default paste | xclip -o |
| echo "Content" | xclip -sel clip | Copy shorthand | echo "Content" | xclip -sel clip |
| xclip -sel c | Copy to clipboard (short) | Minimal typing | echo "Quick" | xclip -sel c |
| xclip -selection primary | Copy to primary selection | Middle-click paste | echo "Primary" | xclip -selection primary |

### 3. Pasting from Clipboard (7)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -o | Output clipboard contents | Default paste | xclip -o |
| xclip -selection clipboard -o | Explicit clipboard paste | Clear | xclip -selection clipboard -o |
| xclip -sel clip -o | Short paste clipboard | Quick | xclip -sel clip -o |
| xclip -selection primary -o | Paste primary selection | Middle-click | xclip -selection primary -o |
| xclip -sel p -o | Short paste primary | Fast | xclip -sel p -o |
| xclip -o > file.txt | Save clipboard to file | Export | xclip -o > notes.txt |
| cat file.txt | xclip -i | Copy file contents | cat script.sh | xclip -i |

### 4. Working with Files (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -i < file.txt | Copy file contents | Read from file | xclip -i < config.conf |
| xclip -o > output.txt | Paste to file | Export clipboard | xclip -o > backup.txt |
| cat file.txt | xclip -sel clip | Copy file to clipboard | cat README.md | xclip -sel clip |
| xclip -sel clip -i file.txt | Copy file explicitly | Same as above | xclip -sel clip -i file.txt |
| xclip -o | xclip -sel primary | Copy clipboard to primary | xclip -o | xclip -sel primary |
| xclip -sel clip -o > backup.log | Save log | Backup clipboard | xclip -sel clip -o > backup.log |

### 5. Clipboard Selection Types (5)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| -selection clipboard | Target clipboard (Ctrl+C/V) | Standard copy-paste | xclip -sel clip |
| -selection primary | Target primary selection | Middle-click paste | xclip -sel primary |
| -selection secondary | Target secondary selection | Rarely used | xclip -sel secondary |
| -sel c | Short for clipboard | Quick clipboard | xclip -sel c |
| -sel p | Short for primary | Quick primary | xclip -sel p |

### 6. Piping and Integration (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ls -la | xclip | Copy ls output | ls -la | xclip |
| pwd | xclip -sel clip | Copy current path | pwd | xclip -sel clip |
| date | xclip -sel c | Copy date/time | date | xclip -sel c |
| whoami | xclip | Copy username | whoami | xclip |
| ip addr | xclip -sel clip | Copy network info | ip addr | xclip -sel clip |
| git status | xclip | Copy git status | git status | xclip |
| xclip -o | grep pattern | Filter pasted | xclip -o | grep error |
| xclip -o | sort | Sort clipboard | xclip -o | sort |
| xclip -o | tee file.txt | Display and save | xclip -o | tee output.txt |
| xclip -sel clip -o | wc -l | Count lines | xclip -sel clip -o | wc -l |
| curl url | xclip | Copy URL content | curl example.com | xclip |
| echo $PATH | xclip | Copy environment var | echo $PATH | xclip |

### 7. Clear Clipboard (4)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -selection clipboard /dev/null | Clear clipboard | Empty clipboard | xclip -sel clip /dev/null |
| echo -n | xclip -sel clip | Clear with empty input | echo -n | xclip -sel clip |
| xclip -sel clip -i < /dev/null | Clear explicitly | Same as above | xclip -sel clip -i < /dev/null |
| xclip -sel primary /dev/null | Clear primary | Reset middle-click | xclip -sel primary /dev/null |

### 8. Copy from Command Output (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| uptime | xclip | Copy system uptime | uptime | xclip |
| df -h | xclip -sel clip | Copy disk usage | df -h | xclip -sel clip |
| free -h | xclip | Copy memory usage | free -h | xclip |
| ps aux | xclip | Copy process list | ps aux | xclip |
| xclip -sel clip -i <(lsblk) | Copy block devices | Advanced substitution | xclip -sel clip -i <(lsblk) |
| git log --oneline | xclip | Copy commit history | git log --oneline | xclip |
| journalctl -n 50 | xclip | Copy recent logs | journalctl -n 50 | xclip |
| uname -a | xclip | Copy kernel info | uname -a | xclip |
| lsb_release -a | xclip | Copy distro info | lsb_release -a | xclip |
| xclip -sel clip -i <(env) | Copy environment | Full env export | xclip -sel clip -i <(env) |

### 9. Advanced Options and Flags (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| -quiet | Suppress output | Silent copy | echo "Silent" | xclip -quiet |
| -loops n | Loop n times | Repeated paste | xclip -loops 5 -o |
| -filter | Use filter mode | Advanced | xclip -filter |
| -target target | Specify target format | MIME type | xclip -selection clipboard -target UTF8_STRING |
| -t target | Short target | MIME | xclip -t UTF8_STRING |
| -display :0 | Specify display | X server | xclip -display :0 |
| -verbose | Verbose output | Debugging | xclip -verbose |
| -noisy | Same as verbose | Alternative | xclip -noisy |

### 10. Aliases and Shortcuts (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| alias c='xclip -sel clip' | Alias copy | Quick copy | echo "Text" | c |
| alias p='xclip -sel clip -o' | Alias paste | Quick paste | p |
| alias pp='xclip -sel primary -o' | Primary paste alias | Middle-click | pp |
| alias cc='xclip -sel primary' | Primary copy alias | Middle-click copy | echo "Primary" | cc |
| alias clip='xclip -sel clip' | Descriptive alias | Clear name | echo "Clip" | clip |
| alias clipclear='echo -n | xclip -sel clip' | Clear alias | clipclear |

### 11. Troubleshooting (9)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -o | Check contents | Verify clipboard | xclip -o |
| xclip -selection clipboard -o | Explicit check | Debug | xclip -sel clip -o |
| xclip -verbose | Debug output | See errors | xclip -verbose |
| ps aux | grep xclip | Check running | ps aux | grep xclip |
| DISPLAY=:0 xclip -o | Fix display | Wrong X server | DISPLAY=:0 xclip -o |
| xclip -display :0 -o | Same fix | Alternative | xclip -display :0 -o |
| xclip -selection clipboard -i < /dev/null | Clear test | Reset | xclip -sel clip -i < /dev/null |
| xclip -h | Check version/options | Version mismatch | xclip -h |
| sudo apt reinstall xclip | Fix broken install | Package issue | sudo apt reinstall xclip |

### 12. Scripting and Automation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -sel clip -o | bash script | Read clipboard | In scripts |
| echo "Error" | xclip -sel clip | Notify clipboard | Error handling |
| xclip -sel clip -i <(command) | Process substitution | Advanced | xclip -sel clip -i <(git diff) |
| if [ -n "$(xclip -sel clip -o)" ]; then ... | Check non-empty | Conditional | In bash |
| xclip -sel clip -o | notify-send "Clipboard" | Desktop notify | notify-send "Copied" |
| cron: date | xclip -sel clip | Scheduled copy | Crontab entry |
| xclip -sel clip -o | tee /dev/tty | Display in script | Debug |
| xclip -sel clip -o | jq . | Parse JSON | Clipboard JSON |

### 13. Common Use Cases (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git diff | xclip | Copy changes | git diff | xclip |
| curl api | jq . | xclip | Copy formatted JSON | curl api | jq . | xclip |
| docker ps | xclip | Copy container list | docker ps | xclip |
| kubectl get pods | xclip | Copy k8s output | kubectl get pods | xclip |
| cat ~/.ssh/id_rsa.pub | xclip | Copy public key | cat ~/.ssh/id_rsa.pub | xclip |
| hostname -I | xclip | Copy IP address | hostname -I | xclip |
| lsblk | xclip | Copy disk layout | lsblk | xclip |
| journalctl -xe | xclip | Copy recent errors | journalctl -xe | xclip |
| env | xclip | Copy environment | env | xclip |
| xclip -o | pbcopy | macOS compatibility | For dual use |

### 14. Security and Best Practices (7)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -sel clip -i < /dev/null | Clear sensitive data | Security | xclip -sel clip -i < /dev/null |
| echo "Sensitive" | xclip -sel clip | Avoid plain text | Never copy passwords |
| xclip -sel primary | Use primary for temp | Avoid clipboard history | Temporary copies |
| xclip -loops 1 | Limit paste loops | Prevent spam | xclip -loops 1 -o |
| xclip -quiet | Silent operation | Scripts | xclip -quiet |
| xclip -display :0 | Specify display | Multi-monitor | xclip -display :0 |
| alias c='xclip -sel clip -quiet' | Safe alias | No output | echo "Safe" | c |

### 15. Alternatives and Comparisons (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| wl-copy | Wayland equivalent | Wayland systems | wl-copy "Text" |
| xsel | Alternative X11 tool | Similar to xclip | xsel -b -i |
| pbcopy | macOS equivalent | macOS | echo "Text" | pbcopy |
| clip.exe | WSL Windows clipboard | WSL | echo "Text" | clip.exe |
| xclip -sel clip | vs xsel -b | Comparison | xclip vs xsel |
| wl-paste | Wayland paste | Wayland | wl-paste |
| gpaste | GNOME clipboard manager | GUI integration | gpaste-client |
| clipmenu | Clipboard manager | dmenu/rofi | clipmenu |

### 16. Display and Environment (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| xclip -display :0 | Force display | Remote X11 | xclip -display :0 |
| export DISPLAY=:0 | Set env | Fix no display | export DISPLAY=:0 |
| xclip -display :0 -sel clip -o | Explicit display | SSH X11 | xclip -display :0 -sel clip -o |
| xclip -display :0.0 | Multi-display | Specific screen | xclip -display :0.0 |
| xclip -display unix:0 | Unix socket | Local X | xclip -display unix:0 |
| xclip -display :0 -o | Test connection | Verify X server | xclip -display :0 -o |

### 17. Advanced Combinations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| git rev-parse HEAD | xclip | Copy current commit | git rev-parse HEAD | xclip |
| docker logs container | xclip -sel clip | Copy container logs | docker logs container | xclip -sel clip |
| kubectl describe pod | xclip | Copy pod details | kubectl describe pod | xclip |
| xclip -o | tr -d '\n' | Remove newlines | xclip -o | tr -d '\n' |
| xclip -sel clip -o | xclip -sel primary | Sync clipboards | xclip -sel clip -o | xclip -sel primary |
| curl -s url | jq . | xclip -sel clip | Copy API response | curl -s api | jq . | xclip -sel clip |
| xclip -sel clip -o | notify-send -t 3000 "Copied" | Notify copy | echo "Done" | xclip && notify-send "Copied" |
| xclip -sel clip -i <(ls -l | tail -n +2) | Copy without header | ls -l | xclip |
| xclip -loops 3 -o | Repeat paste | Testing | xclip -loops 3 -o |
| xclip -sel clip -o | sort -u | Unique lines | xclip -sel clip -o | sort -u |
| xclip -sel clip -i <(find . -name "*.txt") | Copy file list | Search results | find . -name "*.txt" | xclip |
| xclip -sel clip -o | tee >(xargs -I {} echo "Pasted: {}") | Log paste | xclip -sel clip -o | tee log |

## Tips and Best Practices
* Always specify -selection clipboard for Ctrl+C/V compatibility.
* Use -quiet in scripts to avoid unwanted output.
* Clear the clipboard after copying sensitive data.
* Create aliases like c and p for faster workflow.
* Test with xclip -o before pasting to verify contents.
* Use primary selection for temporary copies.
* Combine with notify-send for visual feedback.
* Avoid copying passwords or secrets directly.
* Use -display :0 when running via SSH with X11 forwarding.
* Pipe output directly instead of intermediate files.
* Use loops sparingly to prevent accidental spam.
* Check DISPLAY variable when xclip fails silently.
* Prefer wl-copy on Wayland systems.
* Combine with tools like jq, grep, and sort for powerful pipelines.
* Keep clipboard history disabled for security.
* Use -target UTF8_STRING for text-only content.
* Regularly clear clipboard with a script or alias.
* Use primary selection for quick middle-click pastes.
* Integrate with shell prompts for automatic copy.

## Additional Resources
* [Xclip Man Page](https://manpages.ubuntu.com/manpages/jammy/man1/xclip.1.html)
* [Xclip GitHub Repository](https://github.com/astrand/xclip)
* [Xclip Tutorial and Examples](https://linuxhint.com/xclip_command_linux/)
* [Using Xclip in Bash Scripts](https://www.baeldung.com/linux/xclip-clipboard)
* [Xclip vs Xsel Comparison](https://unix.stackexchange.com/questions/258512/what-is-the-difference-between-xclip-and-xsel)
* [Wayland Clipboard Alternatives](https://wiki.archlinux.org/title/Clipboard)
* [X11 Clipboard Explained](https://tronche.com/gui/x/xlib/events/client-communication/)
* [Advanced Clipboard Management](https://www.tecmint.com/xclip-copy-paste-linux-command-line/)

## Mini-Glossary
This mini-glossary defines key terms related to xclip and the Linux clipboard system.

### 1. Clipboard Basics
| Term/Concept | Description |
| --- | --- |
| Clipboard | Storage for Ctrl+C/V data |
| Primary Selection | Middle-click paste buffer |
| Secondary Selection | Rarely used third buffer |
| X11 | Window system clipboard relies on |
| Wayland | Modern compositor without X11 clipboard |
| Selection | X11 term for clipboard type |
| Target | MIME type of clipboard data |
| UTF8_STRING | Common text format |

### 2. Xclip Flags
| Term/Concept | Description |
| --- | --- |
| -selection | Specify clipboard type |
| -sel | Short for -selection |
| -i | Input mode (copy) |
| -o | Output mode (paste) |
| -quiet | Suppress status output |
| -loops | Repeat paste count |
| -display | X server to use |
| -target | Data format (MIME) |

### 3. Clipboard Operations
| Term/Concept | Description |
| --- | --- |
| Copy | Send data to clipboard |
| Paste | Retrieve data from clipboard |
| Clear | Empty clipboard contents |
| Sync | Copy between selection types |
| Pipe | Send data through xclip |
| Stdin | Input from previous command |
| Stdout | Output to next command |
| File | Read/write from file |

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
| Empty clipboard | Nothing copied |
| Format mismatch | Wrong target type |
| Wayland system | xclip not compatible |
| Loop overflow | Too many loops |
| Verbose output | Debug info |
| Unknown option | Version mismatch |

### 6. Alternatives
| Term/Concept | Description |
| --- | --- |
| xsel | Similar X11 tool |
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
| Quiet mode | Scripts |
| Test paste | Verify contents |
| Display var | SSH X11 |
| UTF8_STRING | Text only |
| Notification | Visual feedback |

### 8. X11 vs Wayland
| Term/Concept | Description |
| --- | --- |
| X11 | Traditional clipboard |
| Wayland | Modern, secure |
| wl-clipboard | Wayland tools |
| xclip | X11 only |
| Compatibility | XWayland bridge |
| Primary | X11 middle-click |
| Clipboard | Ctrl+C/V |
| Security | Wayland better |

