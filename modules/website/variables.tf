variable "bucket_name" {
  description = "S3 bucket name for website content"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "website_path" {
  description = "Path to website files"
  type        = string
}

variable "zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
}
