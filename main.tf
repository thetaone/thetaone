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
  source = "./website/terraform"

  bucket_name            = var.website_bucket_name
  environment            = var.environment
  cloudfront_price_class = var.cloudfront_price_class
  domain_aliases         = var.website_domain_aliases
  use_custom_ssl         = var.website_use_custom_ssl
  acm_certificate_arn    = var.website_acm_certificate_arn
  aws_region             = var.aws_region
}

# Parmail infrastructure (SES email service)
module "parmail" {
  source = "./parmail/terraform"

  # Add parmail-specific variables here as needed
}

# Add more infrastructure modules as needed:
# module "compute" {
#   source = "./modules/compute"
# }
#
# module "networking" {
#   source = "./modules/networking"
# }
