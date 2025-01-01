output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.sns_platform.sns_topic_arn
}

output "sns_topic_name" {
  description = "The name of the SNS topic"
  value       = module.sns_platform.sns_topic_name
}



output "sqs_queue_arn" {
  description = "The ARN of the created SQS queue."
  value       = module.sns_platform.sqs_queue_arn
}

output "sns_subscription_id" {
  description = "The ID of the SNS topic subscription."
  value       = module.sns_platform.sns_subscription_id
}

output "sns_data_protection_policy" {
  description = "The data protection policy applied to the SNS topic"
  value       = module.sns_platform.sns_data_protection_policy
}

output "sms_preferences_configuration" {
  description = "The configured settings for SNS SMS Preferences"
  value       = module.sns_platform.sms_preferences_configuration
}
