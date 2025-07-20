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

output "netology_db_secrets" {
  value = {
    user = data.yandex_lockbox_secret_version.db_user_v1.entries[0].text_value
    password = data.yandex_lockbox_secret_version.db_password_v1.entries[0].text_value
  }
}

output "mysql_cluster_fqdn" {
  value = yandex_mdb_mysql_cluster.netology_mysql.host[0].fqdn
}

output "k8s_cluster_public_ip" {
  value = yandex_kubernetes_cluster.k8s-ha-three-zones.master[0].external_v4_address
}