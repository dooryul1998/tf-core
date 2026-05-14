resource "aws_security_group" "this" {
  name   = "${var.namespace}-sg-instance-${local.instance.name}"
  vpc_id = var.instance_vpc_id

  ingress {
    from_port   = local.instance.allow_access.port
    to_port     = local.instance.allow_access.port
    protocol    = "tcp"
    cidr_blocks = local.instance.allow_access.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-sg-instance-${local.instance.name}"
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = local.instance.instance_type

  subnet_id                   = var.instance_subnet_id
  associate_public_ip_address = true

  iam_instance_profile = var.instance_iam_instance_profile

  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = "${var.namespace}-instance-${local.instance.name}"
  }
}