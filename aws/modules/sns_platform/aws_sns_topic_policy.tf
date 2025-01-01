# Define SNS Topic Policy
resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.user_updates.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json

  depends_on = [
    aws_sns_topic.user_updates
  ]
}
