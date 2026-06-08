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

# ACM certificates for CloudFront must be in us-east-1
provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"
  profile = "thetaone"
}

# Route53 hosted zone for thetaone.io
resource "aws_route53_zone" "main" {
  name    = "thetaone.io"
  comment = "My business"
}

# Website infrastructure (CloudFront + S3)
module "website" {
  source = "./modules/website"

  bucket_name  = var.website_bucket_name
  environment  = var.environment
  website_path = "${path.root}/website"
  zone_id      = aws_route53_zone.main.zone_id
  domain_name  = "thetaone.io"

  providers = {
    aws.us_east_1 = aws.us_east_1
  }
}

# Add more infrastructure modules as needed:
# module "compute" {
#   source = "./modules/compute"
# }
#
# module "networking" {
#   source = "./modules/networking"
# }
