## Pre-requisites
Ubuntu system
Docker
Docker Compose
Git

### Run the following commands to update packages and install Docker and Docker Compose
sudo apt update
sudo apt install docker.io -y
sudo apt install docker-compose -y

### Pull the required Docker images for the CSV server and Prometheus:
docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.45.2

### Clone the CSV server repository
git clone https://github.com/infracloudio/csvserver.git

cd server
cd solution
docker run -d --name csvserver infracloudio/csvserver:latest
docker logs csvserver
### Generate Input File using gencsv.sh
sudo nano gencsv.sh ( put the content which is in the gencsv.sh file) 
chmod +x gencsv.sh
./gencsv.sh 2 8

 ### Run CSV Server with Input File
docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputFile infracloudio/csvserver:latest

### Run CSV Server with Environment Variable
docker run -d --name csvserver -p 9393:9300 -v $(pwd)/inputdata:/csvserver/inputdata -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
ls
curl -o ./part-1-output http://localhost:9393/raw
docker logs [container_id] >& part-1-logs
ls
README.md  gencsv.sh  inputFile  part-1-cmd  part-1-logs  part-1-output

http://localhost:9393

![image](https://github.com/user-attachments/assets/3a18cf70-c43e-4592-9580-7729fb277383)

## create docker-compose.yaml file 
(Put the content in docker-compose.yaml file)
 docker-compose down  # Stop any running containers
 docker-compose up -d --build  # Rebuild and restart the containers with the updated configuration

 ## create prometheus.yml file and also update in docker-compose.yaml file
 (Put the updated content in docker-compose.yaml file includes prometheus)
 docker-compose down  # Stop any running containers
 docker-compose up -d --build  # Rebuild and restart the containers with the updated configuration

 http://localhost:9090

 ## Prometheus output image
 
![image](https://github.com/user-attachments/assets/374be727-919e-4fb9-a2a9-12a230c28978)

