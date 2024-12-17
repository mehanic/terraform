terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "data_iam_server_certificate" {
  source             = "../../modules/data_iam_server_certificate"
  cert_name_prefix   = "my-domain.org"
  latest_cert        = true
  elb_name           = "my-domain-elb"
  instance_port      = 8000
  instance_protocol  = "https"
  lb_port            = 443
  lb_protocol        = "https"
  availability_zones = ["us-east-1a", "us-east-1b"]
  environment        = "Production"

}

//aws iam list-server-certificates --query "ServerCertificateMetadataList[*].[ServerCertificateName]" --output table

//aws iam upload-server-certificate --server-certificate-name my-domain-cert \
//    --certificate-body file://certificate.pem \
//    --private-key file://privatekey.pem \
//    --certificate-chain file://certificate_chain.pem
