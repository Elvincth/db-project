# Step 1

## Basic Set up 
### Before starting this scenarios, we should set up the docker compose file (docker-compose.yml):
    
    version: "3.2"

    services:
    db:
        container_name: db
        image: percona:latest
        volumes:
        - ./db_data:/var/lib/mysql
        - ./init.sql:/docker-entrypoint-initdb.d/init.sql

        ports:
        - "13306:3306"
        environment:
        MYSQL_ROOT_PASSWORD: d2Oqadruj9*
        MYSQL_DATABASE: wordpress
        MYSQL_USER: wordpress
        MYSQL_PASSWORD: d2Oqadruj9*

    wordpress:
        container_name: wordpress
        depends_on:
        - db
        image: wordpress:latest
        volumes:
        - ./wordpress_data:/var/www/html
        ports:
        - "8000:80"
        restart: always
        environment:
        WORDPRESS_DB_HOST: db:3306
        WORDPRESS_DB_USER: wordpress
        WORDPRESS_DB_PASSWORD: d2Oqadruj9*
        WORDPRESS_DB_NAME: wordpress

    grafana:
        image: grafana/grafana
        ports:
        - "3000:3000"
        volumes: 
        - ./grafana_data:/var/lib/grafana
        - ./config/grafana.ini:/etc/grafana/grafana.ini

    volumes:
    db_data: {}
    wordpress_data: {}


### Then, we need to create init.sql:
    CREATE USER 'db18'@'%' IDENTIFIED BY 'd2Oqadruj9*'; 
    GRANT ALL PRIVILEGES ON *.* TO 'db18'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;

### Next, create a general log (my.cnf):
    [mysqld]
    log_output = table
    general_log = 1

## Set up for wordpress

Download plusin for restoring all sample data 
