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

variable "labels" {
  type        = map(string)
  default     = {}
  sensitive   = false
  description = "Network Labels"
}

variable "protection" {
  type        = bool
  default     = false
  sensitive   = false
  description = "Network Protection"
}

variable "expose_vswitch" {
  type        = bool
  default     = null
  sensitive   = false
  description = "Network Expose VSwitch"
}

variable "subnets" {
  type = map(object({
    type    = string
    cidr    = string
    vswitch = optional(number)
  }))
  default     = {}
  sensitive   = false
  description = "Network Subnets"
}

variable "routes" {
  type = map(object({
    destination = string
    gateway     = string
  }))
  default     = {}
  sensitive   = false
  description = "Network Routes"
}
