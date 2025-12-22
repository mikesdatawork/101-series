# 101 AWS DynamoDB Commands

## Overview
Amazon DynamoDB is a fully managed NoSQL database offering single-digit millisecond performance at any scale. This cheat sheet covers AWS CLI commands for table creation, data operations, indexes, streams, backups, global tables, capacity management, and monitoring. Mastering these commands enables fast, scalable data access for applications, feature stores, and metadata.

## Target Audience
- Developers building serverless apps
- Data engineers managing feature stores
- ML engineers storing metadata
- Backend engineers needing NoSQL
- Anyone using high-performance databases

### 1. Table Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --billing-mode PAY_PER_REQUEST | Create table | On-demand | aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --billing-mode PAY_PER_REQUEST |
| aws dynamodb describe-table --table-name mytable | View table details | Inspect | aws dynamodb describe-table --table-name mytable |
| aws dynamodb delete-table --table-name mytable | Delete table | Cleanup | aws dynamodb delete-table --table-name mytable |
| aws dynamodb list-tables | List all tables | View | aws dynamodb list-tables |
| aws dynamodb update-table --table-name mytable --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 | Update capacity | Provisioned | aws dynamodb update-table --table-name mytable --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 |
| aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S AttributeName=Category,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH AttributeName=Category,KeyType=RANGE --billing-mode PAY_PER_REQUEST | Composite key | Sort key | aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S AttributeName=Category,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH AttributeName=Category,KeyType=RANGE --billing-mode PAY_PER_REQUEST |
| aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Update={IndexName=CategoryIndex,ProvisionedThroughput={ReadCapacityUnits=10,WriteCapacityUnits=10}}}]' | Update GSI | Capacity | aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Update={IndexName=CategoryIndex,ProvisionedThroughput={ReadCapacityUnits=10,WriteCapacityUnits=10}}}]' |
| aws dynamodb describe-table --table-name mytable --query 'Table.TableStatus' | Check status | Monitor | aws dynamodb describe-table --table-name mytable --query 'Table.TableStatus' |
| aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES | Enable streams | CDC | aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES |
| aws dynamodb update-table --table-name mytable --sse-specification Enabled=true,SSEType=KMS | Enable encryption | Security | aws dynamodb update-table --table-name mytable --sse-specification Enabled=true,SSEType=KMS |
| aws dynamodb list-tables --region us-east-1 | List by region | Multi-region | aws dynamodb list-tables --region us-east-1 |
| aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --billing-mode PAY_PER_REQUEST --tags Key=Project,Value=DataLake | Tagged table | Billing | aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --billing-mode PAY_PER_REQUEST --tags Key=Project,Value=DataLake |

### 2. Data Operations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb put-item --table-name mytable --item '{"Id":{"S":"1"},"Name":{"S":"Alice"},"Age":{"N":"30"}}' | Put item | Insert | aws dynamodb put-item --table-name mytable --item '{"Id":{"S":"1"},"Name":{"S":"Alice"},"Age":{"N":"30"}}' |
| aws dynamodb get-item --table-name mytable --key '{"Id":{"S":"1"}}' | Get item | Read | aws dynamodb get-item --table-name mytable --key '{"Id":{"S":"1"}}' |
| aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "SET Age = :age" --expression-attribute-values '{":age":{"N":"31"}}' | Update item | Modify | aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "SET Age = :age" --expression-attribute-values '{":age":{"N":"31"}}' |
| aws dynamodb delete-item --table-name mytable --key '{"Id":{"S":"1"}}' | Delete item | Remove | aws dynamodb delete-item --table-name mytable --key '{"Id":{"S":"1"}}' |
| aws dynamodb scan --table-name mytable | Scan table | Full scan | aws dynamodb scan --table-name mytable |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --expression-attribute-values '{":id":{"S":"1"}}' | Query by key | Fast read | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --expression-attribute-values '{":id":{"S":"1"}}' |
| aws dynamodb batch-write-item --request-items '{"mytable":[{"PutRequest":{"Item":{"Id":{"S":"2"},"Name":{"S":"Bob"}}}},{"PutRequest":{"Item":{"Id":{"S":"3"},"Name":{"S":"Charlie"}}}}]}' | Batch write | Bulk insert | aws dynamodb batch-write-item --request-items '{"mytable":[{"PutRequest":{"Item":{"Id":{"S":"2"},"Name":{"S":"Bob"}}}},{"PutRequest":{"Item":{"Id":{"S":"3"},"Name":{"S":"Charlie"}}}}]}' |
| aws dynamodb batch-get-item --request-items '{"mytable":{"Keys":[{"Id":{"S":"1"}},{"Id":{"S":"2"}}]}}' | Batch read | Bulk get | aws dynamodb batch-get-item --request-items '{"mytable":{"Keys":[{"Id":{"S":"1"}},{"Id":{"S":"2"}}]}}' |
| aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "ADD Score :val" --expression-attribute-values '{":val":{"N":"10"}}' | Atomic update | Counter | aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "ADD Score :val" --expression-attribute-values '{":val":{"N":"10"}}' |
| aws dynamodb delete-item --table-name mytable --key '{"Id":{"S":"1"}}' --return-values ALL_OLD | Delete with return | Audit | aws dynamodb delete-item --table-name mytable --key '{"Id":{"S":"1"}}' --return-values ALL_OLD |
| aws dynamodb scan --table-name mytable --filter-expression "Age > :age" --expression-attribute-values '{":age":{"N":"25"}}' | Filtered scan | Query | aws dynamodb scan --table-name mytable --filter-expression "Age > :age" --expression-attribute-values '{":age":{"N":"25"}}' |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --projection-expression "Name,Age" | Projection | Selective | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --projection-expression "Name,Age" |

### 3. Indexes (GSI/LSI) (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb update-table --table-name mytable --attribute-definitions AttributeName=Category,AttributeType=S --global-secondary-index-updates '[{Create={IndexName=CategoryIndex,KeySchema=[{AttributeName=Category,KeyType=HASH}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=5}}}]' | Create GSI | Query | aws dynamodb update-table --table-name mytable --attribute-definitions AttributeName=Category,AttributeType=S --global-secondary-index-updates '[{Create={IndexName=CategoryIndex,KeySchema=[{AttributeName=Category,KeyType=HASH}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=5}}}]' |
| aws dynamodb describe-table --table-name mytable --query 'Table.GlobalSecondaryIndexes' | View GSIs | Check | aws dynamodb describe-table --table-name mytable --query 'Table.GlobalSecondaryIndexes' |
| aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Delete={IndexName=CategoryIndex}}]' | Delete GSI | Cleanup | aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Delete={IndexName=CategoryIndex}}]' |
| aws dynamodb query --table-name mytable --index-name CategoryIndex --key-condition-expression "Category = :cat" --expression-attribute-values '{":cat":{"S":"Books"}}' | Query GSI | Fast | aws dynamodb query --table-name mytable --index-name CategoryIndex --key-condition-expression "Category = :cat" --expression-attribute-values '{":cat":{"S":"Books"}}' |
| aws dynamodb update-table --table-name mytable --attribute-definitions AttributeName=CreatedAt,AttributeType=N --local-secondary-index-updates '[{Create={IndexName=CreatedAtIndex,KeySchema=[{AttributeName=Id,KeyType=HASH},{AttributeName=CreatedAt,KeyType=RANGE}],Projection={ProjectionType=ALL}}}]' | Create LSI | Sort | aws dynamodb update-table --table-name mytable --attribute-definitions AttributeName=CreatedAt,AttributeType=N --local-secondary-index-updates '[{Create={IndexName=CreatedAtIndex,KeySchema=[{AttributeName=Id,KeyType=HASH},{AttributeName=CreatedAt,KeyType=RANGE}],Projection={ProjectionType=ALL}}}]' |
| aws dynamodb query --table-name mytable --index-name CreatedAtIndex --key-condition-expression "Id = :id" --expression-attribute-values '{":id":{"S":"1"}}' | Query LSI | Sort | aws dynamodb query --table-name mytable --index-name CreatedAtIndex --key-condition-expression "Id = :id" --expression-attribute-values '{":id":{"S":"1"}}' |
| aws dynamodb describe-table --table-name mytable --query 'Table.LocalSecondaryIndexes' | View LSIs | Check | aws dynamodb describe-table --table-name mytable --query 'Table.LocalSecondaryIndexes' |
| aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Update={IndexName=CategoryIndex,ProvisionedThroughput={ReadCapacityUnits=10,WriteCapacityUnits=10}}}]' | Update GSI capacity | Tune | aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Update={IndexName=CategoryIndex,ProvisionedThroughput={ReadCapacityUnits=10,WriteCapacityUnits=10}}}]' |

### 4. Streams (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb describe-table --table-name mytable --query 'Table.StreamSpecification' | Check stream | Verify | aws dynamodb describe-table --table-name mytable --query 'Table.StreamSpecification' |
| aws dynamodb update-table --table-name mytable --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES | Enable stream | CDC | aws dynamodb update-table --table-name mytable --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES |
| aws dynamodb describe-stream --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 | View stream | Details | aws dynamodb describe-stream --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 |
| aws dynamodb list-streams --table-name mytable | List streams | Check | aws dynamodb list-streams --table-name mytable |
| aws dynamodb get-shard-iterator --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 --shard-id shardId --shard-iterator-type LATEST | Shard iterator | Consume | aws dynamodb get-shard-iterator --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 --shard-id shardId --shard-iterator-type LATEST |
| aws dynamodb get-records --shard-iterator iterator | Get records | Read stream | aws dynamodb get-records --shard-iterator iterator |
| aws dynamodb update-table --table-name mytable --stream-specification StreamEnabled=false | Disable stream | Cleanup | aws dynamodb update-table --table-name mytable --stream-specification StreamEnabled=false |
| aws dynamodb describe-table --table-name mytable --query 'Table.LatestStreamArn' | Latest stream ARN | Trigger | aws dynamodb describe-table --table-name mytable --query 'Table.LatestStreamArn' |

### 5. Backups and Point-in-Time Recovery (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb create-backup --table-name mytable --backup-name mybackup | Manual backup | Snapshot | aws dynamodb create-backup --table-name mytable --backup-name mybackup |
| aws dynamodb list-backups --table-name mytable | List backups | View | aws dynamodb list-backups --table-name mytable |
| aws dynamodb describe-backup --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid | View backup | Details | aws dynamodb describe-backup --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid |
| aws dynamodb delete-backup --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid | Delete backup | Cleanup | aws dynamodb delete-backup --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid |
| aws dynamodb restore-table-from-backup --target-table-name restored --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid | Restore from backup | Recovery | aws dynamodb restore-table-from-backup --target-table-name restored --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid |
| aws dynamodb update-table --table-name mytable --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true | Enable PITR | Recovery | aws dynamodb update-table --table-name mytable --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true |
| aws dynamodb describe-continuous-backups --table-name mytable | Check PITR | Verify | aws dynamodb describe-continuous-backups --table-name mytable |
| aws dynamodb restore-table-to-point-in-time --target-table-name restored --source-table-name mytable --restore-date-time 2025-01-01T12:00:00Z | PITR restore | Recovery | aws dynamodb restore-table-to-point-in-time --target-table-name restored --source-table-name mytable --restore-date-time 2025-01-01T12:00:00Z |

### 6. Global Tables (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb create-global-table --global-table-name myglobal --replica-regions RegionName=us-east-1,ReplicaRegionName=us-west-2 | Create global | Multi-region | aws dynamodb create-global-table --global-table-name myglobal --replica-regions RegionName=us-east-1,ReplicaRegionName=us-west-2 |
| aws dynamodb describe-global-table --global-table-name myglobal | View global | Check | aws dynamodb describe-global-table --global-table-name myglobal |
| aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Create={RegionName=us-east-2}}]' | Add region | Scale | aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Create={RegionName=us-east-2}}]' |
| aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Delete={RegionName=us-west-2}}]' | Remove region | Cleanup | aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Delete={RegionName=us-west-2}}]' |
| aws dynamodb list-global-tables | List global tables | View | aws dynamodb list-global-tables |
| aws dynamodb describe-global-table --global-table-name myglobal --query 'GlobalTableDescription.GlobalTableStatus' | Status | Monitor | aws dynamodb describe-global-table --global-table-name myglobal --query 'GlobalTableDescription.GlobalTableStatus' |
| aws dynamodb update-table --table-name mytable --replica-updates '[{Create={RegionName=us-west-2}}]' | Enable replication | Global | aws dynamodb update-table --table-name mytable --replica-updates '[{Create={RegionName=us-west-2}}]' |
| aws dynamodb update-table --table-name mytable --replica-updates '[{Delete={RegionName=us-west-2}}]' | Disable replication | Cleanup | aws dynamodb update-table --table-name mytable --replica-updates '[{Delete={RegionName=us-west-2}}]' |

### 7. Capacity and Billing (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb update-table --table-name mytable --billing-mode PAY_PER_REQUEST | On-demand billing | Auto scale | aws dynamodb update-table --table-name mytable --billing-mode PAY_PER_REQUEST |
| aws dynamodb update-table --table-name mytable --billing-mode PROVISIONED --provisioned-throughput ReadCapacityUnits=10,WriteCapacityUnits=5 | Provisioned | Predictable | aws dynamodb update-table --table-name mytable --billing-mode PROVISIONED --provisioned-throughput ReadCapacityUnits=10,WriteCapacityUnits=5 |
| aws dynamodb describe-table --table-name mytable --query 'Table.BillingMode' | Check billing | Verify | aws dynamodb describe-table --table-name mytable --query 'Table.BillingMode' |
| aws dynamodb describe-limits | View account limits | Check | aws dynamodb describe-limits |
| aws dynamodb update-table --table-name mytable --provisioned-throughput ReadCapacityUnits=20,WriteCapacityUnits=10 | Scale capacity | Tune | aws dynamodb update-table --table-name mytable --provisioned-throughput ReadCapacityUnits=20,WriteCapacityUnits=10 |
| aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Update={IndexName=CategoryIndex,ProvisionedThroughput={ReadCapacityUnits=15,WriteCapacityUnits=10}}}]' | Scale GSI | Tune | aws dynamodb update-table --table-name mytable --global-secondary-index-updates '[{Update={IndexName=CategoryIndex,ProvisionedThroughput={ReadCapacityUnits=15,WriteCapacityUnits=10}}}]' |
| aws dynamodb describe-table --table-name mytable --query 'Table.ProvisionedThroughput' | View capacity | Monitor | aws dynamodb describe-table --table-name mytable --query 'Table.ProvisionedThroughput' |
| aws dynamodb update-table --table-name mytable --billing-mode PAY_PER_REQUEST | Switch to on-demand | Auto | aws dynamodb update-table --table-name mytable --billing-mode PAY_PER_REQUEST |

### 8. Streams and Change Data Capture (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb describe-table --table-name mytable --query 'Table.StreamSpecification.StreamEnabled' | Check stream | Verify | aws dynamodb describe-table --table-name mytable --query 'Table.StreamSpecification.StreamEnabled' |
| aws dynamodb update-table --table-name mytable --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE | New image only | CDC | aws dynamodb update-table --table-name mytable --stream-specification StreamEnabled=true,StreamViewType=NEW_IMAGE |
| aws dynamodb describe-stream --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 | Stream details | Inspect | aws dynamodb describe-stream --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 |
| aws dynamodb list-streams --table-name mytable | List streams | View | aws dynamodb list-streams --table-name mytable |
| aws dynamodb get-shard-iterator --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 --shard-id shardId --shard-iterator-type TRIM_HORIZON | Start iterator | Consume | aws dynamodb get-shard-iterator --stream-arn arn:aws:dynamodb:region:account:table/mytable/stream/2025-01-01T00:00:00.000 --shard-id shardId --shard-iterator-type TRIM_HORIZON |
| aws dynamodb get-records --shard-iterator iterator --limit 10 | Read stream records | Process | aws dynamodb get-records --shard-iterator iterator --limit 10 |

### 9. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedReadCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Read capacity | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedReadCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedWriteCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Write capacity | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedWriteCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ThrottledRequests --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Throttles | Performance | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ThrottledRequests --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch list-metrics --namespace AWS/DynamoDB --dimensions Name=TableName,Value=mytable | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/DynamoDB --dimensions Name=TableName,Value=mytable |
| aws dynamodb describe-limits | Account limits | Check | aws dynamodb describe-limits |
| aws dynamodb describe-table --table-name mytable --query 'Table.TableSizeBytes' | Table size | Monitor | aws dynamodb describe-table --table-name mytable --query 'Table.TableSizeBytes' |
| aws dynamodb describe-table --table-name mytable --query 'Table.ItemCount' | Item count | Monitor | aws dynamodb describe-table --table-name mytable --query 'Table.ItemCount' |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name SuccessfulRequestLatency --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Latency | Performance | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name SuccessfulRequestLatency --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws dynamodb describe-table --table-name mytable --query 'Table.LatestStreamArn' | Stream ARN | Trigger | aws dynamodb describe-table --table-name mytable --query 'Table.LatestStreamArn' |
| aws dynamodb describe-continuous-backups --table-name mytable | PITR status | Recovery | aws dynamodb describe-continuous-backups --table-name mytable |

### 10. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb tag-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable --tags Key=Project,Value=DataLake | Add tags | Billing | aws dynamodb tag-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable --tags Key=Project,Value=DataLake |
| aws dynamodb list-tags-of-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable | View tags | Check | aws dynamodb list-tags-of-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable |
| aws dynamodb untag-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable --tag-keys Project | Remove tag | Cleanup | aws dynamodb untag-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable --tag-keys Project |
| aws dynamodb tag-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable --tags Key=Env,Value=Prod | Environment tag | Billing | aws dynamodb tag-resource --resource-arn arn:aws:dynamodb:region:account:table/mytable --tags Key=Env,Value=Prod |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters dynamodb:table | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters dynamodb:table |
| aws dynamodb list-tables --query 'TableNames[]' | List tables | Tagging | aws dynamodb list-tables --query 'TableNames[]' |

### 11. TTL and Auto-Expiration (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb update-time-to-live --table-name mytable --time-to-live-specification Enabled=true,AttributeName=ExpirationTime | Enable TTL | Auto delete | aws dynamodb update-time-to-live --table-name mytable --time-to-live-specification Enabled=true,AttributeName=ExpirationTime |
| aws dynamodb describe-time-to-live --table-name mytable | Check TTL | Verify | aws dynamodb describe-time-to-live --table-name mytable |
| aws dynamodb update-time-to-live --table-name mytable --time-to-live-specification Enabled=false | Disable TTL | Reset | aws dynamodb update-time-to-live --table-name mytable --time-to-live-specification Enabled=false |
| aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "SET ExpirationTime = :exp" --expression-attribute-values '{":exp":{"N":"1704067200"}}' | Set TTL | Expire | aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "SET ExpirationTime = :exp" --expression-attribute-values '{":exp":{"N":"1704067200"}}' |
| aws dynamodb describe-table --table-name mytable --query 'Table.TimeToLiveDescription' | TTL status | Check | aws dynamodb describe-table --table-name mytable --query 'Table.TimeToLiveDescription' |
| aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "REMOVE ExpirationTime" | Remove TTL | Reset | aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "REMOVE ExpirationTime" |

### 12. Advanced Queries and Scans (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id AND CreatedAt > :date" --expression-attribute-values '{":id":{"S":"1"},":date":{"N":"1704067200"}}' | Range query | Time series | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id AND CreatedAt > :date" --expression-attribute-values '{":id":{"S":"1"},":date":{"N":"1704067200"}}' |
| aws dynamodb scan --table-name mytable --filter-expression "Age BETWEEN :min AND :max" --expression-attribute-values '{":min":{"N":"25"},":max":{"N":"35"}}' | Filtered scan | Query | aws dynamodb scan --table-name mytable --filter-expression "Age BETWEEN :min AND :max" --expression-attribute-values '{":min":{"N":"25"},":max":{"N":"35"}}' |
| aws dynamodb query --table-name mytable --index-name CategoryIndex --key-condition-expression "Category = :cat" --filter-expression "Age > :age" --expression-attribute-values '{":cat":{"S":"Books"},":age":{"N":"25"}}' | GSI with filter | Advanced | aws dynamodb query --table-name mytable --index-name CategoryIndex --key-condition-expression "Category = :cat" --filter-expression "Age > :age" --expression-attribute-values '{":cat":{"S":"Books"},":age":{"N":"25"}}' |
| aws dynamodb scan --table-name mytable --projection-expression "Id,Name" | Projection | Selective | aws dynamodb scan --table-name mytable --projection-expression "Id,Name" |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --scan-index-forward false | Reverse sort | Latest | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --scan-index-forward false |
| aws dynamodb scan --table-name mytable --limit 10 | Paginated scan | Page | aws dynamodb scan --table-name mytable --limit 10 |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --limit 5 | Paginated query | Page | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --limit 5 |
| aws dynamodb scan --table-name mytable --segment 0 --total-segments 4 | Parallel scan | Large | aws dynamodb scan --table-name mytable --segment 0 --total-segments 4 |

### 13. Security and Encryption (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb update-table --table-name mytable --sse-specification Enabled=true,SSEType=KMS,MasterKeyId=keyid | Enable KMS | Security | aws dynamodb update-table --table-name mytable --sse-specification Enabled=true,SSEType=KMS,MasterKeyId=keyid |
| aws dynamodb describe-table --table-name mytable --query 'Table.SSEDescription' | Check encryption | Audit | aws dynamodb describe-table --table-name mytable --query 'Table.SSEDescription' |
| aws dynamodb update-table --table-name mytable --sse-specification Enabled=false | Disable encryption | Reset | aws dynamodb update-table --table-name mytable --sse-specification Enabled=false |
| aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --sse-specification Enabled=true,SSEType=AWS_OWNED | SSE-S3 | Default | aws dynamodb create-table --table-name mytable --attribute-definitions AttributeName=Id,AttributeType=S --key-schema AttributeName=Id,KeyType=HASH --sse-specification Enabled=true,SSEType=AWS_OWNED |
| aws dynamodb update-table --table-name mytable --sse-specification Enabled=true,SSEType=AWS_OWNED | SSE-S3 | Default | aws dynamodb update-table --table-name mytable --sse-specification Enabled=true,SSEType=AWS_OWNED |
| aws dynamodb describe-table --table-name mytable --query 'Table.SSEDescription.Status' | Encryption status | Verify | aws dynamodb describe-table --table-name mytable --query 'Table.SSEDescription.Status' |

### 14. On-Demand Backup and PITR (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb create-backup --table-name mytable --backup-name daily-backup | On-demand backup | Snapshot | aws dynamodb create-backup --table-name mytable --backup-name daily-backup |
| aws dynamodb list-backups --table-name mytable --backup-type ALL | List backups | View | aws dynamodb list-backups --table-name mytable --backup-type ALL |
| aws dynamodb restore-table-from-backup --target-table-name restored --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid | Restore backup | Recovery | aws dynamodb restore-table-from-backup --target-table-name restored --backup-arn arn:aws:dynamodb:region:account:table/mytable/backup/backupid |
| aws dynamodb update-table --table-name mytable --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true | Enable PITR | Continuous | aws dynamodb update-table --table-name mytable --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true |
| aws dynamodb restore-table-to-point-in-time --target-table-name restored --source-table-name mytable --restore-date-time 2025-01-01T12:00:00Z | PITR restore | Recovery | aws dynamodb restore-table-to-point-in-time --target-table-name restored --source-table-name mytable --restore-date-time 2025-01-01T12:00:00Z |
| aws dynamodb describe-continuous-backups --table-name mytable | PITR status | Verify | aws dynamodb describe-continuous-backups --table-name mytable |

### 15. Global Tables (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb create-global-table --global-table-name myglobal --replica-regions RegionName=us-east-1,ReplicaRegionName=us-west-2 | Create global | Multi-region | aws dynamodb create-global-table --global-table-name myglobal --replica-regions RegionName=us-east-1,ReplicaRegionName=us-west-2 |
| aws dynamodb describe-global-table --global-table-name myglobal | View global | Check | aws dynamodb describe-global-table --global-table-name myglobal |
| aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Create={RegionName=us-east-2}}]' | Add region | Scale | aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Create={RegionName=us-east-2}}]' |
| aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Delete={RegionName=us-west-2}}]' | Remove region | Cleanup | aws dynamodb update-global-table --global-table-name myglobal --replica-updates '[{Delete={RegionName=us-west-2}}]' |
| aws dynamodb list-global-tables | List global tables | View | aws dynamodb list-global-tables |
| aws dynamodb describe-global-table --global-table-name myglobal --query 'GlobalTableDescription.GlobalTableStatus' | Status | Monitor | aws dynamodb describe-global-table --global-table-name myglobal --query 'GlobalTableDescription.GlobalTableStatus' |

### 16. Advanced Data Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws dynamodb transact-write-items --transact-items '[{Put={TableName=mytable,Item={"Id":{"S":"1"},"Name":{"S":"Alice"}}}},{Put={TableName=mytable,Item={"Id":{"S":"2"},"Name":{"S":"Bob"}}}}]' | Transact write | Atomic | aws dynamodb transact-write-items --transact-items '[{Put={TableName=mytable,Item={"Id":{"S":"1"},"Name":{"S":"Alice"}}}},{Put={TableName=mytable,Item={"Id":{"S":"2"},"Name":{"S":"Bob"}}}}]' |
| aws dynamodb transact-get-items --transact-items '[{Get={TableName=mytable,Key={"Id":{"S":"1"}}}},{Get={TableName=mytable,Key={"Id":{"S":"2"}}}}]' | Transact get | Atomic | aws dynamodb transact-get-items --transact-items '[{Get={TableName=mytable,Key={"Id":{"S":"1"}}}},{Get={TableName=mytable,Key={"Id":{"S":"2"}}}}]' |
| aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "SET #attr = :val" --expression-attribute-names '{"#attr":"Name"}' --expression-attribute-values '{":val":{"S":"Alice Updated"}}' | Reserved words | Escape | aws dynamodb update-item --table-name mytable --key '{"Id":{"S":"1"}}' --update-expression "SET #attr = :val" --expression-attribute-names '{"#attr":"Name"}' --expression-attribute-values '{":val":{"S":"Alice Updated"}}' |
| aws dynamodb scan --table-name mytable --filter-expression "contains(#name, :val)" --expression-attribute-names '{"#name":"Name"}' --expression-attribute-values '{":val":{"S":"Alice"}}' | Contains filter | Search | aws dynamodb scan --table-name mytable --filter-expression "contains(#name, :val)" --expression-attribute-names '{"#name":"Name"}' --expression-attribute-values '{":val":{"S":"Alice"}}' |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --filter-expression "begins_with(#name, :prefix)" --expression-attribute-names '{"#name":"Name"}' --expression-attribute-values '{":id":{"S":"1"},":prefix":{"S":"Al"}}' | Begins with | Prefix | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --filter-expression "begins_with(#name, :prefix)" --expression-attribute-names '{"#name":"Name"}' --expression-attribute-values '{":id":{"S":"1"},":prefix":{"S":"Al"}}' |
| aws dynamodb scan --table-name mytable --segment 0 --total-segments 4 | Parallel scan | Large | aws dynamodb scan --table-name mytable --segment 0 --total-segments 4 |
| aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --scan-index-forward false --limit 10 | Reverse order | Latest | aws dynamodb query --table-name mytable --key-condition-expression "Id = :id" --scan-index-forward false --limit 10 |
| aws dynamodb batch-write-item --request-items file://batch.json | Batch from file | Bulk | aws dynamodb batch-write-item --request-items file://batch.json |

### 17. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedReadCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Read capacity | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedReadCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedWriteCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Write capacity | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ConsumedWriteCapacityUnits --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ThrottledRequests --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Throttles | Performance | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name ThrottledRequests --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch list-metrics --namespace AWS/DynamoDB --dimensions Name=TableName,Value=mytable | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/DynamoDB --dimensions Name=TableName,Value=mytable |
| aws dynamodb describe-limits | Account limits | Check | aws dynamodb describe-limits |
| aws dynamodb describe-table --table-name mytable --query 'Table.TableSizeBytes' | Table size | Monitor | aws dynamodb describe-table --table-name mytable --query 'Table.TableSizeBytes' |
| aws dynamodb describe-table --table-name mytable --query 'Table.ItemCount' | Item count | Monitor | aws dynamodb describe-table --table-name mytable --query 'Table.ItemCount' |
| aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name SuccessfulRequestLatency --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Latency | Performance | aws cloudwatch get-metric-statistics --namespace AWS/DynamoDB --metric-name SuccessfulRequestLatency --dimensions Name=TableName,Value=mytable --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws dynamodb describe-table --table-name mytable --query 'Table.LatestStreamArn' | Stream ARN | Trigger | aws dynamodb describe-table --table-name mytable --query 'Table.LatestStreamArn' |
| aws dynamodb describe-continuous-backups --table-name mytable | PITR status | Recovery | aws dynamodb describe-continuous-backups --table-name mytable |

## Tips and Best Practices
* Use on-demand billing (PAY_PER_REQUEST) for unpredictable workloads.
* Enable Point-in-Time Recovery (PITR) for critical tables.
* Use composite keys and GSIs for efficient queries.
* Avoid full table scans; use query with indexes.
* Enable streams for change data capture and replication.
* Tag tables for cost allocation and governance.
* Use TTL for automatic cleanup of old data.
* Monitor throttles and capacity with CloudWatch.
* Use batch operations for high-throughput writes.
* Enable encryption with KMS for sensitive data.
* Use global tables for multi-region applications.
* Test with small data before scaling.
* Use projection expressions to reduce read capacity.
* Implement exponential backoff for retries.
* Regularly clean up old backups and versions.

## Additional Resources
* [AWS DynamoDB CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/dynamodb/)
* [DynamoDB Developer Guide](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html)
* [DynamoDB Best Practices](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/best-practices.html)
* [DynamoDB Global Tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V2.html)
* [DynamoDB Streams](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html)
* [DynamoDB TTL](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html)
* [DynamoDB Monitoring](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/monitoring.html)
* [DynamoDB Pricing](https://aws.amazon.com/dynamodb/pricing/)

## Mini-Glossary
This mini-glossary defines key terms related to DynamoDB.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Table | Collection of items |
| Item | Row/record |
| Attribute | Column/field |
| Partition Key | Primary key (hash) |
| Sort Key | Range key |
| GSI | Global secondary index |
| LSI | Local secondary index |
| Stream | Change data capture |

### 2. Operations
| Term/Concept | Description |
| --- | --- |
| PutItem | Insert/update |
| GetItem | Read single |
| UpdateItem | Modify attributes |
| DeleteItem | Remove item |
| Scan | Full table read |
| Query | Key-based read |
| BatchWriteItem | Bulk write |
| BatchGetItem | Bulk read |

### 3. Capacity
| Term/Concept | Description |
| --- | --- |
| Provisioned | Fixed RCU/WCU |
| On-Demand | Pay-per-request |
| RCU | Read capacity unit |
| WCU | Write capacity unit |
| ThrottledRequests | Capacity exceeded |
| ConsumedReadCapacityUnits | Used read |
| ConsumedWriteCapacityUnits | Used write |
| BillingMode | PAY_PER_REQUEST/PROVISIONED |

### 4. Advanced
| Term/Concept | Description |
| --- | --- |
| TTL | Time-to-live expiration |
| PITR | Point-in-time recovery |
| Global Table | Multi-region replication |
| Streams | Change log |
| Backup | Manual snapshot |
| Encryption | SSE-KMS/SSE-S3 |
| Tagging | Cost allocation |
| Transactions | Atomic operations |

### 5. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| ConsumedReadCapacityUnits | Read usage |
| ThrottledRequests | Capacity issues |
| SuccessfulRequestLatency | Performance |
| ItemCount | Table size |
| TableSizeBytes | Storage |
| StreamEnabled | CDC status |
| PITR | Recovery status |

### 6. Indexes
| Term/Concept | Description |
| --- | --- |
| GSI | Global secondary index |
| LSI | Local secondary index |
| Projection | Attributes included |
| ProvisionedThroughput | Index capacity |
| KeySchema | Index keys |
| Query | Index read |
| Scan | Full read |
| UpdateTable | Modify indexes |

### 7. Streams
| Term/Concept | Description |
| --- | --- |
| NEW_IMAGE | After update |
| OLD_IMAGE | Before update |
| NEW_AND_OLD_IMAGES | Both |
| KEYS_ONLY | Keys only |
| Shard | Stream partition |
| ShardIterator | Read position |
| GetRecords | Consume stream |
| DescribeStream | Stream details |

### 8. Best Practices
| Term/Concept | Description |
| --- | --- |
| Partition Key | Even distribution |
| Sort Key | Range queries |
| GSI | Alternative access |
| On-Demand | Unpredictable load |
| TTL | Auto cleanup |
| PITR | Recovery |
| Tagging | Cost tracking |
| Transactions | Atomicity |

