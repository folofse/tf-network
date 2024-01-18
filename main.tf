terraform {
  backend "s3" {
    bucket         = "folof-terraform-network-bucket"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "tf-lock-table"
    profile        = "backend"
  }
}

import {
  to = module.hosted_zones.aws_route53_record.brfleopold_se_ns
  id = "Z016306414B1XLEMVM0AT_brfleopold.se_NS"
}

import {
  to = module.hosted_zones.aws_route53_record.brfleopold_se_soa
  id = "Z016306414B1XLEMVM0AT_brfleopold.se_SOA"
}
