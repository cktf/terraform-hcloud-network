resource "hcloud_network" "this" {
  name              = var.name
  ip_range          = var.cidr
  delete_protection = var.protection
  labels            = var.labels
}

resource "hcloud_network_subnet" "this" {
  for_each = var.subnets

  network_id   = hcloud_network.this.id
  network_zone = var.zone
  type         = each.value.type
  ip_range     = each.value.cidr
}

resource "hcloud_network_route" "this" {
  for_each = var.routes

  network_id  = hcloud_network.this.id
  destination = each.value.destination
  gateway     = each.value.gateway
}
