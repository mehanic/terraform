# Output IAM caller details
output "current_user_arn" {
  description = "ARN of the current user or assumed role."
  value       = module.data_session_context.current_user_arn
}

output "current_user_id" {
  description = "Account ID of the current IAM entity."
  value       = module.data_session_context.current_user_id
}

# Outputs for the IAM session context
output "issuer_arn" {
  description = "Source role ARN if an assumed role, otherwise the ARN itself."
  value       = module.data_session_context.issuer_arn
}

output "issuer_name" {
  description = "Name of the source IAM role that issued the STS assumed role."
  value       = module.data_session_context.issuer_name
}

output "session_name" {
  description = "Session name of the STS session."
  value       = module.data_session_context.session_name
}