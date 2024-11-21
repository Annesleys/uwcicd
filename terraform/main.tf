terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2" # Change to your desired region
  profile = "default"
}

# variable "lambda_functions" {
#   description = "List of Lambda function configurations."
#   type = list(object({
#     function_name       = string
#     runtime             = string
#     role_arn            = string
#     handler             = string
#     filename            = string
#     environment         = map(string)
#     tags                = map(string)
#   }))
# }

# Loop through the Lambda functions
module "lambda_functions" {
  for_each = { for idx, config in var.lambda_functions : idx => config }

  source = "./modules/lambda"

  function_name        = each.value.function_name
  runtime              = each.value.runtime
  role_arn             = aws_iam_role.lambda_execution_role.arn
  handler              = each.value.handler
  filename             = each.value.filename
  environment_variables = each.value.environment
  tags                 = each.value.tags
}
