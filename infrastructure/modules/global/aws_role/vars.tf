variable "name" {
  type = string
  description = "Role name"
}

variable "role_assumption" {
  type = string
  description = "Policy that grants an entity permission to assume the role"
}

variable "policies" {
  type = list(string)
  description = "List of the ARNs of the policies to assign to the role"
  default = []
}

variable "tags" {
  type = map(string)
  description = "Resource tags"
  default = {}
}
