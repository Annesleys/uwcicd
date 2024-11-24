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

# g2 handler Lambda functions
module "lambda_functions_g2_handler" {

  source = "./modules/lambda"

  function_name        = "g2_handler"
  runtime              = var.runtime
  role_arn             = aws_iam_role.lambda_execution_role_g2_handler.arn
  handler              = var.handler
  filename             = "../extract/g2_handler/lambda_function.zip"
}

# gmail extractor Lambda functions
module "lambda_functions_gmail_extractor" {

  source = "./modules/lambda"

  function_name        = "gmail_extractor"
  runtime              = var.runtime
  role_arn             = aws_iam_role.lambda_execution_role_gmail_Extractor.arn
  handler              = var.handler
  filename             = "../extract/gmail_extractor/lambda_function.zip"
}

# add new lambda modules to create new lambda functions

# SQS modules
module "sqs" {

  source = "./modules/sqs"

  queue_name          = "sample_queue_name"
  fifo_queue          = false
}
