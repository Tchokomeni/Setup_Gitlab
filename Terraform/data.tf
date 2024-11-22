data "aws_vpc" "vpc_id" {
  filter {
    name   = "tag:env"
    values = ["test-tchoko"]
  }
}

data "aws_vpc" "selected" {
  #id = local.vpc_id
  id = data.aws_vpc.vpc_id.id
}



data "aws_subnets" "subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

}