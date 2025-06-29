# Provider config

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
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# user config

variable "vms_metadata" {
  type = map(string)
  default = {
    ssh-keys = "ubuntu:ssh-ed25519 AAAAC..."
  }
}
variable "vm_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_pub_key_path" {
  type    = string
  default = "~/.ssh/nt_test.pub"
}

# VPC config

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network name"
}

variable "public_subnet" {
  type = object({
    name           = string
    v4_cidr_blocks = list(string)
  })
  default = {
    name           = "public"
    v4_cidr_blocks = ["192.168.10.0/24"]
  }
}

variable "private_subnet" {
  type = object({
    name           = string
    v4_cidr_blocks = list(string)
  })
  default = {
    name           = "private"
    v4_cidr_blocks = ["192.168.20.0/24"]
  }
}

# NAT

variable "nat_resources" {
  type = object({
    name           = string
    cores          = number
    memory         = number
    core_fraction  = number
    platform_id    = string
    image_id       = string
    zone           = string
    is_preemptible = bool
    ip_address     = string
    disk_size      = number
  })
  default = {
    name           = "nat-instance"
    cores          = 2
    memory         = 2
    core_fraction  = 20
    platform_id    = "standard-v2"
    image_id       = "fd80mrhj8fl2oe87o4e1"
    zone           = "ru-central1-d"
    is_preemptible = true
    ip_address     = "192.168.10.254"
    disk_size      = 10
  }
}

# VM

variable "vm_resources" {
  type = object({
    name           = string
    cores          = number
    memory         = number
    core_fraction  = number
    platform_id    = string
    image_name     = string
    is_preemptible = bool
    has_nat        = bool
    disk_size      = number
  })
  default = {
    name           = "vm-instance"
    cores          = 2
    memory         = 2
    core_fraction  = 20
    platform_id    = "standard-v2"
    image_name     = "ubuntu-2204-lts"
    is_preemptible = true
    has_nat        = false
    disk_size      = 10
  }
}

# S3

variable "bucket_config" {
  type = object({
    name          = string
    size_gb       = number
    storage_class = string
    acl           = string
  })
  default = {
    name          = "yagavrin-23-06"
    size_gb       = 1
    storage_class = "STANDARD"
    acl           = "public-read"
  }
  description = "S3 bucket configuration"
}

variable "service_account" {
  type = object({
    name        = string
    description = string
  })
  default = {
    name        = "s3_sa"
    description = "Service account for S3 bucket"
  }
  description = "Service account configuration for the bucket"
}

variable "path_to_s3_image" {
  type = string
  default = "./cat-in-hat.jpeg"
}

# Instance Group

variable "instance_group" {
  type = object({
    name        = string
    size        = number
    image_id    = string
    platform_id = string
    memory      = number
    cores       = number
    core_fraction = number
    is_preemptible = bool
    has_nat        = bool
    disk_size   = number
  })

  default = {
    name        = "lamp-ig"
    size        = 3
    image_id    = "fd827b91d99psvq5fjit"
    platform_id = "standard-v2"
    memory      = 2
    cores       = 2
    core_fraction = 20
    is_preemptible = true
    has_nat        = true
    disk_size   = 10
  }
}

# ALB

variable "alb_config" {
  type = object({
    name        = string
    domain      = optional(string, null)
    http_router_count = number
  })
  default = {
    name = "lamp-alb"
    http_router_count = 1
  }
}
