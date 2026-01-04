# 101 Prometheus Commands

## Overview
Prometheus is an open-source monitoring and alerting toolkit designed for reliability and scalability in cloud-native environments. This cheat sheet covers essential Prometheus server commands, PromQL queries, configuration, service discovery, alerting rules, recording rules, federation, remote storage, and client libraries relevant to DevOps monitoring workflows and LPI DevOps Tools Engineer certification.

## Target Audience
- DevOps engineers building observability
- Site reliability engineers managing alerts
- System administrators monitoring infrastructure
- Platform engineers integrating metrics
- Anyone preparing for LPI DevOps Tools Engineer

### 1. Installation and Service Management (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| wget https://github.com/prometheus/prometheus/releases/download/v*/prometheus-*.linux-amd64.tar.gz | Download release | Install | wget latest version |
| tar xvfz prometheus-*.tar.gz | Extract | Setup | tar xvfz prometheus-*.tar.gz |
| ./prometheus --config.file=prometheus.yml | Run server | Start | ./prometheus --config.file=prometheus.yml |
| ./prometheus --config.file=prometheus.yml --web.listen-address=":9090" | Custom port | Bind | --web.listen-address=":9090" |
| ./prometheus --storage.tsdb.path="data/" | Data directory | Persistence | --storage.tsdb.path="/var/lib/prometheus" |
| ./prometheus --storage.tsdb.retention.time=15d | Retention | Storage | --storage.tsdb.retention.time=30d |
| systemctl enable prometheus | Enable service | Boot | systemctl enable prometheus |
| journalctl -u prometheus -f | View logs | Debug | journalctl -u prometheus -f |

### 2. Configuration Basics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| global: scrape_interval: 15s | Global interval | Default | scrape_interval: 15s |
| global: evaluation_interval: 15s | Rule eval | Alerts | evaluation_interval: 30s |
| scrape_configs: - job_name: 'prometheus' | Job config | Self-monitor | job_name: 'prometheus' |
| static_configs: - targets: ['localhost:9090'] | Static targets | Fixed | targets: ['host:9100'] |
| file_sd_configs: - files: ['/path/*.json'] | File discovery | Dynamic | files: ['targets.json'] |
| relabel_configs: - source_labels: [__address__] | Relabel | Transform | target_label: instance |
| rule_files: - "rules/*.yml" | Alert rules | Load | rule_files: - "alerts/*.yml" |
| alerting: alertmanagers: - static_configs: - targets: ['alertmanager:9093'] | Alertmanager | Routing | targets: ['am:9093'] |
| remote_write: - url: "http://remote:9201/write" | Remote write | Federation | remote_write url |
| remote_read: - url: "http://remote:9201/read" | Remote read | Query | remote_read url |

### 3. Basic PromQL Queries (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| up | Instance up | Health | up == 1 |
| prometheus_build_info | Version info | Metadata | prometheus_build_info |
| process_cpu_seconds_total | CPU usage | Process | rate(process_cpu_seconds_total[5m]) |
| process_resident_memory_bytes | Memory | RSS | process_resident_memory_bytes |
| rate(metric[5m]) | Per-second rate | Counters | rate(http_requests_total[5m]) |
| irate(metric[2m]) | Instant rate | Spikes | irate(http_requests_total[2m]) |
| increase(metric[5m]) | Total increase | Counters | increase(http_requests_total[1h]) |
| sum(metric) | Aggregation | Total | sum by(job)(metric) |
| avg(metric) | Average | Mean | avg by(instance)(metric) |
| count(metric) | Count series | Cardinality | count(metric) |
| topk(5, metric) | Top values | Highest | topk(5, http_requests_total) |
| bottomk(5, metric) | Bottom values | Lowest | bottomk(5, cpu_usage) |

### 4. Time Series Selectors (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| metric | Exact match | Series | node_cpu_seconds_total |
| metric{label="value"} | Label match | Filter | http_requests_total{method="GET"} |
| metric{label=~"regex"} | Regex match | Pattern | node_filesystem_free_bytes{mountpoint=~"/var.*"} |
| metric{label!="value"} | Not equal | Exclude | up{job!="prometheus"} |
| metric{label=~""} | Exists | Any | metric{job=~".*"} |
| metric offset 5m | Past offset | Compare | cpu_usage offset 1h |
| metric @ timestamp | At time | Historical | cpu_usage @ start() |
| [5m] | Range vector | Rate | metric[5m] |
| [1h:10s] | Subquery | Resample | increase(metric[1h:10s]) |
| absent(metric) | Missing series | Alert | absent(container_memory_usage_bytes) |

### 5. Aggregation Operators (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| sum by(label) (metric) | Sum group | Total | sum by(job)(http_requests_total) |
| sum without(label) (metric) | Sum exclude | Collapse | sum without(instance)(metric) |
| avg by(label) (metric) | Average group | Mean | avg by(job)(cpu_usage) |
| max by(label) (metric) | Max group | Highest | max by(instance)(memory_usage) |
| min by(label) (metric) | Min group | Lowest | min by(job)(up) |
| count by(label) (metric) | Count group | Cardinality | count by(job)(up) |
| group by(label) (metric) | Group all | One | group by(job)(metric) |
| stddev by(label) (metric) | Std deviation | Variance | stddev by(instance)(latency) |
| quantile by(label) (phi, metric) | Quantile | P99 | quantile by(job)(0.99, latency) |
| count_values("value", metric) | Histogram | Buckets | count_values("le", histogram_bucket) |

### 6. Alerting Rules (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| groups: - name: example | Rule group | Organize | name: node.rules |
| rules: - alert: InstanceDown | Alert rule | Condition | alert: HighCPU |
| expr: up == 0 | Expression | Trigger | expr: avg(cpu_usage) > 80 |
| for: 5m | Pending duration | Avoid flap | for: 10m |
| labels: severity: critical | Labels | Routing | severity: page |
| annotations: summary: "Down" | Annotations | Description | summary: "{{ $labels.instance }} down" |
| annotations: description: "..." | Details | Message | description: "CPU > 80% for 5m" |
| record: job:requests:rate5m | Recording rule | Precompute | record: instance:memory:ratio |
| expr: rate(requests[5m]) | Record expr | Optimize | expr: memory_used / memory_total |
| ALERTS{alertstate="firing"} | Active alerts | Query | ALERTS{severity="critical"} |

### 7. Recording Rules (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| record: job:http_requests:rate5m | Record name | Metric | job:cpu:rate1m |
| expr: rate(http_requests_total[5m]) | Precomputed | Query | rate(node_cpu_seconds_total[1m]) |
| record: instance:memory:available | Derived | Ratio | node_memory_MemAvailable_bytes |
| expr: node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes | Ratio | Percent | * 100 |
| record: cluster:capacity:cpu | Cluster total | Sum | sum(machine_cpu_cores) |
| record: cluster:usage:cpu | Cluster usage | Ratio | sum(rate(container_cpu_usage_seconds_total[5m])) |
| record: job:up:avg | Average up | Health | avg(up) by(job) |
| record: service:latency:p99 | P99 latency | Quantile | histogram_quantile(0.99, sum(rate(latency_bucket[5m])) by(le)) |

### 8. Service Discovery (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| consul_sd_configs: - server: 'localhost:8500' | Consul | Discovery | server: 'consul:8500' |
| dns_sd_configs: - names: ['app.service.consul'] | DNS SRV | Lookup | names: ['_http._tcp.example.com'] |
| ec2_sd_configs: - region: us-east-1 | EC2 | AWS | region: eu-west-1 |
| gce_sd_configs: - project: my-project | GCE | GCP | zone: us-central1-a |
| kubernetes_sd_configs: - role: pod | Kubernetes | Pods | role: node/endpoints/service |
| file_sd_configs: - files: ['/etc/prometheus/targets/*.yml'] | File | Manual | files: ['targets.json'] |
| azure_sd_configs: - subscription_id: id | Azure | VMs | port: 9100 |
| openstack_sd_configs: - role: instance | OpenStack | Instances | all_tenants: true |
| relabel_configs: - action: keep | Keep targets | Filter | regex: prod.* |
| metric_relabel_configs: - action: drop | Drop metrics | Cleanup | source_labels: [__name__] regex: go_goroutines |

### 9. Federation and Remote Storage (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| /federate?match[]={job="prometheus"} | Federate endpoint | Scrape | match[]={__name__=~"up"} |
| scrape_configs: - job_name: 'federate' honor_labels: true | Honor labels | Global | scheme: https |
| remote_write: - url: "http://remote:9201/write" | Remote write | Thanos | queue_config: capacity: 10000 |
| remote_read: - url: "http://remote:9201/read" | Remote read | Query | read_recent: true |
| thanos sidecar --prometheus.url=http://localhost:9090 | Sidecar | Upload | --tsdb.path=data |
| thanos query --http-address=0.0.0.0:10902 | Querier | HA | --store=remote:9090 |
| thanos compact | Compactor | Downsample | --data-dir=data |
| thanos bucket verify | Verify bucket | Integrity | --objstore.config-file=bucket.yml |

### 10. Exporters and Instrumentation (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| node_exporter --path.procfs=/host/proc | Node Exporter | Metrics | --path.sysfs=/host/sys |
| mysqld_exporter --config.my-cnf=/etc/my.cnf | MySQL | DB | mysqld_exporter |
| postgres_exporter | PostgreSQL | Queries | PG_EXPORTER_OPTS |
| blackbox_exporter | Blackbox | Probing | config.file=blackbox.yml |
| prometheus_client | Client library | App metrics | from prometheus_client import Counter |
| pushgateway | Pushgateway | Short-lived | curl -X POST http://pg:9091/metrics/job/job |
| alertmanager --config.file=alertmanager.yml | Alertmanager | Alerts | --cluster.listen-address="" |
| grafana | Visualization | Dashboards | Provisioning |
| mtail | Log metrics | Tail | mtail --logs '*.log' |
| snmp_exporter | SNMP | Devices | generator.yml |

### 11. Alertmanager Commands (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ./alertmanager --config.file=alertmanager.yml | Run | Start | ./alertmanager |
| route: receiver: 'team-pager' | Routing | Tree | group_by: ['alertname'] |
| receiver: name: 'slack' | Slack | Webhook | webhook_urls: ['url'] |
| receiver: name: 'pagerduty' | PagerDuty | Integration | send_resolved: true |
| inhibit_rules: - source_match: severity: 'critical' | Inhibit | Suppress | target_match: severity: 'warning' |
| ./alertmanager --cluster.listen-address="0.0.0.0:9094" | Clustering | HA | --cluster.peer=peer:9094 |
| curl http://alertmanager:9093/api/v2/silences | Silences API | Mute | curl -X POST /api/v2/silences |
| curl http://alertmanager:9093/-/reload | Reload config | Hot | curl -X POST /-/reload |

### 12. Querying and Functions (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| rate(metric[5m]) | Counter rate | Per sec | rate(node_network_receive_bytes_total[5m]) |
| delta(metric[1h]) | Gauge change | Difference | delta(cpu_temp_celsius[1h]) |
| predict_linear(metric[1h], 3600) | Predict | Forecast | predict_linear(disk_free[1h], 4*3600) |
| changes(metric[5m]) | Changes count | Restarts | changes(up[5m]) |
| absent(metric) | Missing | Alert | absent(kube_pod_container_status_running) |
| vector(1) | Instant vector | Constant | vector(1) |
| scalar(metric) | Scalar | Single | scalar(up) |
| time() | Unix time | Timestamp | time() - metric |
| timestamp(metric) | Sample time | Align | timestamp(metric) |
| day_of_month() | Day | Schedule | day_of_week() |
| histogram_quantile(0.95, sum(rate(latency_bucket[5m])) by(le)) | P95 | Latency | histogram_quantile(0.99, ...) |
| deriv(metric[5m]) | Derivative | Trend | deriv(memory_usage[5m]) |

### 13. Binary Operators (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| metric1 + metric2 | Addition | Sum | cpu_user + cpu_system |
| metric1 - metric2 | Subtraction | Difference | memory_total - memory_free |
| metric1 * metric2 | Multiplication | Product | requests * latency |
| metric1 / metric2 | Division | Ratio | memory_used / memory_total |
| metric1 ^ metric2 | Power | Exponent | bytes ^ (1/8) |
| metric1 % metric2 | Modulo | Remainder | seconds % 60 |
| metric1 == bool metric2 | Equal | Boolean | up == 1 |
| metric1 != bool metric2 | Not equal | Boolean | job != "prometheus" |
| metric1 > bool metric2 | Greater | Boolean | cpu > 80 |
| metric1 and metric2 | Intersection | Both | up == 1 and http_requests > 100 |

### 14. Recording and Alerting Best Practices (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| record: job:request_latency_seconds:avg5m | Average latency | Precompute | avg(rate(latency[5m])) by(job) |
| record: node:memory:utilization:ratio | Memory ratio | Percent | 1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) |
| alert: HighErrorRate | High errors | Alert | expr: rate(errors[5m]) / rate(requests[5m]) > 0.05 |
| for: 10m | Debounce | Stability | for: 15m |
| labels: severity: warning | Label | Routing | severity: critical |
| annotations: runbook_url: "https://..." | Runbook | SOP | runbook_url: wiki/page |
| group_wait: 30s | Group wait | Batch | group_wait: 1m |
| group_interval: 5m | Group interval | Send | group_interval: 5m |

### 15. Performance and Optimization (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| --storage.tsdb.min-block-duration=2h | Block duration | Compaction | --storage.tsdb.max-block-duration=2h |
| --storage.tsdb.retention.size=10GB | Size-based | Limit | --storage.tsdb.retention.size=50GB |
| --web.enable-lifecycle | Remote reload | Hot | curl -X POST /-/reload |
| --query.max-concurrency=20 | Query limit | Protect | --query.max-concurrency=50 |
| --query.timeout=2m | Query timeout | Long | --query.timeout=5m |
| recording rules | Precompute | Speed | Heavy queries |
| relabel_configs drop | Drop metrics | Cardinality | action: drop regex: debug.* |
| sample_limit | Limit samples | Protect | sample_limit: 10000 |

### 16. Client Libraries and Instrumentation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Counter(name="requests_total") | Counter | Increment | requests_total.inc() |
| Gauge(name="in_flight") | Gauge | Set | in_flight.set(5) |
| Histogram(name="latency") | Histogram | Observe | latency.observe(0.5) |
| Summary(name="latency") | Summary | Quantiles | latency.observe(0.3) |
| push.Add() | Push metrics | Pushgateway | push.Add() |
| exposition | Expose /metrics | HTTP | start_http_server(8000) |
| client_python | Python lib | App | prometheus_client |
| client_go | Go lib | Official | prometheus/client_golang |

### 17. Troubleshooting Commands (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| curl http://localhost:9090/api/v1/status/runtimeinfo | Runtime | Debug | curl /api/v1/status/runtimeinfo |
| curl http://localhost:9090/api/v1/status/tsdb | TSDB status | Storage | curl /api/v1/status/tsdb |
| curl http://localhost:9090/api/v1/targets | Targets | Scrape | curl /api/v1/targets |
| curl http://localhost:9090/api/v1/rules | Rules | Alerts | curl /api/v1/rules |
| curl http://localhost:9090/metrics | Raw metrics | View | curl localhost:9090/metrics |
| curl http://localhost:9090/api/v1/query?query=up | Query API | Test | curl /api/v1/query |
| prometheus --log.level=debug | Debug logs | Verbose | --log.level=info |
| curl http://localhost:9090/-/healthy | Health check | Ready | curl /-/healthy |

## Tips and Best Practices
* Use recording rules for expensive queries.
* Set meaningful labels for high cardinality control.
* Use relabel_configs to drop unnecessary metrics.
* Configure proper retention based on storage.
* Use Alertmanager for deduplication and inhibition.
* Prefer pushgateway only for short-lived jobs.
* Instrument applications with client libraries.
* Use federation for hierarchical monitoring.
* Monitor Prometheus itself (up, scrape duration).
* Use Grafana for visualization and dashboards.
* Test PromQL queries in the UI expression browser.
* Use rate() for counters, delta() for gauges.
* Add runbook_url annotations for alerts.
* Use silence feature for maintenance.
* Enable remote_write for long-term storage.
* Use service discovery instead of static targets.
* Set scrape_interval based on metric volume.
* Use honor_labels for external labels.
* Regularly review and prune alerting rules.
* Use Prometheus Operator for Kubernetes deployments.

## Additional Resources
* [Official Prometheus Documentation](https://prometheus.io/docs/)
* [PromQL Cheat Sheet](https://prometheus.io/docs/prometheus/latest/querying/basics/)
* [Prometheus Best Practices](https://prometheus.io/docs/practices/instrumentation/)
* [Alerting Rules Guide](https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/)
* [Prometheus Client Libraries](https://prometheus.io/docs/instrumenting/clientlibs/)
* [Grafana Prometheus Datasource](https://grafana.com/docs/grafana/latest/datasources/prometheus/)
* [Prometheus Operator](https://prometheus-operator.dev/)
* [Thanos Documentation](https://thanos.io/)
* [LPI DevOps Tools Engineer Objectives](https://www.lpi.org/our-certifications/devops-tools-engineer-overview)
* [Awesome Prometheus](https://github.com/prometheus/prometheus/wiki/Awesome-Prometheus)

## Mini-Glossary

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Time Series | Metric with labels over time |
| Metric | Name of measurement |
| Label | Key-value dimension |
| Sample | Single value at timestamp |
| Scrape | Pull metrics from target |
| Exporter | Metrics endpoint adapter |
| TSDB | Time Series Database |
| Cardinality | Unique series count |
| Staleness | Missing samples |
| Federation | Hierarchical scraping |

### 2. Metric Types
| Term/Concept | Description |
| --- | --- |
| Counter | Monotonically increasing |
| Gauge | Up/down value |
| Histogram | Bucketed observations |
| Summary | Quantile calculation |
| Untyped | Raw value |
| Rate | Per-second average |
| Irate | Instant rate |
| Increase | Total over range |
| Delta | Gauge change |
| Predict_linear | Forecast |

### 3. Querying
| Term/Concept | Description |
| --- | --- |
| Instant Vector | Single timestamp |
| Range Vector | Time window |
| Subquery | Nested query |
| Offset | Past time |
| @ modifier | Specific time |
| Aggregation | by/without |
| Binary Op | Math/logic |
| Function | rate/irate/histogram_quantile |
| Bool modifier | Boolean result |
| Grouping | by/without labels |

### 4. Alerting
| Term/Concept | Description |
| --- | --- |
| Alert Rule | Condition trigger |
| Pending | Waiting for duration |
| Firing | Active alert |
| Recording Rule | Precomputed metric |
| Annotation | Alert description |
| Label | Routing tag |
| Runbook | Resolution guide |
| Silence | Mute alerts |
| Inhibition | Suppress related |
| Grouping | Batch alerts |

### 5. Configuration
| Term/Concept | Description |
| --- | --- |
| scrape_configs | Target jobs |
| static_configs | Fixed targets |
| file_sd_configs | File discovery |
| relabel_configs | Label transform |
| metric_relabel_configs | Post-scrape |
| honor_labels | Preserve external |
| honor_timestamps | Preserve times |
| rule_files | Alert/recording |
| remote_write | Send metrics |
| remote_read | Query remote |

### 6. Service Discovery
| Term/Concept | Description |
| --- | --- |
| Consul | Service catalog |
| DNS SRV | DNS records |
| EC2 | AWS instances |
| GCE | GCP instances |
| Kubernetes | K8s resources |
| Azure | Azure VMs |
| OpenStack | Instances |
| File SD | JSON/YAML files |
| Relabel | Filter/transform |
| Keep/Drop | Action |

### 7. Storage
| Term/Concept | Description |
| --- | --- |
| TSDB | Local storage |
| Retention time | Data age |
| Retention size | Disk limit |
| Block | 2-hour chunks |
| Compaction | Merge blocks |
| WAL | Write-ahead log |
| Head block | Current |
| Remote write | External |
| Thanos | Long-term |
| VictoriaMetrics | Alternative |

### 8. Alertmanager
| Term/Concept | Description |
| --- | --- |
| Receiver | Notification target |
| Route | Routing tree |
| Group by | Batch alerts |
| Group wait | Initial delay |
| Group interval | Repeat |
| Repeat interval | Resend |
| Inhibit | Suppress |
| Silence | Mute |
| Webhook | Custom |
| Clustering | HA |

### 9. Instrumentation
| Term/Concept | Description |
| --- | --- |
| Client library | Language SDK |
| Exposition | /metrics endpoint |
| Pushgateway | Push metrics |
| Direct instrumentation | App metrics |
| Exporter | Adapter |
| Node Exporter | System metrics |
| Blackbox | Probing |
| SNMP Exporter | Network devices |
| JMX Exporter | Java |
| Collector | Metric source |

### 10. Operations
| Term/Concept | Description |
| --- | --- |
| Scrape interval | Pull frequency |
| Evaluation interval | Rule check |
| Query timeout | Max duration |
| Max concurrency | Parallel queries |
| Lifecycle | Remote reload |
| Healthy/Ready | Health endpoints |
| Metrics endpoint | Self-monitor |
| Debug logs | Verbose |
| Profiling | pprof |
| Federation | Hierarchical |

