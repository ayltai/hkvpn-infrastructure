# Deployment
This page shows you how to deploy HK VPN using [DigitalOcean Droplets](https://m.do.co/c/f873e16476e5).

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### Personal Access Token
You will need a [Personal Access Token](https://www.digitalocean.com/docs/api/create-personal-access-token/) to manage resources of your [DigitalOcean](https://m.do.co/c/f873e16476e5) account.

1. Sign in to your [DigitalOcean](https://m.do.co/c/f873e16476e5) account
2. Go to [Application & API](https://cloud.digitalocean.com/account/api/tokens) page
3. Click "Generate New Token"
4. Follow the [instruction](https://www.digitalocean.com/docs/api/create-personal-access-token/) to create a token
5. Export your token as an environment variable
   ```sh
   export DIGITALOCEAN_TOKEN=d71...11b
   ```

### SSH key pair
You will need a key pair to authenticate with your deployed Droplet. Currently [Terraform](https://www.terraform.io/) does not support creating key pairs so you have to supply your own.

1. Follow [the instruction](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-1804) to create your key pair
2. Save your private key to `~/.ssh/hkvpn.key` and public key to `~/.ssh/hkvpn.pub` (or as specified in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-digitalocean/variables.tf))
3. Change the variables defined in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-digitalocean/variables.tf) and [playbook.yml](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/playbook.yml) to fit your needs

### Ansible Vault password
The SSH certificate password is encrypted by [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html). You will need to specify a Vault password file in order to decrypt the password during the Ansible automation process. The file path is defined in [Let's Encrypt role](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/letsencrypt/vars/main.yml).

## Provisioning
1. Go to [terraform](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-digitalocean) directory
  ```sh
  cd terraform-digitalocean
  ```
2. Initialize Terraform backend and plugins
  ```sh
  terraform init
  ```
3. Plan for the changes
  ```sh
  terraform plan -out main
  ```
4. If the potential changes look fine, apply them
  ```sh
  terraform apply main
  ```

## Post installation
The OpenVPN client configuration file will be automatically downloaded to your home directory (`~/client.ovpn`).
