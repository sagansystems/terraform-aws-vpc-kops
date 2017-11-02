output "k8s_vpc_id" {
  value = "${data.external.default.result.vpc_id}"
}

output "k8_nat_gateway" {
  value = "${data.external.default.aws_nat_gateway}"
}

output "vpc_id" {
  value = "${data.external.default.result.vpc_id}"
}
