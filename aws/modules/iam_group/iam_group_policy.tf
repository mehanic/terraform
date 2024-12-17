resource "aws_iam_policy" "group_policy" {
  name        = var.group_policy.name
  description = var.group_policy.description
  policy      = jsonencode(var.group_policy.document)
}

resource "aws_iam_policy" "policy" {
  name        = var.policy.name
  description = var.policy.description
  policy      = var.policy.policy
}
