module "iam_signing_certificate" {
  source = "../../modules/iam_signing_certificate"
  # IAM User Name
  user_name = "signing_certificate-test-user"

  # Certificate File Path
  certificate_file_path = "../../modules/iam_signing_certificate/certs/test-user-cert.pem"

  # Inline Certificate Content
  certificate_body_inline = <<EOT
-----BEGIN CERTIFICATE-----
MIIDQTCCAimgAwIBAgITAnotherExampleCertificateBodyGenerated
-----END CERTIFICATE-----
EOT

}


# Error: uploading IAM Signing Certificate: operation error IAM: UploadSigningCertificate, https response error StatusCode: 404, RequestID: c014d236-5c52-460c-8801-439f75a5a4ac, NoSuchEntity: The user with name signing_certificate-test-user cannot be found.
# │ 
# │   with module.iam_signing_certificate.aws_iam_signing_certificate.signing_certificate_test_cert,
# │   on ../../modules/iam_signing_certificate/aws_iam_signing_certificate.tf line 2, in resource "aws_iam_signing_certificate" "signing_certificate_test_cert":
# │    2: resource "aws_iam_signing_certificate" "signing_certificate_test_cert" {
# │ 
# ╵
# ╷
# │ Error: uploading IAM Signing Certificate: operation error IAM: UploadSigningCertificate, https response error StatusCode: 400, RequestID: 922fe70a-7b0d-4769-a7d0-353ffb71e561, MalformedCertificate: Certificate -----BEGIN CERTIFICATE-----
# │ MIIDQTCCAimgAwIBAgITAnotherExampleCertificateBodyGenerated
# │ -----END CERTIFICATE-----
# │ 
# │  is malformed.
# │ 
# │   with module.iam_signing_certificate.aws_iam_signing_certificate.signing_certificate_test_cert_inline,
# │   on ../../modules/iam_signing_certificate/aws_iam_signing_certificate.tf line 8, in resource "aws_iam_signing_certificate" "signing_certificate_test_cert_inline":
# │    8: resource "aws_iam_signing_certificate" "signing_certificate_test_cert_inline" {
# │ 


//openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out test-user-cert.pem in certs/ generate