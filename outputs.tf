output "network_id" {
  value       = hcloud_network.this.id
  sensitive   = false
  description = "Network ID"
}

output "subnet_ids" {
  value       = hcloud_network_subnet.this.*.id
  sensitive   = true
  description = "Network Subnet IDs"
}
