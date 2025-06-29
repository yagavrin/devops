resource "yandex_storage_bucket" "s3_bucket" {
  bucket     = var.bucket_config.name
  access_key = yandex_iam_service_account_static_access_key.sa_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_key.secret_key

  max_size = local.bucket_size_bytes

  default_storage_class = var.bucket_config.storage_class
  # acl    = var.bucket_config.acl
}

# Создание сервисного аккаунта
resource "yandex_iam_service_account" "sa" {
  name        = local.s3_sa_name
  description = var.service_account.description
}

# Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa_key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for S3 bucket ${var.bucket_config.name}"
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.s3_bucket.bucket
  key    = basename(var.path_to_s3_image) 
  source = var.path_to_s3_image
  acl    = "public-read"
  content_type = "image/jpeg"
}