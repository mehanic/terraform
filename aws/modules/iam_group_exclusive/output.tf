output "group_policy_attachment" {
  description = "Details of the IAM group and attached policy."
  value = {
    group_name = aws_iam_group.example.name
    policy_arn = aws_iam_policy.example.arn
  }
}