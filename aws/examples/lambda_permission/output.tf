output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda_permission.lambda_function_arn
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.lambda_permission.sns_topic_arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group"
  value       = module.lambda_permission.cloudwatch_log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group"
  value       = module.lambda_permission.cloudwatch_log_group_arn
}

output "lambda_execution_role_arn" {
  description = "The ARN of the IAM role used for Lambda execution"
  value       = module.lambda_permission.lambda_execution_role_arn
}


