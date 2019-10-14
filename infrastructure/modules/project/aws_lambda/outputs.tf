output "arn" {
  value       = module.lambda.arn
  description = "ARN of the lambda"
}

output "name" {
  value       = var.name
  description = "Lambda name"
}
