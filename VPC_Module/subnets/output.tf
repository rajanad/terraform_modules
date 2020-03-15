output "public_subnets" {
  value = "${join(",", aws_subnet.pub_subnet.*.id)}"
}

output "public_subnet_cidrs" {
  value = "${join(",", aws_subnet.pub_subnet.*.cidr_block)}"
}

output "private_subnets" {
  value = "${join(",", aws_subnet.priv_subnet.*.id)}"
}

output "private_subnet_cidrs" {
  value = "${join(",", aws_subnet.priv_subnet.*.cidr_block)}"
}

output "private_route_table_ids" {
  value = "${join(",", aws_route_table.priv_rt.*.id)}"
}

output "public_route_table_ids" {
  value = "${terraform_remote_state.vpc.output.public_route_table_ids}"
}

output "azs" {
  value = "${join(",", aws_subnet.priv_subnet.*.availability_zone)}"
}

output "vpc_id" {
  value = "${terraform_remote_state.vpc.output.vpc_id}"
}