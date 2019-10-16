output "arn" {
  value       = module.resource.arn
  description = "ARN of the lambda"
}

output "name" {
  value       = var.name
  description = "Lambda name"
}

output "api-integration" {
  value       = templatefile("${path.module}/templates/api-gateway.tpl", local.tpl-vars)
  description = "API Gateway integration code for the Lambda"
}
