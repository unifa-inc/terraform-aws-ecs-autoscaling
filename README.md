## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.scale_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.ecs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_metric_alarm.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_sns_arn"></a> [alarm\_sns\_arn](#input\_alarm\_sns\_arn) | Arn of alarm sns topic | `string` | n/a | yes |
| <a name="input_alarm_suffix"></a> [alarm\_suffix](#input\_alarm\_suffix) | Alarm suffix | `string` | `""` | no |
| <a name="input_autoscaling_cooldown"></a> [autoscaling\_cooldown](#input\_autoscaling\_cooldown) | Autoscaling cool down time | `number` | `600` | no |
| <a name="input_autoscaling_role_arn"></a> [autoscaling\_role\_arn](#input\_autoscaling\_role\_arn) | Arn of autoscale role | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `any` | n/a | yes |
| <a name="input_down_autoscaling_cooldown"></a> [down\_autoscaling\_cooldown](#input\_down\_autoscaling\_cooldown) | Down autoscaling cool down time | `number` | `null` | no |
| <a name="input_down_cpu_threshold"></a> [down\_cpu\_threshold](#input\_down\_cpu\_threshold) | Down cpu threshold | `number` | `30` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Max capacity of ecs service | `number` | `2` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Min capacity of ecs service | `number` | `1` | no |
| <a name="input_scaling_size"></a> [scaling\_size](#input\_scaling\_size) | Scaling size | `number` | `1` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service name | `any` | n/a | yes |
| <a name="input_up_autoscaling_cooldown"></a> [up\_autoscaling\_cooldown](#input\_up\_autoscaling\_cooldown) | Up autoscaling cool down time | `number` | `null` | no |
| <a name="input_up_cpu_threshold"></a> [up\_cpu\_threshold](#input\_up\_cpu\_threshold) | Up cpu threshold | `number` | `60` | no |
| <a name="input_up_memory_threshold"></a> [up\_memory\_threshold](#input\_up\_memory\_threshold) | Up memory threshold | `number` | `60` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_resource_id"></a> [autoscaling\_resource\_id](#output\_autoscaling\_resource\_id) | Resource id |
| <a name="output_autoscaling_scalable_dimension"></a> [autoscaling\_scalable\_dimension](#output\_autoscaling\_scalable\_dimension) | Scalable dimension |
| <a name="output_autoscaling_service_name"></a> [autoscaling\_service\_name](#output\_autoscaling\_service\_name) | Service name |
| <a name="output_scale_down_arn"></a> [scale\_down\_arn](#output\_scale\_down\_arn) | Arn of scale down ecs service |
| <a name="output_scale_up_arn"></a> [scale\_up\_arn](#output\_scale\_up\_arn) | Arn of scale up ecs service |
<!-- END_TF_DOCS -->