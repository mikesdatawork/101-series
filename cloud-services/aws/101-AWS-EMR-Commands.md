# 101 AWS EMR Commands

## Overview
Amazon EMR (Elastic MapReduce) is a managed big data platform for running Apache Spark, Hadoop, Hive, Presto, and other frameworks. This cheat sheet covers AWS CLI commands for cluster creation, step submission, instance management, security, and monitoring. Mastering these commands enables scalable big data processing, ETL, and analytics on large datasets.

## Target Audience
- Data engineers processing big data
- Data scientists running Spark jobs
- DevOps teams managing Hadoop clusters
- ML engineers training on large datasets
- Anyone working with distributed computing

### 1. Cluster Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive --use-default-roles | Create cluster | Spark/Hive | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive --use-default-roles |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX | View cluster | Inspect | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX |
| aws emr list-clusters | List clusters | View | aws emr list-clusters |
| aws emr terminate-cluster --cluster-id j-XXXXXXXXXXXXX | Terminate cluster | Cleanup | aws emr terminate-cluster --cluster-id j-XXXXXXXXXXXXX |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 5 --ec2-attributes KeyName=mykey,SubnetId=subnet-123 --use-default-roles | VPC cluster | Private | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 5 --ec2-attributes KeyName=mykey,SubnetId=subnet-123 --use-default-roles |
| aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --step-concurrency-level 10 | Update concurrency | Scale | aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --step-concurrency-level 10 |
| aws emr add-tags --resource-id j-XXXXXXXXXXXXX --tags Key=Project,Value=DataLake | Tag cluster | Billing | aws emr add-tags --resource-id j-XXXXXXXXXXXXX --tags Key=Project,Value=DataLake |
| aws emr list-tags --resource-id j-XXXXXXXXXXXXX | View tags | Check | aws emr list-tags --resource-id j-XXXXXXXXXXXXX |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap | Bootstrap actions | Custom | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' | Cluster status | Monitor | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"maximizeResourceAllocation":"true"}}]' | Custom config | Tune | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"maximizeResourceAllocation":"true"}}]' |
| aws emr list-clusters --active | Active clusters | Filter | aws emr list-clusters --active |

### 2. Steps and Jobs (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=SPARK,Name=SparkJob,ActionOnFailure=CONTINUE,Args=[--class,com.example.App,s3://mybucket/app.jar,s3://mybucket/input,s3://mybucket/output] | Add Spark step | ETL | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=SPARK,Name=SparkJob,ActionOnFailure=CONTINUE,Args=[--class,com.example.App,s3://mybucket/app.jar,s3://mybucket/input,s3://mybucket/output] |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX | List steps | View | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX | View step | Inspect | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX |
| aws emr cancel-steps --cluster-id j-XXXXXXXXXXXXX --step-ids s-XXXXXXXXXXXXX | Cancel step | Stop | aws emr cancel-steps --cluster-id j-XXXXXXXXXXXXX --step-ids s-XXXXXXXXXXXXX |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=HIVE,Name=HiveJob,ActionOnFailure=TERMINATE_CLUSTER,Args=[-f,s3://mybucket/hive.sql] | Hive step | SQL | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=HIVE,Name=HiveJob,ActionOnFailure=TERMINATE_CLUSTER,Args=[-f,s3://mybucket/hive.sql] |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=PRESTO,Name=PrestoQuery,ActionOnFailure=CONTINUE,Args=[-e,"SELECT * FROM mytable"] | Presto step | Query | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=PRESTO,Name=PrestoQuery,ActionOnFailure=CONTINUE,Args=[-e,"SELECT * FROM mytable"] |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING | Active steps | Monitor | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=CUSTOM_JAR,Name=CustomJar,ActionOnFailure=CONTINUE,Jar=s3://mybucket/custom.jar,MainClass=com.example.Main,Args=[arg1,arg2] | Custom JAR | Advanced | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=CUSTOM_JAR,Name=CustomJar,ActionOnFailure=CONTINUE,Jar=s3://mybucket/custom.jar,MainClass=com.example.Main,Args=[arg1,arg2] |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' | Step status | Monitor | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=STREAMING,Name=StreamingJob,ActionOnFailure=CONTINUE,Args=[--stream,s3://mybucket/stream] | Streaming step | Real-time | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=STREAMING,Name=StreamingJob,ActionOnFailure=CONTINUE,Args=[--stream,s3://mybucket/stream] |

### 3. Instance Groups and Fleets (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr add-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetType=CORE,InstanceFleetType=SPOT,TargetSpotCapacity=10,BidPrice=0.5,InstanceTypeConfigs=[{InstanceType=m5.xlarge}]' | Add spot fleet | Cost | aws emr add-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetType=CORE,InstanceFleetType=SPOT,TargetSpotCapacity=10,BidPrice=0.5,InstanceTypeConfigs=[{InstanceType=m5.xlarge}]' |
| aws emr modify-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetId=if-XXXXXXXXXXXXX,TargetSpotCapacity=20' | Modify fleet | Scale | aws emr modify-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetId=if-XXXXXXXXXXXXX,TargetSpotCapacity=20' |
| aws emr list-instance-fleets --cluster-id j-XXXXXXXXXXXXX | List fleets | View | aws emr list-instance-fleets --cluster-id j-XXXXXXXXXXXXX |
| aws emr add-instance-groups --cluster-id j-XXXXXXXXXXXXX --instance-groups 'InstanceGroupType=CORE,InstanceType=m5.xlarge,InstanceCount=2' | Add group | Scale | aws emr add-instance-groups --cluster-id j-XXXXXXXXXXXXX --instance-groups 'InstanceGroupType=CORE,InstanceType=m5.xlarge,InstanceCount=2' |
| aws emr modify-instance-groups --cluster-id j-XXXXXXXXXXXXX --instance-groups 'InstanceGroupId=ig-XXXXXXXXXXXXX,InstanceCount=5' | Modify group | Scale | aws emr modify-instance-groups --cluster-id j-XXXXXXXXXXXXX --instance-groups 'InstanceGroupId=ig-XXXXXXXXXXXXX,InstanceCount=5' |
| aws emr list-instances --cluster-id j-XXXXXXXXXXXXX | List instances | View | aws emr list-instances --cluster-id j-XXXXXXXXXXXXX |
| aws emr terminate-instances --cluster-id j-XXXXXXXXXXXXX --instance-ids i-XXXXXXXXXXXXX | Terminate instance | Cleanup | aws emr terminate-instances --cluster-id j-XXXXXXXXXXXXX --instance-ids i-XXXXXXXXXXXXX |
| aws emr add-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetType=TASK,InstanceTypeConfigs=[{InstanceType=m5.xlarge}],TargetOnDemandCapacity=5' | On-demand task | Reliability | aws emr add-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetType=TASK,InstanceTypeConfigs=[{InstanceType=m5.xlarge}],TargetOnDemandCapacity=5' |

### 4. Security and Encryption (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --security-configuration mysecurity | Security config | Encryption | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --security-configuration mysecurity |
| aws emr create-security-configuration --name mysecurity --security-configuration '{"EncryptionConfiguration":{"EnableInTransitEncryption":true,"EnableAtRestEncryption":true,"KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}}' | Create security | Encryption | aws emr create-security-configuration --name mysecurity --security-configuration '{"EncryptionConfiguration":{"EnableInTransitEncryption":true,"EnableAtRestEncryption":true,"KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}}' |
| aws emr list-security-configurations | List security | View | aws emr list-security-configurations |
| aws emr describe-security-configuration --name mysecurity | View security | Inspect | aws emr describe-security-configuration --name mysecurity |
| aws emr delete-security-configuration --name mysecurity | Delete security | Cleanup | aws emr delete-security-configuration --name mysecurity |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --kerberos-attributes 'Realm=EXAMPLE.COM,KdcServer=ip-10-0-0-1,AdminServer=ip-10-0-0-1' | Kerberos | Secure | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --kerberos-attributes 'Realm=EXAMPLE.COM,KdcServer=ip-10-0-0-1,AdminServer=ip-10-0-0-1' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark --ec2-attributes 'KeyName=mykey,SubnetId=subnet-123,EmrManagedMasterSecurityGroup=sg-123,EmrManagedSlaveSecurityGroup=sg-456' | VPC cluster | Private | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark --ec2-attributes 'KeyName=mykey,SubnetId=subnet-123,EmrManagedMasterSecurityGroup=sg-123,EmrManagedSlaveSecurityGroup=sg-456' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users | Public cluster | Access | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users |

### 5. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name IsIdle --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Idle status | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name IsIdle --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name CoreNodesRunning --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Nodes running | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name CoreNodesRunning --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch list-metrics --namespace AWS/ElasticMapReduce --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/ElasticMapReduce --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' | Cluster status | Monitor | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING | Active steps | Monitor | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' | Step status | Monitor | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' |
| aws emr list-instances --cluster-id j-XXXXXXXXXXXXX | List instances | Monitor | aws emr list-instances --cluster-id j-XXXXXXXXXXXXX |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' | Failure reason | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningMapTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Map tasks | Performance | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningMapTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningReduceTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Reduce tasks | Performance | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningReduceTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |

### 6. Security Configuration (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-security-configuration --name mysecurity --security-configuration '{"EncryptionConfiguration":{"EnableInTransitEncryption":true,"EnableAtRestEncryption":true,"KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}}' | Create security | Encryption | aws emr create-security-configuration --name mysecurity --security-configuration '{"EncryptionConfiguration":{"EnableInTransitEncryption":true,"EnableAtRestEncryption":true,"KmsKeyArn":"arn:aws:kms:region:account:key/keyid"}}' |
| aws emr list-security-configurations | List security | View | aws emr list-security-configurations |
| aws emr describe-security-configuration --name mysecurity | View security | Inspect | aws emr describe-security-configuration --name mysecurity |
| aws emr delete-security-configuration --name mysecurity | Delete security | Cleanup | aws emr delete-security-configuration --name mysecurity |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --security-configuration mysecurity | Secure cluster | Encryption | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --security-configuration mysecurity |
| aws emr create-security-configuration --name mysecurity --security-configuration '{"KerberosAttributes":{"Realm":"EXAMPLE.COM","KdcServer":"ip-10-0-0-1","AdminServer":"ip-10-0-0-1"}}' | Kerberos | Secure | aws emr create-security-configuration --name mysecurity --security-configuration '{"KerberosAttributes":{"Realm":"EXAMPLE.COM","KdcServer":"ip-10-0-0-1","AdminServer":"ip-10-0-0-1"}}' |
| aws emr create-security-configuration --name mysecurity --security-configuration '{"AuthenticationConfiguration":{"KerberosAttributes":{"Realm":"EXAMPLE.COM","KdcServer":"ip-10-0-0-1","AdminServer":"ip-10-0-0-1","CrossRealmTrustPrincipalPassword":"password"}}}' | Cross-realm | Advanced | aws emr create-security-configuration --name mysecurity --security-configuration '{"AuthenticationConfiguration":{"KerberosAttributes":{"Realm":"EXAMPLE.COM","KdcServer":"ip-10-0-0-1","AdminServer":"ip-10-0-0-1","CrossRealmTrustPrincipalPassword":"password"}}}' |
| aws emr describe-security-configuration --name mysecurity --query 'SecurityConfiguration.EncryptionConfiguration' | Check encryption | Verify | aws emr describe-security-configuration --name mysecurity --query 'SecurityConfiguration.EncryptionConfiguration' |

### 7. Auto-Scaling and Policies (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr put-auto-scaling-policy --cluster-id j-XXXXXXXXXXXXX --instance-group-id ig-XXXXXXXXXXXXX --auto-scaling-policy 'Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' | Add scaling | Scale | aws emr put-auto-scaling-policy --cluster-id j-XXXXXXXXXXXXX --instance-group-id ig-XXXXXXXXXXXXX --auto-scaling-policy 'Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' |
| aws emr remove-auto-scaling-policy --cluster-id j-XXXXXXXXXXXXX --instance-group-id ig-XXXXXXXXXXXXX | Remove scaling | Reset | aws emr remove-auto-scaling-policy --cluster-id j-XXXXXXXXXXXXX --instance-group-id ig-XXXXXXXXXXXXX |
| aws emr list-auto-scaling-policies --cluster-id j-XXXXXXXXXXXXX | List policies | View | aws emr list-auto-scaling-policies --cluster-id j-XXXXXXXXXXXXX |
| aws emr put-auto-scaling-policy --cluster-id j-XXXXXXXXXXXXX --instance-group-id ig-XXXXXXXXXXXXX --auto-scaling-policy 'Constraints={MinCapacity=1,MaxCapacity=5},Rules=[{Name=ScaleDown,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=-1}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=LESS_THAN_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=80}}}]' | Scale down | Cost | aws emr put-auto-scaling-policy --cluster-id j-XXXXXXXXXXXXX --instance-group-id ig-XXXXXXXXXXXXX --auto-scaling-policy 'Constraints={MinCapacity=1,MaxCapacity=5},Rules=[{Name=ScaleDown,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=-1}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=LESS_THAN_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=80}}}]' |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.AutoScalingPolicy' | View policy | Check | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.AutoScalingPolicy' |
| aws emr list-instance-groups --cluster-id j-XXXXXXXXXXXXX | List groups | View | aws emr list-instance-groups --cluster-id j-XXXXXXXXXXXXX |

### 8. Spot Instances and Cost Optimization (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --instance-fleets 'InstanceFleetType=CORE,InstanceFleetType=SPOT,TargetSpotCapacity=10,BidPrice=0.5,InstanceTypeConfigs=[{InstanceType=m5.xlarge}]' | Spot cluster | Cost | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --instance-fleets 'InstanceFleetType=CORE,InstanceFleetType=SPOT,TargetSpotCapacity=10,BidPrice=0.5,InstanceTypeConfigs=[{InstanceType=m5.xlarge}]' |
| aws emr modify-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetId=if-XXXXXXXXXXXXX,TargetSpotCapacity=20' | Update spot | Scale | aws emr modify-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetId=if-XXXXXXXXXXXXX,TargetSpotCapacity=20' |
| aws emr list-instance-fleets --cluster-id j-XXXXXXXXXXXXX | List fleets | View | aws emr list-instance-fleets --cluster-id j-XXXXXXXXXXXXX |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --instance-fleets 'InstanceFleetType=TASK,InstanceFleetType=SPOT,TargetSpotCapacity=5,BidPrice=0.4,InstanceTypeConfigs=[{InstanceType=m5.xlarge}]' | Task spot | Scale | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --instance-fleets 'InstanceFleetType=TASK,InstanceFleetType=SPOT,TargetSpotCapacity=5,BidPrice=0.4,InstanceTypeConfigs=[{InstanceType=m5.xlarge}]' |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.InstanceFleets[?InstanceFleetType==`SPOT`]' | Spot fleets | Check | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.InstanceFleets[?InstanceFleetType==`SPOT`]' |
| aws emr modify-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetId=if-XXXXXXXXXXXXX,TargetSpotCapacity=0' | Remove spot | On-demand | aws emr modify-instance-fleet --cluster-id j-XXXXXXXXXXXXX --instance-fleet 'InstanceFleetId=if-XXXXXXXXXXXXX,TargetSpotCapacity=0' |

### 9. Debugging and Logs (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states FAILED | Failed steps | Debug | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states FAILED |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.FailureReason' | Failure reason | Debug | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.FailureReason' |
| aws emr list-instances --cluster-id j-XXXXXXXXXXXXX --instance-states RUNNING | Running instances | Debug | aws emr list-instances --cluster-id j-XXXXXXXXXXXXX --instance-states RUNNING |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' | Cluster failure | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.LogUri' | Log location | Debug | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.LogUri' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states COMPLETED | Completed steps | Audit | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states COMPLETED |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.LogUri' | Cluster logs | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.LogUri' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING | Active steps | Monitor | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING |

### 10. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr add-tags --resource-id j-XXXXXXXXXXXXX --tags Key=Project,Value=DataLake | Tag cluster | Billing | aws emr add-tags --resource-id j-XXXXXXXXXXXXX --tags Key=Project,Value=DataLake |
| aws emr list-tags --resource-id j-XXXXXXXXXXXXX | View tags | Check | aws emr list-tags --resource-id j-XXXXXXXXXXXXX |
| aws emr remove-tags --resource-id j-XXXXXXXXXXXXX --tag-keys Project | Remove tag | Cleanup | aws emr remove-tags --resource-id j-XXXXXXXXXXXXX --tag-keys Project |
| aws emr add-tags --resource-id j-XXXXXXXXXXXXX --tags Key=Env,Value=Prod | Environment tag | Billing | aws emr add-tags --resource-id j-XXXXXXXXXXXXX --tags Key=Env,Value=Prod |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters emr:cluster | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=DataLake' --resource-type-filters emr:cluster |
| aws emr list-clusters --query 'Clusters[].Id' | List clusters | Tagging | aws emr list-clusters --query 'Clusters[].Id' |

### 11. Advanced Cluster Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-termination-policy 'IdleTimeout=3600' | Auto terminate | Cost | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-termination-policy 'IdleTimeout=3600' |
| aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --auto-termination-policy 'IdleTimeout=7200' | Update auto terminate | Change | aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --auto-termination-policy 'IdleTimeout=7200' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users | Public cluster | Access | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive Name=Presto Name=Zeppelin | Multiple apps | Suite | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive Name=Presto Name=Zeppelin |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"spark.executor.memory":"4g"}}]' | Spark config | Tune | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"spark.executor.memory":"4g"}}]' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap | Bootstrap | Custom | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --steps 'Type=SPARK,Name=Init,ActionOnFailure=CONTINUE,Args=[--class,com.example.Init,s3://mybucket/init.jar]' | Init step | Setup | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --steps 'Type=SPARK,Name=Init,ActionOnFailure=CONTINUE,Args=[--class,com.example.Init,s3://mybucket/init.jar]' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-scaling-policy 'InstanceGroupId=ig-XXXXXXXXXXXXX,AutoScalingPolicy={Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' | Auto scaling | Scale | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-scaling-policy 'InstanceGroupId=ig-XXXXXXXXXXXXX,AutoScalingPolicy={Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' |

### 12. Advanced Steps and Debugging (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=SPARK,Name=SparkJob,ActionOnFailure=CONTINUE,Args=[--class,com.example.App,s3://mybucket/app.jar,s3://mybucket/input,s3://mybucket/output] | Add Spark step | ETL | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=SPARK,Name=SparkJob,ActionOnFailure=CONTINUE,Args=[--class,com.example.App,s3://mybucket/app.jar,s3://mybucket/input,s3://mybucket/output] |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX | List steps | View | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX | View step | Inspect | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX |
| aws emr cancel-steps --cluster-id j-XXXXXXXXXXXXX --step-ids s-XXXXXXXXXXXXX | Cancel step | Stop | aws emr cancel-steps --cluster-id j-XXXXXXXXXXXXX --step-ids s-XXXXXXXXXXXXX |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=HIVE,Name=HiveJob,ActionOnFailure=TERMINATE_CLUSTER,Args=[-f,s3://mybucket/hive.sql] | Hive step | SQL | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=HIVE,Name=HiveJob,ActionOnFailure=TERMINATE_CLUSTER,Args=[-f,s3://mybucket/hive.sql] |
| aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=PRESTO,Name=PrestoQuery,ActionOnFailure=CONTINUE,Args=[-e,"SELECT * FROM mytable"] | Presto step | Query | aws emr add-steps --cluster-id j-XXXXXXXXXXXXX --steps Type=PRESTO,Name=PrestoQuery,ActionOnFailure=CONTINUE,Args=[-e,"SELECT * FROM mytable"] |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states FAILED | Failed steps | Debug | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states FAILED |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.FailureReason' | Failure reason | Debug | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.FailureReason' |

### 13. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name IsIdle --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Idle status | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name IsIdle --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name CoreNodesRunning --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Nodes running | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name CoreNodesRunning --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch list-metrics --namespace AWS/ElasticMapReduce --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/ElasticMapReduce --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' | Cluster status | Monitor | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING | Active steps | Monitor | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' | Step status | Monitor | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' |
| aws emr list-instances --cluster-id j-XXXXXXXXXXXXX | List instances | Monitor | aws emr list-instances --cluster-id j-XXXXXXXXXXXXX |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' | Failure reason | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningMapTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Map tasks | Performance | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningMapTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningReduceTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Reduce tasks | Performance | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name RunningReduceTasks --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |

### 14. Advanced Cluster Features (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-termination-policy 'IdleTimeout=3600' | Auto terminate | Cost | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-termination-policy 'IdleTimeout=3600' |
| aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --auto-termination-policy 'IdleTimeout=7200' | Update auto terminate | Change | aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --auto-termination-policy 'IdleTimeout=7200' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users | Public cluster | Access | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive Name=Presto Name=Zeppelin | Multiple apps | Suite | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive Name=Presto Name=Zeppelin |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"spark.executor.memory":"4g"}}]' | Spark config | Tune | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"spark.executor.memory":"4g"}}]' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap | Bootstrap | Custom | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --steps 'Type=SPARK,Name=Init,ActionOnFailure=CONTINUE,Args=[--class,com.example.Init,s3://mybucket/init.jar]' | Init step | Setup | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --steps 'Type=SPARK,Name=Init,ActionOnFailure=CONTINUE,Args=[--class,com.example.Init,s3://mybucket/init.jar]' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-scaling-policy 'InstanceGroupId=ig-XXXXXXXXXXXXX,AutoScalingPolicy={Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' | Auto scaling | Scale | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-scaling-policy 'InstanceGroupId=ig-XXXXXXXXXXXXX,AutoScalingPolicy={Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' |

### 15. Debugging and Logs (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states FAILED | Failed steps | Debug | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states FAILED |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.FailureReason' | Failure reason | Debug | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.FailureReason' |
| aws emr list-instances --cluster-id j-XXXXXXXXXXXXX --instance-states RUNNING | Running instances | Debug | aws emr list-instances --cluster-id j-XXXXXXXXXXXXX --instance-states RUNNING |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' | Cluster failure | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.LogUri' | Log location | Debug | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.LogUri' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states COMPLETED | Completed steps | Audit | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states COMPLETED |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.LogUri' | Cluster logs | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.LogUri' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING | Active steps | Monitor | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING |

### 16. Advanced Monitoring (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name IsIdle --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Idle status | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name IsIdle --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name CoreNodesRunning --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Nodes running | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/ElasticMapReduce --metric-name CoreNodesRunning --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws cloudwatch list-metrics --namespace AWS/ElasticMapReduce --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/ElasticMapReduce --dimensions Name=JobFlowId,Value=j-XXXXXXXXXXXXX |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' | Cluster status | Monitor | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.State' |
| aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING | Active steps | Monitor | aws emr list-steps --cluster-id j-XXXXXXXXXXXXX --step-states RUNNING |
| aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' | Step status | Monitor | aws emr describe-step --cluster-id j-XXXXXXXXXXXXX --step-id s-XXXXXXXXXXXXX --query 'Step.Status.State' |
| aws emr list-instances --cluster-id j-XXXXXXXXXXXXX | List instances | Monitor | aws emr list-instances --cluster-id j-XXXXXXXXXXXXX |
| aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' | Failure reason | Debug | aws emr describe-cluster --cluster-id j-XXXXXXXXXXXXX --query 'Cluster.Status.StateChangeReason.Message' |

### 17. Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-termination-policy 'IdleTimeout=3600' | Auto terminate | Cost | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-termination-policy 'IdleTimeout=3600' |
| aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --auto-termination-policy 'IdleTimeout=7200' | Update auto terminate | Change | aws emr modify-cluster --cluster-id j-XXXXXXXXXXXXX --auto-termination-policy 'IdleTimeout=7200' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users | Public cluster | Access | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --visible-to-all-users |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive Name=Presto Name=Zeppelin | Multiple apps | Suite | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --applications Name=Spark Name=Hive Name=Presto Name=Zeppelin |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"spark.executor.memory":"4g"}}]' | Spark config | Tune | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --configurations '[{"Classification":"spark","Properties":{"spark.executor.memory":"4g"}}]' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap | Bootstrap | Custom | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --bootstrap-actions Path=s3://mybucket/bootstrap.sh,Name=bootstrap |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --steps 'Type=SPARK,Name=Init,ActionOnFailure=CONTINUE,Args=[--class,com.example.Init,s3://mybucket/init.jar]' | Init step | Setup | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --steps 'Type=SPARK,Name=Init,ActionOnFailure=CONTINUE,Args=[--class,com.example.Init,s3://mybucket/init.jar]' |
| aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-scaling-policy 'InstanceGroupId=ig-XXXXXXXXXXXXX,AutoScalingPolicy={Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' | Auto scaling | Scale | aws emr create-cluster --name mycluster --release-label emr-6.10.0 --instance-type m5.xlarge --instance-count 3 --auto-scaling-policy 'InstanceGroupId=ig-XXXXXXXXXXXXX,AutoScalingPolicy={Constraints={MinCapacity=2,MaxCapacity=10},Rules=[{Name=ScaleUp,Action={SimpleScalingPolicyConfiguration={AdjustmentType=CHANGE_IN_CAPACITY,ScalingAdjustment=2}},Trigger={CloudWatchAlarmDefinition={ComparisonOperator=GREATER_THAN_OR_EQUAL_TO_THRESHOLD,EvaluationPeriods=2,MetricName=YARNMemoryAvailablePercentage,Threshold=20}}}]' |

## Tips and Best Practices
* Use spot instances for task nodes to save costs.
* Enable auto-termination for idle clusters.
* Use bootstrap actions for custom software.
* Monitor with CloudWatch for capacity and performance.
* Tag clusters for cost allocation.
* Use security configurations for encryption.
* Run multiple steps for complex workflows.
* Use instance fleets for mixed on-demand/spot.
* Keep clusters short-lived for cost control.
* Use managed scaling policies.
* Debug with step logs and CloudWatch.
* Test with small clusters first.
* Use EMR Studio for interactive development.
* Enable Kerberos for secure clusters.
* Use VPC for private access.

## Additional Resources
* [AWS EMR CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/emr/)
* [EMR Developer Guide](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-what-is-emr.html)
* [EMR Best Practices](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan.html)
* [EMR Security](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-security.html)
* [EMR Monitoring](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-monitoring.html)
* [EMR Spot Instances](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-spot-instances.html)
* [EMR Auto Scaling](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-auto-scaling.html)

## Mini-Glossary
This mini-glossary defines key terms related to AWS EMR.

### 1. Cluster Basics
| Term/Concept | Description |
| --- | --- |
| Cluster | EMR instance group |
| Master Node | Coordinator |
| Core Node | Data processing |
| Task Node | Optional compute |
| Instance Group | Node type |
| Instance Fleet | Mixed instance types |
| Release Label | EMR version |
| Step | Job/task |

### 2. Operations
| Term/Concept | Description |
| --- | --- |
| create-cluster | Launch cluster |
| add-steps | Submit jobs |
| list-steps | View jobs |
| terminate-cluster | Shutdown |
| modify-cluster | Update config |
| list-clusters | View clusters |
| add-tags | Cost tracking |
| list-instance-fleets | View fleets |

### 3. Scaling
| Term/Concept | Description |
| --- | --- |
| Spot Instances | Cost savings |
| On-Demand | Reliability |
| Auto Scaling | Dynamic capacity |
| Auto Termination | Idle shutdown |
| Instance Fleet | Mixed types |
| Task Nodes | Extra compute |
| Core Nodes | Data storage |
| Master Node | Management |

### 4. Security
| Term/Concept | Description |
| --- | --- |
| Security Configuration | Encryption/Kerberos |
| VPC | Private network |
| IAM Role | Permissions |
| Kerberos | Authentication |
| Encryption at Rest | Data protection |
| Encryption in Transit | Secure comms |
| Bootstrap Actions | Custom setup |
| Visible to All Users | Access control |

### 5. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| IsIdle | Cluster idle |
| CoreNodesRunning | Active cores |
| RunningMapTasks | Map tasks |
| RunningReduceTasks | Reduce tasks |
| Step Status | Job progress |
| Cluster Status | Cluster state |
| LogUri | Log location |

### 6. Advanced
| Term/Concept | Description |
| --- | --- |
| Bootstrap Actions | Init scripts |
| Configurations | Tune frameworks |
| Spot Fleet | Cost optimization |
| Auto Scaling Policy | Dynamic scaling |
| Security Configuration | Encryption |
| Kerberos Attributes | Secure auth |
| Auto Termination Policy | Idle shutdown |
| Visible to All Users | Public access |

### 7. Commands
| Term/Concept | Description |
| --- | --- |
| create-cluster | Launch |
| add-steps | Submit |
| list-steps | View |
| terminate-cluster | Shutdown |
| modify-instance-fleet | Scale |
| put-auto-scaling-policy | Auto scale |
| list-security-configurations | Security |
| describe-cluster | Inspect |

### 8. Best Practices
| Term/Concept | Description |
| --- | --- |
| Spot Instances | Cost savings |
| Auto Termination | Idle shutdown |
| Bootstrap Actions | Custom |
| Security Configuration | Encryption |
| Tagging | Billing |
| Monitoring | CloudWatch |
| Instance Fleets | Mixed types |
| Short-lived Clusters | Cost control |

