# Deployment
This page shows you how to deploy HK VPN using [Amazon Lightsail](https://aws.amazon.com/lightsail/).

## Prerequisites
You will need [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/) to run the scripts in this repository.

### IAM permissions
Amazon does not define Lightsail specific policies by default. You can follow this [guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-managing-access-for-an-iam-user) to create your own policy.

### Installing Terraform
Follow the [official documentation](https://learn.hashicorp.com/terraform/getting-started/install.html) to install [Terraform](https://www.terraform.io/).

### Installing Ansible
Follow the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install [Ansible](https://www.ansible.com/).

### AWS Access Key and Secret Key
You will need AWS Access Key and Secret Key to manage resources of your AWS account.

1. Create an IAM group with the required permissions described above
2. Create an IAM user for programmatic access
3. Follow the [instruction](https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/) to get your Access Key and Secret Key
4. Export the keys as environment variables:
   ```sh
   export TF_VAR_lightsail_access_key=abc123
   export TF_VAR_lightsail_secret_key=xyz789
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
1. Go to [terraform](https://github.com/ayltai/hkvpn-infrastructure/tree/master/terraform-ec2) directory
   ```sh
   cd terraform-ec2
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
5. Manually open UDP port 1194 since Terraform currently [does not support](https://github.com/terraform-providers/terraform-provider-aws/issues/700) managing instance firewall:
