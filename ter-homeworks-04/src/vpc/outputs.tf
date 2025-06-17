output "network_id" {
  description = "ID of the created vpc network"
  value = yandex_vpc_network.vpc_module.id
}

output "subnet_ids_map" {
  description = "IDs of the created subnets in map format)"
  value = {
    for subnet in yandex_vpc_subnet.vpc_module : subnet.zone => subnet.id
  }
}

output "subnet_ids_list" {
  description = "IDs of the created subnets in list format"
  value = [for subnet in yandex_vpc_subnet.vpc_module : subnet.id]
}