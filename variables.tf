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
  description = "Name of database to create in Sql Server. If left blank, uses app name."
  default     = ""
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
  database_name     = coalesce(var.database_name, local.block_name)

  extra_dsn = join("", compact([
    var.trust_server_certificate ? ";TrustServerCertificate=False" : "",
    var.persist_security_info ? ";Persist Security Info=True" : "",
  ]))
}
