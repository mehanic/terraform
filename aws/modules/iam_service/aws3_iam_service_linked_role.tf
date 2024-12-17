# resource "aws_iam_service_linked_role" "this" {
#   for_each = toset(local.aws_service_names)

#   aws_service_name = each.value
# }

# locals {
#   aws_service_names = setsubtract(var.aws_service_names, var.excluded_aws_service_names)
# }


# locals {
#   aws_service_names = setsubtract(var.aws_service_names, var.excluded_aws_service_names)
# }

resource "aws_iam_service_linked_role" "service_linked_role" {
  for_each = toset(local.aws_service_names)

  aws_service_name = each.value

  # Optional parameters
  custom_suffix = var.custom_suffix != null ? var.custom_suffix : null
  description   = var.description != null ? var.description : null
}
