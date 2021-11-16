### Setup docker compose stack

First we would need to setup our docker-compose.yml file, we will explain each part of it.

<pre class="file" data-filename="./docker-compose.yml" data-target="replace">
version: "3.2"

services:
  db:
    container_name: db
    image: percona:latest
    volumes:
      - ./db_data:/var/lib/mysql
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
      - ./my.cnf:/etc/my.cnf.d/my.cnf
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
      - ./apache_logs:/var/log/apache2/
    ports:
      - "8000:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: d2Oqadruj9*
      WORDPRESS_DB_NAME: wordpress

  elasticsearch:
    container_name: es
    image: "docker.elastic.co/elasticsearch/elasticsearch:7.15.1"
    volumes:
      - ./es_data:/usr/share/elasticsearch/data
      - ./elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro
    ports:
      - "9200:9200"
      - "9300:9300"
    environment:
      ELASTIC_PASSWORD: root
      ES_JAVA_OPTS: "-Xmx256m -Xms256m"
      discovery.type: single-node
    networks:
      - elk

  kibana:
    container_name: kb
    image: "docker.elastic.co/kibana/kibana:7.15.1"
    volumes:
      - ./kibana.yml:/usr/share/kibana/config/kibana.yml:ro
    ports:
      - "5601:5601"
    networks:
      - elk
    depends_on:
      - elasticsearch

  filebeat_db:
    container_name: fb_db
    image: "docker.elastic.co/beats/filebeat:7.15.1"
    volumes:
      - ./db_data:/var/logs/db_data:ro
      - ./filebeat_db.yml:/usr/share/filebeat/filebeat.yml:ro
    networks:
      - elk
    depends_on:
      - db

  filebeat_apache:
    container_name: fb_apache
    image: "docker.elastic.co/beats/filebeat:7.15.1"
    volumes:
      - ./apache_logs:/var/apache_logs:ro
      - ./filebeat_apache.yml:/usr/share/filebeat/filebeat.yml:ro
    networks:
      - elk
    depends_on:
      - db

networks:
  elk:
    driver: bridge

volumes:
  db_data: {}
  wordpress_data: {}
  es_data: {}
  apache_logs: {}
</pre>
