provider "aws" {
  region = "${var.aws_region}"
}

resource "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "${var.vpc_state_bucket}"
    key = "${var.vpc_state_key}"
    region = "${var.remote_state_bucket_region}"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id = "${terraform_remote_state.vpc.output.vpc_id}"
  service_name = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids = ["${aws_route_table.priv_rt.*.id}", "${terraform_remote_state.vpc.output.public_route_table_ids}"]
}

resource "aws_subnet" "pub_subnet" {
  count = "${var.count}"
  vpc_id = "${terraform_remote_state.vpc.output.vpc_id}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  availability_zone = "${element(split(",", var.az), count.index)}"
  cidr_block =  "${element(split(",", var.pub_subnet_cidr), count.index)}"
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

resource "aws_subnet" "priv_subnet" {
  count = "${var.count}"
  vpc_id = "${terraform_remote_state.vpc.output.vpc_id}"
  availability_zone = "${element(split(",", var.az), count.index)}"
  cidr_block =  "${element(split(",", var.priv_subnet_cidr), count.index)}"
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

resource "aws_route_table" "priv_rt" {
  count = "${var.count}"
  vpc_id = "${terraform_remote_state.vpc.output.vpc_id}"
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

resource "aws_route_table_association" "priv_rta" {
  count = "${var.count}"
  subnet_id = "${element(aws_subnet.priv_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.priv_rt.*.id, count.index)}"
}