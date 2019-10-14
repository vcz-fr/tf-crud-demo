output "id" {
    value = aws_api_gateway_rest_api.api.id
    description = "API Gateway ID"
}

output "root-resource" {
    value = aws_api_gateway_rest_api.api.root_resource_id
    description = "API Gateway root resource identifier"
}
