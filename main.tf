data "aws_vpc" "kops" {
  filter {
    name   = "tag:Name"
    values = ["${var.dns_zone}"]
  }
}

data "aws_subnet_ids" "kops" {
  vpc_id = "${data.aws_vpc.kops.id}"
}
