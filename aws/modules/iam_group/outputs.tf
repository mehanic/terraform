output "iam_policy_details" {
  value = {
    name        = aws_iam_policy.policy.name
    arn         = aws_iam_policy.policy.arn
    description = aws_iam_policy.policy.description
  }
  description = "Details of the created IAM policy."
}

output "group_membership_details" {
  value = {
    group_name = aws_iam_group.group.name
    users      = aws_iam_group_membership.team.users
  }
  description = "Details of the group and its members."
}


output "iam_policies_details" {
  value = {
    group_policy = {
      name        = aws_iam_policy.group_policy.name
      description = aws_iam_policy.group_policy.description
      arn         = aws_iam_policy.group_policy.arn
      policy      = aws_iam_policy.group_policy.policy
    }
    attached_policy = {
      name        = aws_iam_policy.policy.name
      description = aws_iam_policy.policy.description
      arn         = aws_iam_policy.policy.arn
      policy      = aws_iam_policy.policy.policy
    }
  }
  description = "Details of the IAM policies, including the group and attached policies."
}
