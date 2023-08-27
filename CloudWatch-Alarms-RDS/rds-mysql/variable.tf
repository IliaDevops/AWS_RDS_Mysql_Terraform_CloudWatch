########################################################
# CPU Utilization                                      # 
########################################################
variable "alarm_name" {
  type = string
}
variable "DB_identifier_id" {
  type = string
}
variable "evaluation_period" {
  type = string
}
variable "statistic_period" {
  type = string
}
variable "metric_threshold" {
  type = string
}
variable "db_instance_id" {
  type = string
}
variable "tags" {
  type = map(string)
}
########################################################
# SNS topic creating and subscription                  # 
########################################################
variable "topic_name" {
  type = string
}
variable "receving_notification_email" {
  type = string
}


