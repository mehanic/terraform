//Provides an IAM role.
resource "aws_iam_role" "aws_iam_role_test_role" {
  name                 = var.aws_iam_role_role_name
  assume_role_policy   = var.aws_iam_role_assume_role_policy
  max_session_duration = var.max_session_duration
  path                 = var.path

  tags = var.tags
}

//Data Source for Assume Role Policy
data "aws_iam_policy_document" "instance_assume_role_policy" {
  dynamic "statement" {
    for_each = var.iam_policy_statements
    content {
      actions = statement.value.actions
      effect  = statement.value.effect

      dynamic "principals" {
        for_each = statement.value.principals
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      sid = try(statement.value.sid, null) # Use sid if defined, else null
    }
  }
}



resource "aws_iam_role" "aws_iam_role_instance" {
  name               = var.aws_iam_instance_role_name
  path               = var.aws_iam_instance_role_path
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
  tags               = var.tags
}