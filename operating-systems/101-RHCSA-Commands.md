# 101 RHCSA Commands

## Overview
Red Hat Certified System Administrator (RHCSA) is an entry-level certification for Linux system administrators using Red Hat Enterprise Linux. This cheat sheet covers essential commands and syntax for tasks in system administration, storage configuration, networking, user management, security, boot troubleshooting, and container basics as per current RHCSA exam objectives. Mastering these will help pass the EX200 exam and handle real-world RHEL administration efficiently.

## Target Audience
- System administrators preparing for RHCSA certification
- Linux admins managing RHEL servers
- IT professionals handling enterprise infrastructure
- DevOps engineers in Red Hat environments
- Anyone learning RHEL system administration

### 1. Shell Basics and Access (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| bash | Start Bash shell | Launch interactive shell | bash |
| su | Switch user | Become another user | su - username |
| sudo | Execute as superuser | Run privileged commands | sudo command |
| ssh | Secure shell access | Remote login | ssh user@host |
| exit | Exit shell | Close current session | exit |
| history | View command history | Review past commands | history | grep keyword |
| alias | Create command alias | Shorten commands | alias ll='ls -l' |
| env | Display environment variables | View shell environment | env |

### 2. File and Directory Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ls | List directory contents | View files | ls -la /etc |
| cd | Change directory | Navigate filesystem | cd /var/log |
| pwd | Print working directory | Show current path | pwd |
| mkdir | Create directory | Make new folders | mkdir -p /path/to/dir |
| rmdir | Remove empty directory | Delete folders | rmdir empty_dir |
| rm | Remove files/directories | Delete items | rm -rf /path/to/dir |
| cp | Copy files/directories | Duplicate items | cp file1 file2 |
| mv | Move/rename files | Relocate or rename | mv old new |
| touch | Create empty file | Update timestamps | touch newfile.txt |
| ln | Create links | Hard/soft links | ln -s source link |
| find | Search for files | Locate by criteria | find / -name file.txt |
| locate | Quick file search | Database-based find | locate config.file |

### 3. Text Processing and Redirection (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| cat | Concatenate files | View file content | cat file.txt |
| less | Pager for viewing | Scroll through files | less longfile.log |
| head | Show file beginning | First lines | head -n 5 file |
| tail | Show file end | Last lines | tail -f /var/log/messages |
| grep | Search text | Pattern matching | grep error log.file |
| sed | Stream editor | Text transformation | sed 's/old/new/' file |
| awk | Pattern scanning | Data extraction | awk '{print $1}' file |
| > | Redirect output | To file | command > output.txt |
| >> | Append output | To file | command >> output.txt |
| | | Pipe output | To another command | ls | grep txt |

### 4. User and Group Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| useradd | Add user | Create account | useradd -m username |
| usermod | Modify user | Change attributes | usermod -aG group user |
| userdel | Delete user | Remove account | userdel -r username |
| passwd | Change password | Set/reset password | passwd username |
| chage | Change password aging | Expiry settings | chage -E date user |
| groupadd | Add group | Create group | groupadd groupname |
| groupmod | Modify group | Change group | groupmod -n new old |
| groupdel | Delete group | Remove group | groupdel groupname |
| id | Show user/group IDs | User info | id username |
| getent | Get entries | From databases | getent passwd user |
| vipw | Edit passwd file | Safe editing | vipw |
| vigr | Edit group file | Safe editing | vigr |

### 5. Permission Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| chmod | Change mode | Set permissions | chmod 755 file |
| chown | Change owner | Set user/group | chown user:group file |
| chgrp | Change group | Set group | chgrp group file |
| umask | Set default mask | Creation mode | umask 022 |
| setfacl | Set ACL | Extended permissions | setfacl -m u:user:rwx file |
| getfacl | Get ACL | View permissions | getfacl file |
| ls -Z | List SELinux context | Security labels | ls -Z /path |
| chcon | Change SELinux context | Set labels | chcon -t type file |
| restorecon | Restore SELinux context | Default labels | restorecon -v file |
| setsebool | Set SELinux boolean | Toggle settings | setsebool -P bool on |

### 6. Storage Management - Partitions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| fdisk | Partition table manipulator | MBR disks | fdisk /dev/sda |
| gdisk | GPT partition tool | GPT disks | gdisk /dev/sda |
| parted | Partition editor | Create/resize | parted /dev/sda mkpart |
| mkswap | Create swap space | Format swap | mkswap /dev/sdb1 |
| swapon | Enable swap | Activate swap | swapon /dev/sdb1 |
| swapoff | Disable swap | Deactivate swap | swapoff /dev/sdb1 |
| lsblk | List block devices | View storage | lsblk -f |
| blkid | Block device ID | UUID/labels | blkid /dev/sda1 |
| partprobe | Update kernel partitions | Reload table | partprobe |
| df | Disk free | Space usage | df -h |

### 7. Storage Management - LVM (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| pvcreate | Create physical volume | Initialize PV | pvcreate /dev/sdb1 |
| pvdisplay | Display PV | View info | pvdisplay |
| vgcreate | Create volume group | New VG | vgcreate vgname /dev/sdb1 |
| vgdisplay | Display VG | View info | vgdisplay |
| vgextend | Extend VG | Add PV | vgextend vgname /dev/sdc1 |
| vgreduce | Reduce VG | Remove PV | vgreduce vgname /dev/sdc1 |
| lvcreate | Create logical volume | New LV | lvcreate -L 10G -n lvname vgname |
| lvdisplay | Display LV | View info | lvdisplay |
| lvextend | Extend LV | Increase size | lvextend -L +5G /dev/vg/lv |
| lvreduce | Reduce LV | Decrease size | lvreduce -L -5G /dev/vg/lv |
| pvs | PV summary | Short list | pvs |
| vgs | VG summary | Short list | vgs |

### 8. File System Creation and Maintenance (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| mkfs.ext4 | Create ext4 FS | Format partition | mkfs.ext4 /dev/sda1 |
| mkfs.xfs | Create XFS FS | Format partition | mkfs.xfs /dev/sda1 |
| mkfs.vfat | Create FAT FS | Format partition | mkfs.vfat /dev/sda1 |
| mount | Mount FS | Attach filesystem | mount /dev/sda1 /mnt |
| umount | Unmount FS | Detach filesystem | umount /mnt |
| fstab | Edit mount table | Persistent mounts | vi /etc/fstab |
| fsck | Check FS | Repair errors | fsck /dev/sda1 |
| tune2fs | Tune ext FS | Adjust parameters | tune2fs -l /dev/sda1 |
| xfs_admin | Tune XFS FS | Adjust parameters | xfs_admin -l /dev/sda1 |
| autofs | Auto mounter | Dynamic mounts | systemctl start autofs |
| resize2fs | Resize ext FS | Adjust size | resize2fs /dev/vg/lv |
| xfs_growfs | Grow XFS FS | Increase size | xfs_growfs /mnt |

### 9. Network Configuration (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nmcli | NetworkManager CLI | Manage networks | nmcli con add type ethernet |
| nmtui | NetworkManager TUI | GUI-like config | nmtui |
| ip | IP configuration | View/set addresses | ip addr show |
| ifcfg | Edit interface file | Static config | vi /etc/sysconfig/network-scripts/ifcfg-eth0 |
| hostnamectl | Set hostname | Change hostname | hostnamectl set-hostname host |
| /etc/hosts | Edit hosts file | Local resolution | vi /etc/hosts |
| /etc/resolv.conf | Edit resolver | DNS settings | vi /etc/resolv.conf |
| ss | Socket statistics | View connections | ss -tuln |
| ping | Test connectivity | ICMP echo | ping host |
| traceroute | Trace route | Path to host | traceroute host |

### 10. Service Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| systemctl | Control systemd | Manage services | systemctl start service |
| service | Legacy service control | Start/stop | service service start |
| chkconfig | Legacy boot config | Enable/disable | chkconfig service on |
| journalctl | View journals | System logs | journalctl -u service |
| systemd-analyze | Analyze boot | Performance | systemd-analyze |
| timedatectl | Time/date control | Set NTP | timedatectl set-ntp true |
| cron | Schedule tasks | Job scheduler | crontab -e |
| at | One-time tasks | Schedule once | at now +1 hour |
| firewall-cmd | Firewall management | Rules config | firewall-cmd --add-service=http |
| firewalld | Firewall daemon | Service control | systemctl start firewalld |

### 11. Boot Process and Troubleshooting (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| grub2-mkconfig | Generate GRUB config | Update bootloader | grub2-mkconfig -o /boot/grub2/grub.cfg |
| grub2-install | Install GRUB | Bootloader setup | grub2-install /dev/sda |
| systemd.target | Change target | Boot mode | systemctl isolate multi-user.target |
| rescue mode | Boot to rescue | Troubleshooting | Boot with rd.break |
| emergency mode | Boot to emergency | Minimal shell | Boot with emergency |
| dracut | Generate initramfs | Update initrd | dracut -f |
| mkinitrd | Legacy initrd | Update initrd | mkinitrd |
| bootctl | UEFI boot manager | EFI config | bootctl status |

### 12. Process Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ps | Process status | View processes | ps aux |
| top | Interactive monitor | Real-time view | top |
| htop | Enhanced monitor | Interactive | htop |
| kill | Send signal | Terminate process | kill -9 PID |
| pkill | Kill by name | Terminate by name | pkill processname |
| nice | Set priority | Run with priority | nice -n 10 command |
| renice | Change priority | Adjust running | renice 5 -p PID |
| pgrep | Search processes | Find PID | pgrep process |
| free | Memory usage | View RAM/swap | free -h |
| uptime | System uptime | Load average | uptime |

### 13. Logging and Journaling (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| journalctl | Query journal | View logs | journalctl -b |
| logger | Log message | Send to syslog | logger message |
| rsyslogd | Syslog daemon | Config logs | vi /etc/rsyslog.conf |
| logrotate | Rotate logs | Manage size | vi /etc/logrotate.conf |
| systemd-journald | Journal daemon | Config journal | vi /etc/systemd/journald.conf |
| journalctl -p | Filter priority | Error logs | journalctl -p err |
| journalctl -f | Follow logs | Real-time | journalctl -f |
| dmesg | Kernel messages | Boot logs | dmesg | grep error |

### 14. Software Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| dnf | Package manager | Install/update | dnf install package |
| yum | Legacy manager | Install/update | yum update |
| rpm | RPM package tool | Query/install | rpm -ivh package.rpm |
| dnf repo | Manage repos | Add repo | dnf config-manager --add-repo url |
| dnf group | Group install | Install groups | dnf groupinstall group |
| dnf history | Transaction history | View/undo | dnf history |
| rpm -q | Query package | Info | rpm -q package |
| rpm -V | Verify package | Check files | rpm -V package |
| subscription-manager | Subscription | Register system | subscription-manager register |
| module | Module management | Install modules | dnf module install module |

### 15. Security - Firewall (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| firewall-cmd --list-all | List config | View settings | firewall-cmd --list-all |
| firewall-cmd --add-port | Add port | Open port | firewall-cmd --add-port=80/tcp |
| firewall-cmd --remove-port | Remove port | Close port | firewall-cmd --remove-port=80/tcp |
| firewall-cmd --add-service | Add service | Open service | firewall-cmd --add-service=http |
| firewall-cmd --zone | Manage zones | Zone config | firewall-cmd --zone=public |
| firewall-cmd --permanent | Permanent change | Persist rules | firewall-cmd --permanent --add-port=22/tcp |
| firewall-cmd --reload | Reload config | Apply changes | firewall-cmd --reload |
| firewall-cmd --panic-on | Panic mode | Drop all | firewall-cmd --panic-on |

### 16. Security - SELinux (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| getenforce | Get mode | View status | getenforce |
| setenforce | Set mode | Temp change | setenforce 0 |
| sestatus | SELinux status | Detailed info | sestatus |
| semanage | Manage policy | Config | semanage port -a -t http_port_t -p tcp 8080 |
| semodule | Manage modules | Install module | semodule -i module |
| ausearch | Audit search | Log query | ausearch -m avc |
| sealert | Alert analysis | Troubleshoot | sealert -l id |
| ls -Z | List context | View labels | ls -Z file |
| ps -Z | Process context | View labels | ps -Z |
| semanage fcontext | File context | Set patterns | semanage fcontext -a -t type /path |

### 17. Container Management with Podman (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman search | Search images | Find containers | podman search nginx |
| podman pull | Pull image | Download | podman pull registry/image |
| podman images | List images | View local | podman images |
| podman inspect | Inspect image/container | Details | podman inspect image |
| podman run | Run container | Start new | podman run -d image |
| podman ps | List containers | View running | podman ps -a |
| podman stop | Stop container | Halt | podman stop id |
| podman rm | Remove container | Delete | podman rm id |
| podman build | Build from Containerfile | Create image | podman build -t name . |
| podman exec | Exec in container | Run command | podman exec -it id bash |
| podman volume | Manage volumes | Persistent storage | podman volume create vol |
| podman login | Login to registry | Authenticate | podman login registry |

## Tips and Best Practices
* Always use man or info for command details before execution.
* Backup /etc/fstab before editing to avoid boot issues.
* Use sudo judiciously and prefer least privilege.
* Test SELinux changes in permissive mode first.
* Verify LVM operations with pvdisplay/vgdisplay/lvdisplay.
* Schedule regular cron jobs for log rotation and backups.
* Use journalctl for troubleshooting over traditional logs.
* Configure firewall rules with --permanent for persistence.
* Use UUID in fstab for reliable mounts.
* Monitor processes with top/htop to identify resource hogs.
* Secure SSH with key-based auth and disable root login.
* Update packages regularly with dnf update for security.
* Use podman over docker for rootless containers in RHEL.
* Test boot changes in a VM before production.
* Use find with -exec for batch operations on files.
* Set umask in profile for default permissions.
* Use tee for output to screen and file simultaneously.
* Configure NTP with timedatectl for accurate time.
* Use setfacl for fine-grained permissions beyond ugo.
* Preserve journals with journalctl --vacuum-time for space.

## Additional Resources
* [Official RHCSA Exam Objectives](https://www.redhat.com/en/services/training/ex200-red-hat-certified-system-administrator-rhcsa-exam?section=objectives)
* [Red Hat Documentation - RHEL 9](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9)
* [CertDepot RHCSA Guide](https://www.certdepot.net/rhel9-rhcsa-exam-objectives/)
* [Linux Journey RHCSA Prep](https://linuxjourney.com/lesson/rhcsa-overview)
* [Red Hat Training Courses](https://www.redhat.com/en/services/training-and-certification)
* [Podman Documentation](https://docs.podman.io/en/latest/)
* [SELinux User's Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/index)
* [FirewallD Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/securing_networks/using-and-configuring-firewalld_securing-networks)
* [LVM Administrator's Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_and_managing_logical_volumes/index)
* [RHEL Networking Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/index)

## Mini-Glossary

### 1. General Linux Terms
| Term/Concept | Description |
| --- | --- |
| Kernel | Core OS component managing hardware |
| Shell | Command interpreter for user input |
| Filesystem | Structure for storing data |
| Process | Running program instance |
| Daemon | Background service process |
| PID | Process ID number |
| Bootloader | Program loading the OS |
| Runlevel | Legacy system state (now targets) |
| Target | Systemd boot mode |
| Module | Loadable kernel code |
| Initramfs | Initial RAM filesystem for boot |
| UUID | Unique device identifier |
| Label | Human-readable device name |
| Redirection | Changing command I/O streams |
| Pipe | Connecting command outputs |

### 2. Storage Terms
| Term/Concept | Description |
| --- | --- |
| Partition | Divided section of disk |
| MBR | Master Boot Record partitioning |
| GPT | GUID Partition Table |
| PV | Physical volume in LVM |
| VG | Volume group in LVM |
| LV | Logical volume in LVM |
| Extent | LVM allocation unit |
| Swap | Virtual memory on disk |
| RAID | Redundant array of disks |
| LUKS | Linux Unified Key Setup encryption |
| Block device | Raw storage device like /dev/sda |
| Mount point | Directory for attached FS |
| Inode | File metadata structure |
| Journaling | FS recovery mechanism |
| Quota | Disk usage limits per user |

### 3. Network Terms
| Term/Concept | Description |
| --- | --- |
| IP address | Network layer address |
| Subnet mask | Network division indicator |
| Gateway | Route to other networks |
| DNS | Domain Name System resolution |
| Interface | Network adapter like eth0 |
| Port | Transport layer endpoint |
| Socket | IP:port combination |
| Firewall | Packet filtering system |
| Zone | Firewalld context group |
| Service | Predefined port set in firewall |
| DHCP | Dynamic host config protocol |
| Static IP | Manually assigned address |
| Bonding | Interface aggregation |
| VLAN | Virtual local area network |
| TCP | Reliable transport protocol |

### 4. User and Group Terms
| Term/Concept | Description |
| --- | --- |
| UID | User ID number |
| GID | Group ID number |
| Superuser | Root user with UID 0 |
| Sudoers | File for sudo privileges |
| PAM | Pluggable authentication modules |
| Shadow | Encrypted password file |
| Home directory | User's personal folder |
| Skeleton | Default files for new users |
| Primary group | Default group for user |
| Supplementary group | Additional group memberships |
| Password aging | Expiry and warning policies |
| LDAP | Directory service for auth |
| SSSD | System Security Services Daemon |
| Wheel group | Common sudo group |
| /etc/passwd | User account database |

### 5. Security Terms
| Term/Concept | Description |
| --- | --- |
| SELinux | Mandatory access control system |
| Context | SELinux label for objects |
| Boolean | SELinux toggle switch |
| Policy | SELinux rule set |
| AVC | Access Vector Cache denial |
| FirewallD | Dynamic firewall daemon |
| NFTables | Kernel packet filtering |
| SSHD | Secure shell daemon |
| Key pair | Public/private auth keys |
| Umask | Default permission mask |
| SUID | Set user ID bit |
| SGID | Set group ID bit |
| Sticky bit | Directory delete protection |
| ACL | Access control list |
| Audit | Kernel logging system |

### 6. Process and Service Terms
| Term/Concept | Description |
| --- | --- |
| Systemd | Init system and manager |
| Unit | Systemd resource like service |
| Socket activation | On-demand service start |
| Cgroup | Control group for resources |
| Priority | Nice value for scheduling |
| Load average | System busyness metric |
| Zombie process | Defunct child process |
| Orphan process | Parentless process |
| Signal | Inter-process communication |
| SIGTERM | Graceful termination signal |
| SIGKILL | Force kill signal |
| Journal | Systemd log storage |
| Timer | Systemd scheduled task |
| Mask | Disable unit start |
| Enable | Auto-start unit |

### 7. Boot and Troubleshooting Terms
| Term/Concept | Description |
| --- | --- |
| GRUB2 | Grand Unified Bootloader v2 |
| EFI | Extensible Firmware Interface |
| Initrd | Initial RAM disk |
| Rd.break | Boot interrupt parameter |
| Rescue target | Single-user mode |
| Emergency target | Root shell mode |
| Kernel panic | Unrecoverable error |
| FIPS | Federal Information Processing Standard |
| Quiet | Suppress boot messages |
| Rhgb | Red Hat Graphical Boot |
| Vmlinuz | Compressed kernel image |
| Sysrq | Magic system request key |
| Dracut | Initramfs generator tool |
| Boot menu | GRUB selection screen |
| Recovery mode | Fix broken system |

### 8. Container Terms
| Term/Concept | Description |
| --- | --- |
| Podman | Daemonless container tool |
| Container | Isolated user-space instance |
| Image | Read-only template for containers |
| Registry | Image storage repository |
| Containerfile | Build script for images |
| Volume | Persistent storage for containers |
| Rootless | Non-privileged containers |
| OCI | Open Container Initiative standard |
| Skopeo | Image inspection tool |
| Buildah | Image building tool |
| Namespace | Isolation mechanism |
| Cgroup | Resource limiting for containers |
| Commit | Create image from container |
| Exec | Run command in running container |
| Port mapping | Expose container ports |

### 9. Software Management Terms
| Term/Concept | Description |
| --- | --- |
| DNF | Dandified YUM package manager |
| RPM | Red Hat Package Manager format |
| Repository | Package source location |
| GPG | Signature for package verification |
| Module | Versioned package stream |
| Group | Collection of packages |
| Transaction | Package install/update set |
| Dependency | Required package for another |
| Subscription | Red Hat content access |
| Satellite | On-prem content server |
| AppStream | Application stream repo |
| BaseOS | Core OS repo |
| Kickstart | Automated install script |
| Errata | Security/update advisory |
| Cache | Local package download store |

### 10. Logging Terms
| Term/Concept | Description |
| --- | --- |
| Rsyslog | Rocket-fast syslog daemon |
| Logrotate | Automatic log compression/rotation |
| Priority | Log severity level |
| Facility | Log category like auth |
| Auditd | User-space auditing |
| Dmesg | Kernel ring buffer |
| Boot log | System startup messages |
| Persistent journal | On-disk journal storage |
| Vacuum | Clean old journal entries |
| Follow | Real-time log tailing |
| Query | Search log entries |
| Rotate | Cycle log files |
| Compress | Gzip old logs |
| Mail | Send logs to email |
| Remote logging | Send logs to server |

