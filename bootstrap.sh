#!/bin/env bash

curl -L -o wstunnel_automation.zip https://github.com/zimablur/wstunnel_automation/archive/refs/heads/master.zip
unzip wstunnel_automation.zip
cd wstunnel_automation-master
./install_online.sh

if [ "$1" ]; then
  ./connect.sh $1
else