terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Example: VPC (placeholder)
# resource "aws_vpc" "main" {
#  cidr_block = var.vpc_cidr
# tags = { Name = "${var.project_name}-vpc" }
# }
