output "aws_iam_role_test_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.aws_iam_role_test_role.arn
}

output "aws_iam_role_test_role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.aws_iam_role_test_role.name
}

output "aws_iam_role_test_role_id" {
  description = "The unique ID of the IAM role"
  value       = aws_iam_role.aws_iam_role_test_role.unique_id
}


//---
output "aws_iam_role_instance_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.aws_iam_role_instance.arn
}

output "aws_iam_role_instance_role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.aws_iam_role_instance.name
}

output "aws_iam_role_instance_role_path" {
  description = "The path of the IAM role"
  value       = aws_iam_role.aws_iam_role_instance.path
}

//---

output "aws_iam_role_policy_test_role" {
  description = "The ID of the IAM role"
  value       = aws_iam_role.aws_iam_role_policy_test_role.id
}

output "aws_iam_role_policy_test_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.aws_iam_role_policy_test_role.arn
}

output "aws_iam_role_policy_test_policy_name" {
  description = "The name of the IAM policy"
  value       = aws_iam_role_policy.aws_iam_role_policy_test_policy.name
}

output "aws_iam_role_policy_test_policy_document" {
  description = "The document attached to the IAM policy"
  value       = aws_iam_role_policy.aws_iam_role_policy_test_policy.policy
}

//--


output "assume_role_name" {
  value       = join("", aws_iam_role.default.*.name)
  description = "The name of the IAM role created"
}

output "assume_role_id" {
  value       = join("", aws_iam_role.default.*.unique_id)
  description = "The stable and unique string identifying the role"
}

output "assume_role_arn" {
  value       = join("", aws_iam_role.default.*.arn)
  description = "The Amazon Resource Name (ARN) specifying the role"
}

output "assume_role_policy" {
  value       = join("", data.aws_iam_policy_document.default.*.json)
  description = "Role policy document in json format. Outputs always, independent of `enabled` variable"
}

output "assume_role_instance_profile" {
  description = "Name of the ec2 profile (if enabled)"
  value       = join("", aws_iam_instance_profile.default.*.name)
}