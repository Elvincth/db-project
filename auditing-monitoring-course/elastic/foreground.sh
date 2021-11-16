git clone https://github.com/Elvincth/docker-EFK.git
cd docker-EFK
mkdir db_data
mkdir wordpress_data
mkdir es_data
mkdir apache_logs
sudo chmod -R 777 .
docker-compose up -d