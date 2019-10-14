output "arn" {
  value       = aws_lambda_layer_version.resource.arn
  description = "ARN of the layer"
}
