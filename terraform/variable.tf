variable "handler" {
  description = "The handler for the Lambda function."
  type        = string
  default     = "lambda_handler"
}

variable "runtime" {
  description = "The runtime for the Lambda function."
  type        = string
  default     = "python3.9"
}
