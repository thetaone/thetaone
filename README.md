# Theta One, LLC

Infrastructure and projects for Theta One business.

## Structure

```
thetaone/
├── main.tf              # Root Terraform - manages all infrastructure
├── variables.tf         # Global variables
├── outputs.tf           # Global outputs
├── terraform.tfvars     # Your configuration (git-ignored)
├── website/             # Public website (static site on CloudFront)
├── parmail/             # Email receiving service (SES + processing)
└── cqrs/                # Other projects
```

## Quick Start

All infrastructure is managed from the root directory:

```bash
# Copy example configuration
cp terraform.tfvars.example terraform.tfvars

# Edit with your settings
vim terraform.tfvars

# Initialize Terraform
terraform init

# Review planned changes
terraform plan

# Apply infrastructure
terraform apply
```

## Adding New Infrastructure

To add new resources (VMs, databases, etc.), create them directly in `main.tf` or as modules:

### Option 1: Direct in main.tf (for simple resources)
```hcl
# Add directly to main.tf
resource "aws_instance" "dev_server" {
  ami           = "ami-..."
  instance_type = "t3.small"
  tags = {
    Name = "Development Server"
  }
}
```

### Option 2: Create a module (for complex resources)
```bash
mkdir -p modules/compute
# Create module files...
```

Then reference in `main.tf`:
```hcl
module "compute" {
  source = "./modules/compute"
  # variables...
}
```

## Projects

### Website
Static website deployed to CloudFront + S3.
- **Source**: `website/`
- **URL**: Set via `website_domain_aliases` variable
- **Content**: HTML/CSS/JS files

### Parmail
Email receiving and processing service using AWS SES.
- **Source**: `parmail/`
- **Domain**: parmail.thetaone.io
- **Purpose**: Email collection and analysis

## DNS Management

DNS for thetaone.io is managed in the parmail project terraform (`parmail/terraform/domain.tf`).

Website DNS records can be added to point to CloudFront distribution after deployment.

## AWS Profile

All Terraform operations use the `thetaone` AWS profile configured in `~/.aws/credentials`.

## Common Operations

### Deploy website changes
```bash
terraform apply -target=module.website
```

### Add a new EC2 instance
Edit `main.tf` and add the resource, then:
```bash
terraform plan
terraform apply
```

### View all outputs
```bash
terraform output
```

## State Management

Terraform state is currently stored locally. Consider using S3 backend for team collaboration:

```hcl
terraform {
  backend "s3" {
    bucket  = "thetaone-terraform-state"
    key     = "infrastructure/terraform.tfstate"
    region  = "us-west-2"
    profile = "thetaone"
  }
}
```
