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
}

# Loop through the Lambda functions
module "lambda_functions_g2_handler" {

  source = "./modules/lambda"

  function_name        = "g2_handler"
  runtime              = var.runtime
  role_arn             = aws_iam_role.lambda_execution_role.arn
  handler              = var.handler
  filename             = "../extract/g2_handler/lambda_function.zip"
}

module "lambda_functions_g2_handler" {

  source = "./modules/lambda"

  function_name        = "gamil_extractor"
  runtime              = var.runtime
  role_arn             = aws_iam_role.lambda_execution_role.arn
  handler              = var.handler
  filename             = "../extract/gamil_extractor/lambda_function.zip"
}

