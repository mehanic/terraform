# output "user_name" {
#   description = "The names of the IAM aws_iam_user_user_count created."
#   value       = [for user in aws_iam_user.aws_iam_user_for_each : user.name]  # Corrected to aws_iam_user_for_each
# }

output "aws_iam_user_group_membership_group_example1" {
  description = "The groups in the first user group membership."
  value = {
    for key, membership in aws_iam_user_group_membership.aws_iam_user_group_membership_group_example1 : key => membership.groups
  }
}

output "aws_iam_user_group_membership_group_example2" {
  description = "The groups in the second user group membership."
  value = {
    for key, membership in aws_iam_user_group_membership.aws_iam_user_group_membership_group_example2 : key => membership.groups
  }
}

output "iam_user_arn" {
  description = "ARN of the IAM user."
  value = {
    for key, user in aws_iam_user.aws_iam_user_for_each : key => user.arn
  }
}

output "iam_access_key_id" {
  description = "IAM access key ID for the user."
  value = {
    for key, access_key in aws_iam_access_key.aws_iam_access_key_user_for_each : key => access_key.id
  }
}

# output "iam_access_key_secret" {
#   description = "IAM access key secret for the user."
#   sensitive = true
#   value = {
#     for key, access_key in aws_iam_access_key.aws_iam_access_key_user_for_each : key => access_key.secret
#   }
# }

output "iam_user_policy_name" {
  description = "Name of the IAM user policy."
  value = {
    for key, policy in aws_iam_user_policy.aws_iam_user_policy_user_for_each : key => policy.name
  }
}

output "iam_user_policy" {
  description = "IAM user policy document."
  value = {
    for key, policy in aws_iam_user_policy.aws_iam_user_policy_user_for_each : key => policy.policy
  }
}



# output "access_keys_count" {
#   description = "Access keys for all created IAM aws_iam_user_user_count."
#   value = [
#     for i in range(length(var.user_names_count)) : {
#       user_name        = aws_iam_user.aws_iam_user_user_count[i].name
#       access_key_id    = aws_iam_access_key.aws_iam_access_key_user_user_count[i].id
#       secret_access_key = aws_iam_access_key.aws_iam_access_key_user_user_count[i].secret
#     }
#   ]
# }

# terraform output -json access_keys_count | jq                           

# output "iam_user_policy_attachments" {
#   description = "Policy attachments for all IAM aws_iam_user_user_count."
#   value = {
#     for i, user in aws_iam_user.aws_iam_user_user_count : user.name => {
#       policy_name = aws_iam_policy.aws_iam_policy_count.name
#       policy_arn  = aws_iam_policy.aws_iam_policy_count.arn
#     }
#   }
# }


# output "aws_iam_access_key_secret" {
#   description = "AWS IAM Access Key Secret"
#   value       = { for access_key in aws_iam_access_key.aws_iam_user_access_keys : access_key.user => access_key.secret }
# }

# output "aws_iam_user_password" {
#   description = "AWS IAM User Password"
#   value       = { for login_profile in aws_iam_user_login_profile.user_login_profiles : login_profile.user => login_profile.password }
# }

# output "aws_iam_user_key_fingerprint" {
#   description = "AWS IAM User Key Fingerprint"
#   value       = { for login_profile in aws_iam_user_login_profile.user_login_profiles : login_profile.user => login_profile.key_fingerprint }
# }
////////----------- 2 variant
output "aws_iam_user_ssh_key_fingerprint" {
  description = "AWS IAM User SSH Key Fingerprint"
  value       = { for ssh_key in aws_iam_user_ssh_key.aws_iam_user_ssh_key_ssh_user : ssh_key.username => ssh_key.fingerprint }
}

output "aws_iam_user_ssh_key_public_key" {
  description = "AWS IAM User SSH Key Public Key"
  value       = { for ssh_key in aws_iam_user_ssh_key.aws_iam_user_ssh_key_ssh_user : ssh_key.username => ssh_key.public_key }
}

output "ssh_iam_user_ssh_key_id" {
  description = "The ID of the SSH key associated with the IAM user"
  value = {
  for username, ssh_key in aws_iam_user_ssh_key.aws_iam_user_ssh_key_ssh_user : username => ssh_key.id }
}

output "ssh_iam_user_arn" {
  description = "The ARN of the IAM user"
  value = {
    for username, user in aws_iam_user.aws_iam_user_users : username => user.arn
  }
}

output "user_details_count" {
  description = "Details of all created IAM aws_iam_user_user_count and their policies."
  value = [
    for i in range(length(var.user_names_count)) : {
      name          = aws_iam_user.aws_iam_user_user_count[i].name
      arn           = aws_iam_user.aws_iam_user_user_count[i].arn
      policy        = aws_iam_user_policy.aws_iam_user_policy_user_count[i].name
      access_key_id = aws_iam_access_key.aws_iam_access_key_user_user_count[i].id
    }
  ]
}

output "group_policies" {
  value = {
    for key, policy in aws_iam_policy.group_policies :
    key => {
      name        = policy.name
      description = policy.description
      arn         = policy.arn
      actions     = var.group_policy_actions[key]
      resources   = var.group_policy_resources[key]
    }
  }
}


output "user_policies" {
  value = {
    for user in var.users :
    user.username => aws_iam_policy.policies[user.policy_name].arn
  }
}

output "user_summary" {
  value = {
    for user in var.users :
    user.username => {
      groups     = user.group
      policy_arn = aws_iam_policy.policies[user.policy_name].arn
      ssh_key = {
        encoding   = user.ssh_keys.encoding
        public_key = user.ssh_keys.public_key
        status     = user.ssh_keys.status
      }
    }
  }
}
