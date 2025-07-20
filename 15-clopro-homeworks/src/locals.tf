locals {
  vms_metadata = { ssh-keys = "${var.vm_user}:${file(var.ssh_pub_key_path)}" }
  vm_public_resources = merge(var.vm_resources, {
    name    = "vm_public"
    has_nat = true
  })
  vm_private_resources = merge(var.vm_resources, {
    name = "vm_private"
  })

  s3_sa_name = "${var.bucket_config.name}-sa"
  bucket_size_bytes = var.bucket_config.size_gb * 1024 * 1024 * 1024

  all_K8s_subnet_cidr_blocks = flatten([
    for subnet in values(yandex_vpc_subnet.private_subnets) : subnet.v4_cidr_blocks
  ])

  k8s_ng_subnet_ids = [
    for name, subnet in yandex_vpc_subnet.private_subnets : 
    subnet.id if subnet.zone == "ru-central1-d"
  ]
}