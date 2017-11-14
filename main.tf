data "aws_vpc" "kops" {
  filter {
    name   = "tag:Name"
    values = ["${var.dns_zone}"]
  }
}

data "aws_subnet_ids" "kops" {
  filter {
    name  = "Tag:Name"
    value = "${var.dns_zone}"
  }

  vpc_id = "${data.aws_vpc.kops.id}"
}
