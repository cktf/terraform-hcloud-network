resource "hcloud_network" "this" {
  name     = var.name
  ip_range = var.cidr
}

resource "hcloud_network_subnet" "this" {
  for_each = { for idx, val in var.subnets : idx => val }

  network_id   = hcloud_network.this.id
  network_zone = var.zone
  ip_range     = each.value
  type         = "cloud"
}
