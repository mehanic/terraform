module "lambda_runtime_management_config" {
  source                = "../../modules/lambda_runtime_management_config"
  function_name         = "example-lambda-function"
  lambda_execution_role = "arn:aws:iam::476167141852:role/my-lambda-role"
  lambda_zip_path       = "lambda_function.zip"
  runtime               = "provided.al2023"
  update_runtime_on     = "FunctionUpdate"
  //runtime_version_arn    = "arn:aws:lambda:us-east-1::runtime:provided.al2023"
  environment_variables = {
    "KEY1" = "value1"
    "KEY2" = "value2"
  }
}


# The update_runtime_on and runtime_version_arn parameters in AWS Lambda configuration serve different purposes and should be used depending on your runtime management strategy. Here's how and where to use them:

# 1. update_runtime_on
# This parameter specifies how AWS Lambda should manage updates to the runtime environment of your function. It has three options:

# Auto:

# Automatically updates the runtime to the latest version whenever a new runtime version is available.
# Does not require a runtime_version_arn.
# Suitable for most managed runtimes (e.g., nodejs, python, etc.).
# FunctionUpdate:

# Updates the runtime only when the function is updated or redeployed (using terraform apply or AWS CLI).
# Does not require a runtime_version_arn.
# Ideal for custom runtimes like provided.al2023, where updates are tied to your function's deployment.
# Manual:

# Requires you to explicitly specify the runtime version via the runtime_version_arn parameter.
# Used when you want full control over the runtime updates and need to pin the runtime to a specific version.
# Not suitable for custom runtimes like provided.al2023.
# 2. runtime_version_arn
# This parameter specifies the exact ARN of the runtime version to be used. It is only valid when update_runtime_on = "Manual". Use this when you want to:

# Pin your Lambda function to a specific runtime version.
# Prevent automatic updates and have explicit control over runtime upgrades.
# For example:

# hcl
# Copy code
# update_runtime_on   = "Manual"
# runtime_version_arn = "arn:aws:lambda:us-east-1::runtime:nodejs16.x"
# Important: For custom runtimes like provided.al2023, this parameter is not applicable because custom runtimes do not have version ARNs.

# Where to Use Each
# Use update_runtime_on = "FunctionUpdate"
# If you are using a custom runtime (e.g., provided.al2023).

# When you want the runtime to be updated only during function updates or redeployments.

# Example:

# hcl
# Copy code
# update_runtime_on = "FunctionUpdate"
# runtime_version_arn = "" # Not required
# Use update_runtime_on = "Manual" with runtime_version_arn
# For managed runtimes where you need to lock the function to a specific runtime version.

# When using a runtime version ARN is supported (e.g., nodejs16.x, python3.9).

# Example:

# hcl
# Copy code
# update_runtime_on   = "Manual"
# runtime_version_arn = "arn:aws:lambda:us-east-1::runtime:nodejs16.x"
# Use update_runtime_on = "Auto"
# For managed runtimes when you want AWS to handle runtime updates automatically.

# Example:

# hcl
# Copy code
# update_runtime_on = "Auto"
# runtime_version_arn = "" # Not required
# Summary of Applicability
# Setting	Managed Runtimes (e.g., python3.9)	Custom Runtime (provided.al2023)
# update_runtime_on = "Auto"	✅ Suitable	🚫 Not recommended
# update_runtime_on = "FunctionUpdate"	✅ Suitable	✅ Recommended
# update_runtime_on = "Manual" with runtime_version_arn	✅ Required	🚫 Not supported
