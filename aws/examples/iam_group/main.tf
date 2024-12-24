module "iam_group" {
  source = "../../modules/iam_group"
  # Name of the IAM group
  group_name = "my-test-group"

  # List of IAM user names to add to the group
  users = [
    "user-one",
    "user-two",
    "user-three"
  ]

  # IAM policy details
  policy = {
    name        = "custom-test-policy"
    description = "A custom test policy"
    policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:GetObject"],
      "Resource": "arn:aws:s3:::example-custom-bucket/*"
    }
  ]
}
POLICY
  }

  # IAM group policy details
  group_policy = {
    name        = "custom-group-policy"
    description = "Custom group policy for IAM group"
    document = {
      Version = "2012-10-17",
      Statement = [
        {
          Effect   = "Allow"
          Action   = ["ec2:DescribeInstances", "s3:ListBucket"]
          Resource = ["*"]
        },
        {
          Effect   = "Deny"
          Action   = ["s3:DeleteBucket"]
          Resource = ["arn:aws:s3:::restricted-bucket"]
        }
      ]
    }
  }


}
