resource "yandex_compute_instance" "platform" {
  count = 2
  name        = "web-${count.index + 1}"
  platform_id = var.platform_id
  resources {
    cores         = var.count_loop_resources.cores
    memory        = var.count_loop_resources.memory
    core_fraction = var.count_loop_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.is_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.has_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.vms_metadata
}