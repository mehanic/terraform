resource "aws_iam_role" "aws_iam_role_policy_test_role" {
  name               = var.aws_iam_role_policy_test_role_name
  assume_role_policy = var.aws_iam_role_policy_test_role_assume_role_policy
}

resource "aws_iam_role_policy" "aws_iam_role_policy_test_policy" {
  name   = var.aws_iam_role_policy_test_policy_name
  role   = aws_iam_role.aws_iam_role_policy_test_role.id
  policy = var.aws_iam_role_policy_test_policy_document
}

//---------------





# Purpose: This data source creates a policy document that defines the assume role permissions for a given set of principals.
# Key Features:
# Effect: The policy grants Allow permissions for the specified actions (sts:AssumeRole in most cases).
# Actions: The assume_role_actions variable is used to specify which actions are allowed (typically sts:AssumeRole).
# Principals: The principals block specifies which AWS entities (like users, roles, or services) can assume this role. The principals is a map, where the key is the principal type (e.g., AWS, Service), and the value is a list of identifiers (e.g., ARNs of roles or users).
# Conditions: The dynamic block allows for adding conditions to the role assumption, such as requiring specific values for tags or other contextual conditions.
data "aws_iam_policy_document" "assume_role" {
  count = var.enabled ? length(keys(var.principals)) : 0

  statement {
    effect  = "Allow"
    actions = var.assume_role_actions

    principals {
      type        = element(keys(var.principals), count.index)
      identifiers = var.principals[element(keys(var.principals), count.index)]
    }

    dynamic "condition" {
      for_each = var.assume_role_conditions
      content {
        test     = condition.value.test
        variable = condition.value.variable
        values   = condition.value.values
      }
    }
  }
}

# Purpose: This is an aggregated policy document that combines the individual assume role documents.
# Key Features:
# Override: This data source takes the JSON output from the previous assume_role documents and overrides them to create a consolidated version. It generates a single assume role policy document that includes all the conditions and principals defined across all the individual policies.
# Count: It uses a count based on the enabled variable to determine if this should be generated.

data "aws_iam_policy_document" "assume_role_aggregated" {
  count                     = var.enabled ? 1 : 0
  override_policy_documents = data.aws_iam_policy_document.assume_role[*].json
}

# Service: AWS Identity and Access Management (IAM)
# Role: The IAM role is a critical component in AWS security. It defines a set of permissions that can be assumed by trusted entities (such as users, services, or EC2 instances). These permissions govern what actions the entities can perform in AWS.
# Key Function:
# The role can be assumed by AWS services or users via the sts:AssumeRole action.
# The assume_role_policy defines the trust relationships (which entities can assume this role).
# You can attach managed policies or inline policies to the role to control what actions it can perform on resources.

resource "aws_iam_role" "default" {
  count                = var.enabled ? 1 : 0
  name                 = var.use_fullname ? var.role_id : var.name
  assume_role_policy   = join("", data.aws_iam_policy_document.assume_role_aggregated[*].json)
  description          = var.role_description
  max_session_duration = var.max_session_duration
  permissions_boundary = var.permissions_boundary
  path                 = var.path
  tags                 = var.tags_enabled ? var.tags : null
}



resource "aws_iam_role_policy" "default" {
  count = var.enabled && var.policy_document_count > 0 && var.inline_policy_enabled ? 1 : 0

  name   = var.policy_name != "" && var.policy_name != null ? var.policy_name : var.role_id
  role   = join("", aws_iam_role.default[*].name)
  policy = join("", data.aws_iam_policy_document.default[*].json)
}

data "aws_iam_policy_document" "default" {
  count                     = var.enabled && var.policy_document_count > 0 ? 1 : 0
  override_policy_documents = var.policy_documents
}

# Service: AWS Identity and Access Management (IAM)
# Role: Policies grant permissions to perform actions on AWS resources. These permissions are attached to the role (either inline or as a managed policy).
# Key Function:
# The policy specifies what actions can be taken on which resources (for example, s3:PutObject for S3 buckets).
# This policy is attached to the IAM role, either inline or as a managed policy.

resource "aws_iam_policy" "default" {
  count       = var.enabled && var.policy_document_count > 0 && !var.inline_policy_enabled ? 1 : 0
  name        = var.policy_name != "" && var.policy_name != null ? var.policy_name : var.role_id
  description = var.policy_description
  policy      = join("", data.aws_iam_policy_document.default[*].json)
  path        = var.path
  tags        = var.tags_enabled ? var.tags : null
}

# Service: AWS Identity and Access Management (IAM)
# Role: Attaches a managed IAM policy to a specific IAM role.
# Key Function:
# This allows you to attach a managed policy to an IAM role.
# The policy can either be predefined by AWS or custom-defined by you.

resource "aws_iam_role_policy_attachment" "default" {
  count      = var.enabled && var.policy_document_count > 0 && !var.inline_policy_enabled ? 1 : 0
  role       = join("", aws_iam_role.default[*].name)
  policy_arn = join("", aws_iam_policy.default[*].arn)
}

# Service: AWS Identity and Access Management (IAM)
# Role: This resource attaches predefined managed policies to the IAM role.
# Key Function:
# This allows you to attach AWS-managed policies (e.g., AmazonS3FullAccess) to your IAM role.
# Managed policies can be reused across multiple roles.
resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = var.enabled ? var.managed_policy_arns : []
  role       = join("", aws_iam_role.default[*].name)
  policy_arn = each.key
}

# Service: AWS Identity and Access Management (IAM)
# Role: An instance profile is an AWS resource that allows EC2 instances to assume an IAM role.
# Key Function:
# This resource creates an instance profile that associates an IAM role with an EC2 instance.
# The instance profile allows EC2 instances to obtain temporary credentials for the IAM role.
resource "aws_iam_instance_profile" "default" {
  count = var.enabled && var.instance_profile_enabled ? 1 : 0
  name  = var.role_id
  role  = join("", aws_iam_role.default[*].name)
}


