# 101 AWS S3 Commands

## Overview
Amazon S3 (Simple Storage Service) is a scalable object storage service for storing and retrieving any amount of data. This cheat sheet covers essential AWS CLI commands for buckets, objects, versioning, lifecycle policies, security, replication, and advanced features. Mastering these commands enables efficient data lake management, backups, static websites, and ML model storage.

## Target Audience
- Data engineers building data lakes
- DevOps engineers managing backups
- ML engineers storing datasets
- Web developers hosting static sites
- Anyone working with cloud storage

### 1. Bucket Management (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3 mb s3://mybucket | Create bucket | New bucket | aws s3 mb s3://mybucket |
| aws s3 rb s3://mybucket | Remove bucket | Delete empty | aws s3 rb s3://mybucket |
| aws s3 rb s3://mybucket --force | Force remove | Delete with objects | aws s3 rb s3://mybucket --force |
| aws s3 ls | List all buckets | View buckets | aws s3 ls |
| aws s3 ls s3://mybucket | List objects in bucket | View contents | aws s3 ls s3://mybucket |
| aws s3api create-bucket --bucket mybucket --region us-east-1 | Create with region | Specific region | aws s3api create-bucket --bucket mybucket --region us-east-1 |
| aws s3api delete-bucket --bucket mybucket | Delete via API | Force delete | aws s3api delete-bucket --bucket mybucket |
| aws s3api put-bucket-policy --bucket mybucket --policy file://policy.json | Apply policy | Security | aws s3api put-bucket-policy --bucket mybucket --policy file://policy.json |
| aws s3api get-bucket-policy --bucket mybucket | View policy | Audit | aws s3api get-bucket-policy --bucket mybucket |
| aws s3api delete-bucket-policy --bucket mybucket | Remove policy | Reset | aws s3api delete-bucket-policy --bucket mybucket |
| aws s3api put-bucket-ownership-controls --bucket mybucket --ownership-controls 'OwnershipControls={Rules=[{ObjectOwnership=BucketOwnerPreferred}]}' | Ownership control | ACLs | aws s3api put-bucket-ownership-controls --bucket mybucket --ownership-controls 'OwnershipControls={Rules=[{ObjectOwnership=BucketOwnerPreferred}]}' |
| aws s3api put-bucket-acl --bucket mybucket --acl private | Set ACL | Access control | aws s3api put-bucket-acl --bucket mybucket --acl private |

### 2. Object Operations (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3 cp localfile.txt s3://mybucket/ | Upload file | Single file | aws s3 cp localfile.txt s3://mybucket/ |
| aws s3 cp s3://mybucket/file.txt localfile.txt | Download file | Retrieve | aws s3 cp s3://mybucket/file.txt localfile.txt |
| aws s3 mv localfile.txt s3://mybucket/ | Move/upload | Move to S3 | aws s3 mv localfile.txt s3://mybucket/ |
| aws s3 mv s3://mybucket/file.txt s3://mybucket/newfile.txt | Move in bucket | Rename | aws s3 mv s3://mybucket/file.txt s3://mybucket/newfile.txt |
| aws s3 sync localdir/ s3://mybucket/dir/ | Sync directory | Upload dir | aws s3 sync localdir/ s3://mybucket/dir/ |
| aws s3 sync s3://mybucket/dir/ localdir/ | Download sync | Mirror | aws s3 sync s3://mybucket/dir/ localdir/ |
| aws s3 rm s3://mybucket/file.txt | Delete object | Remove | aws s3 rm s3://mybucket/file.txt |
| aws s3 rm s3://mybucket/dir/ --recursive | Delete directory | Recursive | aws s3 rm s3://mybucket/dir/ --recursive |
| aws s3 ls s3://mybucket --recursive | Recursive list | All objects | aws s3 ls s3://mybucket --recursive |
| aws s3 cp s3://mybucket/file.txt - | Pipe download | Stdout | aws s3 cp s3://mybucket/file.txt - |
| aws s3 cp - s3://mybucket/file.txt | Pipe upload | Stdin | echo "data" | aws s3 cp - s3://mybucket/file.txt |
| aws s3api put-object --bucket mybucket --key file.txt --body localfile.txt | API upload | Advanced | aws s3api put-object --bucket mybucket --key file.txt --body localfile.txt |

### 3. Versioning (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-versioning --bucket mybucket --versioning-configuration Status=Enabled | Enable versioning | Backup | aws s3api put-bucket-versioning --bucket mybucket --versioning-configuration Status=Enabled |
| aws s3api get-bucket-versioning --bucket mybucket | Check status | Verify | aws s3api get-bucket-versioning --bucket mybucket |
| aws s3api list-object-versions --bucket mybucket | List versions | View history | aws s3api list-object-versions --bucket mybucket |
| aws s3api delete-object --bucket mybucket --key file.txt --version-id versionid | Delete version | Cleanup | aws s3api delete-object --bucket mybucket --key file.txt --version-id versionid |
| aws s3api delete-objects --bucket mybucket --delete 'Objects=[{Key=file.txt,VersionId=versionid}]' | Batch delete | Bulk | aws s3api delete-objects --bucket mybucket --delete 'Objects=[{Key=file.txt,VersionId=versionid}]' |
| aws s3api put-object --bucket mybucket --key file.txt --body localfile.txt | Upload new version | Versioning | aws s3api put-object --bucket mybucket --key file.txt --body localfile.txt |
| aws s3 ls s3://mybucket --recursive --human-readable --summarize | Summarize with versions | Stats | aws s3 ls s3://mybucket --recursive --human-readable --summarize |
| aws s3api put-bucket-versioning --bucket mybucket --versioning-configuration Status=Suspended | Suspend versioning | Stop | aws s3api put-bucket-versioning --bucket mybucket --versioning-configuration Status=Suspended |

### 4. Lifecycle Policies (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration file://lifecycle.json | Apply lifecycle | Transition/delete | aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration file://lifecycle.json |
| aws s3api get-bucket-lifecycle-configuration --bucket mybucket | View lifecycle | Audit | aws s3api get-bucket-lifecycle-configuration --bucket mybucket |
| aws s3api delete-bucket-lifecycle --bucket mybucket | Remove lifecycle | Reset | aws s3api delete-bucket-lifecycle --bucket mybucket |
| aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[{"ID":"Rule1","Status":"Enabled","Filter":{"Prefix":"logs/"},"Transitions":[{"Days":30,"StorageClass":"STANDARD_IA"}],"Expiration":{"Days":365}}]}' | Inline policy | Quick | aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[{"ID":"Rule1","Status":"Enabled","Filter":{"Prefix":"logs/"},"Transitions":[{"Days":30,"StorageClass":"STANDARD_IA"}],"Expiration":{"Days":365}}]}' |
| aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[{"ID":"Glacier","Status":"Enabled","Filter":{"Prefix":""},"Transitions":[{"Days":90,"StorageClass":"GLACIER"}],"Expiration":{"Days":3650}}]}' | Glacier archive | Cold storage | aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[{"ID":"Glacier","Status":"Enabled","Filter":{"Prefix":""},"Transitions":[{"Days":90,"StorageClass":"GLACIER"}],"Expiration":{"Days":3650}}]}' |
| aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[{"ID":"DeleteOld","Status":"Enabled","Expiration":{"Days":7}}]}' | Delete old | Cleanup | aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[{"ID":"DeleteOld","Status":"Enabled","Expiration":{"Days":7}}]}' |
| aws s3api get-bucket-lifecycle-configuration --bucket mybucket | Check policy | Verify | aws s3api get-bucket-lifecycle-configuration --bucket mybucket |
| aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[]}' | Clear policy | Reset | aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration '{"Rules":[]}' |

### 5. Security and Access (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-acl --bucket mybucket --acl public-read | Public read | Website | aws s3api put-bucket-acl --bucket mybucket --acl public-read |
| aws s3api put-bucket-acl --bucket mybucket --acl private | Private | Secure | aws s3api put-bucket-acl --bucket mybucket --acl private |
| aws s3api put-bucket-policy --bucket mybucket --policy file://public-policy.json | Public policy | Static site | aws s3api put-bucket-policy --bucket mybucket --policy file://public-policy.json |
| aws s3api put-bucket-encryption --bucket mybucket --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}' | SSE-S3 | Encryption | aws s3api put-bucket-encryption --bucket mybucket --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}' |
| aws s3api get-bucket-encryption --bucket mybucket | View encryption | Audit | aws s3api get-bucket-encryption --bucket mybucket |
| aws s3api put-bucket-encryption --bucket mybucket --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"aws:kms","KMSMasterKeyID":"keyid"}}]}' | SSE-KMS | KMS | aws s3api put-bucket-encryption --bucket mybucket --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"aws:kms","KMSMasterKeyID":"keyid"}}]}' |
| aws s3api delete-bucket-encryption --bucket mybucket | Disable encryption | Reset | aws s3api delete-bucket-encryption --bucket mybucket |
| aws s3api put-public-access-block --bucket mybucket --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" | Block public | Security | aws s3api put-public-access-block --bucket mybucket --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" |
| aws s3api get-public-access-block --bucket mybucket | Check block | Audit | aws s3api get-public-access-block --bucket mybucket |
| aws s3api put-bucket-logging --bucket mybucket --logging-configuration file://logging.json | Enable logging | Audit | aws s3api put-bucket-logging --bucket mybucket --logging-configuration file://logging.json |

### 6. Replication and Cross-Region (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-replication --bucket source --replication-configuration file://replication.json | Enable replication | Backup | aws s3api put-bucket-replication --bucket source --replication-configuration file://replication.json |
| aws s3api get-bucket-replication --bucket source | View replication | Check | aws s3api get-bucket-replication --bucket source |
| aws s3api delete-bucket-replication --bucket source | Disable replication | Reset | aws s3api delete-bucket-replication --bucket source |
| aws s3api put-bucket-replication --bucket source --replication-configuration '{"Role":"arn:aws:iam::account:role/replication","Rules":[{"ID":"Rule1","Status":"Enabled","Priority":1,"DeleteMarkerReplication":{"Status":"Disabled"},"Filter":{"Prefix":"data/"},"Destination":{"Bucket":"arn:aws:s3:::destbucket","StorageClass":"STANDARD_IA"},"SourceSelectionCriteria":{"SseKmsEncryptedObjects":{"Status":"Enabled"}}]}]}' | Complex replication | Advanced | aws s3api put-bucket-replication --bucket source --replication-configuration '{"Role":"arn:aws:iam::account:role/replication","Rules":[{"ID":"Rule1","Status":"Enabled","Priority":1,"DeleteMarkerReplication":{"Status":"Disabled"},"Filter":{"Prefix":"data/"},"Destination":{"Bucket":"arn:aws:s3:::destbucket","StorageClass":"STANDARD_IA"},"SourceSelectionCriteria":{"SseKmsEncryptedObjects":{"Status":"Enabled"}}]}]}' |
| aws s3 sync s3://sourcebucket/ s3://destbucket/ --source-region us-east-1 --region us-west-2 | Manual sync | Cross-region | aws s3 sync s3://sourcebucket/ s3://destbucket/ --source-region us-east-1 --region us-west-2 |
| aws s3api put-bucket-versioning --bucket destbucket --versioning-configuration Status=Enabled | Enable versioning on dest | Replication | aws s3api put-bucket-versioning --bucket destbucket --versioning-configuration Status=Enabled |
| aws s3api put-bucket-replication --bucket source --replication-configuration file://crrr.json | CRR | Cross-region | aws s3api put-bucket-replication --bucket source --replication-configuration file://crrr.json |
| aws s3api put-bucket-replication --bucket source --replication-configuration file://srr.json | SRR | Same-region | aws s3api put-bucket-replication --bucket source --replication-configuration file://srr.json |

### 7. Static Website Hosting (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3 website s3://mybucket --index-document index.html --error-document error.html | Enable website | Static site | aws s3 website s3://mybucket --index-document index.html --error-document error.html |
| aws s3api put-bucket-website --bucket mybucket --website-configuration file://website.json | Advanced website | Config | aws s3api put-bucket-website --bucket mybucket --website-configuration file://website.json |
| aws s3api get-bucket-website --bucket mybucket | View website config | Check | aws s3api get-bucket-website --bucket mybucket |
| aws s3api delete-bucket-website --bucket mybucket | Disable website | Reset | aws s3api delete-bucket-website --bucket mybucket |
| aws s3 sync localwebsite/ s3://mybucket --acl public-read | Upload public | Website | aws s3 sync localwebsite/ s3://mybucket --acl public-read |
| aws s3 cp index.html s3://mybucket/ --acl public-read | Upload index | Public | aws s3 cp index.html s3://mybucket/ --acl public-read |
| aws s3api put-bucket-policy --bucket mybucket --policy file://website-policy.json | Public read policy | Website | aws s3api put-bucket-policy --bucket mybucket --policy file://website-policy.json |
| aws s3 ls s3://mybucket --recursive --exclude "*" --include "*.html" | List HTML files | Audit | aws s3 ls s3://mybucket --recursive --exclude "*" --include "*.html" |

### 8. Multipart Uploads (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api create-multipart-upload --bucket mybucket --key largefile.zip | Start upload | Large files | aws s3api create-multipart-upload --bucket mybucket --key largefile.zip |
| aws s3api upload-part --bucket mybucket --key largefile.zip --part-number 1 --body part1 --upload-id uploadid | Upload part | Chunk | aws s3api upload-part --bucket mybucket --key largefile.zip --part-number 1 --body part1 --upload-id uploadid |
| aws s3api list-multipart-uploads --bucket mybucket | List uploads | Monitor | aws s3api list-multipart-uploads --bucket mybucket |
| aws s3api abort-multipart-upload --bucket mybucket --key largefile.zip --upload-id uploadid | Abort upload | Cancel | aws s3api abort-multipart-upload --bucket mybucket --key largefile.zip --upload-id uploadid |
| aws s3api complete-multipart-upload --bucket mybucket --key largefile.zip --upload-id uploadid --multipart-upload file://parts.json | Complete upload | Finalize | aws s3api complete-multipart-upload --bucket mybucket --key largefile.zip --upload-id uploadid --multipart-upload file://parts.json |
| aws s3 cp largefile.zip s3://mybucket/ --multipart-chunk-size-mb 100 | Multipart copy | Large | aws s3 cp largefile.zip s3://mybucket/ --multipart-chunk-size-mb 100 |
| aws s3 sync largefiles/ s3://mybucket/ --multipart-chunk-size-mb 50 | Sync with multipart | Bulk | aws s3 sync largefiles/ s3://mybucket/ --multipart-chunk-size-mb 50 |
| aws s3api list-parts --bucket mybucket --key largefile.zip --upload-id uploadid | List parts | Check | aws s3api list-parts --bucket mybucket --key largefile.zip --upload-id uploadid |

### 9. Intelligent-Tiering and Storage Classes (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-object --bucket mybucket --key file.txt --body file.txt --storage-class INTELLIGENT_TIERING | Intelligent tiering | Auto | aws s3api put-object --bucket mybucket --key file.txt --body file.txt --storage-class INTELLIGENT_TIERING |
| aws s3 cp localfile.txt s3://mybucket/ --storage-class STANDARD_IA | IA class | Infrequent | aws s3 cp localfile.txt s3://mybucket/ --storage-class STANDARD_IA |
| aws s3 cp localfile.txt s3://mybucket/ --storage-class GLACIER | Glacier | Archive | aws s3 cp localfile.txt s3://mybucket/ --storage-class GLACIER |
| aws s3api put-object --bucket mybucket --key file.txt --body file.txt --storage-class DEEP_ARCHIVE | Deep archive | Cold | aws s3api put-object --bucket mybucket --key file.txt --body file.txt --storage-class DEEP_ARCHIVE |
| aws s3api copy-object --bucket source --copy-source sourcebucket/file.txt --key newfile.txt --storage-class GLACIER | Change class | Transition | aws s3api copy-object --bucket source --copy-source sourcebucket/file.txt --key newfile.txt --storage-class GLACIER |
| aws s3api head-object --bucket mybucket --key file.txt | View storage class | Check | aws s3api head-object --bucket mybucket --key file.txt |
| aws s3 sync s3://source/ s3://dest/ --storage-class INTELLIGENT_TIERING | Sync with class | Migrate | aws s3 sync s3://source/ s3://dest/ --storage-class INTELLIGENT_TIERING |
| aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration file://tiering.json | Auto tiering | Lifecycle | aws s3api put-bucket-lifecycle-configuration --bucket mybucket --lifecycle-configuration file://tiering.json |

### 10. Presigned URLs (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3 presign s3://mybucket/file.txt --expires-in 3600 | Generate presigned | Share | aws s3 presign s3://mybucket/file.txt --expires-in 3600 |
| aws s3api generate-presigned-url --bucket mybucket --key file.txt --expires-in 86400 | Long presigned | Download | aws s3api generate-presigned-url --bucket mybucket --key file.txt --expires-in 86400 |
| aws s3api generate-presigned-url --bucket mybucket --key file.txt --http-method PUT --expires-in 3600 | Upload presigned | Client upload | aws s3api generate-presigned-url --bucket mybucket --key file.txt --http-method PUT --expires-in 3600 |
| aws s3 presign s3://mybucket/file.txt --expires-in 604800 | Week-long URL | Share | aws s3 presign s3://mybucket/file.txt --expires-in 604800 |
| aws s3api generate-presigned-url --bucket mybucket --key file.txt --expires-in 300 --http-method GET | Short URL | Temporary | aws s3api generate-presigned-url --bucket mybucket --key file.txt --expires-in 300 --http-method GET |
| aws s3api generate-presigned-url --bucket mybucket --key file.txt --expires-in 0 | Permanent URL | Public | aws s3api generate-presigned-url --bucket mybucket --key file.txt --expires-in 0 |

### 11. Inventory and Analytics (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-inventory-configuration --bucket mybucket --id inventory --inventory-configuration file://inventory.json | Enable inventory | Reports | aws s3api put-bucket-inventory-configuration --bucket mybucket --id inventory --inventory-configuration file://inventory.json |
| aws s3api get-bucket-inventory-configuration --bucket mybucket --id inventory | View inventory | Check | aws s3api get-bucket-inventory-configuration --bucket mybucket --id inventory |
| aws s3api list-bucket-inventory-configurations --bucket mybucket | List configs | View | aws s3api list-bucket-inventory-configurations --bucket mybucket |
| aws s3api delete-bucket-inventory-configuration --bucket mybucket --id inventory | Remove inventory | Cleanup | aws s3api delete-bucket-inventory-configuration --bucket mybucket --id inventory |
| aws s3api put-bucket-analytics-configuration --bucket mybucket --id analytics --analytics-configuration file://analytics.json | Enable analytics | Metrics | aws s3api put-bucket-analytics-configuration --bucket mybucket --id analytics --analytics-configuration file://analytics.json |
| aws s3api get-bucket-analytics-configuration --bucket mybucket --id analytics | View analytics | Check | aws s3api get-bucket-analytics-configuration --bucket mybucket --id analytics |

### 12. Transfer Acceleration (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-accelerate-configuration --bucket mybucket --accelerate-configuration Status=Enabled | Enable acceleration | Fast transfer | aws s3api put-bucket-accelerate-configuration --bucket mybucket --accelerate-configuration Status=Enabled |
| aws s3api get-bucket-accelerate-configuration --bucket mybucket | Check status | Verify | aws s3api get-bucket-accelerate-configuration --bucket mybucket |
| aws s3api put-bucket-accelerate-configuration --bucket mybucket --accelerate-configuration Status=Suspended | Disable | Reset | aws s3api put-bucket-accelerate-configuration --bucket mybucket --accelerate-configuration Status=Suspended |
| aws s3 cp largefile.zip s3://mybucket/ --endpoint-url https://s3-accelerate.amazonaws.com | Accelerated upload | Fast | aws s3 cp largefile.zip s3://mybucket/ --endpoint-url https://s3-accelerate.amazonaws.com |
| aws s3 sync localdir/ s3://mybucket/ --endpoint-url https://s3-accelerate.amazonaws.com | Accelerated sync | Bulk | aws s3 sync localdir/ s3://mybucket/ --endpoint-url https://s3-accelerate.amazonaws.com |
| aws s3api get-bucket-location --bucket mybucket | Check region | Acceleration | aws s3api get-bucket-location --bucket mybucket |

### 13. Cross-Origin Resource Sharing (CORS) (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-cors --bucket mybucket --cors-configuration file://cors.json | Enable CORS | Web access | aws s3api put-bucket-cors --bucket mybucket --cors-configuration file://cors.json |
| aws s3api get-bucket-cors --bucket mybucket | View CORS | Check | aws s3api get-bucket-cors --bucket mybucket |
| aws s3api delete-bucket-cors --bucket mybucket | Remove CORS | Reset | aws s3api delete-bucket-cors --bucket mybucket |
| aws s3api put-bucket-cors --bucket mybucket --cors-configuration '{"CORSRules":[{"AllowedOrigins":["*"],"AllowedMethods":["GET","PUT"],"AllowedHeaders":["*"]}]}' | Simple CORS | Quick | aws s3api put-bucket-cors --bucket mybucket --cors-configuration '{"CORSRules":[{"AllowedOrigins":["*"],"AllowedMethods":["GET","PUT"],"AllowedHeaders":["*"]}]}' |
| aws s3api put-bucket-cors --bucket mybucket --cors-configuration '{"CORSRules":[{"AllowedOrigins":["https://example.com"],"AllowedMethods":["GET"],"MaxAgeSeconds":3000}]}' | Restricted CORS | Secure | aws s3api put-bucket-cors --bucket mybucket --cors-configuration '{"CORSRules":[{"AllowedOrigins":["https://example.com"],"AllowedMethods":["GET"],"MaxAgeSeconds":3000}]}' |
| aws s3api put-bucket-cors --bucket mybucket --cors-configuration '{"CORSRules":[]}' | Clear CORS | Reset | aws s3api put-bucket-cors --bucket mybucket --cors-configuration '{"CORSRules":[]}' |

### 14. Tags and Cost Allocation (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-tagging --bucket mybucket --tagging 'TagSet=[{Key=Project,Value=DataLake},{Key=Env,Value=Prod}]' | Add tags | Billing | aws s3api put-bucket-tagging --bucket mybucket --tagging 'TagSet=[{Key=Project,Value=DataLake},{Key=Env,Value=Prod}]' |
| aws s3api get-bucket-tagging --bucket mybucket | View tags | Check | aws s3api get-bucket-tagging --bucket mybucket |
| aws s3api delete-bucket-tagging --bucket mybucket | Remove tags | Reset | aws s3api delete-bucket-tagging --bucket mybucket |
| aws s3api put-object-tagging --bucket mybucket --key file.txt --tagging 'TagSet=[{Key=Type,Value=Raw}]' | Object tags | Granular | aws s3api put-object-tagging --bucket mybucket --key file.txt --tagging 'TagSet=[{Key=Type,Value=Raw}]' |
| aws s3api get-object-tagging --bucket mybucket --key file.txt | View object tags | Audit | aws s3api get-object-tagging --bucket mybucket --key file.txt |
| aws s3api delete-object-tagging --bucket mybucket --key file.txt | Remove object tags | Reset | aws s3api delete-object-tagging --bucket mybucket --key file.txt |

### 15. Requester Pays (6)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-bucket-request-payment --bucket mybucket --request-payment-configuration 'Payer=Requester' | Enable requester pays | Shared | aws s3api put-bucket-request-payment --bucket mybucket --request-payment-configuration 'Payer=Requester' |
| aws s3api get-bucket-request-payment --bucket mybucket | Check status | Verify | aws s3api get-bucket-request-payment --bucket mybucket |
| aws s3api put-bucket-request-payment --bucket mybucket --request-payment-configuration 'Payer=BucketOwner' | Disable | Reset | aws s3api put-bucket-request-payment --bucket mybucket --request-payment-configuration 'Payer=BucketOwner' |
| aws s3 ls s3://mybucket --request-payer requester | List with payer | Access | aws s3 ls s3://mybucket --request-payer requester |
| aws s3 cp s3://mybucket/file.txt . --request-payer requester | Download with payer | Access | aws s3 cp s3://mybucket/file.txt . --request-payer requester |
| aws s3 sync s3://mybucket/ local/ --request-payer requester | Sync with payer | Bulk | aws s3 sync s3://mybucket/ local/ --request-payer requester |

### 16. Advanced Sync and Copy (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3 sync s3://source/ s3://dest/ --exclude "*.log" --include "*.txt" | Filtered sync | Selective | aws s3 sync s3://source/ s3://dest/ --exclude "*.log" --include "*.txt" |
| aws s3 sync s3://source/ s3://dest/ --delete | Mirror delete | Sync | aws s3 sync s3://source/ s3://dest/ --delete |
| aws s3 sync local/ s3://mybucket/ --dryrun | Dry run | Preview | aws s3 sync local/ s3://mybucket/ --dryrun |
| aws s3 sync s3://mybucket/ s3://archive/ --storage-class GLACIER | Class change | Archive | aws s3 sync s3://mybucket/ s3://archive/ --storage-class GLACIER |
| aws s3 cp s3://mybucket/file.txt s3://destbucket/ --recursive | Recursive copy | Bulk | aws s3 cp s3://mybucket/file.txt s3://destbucket/ --recursive |
| aws s3 cp s3://mybucket/dir/ s3://dest/ --exclude "*" --include "*.gz" | Filtered copy | Selective | aws s3 cp s3://mybucket/dir/ s3://dest/ --exclude "*" --include "*.gz" |
| aws s3 sync s3://mybucket/ s3://dest/ --source-region us-east-1 --region us-west-2 | Cross-region | CRR manual | aws s3 sync s3://mybucket/ s3://dest/ --source-region us-east-1 --region us-west-2 |
| aws s3 mv s3://mybucket/old/ s3://mybucket/new/ --recursive | Move dir | Rename | aws s3 mv s3://mybucket/old/ s3://mybucket/new/ --recursive |

### 17. Monitoring and Metrics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| aws s3api put-metric-configuration --bucket mybucket --id metrics --metric-configuration file://metrics.json | Enable metrics | Monitoring | aws s3api put-metric-configuration --bucket mybucket --id metrics --metric-configuration file://metrics.json |
| aws s3api get-metric-configuration --bucket mybucket --id metrics | View metrics | Check | aws s3api get-metric-configuration --bucket mybucket --id metrics |
| aws s3api delete-metric-configuration --bucket mybucket --id metrics | Remove metrics | Reset | aws s3api delete-metric-configuration --bucket mybucket --id metrics |
| aws cloudwatch get-metric-statistics --namespace AWS/S3 --metric-name NumberOfObjects --dimensions Name=BucketName,Value=mybucket Name=StorageType,Value=AllStorageTypes --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 86400 --statistics Average | CloudWatch metrics | Monitor | aws cloudwatch get-metric-statistics --namespace AWS/S3 --metric-name NumberOfObjects --dimensions Name=BucketName,Value=mybucket Name=StorageType,Value=AllStorageTypes --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 86400 --statistics Average |
| aws cloudwatch get-metric-statistics --namespace AWS/S3 --metric-name BucketSizeBytes --dimensions Name=BucketName,Value=mybucket Name=StorageType,Value=StandardStorage --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 86400 --statistics Average | Size metrics | Storage | aws cloudwatch get-metric-statistics --namespace AWS/S3 --metric-name BucketSizeBytes --dimensions Name=BucketName,Value=mybucket Name=StorageType,Value=StandardStorage --start-time 2025-01-01T00:00:00Z --end-time 2025-01-02T00:00:00Z --period 86400 --statistics Average |
| aws s3api put-bucket-metrics-configuration --bucket mybucket --id metrics --metrics-configuration file://metrics.json | Bucket metrics | Advanced | aws s3api put-bucket-metrics-configuration --bucket mybucket --id metrics --metrics-configuration file://metrics.json |
| aws s3api get-bucket-metrics-configuration --bucket mybucket --id metrics | View config | Check | aws s3api get-bucket-metrics-configuration --bucket mybucket --id metrics |
| aws s3api list-bucket-metrics-configurations --bucket mybucket | List configs | View | aws s3api list-bucket-metrics-configurations --bucket mybucket |
| aws s3api delete-bucket-metrics-configuration --bucket mybucket --id metrics | Remove config | Reset | aws s3api delete-bucket-metrics-configuration --bucket mybucket --id metrics |
| aws cloudwatch list-metrics --namespace AWS/S3 --dimensions Name=BucketName,Value=mybucket | List metrics | Audit | aws cloudwatch list-metrics --namespace AWS/S3 --dimensions Name=BucketName,Value=mybucket |

## Tips and Best Practices
* Use aws s3 sync for directory operations instead of cp for efficiency.
* Always enable versioning for critical buckets to prevent accidental deletions.
* Apply lifecycle policies early to manage costs with transitions to IA/Glacier.
* Use presigned URLs for secure, temporary sharing without public buckets.
* Enable block public access and bucket policies for security.
* Monitor with CloudWatch metrics for usage and costs.
* Use requester pays for public datasets where users pay transfer costs.
* Tag buckets and objects for cost allocation and governance.
* Use --dryrun with sync/cp to preview changes before executing.
* Prefer SSE-S3 or SSE-KMS for encryption at rest.
* Use acceleration endpoints for faster global transfers.
* Clean up incomplete multipart uploads with list-multipart-uploads and abort.
* Use --exclude/--include filters carefully to avoid unintended syncs.
* Enable logging for audit trails on sensitive buckets.
* Use S3 Inventory for large-scale auditing and compliance.

## Additional Resources
* [AWS S3 CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/s3/)
* [AWS S3 API Reference](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html)
* [S3 Best Practices Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/best-practices.html)
* [S3 Security Best Practices](https://docs.aws.amazon.com/AmazonS3/latest/userguide/security-best-practices.html)
* [S3 Lifecycle Configuration](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html)
* [S3 Replication](https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication.html)
* [S3 Storage Classes](https://aws.amazon.com/s3/storage-classes/)
* [S3 Presigned URLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ShareObjectPreSignedURL.html)

## Mini-Glossary
This mini-glossary defines key terms related to AWS S3.

### 1. Bucket Basics
| Term/Concept | Description |
| --- | --- |
| Bucket | Container for objects |
| Object | File or data unit |
| Key | Object path/name |
| Region | Bucket location |
| Version ID | Unique version identifier |
| Storage Class | Access tier (Standard, IA, Glacier) |
| Lifecycle | Auto transition/delete rules |
| Replication | Cross-region or same-region copy |

### 2. Security
| Term/Concept | Description |
| --- | --- |
| Bucket Policy | JSON access rules |
| ACL | Legacy access control |
| Public Access Block | Prevent public exposure |
| SSE-S3 | Server-side encryption AES256 |
| SSE-KMS | Encryption with KMS |
| Requester Pays | User pays transfer costs |
| CORS | Cross-origin access |
| Logging | Server access logs |

### 3. Operations
| Term/Concept | Description |
| --- | --- |
| Sync | Mirror directories |
| Multipart Upload | Chunked large files |
| Presigned URL | Temporary access link |
| Inventory | CSV reports of objects |
| Analytics | Usage metrics |
| Transfer Acceleration | Faster global uploads |
| Versioning | Keep object history |
| Tagging | Metadata for billing |

### 4. Storage Classes
| Term/Concept | Description |
| --- | --- |
| STANDARD | Frequent access |
| STANDARD_IA | Infrequent access |
| INTELLIGENT_TIERING | Auto tiering |
| ONEZONE_IA | Single AZ IA |
| GLACIER | Archive retrieval |
| GLACIER_DEEP_ARCHIVE | Long-term archive |
| REDUCED_REDUNDANCY | Lower durability |
| OUTPOSTS | On-prem S3 |

### 5. Advanced
| Term/Concept | Description |
| --- | --- |
| CRR | Cross-region replication |
| SRR | Same-region replication |
| Metrics | Bucket/object monitoring |
| Lifecycle Rules | Transition/expiration |
| Requester Pays | Shared costs |
| Static Website | Host HTML sites |
| Multipart | Parallel uploads |
| Presigned | Time-limited URLs |

### 6. Commands
| Term/Concept | Description |
| --- | --- |
| mb/rb | Make/remove bucket |
| cp/mv/sync | Copy/move/sync |
| ls | List buckets/objects |
| rm | Remove objects |
| presign | Generate presigned |
| website | Enable static site |
| lifecycle | Manage policies |
| replication | Enable replication |

### 7. Monitoring
| Term/Concept | Description |
| --- | --- |
| CloudWatch | Metrics/alarms |
| Access Logs | Server logging |
| Inventory | Object reports |
| Analytics | Usage analytics |
| Health | Configuration checks |
| :health | Diagnostics |
| :log-open | View logs |
| :config-open | Edit config |

### 8. Best Practices
| Term/Concept | Description |
| --- | --- |
| Versioning | Prevent loss |
| Lifecycle | Cost control |
| Encryption | Security |
| Public Block | Avoid leaks |
| Tagging | Billing |
| Replication | DR |
| Acceleration | Speed |
| Presigned | Sharing |

