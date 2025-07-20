resource "yandex_lb_target_group" "mysql_target_group" {
  name      = "${var.mysql_cluster_config.name}-target-group"

  dynamic "target" {
    for_each = yandex_mdb_mysql_cluster.netology_mysql.host
    content {
      subnet_id  = target.value.subnet_id
      address    = target.value.fqdn 
    }
  }
}

resource "yandex_lb_network_load_balancer" "mysql_nlb" {
  name = "${var.mysql_cluster_config.name}-nlb"

  listener {
    name = "mysql-listener"
    port = 3306
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.mysql_target_group.id

    healthcheck {
      name = "mysql-healthcheck"
      tcp_options {
        port = 3306
      }
      interval            = 10
      timeout             = 5
      unhealthy_threshold = 3
      healthy_threshold   = 3
    }
  }
}