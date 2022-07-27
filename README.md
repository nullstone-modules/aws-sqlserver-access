# aws-sqlserver-access

Nullstone capability to grant access for a sql server database to a service.
This module only sets up the network access, user, access credentials, and the database must be setup manually at this time.

### Env Vars

- `SQLSERVER_HOST`
- `SQLSERVER_ENDPOINT`
- `SQLSERVER_PORT`

### Security Group Rules

- `tcp:1433` <=> `sqlserver` connection
