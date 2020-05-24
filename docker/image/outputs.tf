output "docker_image" {
  description = "Docker image"
  value       = docker_image.image.latest
}