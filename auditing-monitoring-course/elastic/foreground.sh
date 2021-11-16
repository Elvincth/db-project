git clone https://github.com/Elvincth/docker-EFK.git
cd docker-EFK
mkdir db-data
sudo chown 999:999 ./db-data
docker-compose up -d