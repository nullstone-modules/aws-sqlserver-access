# aws-sqlserver-access

Nullstone capability to grant access for a sql server database to a service.

### Secrets

- `SQLSERVER_PASSWORD`
- `SQLSERVER_URL`

### Env Vars

- `SQLSERVER_USER`
- `SQLSERVER_DB`

### Security Group Rules

- `tcp:1433` <=> `sqlserver` connection
