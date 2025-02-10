###cloud vars

variable "project" {
  type        = string
  default     = "netology"
}

variable "env" {
  type        = string
  default     = "develop"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

# variable "default_zone" {
#   type        = string
#   default     = "ru-central1-a"
#   description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
# }
variable "central1_b_zone" {
  type        = string
  default     = "ru-central1-b"
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
  description = "VPC network & subnet name"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "vms_metadata" {
  type = map(string)
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
  }
}

### web vars
variable "vm_web_os_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image name"
}

# variable "vm_web_instance_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "VM name"
# }

variable "vm_web_yc_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "https://yandex.cloud/ru/docs/compute/concepts/vm-platforms"
}

# variable "vm_web_core_count" {
#   type        = number
#   default     = 2
#   description = "CPU core count"
# }

# variable "vm_web_ram_amount" {
#   type        = number
#   default     = 1
#   description = "RAM amount in GB"
# }

# variable "vm_web_cpu_core_fraction" {
#   type        = number
#   default     = 20
#   description = "https://yandex.cloud/ru/docs/compute/concepts/performance-levels"
# }

variable "vm_web_is_preemptible" {
  type        = bool
  default     = true
  description = "https://yandex.cloud/ru/docs/compute/concepts/preemptible-vm"
}

variable "vm_web_has_nat" {
  type        = bool
  default     = false
  description = "Define NAT on VM"
}

# variable "vm_web_enable_serial_console" {
#   type        = number
#   default     = 1
#   description = "https://yandex.cloud/ru/docs/compute/operations/serial-console/"
# }

### platform_db vars
variable "vm_db_os_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image name"
}

# variable "vm_db_instance_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
#   description = "VM name"
# }

variable "vm_db_yc_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "https://yandex.cloud/ru/docs/compute/concepts/vm-platforms"
}

# variable "vm_db_core_count" {
#   type        = number
#   default     = 2
#   description = "CPU core count"
# }

# variable "vm_db_ram_amount" {
#   type        = number
#   default     = 2
#   description = "RAM amount in GB"
# }

# variable "vm_db_cpu_core_fraction" {
#   type        = number
#   default     = 20
#   description = "https://yandex.cloud/ru/docs/compute/concepts/performance-levels"
# }

variable "vm_db_is_preemptible" {
  type        = bool
  default     = true
  description = "https://yandex.cloud/ru/docs/compute/concepts/preemptible-vm"
}

variable "vm_db_has_nat" {
  type        = bool
  default     = false
  description = "Define NAT on VM"
}

# variable "vm_db_enable_serial_console" {
#   type        = number
#   default     = 1
#   description = "https://yandex.cloud/ru/docs/compute/operations/serial-console/"
# }

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}
variable "vm_db_subnet_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars

# variable "vms_ssh_username" {
#   type        = string
#   default     = "ubuntu"
#   description = "Username for the SSH connection"
# }

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "<your_ssh_ed25519_key>"
#   description = "ssh-keygen -t ed25519"
# }

variable "test" {
  type = map(list(string))

  default = {
    dev1 = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
    dev2 = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
    prod1 = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  }
}