output "external_ip_address_gitlab_ci" {
  value = [
    for inst in yandex_compute_instance.gitlab_ci :
    "IP of ${inst.name} is ${inst.network_interface.0.nat_ip_address}"
  ]
}
