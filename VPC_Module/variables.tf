variable "aws_region" {
  default = ""
}

variable "vpc_cidr_block" {
  default = ""
}

variable "enable_dns_support" {
  default = ""
}

variable "enable_dns_hostnames" {
  default = ""
}

variable "az" {
  default = ""
}

variable "remote_state_bucket_region" {
  default = ""
}

variable "vpc_state_bucket" {
  default = ""
}

variable "vpc_state_key" {
  default = ""
}


################### TAGS ################
variable "Name" {
  default = ""
}

variable "app" {
  default = ""
}

variable "app_owner" {
  default = ""
}

variable "contact" {
  default = ""
}

variable "cost_center" {
  default = ""
}

variable "creator" {
  default = ""
}

variable "customer" {
  default = ""
}

variable "environment" {
  default = ""
}