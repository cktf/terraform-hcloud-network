# Terraform HCloud Network

![pipeline](https://github.com/cktf/terraform-hcloud-network/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-hcloud-network?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-hcloud-network)

**Network** is a Terraform module useful for creating **Network** and **Subnets** on **HCloud**

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
  subnets = [""]
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
