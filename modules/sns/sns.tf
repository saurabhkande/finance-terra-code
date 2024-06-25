resource "aws_sns_topic" "codecommit_notifications_for_Dev_Repos" {
  for_each = var.codecommit_repositories
  name     = "${each.key}-topic"
}

resource "aws_sns_topic_subscription" "email_subscriptions" {
  for_each  = var.codecommit_repositories
  topic_arn = aws_sns_topic.codecommit_notifications_for_Dev_Repos[each.key].arn
  protocol  = "email"
  endpoint  = element(each.value, 0)  
}

data "aws_iam_policy_document" "notif_access" {
  for_each = var.codecommit_repositories

  statement {
    actions = ["sns:Publish"]

    principals {
      type        = "Service"
      identifiers = ["codestar-notifications.amazonaws.com"]
    }

    resources = [aws_sns_topic.codecommit_notifications_for_Dev_Repos[each.key].arn]
  }
}

resource "aws_sns_topic_policy" "default" {
  for_each = var.codecommit_repositories
  arn    = aws_sns_topic.codecommit_notifications_for_Dev_Repos[each.key].arn
  policy = data.aws_iam_policy_document.notif_access[each.key].json
}

resource "aws_codestarnotifications_notification_rule" "commits" {
  for_each              =  var.codecommit_repositories
  detail_type           = "BASIC"
  event_type_ids        = var.event_types
  
  name     = "${each.key}-notification-rule-latest"
  resource =  var.repository_arns[each.key]

  target {
    address = aws_sns_topic.codecommit_notifications_for_Dev_Repos[each.key].arn
  }
}
