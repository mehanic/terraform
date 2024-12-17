# Output IAM Role Name
output "role_name" {
  description = "The name of the IAM role."
  value       = aws_iam_role.role_policies_exclusive_aws_iam_role.name
}

# Output Managed Policy ARN
output "managed_policy_arn" {
  description = "The ARN of the managed IAM policy."
  value       = aws_iam_policy.example.arn
}
