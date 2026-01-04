# 101 Kubernetes Commands

## Overview
Kubernetes is an open-source platform for automating deployment, scaling, and operations of containerized applications across clusters. This cheat sheet focuses on essential kubectl commands for managing clusters, namespaces, pods, deployments, services, Helm chart deployments, and troubleshooting—key skills for DevOps workflows and LPI DevOps Tools Engineer certification.

## Target Audience
- DevOps engineers managing container orchestration
- System administrators deploying applications
- Developers testing in Kubernetes
- Platform engineers building CI/CD
- Anyone preparing for LPI DevOps Tools Engineer

### 1. Setup and Configuration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl version | Check versions | Client/server | kubectl version --short |
| kubectl cluster-info | Cluster details | Endpoint info | kubectl cluster-info |
| kubectl config view | View kubeconfig | Current config | kubectl config view |
| kubectl config use-context | Switch context | Change cluster | kubectl config use-context my-cluster |
| kubectl config get-contexts | List contexts | Available | kubectl config get-contexts |
| kubectl config current-context | Current context | Active | kubectl config current-context |
| kubectl config set-credentials | Set user | Auth | kubectl config set-credentials user --token=... |
| kubectl api-resources | List resources | Available types | kubectl api-resources |

### 2. Namespaces Management (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl create namespace | Create namespace | Isolation | kubectl create namespace dev |
| kubectl get namespaces | List namespaces | View all | kubectl get ns |
| kubectl delete namespace | Delete namespace | Cleanup | kubectl delete ns old |
| kubectl config set-context --namespace | Default ns | Per context | kubectl config set-context --current --namespace=dev |
| kubectl get all --namespace | Resources in ns | View | kubectl get all -n prod |
| kubectl describe namespace | Details | Config | kubectl describe ns kube-system |
| kubectl get events --namespace | Events | Troubleshoot | kubectl get events -n app |
| kubectl api-resources --namespaced | Namespaced check | Scope | kubectl api-resources --namespaced=true |

### 3. Pods Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl run | Create pod | Imperative | kubectl run nginx --image=nginx |
| kubectl get pods | List pods | Status | kubectl get pods -o wide |
| kubectl describe pod | Details | Inspect | kubectl describe pod mypod |
| kubectl delete pod | Delete pod | Cleanup | kubectl delete pod mypod |
| kubectl logs | View logs | Output | kubectl logs mypod -f |
| kubectl exec | Run command | Interactive | kubectl exec -it mypod -- bash |
| kubectl port-forward | Forward port | Local access | kubectl port-forward mypod 8080:80 |
| kubectl top pod | Resource usage | Metrics | kubectl top pod |
| kubectl get pods --watch | Watch changes | Live | kubectl get pods -w |
| kubectl label pod | Add label | Selector | kubectl label pod mypod app=web |
| kubectl annotate pod | Add annotation | Metadata | kubectl annotate pod mypod note="temp" |
| kubectl cp | Copy files | To/from pod | kubectl cp mypod:/file ./local |

### 4. Deployments and ReplicaSets (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl create deployment | Create deployment | Imperative | kubectl create deployment nginx --image=nginx |
| kubectl get deployments | List | Status | kubectl get deploy |
| kubectl scale deployment | Scale replicas | Horizontal | kubectl scale deploy nginx --replicas=5 |
| kubectl rollout status | Watch rollout | Progress | kubectl rollout status deploy/nginx |
| kubectl rollout undo | Rollback | Previous | kubectl rollout undo deploy/nginx |
| kubectl rollout history | History | Versions | kubectl rollout history deploy/nginx |
| kubectl set image | Update image | Rolling update | kubectl set image deploy/nginx nginx=nginx:1.21 |
| kubectl edit deployment | Edit live | Config | kubectl edit deploy nginx |
| kubectl get rs | ReplicaSets | View | kubectl get rs |
| kubectl describe deployment | Details | Inspect | kubectl describe deploy nginx |
| kubectl autoscale deployment | HPA | Auto scale | kubectl autoscale deploy nginx --cpu-percent=50 --min=1 --max=10 |
| kubectl rollout pause/resume | Pause/resume | Control | kubectl rollout pause deploy/nginx |

### 5. Services and Networking (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl expose | Create service | Imperative | kubectl expose deploy nginx --port=80 --type=LoadBalancer |
| kubectl get services | List services | Endpoints | kubectl get svc |
| kubectl describe service | Details | Ports | kubectl describe svc nginx |
| kubectl get endpoints | Endpoints | Targets | kubectl get ep nginx |
| kubectl port-forward service | Forward | Local | kubectl port-forward svc/nginx 8080:80 |
| kubectl create service clusterip | ClusterIP | Internal | kubectl create svc clusterip my-svc --tcp=80:8080 |
| kubectl create service nodeport | NodePort | External | kubectl create svc nodeport my-svc --tcp=80:30000 |
| kubectl create service loadbalancer | LoadBalancer | Cloud | kubectl create svc loadbalancer my-svc |
| kubectl get ingress | Ingress | Routing | kubectl get ingress |
| kubectl create ingress | Ingress | Rules | kubectl create ingress my-ing --rule="host/path=svc:port" |

### 6. ConfigMaps and Secrets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl create configmap | Create ConfigMap | From literal | kubectl create cm my-cm --from-literal=key=value |
| kubectl create configmap --from-file | From file | Config | kubectl create cm app-cm --from-file=config.properties |
| kubectl get configmaps | List | View | kubectl get cm |
| kubectl describe configmap | Details | Data | kubectl describe cm my-cm |
| kubectl create secret generic | Generic secret | Literal | kubectl create secret generic db --from-literal=user=admin |
| kubectl create secret docker-registry | Registry | Auth | kubectl create secret docker-registry reg --docker-username=user |
| kubectl get secrets | List secrets | View | kubectl get secrets |
| kubectl describe secret | Details | Data | kubectl describe secret db |
| kubectl create secret tls | TLS secret | Certs | kubectl create secret tls tls-sec --cert=tls.crt --key=tls.key |
| kubectl decode secret | Decode | View value | kubectl get secret my-sec -o jsonpath='{.data.key}' | base64 -d |

### 7. Persistent Volumes and Storage (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl get pv | PersistentVolumes | List | kubectl get pv |
| kubectl get pvc | PersistentVolumeClaims | List | kubectl get pvc |
| kubectl describe pv | Details | Capacity | kubectl describe pv my-pv |
| kubectl create -f pv.yaml | Create PV | Manifest | kubectl apply -f pv.yaml |
| kubectl create -f pvc.yaml | Create PVC | Claim | kubectl apply -f pvc.yaml |
| kubectl get storageclass | StorageClasses | View | kubectl get sc |
| kubectl patch storageclass | Default | Set | kubectl patch sc standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}} |
| kubectl describe pvc | Bound volume | Inspect | kubectl describe pvc my-claim |

### 8. Helm Basics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| helm repo add | Add repository | Charts | helm repo add bitnami https://charts.bitnami.com/bitnami |
| helm repo update | Update repos | Latest | helm repo update |
| helm search repo | Search charts | Find | helm search repo nginx |
| helm install | Install chart | Deploy | helm install my-nginx bitnami/nginx |
| helm list | List releases | Active | helm list -A |
| helm status | Release status | Details | helm status my-nginx |
| helm upgrade | Upgrade release | Update | helm upgrade my-nginx bitnami/nginx --version 15.0.0 |
| helm rollback | Rollback | Previous | helm rollback my-nginx 1 |
| helm uninstall | Uninstall | Remove | helm uninstall my-nginx |
| helm history | Release history | Versions | helm history my-nginx |

### 9. Helm Advanced (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| helm install --values | Custom values | Override | helm install my-app ./chart -f values-prod.yaml |
| helm install --set | Set values | Inline | helm install my-app ./chart --set replicaCount=3 |
| helm get values | Current values | View | helm get values my-app |
| helm get manifest | Rendered manifests | YAML | helm get manifest my-app |
| helm template | Render locally | Dry-run | helm template my-app ./chart |
| helm dependency update | Update deps | Charts | helm dependency update ./chart |
| helm package | Package chart | .tgz | helm package ./chart |
| helm lint | Lint chart | Validate | helm lint ./chart |
| helm show chart | Chart info | Metadata | helm show chart bitnami/nginx |
| helm show values | Default values | View | helm show values bitnami/nginx |

### 10. Cluster Information (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl get nodes | List nodes | Status | kubectl get nodes -o wide |
| kubectl describe node | Node details | Resources | kubectl describe node worker1 |
| kubectl top nodes | Node metrics | Usage | kubectl top nodes |
| kubectl get componentstatuses | Components | Health | kubectl get cs |
| kubectl cluster-info dump | Dump state | Debug | kubectl cluster-info dump |
| kubectl get events | Events | Activity | kubectl get events --sort-by=.metadata.creationTimestamp |
| kubectl api-versions | API versions | Available | kubectl api-versions |
| kubectl explain | Resource docs | Help | kubectl explain pod |

### 11. Resource Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl apply -f | Apply manifest | Declarative | kubectl apply -f deploy.yaml |
| kubectl create -f | Create from file | Imperative | kubectl create -f pod.yaml |
| kubectl replace -f | Replace | Update | kubectl replace -f new.yaml |
| kubectl patch | Patch resource | Partial | kubectl patch deploy nginx -p '{"spec":{"replicas":3}}' |
| kubectl edit | Edit live | VI | kubectl edit deploy nginx |
| kubectl label | Add/remove label | Selector | kubectl label pods mypod env=prod |
| kubectl annotate | Add annotation | Metadata | kubectl annotate deploy nginx note="updated" |
| kubectl taint nodes | Taint node | Scheduling | kubectl taint nodes node1 key=value:NoSchedule |
| kubectl cordon/uncordon | Drain prep | Maintenance | kubectl cordon node1 |
| kubectl drain | Drain node | Evict pods | kubectl drain node1 --ignore-daemonsets |

### 12. Debugging and Troubleshooting (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl logs --previous | Previous container | Crashed | kubectl logs mypod --previous |
| kubectl describe | Describe resource | Events | kubectl describe pod mypod |
| kubectl get events | Cluster events | Issues | kubectl get events |
| kubectl exec -it -- sh | Shell access | Debug | kubectl exec -it mypod -- sh |
| kubectl port-forward | Local forward | Test | kubectl port-forward pod/mypod 8080:80 |
| kubectl debug | Debug pod | Ephemeral | kubectl debug pod/mypod -it --image=busybox |
| kubectl auth can-i | Permissions check | RBAC | kubectl auth can-i create pods |
| kubectl proxy | API proxy | Local | kubectl proxy |
| kubectl attach | Attach to running | Console | kubectl attach mypod -i |
| kubectl cp | Copy debug | Files | kubectl cp mypod:/log /local |
| kubectl wait | Wait condition | Scripts | kubectl wait --for=condition=Ready pod/mypod |
| kubectl diff -f | Show changes | Apply preview | kubectl diff -f new.yaml |

### 13. Imperative Commands (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl run --generator=run-pod/v1 | Simple pod | Quick | kubectl run temp --image=busybox --rm -it -- sh |
| kubectl create job | Job | One-off | kubectl create job pi --image=perl -- perl -Mbignum=bpi -wle 'print bpi(2000)' |
| kubectl create cronjob | CronJob | Scheduled | kubectl create cronjob hello --image=busybox --schedule="*/1 * * * *" -- echo "Hello" |
| kubectl expose deployment | Service | Quick | kubectl expose deploy nginx --port=80 |
| kubectl autoscale | HPA | Auto | kubectl autoscale deploy nginx --min=2 --max=10 |
| kubectl scale --replicas | Manual scale | Quick | kubectl scale --replicas=3 deploy/nginx |
| kubectl set env | Set env vars | Update | kubectl set env deploy/nginx VAR=value |
| kubectl rollout restart | Restart | Rolling | kubectl rollout restart deploy/nginx |
| kubectl create secret generic | Quick secret | Inline | kubectl create secret generic my-sec --from-literal=key=val |
| kubectl create configmap | Quick ConfigMap | Literal | kubectl create cm my-cm --from-literal=key=val |

### 14. Output Formatting (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl get -o yaml | YAML output | Manifest | kubectl get pod mypod -o yaml |
| kubectl get -o json | JSON output | Script | kubectl get nodes -o json |
| kubectl get -o name | Resource name | Piping | kubectl get pods -o name |
| kubectl get -o wide | Extra columns | Details | kubectl get pods -o wide |
| kubectl get -o jsonpath | Path extract | Custom | kubectl get pods -o jsonpath='{.items[*].metadata.name}' |
| kubectl get --sort-by | Sort output | Order | kubectl get pods --sort-by=.metadata.creationTimestamp |
| kubectl get --field-selector | Filter fields | Server-side | kubectl get pods --field-selector=status.phase=Running |
| kubectl get -l | Label selector | Filter | kubectl get pods -l app=nginx |

### 15. Contexts and Clusters (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl config get-clusters | List clusters | Available | kubectl config get-clusters |
| kubectl config set-cluster | Set cluster | Config | kubectl config set-cluster my-cluster --server=https://... |
| kubectl config set-context | Set context | Combine | kubectl config set-context prod --cluster=my-cluster --user=admin |
| kubectl config delete-context | Delete context | Cleanup | kubectl config delete-context old |
| kubectl config rename-context | Rename | Update | kubectl config rename-context old new |
| kubectl switch --context | Switch | Quick | No direct, use use-context |
| minikube start | Local cluster | Dev | minikube start |
| kind create cluster | Kind cluster | Testing | kind create cluster |

### 16. Advanced Helm (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| helm install --dry-run | Dry run | Test | helm install my-app ./chart --dry-run |
| helm upgrade --install | Install if missing | Idempotent | helm upgrade --install my-app ./chart |
| helm upgrade --atomic | Auto rollback | Safe | helm upgrade --atomic my-app ./chart |
| helm upgrade --wait | Wait ready | Sync | helm upgrade --wait my-app ./chart |
| helm diff upgrade | Show changes | Preview | helm diff upgrade my-app bitnami/nginx |
| helm plugin install | Install plugin | Extend | helm plugin install https://github.com/chartmuseum/helm-push |
| helm env | Environment | Debug | helm env |
| helm completion bash | Shell completion | Productivity | helm completion bash > /etc/bash_completion.d/helm |

### 17. Best Practices Commands (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| kubectl apply --prune | Prune unused | Cleanup | kubectl apply --prune -f manifests/ |
| kubectl diff | Preview changes | Safe apply | kubectl diff -f manifest.yaml |
| kubectl rollout restart | Rolling restart | Zero downtime | kubectl rollout restart deploy/app |
| helm upgrade --reuse-values | Keep old values | Incremental | helm upgrade my-app ./chart --reuse-values |
| kubectl wait --for=delete | Wait delete | Scripts | kubectl wait --for=delete pod/oldpod |
| kubectl patch --dry-run | Dry patch | Test | kubectl patch deploy nginx --dry-run=client -p ... |
| helm secrets | Encrypted values | Secure | With helm-secrets plugin |
| kubectl neat | Clean output | YAML cleanup | kubectl get pod mypod -o yaml | kubectl neat |

## Tips and Best Practices
* Prefer kubectl apply over create for declarative management.
* Use namespaces for isolation in shared clusters.
* Always specify --namespace or set default context.
* Use Helm for complex application deployments.
* Store manifests and Helm values in Git for reproducibility.
* Use labels and selectors effectively for organization.
* Enable RBAC and limit permissions.
* Use kubectl wait in scripts for reliable automation.
* Monitor with kubectl top and Prometheus.
* Use dry-run and diff for safe changes.
* Version Helm charts and pin dependencies.
* Cleanup unused resources regularly.
* Use ConfigMaps/Secrets for configuration.
* Prefer Deployment over raw Pods.
* Use HPA for auto-scaling.
* Test locally with minikube or kind.
* Use kubectl explain for resource documentation.
* Export outputs in JSON/YAML for scripting.
* Use port-forward for quick debugging.
* Review events and describe for troubleshooting.

## Additional Resources
* [Official Kubernetes Documentation](https://kubernetes.io/docs/)
* [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [Helm Documentation](https://helm.sh/docs/)
* [Helm Cheat Sheet](https://helm.sh/docs/intro/cheatsheet/)
* [LPI DevOps Tools Engineer Objectives](https://www.lpi.org/our-certifications/exam-701-objectives)
* [Kubernetes Basics Tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
* [Helm Hub / Artifact Hub](https://artifacthub.io/)
* [kubectl Reference Docs](https://kubernetes.io/docs/reference/kubectl/)
* [Kubernetes Patterns](https://kubernetespatterns.com/)
* [Awesome Kubernetes](https://github.com/ramitsurana/awesome-kubernetes)

## Mini-Glossary

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Cluster | Set of nodes running Kubernetes |
| Node | Worker machine in cluster |
| Pod | Smallest deployable unit |
| Container | Runtime instance in pod |
| ReplicaSet | Ensures pod count |
| Deployment | Manages ReplicaSets |
| Service | Network abstraction |
| Namespace | Virtual cluster |
| Context | Cluster/user/namespace combo |
| Kubeconfig | Authentication config |

### 2. Resource Types
| Term/Concept | Description |
| --- | --- |
| Pod | One or more containers |
| Deployment | Rolling updates |
| StatefulSet | Stateful apps |
| DaemonSet | Per-node pod |
| Job | One-off task |
| CronJob | Scheduled job |
| Service | Load balancing |
| Ingress | HTTP routing |
| ConfigMap | Config data |
| Secret | Sensitive data |

### 3. kubectl Commands
| Term/Concept | Description |
| --- | --- |
| get | List resources |
| describe | Show details |
| logs | Container logs |
| exec | Run command in container |
| apply | Declarative update |
| create | Imperative create |
| delete | Remove resource |
| edit | Edit live resource |
| scale | Change replicas |
| rollout | Manage rollouts |

### 4. Helm Concepts
| Term/Concept | Description |
| --- | --- |
| Chart | Package of resources |
| Release | Instance of chart |
| Repository | Chart storage |
| Values | Configuration overrides |
| Template | Rendered manifests |
| Hook | Lifecycle events |
| Dependency | Subcharts |
| Upgrade | Update release |
| Rollback | Revert release |
| Uninstall | Remove release |

### 5. Networking
| Term/Concept | Description |
| --- | --- |
| ClusterIP | Internal service |
| NodePort | External node port |
| LoadBalancer | Cloud LB |
| Ingress | HTTP routing |
| NetworkPolicy | Pod traffic control |
| Endpoint | Service targets |
| DNS | CoreDNS resolution |
| CNI | Container Network Interface |
| ServiceMesh | Istio/Linkerd |
| Port-forward | Local tunnel |

### 6. Storage
| Term/Concept | Description |
| --- | --- |
| PV | Persistent Volume |
| PVC | Persistent Volume Claim |
| StorageClass | Dynamic provisioning |
| Volume | Pod storage |
| EmptyDir | Ephemeral |
| HostPath | Node filesystem |
| ConfigMap Volume | Mount config |
| Secret Volume | Mount secrets |
| CSI | Container Storage Interface |
| Provisioner | Dynamic creator |

### 7. Scheduling
| Term/Concept | Description |
| --- | --- |
| Label | Key-value tag |
| Selector | Match labels |
| NodeSelector | Node constraint |
| Affinity | Advanced placement |
| Taint | Repel pods |
| Toleration | Allow taint |
| Scheduler | Assign pods |
| PriorityClass | Pod priority |
| Resource Requests | Minimum |
| Resource Limits | Maximum |

### 8. Security
| Term/Concept | Description |
| --- | --- |
| RBAC | Role-Based Access |
| ServiceAccount | Pod identity |
| Role | Namespace permissions |
| ClusterRole | Cluster-wide |
| Binding | Assign role |
| NetworkPolicy | Traffic rules |
| PodSecurityPolicy | Deprecated |
| Admission Controller | Validate |
| Secret | Encrypted data |
| ImagePolicy | Scan images |

### 9. Troubleshooting
| Term/Concept | Description |
| --- | --- |
| Events | Cluster activity |
| Describe | Detailed info |
| Logs | Container output |
| Exec | Interactive access |
| Top | Resource metrics |
| Debug | Ephemeral container |
| Wait | Condition wait |
| Diff | Change preview |
| Proxy | API access |
| Auth can-i | Permission check |

### 10. DevOps Integration
| Term/Concept | Description |
| --- | --- |
| Helm | Package manager |
| kubectl apply | GitOps |
| ArgoCD | Declarative CD |
| Flux | GitOps toolkit |
| Jenkins X | CI/CD for K8s |
| Tekton | Pipelines |
| HPA | Horizontal autoscaling |
| Cluster Autoscaler | Node scaling |
| Metrics Server | Resource metrics |
| Prometheus | Monitoring |

