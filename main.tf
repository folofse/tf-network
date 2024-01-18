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
  to = aws_route53_record.brfleopold_se_ns
  id = "Z016306414B1XLEMVM0AT_brfleopold.se_NS"
}
resource "aws_route53_record" "brfleopold_se_ns" {
  zone_id = "Z016306414B1XLEMVM0AT"
  name    = "brfleopold.se"
  type    = "NS"
  ttl     = 172800

  records = [
    "ns-1937.awsdns-50.co.uk.",
    "ns-684.awsdns-21.net.",
    "ns-57.awsdns-07.com.",
    "ns-1241.awsdns-27.org."
  ]
}

import {
  to = aws_route53_record.brfleopold_se_soa
  id = "Z016306414B1XLEMVM0AT_brfleopold.se_SOA"
}
resource "aws_route53_record" "brfleopold_se_soa" {
  zone_id = "Z016306414B1XLEMVM0AT"
  name    = "brfleopold.se"
  type    = "SOA"
  ttl     = 900

  records = [
    "ns-1937.awsdns-50.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400",
  ]
}