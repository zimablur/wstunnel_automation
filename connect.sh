#!/bin/env bash

echo "Serving ssh server on port 2222 and socks server on port 1080"
cd ~/node_modules/.bin
./wstunnel -c -t 1080:socksserver:1080 wss://$1:443