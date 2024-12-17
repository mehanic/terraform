# Create an IAM Policy count
resource "aws_iam_policy" "aws_iam_policy_count" {
  name        = var.policy_name_policy_document
  description = "A test policy"
  policy      = var.policy_document
}

# Attach the Policy to the Users
resource "aws_iam_user_policy_attachment" "aws_iam_user_policy_attachment_user_names_count" {
  count      = length(var.user_names_count)
  user       = aws_iam_user.aws_iam_user_user_count[count.index].name
  policy_arn = aws_iam_policy.aws_iam_policy_count.arn
}


//2 variant
resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each = { for idx, item in local.users_with_policies : item.username => item }

  user       = each.value.username
  policy_arn = aws_iam_policy.policies[each.value.policy_name].arn

  depends_on = [aws_iam_user.aws_iam_user_users, aws_iam_policy.policies]
}


resource "aws_iam_group_policy_attachment" "user_group_policies" {
  for_each = { for idx, item in var.groups : item.name => item }

  group      = each.value.name
  policy_arn = aws_iam_policy.policies[each.value.policy_name].arn

  depends_on = [aws_iam_group.user_groups, aws_iam_policy.policies]
}
//////-end 2 variant
# resource "aws_iam_group_policy_attachment" "user_group_policies" {
#   for_each = {
#     for group in var.groups :
#     group.name => {
#       group_name     = group.name
#       policy_arn_map = [for policy_name in group.group_policies : aws_iam_policy.policies[policy_name].arn]
#     }
#   }

#   group      = each.value.group_name
#   policy_arn = lookup(each.value.policy_arn_map, 0, null) # Attach one policy at a time
# }
