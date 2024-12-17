output "iam_role_arn" {
  description = "The ARN of the created IAM Role."
  value       = module.iam_instance_profile.iam_role_arn
}

output "iam_instance_profile_arn" {
  description = "The ARN of the created IAM Instance Profile."
  value       = module.iam_instance_profile.iam_instance_profile_arn
}

output "iam_instance_profile_id" {
  description = "The ID of the created IAM Instance Profile."
  value       = module.iam_instance_profile.iam_instance_profile_id
}

output "iam_instance_profile_unique_id" {
  description = "The unique ID of the created IAM Instance Profile."
  value       = module.iam_instance_profile.iam_instance_profile_unique_id
}