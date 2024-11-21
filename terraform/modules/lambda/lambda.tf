resource "aws_lambda_function" "this" {
  function_name = var.function_name
  runtime       = var.runtime
  role          = var.role_arn
  handler       = var.handler
  filename      = var.filename

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}
