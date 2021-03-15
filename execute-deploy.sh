#!/bin/bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -f /home/e2-user/app/docker-compose-ec2.yml rm -fs
docker system prune -a -f
docker-compose -f /home/e2-user/app/docker-compose-ec2 up