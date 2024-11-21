variable "function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "runtime" {
  description = "The runtime for the Lambda function."
  type        = string
  default     = "python3.9"
}

variable "role_arn" {
  description = "The ARN of the IAM role for the Lambda function."
  type        = string
}

variable "handler" {
  description = "The handler for the Lambda function."
  type        = string
}

variable "filename" {
  description = "The file path of the deployment package."
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to the Lambda function."
  type        = map(string)
  default     = {}
}
