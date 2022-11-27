#!/bin/env bash

result_dir=$(pwd)/commands_output

echo "Serving ssh server on port 2222 and socks server on port 1080" >> $result_dir/stdout
cd ~/node_modules/.bin
./wstunnel -c -t 1080:socksserver:1080 wss://$1:443 2>&1 | tee $result_dir/stdout