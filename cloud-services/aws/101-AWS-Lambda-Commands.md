# 101 AWS Lambda Commands

## Overview
AWS Lambda is a serverless compute service that runs code in response to events without provisioning servers. This cheat sheet covers AWS CLI commands for creating, updating, invoking, managing, and monitoring Lambda functions, layers, aliases, event sources, and permissions. Mastering these commands enables automated, scalable event-driven architectures.

## Target Audience
- Developers building serverless apps
- DevOps engineers automating workflows
- Data engineers processing events
- ML engineers deploying inference
- Anyone using event-driven systems

### 1. Function Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda create-function --function-name myfunc --zip-file fileb://function.zip --handler index.handler --runtime python3.12 --role arn:aws:iam::account:role/lambda-role | Create function | New function | aws lambda create-function --function-name myfunc --zip-file fileb://function.zip --handler index.handler --runtime python3.12 --role arn:aws:iam::account:role/lambda-role |
| aws lambda update-function-code --function-name myfunc --zip-file fileb://new.zip | Update code | Deploy | aws lambda update-function-code --function-name myfunc --zip-file fileb://new.zip |
| aws lambda list-functions | List all functions | View | aws lambda list-functions |
| aws lambda get-function --function-name myfunc | Get function details | Inspect | aws lambda get-function --function-name myfunc |
| aws lambda delete-function --function-name myfunc | Delete function | Cleanup | aws lambda delete-function --function-name myfunc |
| aws lambda list-functions --region us-east-1 | List by region | Multi-region | aws lambda list-functions --region us-east-1 |
| aws lambda create-function --function-name myfunc --runtime nodejs18.x --handler index.handler --role arn:aws:iam::account:role/lambda-role --code S3Bucket=mybucket,S3Key=function.zip | From S3 | Package | aws lambda create-function --function-name myfunc --runtime nodejs18.x --handler index.handler --role arn:aws:iam::account:role/lambda-role --code S3Bucket=mybucket,S3Key=function.zip |
| aws lambda update-function-configuration --function-name myfunc --timeout 300 --memory-size 1024 | Update config | Tune | aws lambda update-function-configuration --function-name myfunc --timeout 300 --memory-size 1024 |
| aws lambda get-function-configuration --function-name myfunc | View config | Check | aws lambda get-function-configuration --function-name myfunc |
| aws lambda publish-version --function-name myfunc | Publish version | Versioning | aws lambda publish-version --function-name myfunc |
| aws lambda list-versions-by-function --function-name myfunc | List versions | View | aws lambda list-versions-by-function --function-name myfunc |
| aws lambda delete-function --function-name myfunc --qualifier version | Delete version | Cleanup | aws lambda delete-function --function-name myfunc --qualifier version |

### 2. Invocation and Testing (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda invoke --function-name myfunc --payload '{"key":"value"}' output.json | Invoke sync | Test | aws lambda invoke --function-name myfunc --payload '{"key":"value"}' output.json |
| aws lambda invoke --function-name myfunc --invocation-type Event output.json | Async invoke | Event | aws lambda invoke --function-name myfunc --invocation-type Event output.json |
| aws lambda invoke --function-name myfunc --invocation-type RequestResponse --log-type Tail output.json | With logs | Debug | aws lambda invoke --function-name myfunc --invocation-type RequestResponse --log-type Tail output.json |
| aws lambda invoke --function-name myfunc --qualifier alias output.json | Invoke alias | Versioned | aws lambda invoke --function-name myfunc --qualifier alias output.json |
| aws lambda invoke --function-name myfunc --payload file://input.json output.json | File payload | Complex | aws lambda invoke --function-name myfunc --payload file://input.json output.json |
| aws lambda invoke --function-name myfunc --cli-binary-format raw-in-base64-out output.json | Raw input | Modern | aws lambda invoke --function-name myfunc --cli-binary-format raw-in-base64-out output.json |
| aws lambda get-function --function-name myfunc --query 'Configuration.LastModified' | Last modified | Audit | aws lambda get-function --function-name myfunc --query 'Configuration.LastModified' |
| aws lambda list-event-source-mappings --function-name myfunc | View triggers | Check | aws lambda list-event-source-mappings --function-name myfunc |
| aws lambda invoke --function-name myfunc --payload '{}' output.json | Empty payload | Test | aws lambda invoke --function-name myfunc --payload '{}' output.json |
| aws lambda invoke --function-name myfunc --region us-east-1 output.json | Cross-region | Multi | aws lambda invoke --function-name myfunc --region us-east-1 output.json |

### 3. Triggers and Event Sources (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:sqs:region:account:queue --enabled | SQS trigger | Queue | aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:sqs:region:account:queue --enabled |
| aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:dynamodb:region:account:table/table --starting-position LATEST | DynamoDB stream | Stream | aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:dynamodb:region:account:table/table --starting-position LATEST |
| aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:kinesis:region:account:stream/stream --starting-position LATEST --batch-size 100 | Kinesis trigger | Stream | aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:kinesis:region:account:stream/stream --starting-position LATEST --batch-size 100 |
| aws lambda list-event-source-mappings --function-name myfunc | List triggers | View | aws lambda list-event-source-mappings --function-name myfunc |
| aws lambda update-event-source-mapping --uuid uuid --enabled false | Disable trigger | Pause | aws lambda update-event-source-mapping --uuid uuid --enabled false |
| aws lambda delete-event-source-mapping --uuid uuid | Remove trigger | Cleanup | aws lambda delete-event-source-mapping --uuid uuid |
| aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:s3:::bucket --batch-size 10 --enabled | S3 trigger | S3 | aws lambda create-event-source-mapping --function-name myfunc --event-source-arn arn:aws:s3:::bucket --batch-size 10 --enabled |
| aws lambda add-permission --function-name myfunc --statement-id s3-trigger --action lambda:InvokeFunction --principal s3.amazonaws.com --source-arn arn:aws:s3:::bucket | S3 permission | Security | aws lambda add-permission --function-name myfunc --statement-id s3-trigger --action lambda:InvokeFunction --principal s3.amazonaws.com --source-arn arn:aws:s3:::bucket |
| aws lambda remove-permission --function-name myfunc --statement-id s3-trigger | Remove permission | Cleanup | aws lambda remove-permission --function-name myfunc --statement-id s3-trigger |
| aws lambda list-event-source-mappings --event-source-arn arn:aws:sqs:region:account:queue | List by source | Audit | aws lambda list-event-source-mappings --event-source-arn arn:aws:sqs:region:account:queue |

### 4. Layers (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda publish-layer-version --layer-name mylayer --zip-file fileb://layer.zip --compatible-runtimes python3.12 nodejs18.x | Create layer | Shared | aws lambda publish-layer-version --layer-name mylayer --zip-file fileb://layer.zip --compatible-runtimes python3.12 nodejs18.x |
| aws lambda list-layers | List layers | View | aws lambda list-layers |
| aws lambda get-layer-version --layer-name mylayer --version-number 1 | Get layer | Details | aws lambda get-layer-version --layer-name mylayer --version-number 1 |
| aws lambda delete-layer-version --layer-name mylayer --version-number 1 | Delete version | Cleanup | aws lambda delete-layer-version --layer-name mylayer --version-number 1 |
| aws lambda update-function-configuration --function-name myfunc --layers arn:aws:lambda:region:account:layer/mylayer:1 | Attach layer | Use | aws lambda update-function-configuration --function-name myfunc --layers arn:aws:lambda:region:account:layer/mylayer:1 |
| aws lambda list-layer-versions --layer-name mylayer | List versions | View | aws lambda list-layer-versions --layer-name mylayer |
| aws lambda publish-layer-version --layer-name mylayer --content S3Bucket=mybucket,S3Key=layer.zip --compatible-runtimes python3.12 | From S3 | Package | aws lambda publish-layer-version --layer-name mylayer --content S3Bucket=mybucket,S3Key=layer.zip --compatible-runtimes python3.12 |
| aws lambda get-layer-version-by-arn --arn arn:aws:lambda:region:account:layer/mylayer:1 | By ARN | Details | aws lambda get-layer-version-by-arn --arn arn:aws:lambda:region:account:layer/mylayer:1 |
| aws lambda add-layer-version-permission --layer-name mylayer --version-number 1 --statement-id public --action lambda:GetLayerVersion --principal * | Public layer | Share | aws lambda add-layer-version-permission --layer-name mylayer --version-number 1 --statement-id public --action lambda:GetLayerVersion --principal * |
| aws lambda remove-layer-version-permission --layer-name mylayer --version-number 1 --statement-id public | Remove permission | Secure | aws lambda remove-layer-version-permission --layer-name mylayer --version-number 1 --statement-id public |

### 5. Aliases and Versions (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda create-alias --function-name myfunc --name prod --function-version 2 | Create alias | Prod | aws lambda create-alias --function-name myfunc --name prod --function-version 2 |
| aws lambda update-alias --function-name myfunc --name prod --function-version 3 | Update alias | Promote | aws lambda update-alias --function-name myfunc --name prod --function-version 3 |
| aws lambda list-aliases --function-name myfunc | List aliases | View | aws lambda list-aliases --function-name myfunc |
| aws lambda get-alias --function-name myfunc --name prod | Get alias | Check | aws lambda get-alias --function-name myfunc --name prod |
| aws lambda delete-alias --function-name myfunc --name prod | Delete alias | Cleanup | aws lambda delete-alias --function-name myfunc --name prod |
| aws lambda invoke --function-name myfunc --qualifier prod output.json | Invoke alias | Production | aws lambda invoke --function-name myfunc --qualifier prod output.json |
| aws lambda publish-version --function-name myfunc | New version | Deploy | aws lambda publish-version --function-name myfunc |
| aws lambda list-versions-by-function --function-name myfunc | List versions | Audit | aws lambda list-versions-by-function --function-name myfunc |

### 6. Permissions and Roles (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda add-permission --function-name myfunc --statement-id api-gateway --action lambda:InvokeFunction --principal apigateway.amazonaws.com --source-arn arn:aws:execute-api:region:account:apiid/* | API Gateway trigger | API | aws lambda add-permission --function-name myfunc --statement-id api-gateway --action lambda:InvokeFunction --principal apigateway.amazonaws.com --source-arn arn:aws:execute-api:region:account:apiid/* |
| aws lambda remove-permission --function-name myfunc --statement-id api-gateway | Remove permission | Cleanup | aws lambda remove-permission --function-name myfunc --statement-id api-gateway |
| aws lambda get-policy --function-name myfunc | View policy | Audit | aws lambda get-policy --function-name myfunc |
| aws lambda add-permission --function-name myfunc --statement-id sns --action lambda:InvokeFunction --principal sns.amazonaws.com --source-arn arn:aws:sns:region:account:topic | SNS trigger | Notification | aws lambda add-permission --function-name myfunc --statement-id sns --action lambda:InvokeFunction --principal sns.amazonaws.com --source-arn arn:aws:sns:region:account:topic |
| aws lambda update-function-configuration --function-name myfunc --role arn:aws:iam::account:role/new-role | Change role | Update | aws lambda update-function-configuration --function-name myfunc --role arn:aws:iam::account:role/new-role |
| aws lambda get-policy --function-name myfunc --qualifier alias | Alias policy | Check | aws lambda get-policy --function-name myfunc --qualifier alias |
| aws lambda add-permission --function-name myfunc --statement-id cloudwatch --action lambda:InvokeFunction --principal events.amazonaws.com --source-arn arn:aws:events:region:account:rule/rule | EventBridge trigger | Schedule | aws lambda add-permission --function-name myfunc --statement-id cloudwatch --action lambda:InvokeFunction --principal events.amazonaws.com --source-arn arn:aws:events:region:account:rule/rule |
| aws lambda remove-permission --function-name myfunc --statement-id cloudwatch | Remove | Cleanup | aws lambda remove-permission --function-name myfunc --statement-id cloudwatch |

### 7. Concurrency and Throttling (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda put-function-concurrency --function-name myfunc --reserved-concurrent-executions 100 | Reserve concurrency | Limit | aws lambda put-function-concurrency --function-name myfunc --reserved-concurrent-executions 100 |
| aws lambda get-function-concurrency --function-name myfunc | View concurrency | Check | aws lambda get-function-concurrency --function-name myfunc |
| aws lambda delete-function-concurrency --function-name myfunc | Remove limit | Unlimited | aws lambda delete-function-concurrency --function-name myfunc |
| aws lambda put-function-concurrency --function-name myfunc --provisioned-concurrent-executions 50 | Provisioned concurrency | Low latency | aws lambda put-function-concurrency --function-name myfunc --provisioned-concurrent-executions 50 |
| aws lambda list-functions --query 'Functions[?Concurrency.ReservedConcurrentExecutions!=`null`]' | View reserved | Audit | aws lambda list-functions --query 'Functions[?Concurrency.ReservedConcurrentExecutions!=`null`]' |
| aws lambda get-account-settings --query 'AccountUsage' | Account limits | Monitor | aws lambda get-account-settings --query 'AccountUsage' |

### 8. Logging and Monitoring (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws logs describe-log-groups --log-group-name-prefix /aws/lambda/myfunc | View log groups | Logs | aws logs describe-log-groups --log-group-name-prefix /aws/lambda/myfunc |
| aws logs get-log-events --log-group-name /aws/lambda/myfunc --log-stream-name stream --limit 10 | Get logs | View | aws logs get-log-events --log-group-name /aws/lambda/myfunc --log-stream-name stream --limit 10 |
| aws lambda update-function-configuration --function-name myfunc --logging-config 'LogFormat=JSON' | JSON logging | Modern | aws lambda update-function-configuration --function-name myfunc --logging-config 'LogFormat=JSON' |
| aws lambda update-function-configuration --function-name myfunc --tracing-config 'Mode=Active' | Enable X-Ray | Tracing | aws lambda update-function-configuration --function-name myfunc --tracing-config 'Mode=Active' |
| aws xray get-trace-summaries --start-time 2025-01-01T00:00:00 --end-time 2025-01-02T00:00:00 | View traces | Debug | aws xray get-trace-summaries --start-time 2025-01-01T00:00:00 --end-time 2025-01-02T00:00:00 |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Invocations --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Invocations | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Invocations --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Duration --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Duration | Performance | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Duration --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws lambda update-function-configuration --function-name myfunc --environment 'Variables={KEY=VALUE}' | Set env vars | Config | aws lambda update-function-configuration --function-name myfunc --environment 'Variables={KEY=VALUE}' |
| aws lambda get-function-configuration --function-name myfunc --query 'Environment' | View env | Check | aws lambda get-function-configuration --function-name myfunc --query 'Environment' |
| aws lambda update-function-configuration --function-name myfunc --dead-letter-config 'TargetArn=arn:aws:sqs:region:account:dlq' | DLQ | Errors | aws lambda update-function-configuration --function-name myfunc --dead-letter-config 'TargetArn=arn:aws:sqs:region:account:dlq' |

### 9. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'Project=DataProcessing,Env=Prod' | Add tags | Billing | aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'Project=DataProcessing,Env=Prod' |
| aws lambda list-tags --resource arn:aws:lambda:region:account:function:myfunc | View tags | Check | aws lambda list-tags --resource arn:aws:lambda:region:account:function:myfunc |
| aws lambda untag-resource --resource arn:aws:lambda:region:account:function:myfunc --tag-keys 'Project' | Remove tag | Cleanup | aws lambda untag-resource --resource arn:aws:lambda:region:account:function:myfunc --tag-keys 'Project' |
| aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'CostCenter=12345' | Cost center | Billing | aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'CostCenter=12345' |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataProcessing' --resource-type-filters lambda:function | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataProcessing' --resource-type-filters lambda:function |
| aws lambda list-functions --query 'Functions[].FunctionArn' | List ARNs | Tagging | aws lambda list-functions --query 'Functions[].FunctionArn' |

### 10. Destinations and Async (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda update-function-event-invoke-config --function-name myfunc --destination-config 'OnSuccess={Destination=arn:aws:sqs:region:account:success},OnFailure={Destination=arn:aws:sqs:region:account:dlq}' | Success/failure | Async | aws lambda update-function-event-invoke-config --function-name myfunc --destination-config 'OnSuccess={Destination=arn:aws:sqs:region:account:success},OnFailure={Destination=arn:aws:sqs:region:account:dlq}' |
| aws lambda get-function-event-invoke-config --function-name myfunc | View config | Check | aws lambda get-function-event-invoke-config --function-name myfunc |
| aws lambda delete-function-event-invoke-config --function-name myfunc | Remove config | Reset | aws lambda delete-function-event-invoke-config --function-name myfunc |
| aws lambda put-function-event-invoke-config --function-name myfunc --maximum-retry-attempts 2 --maximum-event-age-in-seconds 3600 | Retry policy | Control | aws lambda put-function-event-invoke-config --function-name myfunc --maximum-retry-attempts 2 --maximum-event-age-in-seconds 3600 |
| aws lambda list-function-event-invoke-configs --function-name myfunc | List configs | View | aws lambda list-function-event-invoke-configs --function-name myfunc |
| aws lambda invoke --function-name myfunc --invocation-type Event output.json | Async invoke | Queue | aws lambda invoke --function-name myfunc --invocation-type Event output.json |

### 11. Concurrency Provisioning (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda put-provisioned-concurrency-config --function-name myfunc --qualifier alias --provisioned-concurrent-executions 50 | Provision concurrency | Low latency | aws lambda put-provisioned-concurrency-config --function-name myfunc --qualifier alias --provisioned-concurrent-executions 50 |
| aws lambda get-provisioned-concurrency-config --function-name myfunc --qualifier alias | View config | Check | aws lambda get-provisioned-concurrency-config --function-name myfunc --qualifier alias |
| aws lambda delete-provisioned-concurrency-config --function-name myfunc --qualifier alias | Remove config | Reset | aws lambda delete-provisioned-concurrency-config --function-name myfunc --qualifier alias |
| aws lambda list-provisioned-concurrency-configs --function-name myfunc | List configs | View | aws lambda list-provisioned-concurrency-configs --function-name myfunc |
| aws lambda put-provisioned-concurrency-config --function-name myfunc --qualifier $LATEST --provisioned-concurrent-executions 10 | Latest version | Test | aws lambda put-provisioned-concurrency-config --function-name myfunc --qualifier $LATEST --provisioned-concurrent-executions 10 |
| aws lambda get-provisioned-concurrency-config --function-name myfunc --qualifier alias | Status | Monitor | aws lambda get-provisioned-concurrency-config --function-name myfunc --qualifier alias |

### 12. Troubleshooting and Logs (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws logs tail /aws/lambda/myfunc --follow | Live logs | Debug | aws logs tail /aws/lambda/myfunc --follow |
| aws lambda get-function-configuration --function-name myfunc --query 'LastUpdateStatus' | Update status | Check | aws lambda get-function-configuration --function-name myfunc --query 'LastUpdateStatus' |
| aws lambda get-function-event-invoke-config --function-name myfunc --query 'DestinationConfig' | Async destinations | Check | aws lambda get-function-event-invoke-config --function-name myfunc --query 'DestinationConfig' |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Errors --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Error count | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Errors --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws lambda get-function --function-name myfunc --query 'Configuration.StateReason' | Failure reason | Debug | aws lambda get-function --function-name myfunc --query 'Configuration.StateReason' |
| aws lambda update-function-configuration --function-name myfunc --tracing-config 'Mode=PassThrough' | X-Ray passive | Tracing | aws lambda update-function-configuration --function-name myfunc --tracing-config 'Mode=PassThrough' |
| aws lambda update-function-configuration --function-name myfunc --dead-letter-config 'TargetArn=arn:aws:sqs:region:account:dlq' | DLQ | Errors | aws lambda update-function-configuration --function-name myfunc --dead-letter-config 'TargetArn=arn:aws:sqs:region:account:dlq' |
| aws logs describe-log-streams --log-group-name /aws/lambda/myfunc --order-by LastEventTime --descending | Recent streams | Debug | aws logs describe-log-streams --log-group-name /aws/lambda/myfunc --order-by LastEventTime --descending |
| aws lambda get-function-concurrency --function-name myfunc | Concurrency | Check | aws lambda get-function-concurrency --function-name myfunc |
| aws lambda list-functions --query 'Functions[?State==`Failed`]' | Failed functions | Audit | aws lambda list-functions --query 'Functions[?State==`Failed`]' |

### 13. Environment Variables and Secrets (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda update-function-configuration --function-name myfunc --environment 'Variables={API_KEY=secret,DB_HOST=prod-db}' | Set env vars | Config | aws lambda update-function-configuration --function-name myfunc --environment 'Variables={API_KEY=secret,DB_HOST=prod-db}' |
| aws lambda get-function-configuration --function-name myfunc --query 'Environment.Variables' | View env | Check | aws lambda get-function-configuration --function-name myfunc --query 'Environment.Variables' |
| aws lambda update-function-configuration --function-name myfunc --environment 'Variables={}' | Clear env | Reset | aws lambda update-function-configuration --function-name myfunc --environment 'Variables={}' |
| aws lambda update-function-configuration --function-name myfunc --environment 'Variables={SECRET=arn:aws:secretsmanager:region:account:secret:db-secret}' | Secrets Manager | Secure | aws lambda update-function-configuration --function-name myfunc --environment 'Variables={SECRET=arn:aws:secretsmanager:region:account:secret:db-secret}' |
| aws lambda update-function-configuration --function-name myfunc --vpc-config 'SubnetIds=subnet-123,SecurityGroupIds=sg-456' | VPC config | Private | aws lambda update-function-configuration --function-name myfunc --vpc-config 'SubnetIds=subnet-123,SecurityGroupIds=sg-456' |
| aws lambda get-function-configuration --function-name myfunc --query 'VpcConfig' | View VPC | Check | aws lambda get-function-configuration --function-name myfunc --query 'VpcConfig' |

### 14. Concurrency and Scaling (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda put-function-concurrency --function-name myfunc --reserved-concurrent-executions 200 | Reserve concurrency | Limit | aws lambda put-function-concurrency --function-name myfunc --reserved-concurrent-executions 200 |
| aws lambda put-provisioned-concurrency-config --function-name myfunc --qualifier prod --provisioned-concurrent-executions 100 | Provisioned | Low latency | aws lambda put-provisioned-concurrency-config --function-name myfunc --qualifier prod --provisioned-concurrent-executions 100 |
| aws lambda list-provisioned-concurrency-configs --function-name myfunc | List provisioned | View | aws lambda list-provisioned-concurrency-configs --function-name myfunc |
| aws lambda delete-provisioned-concurrency-config --function-name myfunc --qualifier prod | Remove provisioned | Reset | aws lambda delete-provisioned-concurrency-config --function-name myfunc --qualifier prod |
| aws lambda get-account-settings --query 'AccountLimit' | Account limits | Check | aws lambda get-account-settings --query 'AccountLimit' |
| aws lambda get-function-concurrency --function-name myfunc --query 'ReservedConcurrentExecutions' | Reserved | Monitor | aws lambda get-function-concurrency --function-name myfunc --query 'ReservedConcurrentExecutions' |

### 15. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'Project=Serverless,Env=Prod' | Add tags | Billing | aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'Project=Serverless,Env=Prod' |
| aws lambda list-tags --resource arn:aws:lambda:region:account:function:myfunc | View tags | Check | aws lambda list-tags --resource arn:aws:lambda:region:account:function:myfunc |
| aws lambda untag-resource --resource arn:aws:lambda:region:account:function:myfunc --tag-keys 'Project' | Remove tag | Cleanup | aws lambda untag-resource --resource arn:aws:lambda:region:account:function:myfunc --tag-keys 'Project' |
| aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'CostCenter=12345' | Cost center | Billing | aws lambda tag-resource --resource arn:aws:lambda:region:account:function:myfunc --tags 'CostCenter=12345' |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=Serverless' --resource-type-filters lambda:function | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=Serverless' --resource-type-filters lambda:function |
| aws lambda list-functions --query 'Functions[].FunctionArn' | List ARNs | Tagging | aws lambda list-functions --query 'Functions[].FunctionArn' |

### 16. Advanced Invocation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws lambda invoke --function-name myfunc --payload '{"Records":[{"eventSource":"aws:s3","s3":{"bucket":{"name":"mybucket"},"object":{"key":"file.txt"}}}]' output.json | S3 event | Test | aws lambda invoke --function-name myfunc --payload '{"Records":[{"eventSource":"aws:s3","s3":{"bucket":{"name":"mybucket"},"object":{"key":"file.txt"}}}]' output.json |
| aws lambda invoke --function-name myfunc --invocation-type DryRun output.json | Dry run | Test permissions | aws lambda invoke --function-name myfunc --invocation-type DryRun output.json |
| aws lambda invoke --function-name myfunc --qualifier prod --cli-binary-format raw-in-base64-out output.json | Alias invoke | Production | aws lambda invoke --function-name myfunc --qualifier prod --cli-binary-format raw-in-base64-out output.json |
| aws lambda invoke --function-name myfunc --payload file://event.json output.json | Complex event | Test | aws lambda invoke --function-name myfunc --payload file://event.json output.json |
| aws lambda invoke --function-name myfunc --log-type Tail --query 'LogResult' --output text | Get logs | Debug | aws lambda invoke --function-name myfunc --log-type Tail --query 'LogResult' --output text |
| aws lambda invoke --function-name myfunc --invocation-type Event --region us-east-1 output.json | Cross-region | Multi | aws lambda invoke --function-name myfunc --invocation-type Event --region us-east-1 output.json |
| aws lambda invoke --function-name myfunc --payload '{}' --qualifier alias | Alias test | Versioned | aws lambda invoke --function-name myfunc --payload '{}' --qualifier alias |
| aws lambda invoke --function-name myfunc --cli-connect-timeout 300 | Timeout | Long run | aws lambda invoke --function-name myfunc --cli-connect-timeout 300 |

### 17. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Invocations --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Invocations | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Invocations --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Errors --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Errors | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Errors --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Duration --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Duration | Performance | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Duration --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Throttles --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum | Throttles | Scaling | aws cloudwatch get-metric-statistics --namespace AWS/Lambda --metric-name Throttles --dimensions Name=FunctionName,Value=myfunc --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Sum |
| aws cloudwatch list-metrics --namespace AWS/Lambda --dimensions Name=FunctionName,Value=myfunc | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/Lambda --dimensions Name=FunctionName,Value=myfunc |
| aws xray get-trace-summaries --start-time 2025-01-01T00:00:00 --end-time 2025-01-02T00:00:00 | X-Ray traces | Debug | aws xray get-trace-summaries --start-time 2025-01-01T00:00:00 --end-time 2025-01-02T00:00:00 |
| aws logs describe-log-groups --log-group-name-prefix /aws/lambda/myfunc | Log groups | Check | aws logs describe-log-groups --log-group-name-prefix /aws/lambda/myfunc |
| aws logs get-log-events --log-group-name /aws/lambda/myfunc --log-stream-name stream --start-from-head | Tail logs | Debug | aws logs get-log-events --log-group-name /aws/lambda/myfunc --log-stream-name stream --start-from-head |
| aws lambda get-function --function-name myfunc --query 'Configuration.StateReason' | Failure reason | Debug | aws lambda get-function --function-name myfunc --query 'Configuration.StateReason' |
| aws lambda get-account-settings --query 'AccountUsage' | Account usage | Monitor | aws lambda get-account-settings --query 'AccountUsage' |

## Tips and Best Practices
* Always test functions with invoke --invocation-type RequestResponse --log-type Tail.
* Use aliases for safe deployments (prod, dev).
* Attach layers for shared dependencies.
* Enable X-Ray tracing for distributed debugging.
* Set DLQ and retries for async invocations.
* Use reserved concurrency to prevent overload.
* Tag functions for cost allocation.
* Use provisioned concurrency for low-latency workloads.
* Monitor errors and duration with CloudWatch.
* Use JSON logging format for modern parsing.
* Keep functions small and stateless.
* Use environment variables for configuration.
* Enable VPC only when necessary.
* Use dead-letter queues for failed events.
* Regularly clean up old versions and layers.
* Use S3 for large deployment packages.

## Additional Resources
* [AWS Lambda CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/lambda/)
* [Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
* [Lambda Best Practices](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html)
* [Lambda Layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
* [Lambda Concurrency](https://docs.aws.amazon.com/lambda/latest/dg/configuration-concurrency.html)
* [Lambda Destinations](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html)
* [Lambda Monitoring](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics.html)
* [Lambda X-Ray Tracing](https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html)

## Mini-Glossary
This mini-glossary defines key terms related to AWS Lambda.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Function | Code and config |
| Version | Immutable snapshot |
| Alias | Pointer to version |
| Layer | Shared code/dependencies |
| Event Source | Trigger (S3, SQS, etc.) |
| Concurrency | Simultaneous executions |
| Provisioned Concurrency | Pre-warmed instances |
| Dead Letter Queue | Failed events |

### 2. Invocation
| Term/Concept | Description |
| --- | --- |
| Sync | RequestResponse |
| Async | Event |
| DryRun | Test permissions |
| Payload | Input JSON |
| LogType Tail | Inline logs |
| Qualifier | Version/alias |
| Destination | Success/failure target |
| DLQ | Failed async events |

### 3. Configuration
| Term/Concept | Description |
| --- | --- |
| Handler | Entry point |
| Runtime | Language (python3.12, nodejs18.x) |
| Memory | 128MB–10GB |
| Timeout | Max execution time |
| Role | IAM execution role |
| Environment | Variables |
| VPC | Private network |
| Tracing | X-Ray integration |

### 4. Triggers
| Term/Concept | Description |
| --- | --- |
| SQS | Queue trigger |
| Kinesis | Stream trigger |
| DynamoDB | Stream trigger |
| S3 | Event notifications |
| EventBridge | Scheduled/cron |
| API Gateway | HTTP endpoint |
| SNS | Notification |
| CloudWatch Logs | Log subscription |

### 5. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| X-Ray | Tracing |
| Logs | /aws/lambda/group |
| Invocations | Call count |
| Duration | Execution time |
| Errors | Failed invocations |
| Throttles | Concurrency limit |
| Concurrency | Active executions |

### 6. Advanced
| Term/Concept | Description |
| --- | --- |
| Layers | Shared dependencies |
| Provisioned | Pre-warmed |
| Reserved | Limit concurrency |
| Destinations | Async success/failure |
| Tags | Cost allocation |
| Permissions | Resource policy |
| Event Source Mapping | Trigger config |
| Async Invoke | Event type |

### 7. Commands
| Term/Concept | Description |
| --- | --- |
| create-function | New function |
| update-function-code | Deploy code |
| invoke | Test/run |
| add-permission | Trigger access |
| create-alias | Version pointer |
| publish-layer-version | Shared code |
| put-function-concurrency | Concurrency control |
| list-functions | View all |

### 8. Best Practices
| Term/Concept | Description |
| --- | --- |
| Small functions | Fast cold starts |
| Layers | Reduce package size |
| DLQ | Handle failures |
| Monitoring | CloudWatch + X-Ray |
| Tagging | Cost tracking |
| Aliases | Safe deployment |
| Provisioned | Latency-sensitive |
| Reserved | Prevent overload |

