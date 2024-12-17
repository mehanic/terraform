resource "aws_iam_user" "user" {
  name = var.user_name
}

# IAM Group
resource "aws_iam_group" "group" {
  name = var.group_name
}

# IAM Role
resource "aws_iam_role" "role" {
  name = var.role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
