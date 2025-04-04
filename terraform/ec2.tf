terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

resource "random_pet" "sg" {}

resource "aws_vpc_ipv4_cidr_block_association" "awsec2app" {
  vpc_id = var.aws_vpc_id
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "awsec2app" {
  vpc_id = var.aws_vpc_id
  cidr_block = "172.31.32.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-app"
  }
}

resource "aws_route_table" "app_route_table" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws_igw_id
  }

  tags = {
    Name = "app-route-table"
  }
}

resource "aws_route_table_association" "app_route_assoc" {
  subnet_id      = aws_subnet.awsec2app.id
  route_table_id = aws_route_table.app_route_table.id
}

resource "aws_eip" "app_eip" {
  domain = "vpc"
}

resource "aws_network_interface" "awsec2app" {
  subnet_id = aws_subnet.awsec2app.id
  private_ips = ["172.16.10.100"]
  security_groups = [aws_security_group.awsec2app.id]
  tags = {
    Name = "eni-app"
  }
}

resource "aws_eip_association" "app_eip_assoc" {
  allocation_id        = aws_eip.app_eip.id
  network_interface_id = aws_network_interface.awsec2app.id

  depends_on = [aws_instance.awsec2app]
}

resource "aws_security_group" "awsec2app" {
  name = "${random_pet.sg.id}-sg"
  vpc_id = var.aws_vpc_id
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 4200
    to_port = 4200
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Permite qualquer protocolo
    cidr_blocks = ["0.0.0.0/0"] # Acesso total à internet
  }
}

data "template_file" "user_data" {
  template = file("setup.sh.tpl")

  vars = {
    db_user = var.db_user
    db_pass = var.db_pass
    db_name = var.db_name
  }
}

resource "aws_instance" "awsec2app" {
  ami = "ami-092cd6a84ad570057"
  instance_type = var.instance_type
  user_data = data.template_file.user_data.rendered
  key_name      = var.key_name # Substitua pelo nome da sua chave SSH
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  availability_zone      = "sa-east-1a"

  tags = {
    Name = "app-instance"
  }

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.awsec2app.id
  }
}