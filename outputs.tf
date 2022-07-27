output "env" {
  value = [
    {
      name  = "SQLSERVER_HOST"
      value = local.db_subdomain
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
      name  = "SQLSERVER_URL"
      value = "sqlserver://${urlencode(local.username)}:${urlencode(random_password.this.result)}@${local.db_endpoint}/${urlencode(local.database_name)}"
    }
  ]
}
