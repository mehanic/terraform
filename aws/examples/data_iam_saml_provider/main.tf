terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "data_iam_saml_provider" {
  source            = "../../modules/data_iam_saml_provider"
  aws_region        = "us-east-1"
  saml_provider_arn = "arn:aws:iam::123456789012:saml-provider/myprovider"


}

# reading IAM SAML Provider (arn:aws:iam::123456789012:saml-provider/myprovider): operation error IAM:
#  GetSAMLProvider, https response error StatusCode: 403, RequestID: 90b3b028-633f-4d2a-a164-86d525c5e1af, 
#  api error AccessDenied: User: arn:aws:iam::476167141852:user/main is not authorized to access this resource