resource "aws_lambda_function" "lambda" {
  filename         = var.package-location
  source_code_hash = filebase64sha256(var.package-location)

  function_name = var.name
  role          = var.execution-role
  handler       = var.handler
  runtime       = var.runtime

  layers = var.layers

  timeout     = var.execution-timeout
  memory_size = var.max-memory

  environment {
    variables = merge(var.environment, { "LAMBDA_NAME" : var.name })
  }
}
