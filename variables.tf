variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Network Name"
}

variable "zone" {
  type        = string
  default     = "eu-central"
  sensitive   = false
  description = "Network Zone"
}

variable "cidr" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Network CIDR"
}

variable "subnets" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Network Subnets"
}
