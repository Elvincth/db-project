git clone https://github.com/Elvincth/docker-EFK.git
cd docker-EFK
mkdir db_data
mkdir es_data
sudo chown 999:999 ./db_data
sudo chown -R 1000:1000 ./es_data
docker-compose up -d