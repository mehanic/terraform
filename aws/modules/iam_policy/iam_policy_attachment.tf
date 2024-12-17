# IAM Policy Attachment
resource "aws_iam_policy_attachment" "test-attach" {
  name       = var.attachment_name
  users      = [aws_iam_user.user.name]
  roles      = [aws_iam_role.role.name]
  groups     = [aws_iam_group.group.name]
  policy_arn = aws_iam_policy.policy.arn
}
