output "env" {
  value = [
    {
      name  = "SQLSERVER_HOST"
      value = local.db_subdomain
    },
    {
      name  = "SQLSERVER_ENDPOINT"
      value = local.db_endpoint
    },
    {
      name  = "SQLSERVER_PORT"
      value = local.db_port
    },
    {
      name  = "SQLSERVER_USER"
      value = local.username
    },
    {
      name  = "SQLSERVER_DB"
      value = local.database_name
    }
  ]
}

output "secrets" {
  value = [
    {
      name  = "SQLSERVER_PASSWORD"
      value = random_password.this.result
    },
    {
      name  = "SQLSERVER_DSN"
      value = "Data Source=${local.db_endpoint};Initial Catalog=${local.database_name};User Id=${local.username};Password=${random_password.this.result};Encrypt=true"
    }
  ]
}
