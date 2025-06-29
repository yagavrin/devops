# resource "yandex_compute_instance" "nat-instance" {
#   name        = var.nat_resources.name
#   platform_id = var.nat_resources.platform_id
#   zone        = var.nat_resources.zone

#   resources {
#     core_fraction = var.nat_resources.core_fraction
#     cores         = var.nat_resources.cores
#     memory        = var.nat_resources.memory
#   }
#   scheduling_policy {
#     preemptible = var.nat_resources.is_preemptible
#   }
#   boot_disk {
#     initialize_params {
#       image_id = var.nat_resources.image_id
#       size     = var.nat_resources.disk_size
#     }
#   }

#   network_interface {
#     subnet_id  = yandex_vpc_subnet.public_subnet.id
#     nat        = true
#     ip_address = var.nat_resources.ip_address
#   }

#   metadata = local.vms_metadata
# }

# resource "yandex_vpc_route_table" "private-nat-route" {
#   name       = "private-to-nat-rt"
#   network_id = yandex_vpc_network.dev_vpc.id

#   static_route {
#     destination_prefix = "0.0.0.0/0"
#     next_hop_address   = yandex_compute_instance.nat-instance.network_interface.0.ip_address
#   }
# }