# IAM Policy Resource
resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = var.policy_description

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