#!/bin/bash
#EC2 deploy 초기에 CodeDeploy 에이전트와 도커 설치를 위해 20초 대기
sleep 20s
docker-compose -f /home/ec2-user/app/docker-compose-ec2.yml rm -fs
docker system prune -a -f
docker-compose -f /home/ec2-user/app/docker-compose-ec2.yml up -d