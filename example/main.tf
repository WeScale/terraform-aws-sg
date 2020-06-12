provider "aws" {
  region = "eu-west-1"
}
module "sg" {
  source         = "../"
  name           = "first test"
  sg_description = " sg test"
  vpc_id         = "vpc-094669585248286af"
  tags           = {Name="sg test",Test ="it works"}
  ingress_rules = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"

    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "10.10.0.0/16"

    }
  ]
  egress_rules = [
          {
      description = "ssh"
      cidr_blocks = "10.10.0.0/16"

    }
  ]
}

output "sg" {
  value = module.sg.sg_id
}
output "arn" {
  value = module.sg.
}
