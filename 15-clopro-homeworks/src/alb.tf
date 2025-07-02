# resource "yandex_alb_http_router" "router" {
#   count = var.alb_config.http_router_count
#   name  = "${var.alb_config.name}-http-router"
# }

# resource "yandex_alb_virtual_host" "lamp-vhost" {
#   name           = "${var.alb_config.name}-virtual-host"
#   http_router_id = yandex_alb_http_router.router[0].id
#   route {
#     name = "${var.alb_config.name}-route"
#     http_route {
#       http_route_action {
#         backend_group_id = yandex_alb_backend_group.ig_backend_group.id
#       }
#     }
#   }
# }

# resource "yandex_alb_backend_group" "ig_backend_group" {
#   name = "${var.alb_config.name}-backend-group"

#   http_backend {
#     name             = "${var.alb_config.name}-backend"
#     port             = 80
#     target_group_ids = [yandex_compute_instance_group.lamp_ig.application_load_balancer.0.target_group_id]
#     healthcheck {
#       timeout          = "10s"
#       interval         = "2s"
#       healthcheck_port = 80
#       http_healthcheck {
#         path = "/"
#       }
#     }
#   }
# }

# resource "yandex_alb_load_balancer" "lamp_alb" {
#   name        = var.alb_config.name
#   network_id  = yandex_vpc_network.dev_vpc.id

#   allocation_policy {
#     location {
#       zone_id   = var.default_zone
#       subnet_id = yandex_vpc_subnet.public_subnet.id
#     }
#   }

#   listener {
#     name = "http-listener"
#     endpoint {
#       address {
#         external_ipv4_address {
#         }
#       }
#       ports = [80]
#     }
#     http {
#       handler {
#         http_router_id = yandex_alb_http_router.router[0].id
#       }
#     }
#   }
# }