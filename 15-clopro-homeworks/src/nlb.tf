# resource "yandex_lb_target_group" "lamp_target_group" {
#   name      = "lamp-target-group"

#   dynamic "target" {
#     for_each = yandex_compute_instance_group.lamp_ig.instances
#     content {
#       subnet_id = yandex_vpc_subnet.public_subnet.id
#       address   = target.value.network_interface[0].ip_address
#     }
#   }
# }

# resource "yandex_lb_network_load_balancer" "lamp_nlb" {
#   name = "lamp-network-load-balancer"

#   listener {
#     name = "http-listener"
#     port = 80
#     external_address_spec {
#       ip_version = "ipv4"
#     }
#   }

#   attached_target_group {
#     target_group_id = yandex_lb_target_group.lamp_target_group.id

#     healthcheck {
#       name = "http-healthcheck"
#       http_options {
#         port = 80
#         path = "/"
#       }
#     }
#   }
# }