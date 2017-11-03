data "external" "default" {
  program = ["python", "${path.module}/get_kops_state.py"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    cluster = "${var.cluster}"
  }
}

data "aws_subnet_ids" "k8s" {
  vpc_id = "vpc-42fbfe3b"  
  #  vpc_id = "${data.external.default.result.vpc_id}"
}

data "aws_route_table" "k8s" {
  count     = "${length(distinct(sort(data.aws_subnet_ids.k8s.ids)))}"
  subnet_id = "${element(distinct(sort(data.aws_subnet_ids.k8s.ids)), count.index)}"
}

data "aws_nat_gateway" "k8s" {
  count     = "${length(distinct(sort(data.aws_subnet_ids.k8s.ids)))}"
  subnet_id = "${element(distinct(sort(data.aws_subnet_ids.k8s.ids)), count.index)}"
}


