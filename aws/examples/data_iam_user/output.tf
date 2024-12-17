output "iam_user_arn" {
  description = "The ARN of the IAM user."
  value       = module.data_iam_user.iam_user_arn
}

output "iam_user_id" {
  description = "The unique ID of the IAM user."
  value       = module.data_iam_user.iam_user_id
}

output "iam_user_path" {
  description = "The path in which the IAM user was created."
  value       = module.data_iam_user.iam_user_path
}

output "iam_user_permissions_boundary" {
  description = "The permissions boundary ARN of the IAM user, if any."
  value       = module.data_iam_user.iam_user_permissions_boundary
}

output "iam_user_tags" {
  description = "The tags associated with the IAM user."
  value       = module.data_iam_user.iam_user_tags
}