# Deployment

[![Amazon EC2](images/amazon_ec2.png)](https://aws.amazon.com/ec2/)

This page shows you how to deploy HK VPN using [Amazon EC2](https://aws.amazon.com/ec2/).

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### IAM permissions
You will need the following policies attached to the AWS user account used to run the scripts:

* AmazonEC2FullAccess
* AmazonVPCFullAccess
* CloudWatchActionsEC2Access

### AWS Access Key and Secret Key
You will need AWS Access Key and Secret Key to manage resources of your AWS account.

1. Create an IAM group with the required permissions described above
2. Create an IAM user for programmatic access
3. Follow the [instruction](https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/) to get your Access Key and Secret Key
4. Export the keys as environment variables:
   ```sh
   export TF_VAR_ec2_access_key=abc123
   export TF_VAR_ec2_secret_key=xyz789
   ```

### SSH key pairs
You will need a key pair for connecting the newly provisioned instance using SSH. Currently [Terraform](https://www.terraform.io/) [does not support](https://www.terraform.io/docs/providers/aws/r/key_pair.html) creating key pairs so you have to supply your own.

1. Follow [AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws) to create your key pair
2. Save your private key to `~/.ssh/hkvpn.pem` (or as specified in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-ec2/variables.tf))
3. Save your public key to `~/.ssh/hkvpn.pub` (or as specified in [variables.tf](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-ec2/variables.tf))
4. Change the variables defined in [variables.tf](https://github.com/ayltai/hknews-infrastructure/tree/master/terraform-ec2/variables.tf) and [playbook.yml](https://github.com/ayltai/hkvpn-infrastructure/tree/master/ansible/playbook.yml) to fit your needs

### Ansible Vault password
The SSH certificate password is encrypted by [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html). You will need to specify a Vault password file in order to decrypt the password during the Ansible automation process. The file path is defined in [Let's Encrypt role](https://github.com/ayltai/hknews-infrastructure/tree/master/ansible/letsencrypt/vars/main.yml).

## Provisioning
1. Clone this repository
   ```sh
   git clone https://github.com/ayltai/hkvpn-infrastructure.git
   ```
2. Go to [terraform-ec2](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-ec2) directory
   ```sh
   cd terraform-ec2
   ```
3. Initialize Terraform backend and plugins
   ```sh
   terraform init
   ```
4. Plan for the changes
   ```sh
   terraform plan -out main
   ```
5. If the potential changes look fine, apply them
   ```sh
   terraform apply main
   ```
