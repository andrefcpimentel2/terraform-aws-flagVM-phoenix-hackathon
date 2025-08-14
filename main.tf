################################################################################
# Data sources
################################################################################

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] ## Canonical's AWS account ID
}

################################################################################
# Bastion Server
################################################################################


resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  monitoring                  = true
  associate_public_ip_address = true
  root_block_device {
    volume_size = 30
  }
  tags = {
    Name = "Bastion"
  }
}


################################################################################
# second layer phoenix image
################################################################################

resource "aws_instance" "flag" {
  ami                         = var.flag_ami
  instance_type               = var.type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  monitoring                  = true
  associate_public_ip_address = false
  root_block_device {
    volume_size = 30
  }
  tags = {
    Name = "Flag"
  }
}