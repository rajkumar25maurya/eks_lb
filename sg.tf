resource "aws_security_group" "main" {
  name   = "Dev-Raj-genie-eks-access"
  vpc_id = data.aws_vpc.main.id
  tags = {
    "kubernetes.io/cluster/Raj-Dev" = "shared"
  }
}

resource "aws_security_group_rule" "allow_outbound_all" {
  security_group_id = aws_security_group.main.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_inbound_on_http_port" {
  security_group_id = aws_security_group.main.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_inbound_on_https_port" {
  security_group_id = aws_security_group.main.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
