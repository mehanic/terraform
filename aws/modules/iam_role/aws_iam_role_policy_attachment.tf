
resource "aws_iam_role" "aws_iam_managed_role" {
  name               = var.aws_iam_managed_role_name
  assume_role_policy = var.aws_iam_managed_assume_role_policy
}

resource "aws_iam_policy" "aws_iam_managed_policy" {
  name        = var.aws_iam_managed_policy_name
  description = var.aws_iam_managed_policy_description
  policy      = var.aws_iam_managed_policy_document
}

resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.aws_iam_managed_role.name
  policy_arn = aws_iam_policy.aws_iam_managed_policy.arn
}


