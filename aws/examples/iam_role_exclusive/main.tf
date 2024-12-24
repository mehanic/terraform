module "iam_role_exclusive" {
  source       = "../../modules/iam_role_exclusive"
  role_name    = "my-custom-role"
  policy_names = ["custom-inline-policy-1", "custom-inline-policy-2"]

}
