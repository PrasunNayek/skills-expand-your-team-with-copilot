variable "aws_region" {
  description = "AWS region used for all resources."
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "Availability zones used for subnet placement."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "eks_cluster_version" {
  description = "EKS cluster Kubernetes version."
  type        = string
  default     = "1.30"
}

variable "name" {
  description = "Base name prefix for provisioned resources."
  type        = string
  default     = "skills"
}

variable "vpc_cidr" {
  description = "VPC CIDR block."
  type        = string
  default     = "10.0.0.0/21"
}
