
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "vpc" {
  source = "../modules/vpc"
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  private_key     = var.private_key
  app_disk_image  = var.app_disk_image
  db_url          = module.db.external_ip_address_db
  subnet_id       = module.vpc.app_subnet_id
  ssh_user        = var.ssh_user
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  private_key     = var.private_key
  db_disk_image   = var.db_disk_image
  subnet_id       = module.vpc.app_subnet_id
  ssh_user        = var.ssh_user
}
