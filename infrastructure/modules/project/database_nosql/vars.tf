variable "name" {
  type        = string
  description = "DynamoDB table name"
}

variable "pk" {
  type        = string
  description = "Primary key. To be defined as an attribute as well."
}

variable "sk" {
  type        = string
  description = "Secondary sort key. To be defined as an attribute as well."
  default     = ""
}

variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
  description = "Table attributes"
}
