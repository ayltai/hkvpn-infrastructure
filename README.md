# HK VPN

[![CircleCI](https://img.shields.io/circleci/project/github/ayltai/hkvpn-infrastructure/master.svg?style=flat)](https://circleci.com/gh/ayltai/hkvpn-infrastructure)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ayltai/hkvpn-infrastructure)](https://cloud.docker.com/u/ayltai/repository/docker/ayltai/hkvpn-infrastructure)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/3261/badge)](https://bestpractices.coreinfrastructure.org/projects/3261)
[![Release](https://img.shields.io/github/release/ayltai/hkvpn-infrastructure.svg?style=flat)](https://github.com/ayltai/hkvpn-infrastructure/releases)
[![License](https://img.shields.io/github/license/ayltai/hkvpn-infrastructure.svg?style=flat)](https://github.com/ayltai/hkvpn-infrastructure/blob/master/LICENSE)

Automates HK VPN server provisioning and configuration. Made with ❤

## Features
* Use [Terraform](https://www.terraform.io/) to provision a server using [DigitalOcean Droplets](https://m.do.co/c/f873e16476e5), [Amazon EC2](https://aws.amazon.com/ec2/), [Amazon Lightsail](https://aws.amazon.com/lightsail/), [Microsoft Azure VM](https://azure.microsoft.com/en-us/services/virtual-machines/) or [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/) [Compute](https://www.oracle.com/cloud/compute/) instances.
* Use [Ansible](https://www.ansible.com/) to setup OpenVPN server, certificate authority and system monitoring tools

## Deployment
You can deploy HK VPN to any of the following cloud platforms but I recommend choosing between either [DigitalOcean](https://m.do.co/c/f873e16476e5) or [Amazon Lightsail](https://aws.amazon.com/lightsail/).

* [DigitalOcean](https://m.do.co/c/f873e16476e5) (Recommended)
* [Amazon EC2](https://aws.amazon.com/ec2/)
* [Amazon Lightsail](https://aws.amazon.com/lightsail/)
* [Microsoft Azure](https://azure.microsoft.com/en-us/services/virtual-machines/)
* [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)

[DigitalOcean](https://m.do.co/c/f873e16476e5) is recommended because for US$ 5/month it gives you 1TB bandwidth, which is pretty good for a typical VPN user. While [Amazon Lightsail](https://aws.amazon.com/lightsail/)'s US$ 5/month plan gives you 2TB bandwidth with similar hardware specifications, they don't offer promotional credits like [DigitalOcean](https://m.do.co/c/f873e16476e5) does. For instance, if you register a [DigitalOcean](https://m.do.co/c/f873e16476e5) account using this [promotional link](https://m.do.co/c/f873e16476e5), you will get US$ 25 for free. That means you can have your HK VPN server running for free for the first 5 months. In other words, [Amazon Lightsail](https://aws.amazon.com/lightsail/) would cost you US$ 60/year while for [DigitalOcean](https://m.do.co/c/f873e16476e5), it would cost you only US$ 35 for the first year.

To deploy HK VPN, follow the documentation of the respective cloud platform:
* [DigitalOcean](DigitalOcean.md)
* [Amazon EC2](EC2.md)
* [Amazon Lightsail](LightSail.md)
* [Microsoft Azure](Azure.md)
* [Oracle Cloud Infrastructure](Oracle.md)
