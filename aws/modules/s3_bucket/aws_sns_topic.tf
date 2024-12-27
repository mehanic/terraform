resource "aws_sns_topic" "topic" {
  name   = var.sns_topic_name
  policy = data.aws_iam_policy_document.topic.json
}