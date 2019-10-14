variable "name" {
  type = string
  description = "DynamoDB table name"
}

variable "hash-key" {
  type = string
  description = "Primary key. To be defined as an attribute as well."
}

variable "range-key" {
  type = string
  description = "Secondary sort key. To be defined as an attribute as well."
  default = ""
}

variable "attributes" {
  type = list(object({
      name = string
      type = string
  }))
  description = "Table attributes"
}

variable "tags" {
  type = map(string)
  description = "Resource tags"
  default = {}
}
