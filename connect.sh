#!/bin/env bash

echo "Serving ssh server on port 1888"
wstunnel -c -t 1888:sshserver:2222 wss://$1:443