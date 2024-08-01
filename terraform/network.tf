resource "yandex_vpc_network" "example_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "example_subnet_different_zones" {
  count          = 3
  name           = "subnet-example-${var.subnet-zones[count.index]}"
  zone           = "${var.subnet-zones[count.index]}"
  network_id     = yandex_vpc_network.example_network.id
  v4_cidr_blocks = [ "${var.cidr.stage[count.index]}" ]
}

locals {
  subnet_ids = yandex_vpc_subnet.example_subnet_different_zones.*.id
}
