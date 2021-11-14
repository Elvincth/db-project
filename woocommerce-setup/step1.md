#### 1. Setup your Wordpress and WooCommerce stack

Docker Compose is based on a docker-compose.yml file. This file defines all of the containers and settings you need to launch your set of clusters.

<pre class="file" data-filename="./docker-compose.yml" data-target="replace">
version: "3.2"

services:
  db:
    container_name: db
    image: percona:latest
    volumes:
      - ./db_data:/var/lib/mysql
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

volumes:
  db_data: {}
  wordpress_data: {}
</pre>

</br>

#### 2. Start the WordPress and MySql container in background

Run `docker-compose up -d`{{execute}}

</br>

#### 3. Check if both container is running

Run `docker ps`{{execute}}
</br>

#### 4. Check the logs of the both container to make sure there is no errors

Run `docker logs db`{{execute}}

Run `docker logs wordpress`{{execute}}

</br>

#### 5. Access your WordPress application at localhost:8000

You can access you WordPress in katacoda through https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com or click on the "WordPress" tab
