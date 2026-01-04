# 101 Jenkins Commands

## Overview
Jenkins is an open-source automation server widely used for building, testing, and deploying software in CI/CD pipelines. This cheat sheet covers essential Jenkins CLI commands, Groovy script console usage, pipeline syntax, job management, agent configuration, plugin operations, security, and monitoring relevant to DevOps workflows on Debian/Ubuntu systems.

## Target Audience
- DevOps engineers building CI/CD pipelines
- System administrators managing Jenkins instances
- Developers automating builds and tests
- Release engineers handling deployments
- Anyone preparing for LPI DevOps Tools Engineer certification

### 1. Installation and Service Management (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sudo apt update && sudo apt install jenkins | Install from Debian repo | Standard install | sudo apt install jenkins |
| sudo systemctl start jenkins | Start service | Launch Jenkins | sudo systemctl start jenkins |
| sudo systemctl enable jenkins | Enable at boot | Autostart | sudo systemctl enable jenkins |
| sudo systemctl status jenkins | Check status | Running state | sudo systemctl status jenkins |
| sudo systemctl restart jenkins | Restart | Apply config | sudo systemctl restart jenkins |
| sudo journalctl -u jenkins | View logs | Troubleshooting | sudo journalctl -u jenkins -f |
| sudo ufw allow 8080 | Open port | Firewall | sudo ufw allow 8080/tcp |
| jenkins --version | CLI version | Check install | java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:token --version |

### 2. Jenkins CLI Basics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| java -jar jenkins-cli.jar -s http://localhost:8080 -auth user:token help | List commands | Overview | java -jar jenkins-cli.jar -s URL -auth @file help |
| java -jar jenkins-cli.jar -s URL get-job jobname | Export job XML | Backup | java -jar jenkins-cli.jar -s URL get-job myjob > job.xml |
| java -jar jenkins-cli.jar -s URL create-job jobname < job.xml | Create job | Import | java -jar jenkins-cli.jar -s URL create-job newjob < job.xml |
| java -jar jenkins-cli.jar -s URL delete-job jobname | Delete job | Cleanup | java -jar jenkins-cli.jar -s URL delete-job oldjob |
| java -jar jenkins-cli.jar -s URL build jobname | Trigger build | Manual run | java -jar jenkins-cli.jar -s URL build mypipeline |
| java -jar jenkins-cli.jar -s URL list-jobs | List all jobs | Inventory | java -jar jenkins-cli.jar -s URL list-jobs |
| java -jar jenkins-cli.jar -s URL console jobname | Build log | Output | java -jar jenkins-cli.jar -s URL console myjob #123 |
| java -jar jenkins-cli.jar -s URL who-am-i | Auth check | Verify user | java -jar jenkins-cli.jar -s URL who-am-i |
| java -jar jenkins-cli.jar -s URL version | Server version | Check | java -jar jenkins-cli.jar -s URL version |
| java -jar jenkins-cli.jar -s URL groovy script.groovy | Run Groovy | Automation | java -jar jenkins-cli.jar -s URL groovy = < script.groovy |

### 3. Authentication and Tokens (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| curl -u user http://localhost:8080/me/configure | User config page | Generate token | Go to /me/configure |
| curl -u user:token http://localhost:8080/crumbIssuer/api/json | Get crumb | CSRF | Store in JENKINS_CRUMB |
| export JENKINS_USER=user && export JENKINS_TOKEN=token | Environment vars | Scripts | export JENKINS_URL=http://localhost:8080 |
| java -jar jenkins-cli.jar -auth @/path/to/authfile | Auth file | Secure | user:apitoken on separate lines |
| curl --user user:token http://jenkins/api/json | API call | REST | curl --user user:token URL/api/json |
| jenkins-cli.jar -auth user:token safe-restart | Safe restart | Maintenance | java -jar jenkins-cli.jar -s URL safe-restart |
| jenkins-cli.jar -auth user:token reload-configuration | Reload config | After changes | java -jar jenkins-cli.jar -s URL reload-configuration |
| jenkins-cli.jar -auth user:token quiet-down | Quiet mode | Before maintenance | java -jar jenkins-cli.jar -s URL quiet-down |

### 4. Job and Pipeline Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| java -jar jenkins-cli.jar -s URL enable-job jobname | Enable job | Activate | java -jar jenkins-cli.jar -s URL enable-job myjob |
| java -jar jenkins-cli.jar -s URL disable-job jobname | Disable job | Pause | java -jar jenkins-cli.jar -s URL disable-job myjob |
| java -jar jenkins-cli.jar -s URL copy-job source target | Copy job | Template | java -jar jenkins-cli.jar -s URL copy-job old new |
| java -jar jenkins-cli.jar -s URL build jobname -p PARAM=val | With parameters | Input | java -jar jenkins-cli.jar -s URL build job -p ENV=prod |
| java -jar jenkins-cli.jar -s URL build jobname -s | Wait for completion | Sync | java -jar jenkins-cli.jar -s URL build job -s |
| java -jar jenkins-cli.jar -s URL build jobname -c | Check only | Dry run | java -jar jenkins-cli.jar -s URL build job -c |
| curl -X POST http://user:token@jenkins/job/jobname/build | Trigger build | REST | curl -X POST URL/job/myjob/build |
| curl -X POST http://user:token@jenkins/job/jobname/buildWithParameters?PARAM=val | Param build | REST | curl -X POST URL/buildWithParameters |
| curl http://jenkins/job/jobname/lastBuild/api/json | Last build info | JSON | curl URL/lastBuild/api/json |
| curl http://jenkins/job/jobname/config.xml | Get config XML | Backup | curl -u user:token URL/config.xml |
| curl -X POST -H Content-Type:application/xml --data-binary @job.xml URL/createItem?name=newjob | Create via REST | Import | curl -X POST URL/createItem |
| java -jar jenkins-cli.jar -s URL update-job jobname < new.xml | Update job | Config change | java -jar jenkins-cli.jar -s URL update-job myjob < new.xml |

### 5. Pipeline Syntax and Stages (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| pipeline { agent any; stages { stage('Build') { steps { sh 'make' } } } } | Declarative basic | Standard | Full Jenkinsfile |
| node('label') { stage('Test') { sh 'npm test' } } | Scripted pipeline | Legacy | node { ... } |
| stage('Deploy') { when { branch 'main' } steps { ... } } | Conditional stage | Branch | when { branch 'main' } |
| parallel { stage('Unit') { ... } stage('Integration') { ... } } | Parallel stages | Speed | parallel { ... } |
| post { always { cleanWs() } success { ... } failure { ... } } | Post actions | Cleanup | post { always { ... } } |
| environment { VAR = 'value' } | Set env vars | Global | environment { ... } |
| credentials('id') | Use credentials | Secrets | withCredentials([usernamePassword(credentialsId: 'git', ... )]) |
| input message: 'Approve?' | Manual approval | Gate | input message: 'Deploy?' |
| timeout(time: 10, unit: 'MINUTES') { ... } | Timeout stage | Prevent hang | timeout(time: 30, unit: 'MINUTES') |
| retry(3) { sh 'flaky command' } | Retry step | Reliability | retry(3) { ... } |
| stash name: 'source', includes: 'src/**' | Stash files | Multi-agent | stash name: 'build' |
| unstash 'source' | Restore stashed | Next agent | unstash 'build' |

### 6. Agent and Node Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| java -jar jenkins-cli.jar -s URL create-node node-name < config.xml | Create agent | New node | java -jar jenkins-cli.jar -s URL create-node agent1 < config.xml |
| java -jar jenkins-cli.jar -s URL list-nodes | List agents | Inventory | java -jar jenkins-cli.jar -s URL list-nodes |
| java -jar jenkins-cli.jar -s URL delete-node node-name | Delete agent | Cleanup | java -jar jenkins-cli.jar -s URL delete-node oldagent |
| java -jar jenkins-cli.jar -s URL online-node node-name | Bring online | Resume | java -jar jenkins-cli.jar -s URL online-node agent1 |
| java -jar jenkins-cli.jar -s URL offline-node node-name -m "message" | Take offline | Maintenance | java -jar jenkins-cli.jar -s URL offline-node agent1 -m "upgrade" |
| ssh-agent(credentialsId: 'ssh-key') { sh 'git clone ...' } | SSH agent | Git access | ssh-agent(credentialsId: 'deploy-key') |
| agent { docker { image 'node:20' } } | Docker agent | Isolated | agent { docker { image 'python:3.11' } } |
| agent { label 'linux && docker' } | Label agent | Specific | agent { label 'ubuntu' } |
| agent { kubernetes { yamlFile 'pod.yaml' } } | K8s agent | Dynamic | agent { kubernetes { ... } } |
| java -jar agent.jar -jnlpUrl URL/computer/agent/slave-agent.jnlp -secret @secret-file | Launch agent | Manual | java -jar agent.jar ... |

### 7. Plugin Management (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| java -jar jenkins-cli.jar -s URL install-plugin plugin-name | Install plugin | CLI | java -jar jenkins-cli.jar -s URL install-plugin git |
| java -jar jenkins-cli.jar -s URL install-plugin plugin-name -deploy | Install & restart | Immediate | java -jar jenkins-cli.jar -s URL install-plugin pipeline -deploy |
| java -jar jenkins-cli.jar -s URL list-plugins | List installed | Inventory | java -jar jenkins-cli.jar -s URL list-plugins |
| java -jar jenkins-cli.jar -s URL safe-restart | Safe restart | After plugin | java -jar jenkins-cli.jar -s URL safe-restart |
| curl -X POST -u user:token URL/pluginManager/installNecessaryPlugins --data '<install ...>' | Bulk install | Setup | curl -X POST URL/pluginManager/... |
| java -jar jenkins-cli.jar -s URL install-plugin source.hpi | Local file | Offline | java -jar jenkins-cli.jar -s URL install-plugin /tmp/plugin.hpi |
| java -jar jenkins-cli.jar -s URL uninstall-plugin plugin-id | Uninstall | Cleanup | java -jar jenkins-cli.jar -s URL uninstall-plugin workflow-aggregator |
| curl http://updates.jenkins.io/update-center.json | Update site | Config | Set in Manage Jenkins |
| java -jar jenkins-cli.jar -s URL reload-configuration | Reload plugins | After change | java -jar jenkins-cli.jar -s URL reload-configuration |
| java -jar jenkins-cli.jar -s URL list-plugins | grep outdated | Check updates | java -jar jenkins-cli.jar -s URL list-plugins | grep "(outdated)" |

### 8. Security and Credentials (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| withCredentials([usernamePassword(credentialsId: 'id', usernameVariable: 'USER', passwordVariable: 'PASS')]) { sh 'echo $PASS' } | Use credentials | Secure | withCredentials([...]) |
| credentials('git-creds') | Reference | Pipeline | credentials('docker-hub') |
| string(credentialsId: 'api-key', variable: 'KEY') | String secret | API keys | string(credentialsId: 'token') |
| file(credentialsId: 'ssh-key', variable: 'KEYFILE') | File secret | Keys | file(credentialsId: 'id_rsa') |
| certificate(credentialsId: 'keystore', variable: 'KEYSTORE') | Keystore | SSL | certificate(...) |
| curl -X POST URL/credentials/store/system/domain/_/createCredentials --data-urlencode json=... | Add via REST | Automation | curl -X POST URL/createCredentials |
| java -jar jenkins-cli.jar -s URL groovy = < add-credential.groovy | Add credential | Script | Groovy script |
| curl http://user:token@jenkins/credentials/store/system/domain/_/ | List domains | View | curl URL/credentials/... |
| java -jar jenkins-cli.jar -s URL set-user-api-token username newtoken | Set token | CLI | java -jar jenkins-cli.jar -s URL set-user-api-token admin newtoken |
| curl -X POST URL/me/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken | Generate token | API | curl -X POST URL/generateNewToken |

### 9. Monitoring and Logs (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| java -jar jenkins-cli.jar -s URL console jobname #buildnum | Build console | Live | java -jar jenkins-cli.jar -s URL console myjob #42 |
| curl http://jenkins/job/jobname/lastBuild/consoleText | Console output | Download | curl URL/consoleText > log.txt |
| curl http://jenkins/computer/api/json | Node status | JSON | curl URL/computer/api/json |
| curl http://jenkins/queue/api/json | Queue status | Pending | curl URL/queue/api/json |
| java -jar jenkins-cli.jar -s URL clear-queue | Clear queue | Reset | java -jar jenkins-cli.jar -s URL clear-queue |
| curl http://jenkins/metrics/currentMetrics | Metrics | Monitoring | curl URL/metrics/currentMetrics |
| java -jar jenkins-cli.jar -s URL groovy = < metrics.groovy | Custom metrics | Script | Groovy for health |
| sudo journalctl -u jenkins -f | System logs | Service | sudo journalctl -u jenkins -f |

### 10. Backup and Restore (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| rsync -avz /var/lib/jenkins/ backup/ | Backup home | Full | rsync -avz /var/lib/jenkins/ /backup/jenkins |
| tar czf jenkins-backup.tar.gz /var/lib/jenkins/jobs | Jobs only | Partial | tar czf jobs.tar.gz /var/lib/jenkins/jobs |
| java -jar jenkins-cli.jar -s URL get-job jobname > job.xml | Export job | Individual | java -jar jenkins-cli.jar -s URL get-job myjob > myjob.xml |
| java -jar jenkins-cli.jar -s URL create-job newjob < job.xml | Restore job | Import | java -jar jenkins-cli.jar -s URL create-job myjob < myjob.xml |
| cp -r /var/lib/jenkins/plugins /backup/plugins | Backup plugins | Offline | cp -r /var/lib/jenkins/plugins /backup |
| thinBackup plugin | Full backup | UI/Plugin | Install thinBackup plugin |
| jenkins-cli.jar -s URL export-configs > configs.xml | Config export | Advanced | Groovy scripts |
| rsync from backup to /var/lib/jenkins | Restore | Recovery | rsync -avz backup/jenkins/ /var/lib/jenkins |

### 11. Groovy Script Console (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Jenkins.instance.getAllItems(AbstractProject).each { it.disabled = true } | Disable all jobs | Bulk | Groovy in Script Console |
| Jenkins.instance.pluginManager.plugins.each { println "${it.getShortName()}: ${it.getVersion()}" } | List plugins | Inventory | println plugin info |
| Jenkins.instance.nodes.each { println it.name } | List agents | Nodes | nodes.each { ... } |
| Jenkins.instance.queue.items.each { queue.cancel(it.task) } | Clear queue | Reset | queue.items.each { cancel } |
| Jenkins.instance.doQuietDown() | Quiet mode | Maintenance | Jenkins.instance.doQuietDown() |
| Jenkins.instance.doSafeRestart() | Safe restart | Apply changes | Jenkins.instance.doSafeRestart() |
| new hudson.model.User("user").save(); user.addProperty(new ApiTokenProperty()) | Create token | Script | Programmatic |
| Jenkins.instance.getItemByFullName("job").scheduleBuild() | Trigger build | Groovy | scheduleBuild() |
| def build = Jenkins.instance.getItemByFullName("job").getLastBuild() | Get last build | Info | build.number |
| Jenkins.instance.reload() | Reload config | After XML | Jenkins.instance.reload() |
| System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "") | Disable CSP | Screenshots | System.setProperty |
| println Jenkins.instance.getDescriptor("jenkins.security.s2m.ReplayableScriptApproval").getApprovedScripts() | Approved scripts | Security | getApprovedScripts() |

### 12. Pipeline Shared Libraries (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| @Library('my-shared-lib') _ | Load library | Global | @Library('utils') _ |
| @Library('my-lib@branch') _ | Specific branch | Version | @Library('pipeline-lib@v1.0') _ |
| library identifier: 'lib@master', retriever: modernSCM([...]) | Declarative | Advanced | library identifier: ... |
| def utils = library('utils').com.example.Utils | Class access | Custom | utils.someMethod() |
| steps.myStep(param: 'value') | Call var | Shared | steps.deploy(env: 'prod') |
| src/com/example/Utils.groovy | Class file | Shared code | src/ directory |
| vars/deploy.groovy | Global var | Step | vars/deploy.groovy |
| resources/ | Static files | Templates | resources/config.json |
| test/ | Unit tests | Library | test/com/example/UtilsTest.groovy |
| Jenkinsfile: libraryResource 'config.json' | Load resource | Pipeline | load libraryResource 'script.sh' |

### 13. Blue Ocean and Modern UI (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| curl http://jenkins/blue/rest/organizations/jenkins/pipelines/ | List pipelines | API | curl URL/blue/rest/... |
| curl http://jenkins/blue/rest/organizations/jenkins/pipelines/jobname/runs/ | Build history | JSON | curl URL/runs/ |
| curl -X POST URL/blue/rest/organizations/jenkins/pipelines/jobname/runs/ | Replay | REST | curl -X POST URL/replay |
| curl URL/blue/rest/organizations/jenkins/pipelines/jobname/branches/ | Branches | Multi-branch | curl URL/branches/ |
| curl URL/blue/rest/organizations/jenkins/pipelines/jobname/activities/ | Activities | Live | curl URL/activities/ |
| Blue Ocean plugin | Modern UI | Visualization | Install Blue Ocean |
| /blue/organizations/jenkins/jobname/detail/ | Pipeline view | UI | /blue/... |
| curl URL/blue/rest/search/?q=type:pipeline;organization:jenkins | Search | API | curl URL/blue/rest/search/ |

### 14. Multibranch Pipeline (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Multibranch Pipeline job type | Auto discover | Branches/PRs | Create Multibranch job |
| Jenkinsfile in repo root | Required | Pipeline | Jenkinsfile |
| branchSources: [ github: 'repo', credentialsId: 'git' ] | GitHub source | Config | Branch API plugin |
| discoverBranches: 1, discoverPRFromForks: true | Discovery strategy | Options | discoverBranches: 2 |
| webhook on GitHub | Auto trigger | Real-time | Jenkins GitHub webhook |
| orphanedItemStrategy { daysToKeep: 7 } | Cleanup old | Retention | orphanedItemStrategy |
| periodics: [cron: 'H/15 * * * *'] | Periodic scan | Fallback | periodics |
| scriptPath: 'ci/Jenkinsfile' | Custom path | Non-root | scriptPath: 'Jenkinsfile.prod' |

### 15. Security Hardening (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Disable CLI over HTTP | Security Realm | Config | Disable remoting |
| Enable Matrix Authorization | Fine-grained | Permissions | Matrix-based security |
| Use Role-based Authorization | RBAC | Scalable | Role-based plugin |
| Disable old agent protocols | Secure agents | Config | Disable old protocols |
| Set CSP header | Prevent XSS | Config | System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "sandbox;") |
| Enable CSRF protection | Crumbs | Default | Enabled by default |
| Use HTTPS | Reverse proxy | Nginx/Apache | Terminate SSL |
| Audit Trail plugin | Log actions | Compliance | Audit Trail |
| Job DSL plugin security | Approve scripts | Script Security | Approve in Script Approval |
| Restrict agent ports | Firewall | Network | Limit JNLP ports |

### 16. Performance Tuning (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| -Xmx4g in /etc/default/jenkins | Increase heap | Memory | JENKINS_ARGS="--heapSize=4g" |
| Increase executors per agent | Capacity | Config | # of executors |
| Use incremental builds | Speed | Maven/Gradle | Incremental |
| Parallel stages | Faster pipelines | Pipeline | parallel { ... } |
| Use lightweight agents | Docker/K8s | Dynamic | agent { docker { ... } } |
| Cache dependencies | npm/mvn | Speed | Cache step |
| Quiet period reduction | Faster trigger | Config | Quiet period = 0 |
| Throttle concurrent builds | Stability | Plugin | Throttle Concurrents |

### 17. Common Plugins and Tools (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Pipeline | Declarative/Scripted | Core | Pipeline plugin |
| Git | Source control | SCM | Git plugin |
| GitHub | Integration | Webhooks | GitHub plugin |
| Docker Pipeline | Container agents | Builds | Docker plugin |
| Kubernetes | Dynamic agents | Scaling | Kubernetes plugin |
| Blue Ocean | Modern UI | Visualization | Blue Ocean suite |
| Job DSL | Programmatic jobs | Seed jobs | Job DSL plugin |
| Credentials Binding | Secrets | Secure | Credentials Binding |
| Pipeline Stage View | Visual stages | Monitoring | Pipeline Stage View |
| Prometheus | Metrics exposure | Monitoring | Prometheus plugin |

## Tips and Best Practices
* Always use Pipeline as Code (Jenkinsfile) for version-controlled pipelines.
* Store Jenkinsfile in repository root or ci/ directory.
* Use shared libraries for reusable pipeline code.
* Never hardcode secrets—use Credentials Binding plugin.
* Prefer declarative pipeline over scripted for readability.
* Use Blue Ocean for better pipeline visualization.
* Enable automatic branch discovery in multibranch jobs.
* Use Role-based Authorization for large teams.
* Regularly backup /var/lib/jenkins/jobs and plugins.
* Use thinBackup or rsync for reliable backups.
* Monitor with Prometheus plugin and Grafana.
* Disable unnecessary CLI access in production.
* Use reverse proxy (Nginx) with HTTPS.
* Approve Groovy scripts in Script Approval page.
* Clean workspace regularly with cleanWs().
* Use stash/unstash for multi-agent pipelines.
* Set build retention policies to manage disk space.
* Use quiet-down before maintenance.
* Test pipelines with Replay feature.
* Pin plugin versions for stability.

## Additional Resources
* [Official Jenkins Documentation](https://www.jenkins.io/doc/)
* [Jenkins Pipeline Tutorial](https://www.jenkins.io/doc/pipeline/tour/hello-world/)
* [Jenkins CLI Reference](https://www.jenkins.io/doc/book/managing/cli/)
* [Jenkins Shared Libraries](https://www.jenkins.io/doc/book/pipeline/shared-libraries/)
* [LPI DevOps Tools Engineer Objectives](https://www.lpi.org/our-certifications/devops-tools-engineer-overview)
* [Jenkins Security Advisory](https://www.jenkins.io/security/)
* [Blue Ocean Documentation](https://www.jenkins.io/projects/blue-ocean/)
* [Jenkins Best Practices](https://www.jenkins.io/doc/book/pipeline/best-practices/)
* [Jenkins Handbook](https://www.jenkins.io/doc/book/)
* [Jenkins on Debian/Ubuntu](https://pkg.jenkins.io/debian/)

## Mini-Glossary

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Jenkins | Open-source automation server |
| Job | Single build configuration |
| Pipeline | Series of automated steps |
| Build | Execution of a job |
| Agent | Machine running builds |
| Node | Synonym for agent |
| Controller | Main Jenkins server |
| Executor | Slot for running builds |
| Workspace | Directory for job files |
| Artifact | Output file from build |

### 2. Pipeline Types
| Term/Concept | Description |
| --- | --- |
| Declarative | Structured pipeline syntax |
| Scripted | Groovy-based flexible |
| Multibranch | Auto branch detection |
| Shared Library | Reusable pipeline code |
| Stage | Logical pipeline section |
| Step | Single task in stage |
| Post | Always/success/failure actions |
| Parallel | Concurrent stages |
| Input | Manual approval step |
| When | Conditional execution |

### 3. Security Terms
| Term/Concept | Description |
| --- | --- |
| Crumb | CSRF protection token |
| API Token | User authentication token |
| Credentials | Stored secrets |
| Matrix Auth | Permission matrix |
| Role-based | RBAC strategy |
| Script Approval | Approve Groovy scripts |
| CSP | Content Security Policy |
| Remoting | Agent communication |
| JNLP | Agent connection protocol |
| Replayable | Safe script execution |

### 4. CLI and API
| Term/Concept | Description |
| --- | --- |
| jenkins-cli.jar | Command-line interface |
| REST API | HTTP-based interface |
| Groovy Console | Script execution UI |
| CrumbIssuer | CSRF token endpoint |
| Quiet Down | Block new builds |
| Safe Restart | Restart without abort |
| Reload Config | Reload from disk |
| Build Trigger | Start job execution |
| Console Output | Build log |
| Queue | Pending builds |

### 5. Agents and Nodes
| Term/Concept | Description |
| --- | --- |
| Permanent Agent | Always connected |
| Dynamic Agent | On-demand (Docker/K8s) |
| Label | Tag for agent selection |
| Offline | Agent not available |
| Online | Agent ready |
| JNLP | Java Web Start agent |
| SSH Agent | SSH-connected |
| Docker Agent | Container-based |
| Kubernetes Pod | Dynamic K8s agent |
| Executor | Build slot on agent |

### 6. Plugins and Extensions
| Term/Concept | Description |
| --- | --- |
| Plugin | Extends functionality |
| Update Center | Plugin repository |
| HPI | Plugin file format |
| Dependency | Required plugin |
| Optional | Nice-to-have plugin |
| Pipeline Plugin | Core pipeline support |
| Blue Ocean | Modern UI suite |
| Job DSL | Programmatic jobs |
| ThinBackup | Backup plugin |
| Prometheus | Metrics exposure |

### 7. Monitoring Terms
| Term/Concept | Description |
| --- | --- |
| Metrics | Prometheus format |
| Build History | Past executions |
| Queue | Waiting builds |
| Console Log | Real-time output |
| Stage View | Visual stages |
| Activity | Running jobs |
| Health | System status |
| Disk Usage | Workspace size |
| Load | Executor usage |
| Trends | Build duration |

### 8. Backup Terms
| Term/Concept | Description |
| --- | --- |
| JENKINS_HOME | /var/lib/jenkins |
| jobs/ | Job configurations |
| config.xml | Global config |
| plugins/ | Installed plugins |
| secrets/ | Master key |
| thinBackup | Full backup plugin |
| Job export | XML config |
| Artifact archive | Build outputs |
| Workspace | Runtime files |
| UserContent | Static files |

### 9. DevOps Integration
| Term/Concept | Description |
| --- | --- |
| Webhook | Auto trigger from Git |
| GitHub App | Modern integration |
| Branch Source | SCM config |
| Discover | Auto branch/PR |
| Orphaned | Old branches cleanup |
| Periodic | Scheduled scan |
| Replay | Re-run pipeline |
| Blue Ocean | Visual pipeline |
| Shared Lib | Reusable code |
| Seed Job | Generate jobs |

### 10. Performance Terms
| Term/Concept | Description |
| --- | --- |
| Heap | Java memory |
| Executor | Parallel builds |
| Fork | Pipeline parallel |
| Cache | Dependency reuse |
| Incremental | Partial rebuild |
| Throttle | Limit concurrency |
| Quiet Period | Delay trigger |
| Build Discard | Old build cleanup |
| Workspace Cleanup | Disk management |
| Lightweight | Fast agents |

