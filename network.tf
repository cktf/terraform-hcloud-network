resource "hcloud_network" "this" {
  name                     = var.name
  ip_range                 = var.cidr
  labels                   = var.labels
  delete_protection        = var.protection
  expose_routes_to_vswitch = var.expose_vswitch
}

resource "hcloud_network_subnet" "this" {
  for_each = var.subnets

  network_zone = var.zone
  network_id   = hcloud_network.this.id
  type         = each.value.type
  ip_range     = each.value.cidr
  vswitch_id   = each.value.vswitch
}

resource "hcloud_network_route" "this" {
  for_each = var.routes

  network_id  = hcloud_network.this.id
  destination = each.value.destination
  gateway     = each.value.gateway
}
