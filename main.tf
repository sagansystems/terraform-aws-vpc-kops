data "external" "kops_state" {
  program = ["python", "${path.module}/get_kops_state.py"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    cluster = "${var.cluster}"
  }
}

data "aws_subnet_ids" "kops" {
  vpc_id = "${data.external.kops_state.result.vpc_id}"
}
