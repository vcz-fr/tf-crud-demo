variable "domain" {
  type        = string
  description = "API Gateway domain"
}

variable "lambdas" {
  type = list(any)
  description = "List of Lambdas that will be called by this API Gateway"
  default = []
}
