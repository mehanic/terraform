output "aws_iam_role_test_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_role.aws_iam_role_test_role_arn
}

output "aws_iam_role_test_role_name" {
  description = "The name of the IAM role"
  value       = module.iam_role.aws_iam_role_test_role_name
}

output "aws_iam_role_test_role_id" {
  description = "The unique ID of the IAM role"
  value       = module.iam_role.aws_iam_role_test_role_id
}

output "aws_iam_role_instance_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_role.aws_iam_role_instance_role_arn
}

output "aws_iam_role_instance_role_name" {
  description = "The name of the IAM role"
  value       = module.iam_role.aws_iam_role_instance_role_name
}

output "aws_iam_role_instance_role_path" {
  description = "The path of the IAM role"
  value       = module.iam_role.aws_iam_role_instance_role_path
}
//--

output "aws_iam_role_policy_test_role" {
  description = "The ID of the IAM role"
  value       = module.iam_role.aws_iam_role_policy_test_role
}

output "aws_iam_role_policy_test_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_role.aws_iam_role_policy_test_role_arn
}

output "aws_iam_role_policy_test_policy_name" {
  description = "The name of the IAM policy"
  value       = module.iam_role.aws_iam_role_policy_test_policy_name
}

output "aws_iam_role_policy_test_policy_document" {
  description = "The document attached to the IAM policy"
  value       = module.iam_role.aws_iam_role_policy_test_policy_document
}

//---


output "assume_role_name" {
  value = module.iam_role.assume_role_name
}

output "assume_role_id" {
  value = module.iam_role.assume_role_id
}

output "assume_role_arn" {
  value = module.iam_role.assume_role_arn
}

output "assume_role_policy" {
  value = module.iam_role.assume_role_policy
}

output "assume_role_instance_profile" {
  value = module.iam_role.assume_role_instance_profile
}

