module "iam_user" {

  source = "../../modules/iam_user"
  ssh_user_policy_actions = {
    alice = ["s3:ListBucket", "s3:GetObject"]
    bob   = ["ec2:DescribeInstances", "ec2:StartInstances"]
  }

  ssh_user_policy_resources = {
    alice = ["arn:aws:s3:::example-bucket/*"]
    bob   = ["arn:aws:ec2:::instance/*"]
  }

  users_ssh = {
    alice = {
      username   = "alice"
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"
    }
    bob = {
      username   = "bob"
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"
    }
  }

  # policy_name      = "aws_iam_user_policy_user_for_each"
  # policy_actions   = ["s3:ListBucket", "s3:GetObject", "ec2:Describe*"]
  # policy_resources = ["arn:aws:s3:::example-bucket/*"]

  user_names                         = ["user1", "user2", "user3", "user4", "user5"]
  user_names_count                   = ["Paris", "Berlin", "London"]
  group_names_set_1                  = ["group1", "group2"]
  group_names_set_2                  = ["group3"]
  aws_iam_user_policy_user_for_each  = "aws_iam_user_policy_user_for_each"
  aws_iam_user_policy_user_for_count = "aws_iam_user_policy_user_for_count"
  group_policy_actions = {
    group1 = ["s3:ListBucket", "s3:GetObject"]
    group2 = ["ec2:DescribeInstances"]
    group3 = ["iam:ListUsers"]
  }

  group_policy_resources = {
    group1 = ["arn:aws:s3:::example-bucket/*"]
    group2 = ["*"]
    group3 = ["*"]
  }
  //2 variant 
  #  example to pass arguments
  # policies_group_users = [
  #   {
  #     name   = "example-policy"
  #     policy = {
  #       actions   = ["s3:ListBucket", "s3:GetObject", "ec2:Describe*"]
  #       resources = ["arn:aws:s3:::example-bucket/*"]
  #     }
  #   }
  # ]

  users = [
    {
      username    = "ssh-user-2variant"
      group       = ["admin-2variant", "dev-2variant"]
      policy_name = "ssh-user-policy"
      ssh_keys = {
        encoding   = "SSH"
        public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"
        status     = "Active" # Fixed case
      }
    },

    {
      username    = "mein_Leter-2variant"
      group       = ["dev-2variant"]
      policy_name = "dev-policy"
      ssh_keys = {
        encoding   = "SSH"
        public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"
        status     = "Active"
      }
    }

  ]

  groups = [
    {
      name        = "admin-2variant"
      path        = "/"
      policy_name = "ssh-user-policy"
    },
    {
      name        = "dev-2variant"
      path        = "/dev/"
      policy_name = "dev-policy"
    },
    {
      name        = "tester-2variant"
      path        = "/tester/"
      policy_name = "dev-policy"
    }
  ]

  policies = [
    {
      name = "ssh-user-policy"
      policy = {
        Version = "2012-10-17"
        Statement = [
          {
            Action   = "iam:CreateUser"
            Effect   = "Allow"
            Resource = "*"
          }
        ]
      }
    },
    {
      name = "dev-policy"
      policy = {
        Version = "2012-10-17"
        Statement = [
          {
            Action   = "iam:CreateUser"
            Effect   = "Allow"
            Resource = "*"
          }
        ]
      }
    },
    {
      name = "admin-policy"
      policy = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect   = "Allow"
            Action   = "s3:*"
            Resource = "*"
          }
        ]
      }
    },
    {
      name = "logging-policy"
      policy = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect   = "Allow"
            Action   = "cloudwatch:PutMetricData"
            Resource = "*"
          }
        ]
      }
    },
    {
      name = "describe-policy"
      policy = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect   = "Allow"
            Action   = "ec2:DescribeInstances"
            Resource = "*"
          }
        ]
      }
    }

  ]

}