resource "aws_efs_file_system" "main" {
  creation_token = var.efs_token
  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "example" {
  count           = length(data.aws_subnets.main.ids)
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = data.aws_subnets.main.ids[count.index]
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_security_group" "efs_sg" {
  name        = var.efs_sg
  description = "EFS security group"

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

