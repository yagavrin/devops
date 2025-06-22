locals {
  vms_metadata = { ssh-keys = "${var.vm_user}:${file(var.ssh_pub_key_path)}" }
  vm_public_resources = merge(var.vm_resources, {
    name    = "vm_public"
    has_nat = true
  })
  vm_private_resources = merge(var.vm_resources, {
    name = "vm_private"
  })
}