terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=1.8.4"
}

provider "docker" {
  host = "ssh://${var.remote_docker_host}"
}

resource "random_password" "random_root_pswd" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "random_user_pswd" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql_db"

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.random_root_pswd.result}",
    "MYSQL_DATABASE=test_db",
    "MYSQL_USER=test_user",
    "MYSQL_PASSWORD=${random_password.random_root_pswd.result}",
    "MYSQL_ROOT_HOST=%"
  ]

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }
}

