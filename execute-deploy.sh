#!/bin/bash
#EC2 deploy 초기에 CodeDeploy 에이전트와 도커 설치를 위해 20초 대기
sleep 20s
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#docker-compose -f /home/ec2-user/app/docker-compose-ec2.yml rm -fs
docker system prune -a -f
docker-compose -f /home/ec2-user/app/docker-compose-ec2.yml -d up
sleep 10s