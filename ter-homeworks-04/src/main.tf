data "yandex_compute_image" "ubuntu" {
  family = var.os_image_name
}

module "vpc_prod" {
  source   = "./vpc"
  env_name = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}

module "vpc_dev" {
  source   = "./vpc"
  env_name = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_ids_map["ru-central1-a"]]
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
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_ids_map["ru-central1-a"]]
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
