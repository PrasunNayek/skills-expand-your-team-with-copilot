output "app_subnets" {
  description = "App (private/internal) subnet CIDR ranges."
  value       = local.app_subnets
}

output "db_subnets" {
  description = "Database subnet CIDR ranges."
  value       = local.db_subnets
}

output "eks_cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "eks_node_group_name" {
  description = "Managed node group name."
  value       = keys(module.eks.eks_managed_node_groups)[0]
}

output "public_subnets" {
  description = "Public subnet CIDR ranges."
  value       = local.public_subnets
}

output "vpc_cidr" {
  description = "VPC CIDR range."
  value       = var.vpc_cidr
}

output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}
