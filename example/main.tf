provider "aws" {
  region = "eu-west-1"
}

module "sg" {
  source         = "mehdi-wsc/sg-wsc/aws"
  version        = "0.0.1"
  name           = "test"
  vpc_id         = "vpc-06733116ce9a073c7"
  sg_description = " test "
  ingress_rules = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"

    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"

    }
  ]
  egress_rules = [
    {
      cidr_blocks = "0.0.0.0/0"

    }
  ]
}
data "aws_ami" "wp" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-wordpress-4.7.3-1-linux-debian-8-x86_64-frontend-rds-nami-hvm-ebs"]

  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"]
}



resource "aws_instance" "web" {
  ami                         = data.aws_ami.wp.id
  instance_type               = "t2.micro"
  security_groups             = ["${module.sg.sg_id}"]
  subnet_id                   = "subnet-0e4f937c40f6ed4a5"
  associate_public_ip_address = true
  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF  
}
output "sg" {
  value = module.sg.sg_id
}
output "arn" {
  value = module.sg.sg_arn
}

output "web" {
  value = "http://${aws_instance.web.public_ip}:80"
}
