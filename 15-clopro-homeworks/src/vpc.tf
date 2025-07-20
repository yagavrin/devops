resource "yandex_vpc_network" "dev_vpc" {
  name = var.vpc_name
}

# resource "yandex_vpc_subnet" "public_subnet" {
#   name           = var.public_subnet.name
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.dev_vpc.id
#   v4_cidr_blocks = var.public_subnet.v4_cidr_blocks
# }

# resource "yandex_vpc_subnet" "private_subnet" {
#   name           = var.private_subnet.name
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.dev_vpc.id
#   v4_cidr_blocks = var.private_subnet.v4_cidr_blocks
#   # route_table_id = yandex_vpc_route_table.private-nat-route.id
# }

resource "yandex_vpc_subnet" "private_subnets" {
  for_each = { for idx, config in var.mysql_subnet_configs : idx => config }
  
  name           = "private-subnet-${each.value.name_suffix}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.dev_vpc.id
  v4_cidr_blocks = [each.value.cidr]
}

