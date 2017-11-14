output "vpc_id" {
  value = "${data.aws_vpc.kops.id}"
}

output "subnet_ids" {
  value = "${data.aws_subnet_ids.kops.ids}"
}
