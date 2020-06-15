# terraform-aws-sg

- ``` terraform-aws-sg ``` is a Terraform module to create aws security groups
- it's an opensource module under GPL license

## Usage
```


module "sg-wsc" {
  source  = "mehdi-wsc/sg-wsc/aws"
  version = "0.0.1"
  name = "sg_test"
  ingress_rules = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"

    }
  ]

  egress_rules = [
          {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "10.10.0.0/16"

    }

}


```

## Input Variables:

| name                      | description                                                                                       | type         | required |
|---------------------------|---------------------------------------------------------------------------------------------------|--------------|----------|
| name                      | Name of Security group                                                                            | string       | yes      |
| sg_description            | Description for security group                                                                    | string       | no       |
| vpc_id                    | Vpc id for security group,if it's not mentioned will launch default vpc                           | string       | no       |
| revoke                    | Enable Revoking option for security group , by default is false                                   | string       | no       |
| ingress_rules             | List of ingress rules                                                                             | list(map)    | no       |
| egress_rules              | List of egress                                                                                    | list(map)    | no       |
| tags                      | Tags of security groups                                                                           | map          | no       |


## Output Variables:

| name         | description          |
|--------------|----------------------|
| sg_id        | security group id    |
| sg_arn       | security group arn   |


## License:
```
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.
```
