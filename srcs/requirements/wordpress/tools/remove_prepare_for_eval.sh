#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

echo -e "\n\n${GREEN}-------------${CLEAR} Eval has started {GOOD LUCK} ${GREEN}------------------------------${CLEAR}\n"

docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker rmi -f $(docker images -qa)
docker volume rm $(docker volume ls -q) 
docker network rm $(docker network ls -q) 2>/dev/null
