resource "aws_lambda_invocation" "database" {
  function_name   = local.db_admin_func_name
  lifecycle_scope = "CRUD"

  input = jsonencode({
    type = "databases"
    data = {
      name        = local.database_name
      useExisting = true
    }
  })
}

resource "aws_lambda_invocation" "login" {
  function_name   = local.db_admin_func_name
  lifecycle_scope = "CRUD"

  input = jsonencode({
    type = "logins"
    data = {
      name        = local.username
      password    = random_password.this.result
      useExisting = true
    }
  })
}

resource "aws_lambda_invocation" "access" {
  function_name   = local.db_admin_func_name
  lifecycle_scope = "CRUD"

  input = jsonencode({
    type = "database_access"
    data = {
      database = local.database_name
      login    = local.username
    }
  })

  depends_on = [
    aws_lambda_invocation.database,
    aws_lambda_invocation.login,
  ]
}
