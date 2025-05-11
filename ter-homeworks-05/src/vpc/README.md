## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.vpc_module](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.vpc_module](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | VPC network&subnet name | `string` | `"vpc_net"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to create | <pre>list(object({<br>    zone = string<br>    cidr = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr": "10.0.1.0/24",<br>    "zone": "ru-central1-a"<br>  }<br>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the created vpc network |
| <a name="output_subnet_ids_list"></a> [subnet\_ids\_list](#output\_subnet\_ids\_list) | IDs of the created subnets in list format |
| <a name="output_subnet_ids_map"></a> [subnet\_ids\_map](#output\_subnet\_ids\_map) | IDs of the created subnets in map format) |
