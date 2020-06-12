
resource "aws_security_group" "sg" {
  name        = var.name
  description = var.sg_description
  vpc_id      = var.vpc_id
  revoke_rules_on_delete = var.revoke
  tags = var.tags
}
resource "aws_security_group_rule" "ingress" {
  count             = var.create ? length(var.ingress_rules) : 0
  type              = "ingress"
  cidr_blocks       = split(",", lookup(var.ingress_rules[count.index], "cidr_blocks", "-"), )
  protocol          = lookup(var.ingress_rules[count.index], "protocol", "")
  from_port         = lookup(var.ingress_rules[count.index], "from_port", "-")
  to_port           = lookup(var.ingress_rules[count.index], "to_port", "-")
  description       = lookup(var.ingress_rules[count.index], "description", "-")
  security_group_id = aws_security_group.sg.id
}


resource "aws_security_group_rule" "egress" {
  count             = var.create ? length(var.egress_rules) : 0
  type              = "egress"
  cidr_blocks       = split(",", lookup(var.egress_rules[count.index], "cidr_blocks", "0.0.0.0/32"), )
  protocol          = lookup(var.egress_rules[count.index], "protocol", "-1")
  from_port         = lookup(var.egress_rules[count.index], "from_port", "0")
  to_port           = lookup(var.egress_rules[count.index], "to_port", "0")
  description       = lookup(var.egress_rules[count.index], "description", "Egress Rule")
  security_group_id = aws_security_group.sg.id
}