data "aws_region" "current" {}

locals {
  HTTP_OPTIONS = "OPTIONS"
  HTTP_NO-CONTENT = 204
  CORS_ALLOW-METHODS = "method.response.header.Access-Control-Allow-Methods"
  CORS_ALLOW-HEADERS = "method.response.header.Access-Control-Allow-Headers"
  CORS_ALLOW-ORIGINS = "method.response.header.Access-Control-Allow-Origin"
  CORS_METHODS = "'${join(",", keys(var.methods))},OPTIONS'"
  CORS_HEADERS = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
  CORS_ORIGINS = "'*'"
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.api-id
  parent_id   = var.parent-resource
  path_part   = var.path-fragment
}

resource "aws_api_gateway_method" "method" {
  for_each = var.methods

  rest_api_id   = var.api-id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = each.key
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  for_each = var.methods

  rest_api_id             = var.api-id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = each.key
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${data.aws_region.current.name}:lambda:path/2015-03-31/functions/${each.value.arn}/invocations"
}

resource "aws_api_gateway_method" "method-cors" {
  count = var.enable-cors ? 1 : 0

  rest_api_id   = var.api-id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = local.HTTP_OPTIONS
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration-cors" {
  count = var.enable-cors ? 1 : 0

  rest_api_id = var.api-id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = local.HTTP_OPTIONS
  type        = "MOCK"
}

resource "aws_api_gateway_method_response" "method-response-cors" {
  count = var.enable-cors ? 1 : 0

  rest_api_id = var.api-id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = local.HTTP_OPTIONS
  status_code = local.HTTP_NO-CONTENT

  response_parameters = {
    "${local.CORS_ALLOW-METHODS}": true,
    "${local.CORS_ALLOW-HEADERS}": true,
    "${local.CORS_ALLOW-ORIGINS}": true
  }
}

resource "aws_api_gateway_integration_response" "method-integration-response-cors" {
  count = var.enable-cors ? 1 : 0
  depends_on = [aws_api_gateway_method_response.method-response-cors]

  rest_api_id = var.api-id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = local.HTTP_OPTIONS
  status_code = local.HTTP_NO-CONTENT

  response_parameters = {
    "${local.CORS_ALLOW-METHODS}": local.CORS_METHODS,
    "${local.CORS_ALLOW-HEADERS}": local.CORS_HEADERS,
    "${local.CORS_ALLOW-ORIGINS}": local.CORS_ORIGINS
  }
}
