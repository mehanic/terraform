# Output for IAM Role Name
output "iam_role_name" {
  description = "The name of the IAM role."
  value       = aws_iam_role.iam_role_example.name
}

# Output for IAM Role ARN
output "iam_role_arn" {
  description = "The ARN of the IAM role."
  value       = aws_iam_role.iam_role_example.arn
}

# Output for Inline Policy Name
output "inline_policy_name" {
  description = "The name of the attached inline policy."
  value       = aws_iam_role_policy.example.name
}

# Output for Inline Policy JSON
output "inline_policy_json" {
  description = "The JSON content of the attached inline policy."
  value       = data.aws_iam_policy_document.example_inline_policy.json
}
