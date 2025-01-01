# SQS Queue Policy
resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.terraform_queue.id
  policy    = data.aws_iam_policy_document.test.json
}
