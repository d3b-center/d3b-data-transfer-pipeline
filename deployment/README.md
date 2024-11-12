# D3b Data Transfer INFRA

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_batch_compute_environment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment) | resource |
| [aws_batch_job_definition.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_definition) | resource |
| [aws_batch_job_queue.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue) | resource |
| [aws_iam_instance_profile.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.batch_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.spot_fleet_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.step_functions_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.secrets_ecs_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.step_functions_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.batch_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.spot_fleet_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_key_pair.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_template.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sfn_state_machine.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.batch_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ec2_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.secrets_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.spot_fleet_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.step_functions_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.step_functions_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | n/a | `string` | n/a | yes |
| <a name="input_aws_administrator_access_policy_arn"></a> [aws\_administrator\_access\_policy\_arn](#input\_aws\_administrator\_access\_policy\_arn) | n/a | `string` | `"arn:aws:iam::aws:policy/AdministratorAccess"` | no |
| <a name="input_aws_batch_service_role_policy_arn"></a> [aws\_batch\_service\_role\_policy\_arn](#input\_aws\_batch\_service\_role\_policy\_arn) | n/a | `string` | `"arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"` | no |
| <a name="input_aws_ec2_service_role_policy_arn"></a> [aws\_ec2\_service\_role\_policy\_arn](#input\_aws\_ec2\_service\_role\_policy\_arn) | n/a | `string` | `"arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"` | no |
| <a name="input_aws_spot_fleet_service_role_policy_arn"></a> [aws\_spot\_fleet\_service\_role\_policy\_arn](#input\_aws\_spot\_fleet\_service\_role\_policy\_arn) | n/a | `string` | `"arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"` | no |
| <a name="input_bastion_public_key"></a> [bastion\_public\_key](#input\_bastion\_public\_key) | n/a | `string` | n/a | yes |
| <a name="input_batch_instance_types"></a> [batch\_instance\_types](#input\_batch\_instance\_types) | n/a | `list(string)` | <pre>[<br/>  "c5d",<br/>  "m5d",<br/>  "z1d"<br/>]</pre> | no |
| <a name="input_batch_max_vcpus"></a> [batch\_max\_vcpus](#input\_batch\_max\_vcpus) | n/a | `number` | `256` | no |
| <a name="input_batch_min_vcpus"></a> [batch\_min\_vcpus](#input\_batch\_min\_vcpus) | n/a | `number` | `0` | no |
| <a name="input_batch_root_block_device_size"></a> [batch\_root\_block\_device\_size](#input\_batch\_root\_block\_device\_size) | n/a | `number` | `32` | no |
| <a name="input_batch_root_block_device_type"></a> [batch\_root\_block\_device\_type](#input\_batch\_root\_block\_device\_type) | n/a | `string` | `"gp3"` | no |
| <a name="input_batch_spot_fleet_allocation_strategy"></a> [batch\_spot\_fleet\_allocation\_strategy](#input\_batch\_spot\_fleet\_allocation\_strategy) | n/a | `string` | `"SPOT_CAPACITY_OPTIMIZED"` | no |
| <a name="input_batch_spot_fleet_bid_percentage"></a> [batch\_spot\_fleet\_bid\_percentage](#input\_batch\_spot\_fleet\_bid\_percentage) | n/a | `number` | `64` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | An environment namespace for the infrastructure. | `string` | n/a | yes |
| <a name="input_etl_memory"></a> [etl\_memory](#input\_etl\_memory) | n/a | `number` | `4096` | no |
| <a name="input_etl_vcpus"></a> [etl\_vcpus](#input\_etl\_vcpus) | n/a | `number` | `1` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | n/a | `string` | `"684194535433.dkr.ecr.us-east-1.amazonaws.com/d3b-dff-data-transfer-pipeline"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | GitHub Commit | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | A project namespace for the infrastructure. | `string` | `"d3b-data-transfer-pipeline"` | no |
| <a name="input_region"></a> [region](#input\_region) | A valid AWS region to configure the underlying AWS SDK. | `string` | `"us-east-1"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |
| <a name="input_vpc_private_subnet_ids"></a> [vpc\_private\_subnet\_ids](#input\_vpc\_private\_subnet\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_public_subnet_ids"></a> [vpc\_public\_subnet\_ids](#input\_vpc\_public\_subnet\_ids) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->