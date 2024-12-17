# IAM Role Name
variable "role_name" {
  description = "The name of the IAM role."
  type        = string
  default     = "example-role"
}

# Assume Role Policy (Trust Policy)
variable "assume_role_policy_json" {
  description = "The JSON policy document for the assume role policy."
  type        = string
  default     = <<EOF
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
}

# Tags for IAM Role
variable "role_tags" {
  description = "A map of tags to assign to the IAM role."
  type        = map(string)
  default = {
    Environment = "Production"
    Owner       = "DevOpsTeam"
  }
}

# Managed Policy Name
variable "managed_policy_name" {
  description = "The name of the managed IAM policy."
  type        = string
  default     = "example-managed-policy"
}

# Managed Policy Description
variable "managed_policy_description" {
  description = "The description of the managed IAM policy."
  type        = string
  default     = "Managed IAM policy for specific permissions."
}

# Managed Policy JSON
variable "managed_policy_json" {
  description = "The JSON policy document for the managed IAM policy."
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
