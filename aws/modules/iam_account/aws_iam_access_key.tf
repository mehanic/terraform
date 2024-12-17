# IAM User for Load Balancer
resource "aws_iam_user" "aws_iam_access" {
  name = var.aws_iam_access_user_name
  path = var.aws_iam_access_user_path
}

# IAM Access Key for Load Balancer
resource "aws_iam_access_key" "aws_iam_access" {
  user = aws_iam_user.aws_iam_access.name
  # PGP key removed to avoid errors if Keybase is not used
}

# IAM User Policy for Load Balancer
resource "aws_iam_user_policy" "aws_iam_access_ro" {
  name = var.aws_iam_access_policy_name
  user = aws_iam_user.aws_iam_access.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# IAM User for Testing
resource "aws_iam_user" "test" {
  name = var.test_user_name
  path = var.test_user_path
}

# IAM Access Key for Testing
resource "aws_iam_access_key" "test" {
  user = aws_iam_user.test.name
}




