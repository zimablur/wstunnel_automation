#!/bin/env bash

asset_files_link="https://github.com/zimablur/wstunnel_offline_assets/archive/refs/heads/master.zip"
if ! [ -n "$1" ]; then
  asset_files_link=$1
fi

if ! [ -f wstunnel_offline_assets.zip ]; then
	curl -o wstunnel_offline_assets.zip $asset_files_link
fi

unzip wstunnel_offline_assets.zip
cd wstunnel_offline_assets-master

tar -xzvf termux_packages_android.tar.gz
tar -xzvf wstunnel_android.tar.gz

cd termux_packages_android
yes N | dpkg -i *.deb

cd ../wstunnel
mv node_modules ~/
termux-fix-shebang ~/node_modules/.bin/wstunnel