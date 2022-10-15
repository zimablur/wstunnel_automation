#!/bin/env bash

while getopts m:s: flag
do
    case "${flag}" in
        m) mode=${OPTARG};;
        s) server=${OPTARG};;
    esac
done

if ! [ -n "$mode" ]; then
  mode="offline"
fi

if [ "$mode" != "online" ] && [ "$mode" != "offline" ]; then
  echo "Invalid mode \"$mode\"! It should either be \"offline\" or \"online\""
  exit 1;
fi

curl -L -o wstunnel_automation.zip https://github.com/zimablur/wstunnel_automation/archive/refs/heads/master.zip
unzip wstunnel_automation.zip
cd wstunnel_automation-master
./install_$mode.sh

if [ -n "$server" ]; then
  ./connect.sh $server
fi