variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Network Name"
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
