resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.os_image_name
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.remote_module_resources.marketing.instance_name
  instance_count = var.remote_module_resources.marketing.instance_count
  image_family   = var.os_image_name
  public_ip      = var.has_nat

  labels = var.remote_module_resources.marketing.labels

  metadata = {
    user-data = data.template_file.userdata.rendered
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.remote_module_resources.analytics.instance_name
  instance_count = var.remote_module_resources.analytics.instance_count
  image_family   = var.os_image_name
  public_ip      = var.has_nat

  labels = var.remote_module_resources.analytics.labels

  metadata = {
    user-data = data.template_file.userdata.rendered
  }
}

data "template_file" "userdata" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    username       = var.vm_user
    ssh_public_key = file(var.ssh_pub_key_path)
    packages       = jsonencode(var.vm_packages)
  }
}
