output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.test_lambda.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.test_lambda.arn
}

output "lambda_execution_role_arn" {
  description = "ARN of the IAM role used by the Lambda function"
  value       = aws_iam_role.iam_for_lambda.arn
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Log Group for the Lambda function"
  value       = aws_cloudwatch_log_group.example.name
}

output "vpc_subnet_ids" {
  description = "List of subnet IDs associated with the Lambda function"
  value       = var.subnet_ids
}

output "security_group_ids" {
  description = "List of security group IDs associated with the Lambda function"
  value       = var.security_group_ids
}



output "lambda_function_url_latest" {
  description = "Public URL of the Lambda function (latest)"
  value       = aws_lambda_function_url.test_live.function_url
}

output "lambda_function_url_live" {
  description = "Authenticated URL of the Lambda function (live)"
  value       = aws_lambda_function_url.test_live.function_url
}

//---

output "lambda_invocation_response" {
  description = "The response from the Lambda function invocation"
  value       = aws_lambda_invocation.example.result
}


output "lambda_invocation_triggers" {
  description = "The trigger value for Lambda invocation"
  value       = aws_lambda_invocation.example.triggers
}
