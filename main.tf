provider "aws" {
  region     = "ap-south-1"
}


terraform {
  backend "s3" {
    bucket = "yogi-tf"
    key    = "terraform-backend/yogitf.tf"
    region = "ap-south-1"
  }
}

module "vpc_creation" {
  source = "./vpc"
}

module "subnet_creation" {
source = "./subnets"
depends_on = ["module.vpc_creation"]
}

module "internet_gateway" {
source = "./internet-gateway"
depends_on = ["module.subnet_creation"]
}

module "route_creation" {
source = "./route-table"
depends_on = ["module.subnet_creation"]
}

module "iam_instance_profile" {
source = "./iam"
}
