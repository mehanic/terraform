# Output the IAM User Name
output "user_name" {
  description = "The name of the IAM user."
  value       = aws_iam_user.example.name
}

# Output the Attached Managed Policies
output "attached_policies" {
  description = "List of ARNs of the managed policies attached to the IAM user."
  value       = aws_iam_user_policy_attachments_exclusive.example.policy_arns
}
