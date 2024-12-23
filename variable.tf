variable "cluster_name" {
  description = "Cluster name"
}
variable "service_name" {
  description = "Service name"
}
variable "autoscaling_role_arn" {
  type        = string
  description = "Arn of autoscale role"
}
variable "alarm_suffix" {
  type        = string
  default     = ""
  description = "Alarm suffix"
}
variable "autoscaling_cooldown" {
  type        = number
  default     = 600
  description = "Autoscaling cool down time"
}
variable "up_autoscaling_cooldown" {
  type        = number
  default     = null
  description = "Up autoscaling cool down time"
}
variable "down_autoscaling_cooldown" {
  type        = number
  default     = null
  description = "Down autoscaling cool down time"
}
variable "min_capacity" {
  type        = number
  default     = 1
  description = "Min capacity of ecs service"
}
variable "max_capacity" {
  type        = number
  default     = 2
  description = "Max capacity of ecs service"
}
variable "scaling_size" {
  type        = number
  default     = 1
  description = "Scaling size"
}
variable "cpu_alarm_statistic" {
  type        = string
  default     = "Average"
  description = "Statistics to set for cpu alarm"
}
variable "up_cpu_threshold" {
  type        = number
  default     = 60
  description = "Up cpu threshold"
}
variable "down_cpu_threshold" {
  type        = number
  default     = 30
  description = "Down cpu threshold"
}
variable "cpu_evaluation_periods_scaling" {
  type    = number
  default = 2
}
variable "cpu_evaluation_periods_notification" {
  type    = number
  default = 2
}
variable "cpu_period" {
  type    = number
  default = 60
}
variable "memory_alarm_statistic" {
  type        = string
  default     = "Average"
  description = "Statistics to set for memory alarm"
}
variable "up_memory_threshold" {
  type        = number
  default     = 60
  description = "Up memory threshold"
}
variable "memory_evaluation_periods" {
  type    = number
  default = 2
}
variable "memory_period" {
  type    = number
  default = 60
}
variable "alarm_sns_arn" {
  type        = string
  description = "Arn of alarm sns topic"
}