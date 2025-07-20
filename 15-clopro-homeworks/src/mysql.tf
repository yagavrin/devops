resource "yandex_mdb_mysql_cluster" "netology_mysql" {
  name                = var.mysql_cluster_config.name
  environment         = var.mysql_cluster_config.environment
  network_id          = yandex_vpc_network.dev_vpc.id
  version             = var.mysql_cluster_config.version
  deletion_protection = var.mysql_cluster_config.deletion_protection

  resources {
    resource_preset_id = var.mysql_cluster_config.resource_preset_id
    disk_type_id       = var.mysql_cluster_config.disk_type_id
    disk_size          = var.mysql_cluster_config.disk_size
  }

  maintenance_window {
    type = var.mysql_cluster_config.maintenance_window
  }

  backup_window_start {
    hours   = var.mysql_cluster_config.backup_window_start_h
    minutes = var.mysql_cluster_config.backup_window_start_m
  }

  dynamic "host" {
    for_each = yandex_vpc_subnet.private_subnets
    content {
      zone      = host.value.zone
      subnet_id = host.value.id
    }
  }
}

resource "yandex_mdb_mysql_database" "netology_db" {
  cluster_id = yandex_mdb_mysql_cluster.netology_mysql.id
  name       = var.database_config.db_name
}

resource "yandex_mdb_mysql_user" "lockbox_user" {
  cluster_id = yandex_mdb_mysql_cluster.netology_mysql.id
  name       = data.yandex_lockbox_secret_version.db_user_v1.entries[0].text_value
  password   = data.yandex_lockbox_secret_version.db_password_v1.entries[0].text_value

  permission {
    database_name = yandex_mdb_mysql_database.netology_db.name
    roles        = ["ALL"]
  }
}


# Создание генерируемого секрета
resource "yandex_lockbox_secret" "db_user" {
  name = "netology-db-user"

  password_payload_specification {
    password_key        = "netology-db-user"
    length              = 18
    include_uppercase   = true
    include_lowercase   = true
    include_digits      = true
    include_punctuation = false
  }
}

# Создание версии секрета
resource "yandex_lockbox_secret_version" "db_user_v1" {
  secret_id = yandex_lockbox_secret.db_user.id
}

data "yandex_lockbox_secret_version" "db_user_v1" {
  secret_id = yandex_lockbox_secret.db_user.id
  version_id = yandex_lockbox_secret_version.db_user_v1.id
}

resource "yandex_lockbox_secret" "db_password" {
  name = "netology-db-password"

  password_payload_specification {
    password_key        = "netology-db-password"
    length              = 18
    include_uppercase   = true
    include_lowercase   = true
    include_digits      = true
    include_punctuation = false
  }
}

# Создание версии секрета
resource "yandex_lockbox_secret_version" "db_password_v1" {
  secret_id = yandex_lockbox_secret.db_password.id
}

data "yandex_lockbox_secret_version" "db_password_v1" {
  secret_id = yandex_lockbox_secret.db_password.id
  version_id = yandex_lockbox_secret_version.db_password_v1.id
}

resource "yandex_iam_service_account" "lockbox_sa" {
  name        = "${var.mysql_cluster_config.name}-sa"
  description = "Service account for mysql lockbox access"
}

resource "yandex_lockbox_secret_iam_member" "user-secret-viewer" {
  secret_id = yandex_lockbox_secret.db_password.id
  role      = "lockbox.payloadViewer"
  member   = "serviceAccount:${yandex_iam_service_account.lockbox_sa.id}"
}

resource "yandex_lockbox_secret_iam_member" "pass-secret-viewer" {
  secret_id = yandex_lockbox_secret.db_user.id
  role      = "lockbox.payloadViewer"
  member   = "serviceAccount:${yandex_iam_service_account.lockbox_sa.id}"
}