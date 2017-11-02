data "external" "default" {
  program = ["python", "${path.module}/get_kops_state.py"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    cluster = "${var.cluster}"
  }
}

data "aws_subnet_ids" "k8s" {
  vpc_id = "${data.external.default.result.vpc_id}"
}

resource "aws_route" "k8s" {
  count                     = "${length(distinct(sort(data.aws_route_table.k8s.*.route_table_id)))}"
  route_table_id            = "${element(distinct(sort(data.aws_route_table.k8s.*.route_table_id)), count.index)}"
  destination_cidr_block    = "${data.aws_vpc_peering_connection.default.cidr_block}"
  vpc_peering_connection_id = "${data.aws_vpc_peering_connection.default.id}"
}

data "aws_route_table" "k8s" {
  count     = "${length(distinct(sort(data.aws_subnet_ids.k8s.ids)))}"
  subnet_id = "${element(distinct(sort(data.aws_subnet_ids.k8s.ids)), count.index)}"
}

data "aws_vpc_peering_connection" "default" {
  vpc_id = "${var.backing_services_vpc_id}"
}

data "aws_nat_gateway" "k8" {
  count     = "${length(distinct(sort(data.aws_subnet_ids.k8s.ids)))}"
  subnet_id = "${element(distinct(sort(data.aws_subnet_ids.k8s.ids)), count.index)}"
}