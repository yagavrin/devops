resource "yandex_kubernetes_node_group" "k8s-demo-ng" {
  name        = var.k8s_ng_config.name
  cluster_id  = yandex_kubernetes_cluster.k8s-ha-three-zones.id
  version     = var.k8s_ng_config.version
  instance_template {
    name = "k8s-demo-ng-{instance.short_id}-{instance_group.id}"
    platform_id = var.k8s_ng_template.platform_id
    resources {
      cores         = var.k8s_ng_template.cores
      core_fraction = var.k8s_ng_template.core_fraction
      memory        = var.k8s_ng_template.memory
    }
    boot_disk {
      size = var.k8s_ng_template.disk_size
      type = var.k8s_ng_template.disk_type
    }
    network_acceleration_type = var.k8s_ng_template.network_acceleration_type
    network_interface {
      security_group_ids = [yandex_vpc_security_group.ha-k8s-sg.id]
      subnet_ids         = local.k8s_ng_subnet_ids
      nat                = var.k8s_ng_template.has_nat
    }
    scheduling_policy {
      preemptible = var.k8s_ng_template.is_preemptible
    }
  }
  allocation_policy {

    location {
        zone = var.default_zone
    }
  }
  scale_policy {
    auto_scale {
      min     = var.k8s_ng_config.auto_scale.min
      max     = var.k8s_ng_config.auto_scale.max
      initial = var.k8s_ng_config.auto_scale.initial
    }
  }
  deploy_policy {
    max_expansion   = var.k8s_ng_config.deploy_policy.max_expansion
    max_unavailable = var.k8s_ng_config.deploy_policy.max_unavailable
  }
  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true
    maintenance_window {
      start_time = "22:00"
      duration   = "10h"
    }
  }
  node_labels = {
    node-label1 = "node-value1"
  }
  labels = {
    "template-label1" = "template-value1"
  }
  allowed_unsafe_sysctls = ["kernel.msg*", "net.core.somaxconn"]
}
