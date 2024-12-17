# Output for IAM Role Name
output "iam_role_name" {
  value = module.iam_role_exclusive.iam_role_name
}

# Output for IAM Role ARN
output "iam_role_arn" {
  value = module.iam_role_exclusive.iam_role_arn
}

# Output for Inline Policy Name
output "inline_policy_name" {
  value = module.iam_role_exclusive.inline_policy_name
}

# Output for Inline Policy JSON
output "inline_policy_json" {
  value = module.iam_role_exclusive.inline_policy_json
}
