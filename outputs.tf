output "id" {
  value       = hcloud_network.this.id
  sensitive   = false
  description = "Network ID"
}

output "subnet" {
  value       = { for key, val in var.subnets : key => hcloud_network_subnet.this[key].id }
  sensitive   = false
  description = "Network Subnet"
}
