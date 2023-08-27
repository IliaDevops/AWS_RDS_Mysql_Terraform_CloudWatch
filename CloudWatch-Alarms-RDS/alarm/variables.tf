########################################################
# CPU Utilization                                      # 
########################################################
variable "alarm_name" {
  type        = string
  default     = "mysql-test-alarm"
  description = "The name of alarm"
}

variable "DB_identifier_id" {
  type        = string
  default     = "dev-versus-mysql-db"
  description = "The ID of actual DB to apply alarm and what alarm be track"

}

variable "evaluation_period" {
  type        = string
  default     = "1"
  description = "The evaluation period over which to use when triggering alarms."
}

variable "statistic_period" {
  type        = string
  default     = "60"
  description = "The number of seconds that make each statistic period."
}

variable "metric_threshold" {
  type        = string
  default     = "40"
  description = "Alarm threshold for the 'highCPUUtilization' alarm"
}

variable "db_instance_id" {
  type        = string
  default     = "dev-versus-mysql-db"
  description = "RDS Instance ID"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to attach to each alarm"
}

########################################################
# SNS topic creating and subscription                  # 
########################################################
variable "topic_name" {
  type        = string
  default     = "rds-alarm"
  description = "The SNS topic actual name"
}

variable "receving_notification_email" {
  type        = string
  default     = "devopsstudy7@gmail.com"
  description = "Email for notification receiving"
}

