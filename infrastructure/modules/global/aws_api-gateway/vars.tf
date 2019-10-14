variable "name" {
  type        = string
  description = "API Gateway name"
}

variable "lambdas" {
  type = list(any)
  default = []
}
