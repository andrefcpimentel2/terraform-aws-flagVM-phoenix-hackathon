################################################################################
# Networking VARS
################################################################################

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID for Bastion creation"
}

variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID for Flag VM creation"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Private subnet ID for Flag VM creation"
}

################################################################################
# Compute VARS
################################################################################


variable "type" {
  type        = string
  default     = "t3.micro"
  description = "Machine T-shirt size"
}

variable "tags" {
  type        = map(string)
  description = "Tags map for bastion"
  default     = {}
}

variable "key_name" {
  type        = string
  description = "SSH key name"
}

variable "flag_ami" {
  type        = string
  description = "AMI for flag server"
}