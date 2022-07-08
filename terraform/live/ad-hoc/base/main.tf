terraform {
  required_version = ">=1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      env                  = terraform.workspace
      shared_resources_env = terraform.workspace
      shared_resource      = "true"
    }
  }
}

module "main" {
  source          = "git::https://github.com/briancaffey/terraform-aws-django.git//modules/ad-hoc/base"
  certificate_arn = var.certificate_arn
  key_name        = var.key_name
  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
