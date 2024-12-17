output "iam_user_name" {
  description = "The name of the IAM user."
  value       = module.iam_policy.iam_user_name
}

output "iam_role_name" {
  description = "The name of the IAM role."
  value       = module.iam_policy.iam_role_name
}

output "iam_group_name" {
  description = "The name of the IAM group."
  value       = module.iam_policy.iam_group_name
}

output "iam_policy_name" {
  description = "The name of the IAM policy."
  value       = module.iam_policy.iam_policy_name
}

output "iam_policy_attachment_name" {
  description = "The name of the IAM policy attachment."
  value       = module.iam_policy.iam_policy_attachment_name
}

output "iam_policy_arn" {
  description = "The ARN of the IAM policy."
  value       = module.iam_policy.iam_policy_arn
}

output "policy_id" {
  description = "The ID of the IAM policy."
  value       = module.iam_policy.policy_id
}

output "policy_arn" {
  description = "The ARN of the IAM policy."
  value       = module.iam_policy.policy_arn
}

output "policy_name" {
  description = "The name of the IAM policy."
  value       = module.iam_policy.policy_name
}

output "policy_path" {
  description = "The path of the IAM policy."
  value       = module.iam_policy.policy_path
}
