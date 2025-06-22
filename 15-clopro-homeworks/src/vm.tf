data "yandex_compute_image" "ubuntu" {
  family = var.vm_resources.image_name
}

resource "yandex_compute_instance" "vm-instance-public" {
  name                      = local.vm_public_resources.name
  platform_id               = local.vm_public_resources.platform_id
  allow_stopping_for_update = true

  resources {
    core_fraction = local.vm_public_resources.core_fraction
    cores         = local.vm_public_resources.cores
    memory        = local.vm_public_resources.memory
  }
  scheduling_policy {
    preemptible = local.vm_public_resources.is_preemptible

  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vm_public_resources.disk_size
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = true
  }

  metadata = local.vms_metadata
}

resource "yandex_compute_instance" "vm-instance-private" {
  name                      = local.vm_private_resources.name
  platform_id               = local.vm_private_resources.platform_id
  allow_stopping_for_update = true

  resources {
    core_fraction = local.vm_private_resources.core_fraction
    cores         = local.vm_private_resources.cores
    memory        = local.vm_private_resources.memory
  }
  scheduling_policy {
    preemptible = local.vm_private_resources.is_preemptible

  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vm_private_resources.disk_size
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    nat       = local.vm_private_resources.has_nat
  }

  metadata = local.vms_metadata
}