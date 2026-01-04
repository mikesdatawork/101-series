# 101 RHCE Commands

## Overview
Red Hat Certified Engineer (RHCE) is an advanced certification that builds on RHCSA and focuses on automation with Ansible, advanced system administration, and complex infrastructure tasks on Red Hat Enterprise Linux. This cheat sheet covers essential Ansible commands, playbook writing, advanced networking, security, storage, containers, and performance tuning as per current RHCE exam objectives. Mastering these will help pass the EX294 exam and manage enterprise RHEL environments effectively.

## Target Audience
- System engineers preparing for RHCE certification
- DevOps engineers automating RHEL infrastructure
- Linux administrators handling complex deployments
- IT professionals managing enterprise Red Hat environments
- Anyone advancing to expert-level RHEL administration

### 1. Ansible Basics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible | Run ad-hoc commands | Execute on hosts | ansible all -m ping |
| ansible-playbook | Run playbooks | Execute YAML playbooks | ansible-playbook site.yml |
| ansible-inventory | Manage inventory | Show hosts | ansible-inventory --list |
| ansible-galaxy | Manage roles/collections | Install role | ansible-galaxy install user.role |
| ansible-config | View config | Show settings | ansible-config dump |
| ansible-vault | Encrypt secrets | Encrypt files | ansible-vault encrypt secrets.yml |
| ansible-pull | Pull-based execution | Git-based config | ansible-pull -U git_repo |
| ansible-doc | View module docs | Module reference | ansible-doc -l |
| ansible-console | Interactive shell | Run commands | ansible-console all |
| ansible-lint | Lint playbooks | Check syntax | ansible-lint playbook.yml |

### 2. Inventory Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible-inventory -i | Specify inventory | Custom file | ansible-inventory -i hosts |
| ansible-inventory --graph | Show groups | Visual tree | ansible-inventory --graph |
| ansible-inventory --list | JSON output | Script use | ansible-inventory --list |
| ansible-inventory --yaml | YAML output | Readable | ansible-inventory --yaml |
| ansible-inventory --host | Host vars | Show host | ansible-inventory --host web1 |
| ansible-inventory --vars | Show vars | Variables | ansible-inventory --list --vars |
| ansible-inventory --export | Export format | Conversion | ansible-inventory --export |
| ansible-inventory --playbook-dir | Set dir | Context | ansible-inventory --playbook-dir . |
| ansible-inventory --vault-id | Decrypt vault | Secure | ansible-inventory --vault-id vault_pass.txt |
| ansible-inventory --script | Script output | Dynamic | ansible-inventory --script |

### 3. Playbook Writing (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| hosts | Target hosts | Define targets | hosts: webservers |
| become | Elevate privileges | sudo | become: yes |
| tasks | Define tasks | List actions | tasks: - name: ... |
| roles | Include roles | Modular | roles: - common |
| vars | Define variables | Play vars | vars: - var: value |
| vars_files | Load var files | Secrets | vars_files: - secrets.yml |
| handlers | Define handlers | Notify | handlers: - name: restart |
| notify | Trigger handler | On change | notify: restart service |
| tags | Tag tasks | Selective run | tags: install |
| when | Conditional | Run if | when: ansible_os_family == "RedHat" |
| loop | Iterate | Loop over | loop: "{{ packages }}" |
| register | Capture output | Store result | register: result |

### 4. Ansible Modules - Core (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| yum/dnf | Package management | Install packages | dnf: name=httpd state=present |
| service | Manage services | Start/stop | service: name=httpd state=started |
| copy | Copy files | Deploy configs | copy: src=local dest=/remote |
| template | Render Jinja2 | Config templates | template: src=conf.j2 dest=/etc |
| file | Manage files | Permissions | file: path=/file mode=0644 |
| lineinfile | Edit lines | Config lines | lineinfile: path=/file line="key=value" |
| user | Manage users | Create users | user: name=john state=present |
| group | Manage groups | Create groups | group: name=admins state=present |
| cron | Manage cron jobs | Schedule | cron: name="backup" minute="0" |
| debug | Print variables | Troubleshooting | debug: var=my_var |
| command | Run commands | Raw exec | command: ls -l |
| shell | Run shell | With pipes | shell: ls -l | grep txt |

### 5. Ansible Collections & Roles (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible-galaxy init | Create role | New role | ansible-galaxy init myrole |
| ansible-galaxy install | Install collection | From Galaxy | ansible-galaxy collection install community.general |
| ansible-galaxy list | List installed | View | ansible-galaxy list |
| ansible-galaxy remove | Remove | Cleanup | ansible-galaxy remove user.role |
| ansible-galaxy info | Show info | Details | ansible-galaxy info user.role |
| roles_path | Set roles path | Config | roles_path = ./roles |
| collections_paths | Set collections path | Config | collections_paths = ./collections |
| ansible-galaxy collection build | Build collection | Package | ansible-galaxy collection build |
| ansible-galaxy collection publish | Publish | Galaxy | ansible-galaxy collection publish |
| ansible-galaxy collection install --force | Force install | Overwrite | ansible-galaxy collection install --force |

### 6. Advanced Networking (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| nmcli con add | Add connection | New interface | nmcli con add type ethernet ifname eth1 |
| nmcli con mod | Modify connection | Set IP | nmcli con mod eth1 ipv4.addresses 10.0.0.10/24 |
| nmcli con up | Activate connection | Bring up | nmcli con up eth1 |
| nmcli con show | Show connections | List | nmcli con show |
| nmcli device | Manage devices | Status | nmcli device status |
| ip addr | Show addresses | View | ip addr show eth1 |
| ip route | Manage routes | Static | ip route add 10.1.0.0/16 via 10.0.0.1 |
| ip link | Manage interfaces | Up/down | ip link set eth1 up |
| firewalld | Firewall rules | Add service | firewall-cmd --add-service=https --permanent |
| firewall-cmd --reload | Apply changes | Persist | firewall-cmd --reload |

### 7. Advanced Security (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| semodule -i | Install SELinux module | Custom policy | semodule -i mypol.pp |
| semanage port | Manage ports | Add port | semanage port -a -t http_port_t -p tcp 8080 |
| semanage fcontext | Manage file contexts | Add context | semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?" |
| restorecon | Restore contexts | Apply | restorecon -Rv /web |
| setsebool | Toggle booleans | Enable | setsebool -P httpd_enable_homedirs on |
| ausearch -m avc | Search denials | Troubleshoot | ausearch -m avc -ts recent |
| audit2allow | Generate policy | From log | audit2allow -M mypol -i log |
| firewall-cmd --zone | Manage zones | Set zone | firewall-cmd --zone=internal --add-interface=eth1 |
| firewall-cmd --add-rich-rule | Rich rules | Complex | firewall-cmd --add-rich-rule='rule family="ipv4" source address="10.0.0.0/24" service name="http" accept' |
| firewall-cmd --list-all-zones | List zones | View | firewall-cmd --list-all-zones |

### 8. Advanced Storage (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| lvcreate -T | Create thin pool | Thin provisioning | lvcreate -L 50G -T vg/thinpool |
| lvcreate --thinpool | Create thin pool | Alias | lvcreate --thinpool thinpool -L 50G vg |
| lvcreate -V | Create thin volume | Thin volume | lvcreate -V 100G --thinpool thinpool vg |
| lvs -o +thin_pool | Show thin info | Details | lvs -o +thin_pool |
| lvextend -L | Extend thin volume | Grow | lvextend -L +20G vg/thinvol |
| thin_check | Check thin pool | Integrity | thin_check /dev/mapper/vg-thinpool-tpool |
| thin_repair | Repair thin pool | Fix | thin_repair -i /dev/mapper/vg-thinpool-tpool |
| mkfs.xfs -m reflink=1 | Enable reflink | XFS reflink | mkfs.xfs -m reflink=1 /dev/vg/lv |
| xfs_growfs | Grow XFS | Online | xfs_growfs /mnt |
| cryptsetup luksFormat | Create LUKS | Encryption | cryptsetup luksFormat /dev/sdb1 |
| cryptsetup luksOpen | Open LUKS | Decrypt | cryptsetup luksOpen /dev/sdb1 encrypted |
| cryptsetup luksAddKey | Add key | Multiple keys | cryptsetup luksAddKey /dev/sdb1 |

### 9. Container Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman run | Run container | Start | podman run -d --name web nginx |
| podman ps -a | List all containers | View | podman ps -a |
| podman logs | View logs | Container logs | podman logs web |
| podman exec | Exec in container | Run command | podman exec -it web bash |
| podman build | Build image | From Containerfile | podman build -t myapp . |
| podman volume create | Create volume | Persistent | podman volume create data |
| podman network create | Create network | Custom | podman network create mynet |
| podman pod create | Create pod | Kubernetes-like | podman pod create --name mypod |
| podman play kube | Run pod YAML | Podman kube | podman play kube pod.yml |
| podman generate kube | Generate YAML | Export | podman generate kube web > pod.yml |

### 10. System Performance (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sar | System activity reporter | Historical | sar -u 1 5 |
| iostat | I/O statistics | Disk | iostat -x 1 |
| vmstat | Virtual memory stats | Memory | vmstat 1 |
| mpstat | CPU statistics | Per CPU | mpstat -P ALL 1 |
| pidstat | Process stats | Per process | pidstat -u 1 |
| perf | Performance analysis | Profiling | perf record -a -g sleep 10 |
| strace | Trace system calls | Debugging | strace -p PID |
| lsof | List open files | Open ports | lsof -i :80 |
| netstat | Network stats | Legacy | netstat -tuln |
| ss | Socket statistics | Modern | ss -tuln |

### 11. Ansible Tower / Automation Platform (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| awx | AWX CLI | Manage AWX | awx --help |
| awx login | Login to AWX | Auth | awx login -u admin |
| awx job-templates | Manage templates | List | awx job-templates list |
| awx credentials | Manage credentials | List | awx credentials list |
| awx inventories | Manage inventories | List | awx inventories list |
| awx projects | Manage projects | List | awx projects list |
| awx workflow-templates | Manage workflows | List | awx workflow-templates list |
| awx launch | Launch job | Run | awx job-templates launch 123 |

### 12. Troubleshooting Ansible (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible-playbook --check | Dry run | Check mode | ansible-playbook --check site.yml |
| ansible-playbook --diff | Show diff | Changes | ansible-playbook --diff site.yml |
| ansible-playbook -vvv | Verbose | Debug | ansible-playbook -vvv site.yml |
| ansible-playbook --limit | Limit hosts | Subset | ansible-playbook --limit web1 site.yml |
| ansible-playbook --step | Step mode | Interactive | ansible-playbook --step site.yml |
| ansible-playbook --start-at-task | Start at task | Resume | ansible-playbook --start-at-task="task name" |
| ansible-playbook --tags | Run tags | Selective | ansible-playbook --tags install site.yml |
| ansible-playbook --skip-tags | Skip tags | Exclude | ansible-playbook --skip-tags install site.yml |

### 13. Ansible Best Practices (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible.cfg | Config file | Settings | [defaults] inventory = ./hosts |
| requirements.yml | Collection requirements | Install | ansible-galaxy install -r requirements.yml |
| galaxy.yml | Collection metadata | Build | galaxy.yml for collection |
| meta/main.yml | Role metadata | Dependencies | dependencies: - role: common |
| handlers/main.yml | Handlers | Service restart | handlers/main.yml |
| tasks/main.yml | Main tasks | Role tasks | tasks/main.yml |
| vars/main.yml | Default vars | Role vars | vars/main.yml |
| defaults/main.yml | Default vars | Role defaults | defaults/main.yml |

### 14. Ansible Vault (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible-vault create | Create encrypted | New file | ansible-vault create secrets.yml |
| ansible-vault view | View encrypted | Read | ansible-vault view secrets.yml |
| ansible-vault edit | Edit encrypted | Modify | ansible-vault edit secrets.yml |
| ansible-vault encrypt | Encrypt file | Protect | ansible-vault encrypt secrets.yml |
| ansible-vault decrypt | Decrypt file | Plain | ansible-vault decrypt secrets.yml |
| ansible-vault rekey | Change password | Update | ansible-vault rekey secrets.yml |
| ansible-vault encrypt_string | Encrypt string | Inline | ansible-vault encrypt_string 'secret' --name 'password' |
| ansible-playbook --vault-id | Use vault | Run | ansible-playbook --vault-id @prompt site.yml |
| ansible-playbook --vault-password-file | Vault file | Automation | ansible-playbook --vault-password-file vault_pass.txt |
| ansible-vault --vault-id | Multiple vaults | Complex | ansible-vault --vault-id prod@prompt --vault-id dev@vault_pass.txt |

### 15. Ansible Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ansible-playbook --forks | Parallel forks | Speed | ansible-playbook --forks 50 |
| ansible-playbook --strategy | Execution strategy | Free | ansible-playbook --strategy free |
| ansible-playbook --serial | Batch execution | Rolling | ansible-playbook --serial 2 |
| ansible-playbook --step | Interactive step | Debugging | ansible-playbook --step |
| ansible-playbook --start-at-task | Resume | Recovery | ansible-playbook --start-at-task="task" |
| ansible-playbook --tags | Run tags | Selective | ansible-playbook --tags config |
| ansible-playbook --skip-tags | Skip tags | Exclude | ansible-playbook --skip-tags config |
| ansible-playbook --limit | Limit hosts | Subset | ansible-playbook --limit group1 |
| ansible-playbook --check | Check mode | Test | ansible-playbook --check |
| ansible-playbook --diff | Show diff | Changes | ansible-playbook --diff |

### 16. Ansible Collections (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| community.general | General collection | Modules | community.general.ipmi_power |
| ansible.posix | POSIX collection | Modules | ansible.posix.acl |
| redhat.rhel_system_roles | RHEL roles | Standard | redhat.rhel_system_roles.timesync |
| ansible.builtin | Built-in | Core | ansible.builtin.copy |
| ansible.netcommon | Network common | Network | ansible.netcommon.cli_config |
| community.crypto | Crypto | Certificates | community.crypto.openssl_certificate |
| community.docker | Docker | Containers | community.docker.docker_container |
| community.mysql | MySQL | Database | community.mysql.mysql_user |

### 17. Ansible Automation Platform / AWX (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| awx job-templates list | List templates | View | awx job-templates list |
| awx job-templates launch | Launch job | Run | awx job-templates launch 123 |
| awx inventories list | List inventories | View | awx inventories list |
| awx projects list | List projects | View | awx projects list |
| awx credentials list | List credentials | View | awx credentials list |
| awx workflow-templates list | List workflows | View | awx workflow-templates list |
| awx organizations list | List orgs | View | awx organizations list |
| awx teams list | List teams | View | awx teams list |

## Tips and Best Practices
* Always use roles for reusable, modular playbooks.
* Store secrets in ansible-vault and use --vault-id or --vault-password-file.
* Use collections instead of standalone roles for modern Ansible.
* Test playbooks with --check and --diff before production.
* Limit parallel execution with --forks for large environments.
* Use tags for selective playbook runs.
* Prefer community.general and redhat.rhel_system_roles for common tasks.
* Document roles with meta/main.yml and README.md.
* Use ansible-lint to enforce best practices.
* Version control your playbooks and roles with git.
* Use ansible.cfg in project root for project-specific settings.
* Use inventory plugins for dynamic inventories (cloud, CMDB).
* Test in staging environments before production.
* Use --limit to target specific hosts during testing.
* Keep Ansible version up to date for new features and security.
* Use ansible-runner or AWX for production automation.
* Document vault passwords securely and rotate them regularly.
* Use idempotent tasks and handlers for reliable runs.
* Monitor job output in AWX/Tower for troubleshooting.
* Use ansible-console for quick ad-hoc debugging.

## Additional Resources
* [Official RHCE Exam Objectives](https://www.redhat.com/en/services/training/ex294-red-hat-certified-engineer-rhce-exam?section=objectives)
* [Red Hat Documentation - Ansible](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform)
* [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
* [Red Hat RHEL System Roles](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_ansible_to_install_and_configure_rhel_system_roles)
* [Ansible Galaxy](https://galaxy.ansible.com/)
* [AWX / Ansible Automation Platform Docs](https://www.ansible.com/products/automation-platform)
* [Podman Documentation](https://podman.io/docs/)
* [SELinux and Firewalld Guides](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/index)
* [LVM and Storage Management](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_and_managing_logical_volumes/index)
* [Red Hat Training Courses](https://www.redhat.com/en/services/training-and-certification)

## Mini-Glossary

### 1. Ansible Terms
| Term/Concept | Description |
| --- | --- |
| Playbook | YAML file defining tasks |
| Play | Single execution unit |
| Task | Single action to perform |
| Module | Reusable code unit |
| Role | Reusable collection of tasks |
| Collection | Modern role package |
| Inventory | List of managed hosts |
| Group | Host grouping |
| Host vars | Per-host variables |
| Group vars | Per-group variables |
| Facts | Gathered system info |
| Handler | Task triggered on change |
| Tag | Label for selective run |

### 2. Ansible Core Components
| Term/Concept | Description |
| --- | --- |
| Control node | Machine running Ansible |
| Managed node | Target system |
| Ad-hoc command | One-off task |
| Vault | Encrypted secrets |
| Galaxy | Public role/collection repo |
| AWX | Open-source Tower |
| Tower | Enterprise automation platform |
| Runner | Execution engine |
| Strategy | Execution method (linear, free) |
| Fork | Parallel execution |
| Connection | SSH, local, winrm |
| Become | Privilege escalation |

### 3. Playbook Structure
| Term/Concept | Description |
| --- | --- |
| hosts | Target selection |
| become | sudo/root |
| gather_facts | Collect facts |
| vars | Play variables |
| tasks | Main tasks |
| handlers | Notification handlers |
| roles | Included roles |
| pre_tasks | Before roles |
| post_tasks | After roles |
| tags | Task labels |
| when | Conditional execution |
| loop | Iteration |

### 4. Inventory Types
| Term/Concept | Description |
| --- | --- |
| INI format | Simple key=value |
| YAML format | Structured inventory |
| Dynamic inventory | Script/plugin |
| Host file | Single host list |
| Group | Logical grouping |
| Children | Nested groups |
| Vars | Host/group variables |
| Plugin | Inventory source |
| Script | External source |
| Cache | Cached inventory |

### 5. Ansible Vault
| Term/Concept | Description |
| --- | --- |
| Vault | Encryption mechanism |
| Vault ID | Named vault |
| Vault password | Decryption key |
| Encrypt string | Inline secrets |
| Vault file | Encrypted YAML |
| Rekey | Change password |
| Decrypt | Plain text |
| Edit | Modify encrypted |
| Create | New encrypted file |
| View | Read encrypted |

### 6. Ansible Collections
| Term/Concept | Description |
| --- | --- |
| Collection | Package of roles/modules |
| Namespace | Collection owner |
| Galaxy | Public repository |
| requirements.yml | Dependency list |
| galaxy.yml | Collection metadata |
| Build | Package collection |
| Publish | Upload to Galaxy |
| Install | Download collection |
| Use | Include in playbooks |
| Community | Open-source collections |

### 7. Ansible Automation Platform
| Term/Concept | Description |
| --- | --- |
| AWX | Open-source base |
| Tower | Commercial version |
| Job template | Run configuration |
| Workflow | Sequence of jobs |
| Credential | Secret storage |
| Project | SCM repo |
| Inventory | Host list |
| Organization | Grouping unit |
| Team | User group |
| Role-based access | Permissions |

### 8. Advanced Ansible Features
| Term/Concept | Description |
| --- | --- |
| Lookups | Dynamic values |
| Filters | Data transformation |
| Plugins | Extend functionality |
| Strategy | Execution model |
| Callback | Output plugins |
| Fact caching | Persistent facts |
| Async | Long-running tasks |
| Delegate_to | Run on different host |
| Run_once | Single execution |
| Throttle | Limit concurrency |

### 9. Troubleshooting Terms
| Term/Concept | Description |
| --- | --- |
| Check mode | Dry-run |
| Diff | Show changes |
| Verbose | Debug output |
| Limit | Target subset |
| Step | Interactive mode |
| Tags | Selective run |
| Lint | Syntax check |
| Facts | Gathered info |
| Handler | Change-triggered |
| Notify | Trigger handler |

### 10. Performance Terms
| Term/Concept | Description |
| --- | --- |
| Forks | Parallel tasks |
| Serial | Batch execution |
| Strategy free | Run independently |
| Throttle | Limit concurrency |
| Async | Background tasks |
| Poll | Check status |
| Callback | Output formatting |
| Fact caching | Speed up |
| Connection | SSH vs local |
| Become | Privilege escalation |

