# 101 AWS Athena Commands

## Overview
Amazon Athena is a serverless interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. This cheat sheet covers AWS CLI commands for databases, tables, queries, workgroups, data catalogs, and monitoring. Mastering these commands enables ad-hoc analytics, data exploration, and BI reporting on S3 data lakes.

## Target Audience
- Data analysts running SQL queries
- Data engineers exploring datasets
- BI teams building reports
- Data scientists analyzing S3 data
- Anyone performing serverless analytics

### 1. Databases and Tables (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-database --name mydb --catalog-id 123456789012 | Create database | Catalog | aws athena create-database --name mydb --catalog-id 123456789012 |
| aws athena list-databases --catalog-id 123456789012 | List databases | View | aws athena list-databases --catalog-id 123456789012 |
| aws athena delete-database --name mydb --catalog-id 123456789012 | Delete database | Cleanup | aws athena delete-database --name mydb --catalog-id 123456789012 |
| aws athena create-table --name mytable --database mydb --catalog-id 123456789012 --table-type EXTERNAL_TABLE --storage-descriptor '{"Columns":[{"Name":"id","Type":"int"},{"Name":"name","Type":"string"}],"Location":"s3://mybucket/data/"}' | Create table | Manual | aws athena create-table --name mytable --database mydb --catalog-id 123456789012 --table-type EXTERNAL_TABLE --storage-descriptor '{"Columns":[{"Name":"id","Type":"int"},{"Name":"name","Type":"string"}],"Location":"s3://mybucket/data/"}' |
| aws athena list-tables --database mydb --catalog-id 123456789012 | List tables | View | aws athena list-tables --database mydb --catalog-id 123456789012 |
| aws athena get-table --name mytable --database mydb --catalog-id 123456789012 | View table | Inspect | aws athena get-table --name mytable --database mydb --catalog-id 123456789012 |
| aws athena delete-table --name mytable --database mydb --catalog-id 123456789012 | Delete table | Cleanup | aws athena delete-table --name mytable --database mydb --catalog-id 123456789012 |
| aws athena update-table --name mytable --database mydb --catalog-id 123456789012 --table-input '{"StorageDescriptor":{"Location":"s3://mybucket/newdata/"}}' | Update table | Modify | aws athena update-table --name mytable --database mydb --catalog-id 123456789012 --table-input '{"StorageDescriptor":{"Location":"s3://mybucket/newdata/"}}' |
| aws athena create-table --name mytable --database mydb --catalog-id 123456789012 --table-type EXTERNAL_TABLE --storage-descriptor '{"Columns":[{"Name":"id","Type":"int"}],"PartitionKeys":[{"Name":"year","Type":"int"}],"Location":"s3://mybucket/data/"}' | Partitioned table | Partition | aws athena create-table --name mytable --database mydb --catalog-id 123456789012 --table-type EXTERNAL_TABLE --storage-descriptor '{"Columns":[{"Name":"id","Type":"int"}],"PartitionKeys":[{"Name":"year","Type":"int"}],"Location":"s3://mybucket/data/"}' |
| aws athena list-tables --database mydb --catalog-id 123456789012 --expression "name = 'mytable'" | Filter tables | Search | aws athena list-tables --database mydb --catalog-id 123456789012 --expression "name = 'mytable'" |
| aws athena batch-get-table --database mydb --catalog-id 123456789012 --names mytable | Batch get | Multiple | aws athena batch-get-table --database mydb --catalog-id 123456789012 --names mytable |
| aws athena create-table --name mytable --database mydb --catalog-id 123456789012 --table-type EXTERNAL_TABLE --storage-descriptor '{"Columns":[{"Name":"id","Type":"int"}],"Location":"s3://mybucket/data/","SerdeInfo":{"SerializationLibrary":"org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"}}' | Parquet table | Format | aws athena create-table --name mytable --database mydb --catalog-id 123456789012 --table-type EXTERNAL_TABLE --storage-descriptor '{"Columns":[{"Name":"id","Type":"int"}],"Location":"s3://mybucket/data/","SerdeInfo":{"SerializationLibrary":"org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"}}' |

### 2. Query Execution (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ | Run query | Ad-hoc | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena get-query-execution --query-execution-id qid | View query | Inspect | aws athena get-query-execution --query-execution-id qid |
| aws athena get-query-results --query-execution-id qid | Get results | Retrieve | aws athena get-query-results --query-execution-id qid |
| aws athena list-query-executions | List queries | View | aws athena list-query-executions |
| aws athena stop-query-execution --query-execution-id qid | Stop query | Cancel | aws athena stop-query-execution --query-execution-id qid |
| aws athena start-query-execution --query-string "SELECT COUNT(*) FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ | Count query | Aggregate | aws athena start-query-execution --query-string "SELECT COUNT(*) FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Status.State' | Query status | Monitor | aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Status.State' |
| aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable AS SELECT * FROM mydb.mytable" | CTAS query | Create | aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable AS SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Statistics.DataScannedInBytes' | Data scanned | Cost | aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Statistics.DataScannedInBytes' |
| aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" | Repair partitions | Update | aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |

### 3. Workgroups (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/}' | Create workgroup | Config | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/}' |
| aws athena describe-workgroup --workgroup-name myworkgroup | View workgroup | Inspect | aws athena describe-workgroup --workgroup-name myworkgroup |
| aws athena list-workgroups | List workgroups | View | aws athena list-workgroups |
| aws athena delete-workgroup --workgroup-name myworkgroup | Delete workgroup | Cleanup | aws athena delete-workgroup --workgroup-name myworkgroup |
| aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/newresults/}' | Update workgroup | Change | aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/newresults/}' |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup | Run in workgroup | Specific | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup |
| aws athena list-workgroups --workgroup-name-prefix my | Filter workgroups | Search | aws athena list-workgroups --workgroup-name-prefix my |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.ResultConfiguration.OutputLocation' | Output location | Check | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.ResultConfiguration.OutputLocation' |

### 4. Data Catalog and Glue Integration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws glue create-database --database-input '{"Name":"mydb"}' --catalog-id 123456789012 | Glue database | Catalog | aws glue create-database --database-input '{"Name":"mydb"}' --catalog-id 123456789012 |
| aws glue create-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Columns":[{"Name":"id","Type":"int"}],"Location":"s3://mybucket/data/"}}' --catalog-id 123456789012 | Glue table | Metadata | aws glue create-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Columns":[{"Name":"id","Type":"int"}],"Location":"s3://mybucket/data/"}}' --catalog-id 123456789012 |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 | Use Glue catalog | Query | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 |
| aws glue get-table --database-name mydb --name mytable --catalog-id 123456789012 | View Glue table | Inspect | aws glue get-table --database-name mydb --name mytable --catalog-id 123456789012 |
| aws glue update-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Location":"s3://mybucket/newdata/"}}' --catalog-id 123456789012 | Update Glue table | Modify | aws glue update-table --database-name mydb --table-input '{"Name":"mytable","StorageDescriptor":{"Location":"s3://mybucket/newdata/"}}' --catalog-id 123456789012 |
| aws glue delete-table --database-name mydb --name mytable --catalog-id 123456789012 | Delete Glue table | Cleanup | aws glue delete-table --database-name mydb --name mytable --catalog-id 123456789012 |
| aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 | Repair partitions | Update | aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 |
| aws glue list-tables --database-name mydb --catalog-id 123456789012 | List Glue tables | View | aws glue list-tables --database-name mydb --catalog-id 123456789012 |

### 5. Named Queries (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup | Create named query | Save | aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup |
| aws athena get-named-query --named-query-id qid | View named query | Inspect | aws athena get-named-query --named-query-id qid |
| aws athena list-named-queries | List named queries | View | aws athena list-named-queries |
| aws athena delete-named-query --named-query-id qid | Delete named query | Cleanup | aws athena delete-named-query --named-query-id qid |
| aws athena start-query-execution --named-query-id qid | Run named query | Execute | aws athena start-query-execution --named-query-id qid |
| aws athena update-named-query --named-query-id qid --name newname --query-string "SELECT COUNT(*) FROM mytable" | Update named query | Modify | aws athena update-named-query --named-query-id qid --name newname --query-string "SELECT COUNT(*) FROM mytable" |

### 6. Workgroup Configuration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/}' | Create workgroup | Config | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/}' |
| aws athena describe-workgroup --workgroup-name myworkgroup | View workgroup | Inspect | aws athena describe-workgroup --workgroup-name myworkgroup |
| aws athena list-workgroups | List workgroups | View | aws athena list-workgroups |
| aws athena delete-workgroup --workgroup-name myworkgroup | Delete workgroup | Cleanup | aws athena delete-workgroup --workgroup-name myworkgroup |
| aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/newresults/}' | Update workgroup | Change | aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/newresults/}' |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup | Run in workgroup | Specific | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup |
| aws athena list-workgroups --workgroup-name-prefix my | Filter workgroups | Search | aws athena list-workgroups --workgroup-name-prefix my |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.ResultConfiguration.OutputLocation' | Output location | Check | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.ResultConfiguration.OutputLocation' |

### 7. Saved Queries and History (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup | Save query | Reuse | aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup |
| aws athena list-named-queries --workgroup myworkgroup | List saved | View | aws athena list-named-queries --workgroup myworkgroup |
| aws athena get-named-query --named-query-id qid | View saved | Inspect | aws athena get-named-query --named-query-id qid |
| aws athena delete-named-query --named-query-id qid | Delete saved | Cleanup | aws athena delete-named-query --named-query-id qid |
| aws athena list-query-executions --workgroup myworkgroup | Query history | Audit | aws athena list-query-executions --workgroup myworkgroup |
| aws athena start-query-execution --named-query-id qid --workgroup myworkgroup | Run saved | Execute | aws athena start-query-execution --named-query-id qid --workgroup myworkgroup |

### 8. Security and Access Control (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},BytesScannedCutoffValue=1073741824' | Cutoff limit | Cost | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},BytesScannedCutoffValue=1073741824' |
| aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'BytesScannedCutoffValue=536870912' | Update cutoff | Control | aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'BytesScannedCutoffValue=536870912' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.BytesScannedCutoffValue' | Check cutoff | Verify | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.BytesScannedCutoffValue' |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},EncryptionConfiguration={EncryptionOption=SSE_KMS,KmsKeyId=keyid}' | KMS encryption | Security | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},EncryptionConfiguration={EncryptionOption=SSE_KMS,KmsKeyId=keyid}' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.EncryptionConfiguration' | Check encryption | Audit | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.EncryptionConfiguration' |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --workgroup myworkgroup | Secure workgroup | Run | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --workgroup myworkgroup |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},PublishCloudWatchMetricsEnabled=true' | CloudWatch metrics | Monitoring | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},PublishCloudWatchMetricsEnabled=true' |
| aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'PublishCloudWatchMetricsEnabled=true' | Enable metrics | Monitor | aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'PublishCloudWatchMetricsEnabled=true' |

### 9. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/Athena --metric-name ProcessedBytes --dimensions Name=WorkGroupName,Value=myworkgroup --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Data scanned | Cost | aws cloudwatch get-metric-statistics --namespace AWS/Athena --metric-name ProcessedBytes --dimensions Name=WorkGroupName,Value=myworkgroup --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/Athena --metric-name QueryExecutionTime --dimensions Name=WorkGroupName,Value=myworkgroup --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Query time | Performance | aws cloudwatch get-metric-statistics --namespace AWS/Athena --metric-name QueryExecutionTime --dimensions Name=WorkGroupName,Value=myworkgroup --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch list-metrics --namespace AWS/Athena --dimensions Name=WorkGroupName,Value=myworkgroup | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/Athena --dimensions Name=WorkGroupName,Value=myworkgroup |
| aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Statistics.DataScannedInBytes' | Data scanned | Cost | aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Statistics.DataScannedInBytes' |
| aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Statistics.EngineExecutionTimeInMillis' | Execution time | Performance | aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Statistics.EngineExecutionTimeInMillis' |
| aws athena list-query-executions --workgroup myworkgroup --status-filter FAILED | Failed queries | Audit | aws athena list-query-executions --workgroup myworkgroup --status-filter FAILED |
| aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Status.State' | Query status | Monitor | aws athena get-query-execution --query-execution-id qid --query 'QueryExecution.Status.State' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.PublishCloudWatchMetricsEnabled' | Metrics enabled | Check | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.PublishCloudWatchMetricsEnabled' |
| aws cloudwatch get-metric-statistics --namespace AWS/Athena --metric-name FailedQueryCount --dimensions Name=WorkGroupName,Value=myworkgroup --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Failed queries | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Athena --metric-name FailedQueryCount --dimensions Name=WorkGroupName,Value=myworkgroup --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws athena list-query-executions --workgroup myworkgroup --start-date 2025-01-01T00:00:00Z --end-date 2025-01-02T00:00:00Z | Date range | Audit | aws athena list-query-executions --workgroup myworkgroup --start-date 2025-01-01T00:00:00Z --end-date 2025-01-02T00:00:00Z |

### 10. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena tag-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup --tags 'Key=Project,Value=Analytics' | Tag workgroup | Billing | aws athena tag-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup --tags 'Key=Project,Value=Analytics' |
| aws athena list-tags-for-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup | View tags | Check | aws athena list-tags-for-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup |
| aws athena untag-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup --tag-keys Project | Remove tag | Cleanup | aws athena untag-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup --tag-keys Project |
| aws athena tag-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup --tags 'Key=Env,Value=Prod' | Environment tag | Billing | aws athena tag-resource --resource-arn arn:aws:athena:region:account:workgroup/myworkgroup --tags 'Key=Env,Value=Prod' |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=Analytics' --resource-type-filters athena:workgroup | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=Analytics' --resource-type-filters athena:workgroup |
| aws athena list-workgroups --query 'WorkGroups[].Name' | List workgroups | Tagging | aws athena list-workgroups --query 'WorkGroups[].Name' |

### 11. Saved Queries and History (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup | Save query | Reuse | aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup |
| aws athena list-named-queries --workgroup myworkgroup | List saved | View | aws athena list-named-queries --workgroup myworkgroup |
| aws athena get-named-query --named-query-id qid | View saved | Inspect | aws athena get-named-query --named-query-id qid |
| aws athena delete-named-query --named-query-id qid | Delete saved | Cleanup | aws athena delete-named-query --named-query-id qid |
| aws athena list-query-executions --workgroup myworkgroup | Query history | Audit | aws athena list-query-executions --workgroup myworkgroup |
| aws athena start-query-execution --named-query-id qid --workgroup myworkgroup | Run saved | Execute | aws athena start-query-execution --named-query-id qid --workgroup myworkgroup |

### 12. Advanced Query Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable WITH (format='PARQUET',external_location='s3://mybucket/newtable/') AS SELECT * FROM mydb.mytable" | CTAS | Create | aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable WITH (format='PARQUET',external_location='s3://mybucket/newtable/') AS SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" | Repair partitions | Update | aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "ALTER TABLE mydb.mytable ADD IF NOT EXISTS PARTITION (year=2025)" | Add partition | Update | aws athena start-query-execution --query-string "ALTER TABLE mydb.mytable ADD IF NOT EXISTS PARTITION (year=2025)" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "DROP TABLE mydb.mytable" | Drop table | Cleanup | aws athena start-query-execution --query-string "DROP TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "SHOW TABLES IN mydb" | Show tables | Explore | aws athena start-query-execution --query-string "SHOW TABLES IN mydb" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "DESCRIBE mydb.mytable" | Describe table | Inspect | aws athena start-query-execution --query-string "DESCRIBE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable LIMIT 10" | Sample data | Explore | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable LIMIT 10" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "CREATE VIEW mydb.myview AS SELECT * FROM mydb.mytable WHERE year = 2025" | Create view | Simplify | aws athena start-query-execution --query-string "CREATE VIEW mydb.myview AS SELECT * FROM mydb.mytable WHERE year = 2025" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |

### 13. Cost Control and Limits (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},BytesScannedCutoffValue=1073741824' | Cutoff limit | Cost | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},BytesScannedCutoffValue=1073741824' |
| aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'BytesScannedCutoffValue=536870912' | Update cutoff | Control | aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'BytesScannedCutoffValue=536870912' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.BytesScannedCutoffValue' | Check cutoff | Verify | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.BytesScannedCutoffValue' |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},EncryptionConfiguration={EncryptionOption=SSE_KMS,KmsKeyId=keyid}' | KMS encryption | Security | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},EncryptionConfiguration={EncryptionOption=SSE_KMS,KmsKeyId=keyid}' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.EncryptionConfiguration' | Check encryption | Audit | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.EncryptionConfiguration' |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup | Secure workgroup | Run | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup |

### 14. Advanced Query Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable WITH (format='PARQUET',external_location='s3://mybucket/newtable/') AS SELECT * FROM mydb.mytable" | CTAS | Create | aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable WITH (format='PARQUET',external_location='s3://mybucket/newtable/') AS SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" | Repair partitions | Update | aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "ALTER TABLE mydb.mytable ADD IF NOT EXISTS PARTITION (year=2025)" | Add partition | Update | aws athena start-query-execution --query-string "ALTER TABLE mydb.mytable ADD IF NOT EXISTS PARTITION (year=2025)" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "DROP TABLE mydb.mytable" | Drop table | Cleanup | aws athena start-query-execution --query-string "DROP TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "SHOW TABLES IN mydb" | Show tables | Explore | aws athena start-query-execution --query-string "SHOW TABLES IN mydb" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "DESCRIBE mydb.mytable" | Describe table | Inspect | aws athena start-query-execution --query-string "DESCRIBE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable LIMIT 10" | Sample data | Explore | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable LIMIT 10" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "CREATE VIEW mydb.myview AS SELECT * FROM mydb.mytable WHERE year = 2025" | Create view | Simplify | aws athena start-query-execution --query-string "CREATE VIEW mydb.myview AS SELECT * FROM mydb.mytable WHERE year = 2025" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |

### 15. Cost Control and Limits (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},BytesScannedCutoffValue=1073741824' | Cutoff limit | Cost | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},BytesScannedCutoffValue=1073741824' |
| aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'BytesScannedCutoffValue=536870912' | Update cutoff | Control | aws athena update-workgroup --workgroup-name myworkgroup --configuration-updates 'BytesScannedCutoffValue=536870912' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.BytesScannedCutoffValue' | Check cutoff | Verify | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.BytesScannedCutoffValue' |
| aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},EncryptionConfiguration={EncryptionOption=SSE_KMS,KmsKeyId=keyid}' | KMS encryption | Security | aws athena create-workgroup --name myworkgroup --configuration 'EnforceWorkgroupConfiguration=true,ResultConfiguration={OutputLocation=s3://mybucket/results/},EncryptionConfiguration={EncryptionOption=SSE_KMS,KmsKeyId=keyid}' |
| aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.EncryptionConfiguration' | Check encryption | Audit | aws athena describe-workgroup --workgroup-name myworkgroup --query 'WorkGroup.Configuration.EncryptionConfiguration' |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup | Secure workgroup | Run | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable" --workgroup myworkgroup |

### 16. Saved Queries and History (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup | Save query | Reuse | aws athena create-named-query --name myquery --database mydb --query-string "SELECT * FROM mytable" --workgroup myworkgroup |
| aws athena list-named-queries --workgroup myworkgroup | List saved | View | aws athena list-named-queries --workgroup myworkgroup |
| aws athena get-named-query --named-query-id qid | View saved | Inspect | aws athena get-named-query --named-query-id qid |
| aws athena delete-named-query --named-query-id qid | Delete saved | Cleanup | aws athena delete-named-query --named-query-id qid |
| aws athena list-query-executions --workgroup myworkgroup | Query history | Audit | aws athena list-query-executions --workgroup myworkgroup |
| aws athena start-query-execution --named-query-id qid --workgroup myworkgroup | Run saved | Execute | aws athena start-query-execution --named-query-id qid --workgroup myworkgroup |

### 17. Advanced Query Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable WITH (format='PARQUET',external_location='s3://mybucket/newtable/') AS SELECT * FROM mydb.mytable" | CTAS | Create | aws athena start-query-execution --query-string "CREATE TABLE mydb.newtable WITH (format='PARQUET',external_location='s3://mybucket/newtable/') AS SELECT * FROM mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" | Repair partitions | Update | aws athena start-query-execution --query-string "MSCK REPAIR TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "ALTER TABLE mydb.mytable ADD IF NOT EXISTS PARTITION (year=2025)" | Add partition | Update | aws athena start-query-execution --query-string "ALTER TABLE mydb.mytable ADD IF NOT EXISTS PARTITION (year=2025)" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "DROP TABLE mydb.mytable" | Drop table | Cleanup | aws athena start-query-execution --query-string "DROP TABLE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "SHOW TABLES IN mydb" | Show tables | Explore | aws athena start-query-execution --query-string "SHOW TABLES IN mydb" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "DESCRIBE mydb.mytable" | Describe table | Inspect | aws athena start-query-execution --query-string "DESCRIBE mydb.mytable" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable LIMIT 10" | Sample data | Explore | aws athena start-query-execution --query-string "SELECT * FROM mydb.mytable LIMIT 10" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |
| aws athena start-query-execution --query-string "CREATE VIEW mydb.myview AS SELECT * FROM mydb.mytable WHERE year = 2025" | Create view | Simplify | aws athena start-query-execution --query-string "CREATE VIEW mydb.myview AS SELECT * FROM mydb.mytable WHERE year = 2025" --query-execution-context Database=mydb,CatalogId=123456789012 --result-configuration OutputLocation=s3://mybucket/results/ |

## Tips and Best Practices
* Use CTAS for creating optimized tables (Parquet/ORC).
* Run MSCK REPAIR TABLE after adding partitions.
* Use workgroups to separate environments and control costs.
* Enable bytes scanned cutoff to prevent runaway queries.
* Use named queries for reusable reports.
* Partition tables for better performance and cost.
* Use S3 output for query results.
* Monitor data scanned with CloudWatch.
* Tag workgroups for cost allocation.
* Use federated queries for cross-service data.
* Keep tables partitioned and compacted.
* Use views for simplified queries.
* Enable encryption for results.
* Use workgroup-specific output locations.
* Regularly clean up old query results.

## Additional Resources
* [AWS Athena CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/athena/)
* [Athena Developer Guide](https://docs.aws.amazon.com/athena/latest/ug/what-is.html)
* [Athena Best Practices](https://docs.aws.amazon.com/athena/latest/ug/best-practices.html)
* [Athena Workgroups](https://docs.aws.amazon.com/athena/latest/ug/workgroups.html)
* [Athena Query Execution](https://docs.aws.amazon.com/athena/latest/ug/querying.html)
* [Athena Monitoring](https://docs.aws.amazon.com/athena/latest/ug/monitoring.html)
* [Athena Cost Control](https://docs.aws.amazon.com/athena/latest/ug/cost-control.html)

## Mini-Glossary
This mini-glossary defines key terms related to Athena.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Database | Catalog container |
| Table | Metadata for S3 data |
| Query Execution | SQL run |
| Workgroup | Query settings |
| Named Query | Saved SQL |
| CTAS | Create table as select |
| MSCK REPAIR | Partition discovery |
| Bytes Scanned | Cost driver |

### 2. Operations
| Term/Concept | Description |
| --- | --- |
| create-database | Catalog database |
| create-table | Manual table |
| start-query-execution | Run SQL |
| get-query-execution | View query |
| get-query-results | Retrieve data |
| list-query-executions | History |
| create-named-query | Save SQL |
| list-named-queries | View saved |

### 3. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| ProcessedBytes | Data scanned |
| QueryExecutionTime | Runtime |
| FailedQueryCount | Errors |
| WorkgroupName | Query group |
| QueryExecutionId | Unique ID |
| Status.State | Query state |
| Statistics | Query stats |

### 4. Advanced
| Term/Concept | Description |
| --- | --- |
| Workgroup | Settings group |
| BytesScannedCutoff | Cost limit |
| EncryptionConfiguration | Result encryption |
| PublishCloudWatchMetrics | Monitoring |
| Named Query | Reusable SQL |
| CTAS | Optimized table |
| MSCK REPAIR | Partition sync |
| Federated Query | Cross-service |

### 5. Configuration
| Term/Concept | Description |
| --- | --- |
| OutputLocation | S3 results path |
| EnforceWorkgroupConfiguration | Lock settings |
| BytesScannedCutoffValue | Query limit |
| EncryptionOption | SSE-S3/KMS |
| WorkgroupName | Query context |
| CatalogId | Glue catalog |
| Database | Query database |
| Tags | Cost allocation |

### 6. Commands
| Term/Concept | Description |
| --- | --- |
| start-query-execution | Run SQL |
| get-query-execution | Status |
| get-query-results | Data |
| create-workgroup | Settings |
| create-named-query | Save |
| list-query-executions | History |
| describe-workgroup | Config |
| delete-workgroup | Cleanup |

### 7. Best Practices
| Term/Concept | Description |
| --- | --- |
| Partitioning | Performance |
| CTAS | Optimization |
| Workgroups | Separation |
| Cutoff Limit | Cost control |
| Named Queries | Reuse |
| Encryption | Security |
| Tagging | Billing |
| Monitoring | CloudWatch |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| IAM Role | Permissions |
| S3 Access | Bucket policy |
| Partitioning | Missing partitions |
| Workgroup | Configuration |
| Encryption | KMS keys |
| Query Failure | Syntax |
| Cost | Data scanned |
| Limits | Concurrency |

