output "lambda_function_arn" {
  description = "The ARN of the created Lambda function"
  value       = aws_lambda_function.example.arn
}

output "lambda_alias_arn" {
  description = "The ARN of the Lambda alias"
  value       = aws_lambda_alias.example.arn
}

output "provisioned_concurrency_id" {
  description = "The ID of the provisioned concurrency configuration"
  value       = aws_lambda_provisioned_concurrency_config.example.id
}
