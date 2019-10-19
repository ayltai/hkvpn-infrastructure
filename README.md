# HK VPN

[![CircleCI](https://img.shields.io/circleci/project/github/ayltai/hkvpn-infrastructure/master.svg?style=flat)](https://circleci.com/gh/ayltai/hkvpn-infrastructure)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ayltai/hkvpn-infrastructure)](https://cloud.docker.com/u/ayltai/repository/docker/ayltai/hkvpn-infrastructure)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/3261/badge)](https://bestpractices.coreinfrastructure.org/projects/3261)
[![Release](https://img.shields.io/github/release/ayltai/hkvpn-infrastructure.svg?style=flat)](https://github.com/ayltai/hkvpn-infrastructure/releases)
[![License](https://img.shields.io/github/license/ayltai/hkvpn-infrastructure.svg?style=flat)](https://github.com/ayltai/hkvpn-infrastructure/blob/master/LICENSE)

Automates HK VPN server provisioning and configuration. Made with ❤

HK VPN uses [OpenVPN](https://openvpn.net/), [Cloudflare](https://www.cloudflare.com/) and [OpenDNS](https://www.opendns.com/) to protect your privacy.

[![OpenVPN](images/openvpn.png)](https://openvpn.net/) &nbsp;&nbsp;&nbsp; [![Cloudflare](images/cloudflare.png)](https://www.cloudflare.com/) &nbsp;&nbsp;&nbsp; [![OpenDNS](images/opendns.png)](https://www.opendns.com/)

## Features
* Be ready to use your personal VPN server in under 2 minutes (if you use our [DigitalOcean](https://m.do.co/c/f873e16476e5) deployment)
* Use [OpenVPN](https://openvpn.net/) to secure your online activities
* Use [Cloudflare](https://www.cloudflare.com/) and [OpenDNS](https://www.opendns.com/) as the primary and secondary DNS server respectively to protect your privacy
* Use [Terraform](https://www.terraform.io/) to provision a server using [DigitalOcean Droplets](https://m.do.co/c/f873e16476e5), [Amazon EC2](https://aws.amazon.com/ec2/), [Amazon Lightsail](https://aws.amazon.com/lightsail/), [Microsoft Azure VM](https://azure.microsoft.com/en-us/services/virtual-machines/) or [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/) [Compute](https://www.oracle.com/cloud/compute/) instances.
* Use [Ansible](https://www.ansible.com/) to setup OpenVPN server, certificate authority and system monitoring tools

## Hosting cost

|                         | ![DigitalOcean](images/digitalocean.png) | ![Amazon Lightsail](images/amazon_lightsail.png) | ![Amazon EC2](images/amazon_ec2.png) | ![Azure](images/azure.png) | ![OCI](images/oci.png) |
|-------------------------|------------------------------------------|--------------------------------------------------|--------------------------------------|----------------------------|------------------------|
| Plan                    | Standard                                 | Micro                                            | t3a.micro                            | B1S                        | E2.1.Micro             |
| Frist year cost         | US$ 55                                   | US$ 60                                           | US$ 168                              | US$ 238                    | US$ 288                |
| vCPU                    | 1                                        | 1                                                | 2                                    | 1                          | 1                      |
| Memory                  | 1 GB                                     | 1 GB                                             | 1 GB                                 | 1 GB                       | 1 GB                   |
| Traffic volume included | 1,000 GB                                 | 2,000 GB                                         | 100 GB                               | 100 GB                     | 1,000 GB               |
| Deployment time         | 8 minutes                                | 12 minutes                                       | 7 minutes                            | 13 munutes                 | [Infinity](Oracle.md)  |

## Pre-deployment
You need to `git clone` this repository and decide which cloud platform you want to run your VPN server, then follow the respective deployment instructions.

## Deployment
You can deploy HK VPN to any of the following cloud platforms but I recommend choosing between either [DigitalOcean](https://m.do.co/c/f873e16476e5) or [Amazon Lightsail](https://aws.amazon.com/lightsail/).

* [DigitalOcean](https://m.do.co/c/f873e16476e5) (Recommended)
* [Amazon EC2](https://aws.amazon.com/ec2/)
* [Amazon Lightsail](https://aws.amazon.com/lightsail/)
* [Microsoft Azure](https://azure.microsoft.com/en-us/services/virtual-machines/)
* [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)

[DigitalOcean](https://m.do.co/c/f873e16476e5) is recommended because for US$ 5/month it gives you 1TB bandwidth, which is pretty good for a typical VPN user. While [Amazon Lightsail](https://aws.amazon.com/lightsail/)'s US$ 5/month plan gives you 2TB bandwidth with similar hardware specifications, they don't offer promotional credits like [DigitalOcean](https://m.do.co/c/f873e16476e5) does. For instance, if you register a [DigitalOcean](https://m.do.co/c/f873e16476e5) account using this [promotional link](https://m.do.co/c/f873e16476e5), you will get US$ 50 for free.

Another issue with [Amazon Lightsail](https://aws.amazon.com/lightsail/) is that the deployment is not fully automated and there are some [manual steps](LightSail.md) involved for the deployment.

Terraform and Ansible are used for deployment.

[![Terraform](images/terraform.png)](https://www.terraform.io/) &nbsp;&nbsp;&nbsp; [![Ansible](images/ansible.png)](https://www.ansible.com/)

To deploy HK VPN, follow the documentation of the respective cloud platform:
* [DigitalOcean](DigitalOcean.md)
* [Amazon EC2](EC2.md)
* [Amazon Lightsail](LightSail.md)
* [Microsoft Azure](Azure.md)
* [Oracle Cloud Infrastructure](Oracle.md)

## Post-deployment
The OpenVPN client configuration file will be automatically downloaded to your home directory (`~/hkvpn.ovpn`).

### macOS
For macOS, follow the [instruction](https://openvpn.net/vpn-server-resources/installation-guide-for-openvpn-connect-client-on-macos/) to install a VPN client or use [Tunnelblick](https://tunnelblick.net/) and import the client configuration file (`hkvpn.ovpn`). 

### Windows
For Windows, follow the [instruction](https://openvpn.net/vpn-server-resources/installation-guide-for-openvpn-connect-client-on-windows/) to install a VPN client and import the client configuration file (`hkvpn.ovpn`).

## Secure connection verification

1. Check if your real IP is hidden: [IP address test](https://whatismyip.com)
2. Check if your DNS leaks: [DNS leak check](https://www.dnsleaktest.com)
