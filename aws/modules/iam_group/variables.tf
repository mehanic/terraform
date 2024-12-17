variable "group_name" {
  type        = string
  description = "Name of the IAM group"
  default     = "test-group"
}

variable "users" {
  type        = list(string)
  description = "List of IAM user names to add to the group"
  default = [
    "test-user",
    "test-user-two"
  ]
}


variable "policy" {
  type = object({
    name        = string
    description = string
    policy      = string
  })
  description = "IAM policy details"
  default = {
    name        = "test-policy"
    description = "A test policy"
    policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:GetObject"],
      "Resource": "arn:aws:s3:::example-bucket/*"
    }
  ]
}
POLICY
  }
}




variable "group_policy" {
  type = object({
    name        = string
    description = string
    document = object({
      Version = string
      Statement = list(object({
        Effect   = string
        Action   = list(string)
        Resource = list(string)
      }))
    })
  })
  description = "IAM policy details for the group"
  default = {
    name        = "group-policy"
    description = "A policy for the test group"
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