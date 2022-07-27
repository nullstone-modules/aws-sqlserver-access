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
    }
    /*
    These are commented out because we haven't built the db-admin functionality for sql server yet
    So without the db-admin, these values aren't generated and granted access
    {
      name  = "SQLSERVER_USER"
      value = local.username
    },
    {
      name  = "SQLSERVER_DB"
      value = local.database_name
    }
    */
  ]
}

/*
These are commented out because we haven't built the db-admin functionality for sql server yet
So without the db-admin, these values aren't generated and granted access
output "secrets" {
  value = [
    {
      name  = "SQLSERVER_PASSWORD"
      value = random_password.this.result
    },
    {
      name  = "SQLSERVER_DSN"
      value = "Data Source=${local.db_endpoint};Initial Catalog=${urlencode(local.database_name)};User Id=${urlencode(local.username)};Password=${urlencode(random_password.this.result)};Encrypt=true"
    }
  ]
}
*/