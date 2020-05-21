variable "droplet_image" {
  description = "Example: ubuntu-18-04-x64"
  type        = string
  default     = "ubuntu-18-04-x64"
}

variable "droplet_name" {
  description = "Example: minecraft-server"
  type        = string
}

variable "region" {
  description = "Example: nyc1"
  type        = string
  default     = "nyc1"
}

variable "droplet_size" {
  description = "Example: s-1vcpu-1gb"
  type        = string
  default     = "s-1vcpu-1gb"
}