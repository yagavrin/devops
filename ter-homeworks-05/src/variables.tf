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
  default = "~/.ssh/nt_test.pub"

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


variable "single_ip" {
  type        = string
  description = "IP-адрес"
  default     = "192.168.0.1"

  # validation {
  #   condition     = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.single_ip))
  #   error_message = "Неверный формат IP-адреса. Должен быть валидный IPv4-адрес."
  # }

  # Альтернативная валидация с использованием cidrhost
  validation {
    condition     = can(cidrhost("${var.single_ip}/32", 0))
    error_message = "Неверный формат IP-адреса. Должен быть валидный IPv4-адрес."
  }
}

variable "ip_list" {
  type        = list(string)
  description = "Список IP-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ip_list : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Один или несколько IP-адресов в списке имеют неверный формат."
  }
}