variable "name" {
  description = "Name of Security group ( required)"
}
variable "create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}
variable "sg_description" {
  default     = ""
  description = "Description for security group (optional)"
}
variable "vpc_id" {
  default     = ""
  description = "Vpc id"
}
variable "revoke" {
  default = false
}
variable "tags" {
  description = "tags to assign to security group"
  type        = map(string)
  default     = {}
}



variable "ingress_rules" {
  type    = list(map(string))
  default = []
}


variable "egress_rules" {
  type    = list(map(string))
  default = []
}

