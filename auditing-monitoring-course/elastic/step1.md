### Setup docker compose stack

Beforehand, we have set up the docker-compose.yml and configuration file for you.

Let's explore the `docker-compose.yml`

After clone the docker-compose.yml file, you need to click the “refresh tree” button to refresh the file. You can see there are few configurations file which show in the editor. Setting up and follow the content in those files.

## <b><u>In docker-compose.yml file </b></u>

### <b>Under the mysql container: </b>

<li>The mysql password is set as d2Oqadruj9* </li>
<li>The mysql ports is set as 13306</li>

There is a SQL statements in init.sql file, installing the MySQL audit pugin
Mounting the my init script (init.sql) to /docker-entrypoint-initdb.d/ folder , which would be auto-executed on startup by the following statement:

`./init.sql:/docker-entrypoint-initdb.d/init.sql`

Adding the following statement, create a custom configuration file (my.cnf) in the root folder that contains docker-compose.yml, with the following configs that will enable query logging on the database

`./my.cnf:/etc/my.cnf.d/my.cnf`

In the my.cnf file, which use for storing all log data and format it as. json

## <b>Under the wordpress container:</b>

<li>the wordpress is ports 8000</li>
Mounting the apache_logs to /var/log/apache2/ folder, which would record log data about events that process on the Apache web server. Passing the Apache logs to Filebeat then transfer to elastic. Startup by adding the following statement:

`./apache_logs:/var/log/apache2/`
