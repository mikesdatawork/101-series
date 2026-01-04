# 101 Terraform Commands

## Overview
Terraform is an open-source Infrastructure as Code tool for building, changing, and versioning infrastructure safely and efficiently. This cheat sheet covers essential Terraform commands, workflow, state management, providers, modules, backends, workspaces, HCL syntax, and best practices critical for DevOps engineers and LPI DevOps Tools Engineer certification.

## Target Audience
- DevOps engineers provisioning infrastructure
- Platform engineers managing cloud resources
- Site reliability engineers automating deployments
- Cloud architects writing IaC
- Anyone preparing for LPI DevOps Tools Engineer

### 1. Installation and Setup (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| wget https://releases.hashicorp.com/terraform/*/terraform_*_linux_amd64.zip | Download binary | Install | wget latest version |
| unzip terraform_*.zip && sudo mv terraform /usr/local/bin/ | Install | Path | sudo chmod +x /usr/local/bin/terraform |
| terraform --version | Check version | Verify | terraform --version |
| terraform -help | List commands | Overview | terraform -help init |
| terraform version | Alias version | Short | terraform version |
| export TF_LOG=DEBUG | Enable logging | Debug | export TF_LOG=INFO |
| export TF_LOG_PATH=./terraform.log | Log file | Persist | export TF_LOG_PATH=debug.log |
| terraform -install-autocomplete | Shell completion | Bash/Zsh | terraform -install-autocomplete |

### 2. Basic Workflow (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform init | Initialize directory | Providers | terraform init |
| terraform init -upgrade | Upgrade providers | Latest | terraform init -upgrade |
| terraform init -reconfigure | Reconfigure backend | Migrate | terraform init -reconfigure |
| terraform fmt | Format code | Style | terraform fmt -recursive |
| terraform validate | Validate config | Syntax | terraform validate |
| terraform plan | Dry run | Preview | terraform plan -out=plan.tfplan |
| terraform plan -destroy | Destroy plan | Teardown | terraform plan -destroy |
| terraform apply | Apply changes | Create | terraform apply |
| terraform apply plan.tfplan | Apply saved plan | Reproducible | terraform apply plan.tfplan |
| terraform destroy | Destroy resources | Cleanup | terraform destroy |
| terraform refresh | Update state | Sync | terraform refresh |
| terraform show | Show state | Current | terraform show |

### 3. State Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform state list | List resources | Inventory | terraform state list |
| terraform state show aws_instance.web | Show resource | Details | terraform state show module.db.aws_db_instance.default |
| terraform state mv | Move resource | Refactor | terraform state mv aws_instance.old aws_instance.new |
| terraform state rm | Remove from state | Cleanup | terraform state rm aws_security_group.bad |
| terraform state pull | Download state | Backup | terraform state pull > state.json |
| terraform state push | Upload state | Restore | terraform state push state.json |
| terraform state replace-provider | Replace provider | Migrate | terraform state replace-provider hashicorp/aws registry.terraform.io/terraform-providers/aws |
| terraform import aws_instance.web i-12345678 | Import resource | Existing | terraform import module.vpc.aws_vpc.main vpc-123456 |
| terraform taint aws_instance.web | Mark tainted | Recreate | terraform taint module.app.aws_instance.server[0] |
| terraform untaint | Unmark tainted | Keep | terraform untaint aws_instance.web |
| terraform force-unlock LOCK_ID | Force unlock | Stuck | terraform force-unlock -force 12345 |
| terraform state list -id=ID | Filter by ID | Search | terraform state list -id=i-12345 |

### 4. Workspaces (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform workspace new dev | Create workspace | Environment | terraform workspace new prod |
| terraform workspace list | List workspaces | View | terraform workspace list |
| terraform workspace select dev | Switch workspace | Change | terraform workspace select staging |
| terraform workspace show | Current workspace | Active | terraform workspace show |
| terraform workspace delete old | Delete workspace | Cleanup | terraform workspace delete dev-old |
| terraform plan -var-file=dev.tfvars | Per-env vars | Alternative | terraform plan -var-file=prod.tfvars |
| terraform apply -var-file=dev.tfvars | Apply env | Specific | terraform apply -var-file=staging.tfvars |
| terraform console | Interactive | Test | terraform console |
| terraform console -var-file=dev.tfvars | With vars | Test | terraform console -var-file=prod.tfvars |
| terraform workspace new -state=old.tfstate legacy | From state | Migrate | terraform workspace new legacy -state=old.tfstate |

### 5. Providers and Modules (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform providers | List providers | Used | terraform providers |
| terraform providers mirror ./mirror | Mirror providers | Offline | terraform providers mirror ./offline |
| terraform get | Download modules | Init | terraform get -update |
| terraform graph | Dependency graph | Visualize | terraform graph | dot -Tsvg > graph.svg |
| terraform providers lock | Lock versions | Reproducible | terraform providers lock -platform=linux_amd64 |
| module "vpc" { source = "terraform-aws-modules/vpc/aws" } | Module usage | Reuse | version = "~> 5.0" |
| source = "./modules/app" | Local module | Relative | source = "../common" |
| source = "git::https://github.com/user/repo.git//modules/vpc" | Git module | Remote | source = "git::https://...//infra?ref=v1.2.0" |
| terraform init -backend-config="bucket=mybucket" | Backend config | Partial | terraform init -backend-config="env.tfbackend" |
| terraform login | Registry login | Modules | terraform login |

### 6. Variables and Outputs (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform apply -var="instance_type=t3.micro" | Inline var | Override | terraform apply -var="region=us-east-1" |
| terraform apply -var-file=prod.tfvars | Var file | Environment | terraform apply -var-file=dev.tfvars |
| terraform console | Test expressions | REPL | > var.instance_count |
| terraform output | List outputs | View | terraform output |
| terraform output instance_ip | Specific output | Get | terraform output -raw instance_ip |
| terraform output -json | JSON outputs | Scripts | terraform output -json |
| variable "region" { type = string default = "us-east-1" } | Variable | Config | nullable = false |
| variable "tags" { type = map(string) } | Map | Tags | default = { env = "dev" } |
| output "instance_id" { value = aws_instance.web.id } | Output | Expose | sensitive = true |
| terraform refresh -target=aws_instance.web | Refresh specific | Partial | terraform refresh -target=module.vpc |

### 7. Backend Configuration (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| backend "s3" { bucket = "mybucket" key = "prod/terraform.tfstate" region = "us-east-1" } | S3 backend | Remote | dynamodb_table = "lock" |
| backend "remote" { hostname = "app.terraform.io" organization = "company" workspaces { name = "prod" } } | TFC/TFE | Cloud | token = "xxx" |
| backend "consul" { address = "consul:8500" path = "terraform/state" } | Consul | Locking | gzip = true |
| terraform init -migrate-state | Migrate backend | Change | terraform init -migrate-state |
| terraform init -backend-config="bucket=newbucket" | Partial config | Dynamic | terraform init -backend-config="env.tfbackend" |
| terraform state pull > backup.tfstate | Backup state | Manual | terraform state pull > backup.tfstate |
| terraform state push backup.tfstate | Restore state | Recover | terraform state push restored.tfstate |
| terraform force-unlock | Unlock stuck | Emergency | terraform force-unlock -force ID |
| backend "pg" { conn_str = "postgres://..." schema_name = "terraform" } | PostgreSQL | DB | migrate = true |
| backend "local" { path = "terraform.tfstate" } | Local | Default | path = "state/prod.tfstate" |

### 8. Targeting and Dependencies (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform plan -target=aws_instance.web | Target resource | Partial | terraform plan -target=module.vpc |
| terraform apply -target=aws_security_group.sg | Target apply | Specific | terraform apply -target=aws_vpc.main |
| terraform destroy -target=aws_instance.web | Target destroy | Selective | terraform destroy -target=module.db |
| terraform plan -replace=aws_instance.web | Replace resource | Force | terraform plan -replace=module.app.aws_instance.server[0] |
| terraform apply -replace=... | Replace apply | Recreate | terraform apply -replace=aws_instance.bad |
| depends_on = [aws_security_group.sg] | Explicit dependency | Order | depends_on = [module.vpc] |
| terraform graph | Visualize deps | Debug | terraform graph | dot -Tpng > deps.png |
| terraform plan -parallelism=30 | Increase speed | Large | terraform plan -parallelism=50 |
| terraform apply -auto-approve | Non-interactive | CI | terraform apply -auto-approve |
| terraform plan -lock=false | Skip lock | Read-only | terraform plan -lock=false |

### 9. Modules and Registry (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| module "vpc" { source = "terraform-aws-modules/vpc/aws" version = "~> 5.0" } | Registry module | AWS | providers = { aws = aws.east } |
| source = "app.example.com/org/module" | Private registry | TFE | version = "1.2.3" |
| terraform get | Download modules | Init | terraform get |
| terraform get -update | Update modules | Latest | terraform get -update |
| terraform module list | List modules | Used | terraform providers |
| terraform init -from-module=./template | Init from module | Template | terraform init -from-module=local/template |
| module "consul" { source = "./modules/consul" count = 3 } | Local module | Reuse | for_each = toset(["a", "b"]) |
| terraform docs | Generate docs | Modules | terragrunt, tfdocs |

### 10. Validation and Formatting (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform fmt | Format | Style | terraform fmt -recursive |
| terraform fmt -check | Check format | CI | terraform fmt -check |
| terraform validate | Validate | Syntax | terraform validate |
| terraform plan -json | JSON plan | Scripts | terraform plan -json > plan.json |
| tflint | Lint | Best practices | tflint --init |
| terraform-compliance | BDD tests | Policy | terraform-compliance -f features/ |
| checkov -d . | Security scan | Static | checkov -d . --framework terraform |
| tfsec . | Security | Scan | tfsec . --format json |

### 11. Debugging and Logging (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| export TF_LOG=TRACE | Full debug | Verbose | export TF_LOG=DEBUG |
| export TF_LOG_PATH=./tf.log | Log file | Persist | export TF_LOG_PATH=debug.log |
| terraform plan -debug | Debug mode | Legacy | Use TF_LOG |
| terraform console | REPL | Test | > aws_instance.web.arn |
| terraform state list | grep aws_ | Search | terraform state list | grep db |
| terraform graph | Visualize | Debug | terraform graph > graph.dot |
| terraform show -json | JSON state | Scripts | terraform show -json > state.json |
| terraform providers schema -json | Provider schema | Debug | terraform providers schema -json |

### 12. Advanced State Operations (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform state mv module.old module.new | Move module | Refactor | terraform state mv module.db.old module.db.new |
| terraform state rm module.old | Remove module | Cleanup | terraform state rm module.legacy |
| terraform state pull | Remote state | Inspect | terraform state pull > remote.tfstate |
| terraform state push -force | Force push | Override | terraform state push -force new.tfstate |
| terraform refresh-only | Refresh only | Sync | terraform refresh-only -auto-approve |
| terraform apply -refresh-only | Refresh apply | Update state | terraform apply -refresh-only |
| terraform plan -refresh=false | Skip refresh | Fast | terraform plan -refresh=false |
| terraform import -var-file=prod.tfvars | Import with vars | Complex | terraform import -var-file=dev.tfvars aws_instance.web i-123 |

### 13. Terraform Cloud / Enterprise (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform login | Auth TFC/TFE | Cloud | terraform login |
| terraform logout | Logout | Cleanup | terraform logout |
| remote backend | Cloud backend | TFC | workspaces { name = "prod" } |
| terraform cloud | Cloud commands | Migrate | terraform cloud workspace list |
| terraform plan -out=tfplan.binary | Binary plan | VCS | terraform plan -out=tfplan.binary |
| terraform show -json tfplan.binary | Show binary | API | terraform show -json tfplan.binary |
| terraform force-unlock | Cloud unlock | Web UI | terraform force-unlock ID |
| terraform workspace list | Cloud workspaces | List | terraform workspace list |

### 14. Testing and Validation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform test | Run tests | tftest | terraform test |
| terraform plan -var-file=test.tfvars | Test vars | Validate | terraform plan -var-file=integration.tfvars |
| terraform console < input.txt | Batch console | Script | echo "var.instance_type" | terraform console |
| terraform validate -json | JSON validate | CI | terraform validate -json |
| terratest | Go testing | Advanced | go test |
| kitchen-terraform | Test Kitchen | Integration | kitchen test |
| tflint --init | Linter | Best practices | tflint |
| terraform-docs markdown . | Generate docs | README | terraform-docs markdown table . |

### 15. Security and Best Practices (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| terraform state rm | Remove secrets | Cleanup | terraform state rm aws_secretsmanager_secret.secret |
| sensitive = true | Mark sensitive | Output | sensitive = true |
| terraform apply -lock-timeout=60s | Lock timeout | Prevent wait | -lock-timeout=5m |
| terraform plan -parallelism=20 | Speed | Large | -parallelism=30 |
| terraform providers lock | Pin providers | Reproducible | terraform providers lock |
| backend s3 encrypt = true | Encrypt state | Security | encrypt = true |
| backend s3 acl = "private" | Private state | Access | acl = "bucket-owner-full-control" |
| terraform init -lockfile=readonly | Read-only lock | CI | -lockfile=readonly |
| terraform plan -detailed-exitcode | Exit codes | CI | 0=same, 1=error, 2=diff |
| terraform fmt -diff | Show changes | CI | terraform fmt -diff |

### 16. HCL Functions and Expressions (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| length(var.list) | Count items | Dynamic | length(var.subnets) |
| lookup(map, key, default) | Map lookup | Safe | lookup(var.tags, "env", "dev") |
| merge(map1, map2) | Merge maps | Tags | merge(var.common_tags, local.tags) |
| cidrsubnet(prefix, newbits, netnum) | Subnet calc | VPC | cidrsubnet("10.0.0.0/16", 8, 1) |
| timestamp() | Current time | Tags | timestamp() |
| formatdate("YYYY-MM-DD", timestamp()) | Format date | Naming | formatdate("YYYYMMDD", timestamp()) |
| file("path/to/file") | Read file | Config | file("${path.module}/user_data.sh") |
| templatefile("path", vars) | Template | User data | templatefile("${path.module}/script.tftpl", { name = "web" }) |
| jsonencode(object) | JSON | Policy | jsonencode(local.policy) |
| yamldecode(string) | YAML parse | Config | yamldecode(file("config.yaml")) |

### 17. Common Patterns (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| count = var.instance_count | Count meta | Multi | count = 3 |
| for_each = var.subnets | For each | Maps | for_each = toset(var.azs) |
| dynamic "ingress" { for_each = var.ports content { ... } } | Dynamic blocks | SG rules | dynamic "tag" |
| locals { tags = merge(var.tags, { env = var.env }) } | Locals | DRY | locals { name = "${var.env}-web" } |
| data "aws_ami" "latest" { most_recent = true } | Data source | Lookup | data "aws_vpc" "selected" |
| provider "aws" { alias = "west" region = "us-west-2" } | Multi-provider | Regions | provider "aws" { alias = "east" } |
| module "vpc" { providers = { aws = aws.west } } | Pass provider | Multi-region | providers = { aws = aws.east } |
| lifecycle { create_before_destroy = true } | Lifecycle | Order | prevent_destroy = true |
| resource "null_resource" "wait" { triggers = { always = timestamp() } } | Null resource | Delays | provisioner "local-exec" |
| terraform { required_providers { aws = { source = "hashicorp/aws" version = "~> 5.0" } } } | Required providers | Lock | required_version = ">= 1.5.0" |

## Tips and Best Practices
* Always use terraform init -upgrade sparingly in production.
* Store state remotely with locking and encryption.
* Use workspaces OR separate directories with tfvars, not both.
* Pin module and provider versions.
* Use terraform fmt and validate in CI.
* Never commit terraform.tfstate or .terraform/.
* Use -target sparingly—prefer modules.
* Mark sensitive outputs and variables.
* Use remote backends for team collaboration.
* Implement state locking with DynamoDB for S3.
* Use terraform cloud/enterprise for remote runs.
* Write comprehensive README.md with terraform-docs.
* Use count/for_each instead of multiple resources.
* Leverage data sources to fetch existing resources.
* Use terraform console for testing expressions.
* Implement proper tagging strategy.
* Use lifecycle rules for safe replacements.
* Test with terraform plan before apply.
* Use -auto-approve only in CI with saved plans.
* Regularly run terraform state list and prune unused resources.

## Additional Resources
* [Official Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [Terraform Best Practices](https://developer.hashicorp.com/terraform/tutorials/best-practices)
* [Terraform Registry](https://registry.terraform.io/)
* [HashiCorp Learn Terraform](https://learn.hashicorp.com/terraform)
* [Terraform CLI Reference](https://developer.hashicorp.com/terraform/cli/commands)
* [Gruntwork Terraform Guide](https://www.gruntwork.io/terraform)
* [Terraform Up & Running Book](https://www.terraformupandrunning.com/)
* [LPI DevOps Tools Engineer Objectives](https://www.lpi.org/our-certifications/devops-tools-engineer-overview)
* [Terraform CDK](https://developer.hashicorp.com/terraform/cdktf)
* [Terragrunt](https://terragrunt.gruntwork.io/)

## Mini-Glossary

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Provider | Cloud/API plugin |
| Resource | Infrastructure object |
| Data Source | Read existing |
| Module | Reusable config |
| State | Current infrastructure |
| Backend | State storage |
| Workspace | Environment isolation |
| Plan | Execution preview |
| Apply | Make changes |
| Destroy | Teardown |

### 2. State Management
| Term/Concept | Description |
| --- | --- |
| terraform.tfstate | State file |
| Remote backend | Cloud storage |
| State locking | Prevent conflicts |
| State migration | Backend change |
| Import | Bring under TF |
| Taint | Mark for recreate |
| Replace | Force replace |
| Refresh | Update state |
| Pull/Push | Manual state |
| Versioning | State history |

### 3. Configuration
| Term/Concept | Description |
| --- | --- |
| HCL | HashiCorp Config Language |
| .tf | Terraform files |
| .tfvars | Variable files |
| terraform.tfvars | Auto-loaded |
| Variables | Input parameters |
| Locals | Local constants |
| Outputs | Return values |
| Providers | API connectors |
| Required providers | Version lock |
| Meta-arguments | count, for_each, depends_on |

### 4. Execution
| Term/Concept | Description |
| --- | --- |
| Init | Download providers/modules |
| Validate | Syntax check |
| Plan | Preview changes |
| Apply | Execute plan |
| Destroy | Remove all |
| Refresh | Sync state |
| Graph | Dependency visual |
| Console | Expression REPL |
| Taint | Mark bad |
| Import | Existing infra |

### 5. Advanced
| Term/Concept | Description |
| --- | --- |
| Module | Encapsulated config |
| Registry | Public modules |
| Version constraint | ~>, >=, etc |
| Count | Multiple instances |
| For_each | Map/set iteration |
| Dynamic blocks | Conditional blocks |
| Lifecycle | Creation/destroy rules |
| Provisioner | Post-create actions |
| Null resource | Script runner |
| Sensitive | Hide in output |

### 6. Security
| Term/Concept | Description |
| --- | --- |
| State encryption | At-rest |
| Remote state | Access control |
| Sensitive flag | Hide values |
| Secrets management | Vault integration |
| Sentinel | Policy as code (Enterprise) |
| No credentials | IAM roles |
| State lock | DynamoDB |
| Private module registry | TFE |
| Run triggers | API |
| Drift detection | Plan on schedule |

### 7. Best Practices
| Term/Concept | Description |
| --- | --- |
| Remote state | Team collab |
| State locking | Safety |
| Module reuse | DRY |
| Version pinning | Reproducible |
| Naming convention | Consistent |
| Tagging strategy | Cost/ownership |
| CI/CD integration | Automated |
| Code review | PR process |
| Documentation | README/docs |
| Testing | terratest |

### 8. Tools
| Term/Concept | Description |
| --- | --- |
| Terragrunt | DRY wrapper |
| tfenv | Version manager |
| tflint | Linter |
| tfsec/checkov | Security scanner |
| terraform-docs | Auto docs |
| Infracost | Cost estimation |
| Atlantis | PR automation |
| Terraform Cloud | Remote runs |
| TFC/TFE | Enterprise |
| Spacelift | Alternative platform |

### 9. Cloud Providers
| Term/Concept | Description |
| --- | --- |
| AWS | Most mature |
| Azure | azurerm |
| GCP | google |
| Kubernetes | Civo/DigitalOcean |
| Cloudflare | DNS |
| Vault | Secrets |
| PostgreSQL | DB |
| Helm | K8s packages |
| Docker | Container |
| GitHub | Actions integration |

### 10. IaC Patterns
| Term/Concept | Description |
| --- | --- |
| Immutable infra | Replace not modify |
| GitOps | Git as source |
| Policy as code | OPA/Sentinel |
| Drift detection | Regular plan |
| Golden image | Packer + TF |
| Service catalog | Modules |
| Landing zones | Pre-configured |
| Multi-account | AWS Org |
| Multi-region | Replication |
| Zero trust | Least privilege |

