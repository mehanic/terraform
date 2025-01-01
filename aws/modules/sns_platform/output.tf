output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.user_updates.arn
}

output "sns_topic_name" {
  description = "The name of the SNS topic"
  value       = aws_sns_topic.user_updates.name
}



output "sqs_queue_arn" {
  description = "The ARN of the created SQS queue."
  value       = aws_sqs_queue.user_updates_queue.arn
}

output "sns_subscription_id" {
  description = "The ID of the SNS topic subscription."
  value       = aws_sns_topic_subscription.user_updates_sqs_target.id
}



output "sns_data_protection_policy" {
  description = "The data protection policy applied to the SNS topic"
  value       = aws_sns_topic_data_protection_policy.example.policy
}




# output "sms_preferences" {
#   description = "SNS SMS Preferences settings"
#   value       = aws_sns_sms_preferences.update_sms_prefs
# }

output "sms_preferences_configuration" {
  description = "The configured settings for SNS SMS Preferences"
  value = {
    monthly_spend_limit                   = aws_sns_sms_preferences.update_sms_prefs.monthly_spend_limit
    delivery_status_iam_role_arn          = aws_sns_sms_preferences.update_sms_prefs.delivery_status_iam_role_arn
    delivery_status_success_sampling_rate = aws_sns_sms_preferences.update_sms_prefs.delivery_status_success_sampling_rate
    default_sender_id                     = aws_sns_sms_preferences.update_sms_prefs.default_sender_id
    default_sms_type                      = aws_sns_sms_preferences.update_sms_prefs.default_sms_type
    usage_report_s3_bucket                = aws_sns_sms_preferences.update_sms_prefs.usage_report_s3_bucket
  }
}
