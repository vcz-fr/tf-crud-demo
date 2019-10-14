variable "parent-resource" {
  type = string
  description = "Parent API Gateway resource"
}

variable "api-id" {
  type = string
  description = "API Gateway identifier"
}

variable "path-fragment" {
  type = string
  description = "Path fragment. Previous fragments are ensured by the parent resource."
}

variable "methods" {
  type = map(any)
  description = "Map between HTTP methods and lambdas to which the calls will be forwarded"
}

variable "enable-cors" {
  type = bool
  description = "True to automatically handle OPTIONS requests and allow CORS"
  default = true
}
