# Create an IAM User
resource "aws_iam_user" "example" {
  name = var.user_name
}

# Create a managed IAM Policy
resource "aws_iam_policy" "example" {
  name        = var.policy_name
  description = "Example managed policy for S3 access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:ListBucket", "s3:GetObject"],
        Resource = "*"
      }
    ]
  })
}

# Attach exclusive managed policies to the IAM user
resource "aws_iam_user_policy_attachments_exclusive" "example" {
  user_name   = aws_iam_user.example.name
  policy_arns = var.attach_policies ? [aws_iam_policy.example.arn] : []
}
