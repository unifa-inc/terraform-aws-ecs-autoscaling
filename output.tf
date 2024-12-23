output autoscaling_service_name {
  value       = aws_appautoscaling_target.ecs_target.service_namespace
  description = "Service name"
}

output autoscaling_resource_id {
  value       = aws_appautoscaling_target.ecs_target.resource_id
  description = "Resource id"
}

output autoscaling_scalable_dimension {
  value       = aws_appautoscaling_target.ecs_target.scalable_dimension
  description = "Scalable dimension"
}

output scale_up_arn {
  value       = aws_appautoscaling_policy.scale_up.arn
  description = "Arn of scale up ecs service"
}

output scale_down_arn {
  value       = aws_appautoscaling_policy.scale_down.arn
  description = "Arn of scale down ecs service"
}