# Deployment
This page shows you how to deploy HK VPN using [Microsoft Azure](https://azure.microsoft.com/en-us/services/virtual-machines/).

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### Azure Subscription ID
You will need the Azure Subscription ID to automate the script. The Subscription ID can be found in "Subscription" resource.

1. Go to "Subscription" blade
2. Copy your Subscription ID
3. Export Subscription ID as an envrionment variable:
   ```sh
   export TF_VAR=2f0...f4b
   ```

### Azure Client ID and Tenant ID
You will need the Azure Client ID and Tenant ID to automate the script.

1. Go to "Azure Active Directory" blade
2. Go to "App registrations"
3. Client "New registration"
4. Enter "HK VPN" as the "Display name", and click "Register"
5. The Client ID and Tenant ID can be found on the Application details page
6. Export your Client ID and Tenant ID as environment variables:
   ```sh
   export TF_VAR_client_id=f71...466
   export TF_VAR_tenant_id=ba0...c37
   ```

### Azure Client Secret
You will need the Client Secret to automate the script.

1. Go to Application details blade in step 5 above
2. Click "Certificates & secrets"
3. Click "New client secret"
4. Copy your Client Secret
5. Export your Client Secret as an environment variable
   ```sh
   export TF_VAR_client_secret=-7x.../Ja
   ```

### IAM permissions
Your Azure Application will need the following IAM permission to manage Azure resources:

1. Go to "Subscription" blade
2. Go to "Access control (IAM)"
3. Click "Add" > "Add role assignment"
4. Add "Contributor" role to your Service Principal account

### SSH key pairs
You will need a key pair for connecting the newly provisioned instance using SSH. Currently [Terraform](https://www.terraform.io/) [does not support](https://www.terraform.io/docs/providers/aws/r/key_pair.html) creating key pairs so you have to supply your own.

1. Follow [Azure documentation](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys) to create your key pair
2. Save your private key to `~/.ssh/hkvpn.pem` (or as specified in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-azure/variables.tf))
3. Save your public key to `~/.ssh/hkvpn.pub` (or as specified in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-azure/variables.tf))
4. Change the variables defined in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform-azure/variables.tf) and [playbook.yml](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/playbook.yml) to fit your needs

### Ansible Vault password
The SSH certificate password is encrypted by [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html). You will need to specify a Vault password file in order to decrypt the password during the Ansible automation process. The file path is defined in [Let's Encrypt role](https://github.com/ayltai/hknews-infrastructure/tree/master/ansible/letsencrypt/vars/main.yml).

## Provisioning
1. Go to [terraform](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-azure) directory
  ```sh
  cd terraform-azure
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
