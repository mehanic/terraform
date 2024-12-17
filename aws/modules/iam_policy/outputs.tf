output "iam_user_name" {
  description = "The name of the IAM user."
  value       = aws_iam_user.user.name
}

output "iam_role_name" {
  description = "The name of the IAM role."
  value       = aws_iam_role.role.name
}

output "iam_group_name" {
  description = "The name of the IAM group."
  value       = aws_iam_group.group.name
}

output "iam_policy_name" {
  description = "The name of the IAM policy."
  value       = aws_iam_policy.policy.name
}

output "iam_policy_attachment_name" {
  description = "The name of the IAM policy attachment."
  value       = aws_iam_policy_attachment.test-attach.name
}

output "iam_policy_arn" {
  description = "The ARN of the IAM policy."
  value       = aws_iam_policy.policy.arn
}

output "policy_id" {
  description = "The ID of the IAM policy."
  value       = aws_iam_policy.policy.id
}

output "policy_arn" {
  description = "The ARN of the IAM policy."
  value       = aws_iam_policy.policy.arn
}

output "policy_name" {
  description = "The name of the IAM policy."
  value       = aws_iam_policy.policy.name
}

output "policy_path" {
  description = "The path of the IAM policy."
  value       = aws_iam_policy.policy.path
}

output "policy_description" {
  description = "The description of the IAM policy."
  value       = aws_iam_policy.policy.description
}
