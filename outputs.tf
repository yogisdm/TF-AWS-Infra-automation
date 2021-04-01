output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_creation
}

output "subnets" {
  description = "Subnets created with CIDR blocks"
  value = module.subnet_creation

}