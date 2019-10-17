resource "aws_dynamodb_table" "table" {
  name = var.name

  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash-key
  range_key    = var.range-key

  dynamic "attribute" {
    for_each = var.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
}
