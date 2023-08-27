########################################################
# CPU Utilization                                      # 
########################################################
alarm_name        = "mysql-test-alarm"
DB_identifier_id  = "prod-versus-mysql-db"
evaluation_period = "1"
statistic_period  = "60"
metric_threshold  = "70"
db_instance_id    = "prod-versus-mysql-db"
tags              = {}
########################################################
# SNS topic creating and subscription                  # 
########################################################
topic_name                  = "rds-alarm"
receving_notification_email = "devopsstudy7@gmail.com"
