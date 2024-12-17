resource "aws_iam_group_policy_attachment" "test_attach" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.group_policy.arn
}