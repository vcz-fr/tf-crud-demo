locals {
  input_dir = "../../../application/lambdas/${var.name}"
  output_package = ".out/${var.name}.zip"
}

data "archive_file" "lbd-onLogin" {
  type = "zip"
  source_dir = local.input_dir
  output_path = local.output_package
}

module "lambda" {
  source = "../../global/aws_lambda"

  name = var.name
  package-location = local.output_package

  execution-role = var.execution-role
  handler = "index.handler"
  runtime = "nodejs10.x"

  layers = var.layers
  environment = var.environment
}
