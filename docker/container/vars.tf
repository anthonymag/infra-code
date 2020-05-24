variable "container_name" {
  description = "Example: haproxy"
  type        = string
}

variable "container_image" {
  description = "Example: ubuntu:latest"
  type        = string
}

variable "container_env_vars" {
  description = "Example: [\"FOO=BAR\", \"SHELL=BASH\"]"
  type        = list(string)
}

variable "container_external_port" {
  description = "Example: 80"
  type        = number
}

variable "container_internal_port" {
  description = "Example: 8080"
  type        = number
}

variable "volume_host_path" {
  description = "Example: /path/to/vol"
  type        = string
}

variable "volume_container_path" {
  description = "Example: /path/to/vol"
  type        = string
}
