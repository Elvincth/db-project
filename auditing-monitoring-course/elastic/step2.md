## What is Kibana?

Kibana is a free and open frontend application that sits on top of the Elastic Stack, providing data visualization and discovery tool for search, observe, and protect. From discovering documents to analyzing logs to finding security vulnerabilities. Also, offers easy-to-use features such as histograms, line graphs, pie charts, heat maps.

## Under the elasticsearch container:

Mounting the elasticsearch.yml to /usr/share/elasticsearch/config/elasticsearch.yml (Note: kibana does not need a volume as it uses elasticsearch to persist its data) and set for read only, statement is below:
`-./elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro`{{execute}}

Set heap size as 256mb, use single-node discovery to disable production mode and evade bootstrap checks:

environment:
<br>ELASTIC_PASSWORD: root</br>
ES_JAVA_OPTS: "-Xmx256m -Xms256m"

discovery.type: single-node

## Under the kibana container:

kibana container is used to start kibana and the UI for elasticsearch. Mapping the port 5601 in the container to port 5601 on the Docker host, so I can access the kibana in localhost:5601
ports:

- "5601:5601"
  Under the filebeat_db container:
  This container is used to start filebeat, which is used to ship the log file from mysql percona to elasticsearch.
  <br></br>

## Under the filebeat_apache container:

filebeat_apache container is used to ship the apache.

## Under the Network bridge:

Used to bridge the network between elasticsearch, kibana and filebeat. So that they could exchange data and be accessible.
<br></br>

## In elasticsearch.yml file

It is a configuration file for Elasticsearch
<br></br>

## In kibana.yml file<

It is a configuration file for kibana
