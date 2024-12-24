output "test_latest_function_url" {
  description = "The public function URL for the latest Lambda version"
  value       = aws_lambda_function_url.test_latest.function_url
}

output "test_live_function_url" {
  description = "The IAM-restricted function URL for the specified alias"
  value       = aws_lambda_function_url.test_live.function_url
}

output "test_live_function_arn" {
  description = "The ARN of the Lambda function associated with the live alias"
  value       = aws_lambda_function_url.test_live.function_arn
}
