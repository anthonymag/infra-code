terraform {
  backend "s3" {
    encrypt = "true"
    bucket  = "tf-anthonymag"
    region  = "us-east-1"
    key     = "minecraft-server/app/terraform.tfstate"
  }

  required_version = "~> 0.12"
  required_providers {
    aws          = "~> 2.54"
    docker       = "~> 2.7"
    digitalocean = "~> 1.18"
  }
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = [
    "268283624633" # anthonymag
  ]
}

provider "digitalocean" {
  /*
    To authenticate:
    export DIGITALOCEAN_TOKEN=[TOKEN]
  */
}

data "digitalocean_droplet" "docker_host" {
  name = "minecraft-${var.mc_server_name}"
}

provider "docker" {
  host = "tcp://${data.digitalocean_droplet.docker_host.ipv4_address}:2376/"
}

module "minecraft_server_image" {
  source = "../../../docker/image"

  image_name = "itzg/minecraft-server:latest"
}

module "minecraft_server_container" {
  source = "../../../docker/container"

  container_name     = "mc-${var.mc_server_name}"
  container_image    = module.minecraft_server_image.docker_image
  container_env_vars = [
    "EULA=TRUE",
    "VERSION=1.12.2",
    "ENABLE_AUTOPAUSE=TRUE"
  ]
  container_external_port = 25565
  container_internal_port = 25565
  volume_host_path        = "/var/lib/minecraft/${var.mc_server_name}"
  volume_container_path   = "/data"
}
