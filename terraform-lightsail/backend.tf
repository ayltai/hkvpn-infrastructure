terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "hkvpn"

    workspaces {
      prefix = "aws-lightsail-"
    }
  }
}
