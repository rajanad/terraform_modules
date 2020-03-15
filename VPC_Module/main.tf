provider "aws" {
  region = "${var.aws_region}"
}

resource "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "amitteststatefile"#"${var.vpc_state_bucket}"
    key = "vpc/"#"${var.vpc_state_key}"
    region = "us-west-2"#"${var.remote_state_bucket_region}"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  tags {
    Name = "${var.Name}"
    App = "${var.app}"
    app_owner = "${var.app_owner}"
    contact = "${var.contact}"
    cost_center = "${var.cost_center}"
    creator = "${var.creator}"
    customer = "${var.customer}"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.Name}"
    App = "${var.app}"
    app_owner = "${var.app_owner}"
    contact = "${var.contact}"
    cost_center = "${var.cost_center}"
    creator = "${var.creator}"
    customer = "${var.customer}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.Name}"
    App = "${var.app}"
    app_owner = "${var.app_owner}"
    contact = "${var.contact}"
    cost_center = "${var.cost_center}"
    creator = "${var.creator}"
    customer = "${var.customer}"
    environment = "${var.environment}"
  }
}

resource "aws_route" "pub_subnet_internet_gateway" {
  route_table_id = "${aws_route_table.pub_rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw.id}"
  depends_on = ["aws_route_table.pub_rt", "aws_internet_gateway.igw"]
}

resource "aws_main_route_table_association" "mrta" {
  vpc_id = "${aws_vpc.vpc.id}"
  route_table_id = "${aws_route_table.pub_rt.id}"
}