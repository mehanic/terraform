# IAM Group
resource "aws_iam_group" "example" {
  name = var.group_name
}

# IAM Policy
resource "aws_iam_policy" "example" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy_document
}

# Attach Policy to IAM Group
resource "aws_iam_group_policy_attachment" "example" {
  group      = aws_iam_group.example.name
  policy_arn = aws_iam_policy.example.arn

  # Ensure the policy is detached before the group is deleted
  lifecycle {
    create_before_destroy = true
  }
}
