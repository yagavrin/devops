terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tfstate-devq43hy"
    region = "ru-central1"
    key = "terraform.tfstate"

    skip_region_validation = true
    skip_credentials_validation = true


    skip_requesting_account_id = true
    skip_s3_checksum = true
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gdos7jlt0pmtkcfhf6/etn0jfpr2919soegfara"
    dynamodb_table = "tfstate-dev"
  }
}

provider "yandex" {
  # https://yandex.cloud/ru/docs/iam/concepts/authorization/oauth-token
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}