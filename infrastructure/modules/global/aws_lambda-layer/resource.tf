resource "aws_lambda_layer_version" "resource" {
  filename   = var.package
  source_code_hash = filebase64sha256(var.package)
  layer_name = var.name
  compatible_runtimes = var.compatible_runtimes
}
