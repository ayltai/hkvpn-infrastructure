terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  access_key = var.ec2_access_key
  secret_key = var.ec2_secret_key
  region     = var.region
  version    = "~> 2.32"
}

provider "null" {
  version = "~> 2.1"
}
