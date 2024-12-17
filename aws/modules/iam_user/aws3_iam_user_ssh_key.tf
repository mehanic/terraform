resource "aws_iam_user" "aws_iam_user_ssh_user" {
  for_each = { for user in var.users_ssh : user.username => user }
  name     = each.key
  path     = var.iam_user_path
}

resource "aws_iam_user_ssh_key" "aws_iam_user_ssh_key_ssh_user" {
  for_each   = aws_iam_user.aws_iam_user_ssh_user
  username   = each.value.name
  encoding   = var.user_ssh_key_encoding
  public_key = var.users_ssh[each.key].public_key
}


///2 variant
resource "aws_iam_user_ssh_key" "aws_iam_user_ssh_key_ssh_user_for_item" {
  // username   = "${aws_iam_user.aws_iam_user_ssh_user.name}"
  // encoding   = var.user_ssh_key_encoding
  // public_key = var.ssh_iam_user_public_key

  for_each   = { for idx, item in local.users_with_ssh_key : item.username => item }
  username   = aws_iam_user.aws_iam_user_users[each.value.username].name
  encoding   = each.value.ssh_keys.encoding
  public_key = each.value.ssh_keys.public_key
  status     = each.value.ssh_keys.status

}