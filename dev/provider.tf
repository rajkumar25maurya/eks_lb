terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.8.0"

}

provider "aws" {
  region = "us-east-2"

}

