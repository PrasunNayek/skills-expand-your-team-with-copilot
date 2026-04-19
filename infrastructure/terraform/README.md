# AWS VPC + EKS Terraform

This configuration provisions:

- A `/21` VPC CIDR block (`10.0.0.0/21` by default)
- Three subnet tiers across three AZs:
  - App (internal/private)
  - DB
  - Public
- One EKS cluster spanning two AZs (first two app subnets)
- One managed node (`t3.medium`)

## Usage

```bash
cd infrastructure/terraform
terraform init
terraform plan
terraform apply
```
