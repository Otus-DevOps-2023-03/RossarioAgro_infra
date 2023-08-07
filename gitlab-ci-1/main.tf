provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "gitlab_ci" {
  count = var.inst_count
  name  = "gitlab-ci-${count.index + 1}"
  zone  = var.zone
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 8
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 50
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }


  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }
}

resource "local_file" "hosts_inventory" {
  content = templatefile("${path.module}/ansible_inventory.tpl",
    {
      reddit_servers = yandex_compute_instance.gitlab_ci[*].network_interface.0.nat_ip_address
    }
  )
  filename = "./inventory"
}
