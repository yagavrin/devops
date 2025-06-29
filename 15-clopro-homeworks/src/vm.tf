resource "yandex_compute_instance_group" "lamp_ig" {
  name               = var.instance_group.name
  folder_id          = var.folder_id
  service_account_id = yandex_iam_service_account.ig_sa.id
  deletion_protection = false

  instance_template {
    platform_id = var.instance_group.platform_id
    resources {
      memory = var.instance_group.memory
      cores  = var.instance_group.cores
      core_fraction = var.instance_group.core_fraction
    }

    boot_disk {
      initialize_params {
        image_id = var.instance_group.image_id
        size     = var.instance_group.disk_size
      }
    }

    network_interface {
      network_id = yandex_vpc_network.dev_vpc.id
      subnet_ids = [yandex_vpc_subnet.public_subnet.id]
      nat       = var.instance_group.has_nat
    }

    scheduling_policy {
      preemptible = var.instance_group.is_preemptible
    }

      metadata = {
      user-data = data.template_file.userdata.rendered
    }
  }

  scale_policy {
    fixed_scale {
      size = var.instance_group.size
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }


  application_load_balancer {
    target_group_name = var.alb_config.name
  }

  health_check {
    interval = 30
    timeout  = 10
    http_options {
      path = "/"
      port = 80
    }
  }
}

resource "yandex_iam_service_account" "ig_sa" {
  name        = "${var.instance_group.name}-sa"
  description = "Service account for LAMP instance group"
}

resource "yandex_resourcemanager_folder_iam_member" "ig_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.ig_sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "vpc_user" {
  folder_id = var.folder_id
  role      = "vpc.user"
  member    = "serviceAccount:${yandex_iam_service_account.ig_sa.id}"
}

data "template_file" "userdata" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    username       = var.vm_user
    ssh_public_key = file(var.ssh_pub_key_path)
    bucket_name  = var.bucket_config.name
    bucket_file_key = yandex_storage_object.image.key
  }
}