output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.windows[*].id
}

output "public_ips" {
  description = "Public IPs of the created EC2 instances"
  value       = aws_instance.windows[*].public_ip
}