variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "oidc_url" {
  description = "The URL of the OpenID Connect provider."
  type        = string
  default     = "https://accounts.google.com"
}

variable "client_id_list" {
  description = "A list of client IDs (audiences) for the OIDC provider."
  type        = list(string)
  default = [
    "266362248691-342342xasdasdasda-apps.googleusercontent.com"
  ]
}

variable "thumbprint_list" {
  description = "A list of server certificate thumbprints for the OIDC provider."
  type        = list(string)
  default     = ["cf23df2207d99a74fbe169e3eba035e633b65d94"]
}

variable "oidc_tags" {
  description = "A map of tags to assign to the OIDC provider."
  type        = map(string)
  default     = {}
}


variable "saml_provider_name" {
  description = "The name of the IAM SAML provider."
  type        = string
  default     = "myprovider"
}

# variable "saml_metadata_file" {
#   description = "The file path to the SAML metadata XML file."
#   type        = string
#   default     = "saml/saml-metadata.xml"
# }

variable "saml_tags" {
  description = "A map of tags to assign to the IAM SAML provider."
  type        = map(string)
  default     = {}
}

variable "saml_metadata_document" {
  description = "SAML metadata document in XML format"
  type        = string
  default     = <<EOF
<?xml version="1.0"?>
<md:EntityDescriptor xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata" validUntil="2020-02-11T12:09:22Z" cacheDuration="PT1581854962S" entityID="dss">
  <md:IDPSSODescriptor WantAuthnRequestsSigned="false" protocolSupportEnumeration="urn:oasis:names:tc:SAML:2.0:protocol">
    <md:KeyDescriptor use="signing">
      <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
        <ds:X509Data>
          <ds:X509Certificate>fdsfdsfdsfdsfdsfdsf</ds:X509Certificate>
        </ds:X509Data>
      </ds:KeyInfo>
    </md:KeyDescriptor>
    <md:KeyDescriptor use="encryption">
      <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
        <ds:X509Data>
          <ds:X509Certificate>fdsfdsfdsfdsfdsfdsf</ds:X509Certificate>
        </ds:X509Data>
      </ds:KeyInfo>
    </md:KeyDescriptor>
    <md:NameIDFormat>urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified</md:NameIDFormat>
    <md:SingleSignOnService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" Location="https://www.samltool.com/idp_metadata.php"/>
  </md:IDPSSODescriptor>
  <md:ContactPerson contactType="technical">
    <md:GivenName>Vitaliy Natarov</md:GivenName>
    <md:EmailAddress>solo.metalisebastian@gmail.com</md:EmailAddress>
  </md:ContactPerson>
</md:EntityDescriptor>
EOF
}
