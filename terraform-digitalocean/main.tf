terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  version = "~> 1.9"
}

provider "null" {
  version = "~> 2.1"
}
