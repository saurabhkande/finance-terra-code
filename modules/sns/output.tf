output "sns_topic_arns" {
  value = { for name, topic in aws_sns_topic.codecommit_notifications_for_Dev_Repos : name => topic.arn }
}