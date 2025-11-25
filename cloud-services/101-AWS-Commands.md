# 101 AWS Commands

## Overview
Amazon Web Services (AWS) is a comprehensive cloud computing platform offering hundreds of services. This cheat sheet covers essential AWS CLI commands, service management, security practices, infrastructure as code, monitoring, and cost optimization across compute, storage, database, networking, and DevOps services. Master these commands to efficiently manage cloud infrastructure and applications.

## Target Audience
- Cloud architects designing solutions
- DevOps engineers managing infrastructure
- Software developers deploying applications
- System administrators migrating to cloud
- Anyone working with AWS services

## Command Categories

### 1. AWS CLI Setup and Configuration (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws configure | Configure AWS CLI | Initial setup | aws configure |
| aws configure list | Show configuration | View current config | aws configure list |
| aws configure set | Set configuration value | Update specific setting | aws configure set region us-east-1 |
| aws configure get | Get configuration value | Check setting | aws configure get region |
| aws --profile | Use named profile | Multiple accounts | aws s3 ls --profile production |
| aws configure list-profiles | List all profiles | View available profiles | aws configure list-profiles |
| aws sts get-caller-identity | Verify credentials | Check current user | aws sts get-caller-identity |
| aws --region | Specify region | Override default | aws ec2 describe-instances --region us-west-2 |
| aws --output | Output format | Change format | aws ec2 describe-instances --output json |
| aws help | Get help | Command documentation | aws ec2 help |

### 2. EC2 (Elastic Compute Cloud) (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws ec2 describe-instances | List instances | View all EC2 instances | aws ec2 describe-instances |
| aws ec2 run-instances | Launch instance | Create new EC2 | aws ec2 run-instances --image-id ami-abc123 --instance-type t2.micro |
| aws ec2 start-instances | Start instance | Start stopped instance | aws ec2 start-instances --instance-ids i-1234567890abcdef0 |
| aws ec2 stop-instances | Stop instance | Stop running instance | aws ec2 stop-instances --instance-ids i-1234567890abcdef0 |
| aws ec2 terminate-instances | Delete instance | Remove instance | aws ec2 terminate-instances --instance-ids i-1234567890abcdef0 |
| aws ec2 reboot-instances | Reboot instance | Restart instance | aws ec2 reboot-instances --instance-ids i-1234567890abcdef0 |
| aws ec2 describe-images | List AMIs | Find available images | aws ec2 describe-images --owners self |
| aws ec2 create-tags | Tag resources | Add metadata | aws ec2 create-tags --resources i-1234567890abcdef0 --tags Key=Name,Value=WebServer |
| aws ec2 describe-security-groups | List security groups | View firewall rules | aws ec2 describe-security-groups |
| aws ec2 authorize-security-group-ingress | Add inbound rule | Open port | aws ec2 authorize-security-group-ingress --group-id sg-123abc --protocol tcp --port 80 --cidr 0.0.0.0/0 |
| aws ec2 create-key-pair | Create SSH key | Generate key pair | aws ec2 create-key-pair --key-name MyKeyPair |
| aws ec2 describe-key-pairs | List key pairs | View SSH keys | aws ec2 describe-key-pairs |

### 3. S3 (Simple Storage Service) (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws s3 ls | List buckets/objects | View S3 resources | aws s3 ls or aws s3 ls s3://bucket-name/ |
| aws s3 mb | Make bucket | Create new bucket | aws s3 mb s3://my-bucket-name |
| aws s3 rb | Remove bucket | Delete bucket | aws s3 rb s3://my-bucket-name --force |
| aws s3 cp | Copy files | Upload/download | aws s3 cp file.txt s3://my-bucket/ |
| aws s3 sync | Synchronize directories | Sync local to S3 | aws s3 sync ./local-folder s3://my-bucket/folder |
| aws s3 mv | Move files | Move/rename | aws s3 mv s3://bucket/old.txt s3://bucket/new.txt |
| aws s3 rm | Remove files | Delete objects | aws s3 rm s3://my-bucket/file.txt |
| aws s3api put-bucket-versioning | Enable versioning | Version control | aws s3api put-bucket-versioning --bucket my-bucket --versioning-configuration Status=Enabled |
| aws s3api put-bucket-encryption | Enable encryption | Security | aws s3api put-bucket-encryption --bucket my-bucket --server-side-encryption-configuration ... |
| aws s3api get-bucket-policy | Get bucket policy | View permissions | aws s3api get-bucket-policy --bucket my-bucket |
| aws s3api put-object-acl | Set object ACL | Control access | aws s3api put-object-acl --bucket my-bucket --key file.txt --acl public-read |
| aws s3 presign | Generate presigned URL | Temporary access | aws s3 presign s3://my-bucket/file.txt --expires-in 3600 |

### 4. IAM (Identity and Access Management) (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws iam list-users | List users | View all IAM users | aws iam list-users |
| aws iam create-user | Create user | Add new user | aws iam create-user --user-name john |
| aws iam delete-user | Delete user | Remove user | aws iam delete-user --user-name john |
| aws iam list-groups | List groups | View all groups | aws iam list-groups |
| aws iam create-group | Create group | Add new group | aws iam create-group --group-name developers |
| aws iam list-roles | List roles | View all roles | aws iam list-roles |
| aws iam create-role | Create role | Add new role | aws iam create-role --role-name MyRole --assume-role-policy-document file://policy.json |
| aws iam attach-user-policy | Attach policy to user | Grant permissions | aws iam attach-user-policy --user-name john --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess |
| aws iam attach-role-policy | Attach policy to role | Grant permissions | aws iam attach-role-policy --role-name MyRole --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess |
| aws iam create-access-key | Create access key | Generate credentials | aws iam create-access-key --user-name john |
| aws iam list-policies | List policies | View available policies | aws iam list-policies --scope Local |
| aws iam get-policy | Get policy details | View policy | aws iam get-policy --policy-arn arn:aws:iam::123456789012:policy/MyPolicy |

### 5. Lambda (Serverless Compute) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws lambda list-functions | List functions | View all Lambda functions | aws lambda list-functions |
| aws lambda create-function | Create function | Deploy new function | aws lambda create-function --function-name my-function --runtime python3.9 --role arn:aws:iam::123456789012:role/lambda-role --handler lambda_function.lambda_handler --zip-file fileb://function.zip |
| aws lambda update-function-code | Update code | Deploy new version | aws lambda update-function-code --function-name my-function --zip-file fileb://function.zip |
| aws lambda invoke | Invoke function | Execute function | aws lambda invoke --function-name my-function output.txt |
| aws lambda delete-function | Delete function | Remove function | aws lambda delete-function --function-name my-function |
| aws lambda list-event-source-mappings | List event sources | View triggers | aws lambda list-event-source-mappings --function-name my-function |
| aws lambda get-function | Get function details | View configuration | aws lambda get-function --function-name my-function |
| aws lambda update-function-configuration | Update config | Change settings | aws lambda update-function-configuration --function-name my-function --timeout 30 |
| aws lambda list-layers | List Lambda layers | View available layers | aws lambda list-layers |
| aws lambda put-function-concurrency | Set concurrency | Limit executions | aws lambda put-function-concurrency --function-name my-function --reserved-concurrent-executions 10 |

### 6. RDS (Relational Database Service) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws rds describe-db-instances | List databases | View all DB instances | aws rds describe-db-instances |
| aws rds create-db-instance | Create database | Launch new DB | aws rds create-db-instance --db-instance-identifier mydb --db-instance-class db.t3.micro --engine postgres --master-username admin --master-user-password password123 |
| aws rds delete-db-instance | Delete database | Remove DB instance | aws rds delete-db-instance --db-instance-identifier mydb --skip-final-snapshot |
| aws rds start-db-instance | Start database | Start stopped DB | aws rds start-db-instance --db-instance-identifier mydb |
| aws rds stop-db-instance | Stop database | Stop running DB | aws rds stop-db-instance --db-instance-identifier mydb |
| aws rds create-db-snapshot | Create snapshot | Backup database | aws rds create-db-snapshot --db-snapshot-identifier mydb-snapshot --db-instance-identifier mydb |
| aws rds describe-db-snapshots | List snapshots | View backups | aws rds describe-db-snapshots |
| aws rds restore-db-instance-from-db-snapshot | Restore from snapshot | Recover database | aws rds restore-db-instance-from-db-snapshot --db-instance-identifier mydb-restored --db-snapshot-identifier mydb-snapshot |
| aws rds modify-db-instance | Modify database | Update settings | aws rds modify-db-instance --db-instance-identifier mydb --allocated-storage 100 |
| aws rds describe-db-engine-versions | List engine versions | View available versions | aws rds describe-db-engine-versions --engine postgres |

### 7. VPC (Virtual Private Cloud) (12)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws ec2 describe-vpcs | List VPCs | View all VPCs | aws ec2 describe-vpcs |
| aws ec2 create-vpc | Create VPC | New virtual network | aws ec2 create-vpc --cidr-block 10.0.0.0/16 |
| aws ec2 delete-vpc | Delete VPC | Remove VPC | aws ec2 delete-vpc --vpc-id vpc-a01106c2 |
| aws ec2 describe-subnets | List subnets | View subnets | aws ec2 describe-subnets |
| aws ec2 create-subnet | Create subnet | New subnet | aws ec2 create-subnet --vpc-id vpc-a01106c2 --cidr-block 10.0.1.0/24 |
| aws ec2 describe-route-tables | List route tables | View routing | aws ec2 describe-route-tables |
| aws ec2 create-route | Create route | Add routing rule | aws ec2 create-route --route-table-id rtb-22574640 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-c0a643a9 |
| aws ec2 describe-internet-gateways | List internet gateways | View IGWs | aws ec2 describe-internet-gateways |
| aws ec2 create-internet-gateway | Create IGW | New internet gateway | aws ec2 create-internet-gateway |
| aws ec2 attach-internet-gateway | Attach IGW | Connect to VPC | aws ec2 attach-internet-gateway --vpc-id vpc-a01106c2 --internet-gateway-id igw-c0a643a9 |
| aws ec2 describe-nat-gateways | List NAT gateways | View NAT gateways | aws ec2 describe-nat-gateways |
| aws ec2 create-nat-gateway | Create NAT gateway | Outbound internet | aws ec2 create-nat-gateway --subnet-id subnet-1a2b3c4d --allocation-id eipalloc-37fc1396 |

### 8. ECS (Elastic Container Service) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws ecs list-clusters | List clusters | View all clusters | aws ecs list-clusters |
| aws ecs create-cluster | Create cluster | New ECS cluster | aws ecs create-cluster --cluster-name my-cluster |
| aws ecs delete-cluster | Delete cluster | Remove cluster | aws ecs delete-cluster --cluster my-cluster |
| aws ecs list-services | List services | View services | aws ecs list-services --cluster my-cluster |
| aws ecs create-service | Create service | Deploy service | aws ecs create-service --cluster my-cluster --service-name my-service --task-definition my-task:1 --desired-count 2 |
| aws ecs update-service | Update service | Modify service | aws ecs update-service --cluster my-cluster --service my-service --desired-count 3 |
| aws ecs list-tasks | List tasks | View running tasks | aws ecs list-tasks --cluster my-cluster |
| aws ecs run-task | Run task | Execute task | aws ecs run-task --cluster my-cluster --task-definition my-task:1 |
| aws ecs register-task-definition | Register task definition | Define container | aws ecs register-task-definition --cli-input-json file://task-definition.json |
| aws ecs describe-task-definition | Describe task | View task details | aws ecs describe-task-definition --task-definition my-task:1 |

### 9. CloudFormation (Infrastructure as Code) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws cloudformation list-stacks | List stacks | View all stacks | aws cloudformation list-stacks |
| aws cloudformation create-stack | Create stack | Deploy template | aws cloudformation create-stack --stack-name my-stack --template-body file://template.yaml |
| aws cloudformation update-stack | Update stack | Modify resources | aws cloudformation update-stack --stack-name my-stack --template-body file://template.yaml |
| aws cloudformation delete-stack | Delete stack | Remove resources | aws cloudformation delete-stack --stack-name my-stack |
| aws cloudformation describe-stacks | Describe stacks | View stack details | aws cloudformation describe-stacks --stack-name my-stack |
| aws cloudformation describe-stack-events | Stack events | View stack history | aws cloudformation describe-stack-events --stack-name my-stack |
| aws cloudformation validate-template | Validate template | Check syntax | aws cloudformation validate-template --template-body file://template.yaml |
| aws cloudformation list-stack-resources | List resources | View stack resources | aws cloudformation list-stack-resources --stack-name my-stack |
| aws cloudformation detect-stack-drift | Detect drift | Check for changes | aws cloudformation detect-stack-drift --stack-name my-stack |
| aws cloudformation continue-update-rollback | Continue rollback | Resume failed update | aws cloudformation continue-update-rollback --stack-name my-stack |

### 10. CloudWatch (Monitoring and Logging) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws cloudwatch list-metrics | List metrics | View available metrics | aws cloudwatch list-metrics --namespace AWS/EC2 |
| aws cloudwatch get-metric-statistics | Get metric data | View metric values | aws cloudwatch get-metric-statistics --namespace AWS/EC2 --metric-name CPUUtilization --dimensions Name=InstanceId,Value=i-1234567890abcdef0 --start-time 2023-01-01T00:00:00Z --end-time 2023-01-02T00:00:00Z --period 3600 --statistics Average |
| aws cloudwatch put-metric-data | Send custom metric | Custom monitoring | aws cloudwatch put-metric-data --namespace MyApp --metric-name RequestCount --value 10 |
| aws cloudwatch describe-alarms | List alarms | View all alarms | aws cloudwatch describe-alarms |
| aws cloudwatch put-metric-alarm | Create alarm | Set up alert | aws cloudwatch put-metric-alarm --alarm-name high-cpu --alarm-description "CPU above 80%" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 300 --threshold 80 --comparison-operator GreaterThanThreshold |
| aws cloudwatch delete-alarms | Delete alarm | Remove alert | aws cloudwatch delete-alarms --alarm-names high-cpu |
| aws logs describe-log-groups | List log groups | View log groups | aws logs describe-log-groups |
| aws logs create-log-group | Create log group | New log group | aws logs create-log-group --log-group-name /aws/lambda/my-function |
| aws logs tail | Tail logs | Stream logs | aws logs tail /aws/lambda/my-function --follow |
| aws logs filter-log-events | Filter logs | Search logs | aws logs filter-log-events --log-group-name /aws/lambda/my-function --filter-pattern "ERROR" |

### 11. Route 53 (DNS Service) (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws route53 list-hosted-zones | List hosted zones | View DNS zones | aws route53 list-hosted-zones |
| aws route53 create-hosted-zone | Create zone | New DNS zone | aws route53 create-hosted-zone --name example.com --caller-reference 2023-01-01-001 |
| aws route53 delete-hosted-zone | Delete zone | Remove DNS zone | aws route53 delete-hosted-zone --id Z3M3LMPEXAMPLE |
| aws route53 list-resource-record-sets | List records | View DNS records | aws route53 list-resource-record-sets --hosted-zone-id Z3M3LMPEXAMPLE |
| aws route53 change-resource-record-sets | Modify records | Update DNS | aws route53 change-resource-record-sets --hosted-zone-id Z3M3LMPEXAMPLE --change-batch file://change-batch.json |
| aws route53 get-health-check-status | Check health | Monitor endpoint | aws route53 get-health-check-status --health-check-id abc123 |
| aws route53 list-health-checks | List health checks | View health checks | aws route53 list-health-checks |
| aws route53 create-health-check | Create health check | Monitor endpoint | aws route53 create-health-check --caller-reference 2023-01-01 --health-check-config ... |

### 12. ELB (Elastic Load Balancing) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws elbv2 describe-load-balancers | List load balancers | View all LBs | aws elbv2 describe-load-balancers |
| aws elbv2 create-load-balancer | Create load balancer | New ALB/NLB | aws elbv2 create-load-balancer --name my-lb --subnets subnet-12345 subnet-67890 |
| aws elbv2 delete-load-balancer | Delete load balancer | Remove LB | aws elbv2 delete-load-balancer --load-balancer-arn arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-lb/50dc6c495c0c9188 |
| aws elbv2 describe-target-groups | List target groups | View target groups | aws elbv2 describe-target-groups |
| aws elbv2 create-target-group | Create target group | New target group | aws elbv2 create-target-group --name my-targets --protocol HTTP --port 80 --vpc-id vpc-a01106c2 |
| aws elbv2 register-targets | Register targets | Add instances | aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:region:account-id:targetgroup/my-targets/50dc6c495c0c9188 --targets Id=i-1234567890abcdef0 |
| aws elbv2 describe-listeners | List listeners | View listeners | aws elbv2 describe-listeners --load-balancer-arn arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-lb/50dc6c495c0c9188 |
| aws elbv2 create-listener | Create listener | Add listener | aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-lb/50dc6c495c0c9188 --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:region:account-id:targetgroup/my-targets/50dc6c495c0c9188 |
| aws elbv2 describe-target-health | Check target health | Monitor targets | aws elbv2 describe-target-health --target-group-arn arn:aws:elasticloadbalancing:region:account-id:targetgroup/my-targets/50dc6c495c0c9188 |
| aws elbv2 modify-load-balancer-attributes | Modify attributes | Update LB settings | aws elbv2 modify-load-balancer-attributes --load-balancer-arn arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-lb/50dc6c495c0c9188 --attributes Key=deletion_protection.enabled,Value=true |

### 13. SNS (Simple Notification Service) (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws sns list-topics | List topics | View all topics | aws sns list-topics |
| aws sns create-topic | Create topic | New SNS topic | aws sns create-topic --name my-topic |
| aws sns delete-topic | Delete topic | Remove topic | aws sns delete-topic --topic-arn arn:aws:sns:region:account-id:my-topic |
| aws sns subscribe | Subscribe to topic | Add subscription | aws sns subscribe --topic-arn arn:aws:sns:region:account-id:my-topic --protocol email --notification-endpoint user@example.com |
| aws sns publish | Publish message | Send notification | aws sns publish --topic-arn arn:aws:sns:region:account-id:my-topic --message "Hello World" |
| aws sns list-subscriptions | List subscriptions | View subscriptions | aws sns list-subscriptions |
| aws sns unsubscribe | Unsubscribe | Remove subscription | aws sns unsubscribe --subscription-arn arn:aws:sns:region:account-id:my-topic:subscription-id |
| aws sns set-topic-attributes | Set topic attributes | Configure topic | aws sns set-topic-attributes --topic-arn arn:aws:sns:region:account-id:my-topic --attribute-name DisplayName --attribute-value "My Topic" |

### 14. SQS (Simple Queue Service) (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws sqs list-queues | List queues | View all queues | aws sqs list-queues |
| aws sqs create-queue | Create queue | New SQS queue | aws sqs create-queue --queue-name my-queue |
| aws sqs delete-queue | Delete queue | Remove queue | aws sqs delete-queue --queue-url https://sqs.region.amazonaws.com/account-id/my-queue |
| aws sqs send-message | Send message | Add to queue | aws sqs send-message --queue-url https://sqs.region.amazonaws.com/account-id/my-queue --message-body "Hello World" |
| aws sqs receive-message | Receive message | Read from queue | aws sqs receive-message --queue-url https://sqs.region.amazonaws.com/account-id/my-queue |
| aws sqs delete-message | Delete message | Remove message | aws sqs delete-message --queue-url https://sqs.region.amazonaws.com/account-id/my-queue --receipt-handle <receipt-handle> |
| aws sqs get-queue-attributes | Get attributes | View queue config | aws sqs get-queue-attributes --queue-url https://sqs.region.amazonaws.com/account-id/my-queue --attribute-names All |
| aws sqs purge-queue | Purge queue | Clear all messages | aws sqs purge-queue --queue-url https://sqs.region.amazonaws.com/account-id/my-queue |

### 15. DynamoDB (NoSQL Database) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws dynamodb list-tables | List tables | View all tables | aws dynamodb list-tables |
| aws dynamodb create-table | Create table | New DynamoDB table | aws dynamodb create-table --table-name Users --attribute-definitions AttributeName=UserId,AttributeType=S --key-schema AttributeName=UserId,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 |
| aws dynamodb delete-table | Delete table | Remove table | aws dynamodb delete-table --table-name Users |
| aws dynamodb put-item | Insert item | Add record | aws dynamodb put-item --table-name Users --item '{"UserId":{"S":"123"},"Name":{"S":"John"}}' |
| aws dynamodb get-item | Get item | Retrieve record | aws dynamodb get-item --table-name Users --key '{"UserId":{"S":"123"}}' |
| aws dynamodb update-item | Update item | Modify record | aws dynamodb update-item --table-name Users --key '{"UserId":{"S":"123"}}' --update-expression "SET #N = :name" --expression-attribute-names '{"#N":"Name"}' --expression-attribute-values '{":name":{"S":"Jane"}}' |
| aws dynamodb delete-item | Delete item | Remove record | aws dynamodb delete-item --table-name Users --key '{"UserId":{"S":"123"}}' |
| aws dynamodb scan | Scan table | Read all items | aws dynamodb scan --table-name Users |
| aws dynamodb query | Query table | Search items | aws dynamodb query --table-name Users --key-condition-expression "UserId = :id" --expression-attribute-values '{":id":{"S":"123"}}' |
| aws dynamodb describe-table | Describe table | View table details | aws dynamodb describe-table --table-name Users |

### 16. Systems Manager (SSM) (10)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws ssm describe-parameters | List parameters | View SSM parameters | aws ssm describe-parameters |
| aws ssm put-parameter | Create parameter | Store configuration | aws ssm put-parameter --name /app/database/password --value "secret123" --type SecureString |
| aws ssm get-parameter | Get parameter | Retrieve value | aws ssm get-parameter --name /app/database/password --with-decryption |
| aws ssm delete-parameter | Delete parameter | Remove parameter | aws ssm delete-parameter --name /app/database/password |
| aws ssm send-command | Run command | Execute on instances | aws ssm send-command --document-name "AWS-RunShellScript" --instance-ids "i-1234567890abcdef0" --parameters commands=["echo hello"] |
| aws ssm list-commands | List commands | View command history | aws ssm list-commands |
| aws ssm get-command-invocation | Get command result | View output | aws ssm get-command-invocation --command-id "abc123" --instance-id "i-1234567890abcdef0" |
| aws ssm start-session | Start session | Connect to instance | aws ssm start-session --target i-1234567890abcdef0 |
| aws ssm describe-instance-information | List managed instances | View SSM instances | aws ssm describe-instance-information |
| aws ssm get-parameters-by-path | Get parameters by path | Retrieve multiple | aws ssm get-parameters-by-path --path /app/database/ --with-decryption |

### 17. Cost Management and Billing (8)

| Command | Description | Common Usage | Examples |
|---------|-------------|-------------|----------|
| aws ce get-cost-and-usage | Get cost data | View spending | aws ce get-cost-and-usage --time-period Start=2023-01-01,End=2023-01-31 --granularity MONTHLY --metrics BlendedCost |
| aws ce get-cost-forecast | Get forecast | Predict costs | aws ce get-cost-forecast --time-period Start=2023-02-01,End=2023-02-28 --metric BLENDED_COST --granularity MONTHLY |
| aws budgets describe-budgets | List budgets | View budget alerts | aws budgets describe-budgets --account-id 123456789012 |
| aws budgets create-budget | Create budget | Set spending limit | aws budgets create-budget --account-id 123456789012 --budget file://budget.json |
| aws pricing get-products | Get pricing | View service costs | aws pricing get-products --service-code AmazonEC2 --filters Type=TERM_MATCH,Field=location,Value="US East (N. Virginia)" |
| aws organizations list-accounts | List accounts | View org accounts | aws organizations list-accounts |
| aws ce get-tags | Get cost tags | View cost allocation | aws ce get-tags --time-period Start=2023-01-01,End=2023-01-31 |
| aws ce get-reservation-utilization | Check reservations | View RI utilization | aws ce get-reservation-utilization --time-period Start=2023-01-01,End=2023-01-31 |

## Tips and Best Practices
* Always use IAM roles instead of access keys when possible
* Enable MFA for root and privileged accounts
* Use tags for resource organization and cost tracking
* Implement least privilege access policies
* Enable CloudTrail for audit logging
* Use CloudFormation or Terraform for infrastructure as code
* Implement backup and disaster recovery strategies
* Monitor costs with budgets and alerts
* Use VPC for network isolation
* Enable encryption at rest and in transit
* Regularly review security groups and network ACLs
* Use Auto Scaling for high availability
* Implement proper logging and monitoring
* Use Parameter Store or Secrets Manager for sensitive data
* Regularly patch and update systems

## Additional Resources
* [AWS CLI Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html)
* [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
* [AWS Documentation](https://docs.aws.amazon.com/)
* [AWS Training and Certification](https://aws.amazon.com/training/)
* [AWS Architecture Center](https://aws.amazon.com/architecture/)
* [AWS Security Best Practices](https://aws.amazon.com/security/best-practices/)
* [AWS Cost Optimization](https://aws.amazon.com/pricing/cost-optimization/)

## Mini-Glossary

This glossary explains common terms, acronyms, and concepts related to AWS.

### Common Terms

| Term | Description |
|------|-------------|
| Region | Geographic area with multiple AZs |
| Availability Zone | Isolated data center location |
| VPC | Virtual Private Cloud - isolated network |
| AMI | Amazon Machine Image - VM template |
| Instance | Virtual server |
| Bucket | S3 storage container |
| ARN | Amazon Resource Name - unique identifier |
| IAM | Identity and Access Management |
| EC2 | Elastic Compute Cloud |
| S3 | Simple Storage Service |

### Service Categories

| Category | Services | Use Case |
|----------|----------|----------|
| Compute | EC2, Lambda, ECS, EKS | Running applications |
| Storage | S3, EBS, EFS, Glacier | Data storage |
| Database | RDS, DynamoDB, Aurora | Data persistence |
| Networking | VPC, Route 53, CloudFront | Network infrastructure |
| Security | IAM, KMS, WAF, Shield | Security and compliance |
| Management | CloudWatch, CloudTrail, Config | Monitoring and governance |
| Developer Tools | CodeCommit, CodeBuild, CodeDeploy | CI/CD pipelines |

### EC2 Instance Types

| Family | Purpose | Examples |
|--------|---------|----------|
| General Purpose | Balanced compute | t3, t4g, m5, m6i |
| Compute Optimized | High performance | c5, c6i, c7g |
| Memory Optimized | Large memory | r5, r6i, x2 |
| Storage Optimized | High I/O | i3, d3, h1 |
| Accelerated Computing | GPU workloads | p4, g5, inf1 |

### S3 Storage Classes

| Class | Use Case | Cost |
|-------|----------|------|
| Standard | Frequent access | Higher |
| Intelligent-Tiering | Automatic optimization | Variable |
| Standard-IA | Infrequent access | Medium |
| One Zone-IA | Non-critical infrequent | Lower |
| Glacier Instant Retrieval | Archive with instant access | Low |
| Glacier Flexible Retrieval | Archive | Lower |
| Glacier Deep Archive | Long-term archive | Lowest |

### IAM Policy Elements

| Element | Purpose | Example |
|---------|---------|---------|
| Effect | Allow or Deny | Allow |
| Principal | Who is allowed | AWS account, user, role |
| Action | What is allowed | s3:GetObject |
| Resource | Which resources | arn:aws:s3:::bucket/* |
| Condition | When it applies | IP address, date/time |

### Database Options

| Service | Type | Use Case |
|---------|------|----------|
| RDS | Relational | MySQL, PostgreSQL, Oracle |
| Aurora | Relational | High performance MySQL/PostgreSQL |
| DynamoDB | NoSQL | Key-value, document store |
| ElastiCache | In-memory | Redis, Memcached |
| Redshift | Data warehouse | Analytics |
| DocumentDB | Document | MongoDB compatible |
| Neptune | Graph | Graph database |

### Load Balancer Types

| Type | Layer | Use Case |
|------|-------|----------|
| Application (ALB) | Layer 7 | HTTP/HTTPS traffic |
| Network (NLB) | Layer 4 | TCP/UDP traffic |
| Gateway (GWLB) | Layer 3 | Third-party appliances |
| Classic (CLB) | Layer 4/7 | Legacy (deprecated) |

### VPC Components

| Component | Purpose | Example |
|-----------|---------|---------|
| Subnet | Network segment | 10.0.1.0/24 |
| Internet Gateway | Internet access | Public traffic |
| NAT Gateway | Outbound internet | Private instances |
| Route Table | Traffic routing | Route definitions |
| Security Group | Instance firewall | Stateful rules |
| Network ACL | Subnet firewall | Stateless rules |
| VPC Peering | VPC connection | Inter-VPC traffic |

### CloudFormation Concepts

| Concept | Description |
|---------|-------------|
| Template | Infrastructure definition |
| Stack | Deployed resources |
| Change Set | Preview of changes |
| Drift | Unmanaged changes |
| Nested Stack | Modular templates |
| Stack Set | Multi-account deployment |

### Lambda Triggers

| Trigger | Use Case |
|---------|----------|
| API Gateway | HTTP requests |
| S3 | Object events |
| DynamoDB Streams | Table changes |
| SNS | Notifications |
| SQS | Queue messages |
| CloudWatch Events | Scheduled tasks |
| Kinesis | Stream processing |

### Monitoring Metrics

| Service | Key Metrics |
|---------|-------------|
| EC2 | CPUUtilization, NetworkIn/Out |
| RDS | DatabaseConnections, ReadLatency |
| Lambda | Invocations, Duration, Errors |
| S3 | NumberOfObjects, BucketSizeBytes |
| DynamoDB | ConsumedReadCapacity, UserErrors |
| ELB | RequestCount, TargetResponseTime |

### Security Best Practices

| Practice | Implementation |
|----------|----------------|
| Least privilege | Minimal IAM permissions |
| MFA | Multi-factor authentication |
| Encryption | At rest and in transit |
| Network isolation | VPC, security groups |
| Logging | CloudTrail, CloudWatch Logs |
| Secret management | Secrets Manager, Parameter Store |
| Patch management | Systems Manager |
| Compliance | AWS Config, Security Hub |

### Cost Optimization

| Strategy | Implementation |
|----------|----------------|
| Right-sizing | Match instance to workload |
| Reserved Instances | Commit for 1-3 years |
| Savings Plans | Flexible commitments |
| Spot Instances | Bid for unused capacity |
| Auto Scaling | Match capacity to demand |
| S3 lifecycle | Move to cheaper storage |
| Delete unused | Remove idle resources |
| Monitoring | Cost Explorer, Budgets |

### CLI Output Formats

| Format | Description | Usage |
|--------|-------------|-------|
| json | JSON format | Default, programmatic |
| yaml | YAML format | Human-readable |
| text | Tab-delimited | Scripting |
| table | ASCII table | Terminal viewing |

### Common CLI Options

| Option | Purpose | Example |
|--------|---------|---------|
| --profile | Named profile | --profile production |
| --region | AWS region | --region us-west-2 |
| --output | Output format | --output json |
| --query | JMESPath query | --query 'Reservations[].Instances[]' |
| --filters | Filter results | --filters Name=tag:Name,Values=web |
| --dry-run | Test without executing | --dry-run |

### AWS Regions

| Region Code | Location | Use Case |
|-------------|----------|----------|
| us-east-1 | N. Virginia | US East Coast |
| us-west-2 | Oregon | US West Coast |
| eu-west-1 | Ireland | Europe |
| ap-southeast-1 | Singapore | Southeast Asia |
| ap-northeast-1 | Tokyo | Japan |
| sa-east-1 | São Paulo | South America |

### Compliance Programs

| Program | Description |
|---------|-------------|
| SOC 1/2/3 | Security controls |
| PCI DSS | Payment card data |
| HIPAA | Healthcare data |
| FedRAMP | US government |
| ISO 27001 | Information security |
| GDPR | EU data protection |
