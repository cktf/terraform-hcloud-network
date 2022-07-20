resource "hcloud_network" "this" {
  name     = var.name
  ip_range = var.cidr
}

resource "hcloud_network_subnet" "this" {
  count = length(var.subnets)

  network_id   = hcloud_network.this.id
  network_zone = var.zone
  ip_range     = var.subnets[count.index]
  type         = "cloud"
}
