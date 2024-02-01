#!/bin/bash
dt=`date +%Y%m%d.%H%M%S`
echo $dt
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 716531470317.dkr.ecr.us-east-1.amazonaws.com
docker tag gh-queryserver 716531470317.dkr.ecr.us-east-1.amazonaws.com/gh-queryserver:latest 
docker tag gh-queryserver 716531470317.dkr.ecr.us-east-1.amazonaws.com/gh-queryserver:$dt
docker push 716531470317.dkr.ecr.us-east-1.amazonaws.com/gh-queryserver:latest
docker push 716531470317.dkr.ecr.us-east-1.amazonaws.com/gh-queryserver:$dt
