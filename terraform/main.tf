data "yandex_compute_image" "base_image" {
  family = var.yc_image_family
}

resource "yandex_compute_instance" "example-cluster-k8s" {
  count       = var.cluster_size
  name        = "node-example-${count.index}"
  hostname    = "node-example-${count.index}"
  zone        = element(var.subnet-zones, count.index)
  platform_id = "standard-v3"
  allow_stopping_for_update = true
 
  scheduling_policy {
  preemptible = true
  }
 
  resources {
    cores  = var.instance_cores
    memory = var.instance_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.base_image.id
      type     = "network-hdd"
      size     = "20"
    }
  }

  network_interface {
    subnet_id = element(local.subnet_ids, count.index)
    nat       = true
  }

  metadata = {
    ssh-keys  = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  labels = {
    node_id = count.index
  }
}

locals {
  external_ips = [yandex_compute_instance.example-cluster-k8s.*.network_interface.0.nat_ip_address]
  hostnames    = [yandex_compute_instance.example-cluster-k8s.*.hostname]
}
