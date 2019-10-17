variable "name" {
  type        = string
  description = "Lambda name"
}

variable "package-location" {
  type        = string
  description = "Lambda code package, must be unique across your region"
}

variable "execution-role" {
  type        = string
  description = "Execution role ARN"
}

variable "layers" {
  type        = list(string)
  description = "List of the ARNs of the layers to connect to this Lambda"
  default     = []
}

variable "handler" {
  type        = string
  description = "Handler function for the Lambda"
}

variable "runtime" {
  type        = string
  description = "Execution runtime -technology- of the Lambda"
}

variable "execution-timeout" {
  type        = number
  description = "Lambda execution timeout in seconds"
  default     = 10
}

variable "max-memory" {
  type        = number
  description = "Memory allocated to the Lambda in MB"
  default     = 128
}

variable "environment" {
  type        = map(string)
  description = "Environment of the Lambda function"
  default     = {}
}
