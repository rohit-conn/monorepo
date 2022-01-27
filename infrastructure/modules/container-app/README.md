## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | 6.5.0 |
| <a name="module_execution_role"></a> [execution\_role](#module\_execution\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 4.6.0 |
| <a name="module_security_group_alb"></a> [security\_group\_alb](#module\_security\_group\_alb) | terraform-aws-modules/security-group/aws | 4.3.0 |
| <a name="module_security_group_ecs"></a> [security\_group\_ecs](#module\_security\_group\_ecs) | terraform-aws-modules/security-group/aws | 4.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role_policy.execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repo"></a> [ecr\_repo](#input\_ecr\_repo) | ECR repo identifier | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the fargate project | `string` | `"container_app"` | no |
| <a name="input_port"></a> [port](#input\_port) | Port of the service | `number` | `5000` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private subnets in VPC | `list(string)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Public subnets in VPC | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id to be used | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | n/a |
