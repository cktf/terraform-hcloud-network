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

variable "protection" {
  type        = bool
  default     = false
  sensitive   = false
  description = "Network Protection"
}

variable "labels" {
  type        = map(string)
  default     = {}
  sensitive   = false
  description = "Network Labels"
}

variable "subnets" {
  type = list(object({
    type = string
    cidr = string
  }))
  default     = {}
  sensitive   = false
  description = "Network Subnets"
}

variable "routes" {
  type = list(object({
    destination = string
    gateway     = string
  }))
  default     = {}
  sensitive   = false
  description = "Network Routes"
}
