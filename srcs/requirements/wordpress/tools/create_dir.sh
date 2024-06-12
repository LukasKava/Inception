#!/bin/bash

if [ ! -d "/home/lkavalia/data" ]; then
        mkdir /home/lkavalia/data
fi

if [ ! -d "/home/lkavalia/data/mariadb" ]; then
        mkdir /home/lkavalia/data/mariadb
fi

if [ ! -d "/home/lkavalia/data/wordpress" ]; then
        mkdir /home/lkavalia/data/wordpress
fi