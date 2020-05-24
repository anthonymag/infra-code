data "docker_registry_image" "image" {
  name = var.image_name
}

resource "docker_image" "image" {
  name = data.docker_registry_image.image.name
}
