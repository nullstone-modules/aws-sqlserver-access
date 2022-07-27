data "ns_connection" "sqlserver" {
  name     = "sqlserver"
  type     = "sqlserver/aws"
  contract = "datastore/aws/sqlserver:*"
}

locals {
  db_endpoint          = data.ns_connection.sqlserver.outputs.db_endpoint
  db_subdomain         = split(":", local.db_endpoint)[0]
  db_port              = split(":", local.db_endpoint)[1]
  db_security_group_id = data.ns_connection.sqlserver.outputs.db_security_group_id
  db_admin_func_name   = data.ns_connection.sqlserver.outputs.db_admin_function_name
}
