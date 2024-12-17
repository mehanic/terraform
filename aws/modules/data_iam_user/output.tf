# Output user details
output "iam_user_arn" {
  description = "The ARN of the IAM user."
  value       = data.aws_iam_user.example.arn
}

output "iam_user_id" {
  description = "The unique ID of the IAM user."
  value       = data.aws_iam_user.example.user_id
}

output "iam_user_path" {
  description = "The path in which the IAM user was created."
  value       = data.aws_iam_user.example.path
}

output "iam_user_permissions_boundary" {
  description = "The permissions boundary ARN of the IAM user, if any."
  value       = data.aws_iam_user.example.permissions_boundary
}

output "iam_user_tags" {
  description = "The tags associated with the IAM user."
  value       = data.aws_iam_user.example.tags
}
