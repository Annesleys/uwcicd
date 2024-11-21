variable "lambda_functions" {
  description = "Configurations for multiple Lambda functions."
  default = [
    {
      function_name = "g2_handler"
      runtime       = "python3.9"
    #   role_arn      = "arn:aws:iam::123456789012:role/lambda-execution-role"
      handler       = "lambda_handler"
      filename      = "extract/g2_handler/lambda_function.zip"
      environment   = { ENV = "prod", DEBUG = "false" }
      tags          = { Name = "g2_handler" }
    },
    {
      function_name = "gamil_extractor"
      runtime       = "python3.9"
    #   role_arn      = "arn:aws:iam::123456789012:role/lambda-execution-role"
      handler       = "lambda_handler"
      filename      = "extract/gamil_extractor/lambda_function.zip"
      environment   = { ENV = "staging", DEBUG = "true" }
      tags          = { Name = "gamil_extractor" }
    }
  ]
}
