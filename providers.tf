terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket       = "upwork-terraform"
    key          = "aws-iam/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
  }
}