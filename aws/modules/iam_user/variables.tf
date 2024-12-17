variable "enable_iam_user_login_profile" {
  description = "Enable iam_user_login_profile usage"
  default     = false
}

variable "iam_user_login_profile_user" {
  description = "(Required) The IAM user's name."
  default     = null
}

variable "iam_user_login_profile_pgp_key" {
  description = "(Required) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Only applies on resource creation. Drift detection is not possible with this argument. Ex - keybase:captainua"
  default     = null
}

variable "iam_user_login_profile_password_length" {
  description = "(Optional, default 20) The length of the generated password on resource creation. Only applies on resource creation. Drift detection is not possible with this argument."
  default     = 20
}

variable "iam_user_login_profile_password_reset_required" {
  description = " (Optional, default 'true') Whether the user should be forced to reset the generated password on resource creation. Only applies on resource creation. Drift detection is not possible with this argument."
  default     = true
}

variable "users_ssh" {
  description = "List of users with their SSH keys"
  type = map(object({
    username   = string
    public_key = string
  }))
}


# variable "policies_group_users" {
#   type = list(object({
#     name   = string
#     policy = object({
#       actions   = list(string)
#       resources = list(string)
#     })
#   }))
#   description = "List of group policies with name, actions, and resources"
# }

#policy actions  per group dynamically.
variable "group_policy_actions" {
  type = map(list(string))
  default = {
    group1 = ["s3:ListBucket", "s3:GetObject"]
    group2 = ["ec2:DescribeInstances"]
    group3 = ["iam:ListUsers"]
  }
}

#resources per group dynamically. 
variable "group_policy_resources" {
  type = map(list(string))
  default = {
    group1 = ["arn:aws:s3:::example-bucket/*"]
    group2 = ["*"]
    group3 = ["*"]
  }
}

variable "user_names" {
  description = "The name of the IAM user."
  type        = list(string)
  default     = ["user1", "user2", "user3", "user4", "user5"]
}

variable "group_names_set_1" {
  description = "The list of IAM group names for the first membership."
  type        = list(string)
  default     = ["group1", "group2"]
}

variable "group_names_set_2" {
  description = "The list of IAM group names for the second membership."
  type        = list(string)
  default     = ["group3"]
}

variable "aws_iam_user_policy_user_for_each" {
  type        = string
  description = "The name of the IAM policy."
  default     = "aws_iam_user_policy_user_for_each"
}


variable "aws_iam_user_policy_user_for_count" {
  type        = string
  description = "The name of the IAM policy."
  default     = "aws_iam_user_policy_user_for_count"
}
variable "policy_actions" {
  type        = list(string)
  description = "The list of actions allowed in the IAM policy."
  default = [
    "dynamodb:ListTables",
    "dynamodb:DescribeTable",
    "dynamodb:Scan",
    "dynamodb:Query"
  ]
}

variable "policy_resources" {
  type        = list(string)
  description = "The list of resources the policy will apply to."
  default     = ["*"]
}


variable "tags" {
  description = "Tags to assign to the resources."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "example-project"
  }
}

# Variable for path
variable "iam_user_path" {
  description = "The path for the IAM users."
  type        = string
  default     = "/system/"
}
//----

variable "ssh_iam_user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "ssh-user"
}

variable "ssh_iam_user_public_key" {
  description = "The public SSH key to associate with the IAM user"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"
}

variable "user_ssh_key_encoding" {
  description = "(Required) Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM."
  type        = string
  default     = "SSH"
}
//----

# Input variable for dynamic user creation
variable "user_names_count" {
  description = "List of IAM user names to create."
  type        = list(string)
  default     = ["user10", "user11", "user12"] # Replace with your desired aws_iam_user_user_count
}

# Input variable for policy details
variable "policy_name_count" {
  description = "The name of the IAM policy."
  type        = string
  default     = "aws_iam_user_policy_user_count"
}

variable "policy_actions_count" {
  description = "List of actions allowed by the policy."
  type        = list(string)
  default     = ["ec2:Describe*"]
}


variable "policy_name_policy_document" {
  description = "The name of the IAM policy."
  type        = string
  default     = "test-policy-of-policy_document" # Default policy name
}

variable "policy_document" {
  description = "The JSON policy document."
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:ListTables",
        "dynamodb:DescribeTable",
        "dynamodb:Scan",
        "dynamodb:Query"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
//ssh
variable "ssh_user_policy_actions" {
  description = "Map of SSH users to their allowed policy actions"
  type        = map(list(string))
  default = {
    alice = ["s3:ListBucket", "s3:GetObject"]
    bob   = ["ec2:DescribeInstances", "ec2:StartInstances"]
  }
}

variable "ssh_user_policy_resources" {
  description = "Map of SSH users to their allowed resources"
  type        = map(list(string))
  default = {
    alice = ["arn:aws:s3:::example-bucket/*"]
    bob   = ["arn:aws:ec2:::instance/*"]
  }
}


//2 variant
variable "users" {
  type = list(object({
    username    = string
    group       = list(string)
    policy_name = string
    ssh_keys = object({
      encoding   = string
      public_key = string
      status     = string
    })
  }))
  validation {
    condition     = alltrue([for user in var.users : user.ssh_keys.encoding == "SSH" || user.ssh_keys.encoding == "PEM"])
    error_message = "The encoding must be one of 'SSH' or 'PEM'."
  }
}


variable "groups" {
  type = list(object({
    name        = string
    path        = string
    policy_name = string
  }))
}

variable "policies" {
  type = list(object({
    name   = string
    policy = any
  }))
}

variable "password_policies" {
  type = object({
    minimum_password_length        = string
    require_lowercase_characters   = bool
    require_numbers                = bool
    require_uppercase_characters   = bool
    require_symbols                = bool
    allow_users_to_change_password = bool
    max_password_age               = number
    password_reuse_prevention      = number
  })

  default = {
    minimum_password_length        = 16
    require_lowercase_characters   = true
    require_numbers                = true
    require_uppercase_characters   = true
    require_symbols                = true
    allow_users_to_change_password = true
    max_password_age               = 90
    password_reuse_prevention      = 5
  }
}
