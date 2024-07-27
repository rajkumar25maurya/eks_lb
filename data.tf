data "aws_vpc" "main" {
  id = "vpc-328aef59"
}

data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

