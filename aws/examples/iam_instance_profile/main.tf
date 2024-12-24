module "iam_instance_profile" {
  source    = "../../modules/iam_instance_profile"
  role_name = "my_custom_role"
  role_path = "/custom-path/"
  role_tags = {
    Environment = "Production"
    Owner       = "DevOps Team"
  }

  instance_profile_name = "my_custom_instance_profile"
  instance_profile_path = "/custom-instance-path/"
  instance_profile_tags = {
    Application = "WebServer"
    Team        = "Infrastructure"
  }

}
