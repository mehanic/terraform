# Attach policies to the IAM users (after users have been created)
resource "aws_iam_user_policy" "aws_iam_user_policy_user_for_each" {
  for_each = aws_iam_user.aws_iam_user_for_each # This only applies once users are created

  name = var.aws_iam_user_policy_user_for_each
  user = each.value.name # Accessing the 'name' of each IAM user created
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.policy_actions
        Effect   = "Allow"
        Resource = var.policy_resources
      }
    ]
  })
}

# Create IAM User Policies dynamically using count
resource "aws_iam_user_policy" "aws_iam_user_policy_user_count" {
  count = length(var.user_names_count)

  name = var.aws_iam_user_policy_user_for_count
  user = aws_iam_user.aws_iam_user_user_count[count.index].name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.policy_actions_count
        Effect   = "Allow"
        Resource = var.policy_resources
      }
    ]
  })
}

//ssh policy with key
resource "aws_iam_user_policy" "ssh_user_policy" {
  for_each = aws_iam_user.aws_iam_user_ssh_user

  name = "policy-${each.key}"
  user = each.value.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.ssh_user_policy_actions[each.key]
        Effect   = "Allow"
        Resource = var.ssh_user_policy_resources[each.key]
      }
    ]
  })
}


//////2 variant
resource "aws_iam_policy" "policies" {
  for_each = { for idx, item in var.policies : item.name => item }

  name   = each.value.name
  policy = jsonencode(each.value.policy)
}

