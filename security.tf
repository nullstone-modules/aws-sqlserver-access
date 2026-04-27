resource "aws_security_group_rule" "app-to-datastore" {
  security_group_id        = local.security_group_id
  description              = "Allow access to database ${local.db_endpoint}"
  type                     = "egress"
  from_port                = local.db_port
  to_port                  = local.db_port
  protocol                 = "tcp"
  source_security_group_id = local.db_security_group_id

  count = local.db_security_group_id == "" ? 0 : 1
}

resource "aws_security_group_rule" "app-to-unspecified-datastore" {
  security_group_id = local.security_group_id
  description       = "Allow access to database ${local.db_endpoint}"
  type              = "egress"
  from_port         = local.db_port
  to_port           = local.db_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "datastore-from-app" {
  security_group_id        = local.db_security_group_id
  description              = "Allow ${local.block_name} to access database"
  type                     = "ingress"
  from_port                = local.db_port
  to_port                  = local.db_port
  protocol                 = "tcp"
  source_security_group_id = local.security_group_id

  count = local.db_security_group_id == "" ? 0 : 1
}
