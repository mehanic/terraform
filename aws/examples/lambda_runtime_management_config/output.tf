output "lambda_function_arn" {
  description = "The ARN of the Lambda function."
  value       = module.lambda_runtime_management_config.lambda_function_arn
}

output "runtime_management_function_arn" {
  description = "The ARN of the function for runtime management."
  value       = module.lambda_runtime_management_config.runtime_management_function_arn
}

# Output for the Lambda function name
output "lambda_function_name" {
  description = "The name of the Lambda function."
  value       = module.lambda_runtime_management_config.lambda_function_name
}

# Output for the Lambda execution role ARN
output "lambda_execution_role_arn" {
  description = "The ARN of the IAM role assumed by the Lambda function."
  value       = module.lambda_runtime_management_config.lambda_execution_role_arn
}

# Output for runtime management configuration
output "runtime_management_update_mode" {
  description = "The runtime update mode of the Lambda function."
  value       = module.lambda_runtime_management_config.runtime_management_update_mode
}

# (Optional) Output for environment variables if needed
output "lambda_environment_variables" {
  description = "Environment variables configured for the Lambda function."
  value       = module.lambda_runtime_management_config.lambda_environment_variables
}
