variable "name" {
  type = string
  description = "Layer name"
}

variable "package" {
  type = string
  description = "Package file location"
}

variable "compatible_runtimes" {
  type = list(string)
  description = "List of compatible runtimes. Must not be empty."
}
