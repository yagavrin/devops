locals {
  db_vm_map = { for vm in var.each_db_vm : vm.vm_name => vm }
  vms_metadata = merge(var.basic_metadata, {
    ssh-keys = "ubuntu:${file("~/.ssh/test_yc.pub")}"
  })
  test_vpc = {
    "network_id" = "enp7i560tb28nageq0cc"
    "subnet_ids" = [
      "e9b0le401619ngf4h68n",
      "e2lbar6u8b2ftd7f5hia",
      "b0ca48coorjjq93u36pl",
      "fl8ner8rjsio6rcpcf0h",
    ]
    "subnet_zones" = [
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-c",
      "ru-central1-d",
    ]
  }
  upd_test_vpc = merge(local.test_vpc, {
    subnet_ids = concat(
      slice(local.test_vpc.subnet_ids, 0, 2), slice(local.test_vpc.subnet_ids, 3, length(local.test_vpc.subnet_ids))
    ),
    subnet_zones = concat(
      slice(local.test_vpc.subnet_zones, 0, 2), slice(local.test_vpc.subnet_zones, 3, length(local.test_vpc.subnet_zones))
    )
  })
  rc01_99 = [for i in range(1, 100) : i < 10 ? "rc0${i}" : "rc${i}"]
  filtred_rc01_99 = [for i in range(1, 100) : i < 10 ? "rc0${i}" : "rc${i}" if i == 19 ? true : can(regex(".*[^0789]$", i))]
}
