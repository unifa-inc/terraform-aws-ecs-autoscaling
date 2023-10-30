locals {
  low_alarm      = var.alarm_suffix == null ? "cpu_utilization_low" : format("cpu_utilization_low_%s", var.alarm_suffix)
  high_alarm     = var.alarm_suffix == null ? "cpu_utilization_high" : format("cpu_utilization_high_%s", var.alarm_suffix)
  mem_high_alarm = var.alarm_suffix == null ? "memory_utilization_high" : format("memory_utilization_high_%s", var.alarm_suffix)
  down_clooldown = var.down_autoscaling_cooldown == null ? var.autoscaling_cooldown : var.down_autoscaling_cooldown
  up_clooldown   = var.up_autoscaling_cooldown == null ? var.autoscaling_cooldown : var.up_autoscaling_cooldown
}

resource aws_appautoscaling_target ecs_target {
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", var.cluster_name, var.service_name)
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = var.autoscaling_role_arn
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
}

resource aws_appautoscaling_policy scale_up {
  name               = "scale_up"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", var.cluster_name, var.service_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = local.up_clooldown
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = var.scaling_size
    }
  }

  depends_on = [aws_appautoscaling_target.ecs_target]
}

resource aws_appautoscaling_policy scale_down {
  name               = "scale_down"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", var.cluster_name, var.service_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = local.down_clooldown
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -var.scaling_size
    }
  }

  depends_on = [aws_appautoscaling_target.ecs_target]
}

resource aws_cloudwatch_metric_alarm cpu_high {
  alarm_name          = local.high_alarm
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.up_cpu_threshold

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }

  alarm_actions = [aws_appautoscaling_policy.scale_up.arn, var.alarm_sns_arn]
  ok_actions    = [var.alarm_sns_arn]
}

resource aws_cloudwatch_metric_alarm cpu_low {
  alarm_name          = local.low_alarm
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.down_cpu_threshold

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }

  alarm_actions = [aws_appautoscaling_policy.scale_down.arn, var.alarm_sns_arn]
  ok_actions    = [var.alarm_sns_arn]
}

resource aws_cloudwatch_metric_alarm memory_high {
  alarm_name          = local.mem_high_alarm
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.up_memory_threshold

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }

  alarm_actions = [var.alarm_sns_arn]
  ok_actions    = [var.alarm_sns_arn]
}