output "vpc_id" {
  value = "${data.aws_vpc.kops.id}"
}

output "subnet_ids" {
  value = "${data.aws_subnet_ids.kops.ids}"
}

output "bastion_security_group_id" {
  value = "${data.aws_security_group.bastion.arn}"
}

output "masters_security_group_id" {
  value = "${data.aws_security_group.masters.arn}"
}

output "nodes_security_group_id" {
  value = "${data.aws_security_group.nodes.arn}"
}
