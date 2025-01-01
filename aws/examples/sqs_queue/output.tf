output "main_queue_url" {
  description = "The URL of the main SQS queue"
  value       = module.s3_backet.main_queue_url
}

output "deadletter_queue_url" {
  description = "The URL of the deadletter queue"
  value       = module.s3_backet.deadletter_queue_url
}

output "main_queue_arn" {
  description = "The ARN of the main SQS queue"
  value       = module.s3_backet.main_queue_arn
}

output "deadletter_queue_arn" {
  description = "The ARN of the deadletter queue"
  value       = module.s3_backet.deadletter_queue_arn
}

output "redrive_allow_policy" {
  description = "The redrive allow policy applied to the dead letter queue"
  value       = module.s3_backet.redrive_allow_policy
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.s3_backet.sns_topic_arn
}

output "queue_policy" {
  description = "The policy attached to the SQS queue"
  value       = module.s3_backet.queue_policy
}