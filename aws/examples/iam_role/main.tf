
terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_role" {
  source = "../../modules/iam_role"

  aws_iam_role_role_name = "test_role"


  //assume_role_policy = file("assume_role_policy.json")
  aws_iam_role_assume_role_policy = <<EOF
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
  max_session_duration            = 7200
  tags = {
    Environment = "Production"
    Team        = "DevOps"
  }

  //data "aws_iam_policy_document" "instance_assume_role_policy"
  iam_policy_statements = [
    {
      actions = ["sts:AssumeRole"]
      effect  = "Allow"
      principals = [
        {
          type        = "Service"
          identifiers = ["ec2.amazonaws.com"]
        }
      ]
      sid = "EC2AssumeRole"
    }
    # {
    #   actions = ["s3:ListBucket"]
    #   effect  = "Allow"
    #   principals = [
    #     {
    #       type        = "AWS"
    #       identifiers = ["arn:aws:iam::123456789012:role/example-role"]
    #      // Error: creating IAM Role (instance_role): operation error IAM: CreateRole, https response error StatusCode: 400, RequestID: ddda99ea-e60c-48af-b7a2-ea442a60ff06, MalformedPolicyDocument: Invalid principal in policy: "AWS":"arn:aws:iam::123456789012:role/example-role"
    #     }
    #   ]
    #   sid = "S3ListBucketAccess"
    # }
  ]

  aws_iam_role_policy_test_role_name       = "test_role_name-custom"
  aws_iam_role_policy_test_policy_name     = "test_policy_name-custom"
  aws_iam_role_policy_test_policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF


  aws_iam_managed_role_name          = "managed_custom-role"
  aws_iam_managed_policy_name        = "managed_custom-policy"
  aws_iam_managed_policy_description = "Custom description for the policy"
  aws_iam_managed_policy_document    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF

  role_description = "Test IAM role"
}