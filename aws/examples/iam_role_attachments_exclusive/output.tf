# Output IAM Role Name
output "role_name" {
  description = "The name of the IAM role."
  value       = module.iam_role_attachments_exclusive.role_name
}

# Output Managed Policy ARN
output "managed_policy_arn" {
  description = "The ARN of the managed IAM policy."
  value       = module.iam_role_attachments_exclusive.managed_policy_arn
}
