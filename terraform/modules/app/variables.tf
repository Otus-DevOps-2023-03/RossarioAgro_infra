variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
variable "private_key" {
  description = "Path to the public key used for ssh access"
}
variable "ssh_user" {
  description = "User name for SSH connection"
  #default     = "ubuntu"
}
variable "db_url" {
  description = "Database IP address"
}
