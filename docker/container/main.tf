resource "docker_container" "container" {
  name  = var.container_name
  image = var.container_image
  env   = var.container_env_vars

  ports {
    external = var.container_external_port
    internal = var.container_internal_port
  }

  volumes {
    host_path      = var.volume_host_path
    container_path = var.volume_container_path
  }
}
