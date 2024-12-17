//1
resource "aws_iam_user" "aws_iam_user_for_each" {
  for_each = { for user_name in var.user_names : user_name => user_name } //two for
  name     = each.key
  //structura for variable, can in locals as agregator
  path = var.iam_user_path
  tags = var.tags
}

# Create IAM access keys for users (after users have been created)
resource "aws_iam_access_key" "aws_iam_access_key_user_for_each" {
  for_each = aws_iam_user.aws_iam_user_for_each # This only applies once users are created

  user = each.value.name # Accessing the 'name' of each IAM user created
}
//2
# Create IAM Users dynamically using count
resource "aws_iam_user" "aws_iam_user_user_count" {
  count = length(var.user_names_count)
  name  = var.user_names_count[count.index]
  path  = var.iam_user_path
  tags  = var.tags
}

# Create IAM access keys for users dynamically using count
resource "aws_iam_access_key" "aws_iam_access_key_user_user_count" {
  count = length(var.user_names_count)

  user    = aws_iam_user.aws_iam_user_user_count[count.index].name
  pgp_key = null # Replace with your PGP key if you want to encrypt the access key
}
// 2 variant

resource "aws_iam_user" "aws_iam_user_users" {
  for_each = { for idx, item in var.users : item.username => item }
  name     = each.value.username
}

resource "aws_iam_access_key" "aws_iam_user_access_keys" {
  for_each = { for idx, item in var.users : item.username => item }
  user     = aws_iam_user.aws_iam_user_users[each.value.username].name
}