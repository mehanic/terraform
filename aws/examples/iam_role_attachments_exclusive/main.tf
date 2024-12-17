terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_role_attachments_exclusive" {
  source = "../../modules/iam_role_attachments_exclusive"
  # IAM Role Name
  role_name = "custom-iam-role"

  # Assume Role Policy (Trust Policy)
  assume_role_policy_json = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  # Tags for IAM Role
  role_tags = {
    Environment = "Staging"
    Owner       = "CloudOpsTeam"
  }

  # Managed Policy Name
  managed_policy_name = "custom-managed-policy"

  # Managed Policy Description
  managed_policy_description = "Custom managed IAM policy for EC2 permissions."

  # Managed Policy JSON
  managed_policy_json = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:RebootInstances"
      ],
      "Resource": "*"
    }
  ]
}
EOF


}
