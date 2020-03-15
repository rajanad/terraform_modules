variable "aws_region" {
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

variable "count" {
  default = ""
}

variable "az" {
  default = ""
}

variable "map_public_ip_on_launch" {
  default = ""
}

variable "pub_subnet_cidr" {
  default = "10.0.1.0/24,10.0.2.0/24"
}

variable "priv_subnet_cidr" {
  default = "10.0.3.0/24,10.0.4.0/24"
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