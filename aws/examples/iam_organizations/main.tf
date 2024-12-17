terraform {
  required_version = "1.10.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "iam_organization" {
  source = "../../modules/iam_organizations"

  enabled_features = [
    "RootCredentialsManagement",
    "RootSessions"
  ]

}

# odule.iam_organization.aws_iam_organizations_features.example: Creating...
# ╷
# │ Error: creating Organizations Organization: operation error Organizations: CreateOrganization, https response error StatusCode: 400, RequestID: 20846204-f199-433e-8507-b385c6f11f17, AlreadyInOrganizationException: The AWS account is already a member of an organization.
# │ 
# │   with module.iam_organization.aws_organizations_organization.example,
# │   on ../../modules/iam_organizations/main.tf line 2, in resource "aws_organizations_organization" "example":
# │    2: resource "aws_organizations_organization" "example" {
# │ 
# ╵
# ╷
# │ Error: creating IAM Organizations Features
# │ 
# │   with module.iam_organization.aws_iam_organizations_features.example,
# │   on ../../modules/iam_organizations/main.tf line 8, in resource "aws_iam_organizations_features" "example":
# │    8: resource "aws_iam_organizations_features" "example" {
# │ 
# │ enabling Organizations root credentials management: operation error IAM:
# │ EnableOrganizationsRootCredentialsManagement, https response error StatusCode: 400,
# │ RequestID: 0ef33954-8f46-4b67-93b3-d4a607497e06, ServiceAccessNotEnabledException: Trusted
# │ Access for IAM not enabled by organization of input account 476167141852.
# ╵
