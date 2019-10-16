resource "aws_api_gateway_rest_api" "api" {
  name = var.name
  body = var.specification

  # Always compress contents
  minimum_compression_size = 0
}

resource "aws_lambda_permission" "lambda-permission" {
  count     = length(var.lambdas)
  action    = "lambda:InvokeFunction"
  principal = "apigateway.amazonaws.com"

  function_name = var.lambdas[count.index]

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
}

resource "aws_api_gateway_deployment" "api-deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "latest"
}
