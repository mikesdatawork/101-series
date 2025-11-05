#!/bin/bash

# Script to update the Linux commands with full 101 commands and mini-glossary
# Set colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project directory
PROJECT_DIR="/home/user/projects/sheets/101-series"

# Check if directory exists
if [ ! -d "$PROJECT_DIR" ]; then
  echo -e "${RED}Error: Directory $PROJECT_DIR does not exist.${NC}"
  exit 1
fi

# Navigate to project directory
cd "$PROJECT_DIR" || { echo -e "${RED}Error: Cannot change to directory $PROJECT_DIR${NC}"; exit 1; }
echo -e "${BLUE}Working directory: $(pwd)${NC}"

# Linux commands file
LINUX_COMMANDS_FILE="operating-systems/101-Linux-Terminal-Commands.md"

if [ ! -f "$LINUX_COMMANDS_FILE" ]; then
  echo -e "${RED}Error: Linux commands file not found at $LINUX_COMMANDS_FILE.${NC}"
  exit 1
fi

echo -e "${BLUE}Updating the Linux commands file with full 101 commands and mini-glossary...${NC}"

# Create the updated file with full 101 commands and mini-glossary
cat > "$LINUX_COMMANDS_FILE" << 'EOL'
# 101 Linux Terminal Commands

## Overview
Linux terminal commands form the backbone of system administration, development, and power-user workflows in Linux environments. This cheat sheet covers the most essential commands for navigating, managing files, monitoring system resources, and automating tasks in Linux-based operating systems like Debian, Ubuntu, Mint, and other distributions.

## Target Audience
- Linux beginners wanting to become comfortable with the command line
- Developers working in Linux environments
- System administrators
- DevOps engineers
- Anyone transitioning from GUI-based operating systems to Linux

## Command Categories

### 1. File System Navigation and Management (25)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `ls` | List directory contents | Viewing files in current directory | `ls -la` (shows all files with details) |
| `cd` | Change directory | Navigating file system | `cd /home/user/Documents` |
| `pwd` | Print working directory | Checking current location | `pwd` |
| `mkdir` | Make directory | Creating new folders | `mkdir -p projects/new-project` |
| `rmdir` | Remove directory | Delete empty directories | `rmdir old-folder` |
| `rm` | Remove files or directories | Delete files | `rm -rf directory` (use with caution!) |
| `cp` | Copy files or directories | Duplicating files | `cp -r source/ destination/` |
| `mv` | Move or rename files | Relocating or renaming files | `mv oldname.txt newname.txt` |
| `touch` | Create empty file | Creating new files | `touch newfile.txt` |
| `cat` | Concatenate and display files | Viewing file contents | `cat file.txt` |
| `less` | View file contents page by page | Reading large files | `less large_log_file.log` |
| `head` | Display first part of files | Viewing beginning of files | `head -n 20 file.txt` |
| `tail` | Display last part of files | Monitoring log files | `tail -f /var/log/syslog` |
| `find` | Search for files | Locating files by name, size, etc. | `find / -name "*.txt" -type f` |
| `locate` | Find files by name | Quick file search | `locate document.pdf` |
| `grep` | Search text patterns | Finding text in files | `grep -r "search term" .` |
| `chmod` | Change file permissions | Setting file access rights | `chmod 755 script.sh` |
| `chown` | Change file owner | Changing file ownership | `chown user:group file.txt` |
| `ln` | Create links between files | Creating shortcuts | `ln -s target_file link_name` |
| `du` | Disk usage | Checking space used by files | `du -sh directory/` |
| `df` | Disk free | Checking available disk space | `df -h` |
| `mount` | Mount filesystems | Accessing external devices | `mount /dev/sdb1 /mnt/usb` |
| `umount` | Unmount filesystems | Safely removing devices | `umount /mnt/usb` |
| `tar` | Manipulate archive files | Creating/extracting archives | `tar -czvf archive.tar.gz folder/` |
| `zip/unzip` | Compress/extract ZIP archives | Working with ZIP files | `zip -r archive.zip folder/` |

### 2. System Information and Management (20)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `uname` | Print system information | Checking OS/kernel details | `uname -a` |
| `hostname` | Show or set system hostname | Identifying the machine | `hostname` |
| `uptime` | Show system uptime | Checking how long system has been running | `uptime` |
| `who` | Show who is logged in | Checking current users | `who` |
| `whoami` | Print current user | Confirming current user | `whoami` |
| `id` | Print user identity | Checking user ID and groups | `id` |
| `ps` | Report process status | Viewing running processes | `ps aux` |
| `top` | Display running processes | Real-time process monitoring | `top` |
| `htop` | Interactive process viewer | Enhanced process monitoring | `htop` |
| `kill` | Terminate processes | Stopping unresponsive programs | `kill -9 1234` |
| `free` | Display memory usage | Checking RAM status | `free -m` |
| `lsblk` | List block devices | Viewing disk drives and partitions | `lsblk` |
| `lsusb` | List USB devices | Checking connected USB devices | `lsusb` |
| `lspci` | List PCI devices | Checking hardware components | `lspci` |
| `dmesg` | Print kernel ring buffer | Viewing kernel messages | `dmesg` |
| `journalctl` | Query systemd journal | Viewing system logs | `journalctl -xe` |
| `systemctl` | Control systemd | Managing system services | `systemctl status sshd` |
| `reboot` | Reboot the system | Restarting the system | `reboot` |
| `shutdown` | Shutdown the system | Powering off the system | `shutdown -h now` |
| `passwd` | Change user password | Setting/changing passwords | `passwd` |

### 3. Networking (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `ping` | Send ICMP echo requests | Testing network connectivity | `ping google.com` |
| `ip` | Show/manipulate routing, etc. | Configuring network interfaces | `ip addr show` |
| `ifconfig` | Configure network interfaces | Viewing network settings | `ifconfig eth0` |
| `netstat` | Network statistics | Checking open ports | `netstat -tulpn` |
| `ss` | Socket statistics | Investigating network connections | `ss -tuln` |
| `hostname` | Show or set hostname | Identifying current system name | `hostname -I` (show IP) |
| `dig` | DNS lookup | Querying DNS records | `dig google.com` |
| `nslookup` | Query DNS records | Looking up IP addresses | `nslookup google.com` |
| `traceroute` | Print network route | Tracing packet paths | `traceroute google.com` |
| `wget` | Download files | Retrieving files from web | `wget https://example.com/file.zip` |
| `curl` | Transfer data to/from URLs | API testing, file downloads | `curl -O https://example.com/file` |
| `ssh` | Secure shell client | Connecting to remote servers | `ssh user@192.168.1.100` |
| `scp` | Secure copy | Transferring files over SSH | `scp file.txt user@192.168.1.100:/home/user/` |
| `rsync` | Remote file synchronization | Syncing directories | `rsync -avz source/ user@host:destination/` |
| `iptables` | IP packet filter administration | Configuring firewall rules | `iptables -L` (list rules) |

### 4. Text Processing (15)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `echo` | Display a line of text | Printing output or variable values | `echo "Hello World"` |
| `cat` | Concatenate files and print | Displaying file contents | `cat file1.txt file2.txt` |
| `grep` | Search for patterns | Finding text in files | `grep "pattern" file.txt` |
| `sed` | Stream editor | Text transformation | `sed 's/old/new/g' file.txt` |
| `awk` | Pattern scanning and processing | Text extraction and reporting | `awk '{print $1}' file.txt` |
| `cut` | Remove sections from lines | Extracting specific fields | `cut -d':' -f1 /etc/passwd` |
| `sort` | Sort lines of text files | Organizing data | `sort -n numbers.txt` |
| `uniq` | Report or omit repeated lines | Finding unique entries | `sort file.txt \| uniq` |
| `wc` | Print newline, word, byte counts | Counting lines, words, characters | `wc -l file.txt` (line count) |
| `diff` | Compare files line by line | Finding differences between files | `diff file1 file2` |
| `tr` | Translate or delete characters | Character replacement | `echo "Hello" \| tr 'e' 'E'` |
| `paste` | Merge lines of files | Combining data from multiple files | `paste file1 file2` |
| `join` | Join lines on a common field | Merging files based on shared values | `join file1 file2` |
| `tee` | Read from stdin, write to files | Splitting command output | `command \| tee output.txt` |
| `fmt` | Simple text formatter | Reformatting text | `fmt -w 80 file.txt` |

### 5. User and Permission Management (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `useradd` | Create a new user | Adding users to the system | `useradd -m username` |
| `userdel` | Delete a user account | Removing users | `userdel -r username` |
| `usermod` | Modify a user account | Changing user properties | `usermod -aG sudo username` |
| `groupadd` | Create a new group | Creating user groups | `groupadd developers` |
| `groupdel` | Delete a group | Removing groups | `groupdel developers` |
| `passwd` | Change user password | Setting passwords | `passwd username` |
| `chmod` | Change file permissions | Modifying access rights | `chmod 644 file.txt` |
| `chown` | Change file owner and group | Changing ownership | `chown user:group file.txt` |
| `chgrp` | Change group ownership | Changing file group | `chgrp newgroup file.txt` |
| `sudo` | Execute command as superuser | Running privileged commands | `sudo apt update` |

### 6. Package Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `apt update` | Update package lists | Refreshing repository data | `sudo apt update` |
| `apt upgrade` | Upgrade packages | Updating installed software | `sudo apt upgrade` |
| `apt install` | Install packages | Adding new software | `sudo apt install package-name` |
| `apt remove` | Remove packages | Uninstalling software | `sudo apt remove package-name` |
| `apt search` | Search packages | Finding available software | `apt search keyword` |
| `apt list` | List packages | Viewing installed packages | `apt list --installed` |
| `dpkg` | Package manager for Debian | Managing .deb files | `sudo dpkg -i package.deb` |
| `apt autoremove` | Remove unused dependencies | Cleaning up the system | `sudo apt autoremove` |

### 7. Process Control and Job Management (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-----------------|----------|
| `ps` | Report process status | Viewing running processes | `ps aux` |
| `kill` | Send a signal to a process | Terminating processes | `kill -15 1234` |
| `pkill` | Kill processes by name | Terminating multiple processes | `pkill firefox` |
| `bg` | Put jobs in background | Running commands in background | `bg %1` |
| `fg` | Bring jobs to foreground | Returning to background jobs | `fg %1` |
| `jobs` | List active jobs | Checking background processes | `jobs` |
| `nohup` | Run command immune to hangups | Running processes after logout | `nohup command &` |
| `nice` | Run with modified scheduling priority | Setting process priority | `nice -n 10 command` |

## Tips and Best Practices
* Use tab completion to save time and avoid typos
* Learn to use pipe (`|`) to combine commands
* Understand file permissions (read, write, execute)
* Master basic text manipulation commands for data processing
* Use shell history (up arrow or `history` command) to reuse commands
* Create aliases for frequently used commands
* Use `man` pages to learn more about commands (e.g., `man ls`)
* Backup important files before making major changes

## Additional Resources
* [Linux Command Line Cheat Sheet by DaveChild](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)
* [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
* [The Linux Documentation Project](https://tldp.org/)
* [Linux Command Library](https://linuxcommandlibrary.com/)
* [Explainshell](https://explainshell.com/) - Explains shell commands

## Linux Command Line Mini-Glossary

This glossary explains common terms, acronyms, and concepts you'll encounter when using Linux commands.

### Common Terms

| Term | Description |
|------|-------------|
| `argument` | Additional information provided to a command to modify its behavior |
| `directory` | A file system container for files and other directories (folder in Windows/Mac) |
| `path` | The location of a file or directory in the file system |
| `absolute path` | Complete path from the root directory (starts with `/`) |
| `relative path` | Path relative to the current working directory |
| `root directory` | The top-level directory in the file system, denoted by `/` |
| `home directory` | User's personal directory, typically `/home/username/` or `~` |
| `terminal` | Text interface for typing commands |
| `shell` | Program that interprets and executes commands (e.g., Bash, Zsh) |
| `stdin` | Standard input - data stream for input to commands |
| `stdout` | Standard output - data stream for command output |
| `stderr` | Standard error - data stream for error messages |
| `pipe` | Symbol `|` that sends output from one command as input to another |
| `redirection` | Using symbols like `>`, `>>`, `<` to redirect input/output |
| `daemon` | Background service process |
| `PID` | Process ID - unique identifier assigned to each running process |
| `superuser` | Administrator user (root) with full system privileges |
| `repository` | Collection of software packages for distribution |
| `package` | Software bundle ready for installation |
| `kernel` | Core component of the operating system |
| `distribution` | Version of Linux with specific package selections and configurations |

### Common Command Flags/Options

| Flag | Common Meaning | Example Usage |
|------|----------------|--------------|
| `-a` | All | `ls -a` (show all files, including hidden ones) |
| `-f` | Force | `rm -f file.txt` (force removal without confirmation) |
| `-h` | Human-readable | `du -h` (display sizes in human-readable format) |
| `-i` | Interactive | `mv -i file dir` (prompt before overwrite) |
| `-l` | Long format | `ls -l` (detailed listing) |
| `-r` | Recursive | `cp -r dir1 dir2` (copy directory and contents) |
| `-v` | Verbose | `cp -v file dir` (show detailed operation output) |
| `-p` | Preserve | `cp -p file copy` (preserve file attributes) |
| `-n` | Line numbers | `cat -n file.txt` (show line numbers) |
| `-c` | Count | `wc -c file.txt` (count characters) |

### File Permission Symbols

| Symbol | Meaning |
|--------|---------|
| `r` | Read permission |
| `w` | Write permission |
| `x` | Execute permission |
| `-` | No permission |
| `d` | Directory |
| `l` | Symbolic link |

### File Permission Numbers

| Number | Permission | Symbol |
|--------|------------|--------|
| `0` | No permissions | `---` |
| `1` | Execute only | `--x` |
| `2` | Write only | `-w-` |
| `3` | Write and execute | `-wx` |
| `4` | Read only | `r--` |
| `5` | Read and execute | `r-x` |
| `6` | Read and write | `rw-` |
| `7` | Read, write, and execute | `rwx` |

### Common Acronyms

| Acronym | Stands For | Related To |
|---------|------------|------------|
| `sudo` | Superuser do | Running commands with administrator privileges |
| `ssh` | Secure shell | Encrypted remote access protocol |
| `scp` | Secure copy | File transfer over SSH |
| `sftp` | Secure file transfer protocol | Interactive file transfer over SSH |
| `grep` | Global regular expression print | Pattern searching |
| `sed` | Stream editor | Text transformation tool |
| `awk` | Aho, Weinberger, and Kernighan | Text processing language |
| `curl` | Client URL | Tool for transferring data with URLs |
| `wget` | Web get | Non-interactive network downloader |
| `tar` | Tape archive | File archiving utility |
| `df` | Disk free | Report file system disk space usage |
| `du` | Disk usage | Estimate file space usage |
| `ps` | Process status | Report process status |
| `rpm` | Red Hat Package Manager | Package management system |
| `apt` | Advanced Package Tool | Package management system for Debian-based systems |
| `yum` | Yellowdog Updater, Modified | Package management for RPM-based systems |
| `dnf` | Dandified YUM | Next-generation version of YUM |
| `systemd` | System daemon | System and service manager |
| `cron` | Chronograph | Time-based job scheduler |
| `I/O` | Input/Output | Data transfer operations |

### Special Characters

| Character | Name | Common Usage |
|-----------|------|-------------|
| `~` | Tilde | Represents home directory |
| `.` | Dot | Current directory |
| `..` | Double dot | Parent directory |
| `*` | Asterisk | Wildcard for any characters |
| `?` | Question mark | Wildcard for a single character |
| `&` | Ampersand | Run command in background |
| `&&` | Double ampersand | Command chaining (if first succeeds) |
| `||` | Double pipe | Command chaining (if first fails) |
| `>` | Greater than | Redirect output to file (overwrite) |
| `>>` | Double greater than | Redirect output to file (append) |
| `<` | Less than | Redirect file as input |
| `#` | Hash | Comment in scripts |
| `!` | Exclamation mark | Access command history |

### Understanding Command Syntax

Most Linux commands follow this general syntax:
```
command [options] [arguments]
```

* **Command**: The name of the program you want to run
* **Options**: Modify how the command works (often preceded by - or --)
* **Arguments**: What the command operates on (files, directories, text, etc.)

Example with breakdown:
```
ls -la /home/user
```
* `ls` is the command (list directory contents)
* `-la` are the options (`l` for long format, `a` for all files)
* `/home/user` is the argument (the directory to list)
EOL

echo -e "${GREEN}Linux commands file updated with full 101 commands and mini-glossary.${NC}"

# Check if Git is available and this is a repository
if [ -d ".git" ]; then
  # Commit the changes
  git add "$LINUX_COMMANDS_FILE"
  git commit -m "Update Linux commands with full 101 commands and mini-glossary"
  
  # Push to GitHub if remote is configured
  if [ -n "$(git remote -v)" ]; then
    echo -e "${BLUE}Pushing changes to GitHub...${NC}"
    git push
  fi
  
  echo -e "${GREEN}Changes committed to Git.${NC}"
else
  echo -e "${YELLOW}This directory is not a Git repository. Changes not committed.${NC}"
fi

echo -e "\n${GREEN}Linux commands update complete!${NC}"
