#!/bin/env bash

while getopts m:a:l: flag
do
    case "${flag}" in
        m) mode=${OPTARG};;
        a) server_addr=${OPTARG};;
        l) automation_files_link=${OPTARG};;
        s) asset_files_link=${OPTARG};;
    esac
done

if ! [ -n "$mode" ]; then
  mode="offline"
fi

if ! [ -n "$automation_files_link" ]; then
  automation_files_link="https://github.com/zimablur/wstunnel_automation/archive/refs/heads/master.zip"
fi

if ! [ -n "$asset_files_link" ]; then
  asset_files_link="https://github.com/zimablur/wstunnel_offline_assets/archive/refs/heads/master.zip"
fi

if [ "$mode" != "online" ] && [ "$mode" != "offline" ]; then
  echo "Invalid mode \"$mode\"! It should either be \"offline\" or \"online\""
  exit 1;
fi

if ! [ -f wstunnel_automation.zip ]; then
  echo "downloading automation files from $automation_files_link"
  curl -L -o wstunnel_automation.zip $automation_files_link
fi

unzip -o wstunnel_automation.zip
cd wstunnel_automation-master
./install_$mode.sh $asset_files_link
cp connect.sh ~/

if [ -n "$server_addr" ]; then
  ~/connect.sh $server_addr
fi