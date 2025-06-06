# Terraform HCloud Network

![pipeline](https://github.com/cktf/terraform-hcloud-network/actions/workflows/ci.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-hcloud-network?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-hcloud-network)

**Network** is a Terraform module useful for creating **Network**, **Subnets**, **Routes**, and **Firewalls** on **HCloud**

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "network" {
  source = "cktf/network/hcloud"

  name = "mynet"
  cidr = "192.168.0.0/16"
  subnets = {
    masters = {
      type = "server",
      cidr = "192.168.0.0/24"
    }
    workers = {
      type = "server",
      cidr = "192.168.1.0/24"
    }
  }

  firewalls = {
    manager = {
      targets = ["cluster/role=manager"]
      inbounds = {
        "80:tcp" = {
          description = "HTTP Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
        "443:tcp" = {
          description = "HTTPS Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
        "443:tcp" = {
          description = "HTTPS Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
      }
    }
    worker = {
      targets = ["cluster/role=worker"]
      inbounds = {
        "80:tcp" = {
          description = "HTTP Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
        "443:tcp" = {
          description = "HTTPS Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
      }
    }
  }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
