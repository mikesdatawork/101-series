# 101 Podman Commands

## Overview
Podman is a daemonless container engine for developing, managing, and running OCI containers and pods on Linux systems. This cheat sheet covers essential Podman commands for image management, container lifecycle, pods, volumes, networking, building images, rootless/rootful operations, systemd integration, and related tools like Buildah and Skopeo. Master these for secure, efficient container workflows in RHEL and Fedora environments.

## Target Audience
- System administrators managing containers
- Developers building and testing apps
- DevOps engineers deploying services
- Security professionals preferring rootless
- Anyone migrating from Docker

### 1. Setup and Basic Commands (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman --version | Show version | Check install | podman --version |
| podman info | System info | Debug config | podman info |
| podman help | Command help | Usage details | podman run --help |
| podman system prune | Clean unused | Free space | podman system prune -a |
| podman system df | Disk usage | View storage | podman system df |
| podman stats | Resource usage | Monitor live | podman stats |
| podman events | Event stream | Monitor changes | podman events |
| podman search | Search registry | Find images | podman search nginx |
| podman login | Authenticate | Registry access | podman login quay.io |
| podman logout | Remove creds | Cleanup | podman logout quay.io |

### 2. Image Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman pull | Download image | Get from registry | podman pull nginx |
| podman images | List images | View local | podman images -a |
| podman rmi | Remove image | Cleanup | podman rmi nginx |
| podman tag | Tag image | Versioning | podman tag old new:tag |
| podman push | Upload image | To registry | podman push myimage |
| podman inspect | Image details | Metadata | podman inspect nginx |
| podman history | Layer history | Image layers | podman history nginx |
| podman save | Export to tar | Backup | podman save -o file.tar image |
| podman load | Import from tar | Restore | podman load -i file.tar |
| podman image prune | Remove dangling | Cleanup | podman image prune |
| podman diff | Changes | Since build | podman diff container |
| podman commit | Create from container | Snapshot | podman commit cont newimage |

### 3. Container Basics (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman run | Run container | Start new | podman run -d nginx |
| podman create | Create container | Without start | podman create nginx |
| podman start | Start stopped | Resume | podman start cont |
| podman stop | Stop running | Graceful | podman stop cont |
| podman restart | Restart | Reload | podman restart cont |
| podman rm | Remove container | Cleanup | podman rm cont |
| podman ps | List containers | View status | podman ps -a |
| podman attach | Attach to running | Console | podman attach cont |
| podman exec | Run in container | Command | podman exec -it cont bash |
| podman kill | Force stop | Signal | podman kill cont |
| podman pause | Pause processes | Suspend | podman pause cont |
| podman unpause | Resume | Continue | podman unpause cont |

### 4. Interactive and Logging (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman run -it | Interactive shell | Debug | podman run -it ubi8 bash |
| podman logs | View logs | Output | podman logs -f cont |
| podman top | Process list | Inside cont | podman top cont |
| podman port | Port mappings | Exposed | podman port cont |
| podman inspect | Container details | Config | podman inspect cont |
| podman diff | Filesystem changes | Modifications | podman diff cont |
| podman cp | Copy files | Host/cont | podman cp hostfile cont:/path |
| podman export | Export filesystem | Tar backup | podman export cont > file.tar |
| podman events | Live events | Journal | podman events --filter type=container |
| podman wait | Wait for exit | Block | podman wait cont |

### 5. Volumes and Persistent Storage (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman volume create | Create volume | Persistent | podman volume create myvol |
| podman volume ls | List volumes | View | podman volume ls |
| podman volume rm | Remove volume | Cleanup | podman volume rm myvol |
| podman volume inspect | Details | Config | podman volume inspect myvol |
| podman volume prune | Unused volumes | Cleanup | podman volume prune |
| podman run -v | Mount volume | Data | podman run -v myvol:/data image |
| podman run --mount | Advanced mount | Type bind | podman run --mount type=bind,src=/host,dst=/cont |
| podman volume mount | Mount to host | Access | podman volume mount myvol |
| podman volume unmount | Unmount | Release | podman volume unmount myvol |
| podman volume export | Backup volume | Tar | podman volume export myvol > vol.tar |

### 6. Networking (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman network create | Create network | Custom | podman network create mynet |
| podman network ls | List networks | View | podman network ls |
| podman network rm | Remove network | Cleanup | podman network rm mynet |
| podman network inspect | Details | Config | podman network inspect bridge |
| podman run -p | Publish port | Expose | podman run -p 8080:80 nginx |
| podman run --network | Attach network | Connect | podman run --network mynet image |
| podman network connect | Add to network | Multi-net | podman network connect mynet cont |
| podman network disconnect | Remove | Detach | podman network disconnect mynet cont |
| podman run --dns | Custom DNS | Resolution | podman run --dns 8.8.8.8 image |
| podman run --hostname | Set hostname | Identity | podman run --hostname myhost image |

### 7. Pods Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman pod create | Create pod | Group | podman pod create mypod |
| podman pod ls | List pods | View | podman pod ls -a |
| podman pod rm | Remove pod | Cleanup | podman pod rm -f mypod |
| podman pod start | Start pod | Resume | podman pod start mypod |
| podman pod stop | Stop pod | Graceful | podman pod stop mypod |
| podman pod inspect | Details | Config | podman pod inspect mypod |
| podman pod stats | Resource stats | Monitor | podman pod stats mypod |
| podman pod pause | Pause pod | Suspend | podman pod pause mypod |
| podman pod unpause | Resume | Continue | podman pod unpause mypod |
| podman run --pod | Add to pod | Join | podman run --pod mypod image |

### 8. Building Images (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman build | Build from Containerfile | Create | podman build -t myapp . |
| podman build --tag | Tag during build | Version | podman build -t myapp:1.0 . |
| podman build --file | Custom file | Specify | podman build -f alt.Containerfile . |
| podman build --no-cache | Fresh build | Rebuild | podman build --no-cache . |
| podman build --layers | Cache layers | Default | podman build --layers . |
| podman build --pull | Always pull | Latest base | podman build --pull . |
| podman build --squash | Single layer | Reduce | podman build --squash . |
| podman build --platform | Multi-arch | Cross | podman build --platform linux/arm64 . |
| podman build --manifest | Manifest list | Multi | podman build --manifest mylist . |
| podman build --secret | Build secrets | Secure | podman build --secret id=pass,src=pass.txt . |

### 9. Rootless vs Rootful (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman run (user) | Rootless default | Secure | podman run nginx |
| sudo podman run | Rootful | Privileged | sudo podman run -p 80:80 nginx |
| podman unshare | User namespaces | Host ops | podman unshare chown ... |
| podman machine set --rootful | VM rootful | Mac/Windows | podman machine set --rootful true |
| subuid/subgid | User mappings | Config | /etc/subuid |
| podman system migrate | Migrate storage | Switch | podman system migrate |
| podman --root | Custom storage | Rootful path | podman --root /var/lib/containers |
| podman --runroot | Runtime dir | Temp | podman --runroot /tmp/run |

### 10. Systemd Integration (Quadlets) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman generate systemd | Generate unit | Legacy | podman generate systemd cont |
| .container file | Quadlet container | Declarative | myapp.container |
| .pod file | Quadlet pod | Group | mypod.pod |
| .volume file | Quadlet volume | Persistent | myvol.volume |
| .network file | Quadlet network | Custom | mynet.network |
| .kube file | Kube YAML | Pods | deploy.kube |
| podman auto-update | Auto update | Rollout | podman auto-update |
| podman play kube | Run YAML | Deploy | podman play kube yaml |
| systemctl --user | User services | Rootless | systemctl --user status cont |
| podman generate kube | Export YAML | Migrate | podman generate kube cont |

### 11. Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman secret create | Create secret | Secure | podman secret create dbpass file |
| podman secret ls | List secrets | View | podman secret ls |
| podman secret rm | Remove secret | Cleanup | podman secret rm dbpass |
| podman run --secret | Mount secret | Use | podman run --secret dbpass,type=mount |
| podman healthcheck run | Check health | Status | podman healthcheck run cont |
| podman run --health-cmd | Define check | Custom | podman run --health-cmd "curl ..." |
| podman farm build | Distributed build | Multi-host | podman farm build |
| podman machine init | Init VM | Mac/Windows | podman machine init |
| podman machine start | Start VM | Run | podman machine start |
| podman manifest create | Multi-arch | List | podman manifest create mylist |

### 12. Buildah Integration (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| buildah from | Working container | Start build | buildah from ubi8 |
| buildah run | Run command | Layers | buildah run cont -- yum install ... |
| buildah copy | Add files | Content | buildah copy cont file /path |
| buildah config | Set metadata | ENV/CMD | buildah config --env KEY=val cont |
| buildah commit | Save image | Finalize | buildah commit cont newimage |
| buildah images | List | View | buildah images |
| buildah rmi | Remove | Cleanup | buildah rmi image |
| buildah bud | Build using Containerfile | Docker-like | buildah bud -t image . |
| buildah mount | Mount filesystem | Edit | buildah mount cont |
| buildah umount | Unmount | Release | buildah umount cont |

### 13. Skopeo Operations (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| skopeo copy | Copy image | Transfer | skopeo copy docker://src dir:/dest |
| skopeo inspect | Remote inspect | Metadata | skopeo inspect docker://nginx |
| skopeo login | Registry auth | Access | skopeo login quay.io |
| skopeo logout | Remove auth | Cleanup | skopeo logout quay.io |
| skopeo delete | Remove remote | Cleanup | skopeo delete docker://image:tag |
| skopeo sync | Sync registries | Mirror | skopeo sync --src docker src dest |
| skopeo list-tags | List tags | Available | skopeo list-tags docker://nginx |
| skopeo manifest-digest | Get digest | Verify | skopeo manifest-digest manifest.json |
| skopeo standalone-sign | Sign image | Security | skopeo standalone-sign manifest ... |
| skopeo standalone-verify | Verify signature | Check | skopeo standalone-verify manifest ... |

### 14. Security and Best Practices (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman run --userns=keep-id | User mapping | Rootless | podman run --userns=keep-id image |
| podman run --security-opt | SELinux opts | Labels | podman run --security-opt label=disable |
| podman run --cap-add/--cap-drop | Capabilities | Limit | podman run --cap-drop=ALL |
| podman run --privileged | Full priv | Careful | podman run --privileged image |
| podman run --read-only | Read-only FS | Secure | podman run --read-only image |
| podman run --tmpfs | Temp FS | No persist | podman run --tmpfs /tmp |
| podman run --user | Run as user | Non-root | podman run --user 1000:1000 image |
| podman run --annotation | Custom labels | Metadata | podman run --annotation key=val |

### 15. Troubleshooting (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman logs --tail | Last lines | Debug | podman logs --tail 50 cont |
| podman inspect --format | Custom output | Extract | podman inspect -f '{{.State.Pid}}' cont |
| podman events --filter | Filter events | Specific | podman events --filter event=die |
| podman system connections | List connections | Remote | podman system connections |
| podman system reset | Reset storage | Clean | podman system reset |
| podman info --debug | Detailed info | Troubleshoot | podman info --debug |
| journalctl -u podman | Systemd logs | Services | journalctl -u podman.socket |
| podman ps --filter | Filter list | Status | podman ps --filter status=exited |
| podman container inspect | Deep inspect | Config | podman container inspect cont |
| podman volume inspect | Volume details | Paths | podman volume inspect myvol |

### 16. Migration from Docker (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| alias docker=podman | Alias | Compatibility | alias docker=podman |
| podman run (docker equiv) | Most same | Direct | Same as docker run |
| podman-compose | Compose support | Stacks | podman-compose up |
| podman play kube | Kube YAML | Deploy | podman play kube deploy.yaml |
| podman volume import | From Docker | Migrate | podman volume import docker-vol podman-vol |
| podman machine | Mac/Windows | VM | podman machine init |
| podman socket | Docker API | Compat | podman system service -t 0 |
| DOCKER_HOST | Set for tools | Point | export DOCKER_HOST=unix:///run/podman/podman.sock |

### 17. Performance and Stats (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| podman stats --no-stream | Snapshot | Usage | podman stats --no-stream |
| podman top -l | Latest container | Processes | podman top -l |
| podman system df -v | Verbose disk | Detailed | podman system df -v |
| podman info --format | JSON output | Scripts | podman info --format '{{.Store.GraphRoot}}' |
| podman ps --size | With size | Storage | podman ps --size |
| podman images --digests | With digests | Verify | podman images --digests |
| podman volume ls --format | Custom format | Scripts | podman volume ls --format '{{.Name}}' |
| podman events --since | Since time | Filter | podman events --since 1h |

## Tips and Best Practices
* Prefer rootless mode for security and isolation.
* Use volumes for persistent data instead of bind mounts when possible.
* Leverage Quadlets (.container files) for declarative systemd management.
* Always specify image tags for reproducibility.
* Use podman auto-update with labels for automatic image updates.
* Clean up regularly with podman system prune.
* Use secrets for sensitive data instead of env vars.
* Enable lingering for user services in rootless mode.
* Use healthchecks for production containers.
* Build multi-arch images with --platform.
* Use podman play kube for simple pod deployments.
* Monitor with podman stats and journalctl.
* Use --rm for short-lived containers.
* Limit capabilities and use --read-only where possible.
* Backup volumes regularly.
* Use podman generate kube for migration to Kubernetes.
* Test builds with --no-cache occasionally.
* Use short names for containers and volumes.
* Pin versions in production.
* Review events journal for troubleshooting.

## Additional Resources
* [Official Podman Documentation](https://docs.podman.io/en/latest/)
* [Podman Cheat Sheet - Red Hat Developer](https://developers.redhat.com/cheat-sheets/podman-cheat-sheet)
* [Podman Tutorials](https://podman.io/docs/tutorials)
* [Buildah Documentation](https://buildah.io/)
* [Skopeo Documentation](https://github.com/containers/skopeo)
* [Quadlet Guide](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html)
* [Rootless Podman Tutorial](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md)
* [Podman Desktop](https://podman-desktop.io/)
* [Red Hat Container Tools](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/building_running_and_managing_containers/index)
* [Podman Blog](https://podman.io/blogs/)

## Mini-Glossary

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Podman | Daemonless OCI container engine |
| OCI | Open Container Initiative standard |
| Container | Isolated runtime instance |
| Image | Read-only template for containers |
| Pod | Group of containers sharing network |
| Volume | Persistent storage outside container |
| Network | Virtual network for containers |
| Rootless | Run without root privileges |
| Rootful | Run with root privileges |
| Quadlet | Declarative systemd files for Podman |

### 2. Storage Terms
| Term/Concept | Description |
| --- | --- |
| GraphRoot | Storage location for images |
| RunRoot | Runtime temporary files |
| Volume driver | Storage backend (overlay, vfs) |
| Bind mount | Host directory in container |
| Tmpfs | In-memory filesystem |
| SubUID/SubGID | User namespace mappings |
| Storage.conf | Configuration file |
| Prune | Remove unused objects |
| Export | Save to tar archive |
| Import | Load from archive |

### 3. Networking Terms
| Term/Concept | Description |
| --- | --- |
| Bridge | Default network |
| Slirp4netns | User-mode networking rootless |
| Pasta | Modern rootless networking |
| Port publish | Expose to host |
| DNS | Name resolution in container |
| Hostname | Container identity |
| Macvlan | Direct host network |
| IPvlan | Layer 3 networking |
| Internal | No external access |
| CNI | Container Network Interface |

### 4. Security Terms
| Term/Concept | Description |
| --- | --- |
| User namespaces | Isolate UIDs |
| SELinux | Mandatory access control |
| Capabilities | Fine-grained privileges |
| Seccomp | Syscall filtering |
| No-new-privileges | Prevent escalation |
| Read-only | Immutable filesystem |
| Drop capabilities | Limit privileges |
| Privileged | Full host access |
| Label | SELinux context |
| Keep-id | Map host user |

### 5. Systemd Terms
| Term/Concept | Description |
| --- | --- |
| Quadlet | .container/.pod files |
| User unit | Per-user systemd |
| Lingering | Persistent user session |
| Socket activation | On-demand start |
| Generator | Create units from quadlets |
| Auto-update | Pull and restart |
| Rollback | Revert on failure |
| Timer | Scheduled updates |
| Dependency | Order services |
| Restart policy | On failure |

### 6. Build Terms
| Term/Concept | Description |
| --- | --- |
| Containerfile | Build instructions |
| Buildah | Low-level build tool |
| Layer | Filesystem delta |
| Cache | Reuse layers |
| Multi-stage | Optimize size |
| Secret | Build-time secrets |
| Platform | Target architecture |
| Manifest list | Multi-arch image |
| Squash | Flatten layers |
| From scratch | Minimal base |

### 7. Registry Terms
| Term/Concept | Description |
| --- | --- |
| Registry | Image storage server |
| Repository | Group of images |
| Tag | Version identifier |
| Digest | Content hash |
| Push/Pull | Upload/download |
| Login | Authentication |
| Mirror | Local cache |
| Skopeo | Registry tool |
| Copy | Transfer images |
| Inspect | Remote metadata |

### 8. Advanced Terms
| Term/Concept | Description |
| --- | --- |
| Healthcheck | Container health |
| Secret | Sensitive data |
| Event | Container lifecycle |
| Farm | Distributed builds |
| Machine | VM for non-Linux |
| Socket | API compatibility |
| Compose | Stack management |
| Kube | Kubernetes YAML |
| Generate | Export config |
| Play | Import YAML |

### 9. Troubleshooting Terms
| Term/Concept | Description |
| --- | --- |
| Logs | Container output |
| Events | System journal |
| Inspect | JSON details |
| Top | Process view |
| Stats | Resource usage |
| Diff | Changes |
| Journalctl | Systemd logs |
| Debug | Verbose info |
| Migrate | Storage change |
| Reset | Clean state |

### 10. Migration Terms
| Term/Concept | Description |
| --- | --- |
| Alias | docker=podman |
| Socket | Docker API compat |
| Compose | podman-compose |
| Kube | podman play kube |
| Volume | Import/export |
| Machine | Mac/Windows VM |
| Rootful | Privileged ports |
| Rootless | Secure default |
| Daemonless | No background process |
| Fork-exec | Process model |

