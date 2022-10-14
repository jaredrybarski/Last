output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.ec2_instances[*].public_ip
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.ssh_security_group.security_group_id
}

output "vpc_id" {
  description = "vpc_id"
  value       = module.vpc.vpc_id
}