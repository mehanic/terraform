output "lambda_function_arn" {
  description = "The ARN of the Lambda function."
  value       = aws_lambda_function.test.arn
}

output "runtime_management_function_arn" {
  description = "The ARN of the function for runtime management."
  value       = aws_lambda_runtime_management_config.example.function_arn
}


# Output for the Lambda function name
output "lambda_function_name" {
  description = "The name of the Lambda function."
  value       = aws_lambda_function.test.function_name
}

# Output for the Lambda execution role ARN
output "lambda_execution_role_arn" {
  description = "The ARN of the IAM role assumed by the Lambda function."
  value       = aws_iam_role.lambda_execution_role.arn
}

# Output for runtime management configuration
output "runtime_management_update_mode" {
  description = "The runtime update mode of the Lambda function."
  value       = aws_lambda_runtime_management_config.example.update_runtime_on
}

# (Optional) Output for environment variables if needed
output "lambda_environment_variables" {
  description = "Environment variables configured for the Lambda function."
  value       = aws_lambda_function.test.environment[0].variables
}
