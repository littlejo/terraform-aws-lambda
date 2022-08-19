## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudevent_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [archive_file.this](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloud_watch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_event_description"></a> [cloudwatch\_event\_description](#input\_cloudwatch\_event\_description) | Name of cloud watch event\_name | `string` | `"Launch a lambda"` | no |
| <a name="input_cloudwatch_event_event_pattern"></a> [cloudwatch\_event\_event\_pattern](#input\_cloudwatch\_event\_event\_pattern) | Event pattern for schedule (json) | `string` | `null` | no |
| <a name="input_cloudwatch_event_is_enabled"></a> [cloudwatch\_event\_is\_enabled](#input\_cloudwatch\_event\_is\_enabled) | If you want to disable your cloudwatch event | `bool` | `true` | no |
| <a name="input_cloudwatch_event_name"></a> [cloudwatch\_event\_name](#input\_cloudwatch\_event\_name) | Name of cloud watch event\_name | `string` | `""` | no |
| <a name="input_cloudwatch_event_schedule_expression"></a> [cloudwatch\_event\_schedule\_expression](#input\_cloudwatch\_event\_schedule\_expression) | Cron expression of schedule | `string` | `null` | no |
| <a name="input_cloudwatch_event_target_id"></a> [cloudwatch\_event\_target\_id](#input\_cloudwatch\_event\_target\_id) | Target id of cloudwatch event | `string` | `null` | no |
| <a name="input_create_cloudwatch_event"></a> [create\_cloudwatch\_event](#input\_create\_cloudwatch\_event) | If you want to create a cloud watch event | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | description of the lambda | `string` | `null` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Function name of the lambda | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Function entrypoint in your code | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Iam role name | `string` | `""` | no |
| <a name="input_inline_policy_name"></a> [inline\_policy\_name](#input\_inline\_policy\_name) | Inline Policy Name | `string` | `"lambda_policy"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Policy of the lambda | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime of lambda function, eg: python3.8 | `string` | n/a | yes |
| <a name="input_source_content"></a> [source\_content](#input\_source\_content) | Content file of the lambda | `string` | n/a | yes |
| <a name="input_source_content_filename"></a> [source\_content\_filename](#input\_source\_content\_filename) | filename of source content | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | timeout of lambda function | `number` | `3` | no |

## Outputs

No outputs.
