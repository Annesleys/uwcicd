################## g2 Handler IAM Role ####################

resource "aws_iam_role" "lambda_execution_role_g2_handler" {
  name               = "lambda_execution_role_g2_handler"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_execution_policy_g2_handler" {
  name   = "lambda_execution_policy_g2_handler"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy_g2_handler_attachment" {
  role       = aws_iam_role.lambda_execution_role_g2_handler.name
  policy_arn = aws_iam_policy.lambda_execution_policy_g2_handler.arn
}

output "g2_handler_role_arn" {
  value = aws_iam_role.lambda_execution_role_g2_handler.arn
}

################## Gmail Extractor IAM Role ####################

resource "aws_iam_role" "lambda_execution_role_gmail_Extractor" {
  name               = "lambda_execution_role_gmail_Extractor"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_execution_policy_gmail_Extractor" {
  name   = "lambda_execution_policy_gmail_Extractor"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy_gmail_Extractor_attachment" {
  role       = aws_iam_role.lambda_execution_role_gmail_Extractor.name
  policy_arn = aws_iam_policy.lambda_execution_policy_gmail_Extractor.arn
}

output "gmail_Extractor_role_arn" {
  value = aws_iam_role.lambda_execution_role_gmail_Extractor.arn
}

################## add new IAM Role, Policy,  attachments and output ####################
