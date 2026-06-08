variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name (e.g., production, staging)"
  type        = string
  default     = "production"
}

# Website variables
variable "website_bucket_name" {
  description = "S3 bucket name for website content"
  type        = string
}

variable "cloudfront_price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
}

variable "website_domain_aliases" {
  description = "Custom domain aliases for CloudFront"
  type        = list(string)
  default     = []
}

variable "website_use_custom_ssl" {
  description = "Whether to use a custom SSL certificate for website"
  type        = bool
  default     = false
}

variable "website_acm_certificate_arn" {
  description = "ARN of ACM certificate for website custom domain"
  type        = string
  default     = null
}
