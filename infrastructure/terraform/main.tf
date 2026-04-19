locals {
  app_subnets = [
    for index in range(length(var.azs)) :
    cidrsubnet(var.vpc_cidr, 4, index + 3)
  ]

  db_subnets = [
    for index in range(length(var.azs)) :
    cidrsubnet(var.vpc_cidr, 4, index + 6)
  ]

  public_subnets = [
    for index in range(length(var.azs)) :
    cidrsubnet(var.vpc_cidr, 4, index)
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = "${var.name}-vpc"
  cidr = var.vpc_cidr
  azs  = var.azs

  private_subnets  = local.app_subnets
  public_subnets   = local.public_subnets
  database_subnets = local.db_subnets

  create_database_subnet_group = true
  enable_dns_hostnames         = true
  enable_dns_support           = true

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.1"

  cluster_name    = "${var.name}-eks"
  cluster_version = var.eks_cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = slice(module.vpc.private_subnets, 0, 2)

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  eks_managed_node_groups = {
    default = {
      ami_type       = "AL2_x86_64"
      desired_size   = 1
      instance_types = ["t3.medium"]
      max_size       = 1
      min_size       = 1
    }
  }
}
