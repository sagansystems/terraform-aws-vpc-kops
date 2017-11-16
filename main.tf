data "aws_vpc" "kops" {
  filter {
    name   = "tag:Name"
    values = ["${var.dns_zone}"]
  }
}

data "aws_subnet_ids" "kops" {
  vpc_id = "${data.aws_vpc.kops.id}"
}

data "aws_security_group" "bastion" {
  vpc_id = "${data.aws_vpc.kops.id}"
  name   = "bastion.${var.dns_zone}"

  tags {
    Name              = "bastion.${var.dns_zone}"
    KubernetesCluster = "${var.dns_zone}"
  }
}

data "aws_security_group" "masters" {
  vpc_id = "${data.aws_vpc.kops.id}"
  name   = "masters.${var.dns_zone}"

  tags {
    Name              = "masters.${var.dns_zone}"
    KubernetesCluster = "${var.dns_zone}"
  }
}

data "aws_security_group" "nodes" {
  vpc_id = "${data.aws_vpc.kops.id}"
  name   = "nodes.${var.dns_zone}"

  tags {
    Name              = "nodes.${var.dns_zone}"
    KubernetesCluster = "${var.dns_zone}"
  }
}
