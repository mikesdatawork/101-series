# 101 AWS Glue Commands

## Overview
AWS Glue is a serverless ETL (Extract, Transform, Load) service for data integration, cataloging, and preparation. This cheat sheet covers AWS CLI commands for crawlers, databases, tables, jobs, triggers, workflows, connections, and security. Mastering these commands enables automated data pipelines, data lakes, and ML feature engineering.

## Target Audience
- Data engineers building ETL pipelines
- Data scientists preparing datasets
- DevOps teams managing data lakes
- ML engineers creating feature stores
- Anyone working with big data integration

### 1. Databases and Tables (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-database --database-input '{"Name":"mydb"}' | Create database | Catalog | aws glue create-database --database-input '{"Name":"mydb"}' |
| aws glue get-database --name mydb | View database | Inspect | aws glue get-database --name mydb |
| aws glue list-databases | List databases | View | aws glue list-databases |
| aws glue delete-database --name mydb | Delete database | Cleanup | aws glue delete-database --name mydb |
| aws glue create-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Columns":[{"Name":"id","Type":"int"},{"Name":"name","Type":"string"}],"Location":"s3://mybucket/data/"}}' | Create table | Manual | aws glue create-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Columns":[{"Name":"id","Type":"int"},{"Name":"name","Type":"string"}],"Location":"s3://mybucket/data/"}}' |
| aws glue get-table --database-name mydb --name mytable | View table | Inspect | aws glue get-table --database-name mydb --name mytable |
| aws glue list-tables --database-name mydb | List tables | View | aws glue list-tables --database-name mydb |
| aws glue delete-table --database-name mydb --name mytable | Delete table | Cleanup | aws glue delete-table --database-name mydb --name mytable |
| aws glue update-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Location":"s3://mybucket/newdata/"}}' | Update table | Modify | aws glue update-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Location":"s3://mybucket/newdata/"}}' |
| aws glue get-tables --database-name mydb --expression "name = 'mytable'" | Filter tables | Search | aws glue get-tables --database-name mydb --expression "name = 'mytable'" |
| aws glue batch-get-table --database-name mydb --tables-to-get mytable | Batch get | Multiple | aws glue batch-get-table --database-name mydb --tables-to-get mytable |
| aws glue create-table --database-name mydb --table-input '{"Name":"mytable","PartitionKeys":[{"Name":"year","Type":"int"}]}' | Partitioned table | Partition | aws glue create-table --database-name mydb --table-input '{"Name":"mytable","PartitionKeys":[{"Name":"year","Type":"int"}]}' |

### 2. Crawlers (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"S3Targets":[{"Path":"s3://mybucket/data/"}]}' | Create crawler | Catalog | aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"S3Targets":[{"Path":"s3://mybucket/data/"}]}' |
| aws glue start-crawler --name mycrawler | Run crawler | Scan | aws glue start-crawler --name mycrawler |
| aws glue get-crawler --name mycrawler | View crawler | Inspect | aws glue get-crawler --name mycrawler |
| aws glue list-crawlers | List crawlers | View | aws glue list-crawlers |
| aws glue delete-crawler --name mycrawler | Delete crawler | Cleanup | aws glue delete-crawler --name mycrawler |
| aws glue update-crawler --name mycrawler --database-name newdb | Update database | Change | aws glue update-crawler --name mycrawler --database-name newdb |
| aws glue stop-crawler --name mycrawler | Stop crawler | Cancel | aws glue stop-crawler --name mycrawler |
| aws glue get-crawler-metrics --crawler-name mycrawler | View metrics | Monitor | aws glue get-crawler-metrics --crawler-name mycrawler |
| aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"JdbcTargets":[{"ConnectionName":"myconn","Path":"mydb/mytable"}]}' | JDBC crawler | Relational | aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"JdbcTargets":[{"ConnectionName":"myconn","Path":"mydb/mytable"}]}' |
| aws glue get-crawler-history --name mycrawler | Crawler history | Audit | aws glue get-crawler-history --name mycrawler |

### 3. Jobs (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --default-arguments '{"--TempDir":"s3://mybucket/temp"}' | Create ETL job | ETL | aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --default-arguments '{"--TempDir":"s3://mybucket/temp"}' |
| aws glue start-job-run --job-name myjob | Run job | Execute | aws glue start-job-run --job-name myjob |
| aws glue get-job-run --job-name myjob --run-id runid | View run | Inspect | aws glue get-job-run --job-name myjob --run-id runid |
| aws glue list-jobs | List jobs | View | aws glue list-jobs |
| aws glue delete-job --job-name myjob | Delete job | Cleanup | aws glue delete-job --job-name myjob |
| aws glue update-job --job-name myjob --job-update '{"AllocatedCapacity":10}' | Update capacity | Scale | aws glue update-job --job-name myjob --job-update '{"AllocatedCapacity":10}' |
| aws glue start-job-run --job-name myjob --arguments '{"--input":"s3://mybucket/input","--output":"s3://mybucket/output"}' | Run with args | Parameters | aws glue start-job-run --job-name myjob --arguments '{"--input":"s3://mybucket/input","--output":"s3://mybucket/output"}' |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' | Run status | Monitor | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' |
| aws glue list-job-runs --job-name myjob | List runs | History | aws glue list-job-runs --job-name myjob |
| aws glue batch-get-job-run --job-name myjob --run-ids runid1 runid2 | Batch status | Multiple | aws glue batch-get-job-run --job-name myjob --run-ids runid1 runid2 |
| aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"pythonshell","ScriptLocation":"s3://mybucket/scripts/shell.py"}' --execution-property '{"MaxConcurrentRuns":2}' | Python shell | Small jobs | aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"pythonshell","ScriptLocation":"s3://mybucket/scripts/shell.py"}' --execution-property '{"MaxConcurrentRuns":2}' |
| aws glue get-job --job-name myjob | View job details | Inspect | aws glue get-job --job-name myjob |

### 4. Triggers and Workflows (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-trigger --name mytrigger --type CONDITIONAL --start-on '[{"CrawlState":"SUCCEEDED","CrawlerName":"mycrawler"}]' --actions '[{JobName="myjob"}]' | Trigger on crawler | Workflow | aws glue create-trigger --name mytrigger --type CONDITIONAL --start-on '[{"CrawlState":"SUCCEEDED","CrawlerName":"mycrawler"}]' --actions '[{JobName="myjob"}]' |
| aws glue start-trigger --name mytrigger | Run trigger | Execute | aws glue start-trigger --name mytrigger |
| aws glue get-trigger --name mytrigger | View trigger | Inspect | aws glue get-trigger --name mytrigger |
| aws glue list-triggers | List triggers | View | aws glue list-triggers |
| aws glue delete-trigger --name mytrigger | Delete trigger | Cleanup | aws glue delete-trigger --name mytrigger |
| aws glue create-workflow --name myworkflow | Create workflow | Orchestrate | aws glue create-workflow --name myworkflow |
| aws glue get-workflow --name myworkflow | View workflow | Inspect | aws glue get-workflow --name myworkflow |
| aws glue list-workflows | List workflows | View | aws glue list-workflows |
| aws glue delete-workflow --name myworkflow | Delete workflow | Cleanup | aws glue delete-workflow --name myworkflow |
| aws glue start-workflow-run --name myworkflow | Run workflow | Execute | aws glue start-workflow-run --name myworkflow |

### 5. Connections (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"}}' | Create JDBC connection | Relational | aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"}}' |
| aws glue get-connection --name myconn | View connection | Inspect | aws glue get-connection --name myconn |
| aws glue list-connections | List connections | View | aws glue list-connections |
| aws glue delete-connection --name myconn | Delete connection | Cleanup | aws glue delete-connection --name myconn |
| aws glue update-connection --name myconn --connection-input '{"ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://newhost:3306/db"}}' | Update connection | Change | aws glue update-connection --name myconn --connection-input '{"ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://newhost:3306/db"}}' |
| aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"S3","ConnectionProperties":{"BUCKET":"mybucket"}}' | S3 connection | Storage | aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"S3","ConnectionProperties":{"BUCKET":"mybucket"}}' |
| aws glue get-connection --name myconn --query 'Connection.ConnectionProperties' | Check properties | Verify | aws glue get-connection --name myconn --query 'Connection.ConnectionProperties' |
| aws glue test-connection --connection-name myconn | Test connection | Validate | aws glue test-connection --connection-name myconn |

### 6. Security and Permissions (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue put-resource-policy --policy-in-json file://policy.json | Set resource policy | Security | aws glue put-resource-policy --policy-in-json file://policy.json |
| aws glue get-resource-policy | View policy | Audit | aws glue get-resource-policy |
| aws glue delete-resource-policy | Remove policy | Reset | aws glue delete-resource-policy |
| aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"},"PhysicalConnectionRequirements":{"AvailabilityZone":"us-east-1a","SubnetId":"subnet-123","SecurityGroupIdList":["sg-456"]}}' | VPC connection | Private | aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"},"PhysicalConnectionRequirements":{"AvailabilityZone":"us-east-1a","SubnetId":"subnet-123","SecurityGroupIdList":["sg-456"]}}' |
| aws glue update-connection --name myconn --connection-input '{"PhysicalConnectionRequirements":{"SubnetId":"subnet-789"}}' | Update VPC | Change | aws glue update-connection --name myconn --connection-input '{"PhysicalConnectionRequirements":{"SubnetId":"subnet-789"}}' |
| aws glue get-connection --name myconn --query 'Connection.PhysicalConnectionRequirements' | Check VPC | Verify | aws glue get-connection --name myconn --query 'Connection.PhysicalConnectionRequirements' |
| aws glue put-resource-policy --policy-in-json '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":"*","Action":"glue:*","Resource":"*"}]}' | Public policy | Test | aws glue put-resource-policy --policy-in-json '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":"*","Action":"glue:*","Resource":"*"}]}' |
| aws glue get-resource-policy --query 'PolicyInJson' | View policy | Audit | aws glue get-resource-policy --query 'PolicyInJson' |

### 7. Job Runs and Monitoring (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue get-job-run --job-name myjob --run-id runid | View run | Inspect | aws glue get-job-run --job-name myjob --run-id runid |
| aws glue list-job-runs --job-name myjob | List runs | History | aws glue list-job-runs --job-name myjob |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' | Run status | Monitor | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' |
| aws glue batch-get-job-run --job-name myjob --run-ids runid1 runid2 | Batch status | Multiple | aws glue batch-get-job-run --job-name myjob --run-ids runid1 runid2 |
| aws glue stop-job-run --job-name myjob --run-id runid | Stop run | Cancel | aws glue stop-job-run --job-name myjob --run-id runid |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ErrorMessage' | Error message | Debug | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ErrorMessage' |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ExecutionTime' | Execution time | Performance | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ExecutionTime' |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.AllocatedCapacity' | Capacity used | Monitor | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.AllocatedCapacity' |
| aws glue list-job-runs --job-name myjob --status RUNNING | Active runs | Filter | aws glue list-job-runs --job-name myjob --status RUNNING |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.Completed' | Completion time | Audit | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.Completed' |

### 8. Triggers and Workflows (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-trigger --name mytrigger --type CONDITIONAL --start-on '[{"CrawlState":"SUCCEEDED","CrawlerName":"mycrawler"}]' --actions '[{JobName="myjob"}]' | Trigger on crawler | Workflow | aws glue create-trigger --name mytrigger --type CONDITIONAL --start-on '[{"CrawlState":"SUCCEEDED","CrawlerName":"mycrawler"}]' --actions '[{JobName="myjob"}]' |
| aws glue start-trigger --name mytrigger | Run trigger | Execute | aws glue start-trigger --name mytrigger |
| aws glue get-trigger --name mytrigger | View trigger | Inspect | aws glue get-trigger --name mytrigger |
| aws glue list-triggers | List triggers | View | aws glue list-triggers |
| aws glue delete-trigger --name mytrigger | Delete trigger | Cleanup | aws glue delete-trigger --name mytrigger |
| aws glue create-workflow --name myworkflow | Create workflow | Orchestrate | aws glue create-workflow --name myworkflow |
| aws glue get-workflow --name myworkflow | View workflow | Inspect | aws glue get-workflow --name myworkflow |
| aws glue list-workflows | List workflows | View | aws glue list-workflows |
| aws glue delete-workflow --name myworkflow | Delete workflow | Cleanup | aws glue delete-workflow --name myworkflow |
| aws glue start-workflow-run --name myworkflow | Run workflow | Execute | aws glue start-workflow-run --name myworkflow |

### 9. Security and Encryption (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue put-resource-policy --policy-in-json file://policy.json | Set resource policy | Security | aws glue put-resource-policy --policy-in-json file://policy.json |
| aws glue get-resource-policy | View policy | Audit | aws glue get-resource-policy |
| aws glue delete-resource-policy | Remove policy | Reset | aws glue delete-resource-policy |
| aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"},"PhysicalConnectionRequirements":{"SubnetId":"subnet-123","SecurityGroupIdList":["sg-456"]}}' | VPC connection | Private | aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"},"PhysicalConnectionRequirements":{"SubnetId":"subnet-123","SecurityGroupIdList":["sg-456"]}}' |
| aws glue update-connection --name myconn --connection-input '{"PhysicalConnectionRequirements":{"SubnetId":"subnet-789"}}' | Update VPC | Change | aws glue update-connection --name myconn --connection-input '{"PhysicalConnectionRequirements":{"SubnetId":"subnet-789"}}' |
| aws glue get-connection --name myconn --query 'Connection.PhysicalConnectionRequirements' | Check VPC | Verify | aws glue get-connection --name myconn --query 'Connection.PhysicalConnectionRequirements' |

### 10. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.elapsedTime --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Job duration | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.elapsedTime --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.numInputRecords --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Input records | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.numInputRecords --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' | Run status | Monitor | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' |
| aws glue get-crawler-metrics --crawler-name mycrawler | Crawler metrics | Monitor | aws glue get-crawler-metrics --crawler-name mycrawler |
| aws cloudwatch list-metrics --namespace AWS/Glue --dimensions Name=JobName,Value=myjob | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/Glue --dimensions Name=JobName,Value=myjob |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ErrorMessage' | Error message | Debug | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ErrorMessage' |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ExecutionTime' | Execution time | Performance | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ExecutionTime' |
| aws glue list-job-runs --job-name myjob --status FAILED | Failed runs | Audit | aws glue list-job-runs --job-name myjob --status FAILED |
| aws glue get-workflow-run --name myworkflow --run-id runid | Workflow run | Monitor | aws glue get-workflow-run --name myworkflow --run-id runid |
| aws glue get-workflow-run --name myworkflow --run-id runid --query 'WorkflowRun.Status' | Workflow status | Monitor | aws glue get-workflow-run --name myworkflow --run-id runid --query 'WorkflowRun.Status' |

### 11. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue tag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tags 'Key=Project,Value=DataLake' | Tag job | Billing | aws glue tag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tags 'Key=Project,Value=DataLake' |
| aws glue get-tags --resource-arn arn:aws:glue:region:account:job:myjob | View tags | Check | aws glue get-tags --resource-arn arn:aws:glue:region:account:job:myjob |
| aws glue untag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tag-keys Project | Remove tag | Cleanup | aws glue untag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tag-keys Project |
| aws glue tag-resource --resource-arn arn:aws:glue:region:account:crawler:mycrawler --tags 'Key=Env,Value=Prod' | Tag crawler | Billing | aws glue tag-resource --resource-arn arn:aws:glue:region:account:crawler:mycrawler --tags 'Key=Env,Value=Prod' |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters glue:job | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters glue:job |
| aws glue list-jobs --query 'JobNames[]' | List jobs | Tagging | aws glue list-jobs --query 'JobNames[]' |

### 12. Advanced ETL and Development (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-dev-endpoint --endpoint-name mydev --role-arn arn:aws:iam::account:role/GlueRole --public-key "ssh-rsa AAAAB3NzaC1yc2E..." | Create dev endpoint | Development | aws glue create-dev-endpoint --endpoint-name mydev --role-arn arn:aws:iam::account:role/GlueRole --public-key "ssh-rsa AAAAB3NzaC1yc2E..." |
| aws glue get-dev-endpoint --endpoint-name mydev | View dev endpoint | Inspect | aws glue get-dev-endpoint --endpoint-name mydev |
| aws glue list-dev-endpoints | List dev endpoints | View | aws glue list-dev-endpoints |
| aws glue delete-dev-endpoint --endpoint-name mydev | Delete dev endpoint | Cleanup | aws glue delete-dev-endpoint --endpoint-name mydev |
| aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --connections 'Connections=["myconn"]' | Job with connection | JDBC | aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --connections 'Connections=["myconn"]' |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' | Run status | Monitor | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' |
| aws glue start-job-run --job-name myjob --arguments '{"--extra-py-files":"s3://mybucket/libs/mylib.zip"}' | Extra files | Dependencies | aws glue start-job-run --job-name myjob --arguments '{"--extra-py-files":"s3://mybucket/libs/mylib.zip"}' |
| aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"spark","ScriptLocation":"s3://mybucket/scripts/spark.py"}' --execution-property '{"MaxConcurrentRuns":2}' | Spark job | Advanced | aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"spark","ScriptLocation":"s3://mybucket/scripts/spark.py"}' --execution-property '{"MaxConcurrentRuns":2}' |

### 13. Security and Encryption (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue put-resource-policy --policy-in-json file://policy.json | Set resource policy | Security | aws glue put-resource-policy --policy-in-json file://policy.json |
| aws glue get-resource-policy | View policy | Audit | aws glue get-resource-policy |
| aws glue delete-resource-policy | Remove policy | Reset | aws glue delete-resource-policy |
| aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"},"PhysicalConnectionRequirements":{"SubnetId":"subnet-123","SecurityGroupIdList":["sg-456"]}}' | VPC connection | Private | aws glue create-connection --connection-input '{"Name":"myconn","ConnectionType":"JDBC","ConnectionProperties":{"JDBC_CONNECTION_URL":"jdbc:mysql://host:3306/db","USERNAME":"user","PASSWORD":"pass"},"PhysicalConnectionRequirements":{"SubnetId":"subnet-123","SecurityGroupIdList":["sg-456"]}}' |
| aws glue update-connection --name myconn --connection-input '{"PhysicalConnectionRequirements":{"SubnetId":"subnet-789"}}' | Update VPC | Change | aws glue update-connection --name myconn --connection-input '{"PhysicalConnectionRequirements":{"SubnetId":"subnet-789"}}' |
| aws glue get-connection --name myconn --query 'Connection.PhysicalConnectionRequirements' | Check VPC | Verify | aws glue get-connection --name myconn --query 'Connection.PhysicalConnectionRequirements' |

### 14. Advanced Crawlers and Jobs (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"JdbcTargets":[{"ConnectionName":"myconn","Path":"mydb/%"}]}' | JDBC crawler | Relational | aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"JdbcTargets":[{"ConnectionName":"myconn","Path":"mydb/%"}]}' |
| aws glue update-crawler --name mycrawler --configuration '{"Version":1,"CrawlerOutput":{"Tables":{"AddOrUpdateBehavior":"InheritFromTable","DeleteBehavior":"Delete"}}}' | Update crawler config | Behavior | aws glue update-crawler --name mycrawler --configuration '{"Version":1,"CrawlerOutput":{"Tables":{"AddOrUpdateBehavior":"InheritFromTable","DeleteBehavior":"Delete"}}}' |
| aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --connections 'Connections=["myconn"]' --security-configuration 'mysecurity' | Secure job | Security | aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --connections 'Connections=["myconn"]' --security-configuration 'mysecurity' |
| aws glue create-security-configuration --name mysecurity --encryption-configuration '{"S3Encryption":[{"S3EncryptionMode":"SSE-KMS","KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}]}' | Security config | Encryption | aws glue create-security-configuration --name mysecurity --encryption-configuration '{"S3Encryption":[{"S3EncryptionMode":"SSE-KMS","KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}]}' |
| aws glue get-security-configuration --name mysecurity | View security | Inspect | aws glue get-security-configuration --name mysecurity |
| aws glue list-security-configurations | List security | View | aws glue list-security-configurations |
| aws glue delete-security-configuration --name mysecurity | Delete security | Cleanup | aws glue delete-security-configuration --name mysecurity |
| aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"S3Targets":[{"Path":"s3://mybucket/data/","Exclusions":["*.log"]}]}' | Exclude files | Selective | aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"S3Targets":[{"Path":"s3://mybucket/data/","Exclusions":["*.log"]}]}' |

### 15. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue tag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tags 'Key=Project,Value=DataLake' | Tag job | Billing | aws glue tag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tags 'Key=Project,Value=DataLake' |
| aws glue get-tags --resource-arn arn:aws:glue:region:account:job:myjob | View tags | Check | aws glue get-tags --resource-arn arn:aws:glue:region:account:job:myjob |
| aws glue untag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tag-keys Project | Remove tag | Cleanup | aws glue untag-resource --resource-arn arn:aws:glue:region:account:job:myjob --tag-keys Project |
| aws glue tag-resource --resource-arn arn:aws:glue:region:account:crawler:mycrawler --tags 'Key=Env,Value=Prod' | Tag crawler | Billing | aws glue tag-resource --resource-arn arn:aws:glue:region:account:crawler:mycrawler --tags 'Key=Env,Value=Prod' |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters glue:job | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters glue:job |
| aws glue list-jobs --query 'JobNames[]' | List jobs | Tagging | aws glue list-jobs --query 'JobNames[]' |

### 16. Advanced Monitoring (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.elapsedTime --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Job duration | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.elapsedTime --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.numInputRecords --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Input records | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Glue --metric-name glue.driver.aggregate.numInputRecords --dimensions Name=JobName,Value=myjob --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' | Run status | Monitor | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.JobRunState' |
| aws glue get-crawler-metrics --crawler-name mycrawler | Crawler metrics | Monitor | aws glue get-crawler-metrics --crawler-name mycrawler |
| aws cloudwatch list-metrics --namespace AWS/Glue --dimensions Name=JobName,Value=myjob | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/Glue --dimensions Name=JobName,Value=myjob |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ErrorMessage' | Error message | Debug | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ErrorMessage' |
| aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ExecutionTime' | Execution time | Performance | aws glue get-job-run --job-name myjob --run-id runid --query 'JobRun.ExecutionTime' |
| aws glue list-job-runs --job-name myjob --status FAILED | Failed runs | Audit | aws glue list-job-runs --job-name myjob --status FAILED |

### 17. Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-dev-endpoint --endpoint-name mydev --role-arn arn:aws:iam::account:role/GlueRole --public-key "ssh-rsa AAAAB3NzaC1yc2E..." | Create dev endpoint | Development | aws glue create-dev-endpoint --endpoint-name mydev --role-arn arn:aws:iam::account:role/GlueRole --public-key "ssh-rsa AAAAB3NzaC1yc2E..." |
| aws glue get-dev-endpoint --endpoint-name mydev | View dev endpoint | Inspect | aws glue get-dev-endpoint --endpoint-name mydev |
| aws glue list-dev-endpoints | List dev endpoints | View | aws glue list-dev-endpoints |
| aws glue delete-dev-endpoint --endpoint-name mydev | Delete dev endpoint | Cleanup | aws glue delete-dev-endpoint --endpoint-name mydev |
| aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --connections 'Connections=["myconn"]' --security-configuration 'mysecurity' | Secure job | Security | aws glue create-job --name myjob --role arn:aws:iam::account:role/GlueRole --command '{"Name":"glueetl","ScriptLocation":"s3://mybucket/scripts/etl.py"}' --connections 'Connections=["myconn"]' --security-configuration 'mysecurity' |
| aws glue create-security-configuration --name mysecurity --encryption-configuration '{"S3Encryption":[{"S3EncryptionMode":"SSE-KMS","KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}]}' | Security config | Encryption | aws glue create-security-configuration --name mysecurity --encryption-configuration '{"S3Encryption":[{"S3EncryptionMode":"SSE-KMS","KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}]}' |
| aws glue get-security-configuration --name mysecurity | View security | Inspect | aws glue get-security-configuration --name mysecurity |
| aws glue list-security-configurations | List security | View | aws glue list-security-configurations |
| aws glue delete-security-configuration --name mysecurity | Delete security | Cleanup | aws glue delete-security-configuration --name mysecurity |
| aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"S3Targets":[{"Path":"s3://mybucket/data/","Exclusions":["*.log"]}]}' | Exclude files | Selective | aws glue create-crawler --name mycrawler --role arn:aws:iam::account:role/GlueRole --database-name mydb --targets '{"S3Targets":[{"Path":"s3://mybucket/data/","Exclusions":["*.log"]}]}' |

## Tips and Best Practices
* Use crawlers to automatically discover schema from S3 data.
* Prefer on-demand jobs for unpredictable workloads.
* Enable job bookmarks to process only new data.
* Use connections for secure JDBC access.
* Monitor job runs with CloudWatch metrics.
* Tag resources for cost allocation.
* Use triggers and workflows for orchestration.
* Enable encryption for sensitive data.
* Use Python shell jobs for small tasks.
* Test jobs with development endpoints.
* Clean up old job runs and crawlers.
* Use partitions for large tables.
* Use security configurations for encryption.
* Monitor crawlers for failures.
* Use Glue Studio for visual ETL.

## Additional Resources
* [AWS Glue CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/glue/)
* [Glue Developer Guide](https://docs.aws.amazon.com/glue/latest/dg/what-is-glue.html)
* [Glue Best Practices](https://docs.aws.amazon.com/glue/latest/dg/best-practices.html)
* [Glue Crawlers](https://docs.aws.amazon.com/glue/latest/dg/add-crawler.html)
* [Glue Jobs](https://docs.aws.amazon.com/glue/latest/dg/add-job.html)
* [Glue Workflows](https://docs.aws.amazon.com/glue/latest/dg/workflows.html)
* [Glue Security](https://docs.aws.amazon.com/glue/latest/dg/security.html)
* [Glue Monitoring](https://docs.aws.amazon.com/glue/latest/dg/monitor-glue.html)

## Mini-Glossary
This mini-glossary defines key terms related to AWS Glue.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Database | Catalog container |
| Table | Metadata for data |
| Crawler | Schema discovery |
| Job | ETL execution |
| Trigger | Job scheduler |
| Workflow | Orchestration |
| Connection | Data source link |
| Security Configuration | Encryption settings |

### 2. Operations
| Term/Concept | Description |
| --- | --- |
| create-database | Catalog database |
| create-table | Manual table |
| create-crawler | Schema crawler |
| start-crawler | Run crawler |
| create-job | ETL job |
| start-job-run | Execute job |
| create-trigger | Job trigger |
| create-workflow | Orchestrate |

### 3. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| JobRunState | RUNNING/SUCCEEDED |
| Crawler metrics | Tables added |
| ExecutionTime | Job duration |
| ErrorMessage | Failure reason |
| WorkflowRun | Orchestration run |
| DevEndpoint | Development shell |
| Security Configuration | Encryption |

### 4. Advanced
| Term/Concept | Description |
| --- | --- |
| Bookmarks | Incremental processing |
| Python Shell | Small jobs |
| Spark ETL | Large jobs |
| JDBC Connection | Relational sources |
| S3 Targets | Object storage |
| Partition Keys | Query optimization |
| Lifecycle | Data retention |
| Tags | Cost allocation |

### 5. Configuration
| Term/Concept | Description |
| --- | --- |
| Role ARN | IAM permissions |
| ScriptLocation | ETL script |
| AllocatedCapacity | DPU count |
| MaxConcurrentRuns | Parallel jobs |
| Connections | Data sources |
| Security Configuration | Encryption |
| TempDir | Temporary storage |
| Job Arguments | Parameters |

### 6. Commands
| Term/Concept | Description |
| --- | --- |
| create-database | Catalog |
| create-crawler | Discover |
| start-crawler | Scan |
| create-job | ETL |
| start-job-run | Execute |
| create-trigger | Schedule |
| create-workflow | Orchestrate |
| list-jobs | View |

### 7. Best Practices
| Term/Concept | Description |
| --- | --- |
| Bookmarks | Incremental |
| Triggers | Automation |
| Workflows | Orchestration |
| Security | Encryption |
| Tagging | Billing |
| Monitoring | CloudWatch |
| DevEndpoint | Development |
| Connections | Secure access |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| IAM Role | Permissions |
| Crawler Failure | Schema issues |
| Job Failure | Script errors |
| Throttling | Concurrency |
| VPC | Network access |
| Encryption | KMS keys |
| Bookmarks | State tracking |
| TempDir | Storage errors |

