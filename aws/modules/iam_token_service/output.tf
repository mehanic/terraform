# Output the AWS Account ID
output "account_id" {
  description = "The AWS Account ID where the STS preferences are configured."
  value       = aws_iam_security_token_service_preferences.security_token_service_preferences_example.id
}
