resource "hcloud_firewall" "this" {
  for_each = var.firewalls

  name   = coalesce(each.value.name, "${var.name}-${each.key}")
  labels = each.value.labels

  rule {
    port        = "22"
    protocol    = "tcp"
    direction   = "in"
    source_ips  = ["0.0.0.0/0", "::/0"]
    description = "SSH Inbound Traffic"
  }

  dynamic "rule" {
    for_each = each.value.inbounds

    content {
      port        = length(split(":", rule.key)) > 1 ? split(":", rule.key)[0] : null
      protocol    = length(split(":", rule.key)) > 1 ? split(":", rule.key)[1] : split(":", rule.key)[0]
      direction   = "in"
      description = rule.value.description
      source_ips  = rule.value.source_ips
    }
  }

  dynamic "rule" {
    for_each = each.value.outbounds

    content {
      port            = length(split(":", rule.key)) > 1 ? split(":", rule.key)[0] : null
      protocol        = length(split(":", rule.key)) > 1 ? split(":", rule.key)[1] : split(":", rule.key)[0]
      direction       = "out"
      description     = rule.value.description
      destination_ips = rule.value.destination_ips
    }
  }

  dynamic "apply_to" {
    for_each = { for target in each.value.targets : target => target }

    content {
      label_selector = apply_to.value
    }
  }
}
