output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.lambda_function_test.arn
}

output "lambda_alias_arn" {
  description = "ARN of the Lambda alias"
  value       = aws_lambda_alias.test_lambda_alias.arn
}

output "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda alias for API Gateway"
  value       = aws_lambda_alias.test_lambda_alias.invoke_arn
}
