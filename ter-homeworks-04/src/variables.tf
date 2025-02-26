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

variable "vm_resources" {
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

variable "vm_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_pub_key_path" {
  type    = string
  default = "~/.ssh/test_yc.pub"
}

variable "remote_module_resources" {
  type = map(object({
    instance_name  = string
    instance_count = number
    labels = object({
      owner   = string
      project = string
    })
  }))
  default = {
    marketing = {
      instance_name  = "marketing-vm"
      instance_count = 1
      labels = {
        owner   = "p.petrov",
        project = "marketing"
      }
    },
    analytics = {
      instance_name  = "analytics-vm"
      instance_count = 1
      labels = {
        owner   = "i.ivanov"
        project = "analytics"
      }
    }
  }
}

variable "vm_packages" {
  type    = list(string)
  default = ["vim", "nginx"]
}
