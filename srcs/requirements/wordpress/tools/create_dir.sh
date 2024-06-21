#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CLEAR='\033[0m'

echo -e "\n\n${GREEN}-------------${CLEAR} Creating directories ${GREEN}------------------------------${CLEAR}\n"

if [ ! -d "/home/lkavalia/data" ]; then
	echo -e "${GREEN}Creating:${CLEAR} /home/lkavalia/data"
        mkdir /home/lkavalia/data
else
	echo -e "${YELLOW}Directory /home/lkavalia/data already exists${CLEAR}"
fi

if [ ! -d "/home/lkavalia/data/mariadb" ]; then
	echo -e "${GREEN}Creating:${CLEAR} /home/lkavalia/data/mariadb"
        mkdir /home/lkavalia/data/mariadb
else
	echo -e "${YELLOW}Directory /home/lkavalia/data/mariadb already exists${CLEAR}"
fi


if [ ! -d "/home/lkavalia/data/wordpress" ]; then
	echo -e "${GREEN}Creating:${CLEAR} /home/lkavalia/data/wordpress"
        mkdir /home/lkavalia/data/wordpress
else
	echo -e "${YELLOW}Directory /home/lkavalia/wordpress already exists${CLEAR}"
fi

echo -e "\n${BLUE}-------------${CLEAR} Script create_dir.sh finished successfully ${BLUE}-------------${CLEAR}\n\n"
