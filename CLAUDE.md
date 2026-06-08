# Theta One Project Instructions

## GitHub Account

**IMPORTANT**: All GitHub operations for this project MUST use the `chb0github` account, NOT `christianBongiorno-fd`.

Before any git operations:
```bash
gh auth switch --user chb0github
```

Repository: https://github.com/chb0github/thetaone

## AWS Profile

All AWS/Terraform operations use the `thetaone` profile.

## Project Structure

- `website/` - Downloaded thetaone.io website (WordPress/GoDaddy)
- `parmail/` - Email receiving service (SES + processing)
- `cqrs/` - Other projects
- Root-level Terraform for centralized infrastructure management

## Adding Infrastructure

Add new infrastructure directly to root `main.tf` or as modules. All Terraform should be run from the root directory to maintain centralized management.
