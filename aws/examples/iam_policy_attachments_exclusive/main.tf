module "iam_policy_attachments_exclusive" {
  source          = "../../modules/iam_policy_attachments_exclusive"
  user_name       = "example-user"
  policy_name     = "example-policy"
  attach_policies = true

}