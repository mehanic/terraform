module "iam_policies_exclusive" {
  source       = "../../modules/iam_policies_exclusive"
  user_name    = "example-user"
  policy_names = ["example_inline_policy"]
}
