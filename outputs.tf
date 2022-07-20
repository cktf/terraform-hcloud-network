output "network_id" {
  value       = hcloud_network.this.id
  sensitive   = false
  description = "Network ID"
}

output "subnet_ids" {
  value       = { for idx, val in var.subnets : val => hcloud_network_subnet.this[idx].id }
  sensitive   = true
  description = "Network Subnet IDs"
}
