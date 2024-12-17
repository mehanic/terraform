output "iam_role_arn" {
  description = "The ARN of the created IAM Role."
  value       = aws_iam_role.role.arn
}

output "iam_instance_profile_arn" {
  description = "The ARN of the created IAM Instance Profile."
  value       = aws_iam_instance_profile.test_profile.arn
}

output "iam_instance_profile_id" {
  description = "The ID of the created IAM Instance Profile."
  value       = aws_iam_instance_profile.test_profile.id
}

output "iam_instance_profile_unique_id" {
  description = "The unique ID of the created IAM Instance Profile."
  value       = aws_iam_instance_profile.test_profile.unique_id
}
