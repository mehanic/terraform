
output "aws_iam_user_group_membership_group_example1" {
  description = "The groups in the first user group membership."
  value       = module.iam_user.aws_iam_user_group_membership_group_example1

}

output "aws_iam_user_group_membership_group_example2" {
  description = "The groups in the second user group membership."
  value       = module.iam_user.aws_iam_user_group_membership_group_example2
}


output "iam_user_arn" {
  value = module.iam_user.iam_user_arn
}

output "iam_access_key_id" {
  value = module.iam_user.iam_access_key_id
}

output "iam_user_policy_name" {
  value = module.iam_user.iam_user_policy_name
}

output "iam_user_policy" {
  value = module.iam_user.iam_user_policy
}

//for 2 variant
output "ssh_iam_user_ssh_key_id" {
  value = module.iam_user.ssh_iam_user_ssh_key_id
}

output "ssh_iam_user_arn" {
  value = module.iam_user.ssh_iam_user_arn
}

output "user_details_count" {
  value = module.iam_user.user_details_count
}

output "aws_iam_user_ssh_key_fingerprint" {
  value = module.iam_user.aws_iam_user_ssh_key_fingerprint
}

output "aws_iam_user_ssh_key_public_key" {
  value = module.iam_user.aws_iam_user_ssh_key_public_key
}

output "group_policies-2variant" {
  value = module.iam_user.group_policies
}

output "user_policies-2variant" {
  value = module.iam_user.user_policies
}

output "user_summary-2variant" {
  value = module.iam_user.user_summary
}
