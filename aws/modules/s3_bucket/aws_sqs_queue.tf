# SQS Queue
resource "aws_sqs_queue" "queue" {
  name   = var.sqs_queue_name
  policy = data.aws_iam_policy_document.queue.json
}
