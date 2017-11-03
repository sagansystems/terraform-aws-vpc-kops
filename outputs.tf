output "k8s_vpc_id" {
  value = "${data.external.default.result.vpc_id}"
}

output "k8s_nat_gateway_public_ips" {
  value = "${data.external.default.aws_nat_gateway.*.public_ip}"
}

output "k8s_subnet_ids" {
  value = "${data.aws_subnet_ids.k8s.ids}"
}
