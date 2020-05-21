resource "digitalocean_droplet" "droplet" {
  image  = var.droplet_image
  name   = var.droplet_name
  region = var.region
  size   = var.droplet_size
}
