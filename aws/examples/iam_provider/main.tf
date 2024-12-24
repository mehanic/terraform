module "iam_provider" {
  source = "../../modules/iam_provider"
  //saml_metadata_file = file("${path.module}/saml/saml-metadata.xml")

  oidc_url        = "https://accounts.google.com"
  client_id_list  = ["266362248691-342342xasdasdasda-apps.googleusercontent.com"]
  thumbprint_list = ["9e99a48a9960a2b2e8ebdc8dc316a4b05ed8e6d0"] # Valid SHA-1 thumbprint
  oidc_tags = {
    Environment = "Production"
    Owner       = "oids Team"
  }

}
