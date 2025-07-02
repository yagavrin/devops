# output "public_url" {
#   value = "https://${yandex_storage_bucket.s3_bucket.bucket}.storage.yandexcloud.net/${yandex_storage_object.image.key}"
# }

# output "instance_public_ips" {
#   value = [
#     for instance in yandex_compute_instance_group.lamp_ig.instances :
#       instance.network_interface[0].nat_ip_address
#   ]
# }

# output "load_balancer_ip" {
#   value = one([
#     for listener in yandex_lb_network_load_balancer.lamp_nlb.listener :
#     one(listener.external_address_spec[*].address)
#   ])
# }

# output "alb_public_ip" {
#   value = try(
#     one(yandex_alb_load_balancer.lamp_alb.listener[*].endpoint[*].address[*].external_ipv4_address[*].address),
#     "ALB IP not available"
#   )
# }