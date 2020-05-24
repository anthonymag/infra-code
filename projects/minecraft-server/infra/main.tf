terraform {
  backend "s3" {
    encrypt = "true"
    bucket  = "tf-anthonymag"
    region  = "us-east-1"
    key     = "minecraft-server/infra/terraform.tfstate"
  }

  required_version = "~> 0.12"
  required_providers {
    aws          = "~> 2.54"
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

module "droplet" {
  source = "../../../digitalocean/droplet"

  droplet_name = "minecraft-tonyland"
}
