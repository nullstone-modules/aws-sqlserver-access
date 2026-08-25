variable "app_metadata" {
  description = <<EOF
Nullstone automatically injects metadata from the app module into this module through this variable.
This variable is a reserved variable for capabilities.
EOF

  type    = map(string)
  default = {}
}

variable "database_name" {
  type        = string
  description = <<EOF
Name of database to create in Sql Server. If left blank, uses app name.
The following identifiers are supported for interpolation:
  {{ NULLSTONE_STACK }}
  {{ NULLSTONE_BLOCK }}
  {{ NULLSTONE_ENV }}
EOF
  default     = ""
}

// We are using ns_env_variables to interpolate database_name
data "ns_env_variables" "db_name" {
  input_env_variables = tomap({
    NULLSTONE_STACK = local.stack_name
    NULLSTONE_BLOCK = local.block_name
    NULLSTONE_APP   = local.block_name
    NULLSTONE_ENV   = local.env_name
    DATABASE_NAME   = coalesce(var.database_name, local.block_name)
  })
  input_secrets = tomap({})
}

variable "trust_server_certificate" {
  type        = bool
  default     = false
  description = "Enables 'TrustServerCertificate' in the connection string DSN"
}

variable "persist_security_info" {
  type        = bool
  default     = false
  description = "Enables 'Persist Security Info' in the connection string DSN"
}

locals {
  security_group_id = var.app_metadata["security_group_id"]
  username          = local.resource_name
  database_name     = data.ns_env_variables.db_name.env_variables["DATABASE_NAME"]

  extra_dsn = join("", compact([
    var.trust_server_certificate ? ";TrustServerCertificate=True" : "",
    var.persist_security_info ? ";Persist Security Info=True" : "",
  ]))
}
