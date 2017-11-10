output "vpc_id" {
  value = "${data.external.kops_state.result.vpc_id}"
}

output "subnet_ids" {
  value = "${data.aws_subnet_ids.kops.ids}"
}
