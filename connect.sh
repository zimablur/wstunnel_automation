#!/bin/env bash

echo "Serving ssh server on port 1888"
cd node_modules/.bin
./wstunnel -c -t 1888:sshserver:2222 wss://$1:443