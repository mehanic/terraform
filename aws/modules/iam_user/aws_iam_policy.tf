# Define Policies for Groups
resource "aws_iam_policy" "group_policies" {
  for_each = toset(concat(var.group_names_set_1, var.group_names_set_2))

  name        = "policy-for-${each.value}"
  description = "Policy for group ${each.value}"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = var.group_policy_actions[each.value],
        Resource = var.group_policy_resources[each.value]
      }
    ]
  })
}

# Attach Policies to Groups
resource "aws_iam_policy_attachment" "group_policy_attachment" {
  for_each = aws_iam_group.aws_iam_group_for_each

  name       = "attachment-for-${each.key}"
  groups     = [each.value.name]
  policy_arn = aws_iam_policy.group_policies[each.key].arn
}
