# resource "yandex_storage_bucket" "hoster_s3_bucket" {
#   bucket     = var.hoster_bucket_config.name
#   access_key = yandex_iam_service_account_static_access_key.hsa_key.access_key
#   secret_key = yandex_iam_service_account_static_access_key.hsa_key.secret_key

#   max_size = local.bucket_size_bytes

#   https {
#     certificate_id = "fpqeer9f487c93drrr75"
#   }

#   website {
#     index_document = "index.html"
#   }
# }

# # Создание сервисного аккаунта
# resource "yandex_iam_service_account" "hsa" {
#   name        = "hosting"
#   description = var.service_account.description
# }

# # Назначение роли сервисному аккаунту
# resource "yandex_resourcemanager_folder_iam_member" "h_sa_editor" {
#   folder_id = var.folder_id
#   role      = "storage.editor"
#   member    = "serviceAccount:${yandex_iam_service_account.hsa.id}"
# }

# # Создание статического ключа доступа
# resource "yandex_iam_service_account_static_access_key" "hsa_key" {
#   service_account_id = yandex_iam_service_account.hsa.id
#   description        = "Static access key for S3 bucket ${var.hoster_bucket_config.name}"
# }

# resource "yandex_storage_object" "host_image" {
#   bucket = yandex_storage_bucket.hoster_s3_bucket.bucket
#   key    = basename(var.path_to_s3_image) 
#   source = var.path_to_s3_image
#   acl    = "public-read"
#   content_type = "image/jpeg"
# }