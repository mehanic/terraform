# SQS Queue Resource
resource "aws_sqs_queue" "user_updates_queue" {
  name = "user-updates-queue"
}