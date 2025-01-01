# SNS Topic Data Protection Policy
resource "aws_sns_topic_data_protection_policy" "example" {
  arn = aws_sns_topic.user_updates.arn
  policy = jsonencode({
    "Description" = "Example data protection policy"
    "Name"        = "__example_data_protection_policy"
    "Statement" = [
      {
        "DataDirection" = "Inbound"
        "DataIdentifier" = [
          "arn:aws:dataprotection::aws:data-identifier/EmailAddress",
        ]
        "Operation" = {
          "Deny" = {}
        }
        "Principal" = [
          "*",
        ]
        "Sid" = "__deny_statement_11ba9d96"
      },
    ]
    "Version" = "2021-06-01"
  })
}