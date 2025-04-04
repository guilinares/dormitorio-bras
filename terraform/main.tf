terraform {
  required_version = ">= 0.12.24"

  backend "s3" {
    bucket = "rge-allocatorbackendtf"
    key = "path/to/state.tf"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
}

provider "random" {}