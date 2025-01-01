output "main_queue_url" {
  description = "The URL of the main SQS queue"
  value       = aws_sqs_queue.terraform_queue.id
}

output "deadletter_queue_url" {
  description = "The URL of the deadletter queue"
  value       = aws_sqs_queue.terraform_queue_deadletter.id
}

output "main_queue_arn" {
  description = "The ARN of the main SQS queue"
  value       = aws_sqs_queue.terraform_queue.arn
}

output "deadletter_queue_arn" {
  description = "The ARN of the deadletter queue"
  value       = aws_sqs_queue.terraform_queue_deadletter.arn
}

output "redrive_allow_policy" {
  description = "The redrive allow policy applied to the dead letter queue"
  value       = aws_sqs_queue_redrive_allow_policy.terraform_queue_redrive_allow_policy.redrive_allow_policy
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.example.arn
}

output "queue_policy" {
  description = "The policy attached to the SQS queue"
  value       = aws_sqs_queue_policy.test.policy
}