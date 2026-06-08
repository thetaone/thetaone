# Website outputs
output "website_cloudfront_url" {
  description = "CloudFront URL for the website"
  value       = module.website.cloudfront_url
}

output "website_cloudfront_distribution_id" {
  description = "CloudFront distribution ID for the website"
  value       = module.website.cloudfront_distribution_id
}

output "website_s3_bucket" {
  description = "S3 bucket name for website"
  value       = module.website.s3_bucket_name
}
