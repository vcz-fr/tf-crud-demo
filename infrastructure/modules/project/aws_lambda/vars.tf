variable "name" {
  type = string
  description = "Lambda name"
}

variable "execution-role" {
  type = string
  description = "Execution role ARN"
}

variable "layers" {
  type = list(string)
  description = "List of the ARNs of the layers to connect to this Lambda"
  default = []
}

variable "environment" {
  type = map(string)
  description = "Environment of the Lambda function"
  default = {}
}

variable "tags" {
  type = map(string)
  description = "Resource tags"
  default = {}
}
