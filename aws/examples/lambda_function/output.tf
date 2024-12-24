output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda_function.lambda_function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda_function.lambda_function_arn
}

output "lambda_execution_role_arn" {
  description = "ARN of the IAM role used by the Lambda function"
  value       = module.lambda_function.lambda_execution_role_arn
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Log Group for the Lambda function"
  value       = module.lambda_function.cloudwatch_log_group_name
}

output "vpc_subnet_ids" {
  description = "List of subnet IDs associated with the Lambda function"
  value       = module.lambda_function.vpc_subnet_ids
}

output "security_group_ids" {
  description = "List of security group IDs associated with the Lambda function"
  value       = module.lambda_function.security_group_ids
}


output "lambda_function_url_latest" {
  description = "Public URL of the Lambda function (latest)"
  value       = module.lambda_function.lambda_function_url_latest
}

output "lambda_function_url_live" {
  description = "Authenticated URL of the Lambda function (live)"
  value       = module.lambda_function.lambda_function_url_live
}

//--

# output "lambda_invocation_response" {
#   description = "The response from the Lambda function invocation"
#   value       = module.lambda_function.lambda_invocation_response
# }


# output "lambda_invocation_triggers" {
#   description = "The trigger value for Lambda invocation"
#   value       = module.lambda_function.lambda_invocation_triggers
# }
