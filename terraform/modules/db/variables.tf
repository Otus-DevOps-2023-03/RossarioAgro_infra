variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
variable "ssh_user" {
  description = "User name for SSH connection"
  default     = "ubuntu"
}

variable "private_key" {
  description = "Path to the public key used for ssh access"
}