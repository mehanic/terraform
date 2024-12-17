# Create an IAM user
resource "aws_iam_user" "example" {
  name = var.user_name
}

# Assign exclusive inline policies to the user
resource "aws_iam_user_policies_exclusive" "iam_user_policies_exclusive_example" {
  user_name    = aws_iam_user.example.name
  policy_names = var.policy_names
}

# Example of an inline IAM policy
resource "aws_iam_user_policy" "example" {
  name = "example_inline_policy"
  user = aws_iam_user.example.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Effect   = "Allow"
        Resource = ["arn:aws:s3:::example-bucket", "arn:aws:s3:::example-bucket/*"]
      }
    ]
  })
}
