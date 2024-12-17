terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_group_exclusive" {
  source          = "../../modules/iam_group_exclusive"
  group_name      = "iam_group_exclusive-name"
  policy_name     = "iam_group_exclusive-policy"
  policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
    }
  ]
}
EOF
}
