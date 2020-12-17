variable "enabled" {
  type    = bool
  default = true
}

variable "dns_zone" {
  description = "Name of the kops DNS zone - it usually set up by galaxy as TF_VAR_dns_zone"
  type        = string
}
