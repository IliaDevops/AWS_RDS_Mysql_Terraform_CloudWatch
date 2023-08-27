module "alarm" {
  source = "../alarm"

  alarm_name                  = var.alarm_name
  DB_identifier_id            = var.DB_identifier_id
  evaluation_period           = var.evaluation_period
  statistic_period            = var.statistic_period
  metric_threshold            = var.metric_threshold
  db_instance_id              = var.db_instance_id
  tags                        = {}
  topic_name                  = var.topic_name
  receving_notification_email = var.receving_notification_email

}

