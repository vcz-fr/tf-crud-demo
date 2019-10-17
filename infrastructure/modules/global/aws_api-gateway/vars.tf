variable "name" {
  type        = string
  description = "API Gateway name"
}

variable "specification" {
  type        = string
  description = "API Gateway specification"
}

variable "lambdas" {
  type        = list(any)
  description = "List of Lambdas that will be called by this API Gateway"
  default     = []
}
