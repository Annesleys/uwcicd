output "lambda_functions" {
  value = { for idx, mod in module.lambda_functions : idx => mod }
}
