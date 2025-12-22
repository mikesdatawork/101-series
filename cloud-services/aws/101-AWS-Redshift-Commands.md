# 101 AWS Redshift Commands

## Overview
Amazon Redshift is a fully managed, petabyte-scale data warehouse service for large-scale analytics. This cheat sheet covers AWS CLI commands for cluster creation, snapshot management, query execution, workload management, security, and monitoring. Mastering these commands enables high-performance analytics, reporting, and data warehousing.

## Target Audience
- Data analysts running BI queries
- Data engineers building warehouses
- Business intelligence teams
- ML engineers loading data for training
- Anyone performing large-scale analytics

### 1. Cluster Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --db-name mydb | Create cluster | Basic | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --db-name mydb |
| aws redshift describe-clusters --cluster-identifier mycluster | View cluster | Inspect | aws redshift describe-clusters --cluster-identifier mycluster |
| aws redshift delete-cluster --cluster-identifier mycluster --skip-final-cluster-snapshot | Delete cluster | Cleanup | aws redshift delete-cluster --cluster-identifier mycluster --skip-final-cluster-snapshot |
| aws redshift list-clusters | List clusters | View | aws redshift list-clusters |
| aws redshift modify-cluster --cluster-identifier mycluster --number-of-nodes 4 | Scale cluster | Resize | aws redshift modify-cluster --cluster-identifier mycluster --number-of-nodes 4 |
| aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.xlplus --number-of-nodes 2 --master-username admin --master-user-password mypassword --db-name mydb --encrypted --kms-key-id keyid | Encrypted cluster | Security | aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.xlplus --number-of-nodes 2 --master-username admin --master-user-password mypassword --db-name mydb --encrypted --kms-key-id keyid |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterStatus' | Cluster status | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterStatus' |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --vpc-security-group-ids sg-123 --subnet-group-name mysubnetgroup | VPC cluster | Private | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --vpc-security-group-ids sg-123 --subnet-group-name mysubnetgroup |
| aws redshift modify-cluster --cluster-identifier mycluster --maintenance-track-name current | Update maintenance | Track | aws redshift modify-cluster --cluster-identifier mycluster --maintenance-track-name current |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' | Public key | Access | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' |
| aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.4xlarge --number-of-nodes 2 --master-username admin --master-user-password mypassword --iam-roles 'arn:aws:iam::account:role/RedshiftRole' | IAM role | Access | aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.4xlarge --number-of-nodes 2 --master-username admin --master-user-password mypassword --iam-roles 'arn:aws:iam::account:role/RedshiftRole' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Endpoint' | Endpoint | Connect | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Endpoint' |

### 2. Snapshots and Backups (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier mysnapshot | Manual snapshot | Backup | aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier mysnapshot |
| aws redshift describe-cluster-snapshots --cluster-identifier mycluster | List snapshots | View | aws redshift describe-cluster-snapshots --cluster-identifier mycluster |
| aws redshift delete-cluster-snapshot --snapshot-identifier mysnapshot | Delete snapshot | Cleanup | aws redshift delete-cluster-snapshot --snapshot-identifier mysnapshot |
| aws redshift restore-from-cluster-snapshot --cluster-identifier restored --snapshot-identifier mysnapshot | Restore cluster | Recovery | aws redshift restore-from-cluster-snapshot --cluster-identifier restored --snapshot-identifier mysnapshot |
| aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier dailysnap --manual-snapshot-retention-period 7 | Retention | Backup | aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier dailysnap --manual-snapshot-retention-period 7 |
| aws redshift describe-cluster-snapshots --snapshot-identifier mysnapshot --query 'Snapshots[0].SnapshotStatus' | Snapshot status | Monitor | aws redshift describe-cluster-snapshots --snapshot-identifier mysnapshot --query 'Snapshots[0].SnapshotStatus' |
| aws redshift copy-cluster-snapshot --source-snapshot-identifier mysnapshot --target-snapshot-identifier copysnap | Copy snapshot | Backup | aws redshift copy-cluster-snapshot --source-snapshot-identifier mysnapshot --target-snapshot-identifier copysnap |
| aws redshift describe-cluster-snapshots --cluster-identifier mycluster --snapshot-type automated | Automated snapshots | View | aws redshift describe-cluster-snapshots --cluster-identifier mycluster --snapshot-type automated |
| aws redshift modify-cluster-snapshot --snapshot-identifier mysnapshot --manual-snapshot-retention-period 30 | Update retention | Change | aws redshift modify-cluster-snapshot --snapshot-identifier mysnapshot --manual-snapshot-retention-period 30 |
| aws redshift describe-cluster-snapshots --snapshot-identifier mysnapshot --query 'Snapshots[0].KmsKeyId' | Encryption key | Audit | aws redshift describe-cluster-snapshots --snapshot-identifier mysnapshot --query 'Snapshots[0].KmsKeyId' |

### 3. Query Execution and Workload Management (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift-data execute-statement --cluster-identifier mycluster --database mydb --sql "SELECT * FROM mytable" | Run query | Ad-hoc | aws redshift-data execute-statement --cluster-identifier mycluster --database mydb --sql "SELECT * FROM mytable" |
| aws redshift-data describe-statement --statement-id stmtid | View query | Inspect | aws redshift-data describe-statement --statement-id stmtid |
| aws redshift-data list-statements | List queries | View | aws redshift-data list-statements |
| aws redshift-data get-statement-result --statement-id stmtid | Get results | Retrieve | aws redshift-data get-statement-result --statement-id stmtid |
| aws redshift modify-cluster --cluster-identifier mycluster --workgroup-name myworkgroup | Update WLM | Workload | aws redshift modify-cluster --cluster-identifier mycluster --workgroup-name myworkgroup |
| aws redshift create-workgroup --workgroup-name myworkgroup --base-capacity 32 | Create workgroup | Concurrency | aws redshift create-workgroup --workgroup-name myworkgroup --base-capacity 32 |
| aws redshift describe-workgroup --workgroup-name myworkgroup | View workgroup | Inspect | aws redshift describe-workgroup --workgroup-name myworkgroup |
| aws redshift-data execute-statement --cluster-identifier mycluster --database mydb --sql "VACUUM mytable" | Vacuum table | Maintenance | aws redshift-data execute-statement --cluster-identifier mycluster --database mydb --sql "VACUUM mytable" |

### 4. Security and Access Control (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift modify-cluster --cluster-identifier mycluster --vpc-security-group-ids sg-123 | Update security | VPC | aws redshift modify-cluster --cluster-identifier mycluster --vpc-security-group-ids sg-123 |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --encrypted --kms-key-id keyid | Encrypted cluster | Security | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --encrypted --kms-key-id keyid |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Encrypted' | Check encryption | Audit | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Encrypted' |
| aws redshift modify-cluster-iam-roles --cluster-identifier mycluster --add-iam-roles 'arn:aws:iam::account:role/RedshiftRole' | Add IAM role | Access | aws redshift modify-cluster-iam-roles --cluster-identifier mycluster --add-iam-roles 'arn:aws:iam::account:role/RedshiftRole' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].IamRoles' | View IAM roles | Check | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].IamRoles' |
| aws redshift modify-cluster --cluster-identifier mycluster --publicly-accessible true | Public access | Testing | aws redshift modify-cluster --cluster-identifier mycluster --publicly-accessible true |
| aws redshift modify-cluster --cluster-identifier mycluster --hsm-client-certificate-identifier hsmcert --hsm-configuration-identifier hsmconfig | HSM encryption | Advanced | aws redshift modify-cluster --cluster-identifier mycluster --hsm-client-certificate-identifier hsmcert --hsm-configuration-identifier hsmconfig |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].VpcSecurityGroups' | VPC security | Check | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].VpcSecurityGroups' |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --iam-roles 'arn:aws:iam::account:role/RedshiftRole' | IAM access | Secure | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --iam-roles 'arn:aws:iam::account:role/RedshiftRole' |
| aws redshift modify-cluster --cluster-identifier mycluster --enhanced-vpc-routing | Enhanced VPC | Security | aws redshift modify-cluster --cluster-identifier mycluster --enhanced-vpc-routing |

### 5. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name DatabaseConnections --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Connections | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name DatabaseConnections --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name CPUUtilization --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | CPU usage | Performance | aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name CPUUtilization --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch list-metrics --namespace AWS/Redshift --dimensions Name=ClusterIdentifier,Value=mycluster | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/Redshift --dimensions Name=ClusterIdentifier,Value=mycluster |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterStatus' | Cluster status | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterStatus' |
| aws redshift describe-cluster-snapshots --cluster-identifier mycluster | Snapshot status | Monitor | aws redshift describe-cluster-snapshots --cluster-identifier mycluster |
| aws redshift describe-cluster --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' | Public key | Access | aws redshift describe-cluster --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Endpoint' | Endpoint | Connect | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Endpoint' |
| aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name PercentageDiskSpaceUsed --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Disk usage | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name PercentageDiskSpaceUsed --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' | Node details | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].MaintenanceTrackName' | Maintenance track | Check | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].MaintenanceTrackName' |

### 6. IAM Roles and Access (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift modify-cluster-iam-roles --cluster-identifier mycluster --add-iam-roles 'arn:aws:iam::account:role/RedshiftRole' | Add IAM role | Access | aws redshift modify-cluster-iam-roles --cluster-identifier mycluster --add-iam-roles 'arn:aws:iam::account:role/RedshiftRole' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].IamRoles' | View IAM roles | Check | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].IamRoles' |
| aws redshift modify-cluster-iam-roles --cluster-identifier mycluster --remove-iam-roles 'arn:aws:iam::account:role/RedshiftRole' | Remove IAM role | Cleanup | aws redshift modify-cluster-iam-roles --cluster-identifier mycluster --remove-iam-roles 'arn:aws:iam::account:role/RedshiftRole' |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --iam-roles 'arn:aws:iam::account:role/RedshiftRole' | IAM access | Secure | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --iam-roles 'arn:aws:iam::account:role/RedshiftRole' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].IamRoles' | IAM roles | Verify | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].IamRoles' |
| aws redshift modify-cluster --cluster-identifier mycluster --enhanced-vpc-routing | Enhanced VPC | Security | aws redshift modify-cluster --cluster-identifier mycluster --enhanced-vpc-routing |

### 7. Workload Management (WLM) (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift modify-cluster --cluster-identifier mycluster --workgroup-name myworkgroup | Update WLM | Workload | aws redshift modify-cluster --cluster-identifier mycluster --workgroup-name myworkgroup |
| aws redshift create-workgroup --workgroup-name myworkgroup --base-capacity 32 | Create workgroup | Concurrency | aws redshift create-workgroup --workgroup-name myworkgroup --base-capacity 32 |
| aws redshift describe-workgroup --workgroup-name myworkgroup | View workgroup | Inspect | aws redshift describe-workgroup --workgroup-name myworkgroup |
| aws redshift list-workgroups | List workgroups | View | aws redshift list-workgroups |
| aws redshift delete-workgroup --workgroup-name myworkgroup | Delete workgroup | Cleanup | aws redshift delete-workgroup --workgroup-name myworkgroup |
| aws redshift modify-workgroup --workgroup-name myworkgroup --base-capacity 64 | Scale workgroup | Tune | aws redshift modify-workgroup --workgroup-name myworkgroup --base-capacity 64 |

### 8. Advanced Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.4xlarge --number-of-nodes 2 --master-username admin --master-user-password mypassword --managed-vpc-endpoint | Managed VPC | Private | aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.4xlarge --number-of-nodes 2 --master-username admin --master-user-password mypassword --managed-vpc-endpoint |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' | Public key | Access | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' |
| aws redshift modify-cluster --cluster-identifier mycluster --maintenance-track-name current | Maintenance track | Updates | aws redshift modify-cluster --cluster-identifier mycluster --maintenance-track-name current |
| aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier mysnapshot --manual-snapshot-retention-period 7 | Retention | Backup | aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier mysnapshot --manual-snapshot-retention-period 7 |
| aws redshift restore-from-cluster-snapshot --cluster-identifier restored --snapshot-identifier mysnapshot --node-type ra3.xlplus | Restore RA3 | Scale | aws redshift restore-from-cluster-snapshot --cluster-identifier restored --snapshot-identifier mysnapshot --node-type ra3.xlplus |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' | Node details | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' |
| aws redshift modify-cluster --cluster-identifier mycluster --number-of-nodes 4 --cluster-type single-node | Resize cluster | Scale | aws redshift modify-cluster --cluster-identifier mycluster --number-of-nodes 4 --cluster-type single-node |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --publicly-accessible true | Public cluster | Access | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --publicly-accessible true |

### 9. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name DatabaseConnections --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Connections | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name DatabaseConnections --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name CPUUtilization --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | CPU usage | Performance | aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name CPUUtilization --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch list-metrics --namespace AWS/Redshift --dimensions Name=ClusterIdentifier,Value=mycluster | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/Redshift --dimensions Name=ClusterIdentifier,Value=mycluster |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterStatus' | Cluster status | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterStatus' |
| aws redshift describe-cluster-snapshots --cluster-identifier mycluster | Snapshot status | Monitor | aws redshift describe-cluster-snapshots --cluster-identifier mycluster |
| aws redshift describe-cluster --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' | Public key | Access | aws redshift describe-cluster --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Endpoint' | Endpoint | Connect | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].Endpoint' |
| aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name PercentageDiskSpaceUsed --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Disk usage | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Redshift --metric-name PercentageDiskSpaceUsed --dimensions Name=ClusterIdentifier,Value=mycluster --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' | Node details | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].MaintenanceTrackName' | Maintenance track | Check | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].MaintenanceTrackName' |

### 10. Advanced Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.4xlarge --number-of-nodes 2 --master-username admin --master-user-password mypassword --managed-vpc-endpoint | Managed VPC | Private | aws redshift create-cluster --cluster-identifier mycluster --node-type ra3.4xlarge --number-of-nodes 2 --master-username admin --master-user-password mypassword --managed-vpc-endpoint |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' | Public key | Access | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterPublicKey' |
| aws redshift modify-cluster --cluster-identifier mycluster --maintenance-track-name current | Maintenance track | Updates | aws redshift modify-cluster --cluster-identifier mycluster --maintenance-track-name current |
| aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier mysnapshot --manual-snapshot-retention-period 7 | Retention | Backup | aws redshift create-cluster-snapshot --cluster-identifier mycluster --snapshot-identifier mysnapshot --manual-snapshot-retention-period 7 |
| aws redshift restore-from-cluster-snapshot --cluster-identifier restored --snapshot-identifier mysnapshot --node-type ra3.xlplus | Restore RA3 | Scale | aws redshift restore-from-cluster-snapshot --cluster-identifier restored --snapshot-identifier mysnapshot --node-type ra3.xlplus |
| aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' | Node details | Monitor | aws redshift describe-clusters --cluster-identifier mycluster --query 'Clusters[0].ClusterNodes' |
| aws redshift modify-cluster --cluster-identifier mycluster --number-of-nodes 4 --cluster-type single-node | Resize cluster | Scale | aws redshift modify-cluster --cluster-identifier mycluster --number-of-nodes 4 --cluster-type single-node |
| aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --publicly-accessible true | Public cluster | Access | aws redshift create-cluster --cluster-identifier mycluster --node-type dc2.large --number-of-nodes 2 --master-username admin --master-user-password mypassword --publicly-accessible true |

## Tips and Best Practices
* Use RA3 node types for flexible storage scaling.
* Enable encryption with KMS for sensitive data.
* Use IAM roles for secure access.
* Monitor CPU, disk, and connections with CloudWatch.
* Tag clusters for cost allocation.
* Use snapshots for backups and recovery.
* Enable enhanced VPC routing for security.
* Use workgroups for concurrency management.
* Vacuum and analyze tables regularly.
* Use short queries for best performance.
* Scale clusters during peak times.
* Use managed VPC endpoints for private access.
* Monitor maintenance tracks for updates.
* Use reserved instances for cost savings.
* Test restores from snapshots.

## Additional Resources
* [AWS Redshift CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/redshift/)
* [Redshift Developer Guide](https://docs.aws.amazon.com/redshift/latest/mgmt/welcome.html)
* [Redshift Best Practices](https://docs.aws.amazon.com/redshift/latest/dg/c_best-practices.html)
* [Redshift Monitoring](https://docs.aws.amazon.com/redshift/latest/mgmt/cm-chap-welcome.html)
* [Redshift Snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html)
* [Redshift Workload Management](https://docs.aws.amazon.com/redshift/latest/mgmt/cm-wlm.html)
* [Redshift Security](https://docs.aws.amazon.com/redshift/latest/mgmt/security.html)

## Mini-Glossary
This mini-glossary defines key terms related to Redshift.

### 1. Cluster Basics
| Term/Concept | Description |
| --- | --- |
| Cluster | Redshift instance |
| Node | Compute/storage unit |
| Leader Node | Query coordinator |
| Compute Node | Data processing |
| Node Type | dc2, ra3, etc. |
| Snapshot | Backup copy |
| Workgroup | Concurrency group |
| Endpoint | Connection URL |

### 2. Operations
| Term/Concept | Description |
| --- | --- |
| create-cluster | Launch cluster |
| describe-cluster | View cluster |
| delete-cluster | Shutdown |
| create-cluster-snapshot | Backup |
| restore-from-cluster-snapshot | Recovery |
| modify-cluster | Resize/upgrade |
| list-clusters | View clusters |
| add-tags | Cost tracking |

### 3. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| DatabaseConnections | Active connections |
| CPUUtilization | Compute usage |
| PercentageDiskSpaceUsed | Storage |
| ClusterStatus | State |
| Endpoint | Connection |
| NodeCount | Nodes |
| MaintenanceTrack | Update track |

### 4. Security
| Term/Concept | Description |
| --- | --- |
| Encryption | Data at rest |
| KMS Key | Encryption key |
| IAM Role | Access control |
| VPC | Private network |
| Publicly Accessible | Public access |
| Enhanced VPC Routing | Secure traffic |
| HSM | Hardware security |
| Kerberos | Authentication |

### 5. Advanced
| Term/Concept | Description |
| --- | --- |
| RA3 Nodes | Managed storage |
| Workgroup | Concurrency |
| Snapshots | Backups |
| PITR | Point-in-time |
| Tags | Cost allocation |
| Maintenance Track | Updates |
| IAM Roles | Access |
| VPC Security Groups | Network |

### 6. Commands
| Term/Concept | Description |
| --- | --- |
| create-cluster | Launch |
| describe-clusters | View |
| create-cluster-snapshot | Backup |
| restore-from-cluster-snapshot | Recovery |
| modify-cluster | Scale |
| list-clusters | View |
| add-tags | Tagging |
| describe-cluster | Inspect |

### 7. Best Practices
| Term/Concept | Description |
| --- | --- |
| RA3 Nodes | Storage scaling |
| Encryption | Security |
| IAM Roles | Access |
| Monitoring | CloudWatch |
| Tagging | Billing |
| Snapshots | Recovery |
| Workgroups | Concurrency |
| Vacuum/Analyze | Performance |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| IAM Role | Permissions |
| VPC | Network access |
| KMS | Encryption |
| Snapshot Failure | Backup issues |
| Throttling | Concurrency |
| Cluster Status | Deployment |
| Endpoint | Connection |
| Maintenance Track | Updates |

