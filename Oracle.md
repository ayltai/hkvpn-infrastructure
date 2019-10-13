# Deployment
This page shows you how to deploy HK VPN using [Oracle Cloud Infrastructure (OCI)](https://www.oracle.com/cloud/) [Compute](https://www.oracle.com/cloud/compute/).

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### OCI IAM permissions
You will need the following policies attached to the OCI user account used to run the scripts:
* `Allow group [GROUP NAME] to manage instance-family in tenancy`
* `Allow group [GROUP NAME] to read app-catalog-listing in tenancy`
* `Allow group [GROUP NAME] to manage volume-family in tenancy`
* `Allow group [GROUP NAME] to manage virtual-network-family in tenancy`

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### API key pair
You will need a key pair for creating the target instance using [OCI API](https://docs.cloud.oracle.com/iaas/api/). Currently [Terraform](https://www.terraform.io/) does not support creating key pairs for using [OCI API](https://docs.cloud.oracle.com/iaas/api/) so you have to supply your own.

1. Follow [OCI documentation](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm) to create your key pair
2. Save your private key to `~/.ssh/hkvpn.pem` (or as specified in [credentials.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-oracle/variables.tf))
3. Upload your public key to OCI: Identity > Users > User Details > API Keys
4. Change the variables defined in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-oracle/variables.tf) and [playbook.yml](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/playbook.yml) to fit your needs

### SSH key pair
You will need a key pair for connecting the newly provisioned instance using SSH. Currently [Terraform](https://www.terraform.io/) does not support uploading key pairs to OCI so you have to supply your own

1. Follow [OCI documentation](https://docs.cloud.oracle.com/iaas/Content/GSG/Tasks/creatingkeys.htm) to create your key pair
2. Save your private key to `~/.ssh/hkvpn.key` (or as specified in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-oracle/variables.tf))
3. Export your public key as an environment variable: `export TF_VAR_ssh_public_key="ssh-rsa AAA...yX25 hkvpn"`
4. Change the variables defined in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-oracle/variables.tf) and [playbook.yml](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/playbook.yml) to fit your needs

### Ansible Vault password
The SSH certificate password is encrypted by [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html). You will need to specify a Vault password file in order to decrypt the password during the Ansible automation process. The file path is defined in [Let's Encrypt role](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/letsencrypt/vars/main.yml).

## Provisioning
1. Go to [terraform](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-oracle) directory
  ```sh
  cd terraform-oracle
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

## Troubleshooting

### Out of host capacity
If you get "Out of host capacity" error while creating a [Compute](https://www.oracle.com/cloud/compute/) instance, it means that [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/) has run out of free resources for their first 10 customers. You may try again next year, upgrade to a paid plan, or deploy HK VPN to other platforms such as [DigitalOcean](DigitalOcean.md), [Amazon EC2](EC2.md), [Amazon Lightsail](LightSail.md) or [Microsoft Azure](Azure.md).
