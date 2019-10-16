module "resource" {
  source = "../../global/aws_dynamodb"

  name = var.name
  hash-key = var.pk
 
  attributes = var.attributes
}
