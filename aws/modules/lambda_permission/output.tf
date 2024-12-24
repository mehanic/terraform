output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.log_processor_lambda.arn
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.sns_topic.arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.custom_logs.name
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.custom_logs.arn
}

output "lambda_execution_role_arn" {
  description = "The ARN of the IAM role used for Lambda execution"
  value       = aws_iam_role.lambda_execution_role.arn
}
