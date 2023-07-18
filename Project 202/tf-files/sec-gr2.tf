resource "aws_security_group" "alb_sg" {
  name        = "ALBSecurityGroup"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }

  tags = {
    Name = "TF_ALBSecurityGroup"
  }
}

resource "aws_security_group" "server_sg" {
  name        = "ServerSecurityGroup"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }

  tags = {
    Name = "TF_ServerSecurityGroup"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "DBSecurityGroup"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }

  tags = {
    Name = "TF_DBSecurityGroup"
  }
}
