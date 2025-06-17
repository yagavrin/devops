resource "yandex_vpc_network" "vpc_module" {
  name = var.env_name
}
resource "yandex_vpc_subnet" "vpc_module" {
  name           = "${var.env_name}_${each.key}"
  network_id     = yandex_vpc_network.vpc_module.id
  for_each       = { for index, subnet in var.subnets : index => subnet }
  zone           = each.value.zone
  v4_cidr_blocks = [each.value.cidr]
}