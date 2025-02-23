###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "count_loop_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
}

variable "os_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image name"
}

variable "platform_id" {
  type        = string
  default     = "standard-v2"
  description = "https://yandex.cloud/ru/docs/compute/concepts/vm-platforms"
}

variable "is_preemptible" {
  type        = bool
  default     = true
  description = "https://yandex.cloud/ru/docs/compute/concepts/preemptible-vm"
}

variable "has_nat" {
  type        = bool
  default     = true
  description = "Define NAT on VM"
}

variable "each_db_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number }))
  default = [
    {
      vm_name       = "main",
      cpu           = 2,
      ram           = 2,
      disk_volume   = 10,     
      core_fraction = 20
    },
    {
      vm_name       = "replica",
      cpu           = 2,
      ram           = 1,
      disk_volume   = 9,
      core_fraction = 5
    },
  ]
}

variable "basic_metadata" {
  type = map(string)
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
  }
}

variable "storage_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
}