resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name     = each.value
}

resource "aws_iam_group_membership" "team" {
  name  = "tf-${aws_iam_group.group.name}-membership"
  users = [for user in aws_iam_user.users : user.name]
  group = aws_iam_group.group.name
}

