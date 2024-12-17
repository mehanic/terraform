resource "aws_iam_user_login_profile" "user_login_profiles" {
  for_each = { for idx, item in var.users : item.username => item }

  user = aws_iam_user.aws_iam_user_users[each.value.username].name
  #   password = each.value.console_password
  #   password_reset_required = true # Forces the user to reset their password on first login

  depends_on = [aws_iam_user.aws_iam_user_users]
}