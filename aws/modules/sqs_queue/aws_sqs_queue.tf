# Dead Letter Queue
resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name = "${var.queue_name}-deadletter"
  tags = {
    Environment = var.environment
  }
}

# Main Queue
resource "aws_sqs_queue" "terraform_queue" {
  name = var.queue_name

  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = {
    Environment = var.environment
  }
}
