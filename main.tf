terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "thetaone"
}

# Website infrastructure (CloudFront + S3)
module "website" {
  source = "./modules/website"

  bucket_name  = var.website_bucket_name
  environment  = var.environment
  website_path = "${path.root}/website"
}

# Add more infrastructure modules as needed:
# module "compute" {
#   source = "./modules/compute"
# }
#
# module "networking" {
#   source = "./modules/networking"
# }
