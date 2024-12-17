// outputs.tf

output "service_password" {
  description = "The generated password for the service-specific credential"
  value       = aws_iam_service_specific_credential.service_specific_credential_example.service_password
  sensitive   = true
}

output "service_user_name" {
  description = "The generated username for the service-specific credential"
  value       = aws_iam_service_specific_credential.service_specific_credential_example.service_user_name
}

output "service_specific_credential_id" {
  description = "The unique identifier for the service-specific credential"
  value       = aws_iam_service_specific_credential.service_specific_credential_example.service_specific_credential_id
}
