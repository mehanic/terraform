resource "aws_iam_group" "aws_iam_group_for_each" {
  for_each = toset(concat(var.group_names_set_1, var.group_names_set_2))
  name     = each.value
}

//first group 
resource "aws_iam_user_group_membership" "aws_iam_user_group_membership_group_example1" {
  for_each = aws_iam_user.aws_iam_user_for_each # Apply `for_each` to the user resource

  user = each.value.name # Referencing each user's name

  groups = [for group_name in var.group_names_set_1 : aws_iam_group.aws_iam_group_for_each[group_name].name]
}

//thecong group
resource "aws_iam_user_group_membership" "aws_iam_user_group_membership_group_example2" {
  for_each = aws_iam_user.aws_iam_user_for_each # Apply `for_each` to the user resource

  user = each.value.name # Referencing each user's name

  groups = [for group_name in var.group_names_set_2 : aws_iam_group.aws_iam_group_for_each[group_name].name]
}


// 2 variant
resource "aws_iam_group" "user_groups" {
  for_each = { for idx, item in var.groups : item.name => item }

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_user_group_membership" "user_groups" {
  for_each = { for idx, item in local.users_with_groups : item.username => item }

  user   = aws_iam_user.aws_iam_user_users[each.value.username].name
  groups = each.value.group

  //depends_on = [aws_iam_group.user_groups, aws_iam_user.users]
}