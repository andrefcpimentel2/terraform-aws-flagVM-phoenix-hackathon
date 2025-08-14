output "bastion-public_ip" {
  value       = aws_instance.bastion[*].public_ip
  description = "AWS Instance: AWS Instance public IP"
}

output "bastion-private_ip" {
  value       = aws_instance.bastion[*].private_ip
  description = "AWS Instance: AWS Instance private IP"
}

output "flag-private_ip" {
  value       = aws_instance.flag[*].private_ip
  description = "AWS Instance: AWS Instance private IP"
}