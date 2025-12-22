# 101 AWS SageMaker Commands

## Overview
Amazon SageMaker is a fully managed service for building, training, and deploying machine learning models at scale. This cheat sheet covers AWS CLI commands for notebooks, training jobs, endpoints, experiments, pipelines, feature store, model registry, and monitoring. Mastering these commands enables end-to-end ML workflows, from data preparation to production inference.

## Target Audience
- ML engineers training models
- Data scientists running experiments
- DevOps teams deploying models
- Data engineers managing features
- Anyone building ML pipelines

### 1. Notebook Instances (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.medium --role-arn arn:aws:iam::account:role/SageMakerRole | Create notebook | New instance | aws sagemaker create-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.medium --role-arn arn:aws:iam::account:role/SageMakerRole |
| aws sagemaker describe-notebook-instance --notebook-instance-name mynotebook | View details | Inspect | aws sagemaker describe-notebook-instance --notebook-instance-name mynotebook |
| aws sagemaker start-notebook-instance --notebook-instance-name mynotebook | Start instance | Activate | aws sagemaker start-notebook-instance --notebook-instance-name mynotebook |
| aws sagemaker stop-notebook-instance --notebook-instance-name mynotebook | Stop instance | Pause | aws sagemaker stop-notebook-instance --notebook-instance-name mynotebook |
| aws sagemaker delete-notebook-instance --notebook-instance-name mynotebook | Delete instance | Cleanup | aws sagemaker delete-notebook-instance --notebook-instance-name mynotebook |
| aws sagemaker list-notebook-instances | List notebooks | View | aws sagemaker list-notebook-instances |
| aws sagemaker update-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.large | Upgrade instance | Scale | aws sagemaker update-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.large |
| aws sagemaker create-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.medium --subnet-id subnet-123 --security-group-ids sg-456 --role-arn arn:aws:iam::account:role/SageMakerRole | VPC notebook | Private | aws sagemaker create-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.medium --subnet-id subnet-123 --security-group-ids sg-456 --role-arn arn:aws:iam::account:role/SageMakerRole |
| aws sagemaker describe-notebook-instance --notebook-instance-name mynotebook --query 'NotebookInstanceStatus' | Check status | Monitor | aws sagemaker describe-notebook-instance --notebook-instance-name mynotebook --query 'NotebookInstanceStatus' |
| aws sagemaker create-notebook-instance-lifecycle-config --notebook-instance-lifecycle-config-name myconfig --on-create '[{Content="base64encodedscript"}]' | Lifecycle config | Setup | aws sagemaker create-notebook-instance-lifecycle-config --notebook-instance-lifecycle-config-name myconfig --on-create '[{Content="base64encodedscript"}]' |

### 2. Training Jobs (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,TrainingInputMode=File --role-arn arn:aws:iam::account:role/SageMakerRole --input-data-config '[{ChannelName=training,DataSource={S3DataSource={S3DataType=S3Prefix,S3Uri=s3://mybucket/train}}}],OutputDataConfig={S3OutputPath=s3://mybucket/output}' --resource-config InstanceType=ml.m5.xlarge,InstanceCount=1,VolumeSizeInGB=50 --hyper-parameters 'learning_rate=0.001' | Create training job | Train model | aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,TrainingInputMode=File --role-arn arn:aws:iam::account:role/SageMakerRole --input-data-config '[{ChannelName=training,DataSource={S3DataSource={S3DataType=S3Prefix,S3Uri=s3://mybucket/train}}}],OutputDataConfig={S3OutputPath=s3://mybucket/output}' --resource-config InstanceType=ml.m5.xlarge,InstanceCount=1,VolumeSizeInGB=50 --hyper-parameters 'learning_rate=0.001' |
| aws sagemaker describe-training-job --training-job-name myjob | View job | Inspect | aws sagemaker describe-training-job --training-job-name myjob |
| aws sagemaker list-training-jobs | List jobs | View | aws sagemaker list-training-jobs |
| aws sagemaker stop-training-job --training-job-name myjob | Stop job | Cancel | aws sagemaker stop-training-job --training-job-name myjob |
| aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest --role-arn arn:aws:iam::account:role/SageMakerRole --input-data-config '[{ChannelName=training,S3DataSource={S3Uri=s3://mybucket/train}}]' --output-data-config 'S3OutputPath=s3://mybucket/output' --resource-config 'InstanceType=ml.p3.2xlarge,InstanceCount=1' --hyper-parameters 'epochs=10' | GPU training | Deep learning | aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest --role-arn arn:aws:iam::account:role/SageMakerRole --input-data-config '[{ChannelName=training,S3DataSource={S3Uri=s3://mybucket/train}}]' --output-data-config 'S3OutputPath=s3://mybucket/output' --resource-config 'InstanceType=ml.p3.2xlarge,InstanceCount=1' --hyper-parameters 'epochs=10' |
| aws sagemaker describe-training-job --training-job-name myjob --query 'TrainingJobStatus' | Check status | Monitor | aws sagemaker describe-training-job --training-job-name myjob --query 'TrainingJobStatus' |
| aws sagemaker list-training-jobs --status-equals InProgress | Active jobs | Filter | aws sagemaker list-training-jobs --status-equals InProgress |
| aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest --role-arn arn:aws:iam::account:role/SageMakerRole --vpc-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' | VPC training | Private | aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest --role-arn arn:aws:iam::account:role/SageMakerRole --vpc-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' |
| aws sagemaker describe-training-job --training-job-name myjob --query 'ModelArtifacts.S3ModelArtifacts' | Model location | Retrieve | aws sagemaker describe-training-job --training-job-name myjob --query 'ModelArtifacts.S3ModelArtifacts' |
| aws sagemaker create-training-job --training-job-name myjob --hyper-parameter-tuning-job-name mytuningjob | From tuning | HPO | aws sagemaker create-training-job --training-job-name myjob --hyper-parameter-tuning-job-name mytuningjob |

### 3. Hyperparameter Tuning Jobs (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --hyper-parameter-tuning-job-config 'MaxNumberOfTrainingJobs=10,MaxParallelTrainingJobs=2,HyperParameterTuningStrategy=Bayesian' --training-job-definition 'AlgorithmSpecification={TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest},RoleArn=arn:aws:iam::account:role/SageMakerRole,StaticHyperParameters={epochs=10}' --parameter-ranges 'IntegerParameterRanges=[{Name=learning_rate,MinValue=0.001,MaxValue=0.1}]' | Create tuning | HPO | aws sagemaker create-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --hyper-parameter-tuning-job-config 'MaxNumberOfTrainingJobs=10,MaxParallelTrainingJobs=2,HyperParameterTuningStrategy=Bayesian' --training-job-definition 'AlgorithmSpecification={TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest},RoleArn=arn:aws:iam::account:role/SageMakerRole,StaticHyperParameters={epochs=10}' --parameter-ranges 'IntegerParameterRanges=[{Name=learning_rate,MinValue=0.001,MaxValue=0.1}]' |
| aws sagemaker describe-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning | View tuning | Inspect | aws sagemaker describe-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning |
| aws sagemaker list-hyper-parameter-tuning-jobs | List tuning | View | aws sagemaker list-hyper-parameter-tuning-jobs |
| aws sagemaker stop-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning | Stop tuning | Cancel | aws sagemaker stop-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning |
| aws sagemaker list-training-jobs --hyper-parameter-tuning-job-name mytuning | List trials | View | aws sagemaker list-training-jobs --hyper-parameter-tuning-job-name mytuning |
| aws sagemaker describe-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --query 'HyperParameterTuningJobStatus' | Status | Monitor | aws sagemaker describe-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --query 'HyperParameterTuningJobStatus' |
| aws sagemaker describe-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --query 'BestTrainingJob' | Best job | Results | aws sagemaker describe-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --query 'BestTrainingJob' |
| aws sagemaker create-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --hyper-parameter-tuning-job-config 'MaxNumberOfTrainingJobs=20,MaxParallelTrainingJobs=4' --training-job-definition 'AlgorithmSpecification={TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest}' | Advanced tuning | Scale | aws sagemaker create-hyper-parameter-tuning-job --hyper-parameter-tuning-job-name mytuning --hyper-parameter-tuning-job-config 'MaxNumberOfTrainingJobs=20,MaxParallelTrainingJobs=4' --training-job-definition 'AlgorithmSpecification={TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest}' |

### 4. Model Deployment (Endpoints) (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-model --model-name mymodel --execution-role-arn arn:aws:iam::account:role/SageMakerRole --primary-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,ModelDataUrl=s3://mybucket/model.tar.gz' | Create model | Register | aws sagemaker create-model --model-name mymodel --execution-role-arn arn:aws:iam::account:role/SageMakerRole --primary-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,ModelDataUrl=s3://mybucket/model.tar.gz' |
| aws sagemaker create-endpoint-config --endpoint-config-name myconfig --production-variants '[{InstanceType=ml.t2.medium,InitialInstanceCount=1,ModelName=mymodel,VariantName=AllTraffic}]' | Endpoint config | Config | aws sagemaker create-endpoint-config --endpoint-config-name myconfig --production-variants '[{InstanceType=ml.t2.medium,InitialInstanceCount=1,ModelName=mymodel,VariantName=AllTraffic}]' |
| aws sagemaker create-endpoint --endpoint-name myendpoint --endpoint-config-name myconfig | Deploy endpoint | Inference | aws sagemaker create-endpoint --endpoint-name myendpoint --endpoint-config-name myconfig |
| aws sagemaker describe-endpoint --endpoint-name myendpoint | View endpoint | Inspect | aws sagemaker describe-endpoint --endpoint-name myendpoint |
| aws sagemaker delete-endpoint --endpoint-name myendpoint | Delete endpoint | Cleanup | aws sagemaker delete-endpoint --endpoint-name myendpoint |
| aws sagemaker list-endpoints | List endpoints | View | aws sagemaker list-endpoints |
| aws sagemaker update-endpoint --endpoint-name myendpoint --endpoint-config-name newconfig | Update config | Blue/green | aws sagemaker update-endpoint --endpoint-name myendpoint --endpoint-config-name newconfig |
| aws sagemaker create-endpoint-config --endpoint-config-name myconfig --production-variants '[{InstanceType=ml.g4dn.xlarge,InitialInstanceCount=2,ModelName=mymodel,VariantName=AllTraffic}]' | GPU endpoint | Inference | aws sagemaker create-endpoint-config --endpoint-config-name myconfig --production-variants '[{InstanceType=ml.g4dn.xlarge,InitialInstanceCount=2,ModelName=mymodel,VariantName=AllTraffic}]' |
| aws sagemaker describe-endpoint-config --endpoint-config-name myconfig | View config | Check | aws sagemaker describe-endpoint-config --endpoint-config-name myconfig |
| aws sagemaker create-model --model-name mymodel --execution-role-arn arn:aws:iam::account:role/SageMakerRole --primary-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,ModelDataUrl=s3://mybucket/model.tar.gz,Environment={SAGEMAKER_PROGRAM=script.py}' | Env vars | Custom | aws sagemaker create-model --model-name mymodel --execution-role-arn arn:aws:iam::account:role/SageMakerRole --primary-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,ModelDataUrl=s3://mybucket/model.tar.gz,Environment={SAGEMAKER_PROGRAM=script.py}' |
| aws sagemaker create-endpoint --endpoint-name myendpoint --endpoint-config-name myconfig --tags 'Key=Project,Value=ML' | Tagged endpoint | Billing | aws sagemaker create-endpoint --endpoint-name myendpoint --endpoint-config-name myconfig --tags 'Key=Project,Value=ML' |
| aws sagemaker describe-endpoint --endpoint-name myendpoint --query 'EndpointStatus' | Status | Monitor | aws sagemaker describe-endpoint --endpoint-name myendpoint --query 'EndpointStatus' |

### 5. Experiments and Trials (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-experiment --experiment-name myexperiment | Create experiment | Tracking | aws sagemaker create-experiment --experiment-name myexperiment |
| aws sagemaker describe-experiment --experiment-name myexperiment | View experiment | Inspect | aws sagemaker describe-experiment --experiment-name myexperiment |
| aws sagemaker list-experiments | List experiments | View | aws sagemaker list-experiments |
| aws sagemaker delete-experiment --experiment-name myexperiment | Delete experiment | Cleanup | aws sagemaker delete-experiment --experiment-name myexperiment |
| aws sagemaker create-trial --trial-name mytrial --experiment-name myexperiment | Create trial | Run | aws sagemaker create-trial --trial-name mytrial --experiment-name myexperiment |
| aws sagemaker describe-trial --trial-name mytrial | View trial | Inspect | aws sagemaker describe-trial --trial-name mytrial |
| aws sagemaker list-trials --experiment-name myexperiment | List trials | View | aws sagemaker list-trials --experiment-name myexperiment |
| aws sagemaker associate-trial-component --trial-name mytrial --trial-component-name mycomponent | Associate component | Track | aws sagemaker associate-trial-component --trial-name mytrial --trial-component-name mycomponent |

### 6. Pipelines (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-pipeline --pipeline-name mypipeline --pipeline-definition file://pipeline.json --role-arn arn:aws:iam::account:role/SageMakerRole | Create pipeline | Workflow | aws sagemaker create-pipeline --pipeline-name mypipeline --pipeline-definition file://pipeline.json --role-arn arn:aws:iam::account:role/SageMakerRole |
| aws sagemaker describe-pipeline --pipeline-name mypipeline | View pipeline | Inspect | aws sagemaker describe-pipeline --pipeline-name mypipeline |
| aws sagemaker list-pipelines | List pipelines | View | aws sagemaker list-pipelines |
| aws sagemaker delete-pipeline --pipeline-name mypipeline | Delete pipeline | Cleanup | aws sagemaker delete-pipeline --pipeline-name mypipeline |
| aws sagemaker start-pipeline-execution --pipeline-name mypipeline --pipeline-execution-display-name myrun | Run pipeline | Execute | aws sagemaker start-pipeline-execution --pipeline-name mypipeline --pipeline-execution-display-name myrun |
| aws sagemaker describe-pipeline-execution --pipeline-execution-arn arn:aws:sagemaker:region:account:pipeline/mypipeline/execution/executionid | View execution | Monitor | aws sagemaker describe-pipeline-execution --pipeline-execution-arn arn:aws:sagemaker:region:account:pipeline/mypipeline/execution/executionid |
| aws sagemaker list-pipeline-executions --pipeline-name mypipeline | List executions | View | aws sagemaker list-pipeline-executions --pipeline-name mypipeline |
| aws sagemaker stop-pipeline-execution --pipeline-execution-arn arn:aws:sagemaker:region:account:pipeline/mypipeline/execution/executionid | Stop execution | Cancel | aws sagemaker stop-pipeline-execution --pipeline-execution-arn arn:aws:sagemaker:region:account:pipeline/mypipeline/execution/executionid |

### 7. Feature Store (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-feature-group --feature-group-name myfeatures --record-identifier-feature-name Id --event-time-feature-name Timestamp --feature-definitions '[{FeatureName=Id,FeatureType=String},{FeatureName=Timestamp,FeatureType=String},{FeatureName=Value,FeatureType=Long}]' --online-store-config 'EnableOnlineStore=true' --offline-store-config 'S3StorageConfig={S3Uri=s3://mybucket/features}' | Create feature group | Store | aws sagemaker create-feature-group --feature-group-name myfeatures --record-identifier-feature-name Id --event-time-feature-name Timestamp --feature-definitions '[{FeatureName=Id,FeatureType=String},{FeatureName=Timestamp,FeatureType=String},{FeatureName=Value,FeatureType=Long}]' --online-store-config 'EnableOnlineStore=true' --offline-store-config 'S3StorageConfig={S3Uri=s3://mybucket/features}' |
| aws sagemaker describe-feature-group --feature-group-name myfeatures | View group | Inspect | aws sagemaker describe-feature-group --feature-group-name myfeatures |
| aws sagemaker list-feature-groups | List groups | View | aws sagemaker list-feature-groups |
| aws sagemaker put-record --feature-group-name myfeatures --record '[{FeatureName=Id,ValueAsString=1},{FeatureName=Timestamp,ValueAsString=2025-01-01T00:00:00Z},{FeatureName=Value,ValueAsString=100}]' | Put record | Insert | aws sagemaker put-record --feature-group-name myfeatures --record '[{FeatureName=Id,ValueAsString=1},{FeatureName=Timestamp,ValueAsString=2025-01-01T00:00:00Z},{FeatureName=Value,ValueAsString=100}]' |
| aws sagemaker get-record --feature-group-name myfeatures --record-identifier-value-as-string 1 | Get record | Read | aws sagemaker get-record --feature-group-name myfeatures --record-identifier-value-as-string 1 |
| aws sagemaker delete-feature-group --feature-group-name myfeatures | Delete group | Cleanup | aws sagemaker delete-feature-group --feature-group-name myfeatures |
| aws sagemaker create-feature-group --feature-group-name myfeatures --record-identifier-feature-name Id --event-time-feature-name Timestamp --feature-definitions '[{FeatureName=Id,FeatureType=String}]' --online-store-config 'EnableOnlineStore=true' --offline-store-config 'S3StorageConfig={S3Uri=s3://mybucket/features}' --tags 'Key=Project,Value=ML' | Tagged group | Billing | aws sagemaker create-feature-group --feature-group-name myfeatures --record-identifier-feature-name Id --event-time-feature-name Timestamp --feature-definitions '[{FeatureName=Id,FeatureType=String}]' --online-store-config 'EnableOnlineStore=true' --offline-store-config 'S3StorageConfig={S3Uri=s3://mybucket/features}' --tags 'Key=Project,Value=ML' |
| aws sagemaker describe-feature-group --feature-group-name myfeatures --query 'FeatureGroupStatus' | Status | Monitor | aws sagemaker describe-feature-group --feature-group-name myfeatures --query 'FeatureGroupStatus' |
| aws sagemaker list-feature-group-names | List names | View | aws sagemaker list-feature-group-names |
| aws sagemaker put-record --feature-group-name myfeatures --record '[{FeatureName=Id,ValueAsString=2},{FeatureName=Timestamp,ValueAsString=2025-01-02T00:00:00Z}]' --target-stores OnlineStore | Online only | Fast | aws sagemaker put-record --feature-group-name myfeatures --record '[{FeatureName=Id,ValueAsString=2},{FeatureName=Timestamp,ValueAsString=2025-01-02T00:00:00Z}]' --target-stores OnlineStore |

### 8. Model Registry (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-model-package-group --model-package-group-name mygroup --model-package-group-description "My ML models" | Create registry | Register | aws sagemaker create-model-package-group --model-package-group-name mygroup --model-package-group-description "My ML models" |
| aws sagemaker describe-model-package-group --model-package-group-name mygroup | View group | Inspect | aws sagemaker describe-model-package-group --model-package-group-name mygroup |
| aws sagemaker list-model-package-groups | List groups | View | aws sagemaker list-model-package-groups |
| aws sagemaker create-model-package --model-package-group-name mygroup --model-package-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,ModelDataUrl=s3://mybucket/model.tar.gz' --model-metrics 'ModelQuality={Statistics={Mean=0.95}}' | Register model | Version | aws sagemaker create-model-package --model-package-group-name mygroup --model-package-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest,ModelDataUrl=s3://mybucket/model.tar.gz' --model-metrics 'ModelQuality={Statistics={Mean=0.95}}' |
| aws sagemaker describe-model-package --model-package-arn arn:aws:sagemaker:region:account:model-package/mygroup/1 | View package | Inspect | aws sagemaker describe-model-package --model-package-arn arn:aws:sagemaker:region:account:model-package/mygroup/1 |
| aws sagemaker list-model-packages --model-package-group-name mygroup | List packages | View | aws sagemaker list-model-packages --model-package-group-name mygroup |
| aws sagemaker delete-model-package --model-package-arn arn:aws:sagemaker:region:account:model-package/mygroup/1 | Delete package | Cleanup | aws sagemaker delete-model-package --model-package-arn arn:aws:sagemaker:region:account:model-package/mygroup/1 |
| aws sagemaker update-model-package --model-package-arn arn:aws:sagemaker:region:account:model-package/mygroup/1 --model-approval-status Approved | Approve model | Deployment | aws sagemaker update-model-package --model-package-arn arn:aws:sagemaker:region:account:model-package/mygroup/1 --model-approval-status Approved |

### 9. Monitoring and Model Monitoring (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint,LocalPath=/opt/ml/processing/input,StartTimeOffset=PT-1H}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' --monitoring-statistics 'Statistics={Mean=0.95}' | Create schedule | Monitor | aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint,LocalPath=/opt/ml/processing/input,StartTimeOffset=PT-1H}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' --monitoring-statistics 'Statistics={Mean=0.95}' |
| aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule | View schedule | Inspect | aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker list-monitoring-schedules | List schedules | View | aws sagemaker list-monitoring-schedules |
| aws sagemaker delete-monitoring-schedule --monitoring-schedule-name myschedule | Delete schedule | Cleanup | aws sagemaker delete-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker start-monitoring-schedule --monitoring-schedule-name myschedule | Start schedule | Activate | aws sagemaker start-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker stop-monitoring-schedule --monitoring-schedule-name myschedule | Stop schedule | Pause | aws sagemaker stop-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule --query 'MonitoringScheduleStatus' | Status | Monitor | aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule --query 'MonitoringScheduleStatus' |
| aws cloudwatch get-metric-statistics --namespace AWS/SageMaker --metric-name ModelLatency --dimensions Name=EndpointName,Value=myendpoint --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average | Latency | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/SageMaker --metric-name ModelLatency --dimensions Name=EndpointName,Value=myendpoint --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 300 --statistics Average |
| aws sagemaker describe-endpoint --endpoint-name myendpoint --query 'ProductionVariants[].VariantStatus' | Variant status | Check | aws sagemaker describe-endpoint --endpoint-name myendpoint --query 'ProductionVariants[].VariantStatus' |
| aws sagemaker list-monitoring-schedules --endpoint-name myendpoint | Schedules for endpoint | View | aws sagemaker list-monitoring-schedules --endpoint-name myendpoint |

### 10. Processing Jobs (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-processing-job --processing-job-name myprocessing --processing-resources 'ClusterConfig={InstanceCount=1,InstanceType=ml.m5.xlarge,VolumeSizeInGB=30}' --app-specification 'ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest' --role-arn arn:aws:iam::account:role/SageMakerRole --processing-inputs '[{InputName=processing_input,S3Input={S3Uri=s3://mybucket/input,S3DataType=S3Prefix,LocalPath=/opt/ml/processing/input}}]' --processing-output-config 'Outputs=[{OutputName=processing_output,S3Output={S3Uri=s3://mybucket/output,LocalPath=/opt/ml/processing/output}}]' | Create processing | Data prep | aws sagemaker create-processing-job --processing-job-name myprocessing --processing-resources 'ClusterConfig={InstanceCount=1,InstanceType=ml.m5.xlarge,VolumeSizeInGB=30}' --app-specification 'ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest' --role-arn arn:aws:iam::account:role/SageMakerRole --processing-inputs '[{InputName=processing_input,S3Input={S3Uri=s3://mybucket/input,S3DataType=S3Prefix,LocalPath=/opt/ml/processing/input}}]' --processing-output-config 'Outputs=[{OutputName=processing_output,S3Output={S3Uri=s3://mybucket/output,LocalPath=/opt/ml/processing/output}}]' |
| aws sagemaker describe-processing-job --processing-job-name myprocessing | View job | Inspect | aws sagemaker describe-processing-job --processing-job-name myprocessing |
| aws sagemaker list-processing-jobs | List jobs | View | aws sagemaker list-processing-jobs |
| aws sagemaker stop-processing-job --processing-job-name myprocessing | Stop job | Cancel | aws sagemaker stop-processing-job --processing-job-name myprocessing |
| aws sagemaker create-processing-job --processing-job-name myprocessing --processing-resources 'ClusterConfig={InstanceCount=2,InstanceType=ml.m5.4xlarge}' --app-specification 'ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest' | Scale processing | Large | aws sagemaker create-processing-job --processing-job-name myprocessing --processing-resources 'ClusterConfig={InstanceCount=2,InstanceType=ml.m5.4xlarge}' --app-specification 'ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest' |
| aws sagemaker describe-processing-job --processing-job-name myprocessing --query 'ProcessingJobStatus' | Status | Monitor | aws sagemaker describe-processing-job --processing-job-name myprocessing --query 'ProcessingJobStatus' |
| aws sagemaker create-processing-job --processing-job-name myprocessing --processing-inputs '[{InputName=input,S3Input={S3Uri=s3://mybucket/input}}]' --processing-output-config 'Outputs=[{OutputName=output,S3Output={S3Uri=s3://mybucket/output}}]' --network-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' | VPC processing | Private | aws sagemaker create-processing-job --processing-job-name myprocessing --processing-inputs '[{InputName=input,S3Input={S3Uri=s3://mybucket/input}}]' --processing-output-config 'Outputs=[{OutputName=output,S3Output={S3Uri=s3://mybucket/output}}]' --network-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' |
| aws sagemaker list-processing-jobs --status-equals InProgress | Active jobs | Filter | aws sagemaker list-processing-jobs --status-equals InProgress |

### 11. Model Monitoring (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' | Create schedule | Monitor | aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' |
| aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule | View schedule | Inspect | aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker list-monitoring-schedules | List schedules | View | aws sagemaker list-monitoring-schedules |
| aws sagemaker delete-monitoring-schedule --monitoring-schedule-name myschedule | Delete schedule | Cleanup | aws sagemaker delete-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker start-monitoring-schedule --monitoring-schedule-name myschedule | Start schedule | Activate | aws sagemaker start-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker stop-monitoring-schedule --monitoring-schedule-name myschedule | Stop schedule | Pause | aws sagemaker stop-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule --query 'MonitoringScheduleStatus' | Status | Monitor | aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule --query 'MonitoringScheduleStatus' |
| aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' --monitoring-statistics 'Statistics={Mean=0.95}' | Statistics | Baseline | aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' --monitoring-statistics 'Statistics={Mean=0.95}' |

### 12. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker add-tags --resource-arn arn:aws:sagemaker:region:account:notebook-instance/mynotebook --tags 'Key=Project,Value=ML' | Tag notebook | Billing | aws sagemaker add-tags --resource-arn arn:aws:sagemaker:region:account:notebook-instance/mynotebook --tags 'Key=Project,Value=ML' |
| aws sagemaker list-tags --resource-arn arn:aws:sagemaker:region:account:notebook-instance/mynotebook | View tags | Check | aws sagemaker list-tags --resource-arn arn:aws:sagemaker:region:account:notebook-instance/mynotebook |
| aws sagemaker delete-tags --resource-arn arn:aws:sagemaker:region:account:notebook-instance/mynotebook --tag-keys Project | Remove tag | Cleanup | aws sagemaker delete-tags --resource-arn arn:aws:sagemaker:region:account:notebook-instance/mynotebook --tag-keys Project |
| aws sagemaker add-tags --resource-arn arn:aws:sagemaker:region:account:training-job/myjob --tags 'Key=Env,Value=Prod' | Tag training | Billing | aws sagemaker add-tags --resource-arn arn:aws:sagemaker:region:account:training-job/myjob --tags 'Key=Env,Value=Prod' |
| aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=ML' --resource-type-filters sagemaker:notebook-instance | Find tagged | Audit | aws resourcegroupstaggingapi get-resources --tag-filters 'Key=Project,Values=ML' --resource-type-filters sagemaker:notebook-instance |
| aws sagemaker list-notebook-instances --query 'NotebookInstances[].NotebookInstanceArn' | List ARNs | Tagging | aws sagemaker list-notebook-instances --query 'NotebookInstances[].NotebookInstanceArn' |

### 13. JumpStart and Pre-built Models (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker list-models --query 'Models[?contains(ModelName,`jumpstart`)]' | List JumpStart | View | aws sagemaker list-models --query 'Models[?contains(ModelName,`jumpstart`)]' |
| aws sagemaker describe-model --model-name jumpstart-model | View model | Inspect | aws sagemaker describe-model --model-name jumpstart-model |
| aws sagemaker create-model --model-name myjumpstart --execution-role-arn arn:aws:iam::account:role/SageMakerRole --primary-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/jumpstart-image:latest,ModelDataUrl=s3://mybucket/jumpstart-model.tar.gz' | Deploy JumpStart | Inference | aws sagemaker create-model --model-name myjumpstart --execution-role-arn arn:aws:iam::account:role/SageMakerRole --primary-container 'Image=123456789012.dkr.ecr.us-east-1.amazonaws.com/jumpstart-image:latest,ModelDataUrl=s3://mybucket/jumpstart-model.tar.gz' |
| aws sagemaker create-endpoint --endpoint-name myjumpstart-endpoint --endpoint-config-name myjumpstart-config | Deploy endpoint | Production | aws sagemaker create-endpoint --endpoint-name myjumpstart-endpoint --endpoint-config-name myjumpstart-config |
| aws sagemaker list-models --query 'Models[?contains(ModelName,`jumpstart`)]' | Find pre-built | View | aws sagemaker list-models --query 'Models[?contains(ModelName,`jumpstart`)]' |
| aws sagemaker describe-model --model-name jumpstart-model --query 'PrimaryContainer' | Model details | Check | aws sagemaker describe-model --model-name jumpstart-model --query 'PrimaryContainer' |

### 14. Security and VPC (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.medium --subnet-id subnet-123 --security-group-ids sg-456 --role-arn arn:aws:iam::account:role/SageMakerRole | VPC notebook | Private | aws sagemaker create-notebook-instance --notebook-instance-name mynotebook --instance-type ml.t3.medium --subnet-id subnet-123 --security-group-ids sg-456 --role-arn arn:aws:iam::account:role/SageMakerRole |
| aws sagemaker create-training-job --training-job-name myjob --vpc-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' | VPC training | Private | aws sagemaker create-training-job --training-job-name myjob --vpc-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' |
| aws sagemaker create-processing-job --processing-job-name myprocessing --network-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' | VPC processing | Private | aws sagemaker create-processing-job --processing-job-name myprocessing --network-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' |
| aws sagemaker create-endpoint-config --endpoint-config-name myconfig --production-variants '[{InstanceType=ml.t2.medium,InitialInstanceCount=1,ModelName=mymodel,VariantName=AllTraffic}]' --vpc-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' | VPC endpoint | Private | aws sagemaker create-endpoint-config --endpoint-config-name myconfig --production-variants '[{InstanceType=ml.t2.medium,InitialInstanceCount=1,ModelName=mymodel,VariantName=AllTraffic}]' --vpc-config 'SecurityGroupIds=sg-123,Subnets=subnet-456' |
| aws sagemaker describe-notebook-instance --notebook-instance-name mynotebook --query 'SubnetId' | Check VPC | Verify | aws sagemaker describe-notebook-instance --notebook-instance-name mynotebook --query 'SubnetId' |
| aws sagemaker update-notebook-instance --notebook-instance-name mynotebook --subnet-id subnet-789 --security-group-ids sg-789 | Update VPC | Change | aws sagemaker update-notebook-instance --notebook-instance-name mynotebook --subnet-id subnet-789 --security-group-ids sg-789 |
| aws sagemaker create-training-job --training-job-name myjob --encryption-config 'KmsKeyId=keyid' | KMS encryption | Security | aws sagemaker create-training-job --training-job-name myjob --encryption-config 'KmsKeyId=keyid' |
| aws sagemaker create-processing-job --processing-job-name myprocessing --encryption-config 'KmsKeyId=keyid' | KMS encryption | Security | aws sagemaker create-processing-job --processing-job-name myprocessing --encryption-config 'KmsKeyId=keyid' |

### 15. Advanced Training (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest --enable-managed-spot-training | Spot training | Cost | aws sagemaker create-training-job --training-job-name myjob --algorithm-specification TrainingImage=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest --enable-managed-spot-training |
| aws sagemaker create-training-job --training-job-name myjob --checkpoint-config 'S3Uri=s3://mybucket/checkpoints,LocalPath=/opt/ml/checkpoints' | Checkpoints | Resume | aws sagemaker create-training-job --training-job-name myjob --checkpoint-config 'S3Uri=s3://mybucket/checkpoints,LocalPath=/opt/ml/checkpoints' |
| aws sagemaker create-training-job --training-job-name myjob --debug-hook-config 'S3OutputPath=s3://mybucket/debug' | Debugging | Debug | aws sagemaker create-training-job --training-job-name myjob --debug-hook-config 'S3OutputPath=s3://mybucket/debug' |
| aws sagemaker create-training-job --training-job-name myjob --profiler-config 'S3OutputPath=s3://mybucket/profiler' | Profiling | Performance | aws sagemaker create-training-job --training-job-name myjob --profiler-config 'S3OutputPath=s3://mybucket/profiler' |
| aws sagemaker create-training-job --training-job-name myjob --enable-network-isolation | Network isolation | Security | aws sagemaker create-training-job --training-job-name myjob --enable-network-isolation |
| aws sagemaker create-training-job --training-job-name myjob --input-data-config '[{ChannelName=training,S3DataSource={S3Uri=s3://mybucket/train},CompressionType=None}]' | Compression | Efficient | aws sagemaker create-training-job --training-job-name myjob --input-data-config '[{ChannelName=training,S3DataSource={S3Uri=s3://mybucket/train},CompressionType=None}]' |
| aws sagemaker create-training-job --training-job-name myjob --hyper-parameter-tuning-job-name mytuning | From tuning | HPO | aws sagemaker create-training-job --training-job-name myjob --hyper-parameter-tuning-job-name mytuning |
| aws sagemaker create-training-job --training-job-name myjob --distribution 'SMDistributed={ModelParallel={Enabled=true}}' | Model parallel | Large models | aws sagemaker create-training-job --training-job-name myjob --distribution 'SMDistributed={ModelParallel={Enabled=true}}' |

### 16. Model Monitoring (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' | Create schedule | Monitor | aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' |
| aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule | View schedule | Inspect | aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker list-monitoring-schedules | List schedules | View | aws sagemaker list-monitoring-schedules |
| aws sagemaker delete-monitoring-schedule --monitoring-schedule-name myschedule | Delete schedule | Cleanup | aws sagemaker delete-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker start-monitoring-schedule --monitoring-schedule-name myschedule | Start schedule | Activate | aws sagemaker start-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker stop-monitoring-schedule --monitoring-schedule-name myschedule | Stop schedule | Pause | aws sagemaker stop-monitoring-schedule --monitoring-schedule-name myschedule |
| aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule --query 'MonitoringScheduleStatus' | Status | Monitor | aws sagemaker describe-monitoring-schedule --monitoring-schedule-name myschedule --query 'MonitoringScheduleStatus' |
| aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' --monitoring-statistics 'Statistics={Mean=0.95}' | Statistics | Baseline | aws sagemaker create-monitoring-schedule --monitoring-schedule-name myschedule --monitoring-schedule-config 'ScheduleConfig={ScheduleExpression="cron(0 0 * * ? *)"}' --endpoint-input 'EndpointInput={EndpointName=myendpoint}' --monitoring-output 'MonitoringOutput={S3Output={S3Uri=s3://mybucket/monitoring}}' --monitoring-statistics 'Statistics={Mean=0.95}' |

### 17. Advanced Features (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws sagemaker create-automl-job --auto-ml-job-name myautoml --input-data-config '[{ChannelName=training,S3DataSource={S3Uri=s3://mybucket/train}}]' --output-data-config 'S3OutputPath=s3://mybucket/output' --role-arn arn:aws:iam::account:role/SageMakerRole | AutoML | Auto | aws sagemaker create-automl-job --auto-ml-job-name myautoml --input-data-config '[{ChannelName=training,S3DataSource={S3Uri=s3://mybucket/train}}]' --output-data-config 'S3OutputPath=s3://mybucket/output' --role-arn arn:aws:iam::account:role/SageMakerRole |
| aws sagemaker describe-auto-ml-job --auto-ml-job-name myautoml | View AutoML | Inspect | aws sagemaker describe-auto-ml-job --auto-ml-job-name myautoml |
| aws sagemaker list-auto-ml-jobs | List AutoML | View | aws sagemaker list-auto-ml-jobs |
| aws sagemaker create-compilation-job --compilation-job-name mycompilation --role-arn arn:aws:iam::account:role/SageMakerRole --input-config 'S3Uri=s3://mybucket/model.tar.gz,Framework=TF' --output-config 'S3OutputLocation=s3://mybucket/compiled' --stopping-conditions 'MaxRuntimeInSeconds=3600' | Compilation | Inference | aws sagemaker create-compilation-job --compilation-job-name mycompilation --role-arn arn:aws:iam::account:role/SageMakerRole --input-config 'S3Uri=s3://mybucket/model.tar.gz,Framework=TF' --output-config 'S3OutputLocation=s3://mybucket/compiled' --stopping-conditions 'MaxRuntimeInSeconds=3600' |
| aws sagemaker describe-compilation-job --compilation-job-name mycompilation | View compilation | Inspect | aws sagemaker describe-compilation-job --compilation-job-name mycompilation |
| aws sagemaker create-edge-packaging-job --edge-packaging-job-name myedge --role-arn arn:aws:iam::account:role/SageMakerRole --model-name mymodel --model-version 1 --output-config 'S3OutputLocation=s3://mybucket/edge' | Edge packaging | IoT | aws sagemaker create-edge-packaging-job --edge-packaging-job-name myedge --role-arn arn:aws:iam::account:role/SageMakerRole --model-name mymodel --model-version 1 --output-config 'S3OutputLocation=s3://mybucket/edge' |
| aws sagemaker create-inference-recommendations-job --job-name myrecommendation --role-arn arn:aws:iam::account:role/SageMakerRole --input-config 'ModelPackageVersionArn=arn:aws:sagemaker:region:account:model-package/mygroup/1' | Inference recommendations | Optimize | aws sagemaker create-inference-recommendations-job --job-name myrecommendation --role-arn arn:aws:iam::account:role/SageMakerRole --input-config 'ModelPackageVersionArn=arn:aws:sagemaker:region:account:model-package/mygroup/1' |
| aws sagemaker describe-inference-recommendations-job --job-name myrecommendation | View recommendations | Inspect | aws sagemaker describe-inference-recommendations-job --job-name myrecommendation |
| aws sagemaker list-inference-recommendations-jobs | List recommendations | View | aws sagemaker list-inference-recommendations-jobs |
| aws sagemaker create-processing-job --processing-job-name myprocessing --processing-resources 'ClusterConfig={InstanceCount=1,InstanceType=ml.m5.xlarge}' --app-specification 'ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest' | Data processing | Prep | aws sagemaker create-processing-job --processing-job-name myprocessing --processing-resources 'ClusterConfig={InstanceCount=1,InstanceType=ml.m5.xlarge}' --app-specification 'ImageUri=123456789012.dkr.ecr.us-east-1.amazonaws.com/myimage:latest' |

## Tips and Best Practices
* Use SageMaker Studio for interactive development (web-based, but CLI for automation).
* Always specify VPC for secure training/processing.
* Enable managed spot training for cost savings.
* Use hyperparameter tuning for better models.
* Deploy models with endpoints for real-time inference.
* Use Feature Store for consistent features.
* Monitor endpoints with model monitoring schedules.
* Tag resources for cost allocation.
* Use pipelines for reproducible ML workflows.
* Enable encryption with KMS for sensitive data.
* Use JumpStart for quick prototyping.
* Clean up unused notebooks, endpoints, and jobs.
* Use provisioned concurrency for low-latency inference.
* Monitor training jobs with CloudWatch.
* Use AutoML for rapid prototyping.

## Additional Resources
* [SageMaker CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/sagemaker/)
* [SageMaker Developer Guide](https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html)
* [SageMaker Best Practices](https://docs.aws.amazon.com/sagemaker/latest/dg/best-practices.html)
* [SageMaker Pipelines](https://docs.aws.amazon.com/sagemaker/latest/dg/pipelines.html)
* [SageMaker Feature Store](https://docs.aws.amazon.com/sagemaker/latest/dg/feature-store.html)
* [SageMaker Model Registry](https://docs.aws.amazon.com/sagemaker/latest/dg/model-registry.html)
* [SageMaker Monitoring](https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html)
* [SageMaker JumpStart](https://docs.aws.amazon.com/sagemaker/latest/dg/jumpstart.html)

## Mini-Glossary
This mini-glossary defines key terms related to SageMaker.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Notebook Instance | Managed Jupyter | 
| Training Job | Model training |
| Endpoint | Inference server |
| Model | Trained artifact |
| Pipeline | Workflow automation |
| Feature Group | Feature store table |
| Experiment | Trial tracking |
| Hyperparameter Tuning | Auto parameter search |

### 2. Operations
| Term/Concept | Description |
| --- | --- |
| create-training-job | Start training |
| create-endpoint | Deploy inference |
| create-pipeline | Build workflow |
| create-feature-group | Feature store |
| create-model | Register model |
| create-experiment | Track runs |
| create-notebook-instance | Jupyter setup |
| create-processing-job | Data processing |

### 3. Monitoring
| Term/Concept | Description |
| --- | --- |
| Model Monitor | Drift detection |
| CloudWatch | Metrics/alarms |
| X-Ray | Tracing |
| EndpointStatus | Deployment status |
| TrainingJobStatus | Training progress |
| ProcessingJobStatus | Processing progress |
| PipelineExecution | Workflow run |
| MonitoringSchedule | Scheduled checks |

### 4. Advanced
| Term/Concept | Description |
| --- | --- |
| JumpStart | Pre-built models |
| AutoML | Automated ML |
| Feature Store | Online/offline store |
| Model Registry | Versioned models |
| Pipelines | CI/CD for ML |
| Processing Job | Data prep |
| Compilation Job | Optimized inference |
| Inference Recommendations | Optimal instance |

### 5. Configuration
| Term/Concept | Description |
| --- | --- |
| VPC | Private network |
| KMS | Encryption |
| Spot Training | Cost savings |
| Provisioned Concurrency | Low latency |
| Tagging | Cost allocation |
| Environment Variables | Config |
| Lifecycle Config | Notebook setup |
| Role ARN | IAM permissions |

### 6. Commands
| Term/Concept | Description |
| --- | --- |
| create-notebook-instance | Jupyter |
| create-training-job | Train |
| create-endpoint | Inference |
| create-pipeline | Workflow |
| create-feature-group | Features |
| create-experiment | Tracking |
| create-model-package-group | Registry |
| create-monitoring-schedule | Monitoring |

### 7. Best Practices
| Term/Concept | Description |
| --- | --- |
| VPC | Security |
| Spot | Cost |
| Pipelines | Reproducibility |
| Feature Store | Consistency |
| Monitoring | Quality |
| Tagging | Billing |
| JumpStart | Speed |
| AutoML | Experimentation |

### 8. Common Issues
| Term/Concept | Description |
| --- | --- |
| IAM Role | Permissions |
| VPC | Network access |
| KMS | Encryption |
| Spot Interrupt | Training |
| Throttling | Concurrency |
| Endpoint Failure | Deployment |
| Pipeline Failure | Workflow |
| Monitoring | Drift detection |

