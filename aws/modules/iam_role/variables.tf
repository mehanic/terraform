variable "aws_iam_role_role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "aws_iam_role_assume_role_policy" {
  description = "The assume role policy document for the IAM role"
  type        = string
}

variable "aws_iam_role_tags" {
  description = "Key-value map of tags for the IAM role"
  type        = map(string)
  default     = {}
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) for the IAM role"
  type        = number
  default     = 3600
}

# variable "path" {
#   description = "The path to the role"
#   type        = string
#   default     = "/"
# }

variable "tags" {
  description = "Tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}

//---

variable "aws_iam_instance_role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "instance_role"
}

variable "aws_iam_instance_role_path" {
  description = "The path for the IAM role"
  type        = string
  default     = "/system/"
}

# variable "assume_role_policy" {
#   description = "The assume role policy document for the IAM role"
#   type        = string
#   default = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

variable "iam_policy_statements" {
  description = "A list of statements for the IAM policy document"
  type = list(object({
    actions = list(string)
    effect  = string
    principals = list(object({
      type        = string
      identifiers = list(string)
    }))
    sid = optional(string)
  }))

  default = [
    {
      actions = ["sts:AssumeRole"]
      effect  = "Allow"
      principals = [
        {
          type        = "Service"
          identifiers = ["ec2.amazonaws.com"]
        }
      ]
      sid = "" # Optional
    }
  ]
}
//-----

variable "aws_iam_role_policy_test_role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "policy_role"
}

variable "aws_iam_role_policy_test_role_assume_role_policy" {
  description = "The assume role policy document for the IAM role"
  type        = string
  default     = <<EOF
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

variable "aws_iam_role_policy_test_policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = "test_policy"
}

variable "aws_iam_role_policy_test_policy_document" {
  description = "The inline policy document"
  type        = string
  default     = <<EOF
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

//----

variable "aws_iam_managed_role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "test-role"
}

variable "aws_iam_managed_assume_role_policy" {
  description = "The assume role policy document for the IAM role"
  type        = string
  default     = <<EOF
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

variable "aws_iam_managed_policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = "test-policy"
}

variable "aws_iam_managed_policy_description" {
  description = "A description for the IAM policy"
  type        = string
  default     = "A test policy"
}

variable "aws_iam_managed_policy_document" {
  description = "The inline policy document"
  type        = string
  default     = <<EOF
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

//--------------------sposse

variable "enabled" {
  type        = bool
  description = "Flag to enable or disable the creation of resources"
  default     = true
}

variable "use_fullname" {
  type        = bool
  description = "Use the full name for IAM role"
  default     = true
}

variable "id" {
  type        = string
  description = "The full identifier for the IAM role"
  default     = "default-role-id"
}

variable "name" {
  type        = string
  description = "The name of the IAM role"
  default     = "default-role"
}

variable "principals" {
  type        = map(list(string))
  description = "Map of principal types and identifiers"
  default = {
    "AWS" = ["arn:aws:iam::476167141852:user/totp"] # Example ARN
  }
}

variable "role_id" {
  type        = string
  description = "Unique identifier for the IAM role"
  default     = "default-role-id"
}

variable "assume_role_actions" {
  type        = list(string)
  description = "List of actions for AssumeRole"
  default     = ["sts:AssumeRole", "sts:TagSession"]
}

variable "assume_role_conditions" {
  type = list(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  description = "Conditions for the assume role policy"
  default     = []
}

variable "role_description" {
  type        = string
  description = "The description for the IAM role"
  default     = "Default role description"
}

variable "policy_documents" {
  type        = list(string)
  description = "List of JSON IAM policy documents"
  default     = []
}

variable "policy_document_count" {
  type        = number
  description = "Number of policy documents"
  default     = 0
}

variable "policy_name" {
  type        = string
  description = "The name of the IAM policy"
  default     = ""
}

variable "policy_description" {
  type        = string
  description = "Description for the IAM policy"
  default     = "Default policy description"
}

variable "managed_policy_arns" {
  type        = set(string)
  description = "List of managed policy ARNs to attach"
  default     = []
}

# variable "max_session_duration" {
#   type        = number
#   description = "The maximum session duration in seconds"
#   default     = 3600
# }

variable "permissions_boundary" {
  type        = string
  description = "ARN for permissions boundary policy"
  default     = ""
}

variable "instance_profile_enabled" {
  type        = bool
  description = "Enable the creation of EC2 instance profile"
  default     = false
}

variable "path" {
  type        = string
  description = "Path for the IAM role"
  default     = "/"
}

variable "tags_enabled" {
  type        = bool
  description = "Enable or disable tags"
  default     = true
}

# variable "tags" {
#   type        = map(string)
#   description = "Tags to assign to resources"
#   default     = {}
# }

variable "inline_policy_enabled" {
  type        = bool
  description = "Enable inline IAM policy"
  default     = false
}
