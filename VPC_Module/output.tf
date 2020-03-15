output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_route_table_ids" {
  value = "${aws_route_table.pub_rt.id}"
}