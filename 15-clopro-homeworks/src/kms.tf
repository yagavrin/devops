# resource "yandex_kms_symmetric_key" "kms-key" {
#   name              = var.s3_kms_key.name
#   description       = var.s3_kms_key.description
#   default_algorithm = var.s3_kms_key.default_algorithm
#   rotation_period   = var.s3_kms_key.rotation_period
# }