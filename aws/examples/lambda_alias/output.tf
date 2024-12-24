output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda_alias.lambda_function_arn
}

output "lambda_alias_arn" {
  description = "ARN of the Lambda alias"
  value       = module.lambda_alias.lambda_alias_arn
}

output "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda alias for API Gateway"
  value       = module.lambda_alias.lambda_invoke_arn
}
